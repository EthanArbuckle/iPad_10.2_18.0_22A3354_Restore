@implementation REResourceFetchServer

- (REResourceFetchServer)initWithResourceFetchManager:(void *)a3
{
  REResourceFetchServer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REResourceFetchServer;
  result = -[REResourceFetchServer init](&v5, sel_init);
  if (result)
    result->_resourceFetchManager = a3;
  return result;
}

- (void)invalidate
{
  self->_resourceFetchManager = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *resourceFetchManager;
  char *v10;
  re *v11;
  int v12;
  NSObject *v13;
  id v14;
  re *v15;
  NSObject *v16;
  REResourceFetchClientObject *v17;
  uint64_t v18;
  REResourceFetchClientObject *v19;
  REResourceFetchClientObject *v20;
  _anonymous_namespace_ *v21;
  _anonymous_namespace_ *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  unint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _anonymous_namespace_ *v38;
  uint64_t v39;
  id v41;
  _QWORD v42[4];
  REResourceFetchClientObject *v43;
  _QWORD v44[4];
  REResourceFetchClientObject *v45;
  id v46;
  uint8_t buf[16];
  __int128 v48;
  __int128 v49;
  int v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    resourceFetchManager = self->_resourceFetchManager;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = resourceFetchManager;
    _os_log_impl(&dword_224FE9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%p listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection", buf, 0xCu);
  }
  v10 = (char *)self->_resourceFetchManager;
  if (v10)
  {
    v41 = v7;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v10 + 4));
    v11 = (re *)objc_msgSend(v41, "processIdentifier");
    v12 = (int)v11;
    v13 = re::resourceSharingLogObjects(v11)[1];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_224FE9000, v13, OS_LOG_TYPE_DEFAULT, "Accepting new resource connection from client pid %d", buf, 8u);
    }
    v14 = (id)voucher_copy();

    if (v14)
    {
      v16 = re::resourceSharingLogObjects(v15)[1];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v12;
        _os_log_impl(&dword_224FE9000, v16, OS_LOG_TYPE_DEFAULT, "Successfully harvested transport voucher on resource fetch connection for pid %d", buf, 8u);
      }
      v46 = v14;
      os_unfair_lock_lock((os_unfair_lock_t)v10 + 48);
      re::ObjCObject::operator=((id *)v10 + 25, &v46);
      os_unfair_lock_unlock((os_unfair_lock_t)v10 + 48);

    }
    v17 = -[REResourceFetchClientObject initWithResourceFetchManager:connection:voucher:]([REResourceFetchClientObject alloc], "initWithResourceFetchManager:connection:voucher:", v10, &v41, v14);
    *(_QWORD *)buf = v17;
    re::xpc::Connection::setExportedObject(&v41, (const re::ObjCObject *)buf);

    re::ResourceFetchManager::xpcInterface(buf);
    re::xpc::Connection::setExportedInterface(&v41, (uint64_t *)buf);

    re::ResourceSharingManager::xpcInterface(buf);
    re::xpc::Connection::setRemoteObjectInterface(&v41, (uint64_t *)buf);

    re::xpc::Connection::setQueue(&v41, (const re::dispatch::Queue *)(v10 + 32));
    v18 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = ___ZN2re20ResourceFetchManager13addConnectionENS_3xpc10ConnectionE_block_invoke;
    v44[3] = &unk_24ED2D4C0;
    v19 = v17;
    v45 = v19;
    objc_msgSend(v41, "setInterruptionHandler:", v44);
    v42[0] = v18;
    v42[1] = 3221225472;
    v42[2] = ___ZN2re20ResourceFetchManager13addConnectionENS_3xpc10ConnectionE_block_invoke_66;
    v42[3] = &unk_24ED2D4C0;
    v20 = v19;
    v43 = v20;
    objc_msgSend(v41, "setInvalidationHandler:", v42);
    os_unfair_lock_lock((os_unfair_lock_t)v10 + 16);
    *(_QWORD *)buf = v41;
    v21 = v20;
    *(_QWORD *)&buf[8] = v21;
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v51 = 0x7FFFFFFFLL;
    v23 = *((_QWORD *)v10 + 10);
    v24 = *((_QWORD *)v10 + 11);
    if (v24 >= v23)
    {
      v25 = v24 + 1;
      if (v23 < v24 + 1)
      {
        if (*((_QWORD *)v10 + 9))
        {
          v26 = 2 * v23;
          v27 = v23 == 0;
          v28 = 8;
          if (!v27)
            v28 = v26;
          if (v28 <= v25)
            v29 = v25;
          else
            v29 = v28;
          re::DynamicArray<re::ResourceFetchManager::Connection>::setCapacity((_QWORD *)v10 + 9, v29);
        }
        else
        {
          re::DynamicArray<re::ResourceFetchManager::Connection>::setCapacity((_QWORD *)v10 + 9, v25);
          ++*((_DWORD *)v10 + 24);
        }
      }
      v24 = *((_QWORD *)v10 + 11);
    }
    v33 = *((_QWORD *)v10 + 13) + (v24 << 6);
    v34 = *(_OWORD *)buf;
    *(_OWORD *)buf = 0u;
    *(_OWORD *)v33 = v34;
    *(_QWORD *)(v33 + 24) = 0;
    *(_OWORD *)(v33 + 32) = 0u;
    *(_DWORD *)(v33 + 48) = 0;
    *(_DWORD *)(v33 + 56) = 0;
    *(_QWORD *)(v33 + 16) = v48;
    *(_QWORD *)&v48 = 0;
    v35 = *(_QWORD *)(v33 + 24);
    *(_QWORD *)(v33 + 24) = *((_QWORD *)&v48 + 1);
    *((_QWORD *)&v48 + 1) = v35;
    v36 = *(_QWORD *)(v33 + 32);
    *(_QWORD *)(v33 + 32) = v49;
    *(_QWORD *)&v49 = v36;
    LODWORD(v36) = *(_DWORD *)(v33 + 40);
    *(_DWORD *)(v33 + 40) = DWORD2(v49);
    DWORD2(v49) = v36;
    LODWORD(v36) = *(_DWORD *)(v33 + 44);
    *(_DWORD *)(v33 + 44) = HIDWORD(v49);
    HIDWORD(v49) = v36;
    LODWORD(v36) = *(_DWORD *)(v33 + 48);
    *(_DWORD *)(v33 + 48) = v50;
    v50 = v36;
    *(_DWORD *)(v33 + 52) = v51;
    LODWORD(v51) = 0x7FFFFFFF;
    ++*((_QWORD *)v10 + 11);
    ++*((_DWORD *)v10 + 24);
    re::HashTable<re::DynamicString,re::DynamicArray<re::ResourceFetchManager::Request *>,re::Hash<re::DynamicString>,re::EqualTo<re::DynamicString>,true,false>::deinit((uint64_t *)&v48);

    os_unfair_lock_unlock((os_unfair_lock_t)v10 + 16);
    v37 = *((_QWORD *)v10 + 33);
    if (v37)
    {
      v38 = v21;
      *(_QWORD *)buf = v38;
      v39 = re::directMeshConnectionId((void **)buf);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v37 + 32))(v37, v39);

    }
    objc_msgSend(v41, "resume", v41);

  }
  else
  {
    v30 = re::resourceSharingLogObjects((re *)v8)[1];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      v32 = objc_msgSend(v7, "processIdentifier");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_224FE9000, v31, OS_LOG_TYPE_ERROR, "Rejecting attempted resource connection from client pid %d: service was deinited", buf, 8u);

    }
  }

  return v10 != 0;
}

- (void)resourceFetchManager
{
  return self->_resourceFetchManager;
}

@end
