@implementation BKSHIDKeyboardService

- (BKSHIDKeyboardService)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDKeyboardService *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDKeyboardService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -init"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDKeyboardService.m");
    v17 = 1024;
    v18 = 169;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDKeyboardService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)addKeyboardObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, (uint64_t)v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allKeyboardDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, 0, (uint64_t)CFSTR("allKeyboardDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[BSOrderedDictionary allValues](self->_lock_senderIDToDevice, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(&self->_lock);
  -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:](self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  return v6;
}

- (id)keyboardDeviceForSenderID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BSOrderedDictionary *lock_senderIDToDevice;
  void *v11;
  void *v12;

  if (keyboardDeviceForSenderID__onceToken != -1)
    dispatch_once(&keyboardDeviceForSenderID__onceToken, &__block_literal_global_149);
  -[BKSHIDKeyboardService _addObserver:forReason:]((id *)&self->super.isa, 0, (uint64_t)CFSTR("keyboardDeviceWithSenderID:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (a3
    && (v6 = (void *)keyboardDeviceForSenderID__axSenders,
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7),
        v7,
        !(_DWORD)v6))
  {
    lock_senderIDToDevice = self->_lock_senderIDToDevice;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSOrderedDictionary objectForKey:](lock_senderIDToDevice, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BSOrderedDictionary allValues](self->_lock_senderIDToDevice, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  os_unfair_lock_unlock(&self->_lock);
  -[BKSHIDKeyboardService _proxyDeviceForConcreteDevice:]((uint64_t)self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  return v12;
}

- (void)setConnectedKeyboards:(id)a3 withReply:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[BKSHIDKeyboardService _updateKeyboards:]((uint64_t)self, a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_senderIDToDevice, 0);
  objc_storeStrong((id *)&self->_proxiesAssertion, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

- (void)_updateKeyboards:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  id v62;
  id v63;
  os_unfair_lock_s *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id obj;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v71 = a1;
    if (v5)
    {
      v64 = (os_unfair_lock_s *)(a1 + 8);
      if (v6)
      {
        v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v63 = *(id *)(a1 + 40);
        v7 = objc_alloc_init(MEMORY[0x1E0D017C8]);
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v65 = v3;
        obj = v3;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v88 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "senderID", v62));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
              v14 = objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                v15 = (id)v14;
                objc_msgSend(v12, "layout");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "layout");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqual:", v17);

                if ((v18 & 1) == 0)
                {
                  objc_msgSend(v67, "addObject:", v15);
                  objc_msgSend(v15, "_replaceProperties:", v12);
                }
                a1 = v71;
              }
              else
              {
                v15 = -[BKSHIDKeyboardDevice _initWithProperties:]([BKSHIDKeyboardDevice alloc], "_initWithProperties:", v12);
                objc_msgSend(v68, "addObject:", v15);
              }
              objc_msgSend(v7, "setObject:forKey:", v15, v13);

            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
          }
          while (v9);
        }

        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __42__BKSHIDKeyboardService__updateKeyboards___block_invoke;
        v84[3] = &unk_1E1E9FB78;
        v19 = v7;
        v85 = v19;
        v20 = v62;
        v86 = v20;
        objc_msgSend(v63, "enumerateKeysAndObjectsUsingBlock:", v84);
        v21 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v19;
        v22 = v19;
        v23 = v67;
        v24 = v20;
        v25 = v68;

        v3 = v65;
      }
      else
      {
        v27 = objc_alloc_init(MEMORY[0x1E0D017C8]);
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v28 = v3;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v92 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v33, "senderID"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[BKSHIDKeyboardDevice _initWithProperties:]([BKSHIDKeyboardDevice alloc], "_initWithProperties:", v33);
              objc_msgSend(v27, "setObject:forKey:", v35, v34);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
          }
          while (v30);
        }

        objc_msgSend(v27, "allValues");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v36 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v27;

        v23 = 0;
        v24 = 0;
      }
      v4 = v64;
    }
    else
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "allValues");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;

        v23 = 0;
      }
      else
      {
        v23 = 0;
        v24 = 0;
      }
      v25 = 0;
    }
    objc_msgSend(*(id *)(a1 + 16), "orderedContext", v62);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");

    os_unfair_lock_unlock(v4);
    if (objc_msgSend(v25, "count"))
    {
      BKLogKeyboard();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v25;
        _os_log_impl(&dword_18A0F0000, v39, OS_LOG_TYPE_DEFAULT, "connected: %{public}@", buf, 0xCu);
      }

      if (objc_msgSend(v38, "count"))
      {
        -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v25);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v41 = v38;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v81;
          do
          {
            for (k = 0; k != v43; ++k)
            {
              if (*(_QWORD *)v81 != v44)
                objc_enumerationMutation(v41);
              objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "keyboardDevicesDidConnect:", v40);
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
          }
          while (v43);
        }

        a1 = v71;
      }
    }
    if (objc_msgSend(v23, "count"))
    {
      BKLogKeyboard();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v23;
        _os_log_impl(&dword_18A0F0000, v46, OS_LOG_TYPE_DEFAULT, "layouts did change: %{public}@", buf, 0xCu);
      }

      if (objc_msgSend(v38, "count"))
      {
        v69 = v25;
        v66 = v3;
        -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v23);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v48 = v38;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v77;
          do
          {
            for (m = 0; m != v50; ++m)
            {
              if (*(_QWORD *)v77 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v53, "keyboardDeviceLayoutsDidChange:", v47);
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
          }
          while (v50);
        }

        v3 = v66;
        a1 = v71;
        v25 = v69;
      }
    }
    if (objc_msgSend(v24, "count"))
    {
      BKLogKeyboard();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v24;
        _os_log_impl(&dword_18A0F0000, v54, OS_LOG_TYPE_DEFAULT, "disconnected: %{public}@", buf, 0xCu);
      }

      if (objc_msgSend(v38, "count"))
      {
        v55 = v25;
        -[BKSHIDKeyboardService _proxyDevicesForConcreteDevices:]((void *)a1, v24);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v57 = v38;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v95, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v73;
          do
          {
            for (n = 0; n != v59; ++n)
            {
              if (*(_QWORD *)v73 != v60)
                objc_enumerationMutation(v57);
              objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * n), "keyboardDevicesDidDisconnect:", v56);
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v95, 16);
          }
          while (v59);
        }

        v25 = v55;
      }
    }

  }
}

void __42__BKSHIDKeyboardService__updateKeyboards___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)_proxyDevicesForConcreteDevices:(void *)a1
{
  _QWORD v3[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__BKSHIDKeyboardService__proxyDevicesForConcreteDevices___block_invoke;
    v3[3] = &unk_1E1E9FBA0;
    v3[4] = a1;
    objc_msgSend(a2, "bs_map:", v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_BKSHIDKeyboardDeviceClientProxy *__57__BKSHIDKeyboardService__proxyDevicesForConcreteDevices___block_invoke(uint64_t a1, void *a2)
{
  return -[BKSHIDKeyboardService _proxyDeviceForConcreteDevice:](*(_QWORD *)(a1 + 32), a2);
}

- (_BKSHIDKeyboardDeviceClientProxy)_proxyDeviceForConcreteDevice:(uint64_t)a1
{
  _BKSHIDKeyboardDeviceClientProxy *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(void **)(a1 + 24);
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a2;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("proxy:%p"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acquireForReason:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[_BKSHIDKeyboardDeviceClientProxy initWithDevice:lifetimeAssertion:]([_BKSHIDKeyboardDeviceClientProxy alloc], "initWithDevice:lifetimeAssertion:", v5, v7);
  }
  return v2;
}

- (id)_addObserver:(uint64_t)a3 forReason:
{
  if (a1)
  {
    objc_msgSend(a1[2], "acquireForReason:withContext:", a3, a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __51__BKSHIDKeyboardService_keyboardDeviceForSenderID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E1EBC398, &unk_1E1EBC3B0, &unk_1E1EBC3C8, &unk_1E1EBC3E0, &unk_1E1EBC3F8, &unk_1E1EBC410, &unk_1E1EBC428, &unk_1E1EBC440, 0);
  v1 = (void *)keyboardDeviceForSenderID__axSenders;
  keyboardDeviceForSenderID__axSenders = v0;

}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot +new"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSHIDKeyboardService.m");
    v17 = 1024;
    v18 = 164;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_134);
  return (id)sharedInstance_service;
}

void __39__BKSHIDKeyboardService_sharedInstance__block_invoke()
{
  void *v0;
  BKSHIDKeyboardService *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  BSServiceConnection *connection;
  NSObject *v15;
  BSServiceConnection *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BSServiceConnection *v21;
  objc_class *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  BKSHIDKeyboardService *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  _QWORD *v30;
  objc_super v31;
  uint8_t buf[4];
  BSServiceConnection *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  BKSHIDKeyboardService *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKKeyboardService"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = [BKSHIDKeyboardService alloc];
  v24 = v0;
  if (v1)
  {
    v31.receiver = v1;
    v31.super_class = (Class)BKSHIDKeyboardService;
    v2 = objc_msgSendSuper2(&v31, sel_init);
    if (v2)
    {
      v3 = v2;
      if (v24)
      {
        v4 = (void *)MEMORY[0x1E0D01718];
        v5 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke;
        v29[3] = &unk_1E1EA0698;
        v6 = v2;
        v30 = v6;
        objc_msgSend(v4, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSKeyboardServiceObservers"), v29);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v6[2];
        v6[2] = v7;

        v9 = (void *)MEMORY[0x1E0D01718];
        v27[0] = v5;
        v27[1] = 3221225472;
        v27[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_2;
        v27[3] = &unk_1E1EA0698;
        v10 = v6;
        v28 = v10;
        objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSKeyboardServiceProxies"), v27);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v10[3];
        v10[3] = v11;

        v25[0] = v5;
        v25[1] = 3221225472;
        v25[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_3;
        v25[3] = &unk_1E1EA1868;
        v1 = v10;
        v26 = v1;
        objc_msgSend(v24, "configureConnection:", v25);
        BKLogKeyboard();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          connection = v1->_connection;
          *(_DWORD *)buf = 138543362;
          v33 = connection;
          _os_log_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_DEFAULT, "Activating connection to server: %{public}@", buf, 0xCu);
        }

        objc_msgSend(v24, "activate");
        BKLogKeyboard();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v24, "remoteTarget");
          v16 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v16;
          _os_log_impl(&dword_18A0F0000, v15, OS_LOG_TYPE_DEFAULT, "server remote target %{public}@", buf, 0xCu);

        }
        objc_msgSend(v24, "remoteTarget");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have a remote target"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithConnection_);
            v21 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v33 = v21;
            v34 = 2114;
            v35 = v23;
            v36 = 2048;
            v37 = v1;
            v38 = 2114;
            v39 = CFSTR("BKSHIDKeyboardService.m");
            v40 = 1024;
            v41 = 233;
            v42 = 2114;
            v43 = v20;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A104D90);
        }
        objc_storeStrong((id *)&v1->_connection, v0);

        v3 = v30;
      }
      else
      {
        BKLogKeyboard();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18A0F0000, v18, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
        }

        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }
  }

  v19 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v1;

}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke(uint64_t a1)
{
  -[BKSHIDKeyboardService _evaluateObservationStateAfterReconnect:](*(_QWORD *)(a1 + 32), 0);
}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_2(uint64_t a1)
{
  -[BKSHIDKeyboardService _evaluateObservationStateAfterReconnect:](*(_QWORD *)(a1 + 32), 0);
}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0D017E0];
  v4 = a2;
  objc_msgSend(v3, "protocolForProtocol:", &unk_1EDF660E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF5ACD8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKKeyboardService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v5);
  objc_msgSend(v7, "setClient:", v6);
  objc_msgSend(v4, "setInterface:", v7);
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__BKSHIDKeyboardService__initWithConnection___block_invoke_4;
  v9[3] = &unk_1E1EA1800;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global);

}

void __45__BKSHIDKeyboardService__initWithConnection___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    BKLogKeyboard();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_ERROR, "keyboard service reconnecting", v3, 2u);
    }

    objc_msgSend(*(id *)(v1 + 48), "activate");
    -[BKSHIDKeyboardService _evaluateObservationStateAfterReconnect:](v1, 1);
  }
}

- (void)_evaluateObservationStateAfterReconnect:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if ((objc_msgSend(*(id *)(a1 + 16), "isActive") & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(*(id *)(a1 + 24), "isActive");
    if ((v5 & a2 & 1) != 0 || *(unsigned __int8 *)(a1 + 32) != (_DWORD)v5)
    {
      *(_BYTE *)(a1 + 32) = v5;
      BKLogKeyboard();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v5;
        _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEFAULT, "currently observing: %{BOOL}u", (uint8_t *)v10, 8u);
      }

      os_unfair_lock_unlock(v4);
      objc_msgSend(*(id *)(a1 + 48), "remoteTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObservingUsableKeyboardConnections:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[BKSHIDKeyboardService _updateKeyboards:](a1, v9);
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

@end
