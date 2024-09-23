@implementation CKRecipientGenerator

+ (id)sharedRecipientGenerator
{
  if (sharedRecipientGenerator_once != -1)
    dispatch_once(&sharedRecipientGenerator_once, &__block_literal_global_84);
  return (id)sharedRecipientGenerator_sSharedRecipientGenerator;
}

void __48__CKRecipientGenerator_sharedRecipientGenerator__block_invoke()
{
  CKRecipientGenerator *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(CKRecipientGenerator);
  v1 = (void *)sharedRecipientGenerator_sSharedRecipientGenerator;
  sharedRecipientGenerator_sSharedRecipientGenerator = (uint64_t)v0;

  v2 = (void *)sharedRecipientGenerator_sSharedRecipientGenerator;
  CKPreferredAddressTypes();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchABPropertyTypes:", v3);

}

- (id)recipientWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint64_t v10;

  v9 = 0;
  v10 = 5;
  -[CKRecipientGenerator getAddressForContact:address:kind:](self, "getAddressForContact:address:kind:", a3, &v9, &v10);
  v3 = v9;
  +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientWithAddress:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == 1)
  {
    v6 = (void *)MEMORY[0x193FF31C8](1);
    v7 = v6;
    objc_msgSend(v5, "setCountryCode:", v7);
    if (v6)
      CFRelease(v7);

  }
  return v5;
}

- (void)getAddressForContact:(id)a3 address:(id *)a4 kind:(unint64_t *)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "phoneNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v17, "phoneNumbers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
  }
  else
  {
    objc_msgSend(v17, "emailAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v14, "count");

    if (!v12)
    {
      v13 = 5;
      goto LABEL_6;
    }
    objc_msgSend(v17, "emailAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }

LABEL_6:
  v16 = objc_retainAutorelease(v12);
  *a4 = v16;
  *a5 = v13;

}

- (id)recipientWithContactProperty:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967C0]);

    if (v8)
    {
      objc_msgSend(v3, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  if (objc_msgSend(v6, "length"))
  {
    +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipientWithAddress:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recipientWithAddress:(id)a3
{
  char *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  CKIMComposeRecipient *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CKIMComposeRecipient *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (char *)a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchCNContactForHandleWithID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x193FF3B1C](v3);
    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else if (IMStringIsEmail())
    {
      v7 = 0;
    }
    else
    {
      v7 = 2;
    }
    IMStripFormattingFromAddress();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__ck_bestAccountForAddress:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "imHandleWithID:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKIsRunningInFullCKClient() || CKIsRunningUnitTests())
      v14 = -[CKIMComposeRecipient initWithHandle:]([CKIMComposeRecipient alloc], "initWithHandle:", v13);
    else
      v14 = (CKIMComposeRecipient *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13690]), "initWithContact:address:kind:", v5, v3, v7);
    v9 = v14;
    if (v6)
    {
      v15 = (void *)MEMORY[0x193FF31C8](1);
      v16 = v15;
      -[CKIMComposeRecipient setCountryCode:](v9, "setCountryCode:", v16);
      if (v15)
        CFRelease(v16);

    }
    if ((!v13 || !v5) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138412802;
        v20 = v3;
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Address %@ matched to nil handle (%@) or contact (%@)", (uint8_t *)&v19, 0x20u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "-[CKRecipientGenerator recipientWithAddress:]";
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "%s given nil address", (uint8_t *)&v19, 0xCu);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (NSArray)searchABPropertyTypes
{
  return self->_searchABPropertyTypes;
}

- (void)setSearchABPropertyTypes:(id)a3
{
  objc_storeStrong((id *)&self->_searchABPropertyTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchABPropertyTypes, 0);
}

@end
