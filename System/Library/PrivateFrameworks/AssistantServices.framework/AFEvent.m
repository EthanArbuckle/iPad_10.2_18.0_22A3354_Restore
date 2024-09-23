@implementation AFEvent

- (AFEvent)initWithBMEvent:(id)a3
{
  id v5;
  AFEvent *v6;
  AFEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFEvent;
  v6 = -[AFEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_bmEvent, a3);

  return v7;
}

- (id)bmEvent
{
  return self->_bmEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bmEvent, 0);
}

@end
