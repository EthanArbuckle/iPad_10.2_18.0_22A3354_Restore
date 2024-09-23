@implementation ATMessageLink

- (ATMessageLink)init
{
  uint64_t v4;
  void *v6;
  objc_super v7;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATMessageLink.m"), 14, CFSTR("ATMessageLink is an abstract class and requires a concrete implementation."));

  }
  v7.receiver = self;
  v7.super_class = (Class)ATMessageLink;
  return -[ATMessageLink init](&v7, sel_init);
}

- (BOOL)isOpen
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isInitialized
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)identifier
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (int)endpointType
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6;

  v6 = a4;
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6[2](v6, 0);

}

- (void)sendResponse:(id)a3 withProgress:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a5;
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v7[2](v7, 0);

}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)removeRequestHandlerForDataClass:(id)a3
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)addObserver:(id)a3
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeObserver:(id)a3
{
  -[ATMessageLink doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

@end
