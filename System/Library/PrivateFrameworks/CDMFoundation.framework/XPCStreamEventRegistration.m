@implementation XPCStreamEventRegistration

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)eventName
{
  return self->_eventName;
}

+ (id)registrationWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[XPCStreamEventRegistration _initWithStream:eventName:dagServiceClass:]([XPCStreamEventRegistration alloc], "_initWithStream:eventName:dagServiceClass:", v8, v7, a5);

  return v9;
}

- (id)_initWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5
{
  NSString *v8;
  NSString *v9;
  XPCStreamEventRegistration *v10;
  NSString *streamName;
  NSString *v12;
  NSString *eventName;
  NSString *v14;
  objc_super v16;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v16.receiver = self;
  v16.super_class = (Class)XPCStreamEventRegistration;
  v10 = -[XPCStreamEventRegistration init](&v16, sel_init);
  streamName = v10->_streamName;
  v10->_streamName = v8;
  v12 = v8;

  eventName = v10->_eventName;
  v10->_eventName = v9;
  v14 = v9;

  objc_storeStrong((id *)&v10->_dagServiceClass, a5);
  return v10;
}

- (void)invoke:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[objc_class handleXPCEvent:fromStream:withAssets:withSelfMetadata:](self->_dagServiceClass, "handleXPCEvent:fromStream:withAssets:withSelfMetadata:", v13, v10, v11, v12);

}

- (Class)dagServiceClass
{
  return self->_dagServiceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dagServiceClass, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

@end
