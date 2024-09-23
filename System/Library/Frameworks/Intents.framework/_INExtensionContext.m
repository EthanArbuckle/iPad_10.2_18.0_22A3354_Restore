@implementation _INExtensionContext

- (_INExtensionContext)initWithInputItems:(id)a3 privateIntentHandlerProvider:(id)a4
{
  id v7;
  _INExtensionContext *v8;
  _INExtensionContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_INExtensionContext;
  v8 = -[_INExtensionContext initWithInputItems:](&v11, sel_initWithInputItems_, a3);
  v9 = v8;
  if (v8)
  {
    -[_INExtensionContext _commonInit](v8, "_commonInit");
    objc_storeStrong((id *)&v9->_extensionHandler, a4);
    v9->_isPrivateExtension = 1;
  }

  return v9;
}

- (_INExtensionContext)initWithInputItems:(id)a3 extension:(id)a4
{
  _INExtensionContext *result;

  result = -[_INExtensionContext initWithInputItems:privateIntentHandlerProvider:](self, "initWithInputItems:privateIntentHandlerProvider:", a3, a4);
  if (result)
    result->_isPrivateExtension = 0;
  return result;
}

- (_INExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  _INExtensionContext *v5;
  _INExtensionContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_INExtensionContext;
  v5 = -[_INExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v8, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[_INExtensionContext _commonInit](v5, "_commonInit");
  return v6;
}

- (void)_commonInit
{
  void *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;

  +[INPreferences sharedPreferences](INPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateWithExtensionContext:", self);

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.extension", v6);
  queue = self->_queue;
  self->_queue = v4;

  self->_isPrivateExtension = 0;
}

- (INIntentHandlerProvidingPrivate)_extensionHandler
{
  INIntentHandlerProvidingPrivate *extensionHandler;
  INIntentHandlerProvidingPrivate *v4;
  INIntentHandlerProvidingPrivate *v5;

  extensionHandler = self->_extensionHandler;
  if (!extensionHandler)
  {
    -[_INExtensionContext _principalObject](self, "_principalObject");
    v4 = (INIntentHandlerProvidingPrivate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_extensionHandler;
    self->_extensionHandler = v4;

    extensionHandler = self->_extensionHandler;
  }
  return extensionHandler;
}

- (id)_intentDelivererForIntent:(id)a3
{
  INIntentDelivering *intentDeliverer;
  INIntentDeliverer *v5;
  OS_dispatch_queue *queue;
  void *v7;
  void *v8;
  INIntentDelivering *v9;
  INIntentDelivering *v10;
  _OWORD v12[2];

  intentDeliverer = self->_intentDeliverer;
  if (!intentDeliverer)
  {
    v5 = [INIntentDeliverer alloc];
    queue = self->_queue;
    -[_INExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "auditToken");
    else
      memset(v12, 0, sizeof(v12));
    v9 = -[INIntentDeliverer initWithQueue:auditToken:](v5, "initWithQueue:auditToken:", queue, v12);
    v10 = self->_intentDeliverer;
    self->_intentDeliverer = v9;

    -[INIntentDelivering setDelegate:](self->_intentDeliverer, "setDelegate:", self);
    intentDeliverer = self->_intentDeliverer;
  }
  return intentDeliverer;
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getIntentParameterOptions:forIntent:searchTerm:completionBlock:", v13, v12, v11, v10);

}

- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getIntentParameterDefaultValue:forIntent:completionBlock:", v10, v9, v8);

}

- (void)resolveIntentSlots:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolveIntentParameters:forIntent:completionBlock:", v10, v9, v8);

}

- (void)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolveIntentParameter:forIntent:completionBlock:", v10, v9, v8);

}

- (void)confirmIntent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confirmIntent:withCompletion:", v7, v6);

}

- (void)handleIntent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleIntent:withCompletion:", v7, v6);

}

- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startSendingUpdatesForIntent:toObserver:completionHandler:", v7, v6, 0);

}

- (void)stopSendingUpdatesForIntent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSendingUpdatesForIntent:completionHandler:", v4, 0);

}

- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id handlerForIntent;
  void (**v11)(id, id);

  v11 = (void (**)(id, id))a5;
  v7 = a4;
  -[_INExtensionContext _validateExtension](self, "_validateExtension");
  -[_INExtensionContext _extensionHandler](self, "_extensionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handlerForIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  handlerForIntent = self->_handlerForIntent;
  self->_handlerForIntent = v9;

  v11[2](v11, self->_handlerForIntent);
}

- (void)beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___INExtensionContext_beginTransactionWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E2292238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___INExtensionContext_completeTransactionWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E2292238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___INExtensionContext_cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke;
  block[3] = &unk_1E2292238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_validateExtension
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;

  -[_INExtensionContext _extensionHandler](self, "_extensionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = CFSTR("Extension's principal object should not be nil");
    goto LABEL_7;
  }
  v4 = v3;
  if (!self->_isPrivateExtension)
  {
    v10 = v3;
    v5 = _INExtensionValidateClass(v3);
    v4 = v10;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v9 = v10;
      v7 = CFSTR("The extension's principal object %@ must be a subclass of INExtension");
LABEL_7:
      objc_msgSend(v6, "stringWithFormat:", v7, v9);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }
  }

}

- (void)_beginTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[_INExtensionContext _extensionHandler](self, "_extensionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "transactionWillBeginForIntentIdentifier:", v8);
  if (v6)
    v6[2](v6);

}

- (void)_completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id handlerForIntent;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[_INExtensionContext _extensionHandler](self, "_extensionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "transactionDidCompleteForIntentIdentifier:", v9);
  handlerForIntent = self->_handlerForIntent;
  self->_handlerForIntent = 0;

  -[_INExtensionContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
  if (v6)
    v6[2](v6);

}

- (void)_cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id handlerForIntent;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[_INExtensionContext _extensionHandler](self, "_extensionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "transactionDidCompleteForIntentIdentifier:", v10);
  handlerForIntent = self->_handlerForIntent;
  self->_handlerForIntent = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 3001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INExtensionContext cancelRequestWithError:](self, "cancelRequestWithError:", v9);

  if (v6)
    v6[2](v6);

}

- (void)confirmationResponseForIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___INExtensionContext_confirmationResponseForIntent_completion___block_invoke;
  v8[3] = &unk_1E2293C78;
  v9 = v6;
  v7 = v6;
  -[_INExtensionContext confirmIntent:withCompletion:](self, "confirmIntent:withCompletion:", a3, v8);

}

- (void)handleIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___INExtensionContext_handleIntent_completion___block_invoke;
  v8[3] = &unk_1E2293C78;
  v9 = v6;
  v7 = v6;
  -[_INExtensionContext handleIntent:withCompletion:](self, "handleIntent:withCompletion:", a3, v8);

}

- (void)handleIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___INExtensionContext_handleIntent_completionHandler___block_invoke;
  v8[3] = &unk_1E2293C78;
  v9 = v6;
  v7 = v6;
  -[_INExtensionContext handleIntent:withCompletion:](self, "handleIntent:withCompletion:", a3, v8);

}

- (void)completeTransaction
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[_INExtensionContext completeTransaction]";
    _os_log_error_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_ERROR, "%s Deprecated method invoked: -[_INExtensionContext completeTransaction]", (uint8_t *)&v4, 0xCu);
  }
  -[_INExtensionContext completeTransactionWithIntentIdentifier:completion:](self, "completeTransactionWithIntentIdentifier:completion:", &stru_1E2295770, &__block_literal_global_49641);
}

- (void)cancelTransactionDueToTimeout
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[_INExtensionContext cancelTransactionDueToTimeout]";
    _os_log_error_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_ERROR, "%s Deprecated method invoked: -[_INExtensionContext cancelTransactionDueToTimeout]", (uint8_t *)&v4, 0xCu);
  }
  -[_INExtensionContext cancelTransactionDueToTimeoutWithIntentIdentifier:completion:](self, "cancelTransactionDueToTimeoutWithIntentIdentifier:completion:", &stru_1E2295770, &__block_literal_global_19);
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_INExtensionContext _intentDelivererForIntent:](self, "_intentDelivererForIntent:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getIntentParameterOptions:forIntent:searchTerm:completionBlock:", v10, v9, 0, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionHandler, 0);
  objc_storeStrong((id *)&self->_intentDeliverer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handlerForIntent, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE061AE8);
}

@end
