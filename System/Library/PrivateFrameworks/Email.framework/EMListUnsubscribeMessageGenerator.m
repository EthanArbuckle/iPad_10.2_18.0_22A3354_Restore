@implementation EMListUnsubscribeMessageGenerator

+ (id)messageHeadersWithCommand:(id)a3 headersFactory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMListUnsubscribeMessageGenerator.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("command"));

  }
  objc_msgSend(v8, "mutableMessageHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeader:forKey:", CFSTR("auto-replied"), *MEMORY[0x1E0D1E510]);
  objc_msgSend(v9, "setHeader:forKey:", CFSTR("true"), *MEMORY[0x1E0D1E610]);
  objc_msgSend(v7, "mailtoValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMListUnsubscribeMessageGenerator.m"), 26, CFSTR("Mailto value are missing"));

  }
  objc_msgSend(v10, "subject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E70F6E90;
  objc_msgSend(v9, "setHeader:forKey:", v13, *MEMORY[0x1E0D1E5F8]);

  objc_msgSend(v10, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAddressListForTo:", v15);

  objc_msgSend(a1, "senderForCommand:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAddressListForSender:", v17);

  objc_msgSend(a1, "dateString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeader:forKey:", v18, *MEMORY[0x1E0D1E560]);

  return v9;
}

+ (id)localizedBodyForCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  _EFLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailtoValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)senderForCommand:(id)a3
{
  id v5;

  v5 = a3;
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[EMListUnsubscribeMessageGenerator senderForCommand:]", "EMListUnsubscribeMessageGenerator.m", 43, "0");
}

+ (id)dateString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ec_descriptionForMimeHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
