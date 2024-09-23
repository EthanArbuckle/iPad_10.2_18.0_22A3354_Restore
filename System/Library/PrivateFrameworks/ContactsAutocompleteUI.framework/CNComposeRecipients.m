@implementation CNComposeRecipients

- (CNComposeRecipients)initWithRecipients:(id)a3
{
  id v5;
  CNComposeRecipients *v6;
  CNComposeRecipients *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNComposeRecipients;
  v6 = -[CNComposeRecipients init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recipients, a3);

  return v7;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "readableTypeIdentifiersForItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "readableTypeIdentifiersForItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "readableTypeIdentifiersForItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (v11)
  {
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v8, v9, &v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "readableTypeIdentifiersForItemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v9);

    if (v15)
    {
      v43 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "objectWithItemProviderData:typeIdentifier:error:", v8, v9, &v43);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (uint64_t)v43;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17;
      if (v16)
      {
        objc_msgSend(v17, "scheme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
          v20 = v9;
          v21 = v8;
          v22 = a5;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
          v41 = v12;
          v24 = a1;
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          a5 = v22;
          v8 = v21;
          v9 = v20;

          objc_msgSend(CFSTR("mailto:"), "stringByAppendingString:", v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          a1 = v24;
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  objc_msgSend(v12, "scheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("mailto"));

  if (v27)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E1C8], "componentsWithURL:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "toRecipients");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ccRecipients");
    v42 = v12;
    v31 = v9;
    v32 = v8;
    v33 = a5;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v34);
    v40 = (objc_class *)a1;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bccRecipients");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = v33;
    v8 = v32;
    v9 = v31;
    v12 = v42;

    objc_msgSend(v37, "ef_map:", &__block_literal_global_16);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend([v40 alloc], "initWithRecipients:", v38);

  }
  if (!(v28 | v13))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  if (a5 && v13)
    *a5 = objc_retainAutorelease((id)v13);

  return (id)v28;
}

CNComposeRecipient *__71__CNComposeRecipients_objectWithItemProviderData_typeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNComposeRecipient *v3;

  v2 = a2;
  v3 = -[CNComposeRecipient initWithContact:address:kind:]([CNComposeRecipient alloc], "initWithContact:address:kind:", 0, v2, 0);

  return v3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
