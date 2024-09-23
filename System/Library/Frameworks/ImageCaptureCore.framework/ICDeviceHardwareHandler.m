@implementation ICDeviceHardwareHandler

- (ICDeviceHardwareHandler)init
{
  ICDeviceHardwareHandler *v2;
  ICDeviceHardwareHandler *v3;
  NSMutableArray *v4;
  NSMutableArray *deviceContexts;
  NSMutableArray *v6;
  NSMutableArray *disabledContexts;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDeviceHardwareHandler;
  v2 = -[ICDeviceHardwareHandler init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_deviceContextsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deviceContexts = v3->_deviceContexts;
    v3->_deviceContexts = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    disabledContexts = v3->_disabledContexts;
    v3->_disabledContexts = v6;

  }
  return v3;
}

- (void)addDeviceContext:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  os_unfair_lock_s *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  NSObject *v46;
  uint64_t v47;
  ICDeviceHardwareHandler *v48;
  os_unfair_lock_s *lock;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("addDeviceContext");
  if ((unint64_t)objc_msgSend(CFSTR("addDeviceContext"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("addDeviceContext"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Handle: %@ | Identifier: %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v5);
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    v57 = -[__CFString UTF8String](v12, "UTF8String");
    v58 = 2114;
    v59 = v10;
    _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  lock = &self->_deviceContextsLock;
  os_unfair_lock_lock(&self->_deviceContextsLock);
  v48 = self;
  v14 = (void *)-[NSMutableArray copy](self->_deviceContexts, "copy");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v18);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if ((v22 & 1) != 0 || (v25 & 1) != 0)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v16)
          goto LABEL_7;
        goto LABEL_14;
      }
    }

    if (v22)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v48->_disabledContexts, "addObject:", v4);
      __ICOSLogCreate();
      v28 = CFSTR("adding (disabled)");
      v26 = lock;
      if ((unint64_t)objc_msgSend(CFSTR("adding (disabled)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("adding (disabled)"), "substringWithRange:", 0, 18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByAppendingString:", CFSTR(".."));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ -> %@"), v32, v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_retainAutorelease(v28);
        v36 = v34;
        v37 = -[__CFString UTF8String](v35, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v57 = v37;
        v58 = 2114;
        v59 = v33;
        _os_log_impl(&dword_1B98FC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      goto LABEL_27;
    }
    v26 = lock;
    if ((v25 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_14:

    v26 = lock;
  }
  -[NSMutableArray addObject:](v48->_deviceContexts, "addObject:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  __ICOSLogCreate();
  v38 = CFSTR("adding (new)");
  if ((unint64_t)objc_msgSend(CFSTR("adding (new)"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("adding (new)"), "substringWithRange:", 0, 18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByAppendingString:", CFSTR(".."));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v40 = (void *)MEMORY[0x1E0CB3940];
  v41 = (objc_class *)objc_opt_class();
  NSStringFromClass(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ -> %@"), v42, v27);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v45 = objc_retainAutorelease(v38);
    v46 = v44;
    v47 = -[__CFString UTF8String](v45, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v57 = v47;
    v58 = 2114;
    v59 = v43;
    _os_log_impl(&dword_1B98FC000, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceDelegate"));
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString openDeviceHandle:](v28, "openDeviceHandle:", v27);
LABEL_27:

LABEL_28:
  os_unfair_lock_unlock(v26);

}

- (void)removeDeviceContext:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  ICDeviceHardwareHandler *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  os_unfair_lock_s *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *k;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  __CFString *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  os_unfair_lock_t lock;
  ICDeviceHardwareHandler *v73;
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
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("removeDeviceContext");
  if ((unint64_t)objc_msgSend(CFSTR("removeDeviceContext"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("removeDeviceContext"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Handle: %@ | Identifier: %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v5);
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    v90 = -[__CFString UTF8String](v12, "UTF8String");
    v91 = 2114;
    v92 = v10;
    _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  lock = &self->_deviceContextsLock;
  os_unfair_lock_lock(&self->_deviceContextsLock);
  v73 = self;
  v14 = (void *)-[NSMutableArray copy](self->_disabledContexts, "copy");
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v83;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v83 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if (v23)
        {
          -[NSMutableArray removeObject:](v73->_disabledContexts, "removeObject:", v20);
          __ICOSLogCreate();
          v36 = CFSTR("removing (disabled)");
          if ((unint64_t)objc_msgSend(CFSTR("removing (disabled)"), "length") >= 0x15)
          {
            objc_msgSend(CFSTR("removing (disabled)"), "substringWithRange:", 0, 18);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringByAppendingString:", CFSTR(".."));
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          v38 = (void *)MEMORY[0x1E0CB3940];
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ -> %@"), v40, v20);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v43 = objc_retainAutorelease(v36);
            v44 = v42;
            v45 = -[__CFString UTF8String](v43, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v90 = v45;
            v91 = 2114;
            v92 = v41;
            _os_log_impl(&dword_1B98FC000, v44, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          os_unfair_lock_unlock(lock);
          goto LABEL_49;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      if (v17)
        continue;
      break;
    }
  }

  v24 = v73;
  v25 = (void *)-[NSMutableArray copy](v73->_deviceContexts, "copy");
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  v71 = v15;
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v79;
    while (2)
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v79 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        if (v34)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v46, "copy");

          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ICDeviceDelegate"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "closeDeviceHandle:", v48);

          v24 = v73;
          -[NSMutableArray removeObject:](v73->_deviceContexts, "removeObject:", v31);

          goto LABEL_28;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      if (v28)
        continue;
      break;
    }
    v35 = 0;
    v24 = v73;
LABEL_28:
    v15 = v71;
  }
  else
  {
    v35 = 0;
  }

  v49 = lock;
  os_unfair_lock_unlock(lock);
  if (v35)
  {
    os_unfair_lock_lock(lock);
    v50 = (void *)-[NSMutableArray copy](v24->_disabledContexts, "copy");
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v51 = v50;
    v52 = (void *)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v75;
      while (2)
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(_QWORD *)v75 != v53)
            objc_enumerationMutation(v51);
          v55 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ICDevicePrimaryIdentifier"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "isEqualToString:", v35);

          if (v57)
          {
            objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ICDeviceHandle"));
            v58 = objc_claimAutoreleasedReturnValue();
            __ICOSLogCreate();
            v59 = CFSTR("re-enabling (disabled)");
            if ((unint64_t)objc_msgSend(CFSTR("re-enabling (disabled)"), "length") >= 0x15)
            {
              objc_msgSend(CFSTR("re-enabling (disabled)"), "substringWithRange:", 0, 18);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "stringByAppendingString:", CFSTR(".."));
              v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            v61 = (void *)MEMORY[0x1E0CB3940];
            v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (void *)v58;
            objc_msgSend(v61, "stringWithFormat:", CFSTR("%@ -> %@"), v63, v58);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = (void *)_gICOSLog;
            v15 = v71;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v66 = objc_retainAutorelease(v59);
              v67 = v65;
              v68 = -[__CFString UTF8String](v66, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v90 = v68;
              v91 = 2114;
              v92 = v64;
              _os_log_impl(&dword_1B98FC000, v67, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            v52 = (void *)objc_msgSend(v55, "copy");
            -[NSMutableArray removeObject:](v73->_disabledContexts, "removeObject:", v55);

            goto LABEL_45;
          }
        }
        v52 = (void *)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        if (v52)
          continue;
        break;
      }
      v15 = v71;
LABEL_45:
      v49 = lock;
    }

    os_unfair_lock_unlock(v49);
    if (v52)
    {
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ICDeviceDelegate"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "notifyAddedDevice:", v52);

    }
  }
LABEL_49:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledContexts, 0);
  objc_storeStrong((id *)&self->_deviceContexts, 0);
}

@end
