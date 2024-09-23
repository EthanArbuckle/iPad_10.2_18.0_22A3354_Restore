@implementation IMThreadSafeBalloonPluginMap

- (id)pluginForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1A200AD94;
  v16 = sub_1A200AC3C;
  v17 = 0;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1FFE530;
  block[3] = &unk_1E471F520;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)updateWithMap:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  IMThreadSafeBalloonPluginMap *v9;

  v4 = a3;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200C6C8;
  block[3] = &unk_1E471E7C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)setPlugin:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200BE10;
  block[3] = &unk_1E471F668;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(v8, block);

}

- (unint64_t)pluginCount
{
  return self->_pluginCount;
}

- (IMThreadSafeBalloonPluginMap)initWithConcurrentDataQueue:(id)a3
{
  id v5;
  IMThreadSafeBalloonPluginMap *v6;
  uint64_t v7;
  NSMutableDictionary *map;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMThreadSafeBalloonPluginMap;
  v6 = -[IMThreadSafeBalloonPluginMap init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    map = v6->_map;
    v6->_map = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_dataQueue, a3);
  }

  return v6;
}

- (NSDictionary)dictionaryMapCopy
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1A200AD94;
  v11 = sub_1A200AC3C;
  v12 = 0;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A200C3B0;
  v6[3] = &unk_1E471F4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSArray)allPlugins
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1A200AD94;
  v11 = sub_1A200AC3C;
  v12 = 0;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A200C8A8;
  v6[3] = &unk_1E471F4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)allIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1A200AD94;
  v11 = sub_1A200AC3C;
  v12 = 0;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A200C720;
  v6[3] = &unk_1E471F4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)removePluginWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A206527C;
  block[3] = &unk_1E471E7C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)removePluginsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  IMThreadSafeBalloonPluginMap *v9;

  v4 = a3;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A2065354;
  block[3] = &unk_1E471E7C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[IMThreadSafeBalloonPluginMap dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A206551C;
  v6[3] = &unk_1E471F4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMap:(id)a3
{
  objc_storeStrong((id *)&self->_map, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
}

@end
