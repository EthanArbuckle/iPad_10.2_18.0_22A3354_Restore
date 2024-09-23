@implementation _DKAudioInputMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKAudioInputMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKAudioInputMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("DeviceAudioInputExternal");
}

+ (id)entitlement
{
  return 0;
}

+ (id)_eventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = &unk_24DA71098;
  if (a7)
    v14 = a7;
  v15 = v14;
  v16 = a3;
  objc_msgSend(MEMORY[0x24BE1B028], "portType");
  v17 = objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v30[0] = v11;
  objc_msgSend(MEMORY[0x24BE1B028], "portName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  v30[1] = v12;
  objc_msgSend(MEMORY[0x24BE1B028], "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v19;
  v30[2] = v13;
  objc_msgSend(MEMORY[0x24BE1B028], "routeChangeReason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v30[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v17) = objc_msgSend(v16, "BOOLValue");
  if ((v17 & 1) != 0)
    objc_msgSend(MEMORY[0x24BE1B030], "external");
  else
    objc_msgSend(MEMORY[0x24BE1B030], "internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "audioInputRouteStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "eventWithStream:startDate:endDate:value:metadata:", v24, v25, v26, v22, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_BMEventWithState:(id)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  if (objc_msgSend(v11, "intValue"))
  {
    if (objc_msgSend(v11, "intValue") == 1)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v11, "intValue") == 2)
    {
      v16 = 2;
    }
    else if (objc_msgSend(v11, "intValue") == 3)
    {
      v16 = 3;
    }
    else if (objc_msgSend(v11, "intValue") == 4)
    {
      v16 = 4;
    }
    else if (objc_msgSend(v11, "intValue") == 6)
    {
      v16 = 5;
    }
    else if (objc_msgSend(v11, "intValue") == 7)
    {
      v16 = 6;
    }
    else if (objc_msgSend(v11, "intValue") == 8)
    {
      v16 = 7;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C2B8]), "initWithExternal:identifier:portType:portName:routeChangeReason:type:", v15, v12, v14, v13, v16, 1);

  return v17;
}

- (void)start
{
  AVAudioSession *v3;
  AVAudioSession *inputMonitor;
  void *v5;
  void *v6;
  void *v7;
  BMSource *v8;
  BMSource *source;
  id v10;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  inputMonitor = self->_inputMonitor;
  self->_inputMonitor = v3;

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Audio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (BMSource *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  self->_source = v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_onAudioRouteChangeNotification_, *MEMORY[0x24BDB1728], 0);

}

- (void)deactivate
{
  void *v3;
  AVAudioSession *inputMonitor;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  inputMonitor = self->_inputMonitor;
  self->_inputMonitor = 0;

}

- (void)onAudioRouteChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BMSource *source;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x219A29278]();
  -[AVAudioSession currentRoute](self->_inputMonitor, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    v35 = 0;
    objc_msgSend(v7, "inputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __55___DKAudioInputMonitor_onAudioRouteChangeNotification___block_invoke;
    v29[3] = &unk_24DA67610;
    v29[4] = &v30;
    v29[5] = &v36;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v29);

    if (v31[5])
    {
      v25 = v6;
      v26 = v5;
      v28 = v4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v37 + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "portType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "portName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "UID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BDB1738];
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDB1738]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKAudioInputMonitor _eventWithState:type:name:identifier:routeChangeReason:](_DKAudioInputMonitor, "_eventWithState:type:name:identifier:routeChangeReason:", v10, v11, v12, v13, v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v27, 1);
      source = self->_source;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v37 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "portType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "portName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "UID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKAudioInputMonitor _BMEventWithState:type:name:identifier:routeChangeReason:](_DKAudioInputMonitor, "_BMEventWithState:type:name:identifier:routeChangeReason:", v18, v19, v20, v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMSource sendEvent:](source, "sendEvent:", v24);

      v4 = v28;
      v6 = v25;
      v5 = v26;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMonitor, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
