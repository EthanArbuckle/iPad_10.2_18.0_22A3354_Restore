@implementation ATXBMStoreEvent

- (ATXBMStoreEvent)initWithEventBody:(id)a3 timestamp:(double)a4
{
  id v7;
  ATXBMStoreEvent *v8;
  ATXBMStoreEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBMStoreEvent;
  v8 = -[ATXBMStoreEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_eventBody, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)eventBody
{
  return self->_eventBody;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventBody, 0);
}

@end
