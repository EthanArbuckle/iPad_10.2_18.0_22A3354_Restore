@implementation MTPAFEventHandlers

- (void)registerDefaultEventHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_opt_class();
  v24[0] = CFSTR("eventType");
  v24[1] = CFSTR("actionType");
  v25[0] = CFSTR("playActivity");
  v25[1] = CFSTR("start");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", CFSTR("playStart"), v3, v5);

  v6 = objc_opt_class();
  v21[0] = CFSTR("eventType");
  v21[1] = CFSTR("actionType");
  v22[0] = CFSTR("playActivity");
  v22[1] = CFSTR("stop");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", CFSTR("playStop"), v6, v8);

  v9 = objc_opt_class();
  v18[0] = CFSTR("eventType");
  v18[1] = CFSTR("actionType");
  v19[0] = CFSTR("seekActivity");
  v19[1] = CFSTR("start");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", CFSTR("seekStart"), v9, v11);

  v12 = objc_opt_class();
  v15[0] = CFSTR("eventType");
  v15[1] = CFSTR("actionType");
  v16[0] = CFSTR("seekActivity");
  v16[1] = CFSTR("stop");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", CFSTR("seekStop"), v12, v14);

}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (MTMediaActivityEventHandler)playStart
{
  return (MTMediaActivityEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("playStart"));
}

- (MTMediaActivityEventHandler)playStop
{
  return (MTMediaActivityEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("playStop"));
}

- (MTMediaActivityEventHandler)seekStart
{
  return (MTMediaActivityEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("seekStart"));
}

- (MTMediaActivityEventHandler)seekStop
{
  return (MTMediaActivityEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("seekStop"));
}

@end
