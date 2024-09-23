@implementation SGEKEventConversions

+ (id)urlForEKEventFromMailMessageWithId:(id)a3 sentAt:(id)a4 opaqueKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEKEventConversions.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sentAt"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEKEventConversions.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueKey"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEKEventConversions.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageId"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setScheme:", CFSTR("message"));
  objc_msgSend(v12, "setPath:", v9);
  v13 = (void *)MEMORY[0x1E0CB39D8];
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v10, "timeIntervalSince1970");
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%lu"), (uint64_t)v15);
  objc_msgSend(v13, "queryItemWithName:value:", CFSTR("c"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("k"), v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQueryItems:", v19);

  objc_msgSend(v12, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)urlForMailMessageWithId:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEKEventConversions.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageId"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setScheme:", CFSTR("message"));
  objc_msgSend(v6, "setPath:", v5);
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)urlForEKEventFromTextMessageWithUniqueIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEKEventConversions.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageId"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setScheme:", CFSTR("sms"));
  objc_msgSend(v6, "setHost:", CFSTR("open"));
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("message-guid"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryItems:", v8);

  objc_msgSend(v6, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
