@implementation MFComposeRecipients

- (MFComposeRecipients)initWithRecipients:(id)a3
{
  id v5;
  MFComposeRecipients *v6;
  MFComposeRecipients *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFComposeRecipients;
  v6 = -[MFComposeRecipients init](&v9, sel_init);
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
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v34;
  id v35;
  id v36;
  id v37;

  v35 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "readableTypeIdentifiersForItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "containsObject:", v7);

  if ((_DWORD)a4)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v35, v7, &v37, a1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t)v37;
    v11 = (void *)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "readableTypeIdentifiersForItemProvider", a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v7);

    if (v13)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "objectWithItemProviderData:typeIdentifier:error:", v35, v7, &v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (uint64_t)v36;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v14)
      {
        objc_msgSend(v15, "scheme");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = v14;
        }
        else
        {
          objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(CFSTR("mailto:"), "stringByAppendingString:", v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
          v21 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v21;
        }
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  objc_msgSend(v11, "scheme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "caseInsensitiveCompare:", *MEMORY[0x1E0D1DCD8]);

  if (v23)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E1C8], "componentsWithURL:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "toRecipients");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ccRecipients");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bccRecipients");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "ef_map:", &__block_literal_global_10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend([v34 alloc], "initWithRecipients:", v31);

  }
  if (!(v24 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (a5 && v10)
    *a5 = objc_retainAutorelease((id)v10);

  return (id)v24;
}

id __71__MFComposeRecipients_objectWithItemProviderData_typeIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  +[MFComposeRecipient recipientWithProperty:address:](MFComposeRecipient, "recipientWithProperty:address:", *MEMORY[0x1E0CF5F98], a2);
  return (id)objc_claimAutoreleasedReturnValue();
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
