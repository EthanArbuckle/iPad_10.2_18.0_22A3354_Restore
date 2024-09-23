@implementation IUISessionChangeAssistant

- (IUISessionChangeAssistant)initWithController:(id)a3 sessionChangeContext:(id)a4 outgoingInputSource:(id)a5 incomingInputSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IUISessionChangeAssistant *v15;
  IUISessionChangeAssistant *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IUISessionChangeAssistant;
  v15 = -[IUISessionChangeAssistant init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_storeStrong((id *)&v16->_sessionChangeContext, a4);
    objc_storeStrong((id *)&v16->_outgoingInputSource, a5);
    objc_storeStrong((id *)&v16->_incomingInputSource, a6);
  }

  return v16;
}

+ (id)_responseForCompletedChangeContext:(id)a3
{
  return -[IUISessionChangeResponse initWithResponseState:]([IUISessionChangeResponse alloc], "initWithResponseState:", 2);
}

- (void)handleTeardownExistingDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD);
  int v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;

  v4 = a3;
  v5 = v4;
  if (self->_handledOutgoingInputSource)
  {
    if (v4)
    {
      v6 = sub_1000041D4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_10000DAB0(v5, v7);
LABEL_23:

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource"));

    if (v8 == v5)
    {
      self->_handledOutgoingInputSource = 1;
      v7 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant sessionChangeContext](self, "sessionChangeContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sessionChange"));
      v12 = sub_1000041D4();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = sub_1000058C0(v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v37 = 136315650;
        v38 = "-[IUISessionChangeAssistant handleTeardownExistingDelegate:]";
        v39 = 2112;
        v40 = v15;
        v41 = 2112;
        v42 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s  outgoingInputSource: %@, sessionChange: %@", (uint8_t *)&v37, 0x20u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
      objc_msgSend(v16, "setCurrentSession:", 0);

      if (v7)
      {
        if (objc_msgSend(v11, "isEndingSession"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endSessionID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sourceSession](v7, "sourceSession"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
          v21 = objc_msgSend(v18, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
            v22 = sub_1000041D4();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              sub_10000D960();

          }
        }
        if (-[NSObject isPlaceholder](v7, "isPlaceholder"))
        {
          v24 = sub_1000041D4();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            sub_10000D8EC(v25, v26, v27, v28, v29, v30, v31, v32);

        }
        -[NSObject setDataTransportDelegate:](v7, "setDataTransportDelegate:", 0);
        -[NSObject removeFromSuperview](v7, "removeFromSuperview");
      }
      v33 = (void *)objc_opt_class(self, v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant sessionChangeContext](self, "sessionChangeContext"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_responseForCompletedChangeContext:", v34));

      v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completion"));
      ((void (**)(_QWORD, void *))v36)[2](v36, v35);

      goto LABEL_23;
    }
    if (v5)
    {
      v9 = sub_1000041D4();
      v7 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_10000DA08();
      goto LABEL_23;
    }
  }

}

- (void)handleSetupNewDelegate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_handledIncomingInputSource)
  {
    v5 = sub_1000041D4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000DDC4();
  }
  else
  {
    if (!self->_handledOutgoingInputSource)
    {
      v7 = sub_1000041D4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10000DD1C();

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource"));
      -[IUISessionChangeAssistant handleTeardownExistingDelegate:](self, "handleTeardownExistingDelegate:", v9);

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant incomingInputSource](self, "incomingInputSource"));

    if (v10 == v4)
    {
      self->_handledIncomingInputSource = 1;
      v6 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant sessionChangeContext](self, "sessionChangeContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sessionChange"));
      v14 = sub_1000041D4();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = sub_1000058C0(v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v38 = 136315650;
        v39 = "-[IUISessionChangeAssistant handleSetupNewDelegate:]";
        v40 = 2112;
        v41 = v17;
        v42 = 2112;
        v43 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s  incomingInputSource: %@, sessionChange: %@", (uint8_t *)&v38, 0x20u);

      }
      if (v6)
      {
        if (objc_msgSend(v13, "isBeginningSession"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "beginSessionID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sourceSession](v6, "sourceSession"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
          v21 = objc_msgSend(v18, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
            v22 = sub_1000041D4();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              sub_10000DBCC();

          }
        }
        if (-[NSObject isPlaceholder](v6, "isPlaceholder"))
        {
          v24 = sub_1000041D4();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            sub_10000DB58(v25, v26, v27, v28, v29, v30, v31, v32);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
        -[NSObject setDataTransportDelegate:](v6, "setDataTransportDelegate:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
        objc_msgSend(v34, "setTextInputSource:", v6);

        if (objc_msgSend(v13, "isBeginningSession"))
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
        else
          v35 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
        objc_msgSend(v37, "setCurrentSession:", v35);

      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
        objc_msgSend(v36, "setTextInputSource:", 0);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant controller](self, "controller"));
        objc_msgSend(v35, "setCurrentSession:", 0);
      }

    }
    else
    {
      if (!v4)
        goto LABEL_5;
      v11 = sub_1000041D4();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        sub_10000DC74();
    }
  }

LABEL_5:
}

- (BOOL)_changeHasNonUIKeyInputInputSource
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource")),
        v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___UIKeyInput),
        v5,
        v4,
        !v6))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant incomingInputSource](self, "incomingInputSource"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant incomingInputSource](self, "incomingInputSource"));
      v9 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___UIKeyInput) ^ 1;

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

- (void)finalizeSessionChange
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  if (!self->_handledOutgoingInputSource || !self->_handledIncomingInputSource)
  {
    v3 = -[IUISessionChangeAssistant _changeHasNonUIKeyInputInputSource](self, "_changeHasNonUIKeyInputInputSource");
    v4 = sub_1000041D4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant sessionChangeContext](self, "sessionChangeContext"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionChange"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource"));
        v10 = sub_1000058C0(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant incomingInputSource](self, "incomingInputSource"));
        v13 = sub_1000058C0(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v17 = 136315906;
        v18 = "-[IUISessionChangeAssistant finalizeSessionChange]";
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  Outgoing or incoming input source not handled during -become/resignFirstResponder due to non-UIKeyInput-conforming input source. Handling now. (sessionChange: %@, outgoingInputSource: %@, incomingInputSource: %@)", (uint8_t *)&v17, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      sub_10000DE6C(self, v6);
    }

  }
  if (!self->_handledOutgoingInputSource)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant outgoingInputSource](self, "outgoingInputSource"));
    -[IUISessionChangeAssistant handleTeardownExistingDelegate:](self, "handleTeardownExistingDelegate:", v15);

  }
  if (!self->_handledIncomingInputSource)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeAssistant incomingInputSource](self, "incomingInputSource"));
    -[IUISessionChangeAssistant handleSetupNewDelegate:](self, "handleSetupNewDelegate:", v16);

  }
}

- (IUISessionChangeController)controller
{
  return self->_controller;
}

- (IUISessionChangeContext)sessionChangeContext
{
  return self->_sessionChangeContext;
}

- (IUIRTIInputSource)outgoingInputSource
{
  return self->_outgoingInputSource;
}

- (IUIRTIInputSource)incomingInputSource
{
  return self->_incomingInputSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingInputSource, 0);
  objc_storeStrong((id *)&self->_outgoingInputSource, 0);
  objc_storeStrong((id *)&self->_sessionChangeContext, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
