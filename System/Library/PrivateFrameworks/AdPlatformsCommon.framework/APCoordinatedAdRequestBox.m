@implementation APCoordinatedAdRequestBox

- (APCoordinatedAdRequestBox)initWithDelegate:(id)a3 contents:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  APCoordinatedAdRequestBox *v11;
  APCoordinatedAdRequestBox *v12;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)APCoordinatedAdRequestBox;
  v11 = -[APCoordinatedRetryBox initWithType:delegate:](&v16, sel_initWithType_delegate_, 0, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContents, a4);
    v13 = MEMORY[0x22073D7EC](v10);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v13;

  }
  return v12;
}

- (APAdRequestContents)requestContents
{
  return self->_requestContents;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestContents, 0);
}

@end
