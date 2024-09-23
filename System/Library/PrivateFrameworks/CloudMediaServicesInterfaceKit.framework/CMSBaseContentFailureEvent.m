@implementation CMSBaseContentFailureEvent

- (CMSBaseContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4
{
  id v7;
  id v8;
  CMSBaseContentFailureEvent *v9;
  id *p_isa;
  CMSBaseContentFailureEvent *v11;
  NSString *eventName;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSBaseContentFailureEvent;
  v9 = -[CMSBaseContentFailureEvent init](&v14, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    eventName = v9->_eventName;
    v9->_eventName = (NSString *)&stru_24E1CDD40;

    objc_storeStrong(p_isa + 2, a3);
    objc_storeStrong(p_isa + 3, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (id)encoded
{
  NSString *sessionIdentifier;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("service");
  v4[1] = CFSTR("sessionIdentifier");
  sessionIdentifier = self->_sessionIdentifier;
  v5[0] = self->_serviceID;
  v5[1] = sessionIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
