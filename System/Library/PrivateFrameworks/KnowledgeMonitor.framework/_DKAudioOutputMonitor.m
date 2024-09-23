@implementation _DKAudioOutputMonitor

- (_DKAudioOutputMonitor)init
{
  _DKAudioOutputMonitor *v2;
  _DKAudioOutputMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKAudioOutputMonitor;
  v2 = -[_DKMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_DKMonitor setEventComparator:](v2, "setEventComparator:", &__block_literal_global_14);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKAudioOutputMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKAudioOutputMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("DeviceAudioOutputExternal");
}

+ (id)entitlements
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
  objc_msgSend(MEMORY[0x24BE1B130], "audioOutputRoutStream");
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
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C2B8]), "initWithExternal:identifier:portType:portName:routeChangeReason:type:", v15, v12, v14, v13, v16, 2);

  return v17;
}

- (void)start
{
  AVAudioSession *v3;
  AVAudioSession *outputMonitor;
  void *v5;
  void *v6;
  void *v7;
  BMSource *v8;
  BMSource *source;
  void *v10;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  outputMonitor = self->_outputMonitor;
  self->_outputMonitor = v3;

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
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_onAudioRouteChangeNotification_, *MEMORY[0x24BDB1728], 0);

  -[_DKAudioOutputMonitor onAudioRouteChangeNotification:](self, "onAudioRouteChangeNotification:", 0);
}

- (void)deactivate
{
  void *v3;
  AVAudioSession *outputMonitor;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  outputMonitor = self->_outputMonitor;
  self->_outputMonitor = 0;

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
  void *v15;
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
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x219A29278]();
  -[AVAudioSession currentRoute](self->_outputMonitor, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__6;
    v36 = __Block_byref_object_dispose__6;
    v37 = 0;
    objc_msgSend(v7, "outputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __56___DKAudioOutputMonitor_onAudioRouteChangeNotification___block_invoke;
    v31[3] = &unk_24DA67610;
    v31[4] = &v32;
    v31[5] = &v38;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v31);

    if (v33[5])
    {
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDB1738]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v6;
      v30 = v5;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v39 + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "portType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "portName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "UID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKAudioOutputMonitor _eventWithState:type:name:identifier:routeChangeReason:](_DKAudioOutputMonitor, "_eventWithState:type:name:identifier:routeChangeReason:", v12, v13, v14, v15, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v16, 1);
      source = self->_source;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v39 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "portType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "portName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "UID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKAudioOutputMonitor _BMEventWithState:type:name:identifier:routeChangeReason:](_DKAudioOutputMonitor, "_BMEventWithState:type:name:identifier:routeChangeReason:", v18, v19, v20, v21, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMSource sendEvent:](source, "sendEvent:", v22);

      LODWORD(v18) = *((unsigned __int8 *)v39 + 24);
      objc_msgSend((id)v33[5], "portType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "portName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "UID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKAudioOutputMonitor contextValueForAudioOutputConnectionStatus:type:name:identifier:routeChangeReason:](_DKAudioOutputMonitor, "contextValueForAudioOutputConnectionStatus:type:name:identifier:routeChangeReason:", (_DWORD)v18 != 0, v23, v24, v25, v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAudioOutputDataDictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

      v6 = v29;
      v5 = v30;
    }
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }

  objc_autoreleasePoolPop(v6);
}

+ (id)contextValueForAudioOutputConnectionStatus:(BOOL)a3 type:(id)a4 name:(id)a5 identifier:(id)a6 routeChangeReason:(id)a7
{
  _BOOL8 v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v10 = a3;
  v28[5] = *MEMORY[0x24BDAC8D0];
  v11 = &unk_24DA71098;
  if (a7)
    v11 = a7;
  v12 = v11;
  v13 = (__CFString *)a6;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x24BE1B180], "audioOutputStatusKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v16;
  objc_msgSend(MEMORY[0x24BE1B180], "audioPortTypeKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  if (v15)
    v18 = v15;
  else
    v18 = &stru_24DA67840;
  v28[1] = v18;
  objc_msgSend(MEMORY[0x24BE1B180], "audioPortNameKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  if (v14)
    v20 = v14;
  else
    v20 = &stru_24DA67840;
  v28[2] = v20;
  objc_msgSend(MEMORY[0x24BE1B180], "audioIdentifierKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v21;
  if (v13)
    v22 = v13;
  else
    v22 = &stru_24DA67840;
  v28[3] = v22;
  objc_msgSend(MEMORY[0x24BE1B180], "audioRouteChangeReasonKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v23;
  v28[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_outputMonitor, 0);
}

@end
