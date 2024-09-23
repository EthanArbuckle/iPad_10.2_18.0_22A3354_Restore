@implementation COMeshNode

- (COMeshNode)initWithNode:(id)a3
{
  id v5;
  COMeshNode *v6;
  COMeshNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMeshNode;
  v6 = -[COMeshNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingNode, a3);

  return v7;
}

- (COMeshNode)initWithCompanionLinkClient:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  COMeshNode *v9;
  COMeshNode *v10;
  void *v11;
  uint64_t v12;
  NSString *IDSIdentifier;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *meshName;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *label;
  NSMutableDictionary *v23;
  NSMutableDictionary *counters;
  id recorder;
  uint64_t v26;
  OS_nw_activity *activity;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)COMeshNode;
  v9 = -[COMeshNode init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_source, a4);
    -[COCompanionLinkClientProtocol destinationDevice](v10->_client, "destinationDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsDeviceIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    IDSIdentifier = v10->_IDSIdentifier;
    v10->_IDSIdentifier = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      meshName = v10->_meshName;
      v10->_meshName = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      meshName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(meshName, "processName");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v10->_meshName;
      v10->_meshName = (NSString *)v19;

    }
    v21 = -[NSString copy](v10->_meshName, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    counters = v10->_counters;
    v10->_counters = v23;

    v10->_discoveryType = 0;
    v10->_connectionType = 0;
    recorder = v10->_recorder;
    v10->_recorder = &__block_literal_global_5;

    +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 1, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    activity = v10->_activity;
    v10->_activity = (OS_nw_activity *)v26;

  }
  return v10;
}

uint64_t __49__COMeshNode_initWithCompanionLinkClient_source___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (void)_setIDSIdentifier:(id)a3
{
  id v5;
  NSString **p_IDSIdentifier;
  NSString *IDSIdentifier;
  id v8;

  v5 = a3;
  if (v5)
  {
    IDSIdentifier = self->_IDSIdentifier;
    p_IDSIdentifier = &self->_IDSIdentifier;
    if (!IDSIdentifier)
    {
      v8 = v5;
      objc_storeStrong((id *)p_IDSIdentifier, a3);
      v5 = v8;
    }
  }

}

- (COConstituent)source
{
  void *v3;
  COConstituent *v4;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshNode underlyingNode](self, "underlyingNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "meConstituent");
    v4 = (COConstituent *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_source;
  }
  return v4;
}

- (COConstituent)remote
{
  void *v3;
  COConstituent *v4;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshNode underlyingNode](self, "underlyingNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remote");
    v4 = (COConstituent *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_remote;
  }
  return v4;
}

- (NSString)IDSIdentifier
{
  void *v3;
  NSString *v4;

  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshNode underlyingNode](self, "underlyingNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "IDSIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_IDSIdentifier;
  }
  return v4;
}

- (NSUUID)HomeKitIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshNode underlyingNode](self, "underlyingNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "HomeKitIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[COMeshNode client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destinationDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeKitIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[COMeshNode IDSIdentifier](self, "IDSIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[COMeshNode parent](self, "parent", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
      {
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v4; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v10);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v13, "idsDeviceIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 && !objc_msgSend(v7, "compare:options:", v14, 1))
            {
              objc_msgSend(v13, "homeKitIdentifier");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              COCoreLogForCategory(0);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                -[COMeshNode HomeKitIdentifier].cold.1();

              goto LABEL_17;
            }

          }
          v4 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v4)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }
  return (NSUUID *)v4;
}

- (void)setMemberSnapshot:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshNode_setMemberSnapshot___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMeshNode _withLock:](self, "_withLock:", v6);

}

void __32__COMeshNode_setMemberSnapshot___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v2 = objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 152), "memberSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "member");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "memberSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "member");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "member");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_6;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "memberSnapshot");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "member");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStale:", 1);

    }
LABEL_6:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "memberSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40));

    if ((v13 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "memberSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "memberSnapshot");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setStale:", 1);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setMemberSnapshot:", *(_QWORD *)(a1 + 40));
    }
    return;
  }
  objc_msgSend(*(id *)(v3 + 24), "member");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "member");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "member");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "member");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setStale:", 1);

    }
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 24);
    if (v23)
    {
      objc_msgSend(v23, "setStale:", 1);
      v22 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v22 + 24), *(id *)(a1 + 40));
  }
}

- (COClusterMemberRoleSnapshot)memberSnapshot
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshNode_memberSnapshot__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshNode _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COClusterMemberRoleSnapshot *)v2;
}

void __28__COMeshNode_memberSnapshot__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 152), "memberSnapshot");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(id *)(v3 + 24);
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }

}

- (void)setDiscoveryRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__COMeshNode_setDiscoveryRecord___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMeshNode _withLock:](self, "_withLock:", v6);

}

void __33__COMeshNode_setDiscoveryRecord___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (CODiscoveryRecord)discoveryRecord
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__COMeshNode_discoveryRecord__block_invoke;
  v4[3] = &unk_24D4B0B18;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshNode _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CODiscoveryRecord *)v2;
}

void __29__COMeshNode_discoveryRecord__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled") & 1) == 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (!v2)
    {
      +[CODiscoveryRecord discoveryRecordWithNode:](CODiscoveryRecord, "discoveryRecordWithNode:");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 32);
      *(_QWORD *)(v4 + 32) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
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
  -[COMeshNode source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode remote](self, "remote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ -> %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  COMeshNode *v4;
  COMeshNode *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  char v17;

  v4 = (COMeshNode *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
      {
        -[COMeshNode remote](self, "remote");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {

        }
        else
        {
          -[COMeshNode remote](v5, "remote");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            -[COMeshNode IDSIdentifier](self, "IDSIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[COMeshNode IDSIdentifier](v5, "IDSIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if ((v17 & 1) != 0)
              goto LABEL_11;
            goto LABEL_13;
          }
        }
      }
      -[COMeshNode source](self, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshNode source](v5, "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
      {
        -[COMeshNode remote](self, "remote");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMeshNode remote](v5, "remote");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
LABEL_11:
          v7 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {

      }
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[COMeshNode IDSIdentifier](self, "IDSIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
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

- (id)_eventIDForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[COMeshNode meshName](self, "meshName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)_commandPayloadFromRapportRepresentation:(id)a3 result:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, void *, id))a4;
  objc_msgSend(v10, "objectForKey:", CFSTR("source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("command"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v6 = v9;
    }
    else
    {
      v9 = 0;
      v6 = v8;
    }
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v5[2](v5, v7, v9);

}

- (BOOL)_validateSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[COMeshNode remote](self, "remote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v4);
    }
    else
    {
      -[COMeshNode setRemote:](self, "setRemote:", v4);
      -[COMeshNode _validateDiscoveryRecord](self, "_validateDiscoveryRecord");
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_validateDiscoveryRecord
{
  void *v3;
  CODiscoveryRecord *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CODiscoveryRecord *v8;
  NSObject *v9;
  int v10;
  COMeshNode *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  CODiscoveryRecord *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[COMeshNode remote](self, "remote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_discoveryRecord;
  -[CODiscoveryRecord constituent](v4, "constituent");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && v5 && (objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
  {
    v7 = (void *)-[CODiscoveryRecord mutableCopy](v4, "mutableCopy");
    objc_msgSend(v7, "rollConstituent:", v3);
    v8 = -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", v7);
    -[COMeshNode setDiscoveryRecord:](self, "setDiscoveryRecord:", v8);
    COCoreLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138413058;
      v11 = self;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%@ updated discovery constituent to %@ from %@ with record %@", (uint8_t *)&v10, 0x2Au);
    }

  }
}

- (id)_commandPayloadFromRapportRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  v14 = 0;
  v5 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__COMeshNode__commandPayloadFromRapportRepresentation___block_invoke;
  v8[3] = &unk_24D4B2C18;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "_commandPayloadFromRapportRepresentation:result:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__COMeshNode__commandPayloadFromRapportRepresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_validateSource:", a2))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

- (id)_serializedDataForCommand:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  objc_class *v15;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (class_getMethodImplementation(v5, sel_supportsSecureCoding)
      && class_getMethodImplementation(v5, sel_encodeWithCoder_))
    {
      COCoreLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[COMeshNode _serializedDataForCommand:].cold.2();
    }
    else
    {
      COCoreLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[COMeshNode _serializedDataForCommand:].cold.1(v5, v7);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD0E18], 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise");

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__COMeshNode__serializedDataForCommand___block_invoke;
  v13[3] = &unk_24D4B2C40;
  v13[4] = self;
  v15 = v5;
  v9 = v6;
  v14 = v9;
  -[COMeshNode _withLock:](self, "_withLock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

void __40__COMeshNode__serializedDataForCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  COMeshNodeMessageCounter *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _QWORD *v11;
  id *v12;
  id *v13;
  void (*v14)(_QWORD *, __CFString *, _QWORD *);
  id v15;
  double v16;
  void *v17;
  _QWORD *v18;
  void (*v19)(_QWORD *, __CFString *, uint64_t *);
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];
  id v27;
  _QWORD v28[3];

  objc_msgSend(*(id *)(a1 + 32), "counters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(*(Class *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (COMeshNodeMessageCounter *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(COMeshNodeMessageCounter);
    objc_msgSend(v2, "setObject:forKey:", v4, v3);
  }
  v5 = -[COMeshNodeMessageCounter count](v4, "count") + 1;
  v6 = objc_msgSend(*(id *)(a1 + 40), "length");
  v7 = -[COMeshNodeMessageCounter size](v4, "size");
  if (v5 > 0x3E7)
  {
    v16 = (double)v7;
    objc_msgSend(*(id *)(a1 + 32), "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recorder");
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __40__COMeshNode__serializedDataForCommand___block_invoke_3;
    v23 = &unk_24D4B1148;
    *(double *)&v25[1] = v16;
    v25[2] = v5;
    v12 = &v24;
    v13 = (id *)v25;
    v24 = v3;
    v25[0] = v17;
    v19 = (void (*)(_QWORD *, __CFString *, uint64_t *))v18[2];
    v15 = v17;
    v19(v18, CFSTR("com.apple.CoordinationCore.MeshNodeMessageSize"), &v20);

    -[COMeshNodeMessageCounter setCount:](v4, "setCount:", 0, v20, v21, v22, v23);
    -[COMeshNodeMessageCounter setSize:](v4, "setSize:", 0);
    goto LABEL_7;
  }
  v8 = v6 / v5 + v7 - v7 / v5;
  -[COMeshNodeMessageCounter setCount:](v4, "setCount:", v5);
  -[COMeshNodeMessageCounter setSize:](v4, "setSize:", v8);
  HIDWORD(v9) = -1030792151 * (unsigned __int16)v5;
  LODWORD(v9) = HIDWORD(v9);
  if ((v9 >> 2) <= 0x28F5C28)
  {
    objc_msgSend(*(id *)(a1 + 32), "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recorder");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __40__COMeshNode__serializedDataForCommand___block_invoke_2;
    v26[3] = &unk_24D4B1148;
    v28[1] = v8;
    v28[2] = v5;
    v12 = &v27;
    v13 = (id *)v28;
    v27 = v3;
    v28[0] = v10;
    v14 = (void (*)(_QWORD *, __CFString *, _QWORD *))v11[2];
    v15 = v10;
    v14(v11, CFSTR("com.apple.CoordinationCore.MeshNodeMessageSize"), v26);

LABEL_7:
  }

}

id __40__COMeshNode__serializedDataForCommand___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0x24D4B5658;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x24D4B5678;
  v8[3] = 0x24D4B5418;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__COMeshNode__serializedDataForCommand___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0x24D4B5658;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = 0x24D4B5678;
  v8[3] = 0x24D4B5418;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_handleResponseToRequest:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 error:(id)a6 responseCallback:(id)a7 at:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD);
  __uint64_t v19;
  int v20;
  __uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD *v49;
  void (*v50)(_QWORD *, __CFString *, _QWORD *);
  NSObject *v51;
  double v52;
  NSObject *v53;
  unint64_t v54;
  void *v55;
  _QWORD *v56;
  void (*v57)(_QWORD *, __CFString *, _QWORD *);
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;
  unint64_t v72;
  _QWORD v73[4];
  id v74;
  double v75;
  uint64_t v76;
  _QWORD v77[5];
  id v78;
  uint8_t buf[4];
  COMeshNode *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  double v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *, _QWORD))a7;
  v19 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (v17)
  {
    v20 = 0;
    goto LABEL_24;
  }
  v21 = v19;
  objc_msgSend(v15, "objectForKey:", CFSTR("response"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v22, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "acceptableResponses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke;
    v77[3] = &unk_24D4B10A8;
    v77[4] = self;
    v66 = v22;
    v78 = v66;
    v68 = v23;
    objc_msgSend(v23, "objectsPassingTest:", v77);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "anyObject");

    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[COMeshNode _commandPayloadFromRapportRepresentation:](self, "_commandPayloadFromRapportRepresentation:", v15);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v25, v67, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v26)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("overhead"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            v64 = v26;
            v27 = -[COMeshNode requestCount](self, "requestCount") + 1;
            if (v27 > 0x3E7)
            {
              -[COMeshNode averageRequestTime](self, "averageRequestTime");
              v47 = v46;
              -[COMeshNode label](self, "label");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[COMeshNode recorder](self, "recorder");
              v49 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v69[0] = MEMORY[0x24BDAC760];
              v69[1] = 3221225472;
              v69[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_2;
              v69[3] = &unk_24D4B10F8;
              v71 = v47;
              v72 = v27;
              v70 = v48;
              v50 = (void (*)(_QWORD *, __CFString *, _QWORD *))v49[2];
              v63 = v48;
              v50(v49, CFSTR("com.apple.CoordinationCore.MeshNodeLatency"), v69);

              -[COMeshNode setRequestCount:](self, "setRequestCount:", 0);
              -[COMeshNode setAverageRequestTime:](self, "setAverageRequestTime:", 0.0);
              COCoreLogForCategory(0);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                v58 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412802;
                v80 = self;
                v81 = 2112;
                v82 = v66;
                v83 = 2112;
                v84 = (uint64_t)v58;
                v59 = v58;
                _os_log_debug_impl(&dword_215E92000, v51, OS_LOG_TYPE_DEBUG, "%@ received %@ (reset timings) for %@", buf, 0x20u);

              }
              v42 = v63;
              v26 = v64;
            }
            else
            {
              objc_msgSend(v65, "doubleValue");
              v29 = ((double)(v21 - a8) - v28) / 1000000.0;
              -[COMeshNode averageRequestTime](self, "averageRequestTime");
              v31 = v30 * 1000.0;
              if (v29 <= v31)
              {
                v32 = v27;
                v29 = v31 + (v29 - v31) / (double)v27;
              }
              else
              {
                v32 = 1;
              }
              v26 = v64;
              -[COMeshNode setRequestCount:](self, "setRequestCount:", v32);
              v52 = v29 / 1000.0;
              -[COMeshNode setAverageRequestTime:](self, "setAverageRequestTime:", v52);
              COCoreLogForCategory(0);
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                v60 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138413314;
                v80 = self;
                v81 = 2112;
                v82 = v66;
                v83 = 2048;
                v84 = v32;
                v85 = 2048;
                v86 = v52;
                v87 = 2112;
                v88 = v60;
                v61 = v32;
                v62 = v60;
                _os_log_debug_impl(&dword_215E92000, v53, OS_LOG_TYPE_DEBUG, "%@ received %@ (%llu at %g ms) for %@", buf, 0x34u);

                v32 = v61;
                v26 = v64;
              }

              HIDWORD(v54) = -1030792151 * (unsigned __int16)v32;
              LODWORD(v54) = HIDWORD(v54);
              if ((v54 >> 2) > 0x28F5C28)
                goto LABEL_46;
              -[COMeshNode label](self, "label");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[COMeshNode recorder](self, "recorder");
              v56 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v73[0] = MEMORY[0x24BDAC760];
              v73[1] = 3221225472;
              v73[2] = __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_48;
              v73[3] = &unk_24D4B10F8;
              v75 = v52;
              v76 = v32;
              v74 = v55;
              v57 = (void (*)(_QWORD *, __CFString *, _QWORD *))v56[2];
              v42 = v55;
              v57(v56, CFSTR("com.apple.CoordinationCore.MeshNodeLatency"), v73);

            }
          }
          else
          {
            COCoreLogForCategory(0);
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v43 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v80 = self;
              v81 = 2112;
              v82 = v66;
              v83 = 2112;
              v84 = (uint64_t)v43;
              v44 = v42;
              v45 = v43;
              _os_log_debug_impl(&dword_215E92000, v44, OS_LOG_TYPE_DEBUG, "%@ received %@ for %@", buf, 0x20u);

              v42 = v44;
            }
          }

LABEL_46:
          objc_msgSend(v26, "_setRapportOptions:", v16);
          v18[2](v18, v26, 0);

          v20 = 0;
          v17 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      }
    }
    COCoreLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[COMeshNode _handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    goto LABEL_21;
  }
  COCoreLogForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[COMeshNode _handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0;
LABEL_23:

  if (!v17)
    goto LABEL_34;
LABEL_24:
  -[COMeshNode remote](self, "remote");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 || objc_msgSend(v17, "code") != -6714)
  {

    goto LABEL_29;
  }
  objc_msgSend(v17, "domain");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BE7CC90]);

  if ((v37 & 1) == 0)
  {
LABEL_29:
    COCoreLogForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v80 = self;
      v81 = 2112;
      v82 = v17;
      v83 = 2112;
      v84 = (uint64_t)v40;
      v41 = v40;
      _os_log_error_impl(&dword_215E92000, v38, OS_LOG_TYPE_ERROR, "%@ received %@ for %@", buf, 0x20u);

    }
  }
  ((void (**)(id, void *, id))v18)[2](v18, 0, v17);
  if (v20)
  {
    -[COMeshNode parent](self, "parent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_invalidateAndReintroduceNode:", self);

  }
LABEL_34:

}

uint64_t __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_eventIDForClass:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));
  *a3 = v6;

  return v6;
}

id __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_48(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0x24D4B5638;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = 0x24D4B5418;
  v4 = *(_QWORD *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __95__COMeshNode__handleResponseToRequest_rapportRepresentation_options_error_responseCallback_at___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0x24D4B5638;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = 0x24D4B5618;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = 0x24D4B5418;
  v4 = *(_QWORD *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, v0, v1, "%@ activating", v2);
  OUTLINED_FUNCTION_2_0();
}

void __22__COMeshNode_activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __22__COMeshNode_activate__block_invoke_cold_1(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "didInvalidateNode:", v4);

  }
}

void __22__COMeshNode_activate__block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __22__COMeshNode_activate__block_invoke_51_cold_1(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleRPStateUpdate");

}

void __22__COMeshNode_activate__block_invoke_52(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __22__COMeshNode_activate__block_invoke_52_cold_1(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleErrorFlagsUpdate");

}

void __22__COMeshNode_activate__block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  COCoreLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __22__COMeshNode_activate__block_invoke_53_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleDisconnect");

}

void __22__COMeshNode_activate__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = a2;
  COCoreLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __22__COMeshNode_activate__block_invoke_54_cold_1(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (nw_activity_is_activated() & 1) == 0)
      nw_activity_activate();
    objc_msgSend(v6, "setLinkActivated:", 1);
    objc_msgSend(v6, "_handleActivation:", v3);

  }
}

- (void)_handleActivation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[COMeshNode linkActivated](self, "linkActivated") && !-[COMeshNode nodeActivated](self, "nodeActivated"))
  {
    -[COMeshNode setNodeActivated:](self, "setNodeActivated:", 1);
    COCoreLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[COMeshNode _handleActivation:].cold.1();

    -[COMeshNode parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
    }
    -[COMeshNode delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "node:didReceiveError:forCommand:", self, v4, 0);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "didActivateNode:", self);
    }

  }
LABEL_14:

}

- (void)_handleRPStateUpdate
{
  void *v3;
  int v4;

  -[COMeshNode client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usingOnDemandConnection");

  if (v4)
    -[COMeshNode _handleRPIsUsingOnDemandConnection](self, "_handleRPIsUsingOnDemandConnection");
}

- (void)_handleRPIsUsingOnDemandConnection
{
  NSObject *v3;
  int v4;
  COMeshNode *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%@ link (IP) connected", (uint8_t *)&v4, 0xCu);
  }

  -[COMeshNode setConnectionType:](self, "setConnectionType:", 2);
}

- (void)_handleErrorFlagsUpdate
{
  void *v3;
  __int16 v4;

  -[COMeshNode client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "errorFlags");

  if ((v4 & 0x200) != 0)
    -[COMeshNode _handleDisconnect](self, "_handleDisconnect");
}

- (void)_handleDisconnect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%@ link (IP) disconnected, triggering invalidation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t activation_time;
  double v10;
  void *v11;
  void *v12;
  id v13;

  -[COMeshNode parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_handleLostNode:", self);
  }
  else
  {
    -[COMeshNode client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInvalidationHandler:", 0);

    -[COMeshNode client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[COMeshNode activity](self, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && nw_activity_is_activated())
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      if (v7)
      {
        v8 = mach_continuous_time();
        activation_time = nw_activity_get_activation_time();
        xpc_dictionary_set_uint64(v7, "lifetime", v8 - activation_time);
        -[COMeshNode averageRequestTime](self, "averageRequestTime");
        xpc_dictionary_set_double(v7, "rtt", v10);
        xpc_dictionary_set_uint64(v7, "requests", -[COMeshNode requestCount](self, "requestCount"));
        -[COMeshNode remote](self, "remote");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          xpc_dictionary_set_uint64(v7, "nodeType", objc_msgSend(v11, "type"));
          xpc_dictionary_set_uint64(v7, "nodeFlags", objc_msgSend(v12, "flags"));
        }
        xpc_dictionary_set_uint64(v7, "transport_type", 0);
        nw_activity_submit_metrics();

      }
      nw_activity_complete_with_reason();

    }
  }

}

- (void)sendMeshCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  COMeshNode *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshNode _eventIDForClass:](self, "_eventIDForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode _serializedDataForCommand:](self, "_serializedDataForCommand:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("source");
  v7 = (void *)MEMORY[0x24BDD1618];
  -[COMeshNode source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("command");
  v24[0] = v9;
  v24[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%@ sending %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[COMeshNode client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __30__COMeshNode_sendMeshCommand___block_invoke;
  v15[3] = &unk_24D4B2C68;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v5;
  v16 = v13;
  v14 = v4;
  v17 = v14;
  objc_msgSend(v12, "sendEventID:event:options:completion:", v13, v10, 0, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __30__COMeshNode_sendMeshCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_20;
  COCoreLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    v14 = *(void **)(a1 + 32);
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v3;
    _os_log_debug_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEBUG, "%@ sent %@ (%@)", (uint8_t *)&v15, 0x20u);

  }
  v6 = (void *)*MEMORY[0x24BE7CC90];
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v3, "code");

    if (v8 == -71148)
    {
      COCoreLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __30__COMeshNode_sendMeshCommand___block_invoke_cold_1();

      objc_msgSend(WeakRetained, "invalidate");
      goto LABEL_20;
    }
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "node:didReceiveError:forCommand:", WeakRetained, v3, *(_QWORD *)(a1 + 40));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "node:didSendCommand:", WeakRetained, *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    COCoreLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      v15 = 138412802;
      v16 = WeakRetained;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%@ received an error %@ for command %@ but no delegate to deliver", (uint8_t *)&v15, 0x20u);
    }

  }
LABEL_20:

}

- (void)sendMeshRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COMeshNode *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__COMeshNode_sendMeshRequest___block_invoke;
  v6[3] = &unk_24D4B2C90;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[COMeshNode sendMeshRequest:responseCallback:](self, "sendMeshRequest:responseCallback:", v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __30__COMeshNode_sendMeshRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v6)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "node:didReceiveError:forCommand:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 32));
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "_setSender:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v9, "node:didReceiveResponse:toRequest:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      COCoreLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v11 = v5;
        else
          v11 = v6;
        v12 = *(_QWORD *)(a1 + 32);
        v13 = 138412802;
        v14 = v8;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%@ received %@ for request %@ but no delegate to deliver", (uint8_t *)&v13, 0x20u);
      }

    }
  }

}

- (void)sendMeshRequest:(id)a3 responseCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31[2];
  uint8_t buf[4];
  COMeshNode *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshNode _serializedDataForCommand:](self, "_serializedDataForCommand:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("source");
  v8 = (void *)MEMORY[0x24BDD1618];
  -[COMeshNode source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("command");
  v39[0] = v10;
  v39[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshNode _eventIDForClass:](self, "_eventIDForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNode client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseTimeout");
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  if (v15 <= 0.0)
  {
    COCoreLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithObject:forKey:", v17, *MEMORY[0x24BE7CD18]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    COCoreLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v33 = self;
      v34 = 2114;
      v35 = v12;
      v36 = 2048;
      v37 = v15;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %{public}@ with timeout of %g", buf, 0x20u);
    }
  }

  objc_msgSend(v6, "activity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    nw_activity_activate();
  v22 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_initWeak((id *)buf, self);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke;
  v27[3] = &unk_24D4B0F90;
  objc_copyWeak(v31, (id *)buf);
  v23 = v21;
  v28 = v23;
  v24 = v6;
  v29 = v24;
  v25 = v7;
  v30 = v25;
  v31[1] = v22;
  objc_msgSend(v13, "sendRequestID:request:options:responseHandler:", v12, v11, v18, v27);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);

}

void __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  xpc_object_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_16;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    v12 = v11;
    if (v11)
    {
      xpc_dictionary_set_uint64(v11, "transport_type", 0);
      nw_activity_submit_metrics();
    }

  }
  v13 = (void *)*MEMORY[0x24BE7CC90];
  objc_msgSend(v9, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v14))
  {
    v15 = objc_msgSend(v9, "code");

    if (v15 == -71148)
    {
      COCoreLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke_cold_1();

      objc_msgSend(WeakRetained, "invalidate");
      if (*(_QWORD *)(a1 + 32))
        nw_activity_complete_with_reason();
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (*(_QWORD *)(a1 + 32))
    nw_activity_complete_with_reason();
  objc_msgSend(WeakRetained, "_handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:", *(_QWORD *)(a1 + 40), v7, v8, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
LABEL_16:

}

- (void)setRemote:(id)a3
{
  objc_storeStrong((id *)&self->_remote, a3);
}

- (COMeshNodeDelegate)delegate
{
  return (COMeshNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (COMeshLocalNode)parent
{
  return (COMeshLocalNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)linkActivated
{
  return self->_linkActivated;
}

- (void)setLinkActivated:(BOOL)a3
{
  self->_linkActivated = a3;
}

- (BOOL)nodeActivated
{
  return self->_nodeActivated;
}

- (void)setNodeActivated:(BOOL)a3
{
  self->_nodeActivated = a3;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (void)setMeshName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (double)averageRequestTime
{
  return self->_averageRequestTime;
}

- (void)setAverageRequestTime:(double)a3
{
  self->_averageRequestTime = a3;
}

- (NSMutableDictionary)counters
{
  return self->_counters;
}

- (unint64_t)discoveryType
{
  return self->_discoveryType;
}

- (void)setDiscoveryType:(unint64_t)a3
{
  self->_discoveryType = a3;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_connectionType = a3;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (CONode)underlyingNode
{
  return self->_underlyingNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNode, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_discoveryRecord, 0);
  objc_storeStrong((id *)&self->_memberSnapshot, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

- (void)HomeKitIdentifier
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_215E92000, v0, OS_LOG_TYPE_DEBUG, "%@ used fallback to get HomeKit identifier(%@)", v1, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_serializedDataForCommand:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_15(&dword_215E92000, a2, v4, "%@ does not appear to properly support secure coding which is required for all commands!", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_serializedDataForCommand:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_15(&dword_215E92000, v0, v1, "Failed to properly archive for sending: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ bad response ID (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleResponseToRequest:rapportRepresentation:options:error:responseCallback:at:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%@ no response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __22__COMeshNode_activate__block_invoke_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%@ invalidated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __22__COMeshNode_activate__block_invoke_51_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%@ link state updated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __22__COMeshNode_activate__block_invoke_52_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%@ link error flags updated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __22__COMeshNode_activate__block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  uint8_t v4[24];

  v3 = OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "%@ link (IP) disconnected", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

void __22__COMeshNode_activate__block_invoke_54_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_215E92000, v2, v3, "%@ link activated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_handleActivation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, v0, v1, "%@ finishing activation", v2);
  OUTLINED_FUNCTION_2_0();
}

void __30__COMeshNode_sendMeshCommand___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ link invalid for command %@");
  OUTLINED_FUNCTION_2_0();
}

void __47__COMeshNode_sendMeshRequest_responseCallback___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%@ link invalid for request %@");
  OUTLINED_FUNCTION_2_0();
}

@end
