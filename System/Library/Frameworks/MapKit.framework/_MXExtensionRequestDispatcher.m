@implementation _MXExtensionRequestDispatcher

- (_MXExtensionRequestDispatcher)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionRequestDispatcher;
  return -[_MXExtensionRequestDispatcher init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dispatchRequest:(id)a3 vendor:(id)a4 completion:(id)a5
{
  void *v5;
  void (**v6)(id, _QWORD, id);
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v5, "_errorWithExtensionServiceError:", 15);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v7);

}

- (void)startSendingUpdatesForRequest:(id)a3 vendor:(id)a4 toObserver:(id)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a5;
  objc_msgSend(v5, "_errorWithExtensionServiceError:", 15);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveUpdatedResponse:error:", 0, v7);

}

@end
