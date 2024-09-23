@implementation MTEventHandlerRegistration

- (MTEventHandlerRegistration)initWithMetricsKit:(id)a3 name:(id)a4 class:(Class)a5 eventData:(id)a6
{
  id v10;
  id v11;
  MTEventHandlerRegistration *v12;
  MTEventHandlerRegistration *v13;
  objc_super v15;

  v10 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MTEventHandlerRegistration;
  v12 = -[MTObject initWithMetricsKit:](&v15, sel_initWithMetricsKit_, a3);
  v13 = v12;
  if (v12)
  {
    -[MTEventHandlerRegistration setRegisteredName:](v12, "setRegisteredName:", v10);
    -[MTEventHandlerRegistration setEventHandlerClass:](v13, "setEventHandlerClass:", a5);
    -[MTEventHandlerRegistration setEventData:](v13, "setEventData:", v11);
  }

  return v13;
}

- (MTEventHandler)eventHandler
{
  MTEventHandlerRegistration *v2;
  id v3;
  void *v4;
  MTEventHandler *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  MTEventHandler *eventHandler;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_eventHandler)
  {
    v3 = objc_alloc(-[MTEventHandlerRegistration eventHandlerClass](v2, "eventHandlerClass"));
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MTEventHandler *)objc_msgSend(v3, "initWithMetricsKit:", v4);

    -[MTEventHandlerRegistration registeredName](v2, "registeredName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEventHandler setRegisteredName:](v5, "setRegisteredName:", v6);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("eventType");
    -[MTEventHandlerRegistration registeredName](v2, "registeredName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    -[MTEventHandlerRegistration eventData](v2, "eventData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v10, "count") == 0;

    if ((v9 & 1) == 0)
    {
      -[MTEventHandlerRegistration eventData](v2, "eventData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v11);

    }
    v12 = (void *)objc_msgSend(v7, "copy");
    -[MTEventHandler setRegisteredEventData:](v5, "setRegisteredEventData:", v12);

    eventHandler = v2->_eventHandler;
    v2->_eventHandler = v5;

  }
  objc_sync_exit(v2);

  return v2->_eventHandler;
}

- (NSString)registeredName
{
  return self->_registeredName;
}

- (void)setRegisteredName:(id)a3
{
  objc_storeStrong((id *)&self->_registeredName, a3);
}

- (Class)eventHandlerClass
{
  return self->_eventHandlerClass;
}

- (void)setEventHandlerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_eventHandlerClass, a3);
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (void)setEventHandler:(id)a3
{
  objc_storeStrong((id *)&self->_eventHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventHandlerClass, 0);
  objc_storeStrong((id *)&self->_registeredName, 0);
}

@end
