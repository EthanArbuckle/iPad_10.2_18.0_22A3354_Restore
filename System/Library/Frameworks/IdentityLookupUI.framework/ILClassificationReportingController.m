@implementation ILClassificationReportingController

- (ILClassificationReportingController)initWithHostViewController:(id)a3
{
  id v4;
  ILClassificationReportingController *v5;
  ILClassificationReportingController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ILClassificationReportingController;
  v5 = -[ILClassificationReportingController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostViewController, v4);

  return v6;
}

- (ILClassificationReportingController)init
{

  return 0;
}

- (void)reportResponse:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  ILDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_228FAC000, v11, OS_LOG_TYPE_DEFAULT, "response: %@ extension:%@", buf, 0x16u);
  }

  objc_msgSend(v9, "networkReportDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SMSReportDestination");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
  {
    -[ILClassificationReportingController reportResponseViaNetwork:forExtension:withCompletion:](self, "reportResponseViaNetwork:forExtension:withCompletion:", v8, v9, v10);
  }
  else if (v13)
  {
    -[ILClassificationReportingController reportResponseViaSMS:forExtension:withCompletion:](self, "reportResponseViaSMS:forExtension:withCompletion:", v8, v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Extension: %@ did not specify SMS or network report destination"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ILDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ILClassificationReportingController reportResponse:forExtension:withCompletion:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

    v23 = (void *)MEMORY[0x24BDD1540];
    v26 = CFSTR("Error");
    v27 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.IdentityLookupUI.ILClassificationReportingController"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v25);

  }
}

- (void)reportResponseViaNetwork:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD9000];
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  ILDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v13;
    _os_log_impl(&dword_228FAC000, v12, OS_LOG_TYPE_DEFAULT, "creating report request with identifier: %@", (uint8_t *)&v18, 0xCu);

  }
  v14 = objc_alloc(MEMORY[0x24BDD8FF0]);
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithExtensionIdentifier:jsonDictionary:", v15, v16);
  objc_msgSend(v11, "performClassificationReportRequest:completion:", v17, v9);

}

- (void)reportResponseViaSMS:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = a3;
  objc_msgSend(v8, "SMSReportDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    -[ILClassificationReportingController setCompletion:](self, "setCompletion:", v9);
    v13 = objc_alloc_init((Class)CUTWeakLinkClass());
    ILDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_228FAC000, v14, OS_LOG_TYPE_DEFAULT, "reporting classification via SMS to %@ (%@)", buf, 0x16u);
    }

    v28 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecipients:", v15);

    objc_msgSend(v13, "setBody:", v12);
    objc_msgSend(v13, "setMessageComposeDelegate:", self);
    -[ILClassificationReportingController hostViewController](self, "hostViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v13, 1, 0);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Extension: %@ did not specify both SMS destination (%@) and userString (%@)"), v8, v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  ILDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[ILClassificationReportingController reportResponseViaSMS:forExtension:withCompletion:].cold.1((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);

  if (v9)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v26 = CFSTR("Error");
    v27 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.IdentityLookupUI.ILClassificationReportingController"), 0, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v25);

LABEL_10:
  }

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint8_t v8[16];

  ILDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_228FAC000, v5, OS_LOG_TYPE_DEFAULT, "did finish sending message", v8, 2u);
  }

  -[ILClassificationReportingController completion](self, "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ILClassificationReportingController completion](self, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0);

    -[ILClassificationReportingController setCompletion:](self, "setCompletion:", 0);
  }
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
}

- (void)reportResponse:(uint64_t)a3 forExtension:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228FAC000, a2, a3, "error reporting response: %@", a5, a6, a7, a8, 2u);
}

- (void)reportResponseViaSMS:(uint64_t)a3 forExtension:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228FAC000, a2, a3, "error reporting SMS response: %@", a5, a6, a7, a8, 2u);
}

@end
