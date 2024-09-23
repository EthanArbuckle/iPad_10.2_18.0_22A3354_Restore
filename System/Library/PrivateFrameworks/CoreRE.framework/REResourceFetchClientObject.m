@implementation REResourceFetchClientObject

- (REResourceFetchClientObject)initWithResourceFetchManager:(void *)a3 connection:(const Connection *)a4 voucher:(id)a5
{
  id v9;
  REResourceFetchClientObject *v10;
  REResourceFetchClientObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  audit_token_t v16;
  audit_token_t atoken;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)REResourceFetchClientObject;
  v10 = -[REResourceFetchClientObject init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_resourceFetchManager = a3;
    v10->_peerID = 0;
    objc_storeStrong((id *)&v10->_voucher, a5);
    if (*(_QWORD *)a4)
    {
      objc_msgSend(*(id *)a4, "auditToken");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
    }
    v12 = v19;
    *(_OWORD *)v11->_auditToken.val = v18;
    *(_OWORD *)&v11->_auditToken.val[4] = v12;
    v13 = *(_OWORD *)&v11->_auditToken.val[4];
    *(_OWORD *)atoken.val = *(_OWORD *)v11->_auditToken.val;
    *(_OWORD *)&atoken.val[4] = v13;
    v11->_pid = audit_token_to_pid(&atoken);
    v14 = *(_OWORD *)&v11->_auditToken.val[4];
    *(_OWORD *)v16.val = *(_OWORD *)v11->_auditToken.val;
    *(_OWORD *)&v16.val[4] = v14;
    v11->_pidversion = audit_token_to_pidversion(&v16);
  }

  return v11;
}

- (void)invalidate
{
  self->_resourceFetchManager = 0;
}

- (NSString)redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<pid %d (%d)>"), self->_pid, self->_pidversion);
}

- (void)resourceAtAssetPath:(id)a3 payloadDidUpdate:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  re *v10;
  re *v11;
  void *resourceFetchManager;
  REResourceFetchClientObject *v13;
  _anonymous_namespace_ *v14;
  re *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  _anonymous_namespace_ *v19;
  id v20;
  id v21[2];
  _OWORD v22[2];
  REResourceFetchClientObject *v23;
  id v24[2];
  _OWORD v25[2];
  REResourceFetchClientObject *v26;
  uint8_t buf[4];
  REResourceFetchClientObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (re *)a5;
  v11 = v10;
  if (v8)
  {
    resourceFetchManager = self->_resourceFetchManager;
    if (resourceFetchManager)
    {
      if (v10)
      {
        v13 = self;
        v26 = v13;
        v14 = (_anonymous_namespace_ *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v15 = v11;
        LOBYTE(v24[0]) = 0;
        v24[1] = v15;
        re::ResourceFetchManager::resourcePayloadDidUpdate((uint64_t)resourceFetchManager, (id *)&v26, (const re::DynamicString *)v25, v24);

        if (*(_QWORD *)&v25[0])
        {
          if ((BYTE8(v25[0]) & 1) != 0)
            (*(void (**)(void))(**(_QWORD **)&v25[0] + 40))();
          memset(v25, 0, sizeof(v25));
        }
LABEL_18:

        goto LABEL_19;
      }
      if (v9)
      {
        v13 = self;
        v23 = v13;
        v19 = (_anonymous_namespace_ *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v20 = v9;
        LOBYTE(v21[0]) = 1;
        v21[1] = v20;
        re::ResourceFetchManager::resourcePayloadDidUpdate((uint64_t)resourceFetchManager, (id *)&v23, (const re::DynamicString *)v22, v21);

        if (*(_QWORD *)&v22[0])
        {
          if ((BYTE8(v22[0]) & 1) != 0)
            (*(void (**)(void))(**(_QWORD **)&v22[0] + 40))();
          memset(v22, 0, sizeof(v22));
        }
        goto LABEL_18;
      }
      v16 = re::resourceSharingLogObjects(0)[1];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v17 = "Resource connection %@ received an invalid message: both payload and error are nil";
      goto LABEL_10;
    }
    v18 = re::resourceSharingLogObjects(v10)[1];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored a message: service was deinited", buf, 0xCu);
    }
  }
  else
  {
    v16 = re::resourceSharingLogObjects(v10)[1];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v17 = "Resource connection %@ received an invalid updated payload for a nil asset path";
LABEL_10:
      _os_log_fault_impl(&dword_224FE9000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    }
  }
LABEL_19:

}

- (void)pushLoadResourceWithAssetId:(unint64_t)a3 assetType:(id)a4 isPriorityAsset:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  re *v12;
  _QWORD *resourceFetchManager;
  REResourceFetchClientObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  REResourceFetchClientObject *v22;
  NSObject *v23;
  int v24;
  _DWORD v25[7];

  v5 = a5;
  *(_QWORD *)&v25[5] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForEntitlement:", CFSTR("com.apple.surfboard.allow-any-custom-shader"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v8)
  {
    if (a3)
    {
      resourceFetchManager = self->_resourceFetchManager;
      v14 = self;
      v15 = objc_msgSend(objc_retainAutorelease(v8), "cStringUsingEncoding:", 4);
      v16 = resourceFetchManager[32];
      if (v16)
        v17 = (id)(v16 + 8);
      v18 = -[REResourceFetchClientObject peerID](v14, "peerID");
      if (v18)
      {
        if (!v16)
        {
LABEL_17:

          goto LABEL_18;
        }
        (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8))(*(_QWORD *)v16 + 32))(v16, a3, v15, v18, v18, v11, v5);
      }
      else
      {
        v21 = re::resourceSharingLogObjects(0)[1];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v14;
          v23 = v21;
          v24 = 67109376;
          v25[0] = -[REResourceFetchClientObject pid](v22, "pid");
          LOWORD(v25[1]) = 2048;
          *(_QWORD *)((char *)&v25[1] + 2) = a3;
          _os_log_impl(&dword_224FE9000, v23, OS_LOG_TYPE_DEFAULT, "Client (pid %d) attempted to push-load asset %llu without registering a peerID.  Push load will not be initiated.", (uint8_t *)&v24, 0x12u);

        }
        if (!v16)
          goto LABEL_17;
      }

      goto LABEL_17;
    }
    v19 = re::resourceSharingLogObjects(v12)[1];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v24 = 138412290;
      *(_QWORD *)v25 = self;
      v20 = "Resource connection %@ received an invalid push load request: assetId is 0";
      goto LABEL_12;
    }
  }
  else
  {
    v19 = re::resourceSharingLogObjects(v12)[1];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v24 = 138412290;
      *(_QWORD *)v25 = self;
      v20 = "Resource connection %@ received an invalid push load request: assetType is nil";
LABEL_12:
      _os_log_fault_impl(&dword_224FE9000, v19, OS_LOG_TYPE_FAULT, v20, (uint8_t *)&v24, 0xCu);
    }
  }
LABEL_18:

}

- (void)releaseResourceWithAssetId:(unint64_t)a3
{
  _QWORD *resourceFetchManager;
  REResourceFetchClientObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  REResourceFetchClientObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  resourceFetchManager = self->_resourceFetchManager;
  v5 = self;
  v6 = resourceFetchManager[32];
  if (v6)
    v7 = (id)(v6 + 8);
  v8 = -[REResourceFetchClientObject peerID](v5, "peerID");
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v6 + 40))(v6, a3, v8);
LABEL_9:

    }
  }
  else
  {
    v9 = re::resourceSharingLogObjects(0)[1];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v5;
      v11 = v9;
      v12[0] = 67109376;
      v12[1] = -[REResourceFetchClientObject pid](v10, "pid");
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "Client (pid %d) attempted to release asset %llu without registering a peerID.  Release will not be initiated.", (uint8_t *)v12, 0x12u);

    }
    if (v6)
      goto LABEL_9;
  }

}

- (void)receiveDirectResourceCommit:(id)a3
{
  void *resourceFetchManager;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  REResourceFetchClientObject **v11;
  uint64_t v12;
  REResourceFetchClientObject *v13;
  REResourceFetchClientObject *v14;

  resourceFetchManager = self->_resourceFetchManager;
  v5 = a3;
  v13 = self;
  v14 = v13;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)resourceFetchManager + 4));
  os_unfair_lock_lock((os_unfair_lock_t)resourceFetchManager + 16);
  v8 = *((_QWORD *)resourceFetchManager + 33);
  if (v8)
  {
    v9 = *((_QWORD *)resourceFetchManager + 11);
    if (v9)
    {
      v10 = v9 << 6;
      v11 = (REResourceFetchClientObject **)(*((_QWORD *)resourceFetchManager + 13) + 8);
      while (*v11 != v13)
      {
        v11 += 8;
        v10 -= 64;
        if (!v10)
          goto LABEL_8;
      }
      v12 = re::directMeshConnectionId((void **)&v14);
      (*(void (**)(uint64_t, id, uint64_t))(*(_QWORD *)v8 + 48))(v8, v7, v12);
    }
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)resourceFetchManager + 16);

}

- (void)receiveReferenceObject:(id)a3
{
  void *resourceFetchManager;
  id v5;
  REResourceFetchClientObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  REResourceFetchClientObject **v12;
  id v13;

  resourceFetchManager = self->_resourceFetchManager;
  v5 = a3;
  v6 = self;
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)resourceFetchManager + 4));
  os_unfair_lock_lock((os_unfair_lock_t)resourceFetchManager + 16);
  v9 = *((_QWORD *)resourceFetchManager + 34);
  if (*(_QWORD *)(v9 + 56))
  {
    v10 = *((_QWORD *)resourceFetchManager + 11);
    if (v10)
    {
      v11 = v10 << 6;
      v12 = (REResourceFetchClientObject **)(*((_QWORD *)resourceFetchManager + 13) + 8);
      while (*v12 != v6)
      {
        v12 += 8;
        v11 -= 64;
        if (!v11)
          goto LABEL_8;
      }
      v13 = v8;
      (*(void (**)(_QWORD, id *))(**(_QWORD **)(v9 + 56) + 16))(*(_QWORD *)(v9 + 56), &v13);

    }
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)resourceFetchManager + 16);

}

- (void)associateConnectionWithPeerID:(unint64_t)a3 clientPorts:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  re::PeerIDValidator *v11;
  __int128 *v12;
  _BOOL8 v13;
  unint64_t peerID;
  NSObject *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  int pid;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  _OWORD v25[2];
  int v26;
  _BYTE buf[12];
  __int128 v28;
  __int128 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (self->_peerID)
  {
    re::internal::assertLog((re::internal *)4, v8, "assertion failure: '%s' (%s:line %i) Tried to set peer ID on a connection twice", "_peerID == 0", "-[REResourceFetchClientObject associateConnectionWithPeerID:clientPorts:]", 1199);
    _os_crash();
    __break(1u);
  }
  v9 = v7;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self->_resourceFetchManager + 4));
  *(_QWORD *)buf = a3;
  *(_DWORD *)&buf[8] = self->_pid;
  v10 = *(_OWORD *)&self->_auditToken.val[4];
  v28 = *(_OWORD *)self->_auditToken.val;
  v29 = v10;
  v30 = 0;
  v12 = re::PeerIDValidator::instance(v11);
  v13 = re::PeerIDValidator::validateOrAdd_impl(v12, (uint64_t)buf);
  if (v13)
  {
    peerID = self->_peerID;
    v15 = re::resourceSharingLogObjects((re *)v13)[1];
    if (peerID)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = a3;
        LOWORD(v28) = 2112;
        *(_QWORD *)((char *)&v28 + 2) = self;
        _os_log_fault_impl(&dword_224FE9000, v15, OS_LOG_TYPE_FAULT, "Attempted to associate peer ID %llu with resource connection %@ which already has a peer ID", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        LOWORD(v28) = 2048;
        *(_QWORD *)((char *)&v28 + 2) = a3;
        _os_log_impl(&dword_224FE9000, v15, OS_LOG_TYPE_DEFAULT, "Resource connection %@ is now associated with peer ID %llu", buf, 0x16u);
      }
      self->_peerID = a3;
      objc_storeStrong((id *)&self->_clientPorts, a4);
    }
    v16 = (_QWORD *)*((_QWORD *)self->_resourceFetchManager + 34);
    if (v16)
      v17 = v16 + 1;
    v18 = v16[10];
    if (!v18)
      goto LABEL_15;
    v19 = 48 * v18;
    v20 = (uint64_t *)(v16[12] + 40);
    do
    {
      pid = self->_pid;
      v22 = *(_OWORD *)&self->_auditToken.val[4];
      v25[0] = *(_OWORD *)self->_auditToken.val;
      v25[1] = v22;
      v23 = self->_peerID;
      v26 = pid;
      *(_QWORD *)buf = v23;
      v24 = *v20;
      v20 += 6;
      (*(void (**)(uint64_t, int *, _OWORD *, _BYTE *))(*(_QWORD *)v24 + 16))(v24, &v26, v25, buf);
      v19 -= 48;
    }
    while (v19);
    if (v16)
LABEL_15:

  }
}

- (void)decodeShaderGraph:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  REResourceFetchClientObject *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self->_resourceFetchManager + 4));
  v8 = _Block_copy(*((const void **)self->_resourceFetchManager + 37));
  if (v8)
  {
    v10 = v8;
    v11 = (void *)MEMORY[0x24BDD1988];
    v12 = *((_QWORD *)self->_resourceFetchManager + 5);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke;
    v16[3] = &unk_24ED2D570;
    v17 = v6;
    v18 = self;
    v19 = v8;
    v20 = v7;
    v13 = v7;
    v14 = v6;
    v15 = v10;
    objc_msgSend(v11, "_handoffCurrentReplyToQueue:block:", v12, v16);

  }
  else
  {
    re::internal::assertLog((re::internal *)4, v9, "assertion failure: '%s' (%s:line %i) ", "shaderGraphLoader", "-[REResourceFetchClientObject decodeShaderGraph:withReply:]", 1233);
    _os_crash();
    __break(1u);
  }
}

void __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke_2;
  v5[3] = &unk_24ED2D548;
  v5[4] = *(_QWORD *)(a1 + 40);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, id *, _QWORD *))(v2 + 16))(&v7, v2, &v6, v5);

  v3 = v8;
  if ((_BYTE)v7)
  {
    v4 = v8;
    v3 = 0;
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4, v3);

}

void __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  id v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "pendingShaderGraphs");
    v8 = (_QWORD)v21 == 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v8 = 1;
  }
  v9 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a2 ^ (a2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a2 ^ (a2 >> 30))) >> 27));
  v10 = v9 ^ (v9 >> 31);
  if (v8)
  {
    LODWORD(v11) = 0;
  }
  else
  {
    v11 = v10 % DWORD2(v22);
    v12 = *(unsigned int *)(*((_QWORD *)&v21 + 1) + 4 * v11);
    if ((_DWORD)v12 != 0x7FFFFFFF)
    {
      if (*(_QWORD *)(v22 + 32 * v12 + 16) == a2)
        goto LABEL_15;
      while (1)
      {
        v12 = *(_DWORD *)(v22 + 32 * v12 + 8) & 0x7FFFFFFF;
        if ((_DWORD)v12 == 0x7FFFFFFF)
          break;
        if (*(_QWORD *)(v22 + 32 * v12 + 16) == a2)
          goto LABEL_15;
      }
    }
  }
  v13 = DWORD1(v23);
  if (DWORD1(v23) == 0x7FFFFFFF)
  {
    v13 = v23;
    v14 = v23;
    if ((_DWORD)v23 == DWORD2(v22))
    {
      re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::setCapacity((uint64_t)&v21, 2 * HIDWORD(v22));
      v14 = v23;
      LODWORD(v11) = v10 % DWORD2(v22);
    }
    LODWORD(v23) = v14 + 1;
    v15 = v22;
    v16 = *(_DWORD *)(v22 + 32 * v13 + 8);
  }
  else
  {
    v15 = v22;
    v16 = *(_DWORD *)(v22 + 32 * DWORD1(v23) + 8);
    DWORD1(v23) = v16 & 0x7FFFFFFF;
  }
  *(_DWORD *)(v15 + 32 * v13 + 8) = v16 | 0x80000000;
  v17 = v11;
  v18 = *((_QWORD *)&v21 + 1);
  *(_DWORD *)(v22 + 32 * v13 + 8) = *(_DWORD *)(v22 + 32 * v13 + 8) & 0x80000000 | *(_DWORD *)(*((_QWORD *)&v21 + 1)
                                                                                             + 4 * v11);
  *(_QWORD *)(v22 + 32 * v13) = v10;
  *(_QWORD *)(v22 + 32 * v13 + 16) = a2;
  v19 = *a3;
  *(_QWORD *)(v22 + 32 * v13 + 24) = *a3;
  if (v19)
  {
    v20 = (id)(v19 + 8);
    v18 = *((_QWORD *)&v21 + 1);
  }
  *(_DWORD *)(v18 + 4 * v17) = v13;
  ++HIDWORD(v22);
  ++DWORD2(v23);
LABEL_15:
  re::HashTable<unsigned long long,re::SharedPtr<re::RealityFile>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::deinit((uint64_t *)&v21);
  objc_sync_exit(v6);

}

- (void)resourceFetchManager
{
  return self->_resourceFetchManager;
}

- (unint64_t)peerID
{
  return self->_peerID;
}

- (REResourceClientPorts)clientPorts
{
  return self->_clientPorts;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (int)pid
{
  return self->_pid;
}

- (int)pidversion
{
  return self->_pidversion;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[2].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (HashTable<unsigned)pendingShaderGraphs
{
  uint64_t v4;
  unsigned int *p_m_touchedEntries;
  signed int m_buckets_high;

  p_m_touchedEntries = &self[1].m_touchedEntries;
  v4 = *(_QWORD *)&self[1].m_touchedEntries;
  retstr->m_touchedEntries = 0;
  *(_OWORD *)&retstr->m_allocator = 0u;
  *(_OWORD *)&retstr->m_entries.withoutHash = 0u;
  *(_QWORD *)&retstr->m_freeList = 0x7FFFFFFFLL;
  if (v4)
  {
    if (HIDWORD(self[2].m_buckets) <= 3)
      m_buckets_high = 3;
    else
      m_buckets_high = HIDWORD(self[2].m_buckets);
    re::HashTable<re::StringID,re::DataArrayHandle<re::RigGraphNode>,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::init((uint64_t)retstr, v4, m_buckets_high);
    re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)retstr, (uint64_t)p_m_touchedEntries);
  }
  return self;
}

- (void)setPendingShaderGraphs:(HashTable<unsigned long)long
{
  HashTable<unsigned long long, re::SharedPtr<re::SharedObject>, re::Hash<uint64_t>, re::EqualTo<uint64_t>, true, false> *p_pendingShaderGraphs;
  Allocator *m_allocator;
  unsigned int m_count;

  p_pendingShaderGraphs = &self->_pendingShaderGraphs;
  if (&self->_pendingShaderGraphs != a3)
  {
    m_allocator = a3->m_allocator;
    if (p_pendingShaderGraphs->m_allocator)
    {
      if (m_allocator)
      {
        re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)&self->_pendingShaderGraphs, (uint64_t)a3);
        ++self->_pendingShaderGraphs.m_version;
      }
      else
      {
        re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::clear((uint64_t)&self->_pendingShaderGraphs);
      }
    }
    else if (m_allocator)
    {
      if (a3->m_count <= 3)
        m_count = 3;
      else
        m_count = a3->m_count;
      re::HashTable<re::StringID,re::DataArrayHandle<re::RigGraphNode>,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::init((uint64_t)&self->_pendingShaderGraphs, (uint64_t)m_allocator, m_count);
      re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)p_pendingShaderGraphs, (uint64_t)a3);
    }
  }
}

- (void).cxx_destruct
{
  re::HashTable<unsigned long long,re::SharedPtr<re::RealityFile>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::deinit((uint64_t *)&self->_pendingShaderGraphs);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_clientPorts, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 28) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_QWORD *)((char *)self + 116) = 0x7FFFFFFFLL;
  return self;
}

@end
