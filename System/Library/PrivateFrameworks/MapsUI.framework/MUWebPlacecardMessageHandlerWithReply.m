@implementation MUWebPlacecardMessageHandlerWithReply

- (MUWebPlacecardMessageHandlerWithReply)initWithDelegate:(id)a3
{
  id v4;
  MUWebPlacecardMessageHandlerWithReply *v5;
  MUWebPlacecardMessageHandlerWithReply *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUWebPlacecardMessageHandlerWithReply;
  v5 = -[MUWebPlacecardMessageHandlerWithReply init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    MUGetMUWebContentLog_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "body");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_191DB8000, v12, OS_LOG_TYPE_ERROR, "Incorrect message from placecard web module: %@", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_8;
  }
  objc_msgSend(v7, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "body");
    v12 = objc_claimAutoreleasedReturnValue();
    MUGetMUWebContentLog_0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "Received a message from JavaScript: %@", (uint8_t *)&v17, 0xCu);
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didReceiveMessageFromWebContentViewController:replyHandler:", v14, v8);

LABEL_8:
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
