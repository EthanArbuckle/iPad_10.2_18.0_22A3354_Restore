@implementation CONode

- (CONode)initWithRecord:(id)a3 executionContext:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  CONode *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *IDSIdentifier;
  void *v16;
  uint64_t v17;
  NSUUID *HomeKitIdentifier;
  uint64_t v19;
  COElectionInfo *v20;
  COElectionInfo *lastElectionInfoSent;
  COElectionInfo *v22;
  COElectionInfo *lastElectionInfoReceived;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CONode;
  v11 = -[CONode init](&v25, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "constituentForMe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_meConstituent, v12);
    objc_msgSend(v8, "IDSIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    IDSIdentifier = v11->_IDSIdentifier;
    v11->_IDSIdentifier = (NSString *)v14;

    objc_msgSend(v8, "HomeKitIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    HomeKitIdentifier = v11->_HomeKitIdentifier;
    v11->_HomeKitIdentifier = (NSUUID *)v17;

    objc_storeWeak((id *)&v11->_delegate, v10);
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v11->_remote, v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
        v19 = 0;
LABEL_6:
        v11->_connectionType = v19;
LABEL_7:
        v20 = objc_alloc_init(COElectionInfo);
        lastElectionInfoSent = v11->_lastElectionInfoSent;
        v11->_lastElectionInfoSent = v20;

        v22 = objc_alloc_init(COElectionInfo);
        lastElectionInfoReceived = v11->_lastElectionInfoReceived;
        v11->_lastElectionInfoReceived = v22;

        goto LABEL_8;
      }
    }
    v19 = 1;
    goto LABEL_6;
  }
LABEL_8:

  return v11;
}

- (BOOL)isInElectionState
{
  return -[CONode state](self, "state") <= 13 && -[CONode state](self, "state") > 2;
}

- (BOOL)hasOutstandingRequest
{
  int64_t v2;

  v2 = -[CONode state](self, "state");
  return v2 == 6 || v2 == 8;
}

- (void)setBackoffTimer:(id)a3
{
  OS_dispatch_source *v5;
  NSObject *v6;
  OS_dispatch_source **p_backoffTimer;
  OS_dispatch_source *backoffTimer;
  OS_dispatch_source *v9;

  v5 = (OS_dispatch_source *)a3;
  backoffTimer = self->_backoffTimer;
  p_backoffTimer = &self->_backoffTimer;
  v6 = backoffTimer;
  v9 = v5;
  if (backoffTimer != v5)
  {
    if (v6)
      dispatch_source_cancel(v6);
    objc_storeStrong((id *)p_backoffTimer, a3);
    if (*p_backoffTimer)
      dispatch_resume((dispatch_object_t)*p_backoffTimer);
  }

}

- (int64_t)state
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __15__CONode_state__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CONode _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __15__CONode_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)setState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __19__CONode_setState___block_invoke;
  v3[3] = &unk_24D4B2FF0;
  v3[4] = self;
  v3[5] = a3;
  -[CONode _withLock:](self, "_withLock:", v3);
}

uint64_t __19__CONode_setState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(result + 40);
  return result;
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
  v6[2] = __28__CONode_setMemberSnapshot___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CONode _withLock:](self, "_withLock:", v6);

}

void __28__CONode_setMemberSnapshot___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
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
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __24__CONode_memberSnapshot__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CONode _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COClusterMemberRoleSnapshot *)v2;
}

void __24__CONode_memberSnapshot__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setRemote:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __20__CONode_setRemote___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CONode _withLock:](self, "_withLock:", v6);

}

void __20__CONode_setRemote___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (COConstituent)remote
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
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __16__CONode_remote__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CONode _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COConstituent *)v2;
}

void __16__CONode_remote__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSUUID)HomeKitIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__CONode_HomeKitIdentifier__block_invoke;
  v9[3] = &unk_24D4B07E0;
  v9[4] = self;
  v9[5] = &v10;
  -[CONode _withLock:](self, "_withLock:", v9);
  v4 = (void *)v11[5];
  if (!v4)
  {
    -[CONode delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "reconcileNode");
      v8[0] = v3;
      v8[1] = 3221225472;
      v8[2] = __27__CONode_HomeKitIdentifier__block_invoke_2;
      v8[3] = &unk_24D4B07E0;
      v8[4] = self;
      v8[5] = &v10;
      -[CONode _withLock:](self, "_withLock:", v8);
    }

    v4 = (void *)v11[5];
  }
  v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (NSUUID *)v6;
}

void __27__CONode_HomeKitIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __27__CONode_HomeKitIdentifier__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setHomeKitIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__CONode_setHomeKitIdentifier___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CONode _withLock:](self, "_withLock:", v6);

}

void __31__CONode_setHomeKitIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)discoveryRecordAdded:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a3;
  -[CONode HomeKitIdentifier](self, "HomeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __31__CONode_discoveryRecordAdded___block_invoke;
    v7[3] = &unk_24D4B0858;
    v7[4] = self;
    v8 = v6;
    -[CONode _withLock:](self, "_withLock:", v7);

  }
  v5 = -[CONode discoveryType](self, "discoveryType");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 |= 2uLL;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 |= 1uLL;
      if (!-[CONode connectionType](self, "connectionType"))
        -[CONode setConnectionType:](self, "setConnectionType:", 1);
    }
  }
  -[CONode setDiscoveryType:](self, "setDiscoveryType:", v5);

}

void __31__CONode_discoveryRecordAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "HomeKitIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)discoveryRecordRemoved:(id)a3
{
  if (objc_msgSend(a3, "producesElectionCapableTransport"))
    -[CONode _resetElectionRelatedInformation](self, "_resetElectionRelatedInformation");
}

- (BOOL)isActive
{
  return -[CONode state](self, "state") > 4;
}

- (void)resetBackoffInformation
{
  -[CONode setBackoffResponse:](self, "setBackoffResponse:", 0);
  -[CONode setLastElectionInfoReceived:](self, "setLastElectionInfoReceived:", 0);
  -[CONode setLastElectionInfoSent:](self, "setLastElectionInfoSent:", 0);
  -[CONode setBackoffBucket:](self, "setBackoffBucket:", 0);
}

- (void)_resetElectionRelatedInformation
{
  -[CONode setLastElectionInfoSent:](self, "setLastElectionInfoSent:", 0);
  -[CONode setLastElectionInfoReceived:](self, "setLastElectionInfoReceived:", 0);
  -[CONode setOutstandingProbe:](self, "setOutstandingProbe:", 0);
  -[CONode setPendingPing:](self, "setPendingPing:", 0);
  -[CONode setDiscoveryType:](self, "setDiscoveryType:", 0);
  -[CONode setConnectionType:](self, "setConnectionType:", 0);
  -[CONode resetBackoffInformation](self, "resetBackoffInformation");
}

+ (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return 0;
  else
    return off_24D4B3010[a3];
}

+ (id)statusFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
    return CFSTR("UNKNOWN");
  else
    return off_24D4B3088[a3];
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

- (CONodeDelegate)delegate
{
  return (CONodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (COConstituent)meConstituent
{
  return self->_meConstituent;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (COElectionInfo)lastElectionInfoSent
{
  return self->_lastElectionInfoSent;
}

- (void)setLastElectionInfoSent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (COElectionInfo)lastElectionInfoReceived
{
  return self->_lastElectionInfoReceived;
}

- (void)setLastElectionInfoReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)lastHeard
{
  return self->_lastHeard;
}

- (void)setLastHeard:(double)a3
{
  self->_lastHeard = a3;
}

- (BOOL)hasOutstandingProbe
{
  return self->_outstandingProbe;
}

- (void)setOutstandingProbe:(BOOL)a3
{
  self->_outstandingProbe = a3;
}

- (BOOL)hasPendingPing
{
  return self->_pendingPing;
}

- (void)setPendingPing:(BOOL)a3
{
  self->_pendingPing = a3;
}

- (unint64_t)backoffBucket
{
  return self->_backoffBucket;
}

- (void)setBackoffBucket:(unint64_t)a3
{
  self->_backoffBucket = a3;
}

- (OS_dispatch_source)backoffTimer
{
  return self->_backoffTimer;
}

- (unint64_t)totalBackedOffTime
{
  return self->_totalBackedOffTime;
}

- (void)setTotalBackedOffTime:(unint64_t)a3
{
  self->_totalBackedOffTime = a3;
}

- (id)backoffResponse
{
  return self->_backoffResponse;
}

- (void)setBackoffResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backoffResponse, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_lastElectionInfoReceived, 0);
  objc_storeStrong((id *)&self->_lastElectionInfoSent, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_meConstituent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_memberSnapshot, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
}

@end
