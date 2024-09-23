@implementation CNUIUserActionURLItem

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "targetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "targetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isString:localizedCaseInsensitiveEqualToOther:", v3, v4);

  return v5;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "targetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __30___CNUIUserActionURLItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __34___CNUIUserActionURLItem_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

id __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = a2;
  v4 = *MEMORY[0x1E0D13848];
  objc_msgSend(*(id *)(a1 + 32), "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isOriginatingFromFavorites") & 1) == 0)
      goto LABEL_19;
LABEL_14:
    v6 = (void *)objc_msgSend(objc_alloc(getTUDialRequestClass_0()), "initWithURL:", v3);
    goto LABEL_15;
  }
  v6 = (void *)objc_msgSend(objc_alloc(getTUDialRequestClass_0()), "initWithURL:", v3);
  objc_msgSend(v6, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTelephonyProvider");

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(*(id *)(a1 + 32), "channelIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
    objc_msgSend(v6, "setLocalSenderIdentityAccountUUID:", v11);

    objc_msgSend(v6, "URL");
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v12;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  objc_msgSend(v13, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("sms")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("imessage")))
  {
    objc_msgSend(v13, "queryItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_filter:", &__block_literal_global_10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v20 = v19;

    objc_msgSend(*(id *)(a1 + 32), "channelIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAddingPercentEncodingWithAllowedCharacters:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("simid"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setQueryItems:", v25);

    objc_msgSend(v13, "URL");
    v26 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v26;
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isOriginatingFromFavorites") & 1) == 0)
    goto LABEL_17;
  if (!v6)
    goto LABEL_14;
LABEL_15:
  objc_msgSend(v6, "provider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isFaceTimeProvider");

  if (v28)
    objc_msgSend(v6, "setOriginatingUIType:", 9);
LABEL_17:
  if (v6)
  {
    objc_msgSend(v6, "URL");
    v29 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v29;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "urlOpener");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(*(id *)(a1 + 40), "isSensitive");
  objc_msgSend(*(id *)(a1 + 32), "connectionEndpoint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B68], "globalAsyncScheduler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "openURL:isSensitive:connectionEndpoint:withScheduler:", v3, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

uint64_t __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("simid")) ^ 1;

  return v3;
}

void __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "actionRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordUserAction:", *(_QWORD *)(a1 + 40));

}

@end
