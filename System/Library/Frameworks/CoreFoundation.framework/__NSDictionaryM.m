@implementation __NSDictionaryM

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  unint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  NSException *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  NSException *v42;
  id v43;
  uint64_t v44;
  unint64_t *v45;
  uint64_t v46;

  v45 = (unint64_t *)self;
  v46 = *MEMORY[0x1E0C80C00];
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_61:
    v33 = _os_log_pack_size();
    v35 = (char *)&v43 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315138;
    *(_QWORD *)(v36 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[__NSDictionaryM setObject:forKey:]");
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
    objc_exception_throw(v37);
  }
  __cf_tsanWriteFunction(v45, v4, __CFTSANTagMutableDictionary);
  if (!a4)
    goto LABEL_61;
LABEL_3:
  if (!a3)
  {
    v38 = _os_log_pack_size();
    v40 = (char *)&v43 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    v41 = _os_log_pack_fill();
    *(_DWORD *)v41 = 136315394;
    *(_QWORD *)(v41 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    *(_WORD *)(v41 + 12) = 2112;
    *(_QWORD *)(v41 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil (key: %@)"), "-[__NSDictionaryM setObject:forKey:]", a4);
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v42);
  }
  v7 = v45;
  v8 = atomic_load(v45 + 3);
  v9 = (uint64_t *)(v7 + 1);
  v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D)
    v11 = (v10 & 0x7FFFFFFF) + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSDictionaryM setObject:forKey:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v45, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    v10 = v9[1];
  }
  v9[1] = v10 & 0xFFFFFFFF80000000 | v11;
  v13 = v10 >> 58;
  if (v10 >> 58)
  {
    LODWORD(v14) = __NSDictionarySizes_0[v13];
    if (((unint64_t)a3 & 0x8000000000000000) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v9[1] = v10 & 0x3FFFFFF80000000 | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
  v32 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
  if (!v32)
  {
    __break(1u);
    return;
  }
  *v9 = (uint64_t)v32;
  LODWORD(v13) = 1;
  LODWORD(v14) = 3;
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
LABEL_17:
    v15 = a3;
LABEL_18:
  v16 = v9[1];
  v43 = a3;
  v44 = v16;
  while (1)
  {
    v17 = *v9;
    v18 = v14;
    v19 = objc_msgSend(a4, "hash", v43);
    v20 = 0;
    if ((_DWORD)v14)
    {
      v21 = v19 % v14;
      v22 = v14;
      v14 = v14;
      while (1)
      {
        v23 = *(id *)(v17 + 8 * v21);
        if (!v23)
          break;
        if (v23 == &___NSDictionaryM_DeletedMarker)
        {
          ++v20;
          if (v14 == v18)
            v14 = v21;
        }
        else if (v23 == a4 || (objc_msgSend(v23, "isEqual:", a4) & 1) != 0)
        {
          v14 = v21;
          goto LABEL_37;
        }
        if (v21 + 1 >= v18)
          v24 = v18;
        else
          v24 = 0;
        v21 = v21 + 1 - v24;
        if (!--v22)
          goto LABEL_37;
      }
      if (v14 == v18)
        v14 = v21;
    }
    else
    {
      v14 = 0;
    }
LABEL_37:
    if (v14 < v18 && v20 <= 0xF)
      break;
    if (v14 < v18)
      v25 = v13;
    else
      v25 = v13 + 1;
    mdict_rehashd((uint64_t)v45, v25);
    v13 = (unint64_t)v9[1] >> 58;
    LODWORD(v14) = __NSDictionarySizes_0[v13];
  }
  v26 = *(void **)(v17 + 8 * v14);
  v27 = v17 + 8 * v18;
  if ((v44 & 0x200000000000000) != 0)
    objc_msgSend(v45, "willChangeValueForKey:", a4);
  v28 = *(_QWORD *)(v27 + 8 * v14);
  if (v26 == &___NSDictionaryM_DeletedMarker || v26 == 0)
  {
    *(_QWORD *)(v17 + 8 * v14) = objc_msgSend(a4, "copyWithZone:", 0);
    *(_QWORD *)(v27 + 8 * v14) = v43;
    v30 = v9[1];
    v31 = (v30 + 0x100000000) & 0x1FFFFFF00000000;
    v9[1] = v31 | v30 & 0xFE000000FFFFFFFFLL;
    if ((unint64_t)__NSDictionaryCapacities_0[v13] < HIDWORD(v31))
      mdict_rehashd((uint64_t)v45, v13 + 1);
  }
  else
  {
    *(_QWORD *)(v27 + 8 * v14) = v43;
  }
  if ((v44 & 0x200000000000000) != 0)
    objc_msgSend(v45, "didChangeValueForKey:", a4);
  if (v28 >= 1)

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  uint64_t v4;
  unint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSException *v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;

  v44 = (unint64_t *)self;
  v45 = *MEMORY[0x1E0C80C00];
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_66:
    v35 = _os_log_pack_size();
    v37 = (char *)&v40 - ((MEMORY[0x1E0C80A78](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136315138;
    *(_QWORD *)(v38 + 4) = "-[__NSDictionaryM setObject:forKeyedSubscript:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[__NSDictionaryM setObject:forKeyedSubscript:]");
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v37, v35);
    objc_exception_throw(v39);
  }
  __cf_tsanWriteFunction(v44, v4, __CFTSANTagMutableDictionary);
  if (!a4)
    goto LABEL_66;
LABEL_3:
  v7 = v44;
  v8 = atomic_load(v44 + 3);
  v9 = (uint64_t *)(v7 + 1);
  v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D)
    v11 = (v10 & 0x7FFFFFFF) + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSDictionaryM setObject:forKeyedSubscript:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v44, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    v10 = v9[1];
  }
  v9[1] = v10 & 0xFFFFFFFF80000000 | v11;
  if (!a3)
  {
    mdict_removeObjectForKey((uint64_t *)v44, a4);
    return;
  }
  v13 = v10 >> 58;
  if (v10 >> 58)
  {
    LODWORD(v14) = __NSDictionarySizes_0[v13];
  }
  else
  {
    v9[1] = v10 & 0x3FFFFFF80000000 | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
    v15 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
    if (!v15)
    {
      __break(1u);
      return;
    }
    *v9 = (uint64_t)v15;
    LODWORD(v13) = 1;
    LODWORD(v14) = 3;
  }
  v41 = v10;
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
    v16 = a3;
  v17 = v9[1];
  v42 = a3;
  v43 = v17;
  while (1)
  {
    v18 = *v9;
    v19 = v14;
    v20 = objc_msgSend(a4, "hash");
    v21 = 0;
    if ((_DWORD)v14)
    {
      v22 = v20 % v14;
      v23 = v14;
      v14 = v14;
      while (1)
      {
        v24 = *(id *)(v18 + 8 * v22);
        if (!v24)
          break;
        if (v24 == &___NSDictionaryM_DeletedMarker)
        {
          ++v21;
          if (v14 == v19)
            v14 = v22;
        }
        else if (v24 == a4 || (objc_msgSend(v24, "isEqual:", a4) & 1) != 0)
        {
          v14 = v22;
          goto LABEL_41;
        }
        if (v22 + 1 >= v19)
          v25 = v19;
        else
          v25 = 0;
        v22 = v22 + 1 - v25;
        if (!--v23)
          goto LABEL_41;
      }
      if (v14 == v19)
        v14 = v22;
    }
    else
    {
      v14 = 0;
    }
LABEL_41:
    if (v14 < v19 && v21 <= 0xF)
      break;
    if (v14 < v19)
      v26 = v13;
    else
      v26 = v13 + 1;
    mdict_rehashd((uint64_t)v44, v26);
    v13 = (unint64_t)v9[1] >> 58;
    LODWORD(v14) = __NSDictionarySizes_0[v13];
  }
  v27 = *(void **)(v18 + 8 * v14);
  v28 = v18 + 8 * v19;
  if ((v43 & 0x200000000000000) != 0)
    objc_msgSend(v44, "willChangeValueForKey:", a4);
  v29 = *(_QWORD *)(v28 + 8 * v14);
  if (v27 == &___NSDictionaryM_DeletedMarker || v27 == 0)
  {
    if ((v41 & 0x80000000) != 0)
    {
      v31 = (id)objc_msgSend(a4, "copyWithZone:", 0);
    }
    else
    {
      v31 = a4;
      if (((unint64_t)a4 & 0x8000000000000000) == 0)
      {
        v32 = a4;
        v31 = a4;
      }
    }
    *(_QWORD *)(v18 + 8 * v14) = v31;
    *(_QWORD *)(v28 + 8 * v14) = v42;
    v33 = v9[1];
    v34 = (v33 + 0x100000000) & 0x1FFFFFF00000000;
    v9[1] = v34 | v33 & 0xFE000000FFFFFFFFLL;
    if ((unint64_t)__NSDictionaryCapacities_0[v13] < HIDWORD(v34))
      mdict_rehashd((uint64_t)v44, v13 + 1);
  }
  else
  {
    *(_QWORD *)(v28 + 8 * v14) = v42;
  }
  if ((v43 & 0x200000000000000) != 0)
    objc_msgSend(v44, "didChangeValueForKey:", a4);
  if (v29 >= 1)

}

- (void)__setObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  unint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  unint64_t v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  NSException *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  NSException *v72;
  __int16 v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  unint64_t *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v77 = (unint64_t *)self;
  -[__NSDictionaryM _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_115:
    v63 = _os_log_pack_size();
    v65 = (char *)&v73 - ((MEMORY[0x1E0C80A78](v63, v64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v66 = _os_log_pack_fill();
    *(_DWORD *)v66 = 136315138;
    *(_QWORD *)(v66 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[__NSDictionaryM __setObject:forKey:]");
    v67 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v65, v63);
    objc_exception_throw(v67);
  }
  __cf_tsanWriteFunction(v77, v4, __CFTSANTagMutableDictionary);
  if (!a4)
    goto LABEL_115;
LABEL_3:
  if (!a3)
  {
    v68 = _os_log_pack_size();
    v70 = (char *)&v73 - ((MEMORY[0x1E0C80A78](v68, v69) + 15) & 0xFFFFFFFFFFFFFFF0);
    v71 = _os_log_pack_fill();
    *(_DWORD *)v71 = 136315394;
    *(_QWORD *)(v71 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    *(_WORD *)(v71 + 12) = 2112;
    *(_QWORD *)(v71 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil (key: %@)"), "-[__NSDictionaryM __setObject:forKey:]", a4);
    v72 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v70, v68);
    objc_exception_throw(v72);
  }
  v7 = v77;
  v8 = atomic_load(v77 + 3);
  v9 = (uint64_t *)(v7 + 1);
  v10 = v7[2];
  if (((v10 >> 9) & 0x3FFFFF) < 0x7D)
    v11 = (v10 & 0x7FFFFFFF) + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSDictionaryM __setObject:forKey:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v77, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    v10 = v9[1];
  }
  v13 = v10 & 0xFFFFFFFF80000000 | v11;
  v9[1] = v13;
  v75 = a3;
  if ((v10 & 0x80000000) == 0)
    goto LABEL_18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = v9[1];
LABEL_18:
    v20 = v13 >> 58;
    if (v13 >> 58)
    {
      v21 = __NSDictionarySizes_0[v20];
      goto LABEL_22;
    }
    v9[1] = v13 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
    v22 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
    if (v22)
    {
      *v9 = (uint64_t)v22;
      LODWORD(v20) = 1;
      v21 = 3;
LABEL_22:
      v74 = v13;
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
        v23 = a3;
      v76 = v9[1];
      while (1)
      {
        v24 = *v9;
        v25 = objc_msgSend(a4, "hash");
        v26 = 0;
        if (v21)
        {
          v27 = v25 % v21;
          v28 = v21;
          v29 = v21;
          while (1)
          {
            v30 = *(id *)(v24 + 8 * v27);
            if (!v30)
              break;
            if (v30 == &___NSDictionaryM_DeletedMarker)
            {
              ++v26;
              if (v29 == v21)
                v29 = v27;
            }
            else if (v30 == a4 || (objc_msgSend(v30, "isEqual:", a4) & 1) != 0)
            {
              v29 = v27;
              goto LABEL_43;
            }
            if (v27 + 1 >= v21)
              v31 = v21;
            else
              v31 = 0;
            v27 = v27 + 1 - v31;
            if (!--v28)
              goto LABEL_43;
          }
          if (v29 == v21)
            v29 = v27;
        }
        else
        {
          v29 = 0;
        }
LABEL_43:
        if (v29 < v21 && v26 <= 0xF)
          break;
        if (v29 < v21)
          v32 = v20;
        else
          v32 = v20 + 1;
        mdict_rehashd((uint64_t)v77, v32);
        v20 = (unint64_t)v9[1] >> 58;
        v21 = __NSDictionarySizes_0[v20];
      }
      v33 = *(void **)(v24 + 8 * v29);
      v34 = v24 + 8 * v21;
      if ((v76 & 0x200000000000000) != 0)
        objc_msgSend(v77, "willChangeValueForKey:", a4);
      v35 = *(_QWORD *)(v34 + 8 * v29);
      if (v33 == &___NSDictionaryM_DeletedMarker || v33 == 0)
      {
        if ((v74 & 0x80000000) != 0)
        {
          v37 = (id)objc_msgSend(a4, "copyWithZone:", 0);
        }
        else
        {
          v37 = a4;
          if (((unint64_t)a4 & 0x8000000000000000) == 0)
          {
            v38 = a4;
            v37 = a4;
          }
        }
        *(_QWORD *)(v24 + 8 * v29) = v37;
        *(_QWORD *)(v34 + 8 * v29) = v75;
        v60 = v9[1];
        v61 = (v60 + 0x100000000) & 0x1FFFFFF00000000;
        v9[1] = v61 | v60 & 0xFE000000FFFFFFFFLL;
        if ((unint64_t)__NSDictionaryCapacities_0[v20] < HIDWORD(v61))
          mdict_rehashd((uint64_t)v77, v20 + 1);
      }
      else
      {
        *(_QWORD *)(v34 + 8 * v29) = v75;
      }
      if ((v76 & 0x200000000000000) != 0)
        objc_msgSend(v77, "didChangeValueForKey:", a4);
      if (v35 >= 1)

      return;
    }
    goto LABEL_118;
  }
  CFLog(3, (uint64_t)CFSTR("*** CFDictionarySetValue(): attempt to use this function to set a key which is not copyable into a non-CFDictionary via toll-free bridging"), v14, v15, v16, v17, v18, v19, v73);
  v39 = v9[1];
  v40 = v39 >> 58;
  if (v39 >> 58)
  {
    LODWORD(v41) = __NSDictionarySizes_0[v40];
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
LABEL_61:
      v42 = a3;
  }
  else
  {
    v9[1] = v39 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000;
    v62 = malloc_type_calloc(1uLL, 0x30uLL, 0xC2D7DFC3uLL);
    if (!v62)
    {
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    *v9 = (uint64_t)v62;
    LODWORD(v40) = 1;
    LODWORD(v41) = 3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      goto LABEL_61;
  }
  v76 = v9[1];
  while (1)
  {
    v43 = *v9;
    v44 = v41;
    v45 = objc_msgSend(a4, "hash");
    v46 = 0;
    if ((_DWORD)v41)
    {
      v47 = v45 % v41;
      v41 = v41;
      v48 = v41;
      while (1)
      {
        v49 = *(id *)(v43 + 8 * v47);
        if (!v49)
          break;
        if (v49 == &___NSDictionaryM_DeletedMarker)
        {
          ++v46;
          if (v48 == v44)
            v48 = v47;
        }
        else if (v49 == a4 || (objc_msgSend(v49, "isEqual:", a4) & 1) != 0)
        {
          v48 = v47;
          goto LABEL_81;
        }
        if (v47 + 1 >= v44)
          v50 = v44;
        else
          v50 = 0;
        v47 = v47 + 1 - v50;
        if (!--v41)
          goto LABEL_81;
      }
      if (v48 == v44)
        v48 = v47;
    }
    else
    {
      v48 = 0;
    }
LABEL_81:
    if (v48 < v44 && v46 <= 0xF)
      break;
    if (v48 < v44)
      v51 = v40;
    else
      v51 = v40 + 1;
    mdict_rehashd((uint64_t)v77, v51);
    v40 = (unint64_t)v9[1] >> 58;
    LODWORD(v41) = __NSDictionarySizes_0[v40];
  }
  v52 = *(void **)(v43 + 8 * v48);
  v53 = v43 + 8 * v44;
  v54 = v76;
  if ((v76 & 0x200000000000000) != 0)
    objc_msgSend(v77, "willChangeValueForKey:", a4);
  v55 = *(_QWORD *)(v53 + 8 * v48);
  if (v52 == &___NSDictionaryM_DeletedMarker || v52 == 0)
  {
    if (((unint64_t)a4 & 0x8000000000000000) == 0)
      v57 = a4;
    *(_QWORD *)(v43 + 8 * v48) = a4;
    *(_QWORD *)(v53 + 8 * v48) = v75;
    v58 = v9[1];
    v59 = (v58 + 0x100000000) & 0x1FFFFFF00000000;
    v9[1] = v59 | v58 & 0xFE000000FFFFFFFFLL;
    if ((unint64_t)__NSDictionaryCapacities_0[v40] < HIDWORD(v59))
      mdict_rehashd((uint64_t)v77, v40 + 1);
  }
  else
  {
    *(_QWORD *)(v53 + 8 * v48) = v75;
  }
  if ((v54 & 0x200000000000000) != 0)
    objc_msgSend(v77, "didChangeValueForKey:", a4);
  if (v55 >= 1)

  if (getenv("__setObject_throw_on_warning"))
LABEL_119:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), CFSTR("key should be copyable"), 0));
}

- (void)_mutate
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (id)objectForKey:(id)a3
{
  uint64_t v3;
  $90C7FAF6EC27E5178BC4117F5D7BFD66 *p_storage;
  unint64_t mutations;
  unint64_t v8;
  state **buffer;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  state *v13;
  unint64_t v14;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  p_storage = &self->storage;
  mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58))
    return 0;
  v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  v10 = objc_msgSend(a3, "hash") % v8;
  v11 = v8 <= 1 ? 1 : v8;
  v12 = v8;
  while (1)
  {
    v13 = buffer[v10];
    if (!v13)
      break;
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v12 == v8)
        v12 = v10;
    }
    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8)
      v14 = v8;
    else
      v14 = 0;
    v10 = v10 + 1 - v14;
    if (!--v11)
      goto LABEL_23;
  }
  if (v12 == v8)
    v12 = v10;
LABEL_23:
  if (v12 < v8)
    return *(&buffer[v8] + v12);
  else
    return 0;
}

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (mutable)"));
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t v10;
  unint64_t mutations;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  state **buffer;
  state *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSException *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  v10 = a5 >> 61;
  if (a3 && v10 || a4 && v10)
  {
    v20 = _os_log_pack_size();
    v22 = (char *)v25 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315394;
    *(_QWORD *)(v23 + 4) = "-[__NSDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(_QWORD *)(v23 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSDictionaryM getObjects:andKeys:count:]", a5);
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
    objc_exception_throw(v24);
  }
  mutations = self->storage.var0.var0.mutations;
  v12 = mutations >> 58;
  v13 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v13 >= a5)
    v13 = a5;
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v15 = 0;
    v16 = LODWORD(__NSDictionarySizes_0[v12]);
    buffer = self->storage.buffer;
    do
    {
      v18 = buffer[v15];
      if (v18)
        v19 = v18 == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v19 = 1;
      if (!v19)
      {
        if (a4)
          *a4++ = v18;
        if (a3)
          *a3++ = *(&buffer[v16] + v15);
        --v13;
      }
      ++v15;
    }
    while (v15 < v16 && v13);
  }
}

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t var0;
  unint64_t v11;
  state **buffer;
  unint64_t result;
  state *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSException *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
    goto LABEL_4;
  }
  if (a5)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v23 - ((MEMORY[0x1E0C80A78](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = _os_log_pack_fill();
    *(_DWORD *)v19 = 136315394;
    *(_QWORD *)(v19 + 4) = "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(_QWORD *)(v19 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_23;
  }
LABEL_4:
  if (a5 >> 61)
  {
    v16 = _os_log_pack_size();
    v18 = (char *)v23 - ((MEMORY[0x1E0C80A78](v16, v20) + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = _os_log_pack_fill();
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(_QWORD *)(v21 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]", a5);
LABEL_23:
    v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v18, v16);
    objc_exception_throw(v22);
  }
  var0 = a3->var0;
  v11 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((self->storage.var0.var0.mutations >> 55) & 0x1F8));
  if (!a3->var0)
    a3->var2 = &self->storage.var0.var0.mutations;
  if (var0 >= v11)
    return 0;
  buffer = self->storage.buffer;
  a3->var1 = a4;
  result = 0;
  if (a5)
  {
    do
    {
      v14 = buffer[var0];
      if (v14)
        v15 = v14 == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v15 = 1;
      if (!v15)
        a4[result++] = v14;
      ++var0;
    }
    while (var0 < v11 && result < a5);
  }
  a3->var0 = var0;
  return result;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v6;
  unint64_t mutations;
  state **buffer;
  size_t v10;
  size_t v11;
  state *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  NSException *v19;
  _BYTE v20[16];
  _QWORD v21[8];

  v6 = a3;
  v21[7] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
    if (a4)
      goto LABEL_3;
LABEL_14:
    v15 = _os_log_pack_size();
    v17 = &v20[-((MEMORY[0x1E0C80A78](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0)];
    v18 = _os_log_pack_fill();
    *(_DWORD *)v18 = 136315138;
    *(_QWORD *)(v18 + 4) = "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v17, v15);
    objc_exception_throw(v19);
  }
  if (!a4)
    goto LABEL_14;
LABEL_3:
  buffer = self->storage.buffer;
  mutations = self->storage.var0.var0.mutations;
  v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v21[3] = &unk_1E1337580;
  v21[4] = a4;
  v21[5] = buffer;
  v21[6] = &buffer[v10];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v21) & 1) == 0)
  {
    v20[15] = 0;
    if (mutations >> 58)
    {
      v11 = 0;
      do
      {
        v12 = buffer[v11];
        if (v12)
          v13 = v12 == (state *)&___NSDictionaryM_DeletedMarker;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v14);
        }
        ++v11;
      }
      while (v11 < v10);
    }
  }
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  unint64_t mutations;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSException *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = atomic_load((unint64_t *)&self->cow);
  mutations = self->storage.var0.var0.mutations;
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D)
    v8 = (mutations & 0x7FFFFFFF) + 1;
  else
    v8 = 0;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6))
      -[__NSDictionaryM removeObjectForKey:].cold.1();
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    mutations = self->storage.var0.var0.mutations;
  }
  self->storage.var0.var0.mutations = mutations & 0xFFFFFFFF80000000 | v8;
  if (!a3)
  {
    v10 = _os_log_pack_size();
    v12 = (char *)v15 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v13 + 4) = "-[__NSDictionaryM removeObjectForKey:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: key cannot be nil"), "-[__NSDictionaryM removeObjectForKey:]");
    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v14);
  }
  mdict_removeObjectForKey((uint64_t *)self, a3);
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v3;
  $90C7FAF6EC27E5178BC4117F5D7BFD66 *p_storage;
  unint64_t mutations;
  unint64_t v8;
  state **buffer;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  state *v13;
  unint64_t v14;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  p_storage = &self->storage;
  mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58))
    return 0;
  v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  v10 = objc_msgSend(a3, "hash") % v8;
  v11 = v8 <= 1 ? 1 : v8;
  v12 = v8;
  while (1)
  {
    v13 = buffer[v10];
    if (!v13)
      break;
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v12 == v8)
        v12 = v10;
    }
    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      v12 = v10;
      goto LABEL_23;
    }
    if (v10 + 1 >= v8)
      v14 = v8;
    else
      v14 = 0;
    v10 = v10 + 1 - v14;
    if (!--v11)
      goto LABEL_23;
  }
  if (v12 == v8)
    v12 = v10;
LABEL_23:
  if (v12 < v8)
    return *(&buffer[v8] + v12);
  else
    return 0;
}

- (id)_cfMutableCopy
{
  id result;

  result = -[__NSDictionaryM mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
  *((_QWORD *)result + 2) = *((_QWORD *)result + 2) & 0xFFFFFFFF7FFFFFFFLL | (((self->storage.var0.var0.mutations >> 31) & 1) << 31);
  return result;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  unint64_t v4;
  unint64_t v6;
  state **buffer;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSException *v11;

  if (!a3)
  {
    v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: function pointer is NULL"), v10);
    v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
    objc_exception_throw(v11);
  }
  v4 = self->storage.var0.var0.mutations >> 58;
  if (v4)
  {
    v6 = v4;
    buffer = self->storage.buffer;
    if (LODWORD(__NSDictionarySizes_0[v6]) <= 1uLL)
      v8 = 1;
    else
      v8 = LODWORD(__NSDictionarySizes_0[v6]);
    do
    {
      if (*buffer)
        v9 = *buffer == (state *)&___NSDictionaryM_DeletedMarker;
      else
        v9 = 1;
      if (!v9)
        ((void (*)(void))a3)();
      ++buffer;
      --v8;
    }
    while (v8);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  unint64_t *p_cow;
  _WORD *v7;
  objc_class *v9;
  id v10;
  os_unfair_lock_s *v11;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v7);
  }
LABEL_9:
  v9 = (objc_class *)objc_opt_self();
  v10 = __CFAllocateObject(v9, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

- (id)mutableCopy
{
  uint64_t v2;
  unint64_t *p_cow;
  _WORD *v6;
  objc_class *v8;
  id v9;
  os_unfair_lock_s *v10;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v6);
  }
LABEL_9:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  unint64_t *p_cow;
  _WORD *v7;
  id v9;
  objc_class *v10;
  os_unfair_lock_s *v11;

  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction)
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (!-[__NSDictionaryM count](self, "count", a3))
    return &__NSDictionary0__struct;
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_10;
    }
    __clrex();
    free(v7);
  }
LABEL_10:
  v10 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v10, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v9, 0);
  return v9;
}

- (id)copy
{
  uint64_t v2;
  unint64_t *p_cow;
  _WORD *v6;
  id v8;
  objc_class *v9;
  os_unfair_lock_s *v10;

  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction)
      __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  if (!-[__NSDictionaryM count](self, "count"))
    return &__NSDictionary0__struct;
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_10;
    }
    __clrex();
    free(v6);
  }
LABEL_10:
  v9 = (objc_class *)objc_opt_self();
  v8 = __CFAllocateObject(v9, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSDictionary_cowCallbacks, (uint64_t)v8, 0);
  return v8;
}

- (void)removeAllObjects
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (id)keyEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  uint64_t v9;
  uint64_t v10;
  NSException *v11;
  _QWORD v12[2];

  v6 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
    if (a4)
      return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, v6, (uint64_t)a4);
LABEL_5:
    v9 = _os_log_pack_size();
    v10 = _os_log_pack_fill();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: predicate cannot be nil"), "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]");
    v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
    objc_exception_throw(v11);
  }
  if (!a4)
    goto LABEL_5;
  return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, v6, (uint64_t)a4);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v3;
  uint64_t v6;
  unint64_t mutations;
  unint64_t v8;
  uint64_t v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  v6 = atomic_load((unint64_t *)&self->cow);
  mutations = self->storage.var0.var0.mutations;
  v8 = mutations;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6))
      -[__NSDictionaryM setObservationInfo:].cold.1();
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    v8 = self->storage.var0.var0.mutations;
  }
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D)
    v10 = (mutations & 0x7FFFFFFF) + 1;
  else
    v10 = 0;
  self->storage.var0.var0.mutations = v10 | ((unint64_t)(a3 != 0) << 57) | v8 & 0xFDFFFFFF80000000;
  v11.receiver = self;
  v11.super_class = (Class)__NSDictionaryM;
  -[__NSDictionaryM setObservationInfo:](&v11, sel_setObservationInfo_, a3);
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  char v6;
  unint64_t mutations;
  state **buffer;
  size_t v10;
  state *v11;
  uint64_t v12;
  state *v13;
  BOOL v14;
  state *v15;
  void *v16;
  char v18;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  buffer = self->storage.buffer;
  mutations = self->storage.var0.var0.mutations;
  v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v19[3] = &unk_1E13375A8;
  v19[6] = buffer;
  v19[7] = &buffer[v10];
  v19[4] = a4;
  v19[5] = &v20;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v19))
  {
    v11 = (state *)atomic_load((unint64_t *)v21 + 3);
  }
  else
  {
    v18 = 0;
    v11 = 0;
    if (mutations >> 58)
    {
      if (v10 <= 1)
        v12 = 1;
      else
        v12 = v10;
      do
      {
        v13 = *buffer;
        if (*buffer)
          v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
        else
          v14 = 1;
        if (!v14)
        {
          v15 = buffer[v10];
          v16 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v13, v15, &v18))
          {
            v18 = 1;
            v11 = v13;
          }
          _CFAutoreleasePoolPop(v16);
          if (v18)
            break;
        }
        ++buffer;
        --v12;
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  unint64_t mutations;
  uint64_t v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  v8 = atomic_load((unint64_t *)&self->cow);
  mutations = self->storage.var0.var0.mutations;
  if (((mutations >> 9) & 0x3FFFFF) < 0x7D)
    v10 = (mutations & 0x7FFFFFFF) + 1;
  else
    v10 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSDictionaryM removeEntriesWithOptions:passingTest:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    mutations = self->storage.var0.var0.mutations;
  }
  self->storage.var0.var0.mutations = mutations & 0xFFFFFFFF80000000 | v10;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = -[__NSDictionaryM keysOfEntriesWithOptions:passingTest:](self, "keysOfEntriesWithOptions:passingTest:", a3, a4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[__NSDictionaryM removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v14);
  }
}

- (double)_clumpingFactor
{
  unint64_t mutations;
  size_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  double v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  size_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  mutations = self->storage.var0.var0.mutations;
  v4 = HIDWORD(mutations) & 0x1FFFFFF;
  if ((mutations & 0x1FFFFFE00000000) != 0)
    v5 = HIDWORD(mutations) & 0x1FFFFFF;
  else
    v5 = 1;
  v6 = MEMORY[0x1E0C80A78](v5, a2);
  v8 = (char *)&v24 - v7;
  v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((v9 >> 55) & 0x1F8));
  v24 = 0;
  if (v4 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage(v6, 0, &v24);
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }
  -[__NSDictionaryM getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0, v8, v4, v24, v25);
  v12 = 0.0;
  if (v4 >= 2)
  {
    v13 = 8 * v4;
    v14 = (uint64_t *)malloc_type_malloc(8 * v4 + 8, 0xDD117B67uLL);
    v15 = 0;
    do
    {
      v14[v15 / 8] = objc_msgSend(*(id *)&v8[v15], "hash") % v10;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_2);
    v16 = 0;
    v17 = *v14;
    v14[v4] = *v14 + v10;
    v18 = (double)v10 / (double)v4;
    v19 = 0.0;
    do
    {
      v20 = v14[v16 / 8 + 1];
      v21 = v20 - v17;
      if (v18 <= (double)v21)
        v22 = 0.0;
      else
        v22 = v18 - (double)v21;
      v19 = v19 + v22 * v22;
      v16 += 8;
      v17 = v20;
    }
    while (v13 != v16);
    free(v14);
    v12 = v19 * (double)v4 * (double)v4 / ((double)v10 * (double)v10) / ((double)v4 + -1.0);
  }
  free(v11);
  return v12;
}

- (double)_clumpingInterestingThreshold
{
  unint64_t mutations;
  double v3;

  mutations = self->storage.var0.var0.mutations;
  v3 = (double)*(unsigned int *)((char *)&__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  return 1.0
       - ((double)(HIDWORD(mutations) & 0x1FFFFFF) + (double)(HIDWORD(mutations) & 0x1FFFFFF)) / v3
       + (double)(HIDWORD(mutations) & 0x1FFFFFF) * (double)(HIDWORD(mutations) & 0x1FFFFFF) / v3 / v3;
}

- (void)removeObjectForKey:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObject:forKey:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObject:forKeyedSubscript:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)__setObject:forKey:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObservationInfo:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)removeEntriesWithOptions:passingTest:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

@end
