@implementation LiveFSVolumeManager

- (id)initServiceProxyObjectWithDelegate:(id)a3
{
  id v5;
  LiveFSVolumeManager *v6;
  LiveFSVolumeManager *v7;
  uint64_t v8;
  NSMutableDictionary *listeners;
  uint64_t v10;
  NSMutableDictionary *descriptions;
  uint64_t v12;
  NSCondition *l;
  LiveFSVolumeManager *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSVolumeManager;
  v6 = -[LiveFSVolumeManager init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  objc_storeStrong((id *)&v6->delegate, a3);
  v8 = objc_opt_new();
  listeners = v7->listeners;
  v7->listeners = (NSMutableDictionary *)v8;

  v10 = objc_opt_new();
  descriptions = v7->descriptions;
  v7->descriptions = (NSMutableDictionary *)v10;

  v12 = objc_opt_new();
  l = v7->l;
  v7->l = (NSCondition *)v12;

  v7->_initDone = 0;
  if (!v7->l)
    goto LABEL_6;
  if (v7->listeners && v7->descriptions)
LABEL_5:
    v14 = v7;
  else
LABEL_6:
    v14 = 0;

  return v14;
}

- (void)dealloc
{
  NSMutableDictionary *listeners;
  NSCondition *l;
  NSMutableDictionary *descriptions;
  LiveFSVolumeManagerDelegate *delegate;
  objc_super v7;

  listeners = self->listeners;
  self->listeners = 0;

  l = self->l;
  self->l = 0;

  descriptions = self->descriptions;
  self->descriptions = 0;

  delegate = self->delegate;
  self->delegate = 0;

  v7.receiver = self;
  v7.super_class = (Class)LiveFSVolumeManager;
  -[LiveFSVolumeManager dealloc](&v7, sel_dealloc);
}

+ (id)newServiceProxyObjectWithDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initServiceProxyObjectWithDelegate:", v4);

  return v5;
}

- (void)initializationFinished
{
  self->_initDone = 1;
}

- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 queue:(id)a6 proxy:(id)a7 description:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[NSCondition lock](self->l, "lock");
  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    getNSErrorFromLiveFSErrno(17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = -[anonymousDaemon initUsingInterface:clientClass:queue:andProxy:]([anonymousDaemon alloc], "initUsingInterface:clientClass:queue:andProxy:", v15, a5, v16, v17);
    -[NSMutableDictionary setObject:forKey:](self->listeners, "setObject:forKey:", v21, v14);
    -[NSMutableDictionary setObject:forKey:](self->descriptions, "setObject:forKey:", v18, v14);

    v20 = 0;
  }
  -[NSCondition unlock](self->l, "unlock");

  return v20;
}

- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 andProxy:(id)a6 withDescription:(id)a7
{
  return -[LiveFSVolumeManager addVolume:usingInterface:connectionClass:queue:proxy:description:](self, "addVolume:usingInterface:connectionClass:queue:proxy:description:", a3, a4, a5, 0, a6, a7);
}

- (id)getUniqueVolumeName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    v7 = 1;
    v8 = v4;
    do
    {
      objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %llu"), v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      ++v7;
      -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v6;
    }
    while (v9);
  }

  return v6;
}

- (id)addVolumeCluster:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSCondition lock](self->l, "lock");
  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 17, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->descriptions, "setObject:forKey:", CFSTR("volumeCluster"), v4);
  }
  -[NSCondition unlock](self->l, "unlock");

  return v5;
}

- (id)removeVolumeCluster:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *descriptions;
  id v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSMutableDictionary *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  descriptions = self->descriptions;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __43__LiveFSVolumeManager_removeVolumeCluster___block_invoke;
  v18 = &unk_24F64C3C8;
  v7 = v4;
  v19 = v7;
  v20 = v5;
  -[NSMutableDictionary keysOfEntriesPassingTest:](descriptions, "keysOfEntriesPassingTest:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->descriptions;
    *(_DWORD *)buf = 136315906;
    v22 = "-[LiveFSVolumeManager removeVolumeCluster:]";
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_22BD61000, v9, OS_LOG_TYPE_DEFAULT, "%s Got cluster prefix '%@' and clusterVolumes %@ from volumes %@", buf, 0x2Au);
  }

  if (objc_msgSend(v8, "count", v15, v16, v17, v18)
    || (-[NSMutableDictionary objectForKey:](self->descriptions, "objectForKey:", v7),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    livefs_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[LiveFSVolumeManager removeVolumeCluster:]";
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_22BD61000, v12, OS_LOG_TYPE_DEFAULT, "%s err (%@)", buf, 0x16u);
    }

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->descriptions, "removeObjectForKey:", v7);
    v11 = 0;
  }

  return v11;
}

BOOL __43__LiveFSVolumeManager_removeVolumeCluster___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    v5 = (unint64_t)objc_msgSend(v4, "length") > *(_QWORD *)(a1 + 40);
  else
    v5 = 0;

  return v5;
}

- (void)removeVolumeLocked:(id)a3
{
  NSMutableDictionary *descriptions;
  id v5;

  descriptions = self->descriptions;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](descriptions, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->listeners, "removeObjectForKey:", v5);

}

- (void)removeVolume:(id)a3
{
  NSCondition *l;
  id v5;

  l = self->l;
  v5 = a3;
  -[NSCondition lock](l, "lock");
  -[LiveFSVolumeManager removeVolumeLocked:](self, "removeVolumeLocked:", v5);

  -[NSCondition unlock](self->l, "unlock");
}

- (id)descriptionForVolume:(id)a3
{
  NSCondition *l;
  id v5;
  void *v6;

  l = self->l;
  v5 = a3;
  -[NSCondition lock](l, "lock");
  -[NSMutableDictionary objectForKey:](self->descriptions, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCondition unlock](self->l, "unlock");
  return v6;
}

- (void)listVolumes:(id)a3
{
  NSCondition *l;
  void (**v5)(id, NSMutableDictionary *);

  l = self->l;
  v5 = (void (**)(id, NSMutableDictionary *))a3;
  -[NSCondition lock](l, "lock");
  v5[2](v5, self->descriptions);

  -[NSCondition unlock](self->l, "unlock");
}

- (void)listenerForVolume:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[NSCondition lock](self->l, "lock");
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _os_log_impl(&dword_22BD61000, v8, OS_LOG_TYPE_DEFAULT, "Getting listener for volume: %s", buf, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "listener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "listener");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "endpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7[2](v7, v13, 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    if (self->_initDone)
    {
      v15 = *MEMORY[0x24BDD0B88];
      v23 = *MEMORY[0x24BDD0CB8];
      v24 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = v15;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v19 = *MEMORY[0x24BDD1128];
      v21 = *MEMORY[0x24BDD0CB8];
      v22 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = v19;
      v18 = 35;
    }
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v20);

  }
  -[NSCondition unlock](self->l, "unlock");

}

- (void)LiveMountEjectVolumeCluster:(id)a3 withFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  uint64_t v11;
  NSMutableDictionary *descriptions;
  uint64_t v13;
  id v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  NSObject *v16;
  NSMutableDictionary *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[7];
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  dispatch_group_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  __int128 v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSCondition lock](self->l, "lock");
    v10 = v8;
    v11 = objc_msgSend(v10, "length");
    descriptions = self->descriptions;
    v13 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke;
    v30[3] = &unk_24F64C3C8;
    v14 = v10;
    v31 = v14;
    v32 = v11;
    -[NSMutableDictionary keysOfEntriesPassingTest:](descriptions, "keysOfEntriesPassingTest:", v30);
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    livefs_std_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->descriptions;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "-[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v34 = v15;
      LOWORD(v35) = 2112;
      *(_QWORD *)((char *)&v35 + 2) = v17;
      WORD5(v35) = 1024;
      HIDWORD(v35) = v6;
      _os_log_impl(&dword_22BD61000, v16, OS_LOG_TYPE_DEFAULT, "%s Got cluster prefix '%@' and clusterVolumes %@ from volumes %@ eject how %u", buf, 0x30u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__1;
    *(_QWORD *)&v35 = __Block_byref_object_dispose__1;
    *((_QWORD *)&v35 + 1) = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__1;
    v28 = __Block_byref_object_dispose__1;
    v18 = 0;
    v29 = dispatch_group_create();
    while (objc_msgSend(v15, "count") > v18)
    {
      dispatch_group_enter((dispatch_group_t)v25[5]);
      ++v18;
    }
    -[NSCondition unlock](self->l, "unlock");
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_109;
    v22[3] = &unk_24F64C418;
    v23 = v6;
    v22[4] = self;
    v22[5] = buf;
    v22[6] = &v24;
    objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 1, v22);
    dispatch_group_wait((dispatch_group_t)v25[5], 0xFFFFFFFFFFFFFFFFLL);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v9[2](v9);
    }
    else
    {
      -[NSCondition lock](self->l, "lock");
      -[LiveFSVolumeManager removeVolumeCluster:](self, "removeVolumeCluster:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v20;

      -[NSCondition unlock](self->l, "unlock");
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:].cold.1((uint64_t)v14, (uint64_t)&buf[8]);
        ((void (*)(void (**)(_QWORD), _QWORD))v9[2])(v9, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }
      else
      {
        -[LiveFSVolumeManagerDelegate LiveMountService:ejectVolumeCluster:withFlags:reply:](self->delegate, "LiveMountService:ejectVolumeCluster:withFlags:reply:", self, v14, v6, v9);
      }
    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 45, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD), void *))v9[2])(v9, v19);

  }
}

BOOL __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    v5 = (unint64_t)objc_msgSend(v4, "length") > *(_QWORD *)(a1 + 40);
  else
    v5 = 0;

  return v5;
}

void __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  v8 = *(unsigned int *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_2;
  v10[3] = &unk_24F64C3F0;
  v10[4] = v6;
  v11 = v3;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = v3;
  objc_msgSend(v7, "LiveMountService:ejectVolume:named:withFlags:reply:", v6, v5, v9, v8, v10);

}

void __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  else
    objc_msgSend(*(id *)(a1 + 32), "removeVolume:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (void)ejectVolume:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  LiveFSVolumeManagerDelegate *delegate;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, void *);

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[NSCondition lock](self->l, "lock");
  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[NSMutableDictionary objectForKey:](self->descriptions, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v15 && objc_msgSend(v15, "isEqualToString:", CFSTR("volumeCluster")))
    {
      -[NSCondition unlock](self->l, "unlock");
      -[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:](self, "LiveMountEjectVolumeCluster:withFlags:reply:", v8, v6, v9);
    }
    else
    {
      getNSErrorFromLiveFSErrno(2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v16);

      -[NSCondition unlock](self->l, "unlock");
    }
    goto LABEL_10;
  }
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "proxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCondition unlock](self->l, "unlock");
    delegate = self->delegate;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __52__LiveFSVolumeManager_ejectVolume_usingFlags_reply___block_invoke;
    v17[3] = &unk_24F64C440;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    -[LiveFSVolumeManagerDelegate LiveMountService:ejectVolume:named:withFlags:reply:](delegate, "LiveMountService:ejectVolume:named:withFlags:reply:", self, v12, v18, v6, v17);

LABEL_10:
    goto LABEL_11;
  }
  getNSErrorFromLiveFSErrno(45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v14);

  -[NSCondition unlock](self->l, "unlock");
LABEL_11:

}

void __52__LiveFSVolumeManager_ejectVolume_usingFlags_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "removeVolume:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, void *))a6;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LiveFSVolumeManagerDelegate LiveMountService:sharesAtServer:credentialType:credential:reply:](self->delegate, "LiveMountService:sharesAtServer:credentialType:credential:reply:", self, v13, a4, v10, v11);
  }
  else
  {
    getNSErrorFromLiveFSErrno(45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);

  }
}

- (void)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  int v17;
  LiveFSVolumeManagerDelegate *delegate;
  void *v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, void *);

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  -[NSCondition lock](self->l, "lock");
  -[NSMutableDictionary objectForKey:](self->descriptions, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = 17;
LABEL_7:
    getNSErrorFromLiveFSErrno(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v19);

    goto LABEL_8;
  }
  if (!self->delegate || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = 45;
    goto LABEL_7;
  }
  -[NSCondition unlock](self->l, "unlock");
  delegate = self->delegate;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__LiveFSVolumeManager_addVolume_atServer_credentialType_credential_reply___block_invoke;
  v20[3] = &unk_24F64C440;
  v20[4] = self;
  v21 = v12;
  v22 = v15;
  -[LiveFSVolumeManagerDelegate LiveMountService:addVolume:atServer:credentialType:credential:reply:](delegate, "LiveMountService:addVolume:atServer:credentialType:credential:reply:", self, v21, v13, a5, v14, v20);
  -[NSCondition lock](self->l, "lock");

LABEL_8:
  -[NSCondition unlock](self->l, "unlock");

}

void __74__LiveFSVolumeManager_addVolume_atServer_credentialType_credential_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "lock");
    objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 32), "unlock");
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)addDisk:(id)a3 fileSystemType:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LiveFSVolumeManagerDelegate LiveMountService:addDisk:fileSystemType:reply:](self->delegate, "LiveMountService:addDisk:fileSystemType:reply:", self, v11, v8, v9);
  }
  else
  {
    getNSErrorFromLiveFSErrno(45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10, 0);

  }
}

- (void)ejectDisk:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, id);
  void *v10;
  LiveFSVolumeManagerDelegate *delegate;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    v19 = 0;
    getNSErrorFromLiveFSErrno(19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCondition lock](self->l, "lock");
    delegate = self->delegate;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__LiveFSVolumeManager_ejectDisk_usingFlags_reply___block_invoke;
    v13[3] = &unk_24F64BF38;
    v13[4] = &v14;
    -[LiveFSVolumeManagerDelegate LiveMountService:ejectDisk:usingFlags:reply:](delegate, "LiveMountService:ejectDisk:usingFlags:reply:", self, v8, v6, v13);
    v12 = (id)v15[5];

    -[NSCondition unlock](self->l, "unlock");
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    getNSErrorFromLiveFSErrno(45);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9[2](v9, v12);

}

void __50__LiveFSVolumeManager_ejectDisk_usingFlags_reply___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (id)volumeProxyForVolume:(id)a3
{
  NSCondition *l;
  id v5;
  void *v6;
  void *v7;

  l = self->l;
  v5 = a3;
  -[NSCondition lock](l, "lock");
  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[NSCondition unlock](self->l, "unlock");

  return v7;
}

- (void)credentialTypes:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x24BDBD1A8]);
}

- (void)addVolume:(id)a3 listener:(id)a4 description:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSCondition *l;
  void (**v14)(id, void *);
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  anonymousDaemon *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  l = self->l;
  v14 = (void (**)(id, void *))a6;
  -[NSCondition lock](l, "lock");
  livefs_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[LiveFSVolumeManager addVolume:listener:description:reply:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  -[NSMutableDictionary objectForKey:](self->listeners, "objectForKey:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    getNSErrorFromLiveFSErrno(17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = -[anonymousDaemon initWithListener:]([anonymousDaemon alloc], "initWithListener:", v11);
    -[NSMutableDictionary setObject:forKey:](self->listeners, "setObject:forKey:", v25, v10);
    -[NSMutableDictionary setObject:forKey:](self->descriptions, "setObject:forKey:", v12, v10);

    v24 = 0;
  }
  -[NSCondition unlock](self->l, "unlock");
  v14[2](v14, v24);

}

- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;

  v7 = a5;
  v13 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LiveFSVolumeManagerDelegate LiveMountService:unlockVolume:password:saveToKeychain:completionHandler:](self->delegate, "LiveMountService:unlockVolume:password:saveToKeychain:completionHandler:", self, v13, v10, v7, v11);
  }
  else
  {
    getNSErrorFromLiveFSErrno(45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v12);

  }
}

- (void)uniqueNameForName:(id)a3 reply:(id)a4
{
  NSCondition *l;
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;

  l = self->l;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = a3;
  -[NSCondition lock](l, "lock");
  -[LiveFSVolumeManager getUniqueVolumeName:](self, "getUniqueVolumeName:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSCondition unlock](self->l, "unlock");
  v7[2](v7, v9, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->l, 0);
  objc_storeStrong((id *)&self->descriptions, 0);
  objc_storeStrong((id *)&self->listeners, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

- (void)LiveMountEjectVolumeCluster:(uint64_t)a1 withFlags:(uint64_t)a2 reply:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v3 = 136315650;
  v4 = "-[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = v2;
  _os_log_error_impl(&dword_22BD61000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s Error deleting volume cluster (%@): %@", (uint8_t *)&v3, 0x20u);
}

- (void)addVolume:(uint64_t)a3 listener:(uint64_t)a4 description:(uint64_t)a5 reply:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_22BD61000, a1, a3, "%s: start.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
