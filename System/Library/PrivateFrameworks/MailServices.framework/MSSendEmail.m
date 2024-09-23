@implementation MSSendEmail

+ (id)sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  MSSendEmail *v15;

  v9 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(MSSendEmail);
  -[MSSendEmail _sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:](v15, "_sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:", v11, v12, v9, v13, v14);

  return v15;
}

+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  MSSendEmail *v9;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MSSendEmail);
  -[MSSendEmail _sendEmail:playSound:completionBlock:](v9, "_sendEmail:playSound:completionBlock:", v7, v6, v8);

  return v9;
}

+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 timeout:(double)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  MSSendEmail *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MSSendEmail);
  objc_msgSend(MEMORY[0x24BE2E680], "promise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSSendEmail _sendEmail:playSound:completionBlock:](v10, "_sendEmail:playSound:completionBlock:", v9, v8, v12);

  objc_msgSend(v11, "future");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultWithTimeout:error:", a6, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 && objc_msgSend(*a6, "ef_isTimeoutError"))
  {
    -[MSService cancel](v10, "cancel");
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MailServices"), 1505, 0);
  }

  return v14;
}

- (void)_sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x20BD2EA04]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v16[0] = CFSTR("email");
    v16[1] = CFSTR("playSound");
    v17[0] = v10;
    v17[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__MSSendEmail__sendEmail_playSound_completionBlock___block_invoke;
    v14[3] = &unk_24C385178;
    v15 = v8;
    -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("SendEmail"), v12, v14);

  }
  else
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(0, "length");
      _os_log_impl(&dword_20AC30000, v13, OS_LOG_TYPE_DEFAULT, "#Warning Unable to unarchive model data with length %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);
  }

  objc_autoreleasePoolPop(v9);
}

void __52__MSSendEmail__sendEmail_playSound_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v9 = a5;
  v27[2] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSSendEmail.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageData"));

  }
  v17 = (void *)MEMORY[0x20BD2EA04]();
  v18 = objc_alloc(MEMORY[0x24BDBCED8]);
  v26[0] = CFSTR("RFC822Data");
  v26[1] = CFSTR("HideMyEmailMessage");
  v27[0] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithDictionary:", v20);

  objc_msgSend(v21, "ef_setOptionalObject:forKey:", v15, CFSTR("SendLaterDate"));
  objc_msgSend(v21, "ef_setOptionalObject:forKey:", v14, CFSTR("autosaveIdentifier"));
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __94__MSSendEmail__sendMessageData_autosaveIdentifier_isHMEMessage_sendLaterDate_completionBlock___block_invoke;
  v24[3] = &unk_24C385178;
  v22 = v16;
  v25 = v22;
  -[MSService _callServicesMethod:arguments:callback:](self, "_callServicesMethod:arguments:callback:", CFSTR("MailSendMessage"), v21, v24);

  objc_autoreleasePoolPop(v17);
}

void __94__MSSendEmail__sendMessageData_autosaveIdentifier_isHMEMessage_sendLaterDate_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("success"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("inAirplaneMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BOOLValue");

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
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MailSendMessage")))
  {
    v13[0] = CFSTR("success");
    v13[1] = CFSTR("inAirplaneMode");
    v14[0] = &unk_24C38A238;
    v14[1] = &unk_24C38A250;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, 0);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MSSendEmail;
    -[MSService _simulateServicesMethod:arguments:callback:](&v12, sel__simulateServicesMethod_arguments_callback_, v8, v9, v10);
  }

}

@end
