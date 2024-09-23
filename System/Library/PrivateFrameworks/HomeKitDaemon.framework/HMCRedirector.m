@implementation HMCRedirector

uint64_t __29__HMCRedirector_removeTuple___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return result;
}

uint64_t __29__HMCRedirector_removeTuple___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return result;
}

uint64_t __29__HMCRedirector_removeTuple___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return result;
}

void __29__HMCRedirector_removeTuple___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __29__HMCRedirector_removeTuple___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (HMCRedirector)initWithLabel:(id)a3 partition:(id)a4
{
  id v7;
  id v8;
  HMCRedirector *v9;
  HMCRedirector *v10;
  uint64_t v11;
  NSMapTable *insertClass;
  uint64_t v13;
  NSMapTable *updateClass;
  uint64_t v15;
  NSMapTable *updateModelID;
  uint64_t v17;
  NSMapTable *deleteClass;
  uint64_t v19;
  NSMapTable *deleteModelID;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMCRedirector;
  v9 = -[HMCRedirector init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    insertClass = v10->_insertClass;
    v10->_insertClass = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    updateClass = v10->_updateClass;
    v10->_updateClass = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    updateModelID = v10->_updateModelID;
    v10->_updateModelID = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    deleteClass = v10->_deleteClass;
    v10->_deleteClass = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    deleteModelID = v10->_deleteModelID;
    v10->_deleteModelID = (NSMapTable *)v19;

    objc_storeWeak((id *)&v10->_partition, v8);
    v10->_lock.lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  void *v19;
  HMCRedirector *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v24 = 0;
  -[HMCRedirector addTarget:selector:changeMask:forChangesOfObjectsWithModelType:forChangesOfObjectsWithModelID:error:](self, "addTarget:selector:changeMask:forChangesOfObjectsWithModelType:forChangesOfObjectsWithModelID:error:", v12, a4, a5, v13, v14, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  if (!v15)
  {
    v18 = v16;
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to register %@ / %@ for changes of objects %@ and IDs %@: %@", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v19);
    _HMFPreconditionFailure();
  }

  return v15;
}

- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  HMCRedirectorTuple *v15;
  HMCRedirector *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  HMCRedirectorTuple *v25;
  void *v26;
  int v27;
  HMCRedirectorTuple *v28;
  HMCRedirectorTuple *v29;
  HMCRedirectorTuple *v30;
  _Unwind_Exception *v32;
  id v33;
  _QWORD v35[5];
  HMCRedirectorTuple *v36;
  unint64_t v37;
  _QWORD v38[5];
  HMCRedirectorTuple *v39;
  unint64_t v40;
  _QWORD v41[5];
  HMCRedirectorTuple *v42;
  unint64_t v43;
  _QWORD v44[5];
  HMCRedirectorTuple *v45;
  unint64_t v46;
  objc_super v47;

  v13 = a3;
  v14 = a6;
  v33 = a7;
  v15 = [HMCRedirectorTuple alloc];
  v16 = self;
  v17 = v13;
  if (v15)
  {
    v47.receiver = v15;
    v47.super_class = (Class)HMCRedirectorTuple;
    v15 = -[HMCRedirector init](&v47, sel_init);
    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v17, "methodSignatureForSelector:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "numberOfArguments") != 3)
        {
LABEL_25:
          _HMFPreconditionFailure();
          goto LABEL_26;
        }
        v19 = objc_retainAutorelease(v18);
        if (*(_BYTE *)objc_msgSend(v19, "getArgumentTypeAtIndex:", 0) != 64)
        {
LABEL_26:
          _HMFPreconditionFailure();
          goto LABEL_27;
        }
        v20 = objc_retainAutorelease(v19);
        if (*(_BYTE *)objc_msgSend(v20, "getArgumentTypeAtIndex:", 1) != 58)
        {
LABEL_27:
          _HMFPreconditionFailure();
LABEL_28:
          v32 = (_Unwind_Exception *)_HMFPreconditionFailure();
          os_unfair_lock_unlock((os_unfair_lock_t)a4);
          _Unwind_Resume(v32);
        }
        v21 = objc_retainAutorelease(v20);
        if (*(_BYTE *)objc_msgSend(v21, "getArgumentTypeAtIndex:", 2) != 64)
          goto LABEL_28;
        v22 = objc_retainAutorelease(v21);
        if (*(_BYTE *)objc_msgSend(v22, "methodReturnType") == 118)
        {
          v23 = objc_retainAutorelease(v22);
          if (!*(_BYTE *)(objc_msgSend(v23, "methodReturnType") + 1))
          {
            objc_storeWeak((id *)&v15->_owner, v16);
            v15->_selector = a4;
            objc_storeWeak(&v15->_target, v17);

            goto LABEL_11;
          }
        }
        _HMFPreconditionFailure();
      }
      _HMFPreconditionFailure();
      goto LABEL_25;
    }
  }
LABEL_11:

  os_unfair_lock_lock_with_options();
  v24 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke;
  v44[3] = &unk_24E798E70;
  v46 = a5;
  v44[4] = v16;
  v25 = v15;
  v45 = v25;
  v26 = v14;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);
  if (a8 && *a8)
  {
    v27 = 1;
  }
  else
  {
    v41[0] = v24;
    v41[1] = 3221225472;
    v41[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_122;
    v41[3] = &unk_24E798E98;
    v43 = a5;
    v41[4] = v16;
    v28 = v25;
    v42 = v28;
    objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
    if (a8 && *a8)
    {
      v27 = 1;
    }
    else
    {
      v38[0] = v24;
      v38[1] = 3221225472;
      v38[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_124;
      v38[3] = &unk_24E798E70;
      v40 = a5;
      v38[4] = v16;
      v29 = v28;
      v39 = v29;
      objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);
      v35[0] = v24;
      v35[1] = 3221225472;
      v35[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_2;
      v35[3] = &unk_24E798E98;
      v37 = a5;
      v35[4] = v16;
      v36 = v29;
      objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);

      v27 = 0;
    }

  }
  os_unfair_lock_unlock(&v16->_lock.lock);
  if (v27)
    v30 = 0;
  else
    v30 = v25;

  return v30;
}

- (BOOL)processInserts:(id)a3 updates:(id)a4 deletes:(id)a5
{
  id v8;
  id v9;
  id v10;
  hmf_unfair_data_lock_s *p_lock;
  id WeakRetained;
  NSMapTable *insertClass;
  NSMapTable *v14;
  NSMapTable *v15;
  NSMapTable *updateModelID;
  NSMapTable *v17;
  NSMapTable *v18;
  NSMapTable *deleteModelID;
  NSMapTable *v20;
  id v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = 0;
  v32 = 0;
  v33 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_partition);
    insertClass = self->_insertClass;
  }
  else
  {
    WeakRetained = 0;
    insertClass = 0;
  }
  v14 = insertClass;
  _binChanges(WeakRetained, (uint64_t)&v34, v8, v14, 0);

  if (self)
  {
    v15 = self->_updateClass;
    updateModelID = self->_updateModelID;
  }
  else
  {
    v15 = 0;
    updateModelID = 0;
  }
  v17 = updateModelID;
  _binChanges(WeakRetained, (uint64_t)&v33, v9, v15, v17);

  if (self)
  {
    v18 = self->_deleteClass;
    deleteModelID = self->_deleteModelID;
  }
  else
  {
    v18 = 0;
    deleteModelID = 0;
  }
  v20 = deleteModelID;
  _binChanges(WeakRetained, (uint64_t)&v32, v10, v18, v20);

  os_unfair_lock_unlock(&p_lock->lock);
  v21 = (id)(v34 | v33 | v32);
  v22 = v21 != 0;
  if (v21)
  {
    +[HMCContext currentContext](HMCContext, "currentContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke;
    block[3] = &unk_24E79A910;
    v28 = (id)v34;
    v29 = (id)v33;
    v30 = (id)v32;
    v31 = v23;
    v25 = v23;
    dispatch_async(v24, block);

    v21 = (id)v33;
  }

  return v22;
}

- (void)removeRegistrationForChangeOfObjectsOfModelType:(id)a3 forChangesOfObjectsWithModelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __removeRegistrations(self, v7, v8);

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_partition);
  objc_storeStrong((id *)&self->_deleteModelID, 0);
  objc_storeStrong((id *)&self->_deleteClass, 0);
  objc_storeStrong((id *)&self->_updateModelID, 0);
  objc_storeStrong((id *)&self->_updateClass, 0);
  objc_storeStrong((id *)&self->_insertClass, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = a1[4];
  if (v2)
  {
    objc_msgSend(v2, "keyEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v4);

  }
  v5 = a1[5];
  if (v5)
  {
    objc_msgSend(v5, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v7);

  }
  v8 = a1[6];
  if (v8)
  {
    objc_msgSend(v8, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v10);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke_2;
  v12[3] = &unk_24E798EC0;
  v13 = a1[7];
  v14 = a1[4];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke_2(id *a1, void *a2)
{
  id v3;
  HMCRedirectorChange *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *author;
  uint64_t v18;
  NSString *context;
  NSObject *v20;
  HMCRedirectorChange *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HMCRedirectorChange *v25;
  objc_super v26;

  v3 = a2;
  v4 = [HMCRedirectorChange alloc];
  objc_msgSend(a1[4], "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  if (v4)
  {
    v26.receiver = v4;
    v26.super_class = (Class)HMCRedirectorChange;
    v4 = (HMCRedirectorChange *)objc_msgSendSuper2(&v26, sel_init);
    if (v4)
    {
      v13 = v10;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v4->_inserts, v13);
      if (!v10)

      v14 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v4->_updates, v14);
      if (!v11)

      v15 = v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v4->_deletes, v15);
      if (!v12)

      objc_msgSend(v9, "transactionAuthor");
      v16 = objc_claimAutoreleasedReturnValue();
      author = v4->_author;
      v4->_author = (NSString *)v16;

      objc_msgSend(v9, "name");
      v18 = objc_claimAutoreleasedReturnValue();
      context = v4->_context;
      v4->_context = (NSString *)v18;

    }
  }

  dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke_3;
  v23[3] = &unk_24E79C268;
  v24 = v3;
  v25 = v4;
  v21 = v4;
  v22 = v3;
  dispatch_async(v20, v23);

}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const char *v3;
  id v4;
  objc_class *v5;
  IMP MethodImplementation;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(const char **)(v1 + 24);
    v4 = *(id *)(v1 + 16);
    v7 = v2;
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, v3);
    ((void (*)(id, const char *, id))MethodImplementation)(v4, v3, v7);

  }
}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  Protocol *v3;
  objc_class *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v3);
  v5 = *(_QWORD *)(a1 + 48);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
      v6 = (_QWORD *)v6[3];
    v7 = v6;
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProtocol(v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        v22 = 138544130;
        v23 = v12;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v8;
        v15 = "%{public}@Unable to register an insertion notification for objects of type %@ by %@ (already registered by %@)";
LABEL_21:
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, 0x2Au);

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    v5 = *(_QWORD *)(a1 + 48);
  }
  if ((v5 & 4) != 0)
  {
    v16 = *(_QWORD **)(a1 + 32);
    if (v16)
      v16 = (_QWORD *)v16[4];
    v17 = v16;
    objc_msgSend(v17, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProtocol(v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        v22 = 138544130;
        v23 = v12;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v18;
        v28 = 2112;
        v29 = v8;
        v15 = "%{public}@Unable to register an update notification for objects of type %@ by %@ (already registered by %@)";
        goto LABEL_21;
      }
LABEL_22:

      objc_autoreleasePoolPop(v9);
      goto LABEL_23;
    }
    v5 = *(_QWORD *)(a1 + 48);
  }
  if ((v5 & 2) != 0)
  {
    v19 = *(_QWORD **)(a1 + 32);
    if (v19)
      v19 = (_QWORD *)v19[6];
    v20 = v19;
    objc_msgSend(v20, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProtocol(v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 40);
        v22 = 138544130;
        v23 = v12;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v21;
        v28 = 2112;
        v29 = v8;
        v15 = "%{public}@Unable to register a delete notification for objects of type %@ by %@ (already registered by %@)";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
LABEL_23:

}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if ((v4 & 4) != 0)
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
      v5 = (_QWORD *)v5[5];
    v6 = v5;
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v17 = 138544130;
        v18 = v11;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v12;
        v23 = 2112;
        v24 = v7;
        v13 = "%{public}@Unable to register an update notification for object with modelID %@ by %@ (already registered by %@)";
LABEL_14:
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x2Au);

        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v4 = *(_QWORD *)(a1 + 48);
  }
  if ((v4 & 2) != 0)
  {
    v14 = *(_QWORD **)(a1 + 32);
    if (v14)
      v14 = (_QWORD *)v14[7];
    v15 = v14;
    objc_msgSend(v15, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        v17 = 138544130;
        v18 = v11;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v16;
        v23 = 2112;
        v24 = v7;
        v13 = "%{public}@Unable to register a delete notification for object with modelID %@ by %@ (already registered by %@)";
        goto LABEL_14;
      }
LABEL_15:

      objc_autoreleasePoolPop(v8);
    }
  }

}

objc_class *__117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_124(_QWORD *a1, uint64_t a2)
{
  objc_class *result;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  result = +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", a2);
  v4 = result;
  v5 = a1[6];
  if ((v5 & 1) != 0)
  {
    v6 = a1[4];
    if (v6)
      v7 = *(void **)(v6 + 24);
    else
      v7 = 0;
    result = (objc_class *)objc_msgSend(v7, "setObject:forKey:", a1[5], v4);
    v5 = a1[6];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        return result;
      goto LABEL_11;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = a1[4];
  if (v8)
    v9 = *(void **)(v8 + 32);
  else
    v9 = 0;
  result = (objc_class *)objc_msgSend(v9, "setObject:forKey:", a1[5], v4);
  if ((a1[6] & 2) != 0)
  {
LABEL_11:
    v10 = a1[4];
    if (v10)
      v11 = *(void **)(v10 + 48);
    else
      v11 = 0;
    return (objc_class *)objc_msgSend(v11, "setObject:forKey:", a1[5], v4);
  }
  return result;
}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = a1[6];
  v9 = v3;
  if ((v4 & 4) != 0)
  {
    v5 = a1[4];
    if (v5)
      v6 = *(void **)(v5 + 40);
    else
      v6 = 0;
    objc_msgSend(v6, "setObject:forKey:", a1[5], v3);
    v3 = v9;
    v4 = a1[6];
  }
  if ((v4 & 2) != 0)
  {
    v7 = a1[4];
    if (v7)
      v8 = *(void **)(v7 + 56);
    else
      v8 = 0;
    objc_msgSend(v8, "setObject:forKey:", a1[5], v9);
    v3 = v9;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_239242 != -1)
    dispatch_once(&logCategory__hmf_once_t13_239242, &__block_literal_global_239243);
  return (id)logCategory__hmf_once_v14_239244;
}

void __28__HMCRedirector_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_239244;
  logCategory__hmf_once_v14_239244 = v0;

}

@end
