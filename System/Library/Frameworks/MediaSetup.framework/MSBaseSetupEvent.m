@implementation MSBaseSetupEvent

- (MSBaseSetupEvent)init
{
  MSBaseSetupEvent *v2;
  MSBaseSetupEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSBaseSetupEvent;
  v2 = -[MSBaseSetupEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MSBaseSetupEvent setEventName:](v2, "setEventName:", &stru_24DBD5D08);
  return v3;
}

- (id)encoded
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
