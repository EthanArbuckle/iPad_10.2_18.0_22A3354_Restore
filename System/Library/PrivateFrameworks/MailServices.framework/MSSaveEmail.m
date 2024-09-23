@implementation MSSaveEmail

+ (void)saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  MSSaveEmail *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MSSaveEmail);
  -[MSSaveEmail _saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:](v12, "_saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:", v13, v9, v10, v11);

}

+ (void)saveEmail:(id)a3 completionBlock:(id)a4
{
  id v5;
  MSSaveEmail *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MSSaveEmail);
  -[MSSaveEmail _saveEmail:completionBlock:](v6, "_saveEmail:completionBlock:", v7, v5);

}

- (void)_saveEmail:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x20BD2EA04]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v8, CFSTR("email"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__MSSaveEmail__saveEmail_completionBlock___block_invoke;
    v11[3] = &unk_24C385178;
    v12 = v6;
    -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("SaveEmail"), v9, v11);

  }
  else
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = objc_msgSend(0, "length");
      _os_log_impl(&dword_20AC30000, v10, OS_LOG_TYPE_DEFAULT, "#Warning Unable to unarchive model data with length %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

  objc_autoreleasePoolPop(v7);
}

void __42__MSSaveEmail__saveEmail_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("messageid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_saveMessageData:(id)a3 forAccountWithID:(id)a4 autosaveIdentifier:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSSaveEmail.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageData"));

  }
  v15 = (void *)MEMORY[0x20BD2EA04]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v11, CFSTR("RFC822Data"), v12, CFSTR("UniqueID"), v13, CFSTR("autosaveidentifier"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__MSSaveEmail__saveMessageData_forAccountWithID_autosaveIdentifier_completionBlock___block_invoke;
  v19[3] = &unk_24C385178;
  v17 = v14;
  v20 = v17;
  -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("MailSaveMessage"), v16, v19);

  objc_autoreleasePoolPop(v15);
}

void __84__MSSaveEmail__saveMessageData_forAccountWithID_autosaveIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("success"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BOOLValue");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MailSaveMessage")))
  {
    v13 = CFSTR("success");
    v14[0] = &unk_24C38A1D8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, 0);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MSSaveEmail;
    -[MSService _simulateServicesMethod:arguments:callback:](&v12, sel__simulateServicesMethod_arguments_callback_, v8, v9, v10);
  }

}

+ (void)placeholderAttachmentForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 completionBlock:(id)a7
{
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  MSSaveEmail *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v13 = a3;
  v14 = a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  if (v13)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSSaveEmail.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileName"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSSaveEmail.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileSize"));

LABEL_3:
  if (!v15)
    v15 = &stru_24C386120;
  v17 = (void *)MEMORY[0x20BD2EA04]();
  v18 = objc_alloc_init(MSSaveEmail);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24C38A1F0, CFSTR("MSAttachmentRequestKeyOperation"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("MSAttachmentRequestKeyNameType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("MSAttachmentRequestKeySizeType"));

  if (v14)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("MSAttachmentRequestKeyMimeType"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("MSAttachmentRequestKeyContentID"));
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __92__MSSaveEmail_placeholderAttachmentForFileName_fileSize_mimeType_contentID_completionBlock___block_invoke;
  v24[3] = &unk_24C385178;
  v21 = v16;
  v25 = v21;
  -[MSService _callServicesMethod:arguments:callback:](v18, "_callServicesMethod:arguments:callback:", CFSTR("MSAttachmentRequest"), v19, v24);

  objc_autoreleasePoolPop(v17);
}

void __92__MSSaveEmail_placeholderAttachmentForFileName_fileSize_mimeType_contentID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("MSAttachmentResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment NSData failure to persist", v10, 2u);
      }

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("MSAttachmentResponseKeyData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (void)deletePlaceholderAttachmentForURL:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MSSaveEmail *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSSaveEmail.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v9 = (void *)MEMORY[0x20BD2EA04]();
  v10 = objc_alloc_init(MSSaveEmail);
  v16[0] = CFSTR("MSAttachmentRequestKeyOperation");
  v16[1] = CFSTR("MSAttachmentRequestKeyURL");
  v17[0] = &unk_24C38A208;
  v17[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__MSSaveEmail_deletePlaceholderAttachmentForURL_completionBlock___block_invoke;
  v14[3] = &unk_24C385178;
  v12 = v8;
  v15 = v12;
  -[MSService _callServicesMethod:arguments:callback:](v10, "_callServicesMethod:arguments:callback:", CFSTR("MSAttachmentRequest"), v11, v14);

  objc_autoreleasePoolPop(v9);
}

void __65__MSSaveEmail_deletePlaceholderAttachmentForURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("MSAttachmentResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment URL failure to remove", v10, 2u);
      }

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("MSAttachmentResponseKeyError"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (void)securityScopeForPlaceholderURL:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MSSaveEmail *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSSaveEmail.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v9 = (void *)MEMORY[0x20BD2EA04]();
  v10 = objc_alloc_init(MSSaveEmail);
  v16[0] = CFSTR("MSAttachmentRequestKeyOperation");
  v16[1] = CFSTR("MSAttachmentRequestKeyURL");
  v17[0] = &unk_24C38A220;
  v17[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__MSSaveEmail_securityScopeForPlaceholderURL_completionBlock___block_invoke;
  v14[3] = &unk_24C385178;
  v12 = v8;
  v15 = v12;
  -[MSService _callServicesMethod:arguments:callback:](v10, "_callServicesMethod:arguments:callback:", CFSTR("MSAttachmentRequest"), v11, v14);

  objc_autoreleasePoolPop(v9);
}

void __62__MSSaveEmail_securityScopeForPlaceholderURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("MSAttachmentResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20AC30000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Attachment URL failure to remove", v10, 2u);
      }

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("MSAttachmentResponseKeyData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
