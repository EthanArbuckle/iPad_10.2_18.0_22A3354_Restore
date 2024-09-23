@implementation IAMPresentingModalMessageContext

- (IAMPresentingModalMessageContext)initWithMessage:(id)a3 messageGroup:(id)a4 presentingViewController:(id)a5 presentationExpirationTimer:(id)a6 presentationHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  IAMPresentingModalMessageContext *v18;
  IAMPresentingModalMessageContext *v19;
  uint64_t v20;
  id presentationHandler;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IAMPresentingModalMessageContext;
  v18 = -[IAMPresentingModalMessageContext init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_message, a3);
    objc_storeStrong((id *)&v19->_messageGroup, a4);
    objc_storeWeak((id *)&v19->_presentingViewController, v15);
    objc_storeStrong((id *)&v19->_presentationExpirationTimer, a6);
    v20 = MEMORY[0x212BB42FC](v17);
    presentationHandler = v19->_presentationHandler;
    v19->_presentationHandler = (id)v20;

  }
  return v19;
}

- (IAMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (IAMMessageGroup)messageGroup
{
  return self->_messageGroup;
}

- (void)setMessageGroup:(id)a3
{
  objc_storeStrong((id *)&self->_messageGroup, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (NSTimer)presentationExpirationTimer
{
  return self->_presentationExpirationTimer;
}

- (void)setPresentationExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_presentationExpirationTimer, a3);
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_storeStrong((id *)&self->_presentationExpirationTimer, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
