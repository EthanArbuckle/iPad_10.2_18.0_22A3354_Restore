@implementation SFHostApplicationCustomActivity

- (SFHostApplicationCustomActivity)initWithActivityProxy:(id)a3
{
  id v5;
  SFHostApplicationCustomActivity *v6;
  SFHostApplicationCustomActivity *v7;
  SFHostApplicationCustomActivity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHostApplicationCustomActivity;
  v6 = -[UIActivity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityProxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return -[SFCustomActivityProxy activityType](self->_activityProxy, "activityType");
}

- (id)activityTitle
{
  return -[SFCustomActivityProxy activityTitle](self->_activityProxy, "activityTitle");
}

- (id)activityImage
{
  return -[SFCustomActivityProxy activityImage](self->_activityProxy, "activityImage");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (SFCustomActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityProxy, 0);
}

@end
