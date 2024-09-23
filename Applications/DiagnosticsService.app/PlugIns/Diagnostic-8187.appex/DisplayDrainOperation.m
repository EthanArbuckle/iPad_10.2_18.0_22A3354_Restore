@implementation DisplayDrainOperation

- (DisplayDrainOperation)initWithBrightness:(float)a3 responder:(id)a4
{
  id v6;
  DisplayDrainOperation *v7;
  DisplayDrainOperation *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DisplayDrainOperation;
  v7 = -[DisplayDrainOperation init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_responder, v6);
    v8->_requestedBrightness = a3;
    v8->_originalScreenBrightness = BKSDisplayBrightnessGetCurrent(v9);
  }

  return v8;
}

- (void)main
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DisplayDrainOperation responder](self, "responder"));
  -[DisplayDrainOperation requestedBrightness](self, "requestedBrightness");
  objc_msgSend(v3, "setScreenToBrightness:animate:", 0);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayDrainOperation responder](self, "responder"));
  -[DisplayDrainOperation originalScreenBrightness](self, "originalScreenBrightness");
  objc_msgSend(v3, "setScreenToBrightness:animate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)DisplayDrainOperation;
  -[DrainOperation cancel](&v4, "cancel");
}

- (DKResponder)responder
{
  return (DKResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (float)requestedBrightness
{
  return self->_requestedBrightness;
}

- (void)setRequestedBrightness:(float)a3
{
  self->_requestedBrightness = a3;
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responder);
}

@end
