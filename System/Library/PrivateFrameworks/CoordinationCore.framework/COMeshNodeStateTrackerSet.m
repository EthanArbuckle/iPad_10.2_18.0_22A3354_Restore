@implementation COMeshNodeStateTrackerSet

- (COMeshNodeStateTrackerSet)init
{
  COMeshNodeStateTrackerSet *v2;
  NSDictionary *v3;
  NSDictionary *trackers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMeshNodeStateTrackerSet;
  v2 = -[COMeshNodeStateTrackerSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    trackers = v2->_trackers;
    v2->_trackers = v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNodeStateTrackerSet trackers](self, "trackers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, trackers = %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)addNodeStateTracker:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__COMeshNodeStateTrackerSet_addNodeStateTracker___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v6);

}

void __49__COMeshNodeStateTrackerSet_addNodeStateTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "trackers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setTrackers:", v5);
}

- (id)nodeStateTrackerForNode:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__COMeshNodeStateTrackerSet_nodeStateTrackerForNode___block_invoke;
  v8[3] = &unk_24D4B0BE0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __53__COMeshNodeStateTrackerSet_nodeStateTrackerForNode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "trackers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeNodeStateTrackerForNode:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__COMeshNodeStateTrackerSet_removeNodeStateTrackerForNode___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v6);

}

void __59__COMeshNodeStateTrackerSet_removeNodeStateTrackerForNode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "trackers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTrackers:", v3);

}

- (void)removeAllNodeStateTrackers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__COMeshNodeStateTrackerSet_removeAllNodeStateTrackers__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v2);
}

void __55__COMeshNodeStateTrackerSet_removeAllNodeStateTrackers__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(v1, "setTrackers:", v2);

}

- (id)nodeStateTrackersWithStatus:(int64_t)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke;
  v10[3] = &unk_24D4B3340;
  v10[4] = self;
  v12 = a3;
  v6 = v5;
  v11 = v6;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke_2;
  v3[3] = &unk_24D4B15E0;
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateNodeStateTrackersOfStatus:usingBlock:", v2, v3);

}

uint64_t __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)setNodeDormant:(id)a3 withState:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__COMeshNodeStateTrackerSet_setNodeDormant_withState_error___block_invoke;
  v12[3] = &unk_24D4B3368;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[COMeshNodeStateTrackerSet _withLock:](self, "_withLock:", v12);

}

void __60__COMeshNodeStateTrackerSet_setNodeDormant_withState_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "trackers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setStatus:", 2);
  COCoreLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "lastHeard");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "Going dormant since last heard at %@ on %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)enumerateNodeStateTrackersUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[COMeshNodeStateTrackerSet trackers](self, "trackers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersUsingBlock___block_invoke;
  v7[3] = &unk_24D4B3390;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __66__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateNodeStateTrackersOfStatus:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersOfStatus_usingBlock___block_invoke;
  v8[3] = &unk_24D4B33B8;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[COMeshNodeStateTrackerSet enumerateNodeStateTrackersUsingBlock:](self, "enumerateNodeStateTrackersUsingBlock:", v8);

}

void __75__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersOfStatus_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "status") == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSDictionary)trackers
{
  return self->_trackers;
}

- (void)setTrackers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);
}

@end
