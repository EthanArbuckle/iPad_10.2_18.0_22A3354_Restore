void sub_1CCD49AB8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id propertyIMP(void *a1, const char *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17B6230]();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hmbPropertyIsAvailable:", v7) & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "hmbProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "hmbReserved");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {

          objc_autoreleasePoolPop(v6);
          goto LABEL_17;
        }
        objc_msgSend(v9, "defaultValue");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_16:

        objc_autoreleasePoolPop(v6);
        v11 = (void *)v21;
        goto LABEL_17;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v5;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v20;
        v25 = 2112;
        v26 = v7;
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempting to read property %@ from %@, does not appear defined.", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v11 = 0;
    }
    v21 = 0;
    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = v5;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmbContainerDataVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v15;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to read property %@ on %@, unavailable in homed data version %@ (returning nil).", (uint8_t *)&v23, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);

  objc_autoreleasePoolPop(v6);
  v11 = 0;
LABEL_17:

  return v11;
}

void setPropertyIMP(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  keyFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hmbPropertyIsReadOnly:", v11))
  {
    objc_msgSend((id)objc_opt_class(), "hmbProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_msgSend(v18, "classObj");

    if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99768];
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v19)
      {
        NSStringFromClass(v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Property for parameter %@ was supplied as %@, but was expected to be %@."), v11, v29, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v33, 0);
        v31 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Property for parameter %@ was supplied as %@, but was expected to be <UNKNOWN>."), v11, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v30, 0);
        v31 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_exception_throw(v31);
    }
    objc_msgSend(v10, "hmbReserved");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v6)
      {
LABEL_12:
        objc_msgSend(v10, "hmbReserved");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmf_stringWithSmallestEncoding");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v6, v22);

        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHmbReserved:", v23);

      if (v6)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = v10;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmbContainerDataVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v15;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v13;
    v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempting to write property %@ on %@, unwritable in homed data version %@.", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
LABEL_13:

  objc_autoreleasePoolPop(v7);
}

id keyFromSelector(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "hasPrefix:", CFSTR("set")) || objc_msgSend(v1, "length") == 3)
    goto LABEL_6;
  objc_msgSend(v1, "substringWithRange:", 3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (!v4)
  {
    objc_msgSend(v2, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringWithRange:", 4, objc_msgSend(v1, "length") - 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v8;
LABEL_6:
    v5 = v1;
    goto LABEL_7;
  }
  v5 = v1;

LABEL_7:
  return v5;
}

void sub_1CCD4B454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __getRebuilder(void *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  v1 = a1;
  os_unfair_lock_lock_with_options();
  -[os_unfair_lock_s rebuilder](v1, "rebuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v1 + 2);

  return v2;
}

void sub_1CCD4C378(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __createRebuilderIfNeeded(void *a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMBSharedCloudZoneRebuilder *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock_with_options();
  -[os_unfair_lock_s cloudDatabase](v1, "cloudDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManateeContainer");

  if (!v4)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  -[os_unfair_lock_s rebuilder](v1, "rebuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[os_unfair_lock_s rebuilder](v1, "rebuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rebuildCompleteFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFinished");

    if (v8)
    {
      -[os_unfair_lock_s setRebuilder:](v1, "setRebuilder:", 0);
      v9 = 0;
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[os_unfair_lock_s rebuilder](v1, "rebuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_15;
  -[os_unfair_lock_s cloudZoneID](v1, "cloudZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "scope");

  if (v14 != 2)
  {
    -[os_unfair_lock_s cloudZoneID](v1, "cloudZoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "scope");

    if (v17 == 3)
    {
      v15 = -[HMBSharedCloudZoneRebuilder initWithCloudZone:]([HMBSharedCloudZoneRebuilder alloc], "initWithCloudZone:", v1);
      -[os_unfair_lock_s setRebuilder:](v1, "setRebuilder:", v15);
      goto LABEL_14;
    }
LABEL_6:
    v11 = 1;
    goto LABEL_16;
  }
  v15 = -[HMBPrivateCloudZoneRebuilder initWithCloudZone:]([HMBPrivateCloudZoneRebuilder alloc], "initWithCloudZone:", v1);
  -[os_unfair_lock_s setRebuilder:](v1, "setRebuilder:", v15);
LABEL_14:

LABEL_15:
  v11 = 0;
LABEL_16:
  -[os_unfair_lock_s rebuilder](v1, "rebuilder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v1 + 2);
  v19 = (void *)MEMORY[0x1D17B6230]();
  v20 = v1;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v23;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Rebuilder not allowed on zone.", (uint8_t *)&v28, 0xCu);

    }
  }
  else if (v10)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v24;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-Created rebuilder for zone (existed but had completed).", (uint8_t *)&v28, 0xCu);

    }
  }
  else if (v9)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v25;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-using rebuilder for zone.", (uint8_t *)&v28, 0xCu);

    }
  }
  else if (v22)
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v26;
    _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Created rebuilder for zone.", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v19);

  return v18;
}

void sub_1CCD4C714(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void __destroyRebuilder(void *a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock_with_options();
  -[os_unfair_lock_s setRebuilder:](v1, "setRebuilder:", 0);
  os_unfair_lock_unlock(v1 + 2);

  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = v1;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Destroyed rebuilder for zone.", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);

}

void sub_1CCD4C84C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD4D880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id ____fetchNextBatch_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  sqlite3_stmt *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;

  v3 = a2;
  if (*(_DWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "statement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v4, "statement");
    v6 = *(_DWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "currentSequence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    hmbBindIntSQLite3(v5, v6, objc_msgSend(v7, "longLongValue"), &v27);
    v8 = v27;

  }
  else
  {
    v8 = 0;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "statement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  objc_msgSend(v9, "bindPropertiesToStatement:error:", objc_msgSend(v10, "statement"), &v26);
  v11 = v26;

  objc_msgSend(*(id *)(a1 + 32), "statement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "statement");
  v14 = *(_QWORD *)(a1 + 64);
  v25 = v11;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = ____fetchNextBatch_block_invoke_2;
  v22[3] = &unk_1E8932B88;
  v21 = *(_OWORD *)(a1 + 32);
  v15 = (id)v21;
  v16 = *(_OWORD *)(a1 + 48);
  v23 = v21;
  v24 = v16;
  LOBYTE(v14) = objc_msgSend(v3, "fetchSQLite3:limit:error:block:", v13, v14, &v25, v22);
  v17 = v25;

  if ((v14 & 1) == 0)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

  }
  return v17;
}

id ____fetchNextBatch_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  char v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v12 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
  v11 = 0;
  objc_msgSend(v5, "fetchRowFromStatement:skip:updatedSequence:error:", a2, &v12, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    if (!v12)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
    v9 = 0;
  }
  else
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setCurrentSequence:", 0);
    v9 = v8;
  }

  return v9;
}

void sub_1CCD4EB18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD4F020(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD4F1F4(_Unwind_Exception *a1)
{
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1CCD4FA90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD50E2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD514D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __processRecords(void *a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  id v70;
  NSObject *v71;
  id v72;
  void *v73;
  void *v74;
  int v75;
  _BOOL4 v76;
  void *v77;
  id v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  BOOL v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  uint64_t v108;
  id v109;
  void *v110;
  id v111;
  NSObject *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  BOOL v118;
  int v119;
  void *v120;
  id v121;
  NSObject *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  BOOL v127;
  id v128;
  NSObject *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  HMBLocalSQLContextRowItem *v135;
  HMBLocalZoneProcessModelContext *v136;
  HMBLocalSQLContextRowItem *v137;
  void *v138;
  id v139;
  NSObject *v140;
  id v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  NSObject *v147;
  id v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  id v154;
  NSObject *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  NSObject *v162;
  id v163;
  void *v164;
  void *v165;
  uint64_t v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  NSObject *v173;
  id v174;
  void *v175;
  void *v176;
  uint64_t v177;
  id v178;
  void *v179;
  id v180;
  NSObject *v181;
  id v182;
  void *v183;
  void *v184;
  uint64_t v185;
  int v186;
  void *v187;
  id v188;
  NSObject *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  NSObject *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  HMBLocalZoneProcessModelContext *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  id v208;
  NSObject *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  HMBLocalZoneProcessModelContext *v215;
  void *v216;
  void *v217;
  NSObject *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  HMBLocalZoneProcessModelContext *v225;
  uint64_t v226;
  void *v227;
  HMBLocalZoneProcessModelContext *v228;
  void *v229;
  void *v230;
  HMBLocalSQLContextRowItem *v231;
  void *v232;
  void *v233;
  void *v234;
  uint64_t v235;
  HMBLocalSQLContextRowItem *v236;
  HMBLocalSQLContextRowItem *v237;
  HMBLocalSQLContextRowItem *v238;
  void *v239;
  id v240;
  HMBLocalZoneProcessTuple *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  void *v246;
  HMBLocalZoneProcessTuple *v247;
  void *v248;
  id v249;
  NSObject *v250;
  id v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  NSObject *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  uint64_t v262;
  BOOL v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  id v269;
  void *v270;
  id v271;
  NSObject *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  int v290;
  void *v291;
  BOOL v292;
  void *v293;
  id v294;
  NSObject *v295;
  id v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  id v301;
  id v302;
  id v303;
  id v304;
  id v305;
  void *v306;
  id v307;
  NSObject *v308;
  id v309;
  void *v310;
  void *v311;
  uint64_t v312;
  void *v313;
  void *v314;
  id v315;
  NSObject *v316;
  id v317;
  void *v318;
  void *v319;
  void *v320;
  HMBProcessingModelUpdate *v321;
  void *v322;
  void *v323;
  HMBProcessingModelUpdate *v324;
  void *v325;
  void *v326;
  void *v327;
  id v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t j;
  void *v332;
  void *v333;
  id v334;
  NSObject *v335;
  id v336;
  void *v337;
  void *v338;
  void *v339;
  HMBProcessingModelDeletion *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t m;
  void *v348;
  NSObject *v349;
  id v350;
  void *v351;
  void *v352;
  void *v353;
  HMBProcessingModelCreation *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t k;
  void *v362;
  id v363;
  char v364;
  id v365;
  void *v366;
  id v367;
  void *v368;
  void *v369;
  id v370;
  void (*v371)(uint64_t);
  uint64_t v372;
  void *v373;
  id v374;
  NSObject *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  id v380;
  NSObject *v381;
  id v382;
  void *v383;
  void *v384;
  char v385;
  void *v386;
  id v387;
  NSObject *v388;
  id v389;
  void *v390;
  void *v391;
  void *v392;
  id v393;
  NSObject *v394;
  id v395;
  void *v396;
  void *v397;
  id v398;
  void *v399;
  id v400;
  NSObject *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  id v406;
  char v407;
  void *v408;
  id v409;
  NSObject *v410;
  id v411;
  void *v412;
  void *v413;
  HMBProcessingResult *v414;
  void *v415;
  uint64_t v416;
  void *v417;
  id v418;
  NSObject *v419;
  id v420;
  void *v421;
  void *v422;
  void *v423;
  id v424;
  NSObject *v425;
  id v426;
  void *v427;
  void *v428;
  void *v429;
  id v430;
  NSObject *v431;
  _BOOL4 v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  id v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  id v443;
  void *v444;
  id v445;
  void *v446;
  id v447;
  id v448;
  uint64_t v449;
  char *v451;
  id v452;
  id v453;
  id v454;
  void *v455;
  void *v456;
  uint64_t v457;
  void *v458;
  uint64_t v459;
  uint64_t v460;
  id obj;
  id obja;
  uint64_t v463;
  void *v464;
  uint64_t v465;
  uint64_t v466;
  HMBLocalZoneProcessModelContext *v467;
  void *v468;
  void *v469;
  void *v470;
  uint64_t v471;
  void *v472;
  id v473;
  void *v474;
  void *v475;
  void *v476;
  uint64_t i;
  void *v478;
  id v479;
  id v480;
  id v481;
  void *v482;
  void *v483;
  void *v484;
  uint64_t v485;
  void *v486;
  id v487;
  void *v488;
  void *v489;
  void *v490;
  id v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  id v496;
  id context;
  id contextd;
  void *contexte;
  void *contexta;
  id contextb;
  id contextc;
  id v503;
  _QWORD v504[4];
  id v505;
  id v506;
  uint64_t *v507;
  uint64_t *v508;
  id v509;
  uint64_t v510;
  uint64_t *v511;
  uint64_t v512;
  uint64_t (*v513)(uint64_t, uint64_t);
  void (*v514)(uint64_t);
  id v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  _QWORD v528[5];
  id v529;
  id v530;
  id v531;
  id v532;
  id v533;
  id v534;
  id v535;
  id v536;
  id v537;
  id v538;
  id v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  BOOL v543;
  id v544;
  id v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  id v550;
  _QWORD v551[4];
  id v552;
  id v553;
  id v554;
  id v555;
  _QWORD v556[5];
  id v557;
  _QWORD v558[5];
  _QWORD v559[7];
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  id v564;
  _QWORD v565[8];
  uint64_t v566;
  uint64_t *v567;
  uint64_t v568;
  uint64_t (*v569)(uint64_t, uint64_t);
  void (*v570)(uint64_t);
  id v571;
  id v572;
  _QWORD v573[6];
  id v574;
  uint64_t v575;
  uint64_t *v576;
  uint64_t v577;
  uint64_t (*v578)(uint64_t, uint64_t);
  void (*v579)(uint64_t);
  id v580;
  id v581;
  id v582;
  _QWORD v583[6];
  id v584;
  uint64_t v585;
  uint64_t *v586;
  uint64_t v587;
  uint64_t (*v588)(uint64_t, uint64_t);
  void (*v589)(uint64_t);
  id v590;
  id location;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t (*v595)(uint64_t, uint64_t);
  void (*v596)(uint64_t);
  id v597;
  id v598;
  _BYTE v599[128];
  _BYTE v600[128];
  _BYTE v601[128];
  uint8_t v602[128];
  _BYTE buf[24];
  void *v604;
  _BYTE v605[20];
  __int16 v606;
  id v607;
  _BYTE v608[128];
  uint64_t v609;

  v609 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v448 = a3;
  objc_msgSend(v4, "localDatabase");
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v446, "local");
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v460 = objc_msgSend(v4, "zoneRow");
  v5 = objc_alloc(MEMORY[0x1E0D28540]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "__processRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v488 = (void *)objc_msgSend(v5, "initWithName:", v6);

  v7 = (void *)MEMORY[0x1D17B6230]();
  v453 = v4;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v488, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v604 = a2;
    _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Beginning processing of block %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v585 = 0;
  v586 = &v585;
  v587 = 0x3032000000;
  v588 = __Block_byref_object_copy__560;
  v589 = __Block_byref_object_dispose__561;
  v590 = 0;
  v584 = 0;
  v583[0] = MEMORY[0x1E0C809B0];
  v583[1] = 3221225472;
  v583[2] = ____processRecords_block_invoke;
  v583[3] = &unk_1E89339F8;
  v583[4] = &v585;
  v583[5] = a2;
  v12 = objc_msgSend(v464, "sqlBlockWithActivity:error:block:", v488, &v584, v583);
  v445 = v584;
  if ((v12 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1D17B6230]();
    v22 = v453;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2048;
      v604 = a2;
      *(_WORD *)v605 = 2112;
      *(_QWORD *)&v605[2] = v22;
      *(_WORD *)&v605[10] = 2112;
      *(_QWORD *)&v605[12] = v445;
      _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch block row %lu from %@: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v448, "finishWithError:", v445);
    goto LABEL_265;
  }
  v13 = (void *)v586[5];
  if (!v13)
  {
    v27 = (void *)MEMORY[0x1D17B6230]();
    v28 = v453;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2048;
      v604 = a2;
      _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find block with row %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v448, "finishWithError:", v33);
    goto LABEL_264;
  }
  objc_msgSend(v13, "optionsData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v34 = (void *)MEMORY[0x1D17B6230]();
    v35 = v453;
    HMFGetOSLogHandle();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2048;
      v604 = a2;
      _os_log_impl(&dword_1CCD48000, v36, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Block %lu has not been committed. Ignoring process request.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v448, "finishWithError:", v33);
    goto LABEL_264;
  }
  v16 = (void *)MEMORY[0x1E0CB3710];
  v17 = objc_opt_class();
  objc_msgSend((id)v586[5], "optionsData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v582 = 0;
  objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", v17, v18, &v582);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  v443 = v582;

  if (!v456)
  {
    v40 = (void *)MEMORY[0x1D17B6230]();
    v41 = v453;
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "shortDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v604 = v443;
      _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to unarchive processing options from options data: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v40);
    v581 = 0;
    v46 = objc_msgSend(v41, "removeBlockWithRow:error:", a2, &v581);
    v47 = v581;
    if ((v46 & 1) == 0)
    {
      v48 = (void *)MEMORY[0x1D17B6230]();
      v49 = v41;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "shortDescription");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2112;
        v604 = v47;
        _os_log_impl(&dword_1CCD48000, v50, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to cleanup corrupt block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v48);
    }
    objc_msgSend(v448, "finishWithError:", v443);

    goto LABEL_263;
  }
  v575 = 0;
  v576 = &v575;
  v577 = 0x3032000000;
  v578 = __Block_byref_object_copy__560;
  v579 = __Block_byref_object_dispose__561;
  v580 = 0;
  if (objc_msgSend(v456, "shouldEnqueueMirrorOutput"))
  {
    v574 = 0;
    v573[0] = MEMORY[0x1E0C809B0];
    v573[1] = 3221225472;
    v573[2] = ____processRecords_block_invoke_104;
    v573[3] = &unk_1E89339F8;
    v573[5] = v460;
    v573[4] = &v575;
    v19 = objc_msgSend(v464, "sqlBlockWithActivity:error:block:", v488, &v574, v573);
    v20 = v574;
    if ((v19 & 1) == 0)
    {
      v455 = v20;
      v379 = (void *)MEMORY[0x1D17B6230]();
      v380 = v453;
      HMFGetOSLogHandle();
      v381 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v381, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v382 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v383, "shortDescription");
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v382;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v384;
        *(_WORD *)&buf[22] = 2048;
        v604 = (void *)v460;
        *(_WORD *)v605 = 2112;
        *(_QWORD *)&v605[2] = v455;
        _os_log_impl(&dword_1CCD48000, v381, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to insert output block for zone row %lu: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v379);
      v572 = 0;
      v385 = objc_msgSend(v380, "removeBlockWithRow:error:", a2, &v572);
      v54 = v572;
      if ((v385 & 1) == 0)
      {
        v386 = (void *)MEMORY[0x1D17B6230]();
        v387 = v380;
        HMFGetOSLogHandle();
        v388 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v388, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v389 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v488, "identifier");
          v390 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v390, "shortDescription");
          v391 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v389;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v391;
          *(_WORD *)&buf[22] = 2112;
          v604 = v54;
          _os_log_impl(&dword_1CCD48000, v388, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up corrupt block: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v386);
      }
      objc_msgSend(v448, "finishWithError:", v455);
      goto LABEL_262;
    }

  }
  if (objc_msgSend(v456, "shouldRollBackIfMirrorOutputFails"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v455 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v455 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  if (v576[5])
  {
    v452 = objc_alloc_init(MEMORY[0x1E0D519C0]);

  }
  else
  {
    v452 = 0;
  }
  v463 = 0;
  v451 = 0;
  v449 = objc_msgSend((id)v586[5], "type");
  v566 = 0;
  v567 = &v566;
  v568 = 0x3032000000;
  v569 = __Block_byref_object_copy__560;
  v570 = __Block_byref_object_dispose__561;
  v571 = 0;
  do
  {
    v444 = (void *)MEMORY[0x1D17B6230]();
    v55 = (void *)MEMORY[0x1D17B6230]();
    v447 = v453;
    HMFGetOSLogHandle();
    v56 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v57 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "shortDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2048;
      v604 = a2;
      *(_WORD *)v605 = 2112;
      *(_QWORD *)&v605[2] = v456;
      *(_WORD *)&v605[10] = 2048;
      *(_QWORD *)&v605[12] = v463;
      _os_log_impl(&dword_1CCD48000, v56, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetching objects for blockRow: %lu options: %@ lastItemRowID: %lu", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v55);
    v60 = objc_msgSend(v456, "transactionItemsBatchLimit");
    v565[0] = MEMORY[0x1E0C809B0];
    v61 = 100;
    if (v60)
      v61 = v60;
    v565[1] = 3221225472;
    v565[2] = ____processRecords_block_invoke_108;
    v565[3] = &unk_1E89313A8;
    v565[4] = &v566;
    v565[5] = a2;
    v565[6] = v463;
    v565[7] = v61;
    objc_msgSend(v464, "sqlBlockWithActivity:block:", v488, v565);
    context = (id)objc_claimAutoreleasedReturnValue();
    if (!context)
    {
      v76 = objc_msgSend((id)v567[5], "count") == 0;
      v77 = (void *)MEMORY[0x1D17B6230]();
      v78 = v447;
      if (v76)
      {
        v256 = v78;
        HMFGetOSLogHandle();
        v257 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v257, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v258 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v488, "identifier");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v259, "shortDescription");
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v258;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v260;
          _os_log_impl(&dword_1CCD48000, v257, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] No more rows to process", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v77);
        v75 = 19;
        goto LABEL_222;
      }
      v495 = v78;
      HMFGetOSLogHandle();
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v80 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "shortDescription");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend((id)v567[5], "count");
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v80;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v82;
        *(_WORD *)&buf[22] = 2048;
        v604 = (void *)v83;
        *(_WORD *)v605 = 2048;
        *(_QWORD *)&v605[2] = a2;
        *(_WORD *)&v605[10] = 2112;
        *(_QWORD *)&v605[12] = v456;
        _os_log_impl(&dword_1CCD48000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Fetched %lu object(s) to process for blockRow: %lu options: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v77);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v567[5], "count"));
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      v563 = 0u;
      v562 = 0u;
      v561 = 0u;
      v560 = 0u;
      obj = (id)v567[5];
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v560, v608, 16);
      if (!v84)
      {
        context = 0;
        goto LABEL_142;
      }
      context = 0;
      v465 = *(_QWORD *)v561;
      while (1)
      {
        v485 = 0;
        v471 = v84;
        v451 += v84;
        do
        {
          if (*(_QWORD *)v561 != v465)
            objc_enumerationMutation(obj);
          v85 = *(void **)(*((_QWORD *)&v560 + 1) + 8 * v485);
          v463 = objc_msgSend(v85, "itemRow");
          v592 = 0;
          v593 = (uint64_t)&v592;
          v594 = 0x3032000000;
          v595 = __Block_byref_object_copy__560;
          v596 = __Block_byref_object_dispose__561;
          v597 = 0;
          v86 = objc_msgSend(v85, "modelEncoding");
          if (v86)
          {
            objc_msgSend(v85, "modelData");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v85, "modelEncoding");
            v557 = context;
            objc_msgSend(v495, "modelFromData:encoding:storageLocation:recordRowID:error:", v87, v88, 2, 0, &v557);
            v489 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v557;

            if (v489)
            {
              objc_msgSend(v464, "queryContextsByClass");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKey:", objc_opt_class());
              v474 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v489, "hmbModelID");
              v91 = objc_claimAutoreleasedReturnValue();
              v92 = *(void **)(v593 + 40);
              *(_QWORD *)(v593 + 40) = v91;

              context = v89;
              goto LABEL_58;
            }
            v138 = (void *)MEMORY[0x1D17B6230]();
            v139 = v495;
            HMFGetOSLogHandle();
            v140 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v141 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v488, "identifier");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "shortDescription");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              v144 = objc_msgSend(v85, "itemRow");
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v141;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 2048;
              v604 = (void *)v144;
              *(_WORD *)v605 = 2112;
              *(_QWORD *)&v605[2] = v453;
              *(_WORD *)&v605[10] = 2112;
              *(_QWORD *)&v605[12] = v89;
              _os_log_impl(&dword_1CCD48000, v140, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to unarchive object for %lu / %@: %@", buf, 0x34u);

            }
            objc_autoreleasePoolPop(v138);
            v556[0] = MEMORY[0x1E0C809B0];
            v556[1] = 3221225472;
            v556[2] = ____processRecords_block_invoke_112;
            v556[3] = &unk_1E8933B28;
            v556[4] = v85;
            objc_msgSend(v464, "sqlBlockWithActivity:block:", v488, v556);
            context = (id)objc_claimAutoreleasedReturnValue();

            if (context)
            {
              v145 = (void *)MEMORY[0x1D17B6230]();
              v146 = v139;
              HMFGetOSLogHandle();
              v147 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v148 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v149, "shortDescription");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                v151 = objc_msgSend(v85, "itemRow");
                *(_DWORD *)buf = 138544386;
                *(_QWORD *)&buf[4] = v148;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v150;
                *(_WORD *)&buf[22] = 2048;
                v604 = (void *)v151;
                *(_WORD *)v605 = 2112;
                *(_QWORD *)&v605[2] = v453;
                *(_WORD *)&v605[10] = 2112;
                *(_QWORD *)&v605[12] = context;
                _os_log_impl(&dword_1CCD48000, v147, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to flush bogus row for %lu / %@: %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(v145);
            }
          }
          else
          {
            objc_msgSend(v85, "modelData");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v93 == 0;

            if (!v94)
            {
              v95 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v85, "modelData");
              v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v97 = objc_msgSend(v95, "initWithUUIDBytes:", objc_msgSend(v96, "bytes"));
              v98 = *(void **)(v593 + 40);
              *(_QWORD *)(v593 + 40) = v97;

              v489 = 0;
              v474 = 0;
              goto LABEL_58;
            }
            v559[0] = MEMORY[0x1E0C809B0];
            v559[1] = 3221225472;
            v559[2] = ____processRecords_block_invoke_110;
            v559[3] = &unk_1E89336B0;
            v559[6] = v460;
            v559[5] = &v592;
            v559[4] = v85;
            objc_msgSend(v464, "sqlBlockWithActivity:block:", v488, v559);
            v152 = (void *)objc_claimAutoreleasedReturnValue();

            if (v152)
            {
              v153 = (void *)MEMORY[0x1D17B6230]();
              v154 = v495;
              HMFGetOSLogHandle();
              v155 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v156 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "shortDescription");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "externalID");
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                *(_QWORD *)&buf[4] = v156;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v158;
                *(_WORD *)&buf[22] = 2048;
                v604 = (void *)v460;
                *(_WORD *)v605 = 2112;
                *(_QWORD *)&v605[2] = v159;
                *(_WORD *)&v605[10] = 2112;
                *(_QWORD *)&v605[12] = v152;
                _os_log_impl(&dword_1CCD48000, v155, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to determine modelID for %lu / %@: %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(v153);
            }
            else if (*(_QWORD *)(v593 + 40))
            {
              v489 = 0;
              v474 = 0;
              context = 0;
LABEL_58:
              v99 = (void *)MEMORY[0x1D17B6230]();
              v100 = v495;
              HMFGetOSLogHandle();
              v101 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v102 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "shortDescription");
                v104 = objc_claimAutoreleasedReturnValue();
                v105 = (void *)v104;
                v106 = *(void **)(v593 + 40);
                v107 = CFSTR("update/insert");
                if (!v86)
                  v107 = CFSTR("delete");
                *(_DWORD *)buf = 138544386;
                *(_QWORD *)&buf[4] = v102;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v104;
                *(_WORD *)&buf[22] = 2112;
                v604 = v106;
                *(_WORD *)v605 = 2112;
                *(_QWORD *)&v605[2] = v107;
                *(_WORD *)&v605[10] = 2112;
                *(_QWORD *)&v605[12] = v85;
                _os_log_impl(&dword_1CCD48000, v101, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Found modelID %@ to %@ for row: %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(v99);

              v108 = *(_QWORD *)(v593 + 40);
              v555 = 0;
              objc_msgSend(v100, "fetchRecordRowWithModelID:returning:error:", v108, -1, &v555);
              v492 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = v555;
              v479 = v109;
              if (v492)
              {
                v110 = (void *)MEMORY[0x1D17B6230]();
                v111 = v100;
                HMFGetOSLogHandle();
                v112 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v113 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "identifier");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "shortDescription");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  v116 = *(void **)(v593 + 40);
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v113;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v115;
                  *(_WORD *)&buf[22] = 2112;
                  v604 = v116;
                  *(_WORD *)v605 = 2112;
                  *(_QWORD *)&v605[2] = v492;
                  _os_log_impl(&dword_1CCD48000, v112, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Found existing record for modelID %@: %@", buf, 0x2Au);

                }
                goto LABEL_65;
              }
              v127 = v109 == 0;
              v110 = (void *)MEMORY[0x1D17B6230]();
              v128 = v100;
              if (!v127)
              {
                HMFGetOSLogHandle();
                v129 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v130 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "identifier");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "shortDescription");
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  v133 = *(void **)(v593 + 40);
                  objc_msgSend(v85, "externalID");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544642;
                  *(_QWORD *)&buf[4] = v130;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v132;
                  *(_WORD *)&buf[22] = 2112;
                  v604 = v133;
                  *(_WORD *)v605 = 2048;
                  *(_QWORD *)&v605[2] = v460;
                  *(_WORD *)&v605[10] = 2112;
                  *(_QWORD *)&v605[12] = v134;
                  v606 = 2112;
                  v607 = v479;
                  _os_log_impl(&dword_1CCD48000, v129, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to find existing model with modelID %@ for %lu / %@: %@", buf, 0x3Eu);

                }
                objc_autoreleasePoolPop(v110);
                v135 = [HMBLocalSQLContextRowItem alloc];
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v476 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v476, "data");
                v467 = (HMBLocalZoneProcessModelContext *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v593 + 40), "data");
                v136 = (HMBLocalZoneProcessModelContext *)objc_claimAutoreleasedReturnValue();
                v137 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](v135, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", 0, v467, v136, 0, 0);
                objc_msgSend(v455, "addObject:", v137);
LABEL_128:

LABEL_129:
                context = v479;
LABEL_130:

                goto LABEL_131;
              }
              HMFGetOSLogHandle();
              v112 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v167 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "shortDescription");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v170 = *(void **)(v593 + 40);
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v167;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v169;
                *(_WORD *)&buf[22] = 2112;
                v604 = v170;
                _os_log_impl(&dword_1CCD48000, v112, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Did not find existing record for modelID %@", buf, 0x20u);

              }
LABEL_65:

              objc_autoreleasePoolPop(v110);
              if (objc_msgSend(v492, "modelEncoding"))
              {
                objc_msgSend(v492, "modelData");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                v118 = objc_msgSend(v117, "length") == 0;

                if (!v118)
                {
                  v554 = v479;
                  objc_msgSend(v100, "modelFromRecord:storageLocation:error:", v492, 2, &v554);
                  v476 = (void *)objc_claimAutoreleasedReturnValue();
                  context = v554;

                  if (v476)
                  {
                    if (v489)
                    {
                      v119 = objc_msgSend(v456, "requiresModelCreation");
                      v120 = (void *)MEMORY[0x1D17B6230]();
                      v121 = v100;
                      if (v119)
                      {
                        HMFGetOSLogHandle();
                        v122 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v123 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v488, "identifier");
                          v124 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v124, "shortDescription");
                          v125 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v489, "hmbDescription");
                          v126 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          *(_QWORD *)&buf[4] = v123;
                          *(_WORD *)&buf[12] = 2114;
                          *(_QWORD *)&buf[14] = v125;
                          *(_WORD *)&buf[22] = 2112;
                          v604 = v126;
                          _os_log_impl(&dword_1CCD48000, v122, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Not updating model because model creation is required: %@", buf, 0x20u);

                        }
                        objc_autoreleasePoolPop(v120);
                        goto LABEL_130;
                      }
                      HMFGetOSLogHandle();
                      v218 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        v481 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v488, "identifier");
                        v469 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v469, "shortDescription");
                        v219 = (void *)objc_claimAutoreleasedReturnValue();
                        v220 = objc_msgSend(v492, "recordRow");
                        objc_msgSend(v489, "hmbDescription");
                        v221 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v85, "externalID");
                        v222 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v222, "hmbDescription");
                        v223 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544386;
                        *(_QWORD *)&buf[4] = v481;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v219;
                        *(_WORD *)&buf[22] = 2048;
                        v604 = (void *)v220;
                        *(_WORD *)v605 = 2112;
                        *(_QWORD *)&v605[2] = v221;
                        *(_WORD *)&v605[10] = 2112;
                        *(_QWORD *)&v605[12] = v223;
                        _os_log_impl(&dword_1CCD48000, v218, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating model %lu / %@ / %@", buf, 0x34u);

                      }
                      objc_autoreleasePoolPop(v120);
                      v550 = context;
                      objc_msgSend(v476, "hmbModelByMergingFromModel:isFromCloud:error:", v489, v449 == 1, &v550);
                      v224 = (void *)objc_claimAutoreleasedReturnValue();
                      v479 = v550;

                      if (!v224)
                      {
                        v248 = (void *)MEMORY[0x1D17B6230]();
                        v249 = v121;
                        HMFGetOSLogHandle();
                        v250 = (id)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
                        {
                          HMFGetLogIdentifier();
                          v251 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v488, "identifier");
                          v252 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v252, "shortDescription");
                          v253 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v476, "hmbDescription");
                          v254 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v489, "hmbDescription");
                          v255 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138544386;
                          *(_QWORD *)&buf[4] = v251;
                          *(_WORD *)&buf[12] = 2114;
                          *(_QWORD *)&buf[14] = v253;
                          *(_WORD *)&buf[22] = 2112;
                          v604 = v254;
                          *(_WORD *)v605 = 2112;
                          *(_QWORD *)&v605[2] = v255;
                          *(_WORD *)&v605[10] = 2112;
                          *(_QWORD *)&v605[12] = v479;
                          _os_log_impl(&dword_1CCD48000, v250, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to merge old record with new values %@ / %@: %@", buf, 0x34u);

                        }
                        objc_autoreleasePoolPop(v248);
                        context = v479;
                        goto LABEL_130;
                      }
                      v225 = [HMBLocalZoneProcessModelContext alloc];
                      v226 = v576[5];
                      objc_msgSend(v85, "externalData");
                      v227 = (void *)objc_claimAutoreleasedReturnValue();
                      v136 = -[HMBLocalZoneProcessModelContext initWithModel:outputBlockRow:externalData:](v225, "initWithModel:outputBlockRow:externalData:", v224, v226, v227);

                      v228 = [HMBLocalZoneProcessModelContext alloc];
                      objc_msgSend(v492, "pushBlockRow");
                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v492, "externalData");
                      v230 = (void *)objc_claimAutoreleasedReturnValue();
                      v467 = -[HMBLocalZoneProcessModelContext initWithModel:outputBlockRow:externalData:](v228, "initWithModel:outputBlockRow:externalData:", v476, v229, v230);

                      objc_msgSend((id)objc_opt_class(), "outputModelFromUpdateModel:mergedModel:", v489, v224);
                      v137 = (HMBLocalSQLContextRowItem *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v207 = (void *)MEMORY[0x1D17B6230]();
                      v208 = v100;
                      HMFGetOSLogHandle();
                      v209 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        v480 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v488, "identifier");
                        v468 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v468, "shortDescription");
                        v210 = (void *)objc_claimAutoreleasedReturnValue();
                        v211 = objc_msgSend(v492, "recordRow");
                        objc_msgSend(v476, "hmbDescription");
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v85, "externalID");
                        v213 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v213, "hmbDescription");
                        v214 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544386;
                        *(_QWORD *)&buf[4] = v480;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v210;
                        *(_WORD *)&buf[22] = 2048;
                        v604 = (void *)v211;
                        *(_WORD *)v605 = 2112;
                        *(_QWORD *)&v605[2] = v212;
                        *(_WORD *)&v605[10] = 2112;
                        *(_QWORD *)&v605[12] = v214;
                        _os_log_impl(&dword_1CCD48000, v209, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Deleting model %lu / %@ / %@", buf, 0x34u);

                      }
                      objc_autoreleasePoolPop(v207);
                      v215 = [HMBLocalZoneProcessModelContext alloc];
                      objc_msgSend(v492, "pushBlockRow");
                      v216 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v492, "externalData");
                      v217 = (void *)objc_claimAutoreleasedReturnValue();
                      v467 = -[HMBLocalZoneProcessModelContext initWithModel:outputBlockRow:externalData:](v215, "initWithModel:outputBlockRow:externalData:", v476, v216, v217);

                      v137 = 0;
                      v136 = 0;
                      v479 = context;
                    }
LABEL_119:
                    if (v455)
                    {
                      if (objc_msgSend(v492, "modelEncoding"))
                      {
                        v231 = [HMBLocalSQLContextRowItem alloc];
                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v232, "data");
                        v233 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*(id *)(v593 + 40), "data");
                        v234 = (void *)objc_claimAutoreleasedReturnValue();
                        v235 = objc_msgSend(v492, "modelEncoding");
                        objc_msgSend(v492, "modelData");
                        v236 = (HMBLocalSQLContextRowItem *)objc_claimAutoreleasedReturnValue();
                        v237 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](v231, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", 0, v233, v234, v235, v236);
                        objc_msgSend(v455, "addObject:", v237);

                      }
                      else
                      {
                        v238 = [HMBLocalSQLContextRowItem alloc];
                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                        v232 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v232, "data");
                        v233 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*(id *)(v593 + 40), "data");
                        v234 = (void *)objc_claimAutoreleasedReturnValue();
                        v236 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](v238, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", 0, v233, v234, 0, 0);
                        objc_msgSend(v455, "addObject:", v236);
                      }

                    }
                    objc_msgSend(v85, "externalData");
                    v239 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v239)
                    {
                      objc_msgSend(v85, "externalID");
                      v240 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v240 = 0;
                    }

                    v241 = [HMBLocalZoneProcessTuple alloc];
                    v242 = v576[5];
                    v243 = objc_msgSend(v492, "recordRow");
                    v244 = objc_msgSend(v85, "itemRow");
                    objc_msgSend(v492, "modelSchema");
                    v245 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v492, "modelType");
                    v246 = (void *)objc_claimAutoreleasedReturnValue();
                    v247 = -[HMBLocalZoneProcessTuple initWithPreviousContext:mergedContext:updateModel:outputModel:outputBlockRow:recordRow:itemRow:modelSchema:modelType:externalID:queryTable:](v241, "initWithPreviousContext:mergedContext:updateModel:outputModel:outputBlockRow:recordRow:itemRow:modelSchema:modelType:externalID:queryTable:", v467, v136, v489, v137, v242, v243, v244, v245, v246, v240, v474);
                    objc_msgSend(v458, "addObject:", v247);

                    goto LABEL_128;
                  }
                  v171 = (void *)MEMORY[0x1D17B6230]();
                  v172 = v100;
                  HMFGetOSLogHandle();
                  v173 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v174 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v488, "identifier");
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v175, "shortDescription");
                    v176 = (void *)objc_claimAutoreleasedReturnValue();
                    v177 = objc_msgSend(v492, "recordRow");
                    *(_DWORD *)buf = 138544130;
                    *(_QWORD *)&buf[4] = v174;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v176;
                    *(_WORD *)&buf[22] = 2048;
                    v604 = (void *)v177;
                    *(_WORD *)v605 = 2112;
                    *(_QWORD *)&v605[2] = context;
                    _os_log_impl(&dword_1CCD48000, v173, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to unarchive record row %lu: %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v171);
                  v551[0] = MEMORY[0x1E0C809B0];
                  v551[1] = 3221225472;
                  v551[2] = ____processRecords_block_invoke_118;
                  v551[3] = &unk_1E8932F30;
                  v178 = v492;
                  v552 = v178;
                  v553 = v474;
                  objc_msgSend(v464, "sqlBlockWithActivity:block:", v488, v551);
                  v479 = (id)objc_claimAutoreleasedReturnValue();

                  if (v479)
                  {
                    v179 = (void *)MEMORY[0x1D17B6230]();
                    v180 = v172;
                    HMFGetOSLogHandle();
                    v181 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v182 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v488, "identifier");
                      v183 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v183, "shortDescription");
                      v184 = (void *)objc_claimAutoreleasedReturnValue();
                      v185 = objc_msgSend(v178, "recordRow");
                      *(_DWORD *)buf = 138544130;
                      *(_QWORD *)&buf[4] = v182;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v184;
                      *(_WORD *)&buf[22] = 2048;
                      v604 = (void *)v185;
                      *(_WORD *)v605 = 2112;
                      *(_QWORD *)&v605[2] = v479;
                      _os_log_impl(&dword_1CCD48000, v181, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to remove corrupt record row %lu: %@", buf, 0x2Au);

                    }
                    objc_autoreleasePoolPop(v179);
                  }

                }
              }
              if (v489)
              {
                v186 = objc_msgSend(v456, "disallowsModelCreation");
                v187 = (void *)MEMORY[0x1D17B6230]();
                v188 = v100;
                if (!v186)
                {
                  HMFGetOSLogHandle();
                  v199 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    v200 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v488, "identifier");
                    v201 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v201, "shortDescription");
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v489, "hmbDescription");
                    v203 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v200;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v202;
                    *(_WORD *)&buf[22] = 2112;
                    v604 = v203;
                    _os_log_impl(&dword_1CCD48000, v199, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Inserting model %@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v187);
                  v204 = [HMBLocalZoneProcessModelContext alloc];
                  v205 = v576[5];
                  objc_msgSend(v85, "externalData");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  v136 = -[HMBLocalZoneProcessModelContext initWithModel:outputBlockRow:externalData:](v204, "initWithModel:outputBlockRow:externalData:", v489, v205, v206);

                  v137 = v489;
                  v476 = 0;
                  v467 = 0;
                  goto LABEL_119;
                }
                HMFGetOSLogHandle();
                v189 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v190 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "identifier");
                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v191, "shortDescription");
                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v489, "hmbDescription");
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v190;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v192;
                  *(_WORD *)&buf[22] = 2112;
                  v604 = v193;
                  _os_log_impl(&dword_1CCD48000, v189, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Not creating model because model creation is disallowed: %@", buf, 0x20u);

                }
              }
              else
              {
                v187 = (void *)MEMORY[0x1D17B6230]();
                v194 = v100;
                HMFGetOSLogHandle();
                v189 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v195 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "identifier");
                  v196 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v196, "shortDescription");
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  v198 = *(void **)(v593 + 40);
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v195;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v197;
                  *(_WORD *)&buf[22] = 2112;
                  v604 = v198;
                  _os_log_impl(&dword_1CCD48000, v189, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] No previous or updated value found for model with ID %@", buf, 0x20u);

                }
              }

              objc_autoreleasePoolPop(v187);
              v476 = 0;
              goto LABEL_129;
            }
            v558[0] = MEMORY[0x1E0C809B0];
            v558[1] = 3221225472;
            v558[2] = ____processRecords_block_invoke_111;
            v558[3] = &unk_1E8933B28;
            v558[4] = v85;
            objc_msgSend(v464, "sqlBlockWithActivity:block:", v488, v558);
            context = (id)objc_claimAutoreleasedReturnValue();

            if (context)
            {
              v160 = (void *)MEMORY[0x1D17B6230]();
              v161 = v495;
              HMFGetOSLogHandle();
              v162 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v163 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "shortDescription");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v166 = objc_msgSend(v85, "itemRow");
                *(_DWORD *)buf = 138544386;
                *(_QWORD *)&buf[4] = v163;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v165;
                *(_WORD *)&buf[22] = 2048;
                v604 = (void *)v166;
                *(_WORD *)v605 = 2112;
                *(_QWORD *)&v605[2] = v453;
                *(_WORD *)&v605[10] = 2112;
                *(_QWORD *)&v605[12] = context;
                _os_log_impl(&dword_1CCD48000, v162, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to flush bogus row for %lu / %@: %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(v160);
            }
          }
LABEL_131:
          _Block_object_dispose(&v592, 8);

          ++v485;
        }
        while (v471 != v485);
        v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v560, v608, 16);
        if (!v84)
        {
LABEL_142:

          v548 = 0u;
          v549 = 0u;
          v546 = 0u;
          v547 = 0u;
          v454 = v458;
          v459 = objc_msgSend(v454, "countByEnumeratingWithState:objects:count:", &v546, v602, 16);
          if (!v459)
            goto LABEL_220;
          v457 = *(_QWORD *)v547;
          while (1)
          {
            for (i = 0; i != v459; ++i)
            {
              if (*(_QWORD *)v547 != v457)
                objc_enumerationMutation(v454);
              v261 = *(void **)(*((_QWORD *)&v546 + 1) + 8 * i);
              objc_msgSend(v261, "previousContext");
              v475 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v261, "mergedContext");
              v493 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v261, "externalID");
              v470 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v493, "externalData");
              v486 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "outputBlockRowForTuple:activity:", v261, v488);
              v262 = objc_claimAutoreleasedReturnValue();
              v490 = (void *)v262;
              if (v486)
                v263 = 1;
              else
                v263 = v262 == 0;
              if (v263)
              {
                v482 = 0;
                v264 = 0;
                goto LABEL_161;
              }
              objc_msgSend(v261, "outputModel");
              v265 = objc_claimAutoreleasedReturnValue();
              v266 = (void *)v265;
              if (!v265)
              {
                objc_msgSend(v475, "model");
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v276, "hmbModelID");
                v277 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v277, "data");
                v482 = (void *)objc_claimAutoreleasedReturnValue();

                v264 = 0;
                v269 = context;
LABEL_159:

                goto LABEL_160;
              }
              objc_msgSend(v495, "modelContainer");
              v267 = (void *)objc_claimAutoreleasedReturnValue();
              v264 = objc_msgSend(v267, "bestModelEncodingForStorageLocation:", 3);

              objc_msgSend(v495, "modelContainer");
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              v545 = context;
              objc_msgSend(v268, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v266, v264, 3, 0, &v545);
              v482 = (void *)objc_claimAutoreleasedReturnValue();
              v269 = v545;

              if (!v482)
              {
                v270 = (void *)MEMORY[0x1D17B6230]();
                v271 = v495;
                HMFGetOSLogHandle();
                v272 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
                {
                  v472 = v270;
                  HMFGetLogIdentifier();
                  contextd = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v488, "identifier");
                  v483 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v483, "shortDescription");
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v493, "model");
                  v274 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v274, "hmbDescription");
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = contextd;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v273;
                  *(_WORD *)&buf[22] = 2112;
                  v604 = v275;
                  *(_WORD *)v605 = 2112;
                  *(_QWORD *)&v605[2] = v269;
                  _os_log_impl(&dword_1CCD48000, v272, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode object %@ (not attempting to push): %@", buf, 0x2Au);

                  v270 = v472;
                }

                objc_autoreleasePoolPop(v270);
                v482 = 0;
                v276 = v490;
                v490 = 0;
                goto LABEL_159;
              }
LABEL_160:

              context = v269;
LABEL_161:
              if (!v493)
              {
                objc_msgSend(v261, "modelSchema");
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                v292 = v291 == 0;

                if (v292)
                {
                  v279 = 0;
                  v282 = 0;
                  v285 = 0;
                }
                else
                {
                  objc_msgSend(v261, "modelSchema");
                  v285 = (void *)objc_claimAutoreleasedReturnValue();
                  v279 = 0;
                  v282 = 0;
                }
                v287 = 0;
                goto LABEL_175;
              }
              objc_msgSend(v495, "modelContainer");
              v278 = (void *)objc_claimAutoreleasedReturnValue();
              v279 = objc_msgSend(v278, "bestModelEncodingForStorageLocation:", 2);

              objc_msgSend(v495, "modelContainer");
              v280 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v493, "model");
              v281 = (void *)objc_claimAutoreleasedReturnValue();
              v544 = 0;
              objc_msgSend(v280, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v281, v279, 2, 0, &v544);
              v282 = (void *)objc_claimAutoreleasedReturnValue();
              v473 = v544;

              if (v282)
              {
                objc_msgSend(v495, "modelContainer");
                v283 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v493, "model");
                v284 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v283, "schemaHashForModel:", v284);
                v285 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v493, "model");
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v286, "hmbType");
                v287 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v261, "modelSchema");
                v288 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v285, "isEqual:", v288))
                  goto LABEL_166;
                objc_msgSend(v261, "modelType");
                v289 = (void *)objc_claimAutoreleasedReturnValue();
                v290 = objc_msgSend(v287, "isEqual:", v289);

                if (v290)
                {

                  v285 = 0;
                  v288 = v287;
                  v287 = 0;
LABEL_166:

                }
LABEL_175:
                v528[0] = MEMORY[0x1E0C809B0];
                v528[1] = 3221225472;
                v528[2] = ____processRecords_block_invoke_121;
                v528[3] = &unk_1E89313D0;
                v528[4] = v261;
                v473 = v282;
                v529 = v473;
                v530 = v490;
                v301 = v495;
                v531 = v301;
                v302 = v488;
                v532 = v302;
                obja = v287;
                v533 = obja;
                v303 = v475;
                v534 = v303;
                v540 = v264;
                v535 = v482;
                v536 = v470;
                v537 = v486;
                v541 = v279;
                v304 = v285;
                v538 = v304;
                v543 = v449 == 1;
                v305 = v493;
                v539 = v305;
                v542 = v460;
                objc_msgSend(v464, "sqlTransactionWithActivity:block:", v302, v528);
                v466 = objc_claimAutoreleasedReturnValue();

                if (v466)
                {
                  v306 = (void *)MEMORY[0x1D17B6230]();
                  v307 = v301;
                  HMFGetOSLogHandle();
                  v308 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
                  {
                    contexte = v304;
                    HMFGetLogIdentifier();
                    v309 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v302, "identifier");
                    v310 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v310, "shortDescription");
                    v311 = (void *)objc_claimAutoreleasedReturnValue();
                    v312 = objc_msgSend(v261, "itemRow");
                    objc_msgSend(v307, "zoneID");
                    v313 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v313, "name");
                    v314 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    *(_QWORD *)&buf[4] = v309;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v311;
                    *(_WORD *)&buf[22] = 2048;
                    v604 = (void *)v312;
                    *(_WORD *)v605 = 2112;
                    *(_QWORD *)&v605[2] = v314;
                    *(_WORD *)&v605[10] = 2112;
                    *(_QWORD *)&v605[12] = v466;
                    _os_log_impl(&dword_1CCD48000, v308, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] unable to update / insert row for %lu / %@: %@", buf, 0x34u);

                    v304 = contexte;
                  }

                  objc_autoreleasePoolPop(v306);
                }
                else
                {
                  if (v493)
                  {
                    contexta = (void *)MEMORY[0x1D17B6230]();
                    v315 = v301;
                    if (v303)
                    {
                      HMFGetOSLogHandle();
                      v316 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v316, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        v317 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v302, "identifier");
                        v318 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v318, "shortDescription");
                        v319 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v305, "model");
                        v320 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        *(_QWORD *)&buf[4] = v317;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v319;
                        *(_WORD *)&buf[22] = 2112;
                        v604 = v320;
                        _os_log_impl(&dword_1CCD48000, v316, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending update delegate callback for model: %@", buf, 0x20u);

                      }
                      objc_autoreleasePoolPop(contexta);
                      v321 = [HMBProcessingModelUpdate alloc];
                      objc_msgSend(v305, "model");
                      v322 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v303, "model");
                      v323 = (void *)objc_claimAutoreleasedReturnValue();
                      v324 = -[HMBProcessingModelUpdate initWithModel:previousModel:options:mirrorOutputFuture:](v321, "initWithModel:previousModel:options:mirrorOutputFuture:", v322, v323, v456, v452);

                      objc_msgSend(v305, "model");
                      v325 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v325, "hmbModelID");
                      v326 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v315, "observersForModelWithID:", v326);
                      v327 = (void *)objc_claimAutoreleasedReturnValue();

                      v518 = 0u;
                      v519 = 0u;
                      v516 = 0u;
                      v517 = 0u;
                      v328 = v327;
                      v329 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v516, v599, 16);
                      if (v329)
                      {
                        v330 = *(_QWORD *)v517;
                        do
                        {
                          for (j = 0; j != v329; ++j)
                          {
                            if (*(_QWORD *)v517 != v330)
                              objc_enumerationMutation(v328);
                            objc_msgSend(*(id *)(*((_QWORD *)&v516 + 1) + 8 * j), "localZone:didProcessModelUpdate:", v315, v324);
                            v332 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v332)
                              objc_msgSend(v54, "addObject:", v332);

                          }
                          v329 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v516, v599, 16);
                        }
                        while (v329);
                      }
                    }
                    else
                    {
                      HMFGetOSLogHandle();
                      v349 = (id)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v349, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        v350 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v302, "identifier");
                        v351 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v351, "shortDescription");
                        v352 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v305, "model");
                        v353 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        *(_QWORD *)&buf[4] = v350;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v352;
                        *(_WORD *)&buf[22] = 2112;
                        v604 = v353;
                        _os_log_impl(&dword_1CCD48000, v349, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending creation delegate callback for model: %@", buf, 0x20u);

                      }
                      objc_autoreleasePoolPop(contexta);
                      v354 = [HMBProcessingModelCreation alloc];
                      objc_msgSend(v305, "model");
                      v355 = (void *)objc_claimAutoreleasedReturnValue();
                      v324 = -[HMBProcessingModelResult initWithModel:options:mirrorOutputFuture:](v354, "initWithModel:options:mirrorOutputFuture:", v355, v456, v452);

                      objc_msgSend(v305, "model");
                      v356 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v356, "hmbModelID");
                      v357 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v315, "observersForModelWithID:", v357);
                      v358 = (void *)objc_claimAutoreleasedReturnValue();

                      v522 = 0u;
                      v523 = 0u;
                      v520 = 0u;
                      v521 = 0u;
                      v328 = v358;
                      v359 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v520, v600, 16);
                      if (v359)
                      {
                        v360 = *(_QWORD *)v521;
                        do
                        {
                          for (k = 0; k != v359; ++k)
                          {
                            if (*(_QWORD *)v521 != v360)
                              objc_enumerationMutation(v328);
                            objc_msgSend(*(id *)(*((_QWORD *)&v520 + 1) + 8 * k), "localZone:didProcessModelCreation:", v315, v324);
                            v362 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v362)
                              objc_msgSend(v54, "addObject:", v362);

                          }
                          v359 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v520, v600, 16);
                        }
                        while (v359);
                      }
                    }
                  }
                  else
                  {
                    v333 = (void *)MEMORY[0x1D17B6230]();
                    v334 = v301;
                    HMFGetOSLogHandle();
                    v335 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v335, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v336 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v302, "identifier");
                      v337 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v337, "shortDescription");
                      v338 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v303, "model");
                      v339 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v336;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v338;
                      *(_WORD *)&buf[22] = 2112;
                      v604 = v339;
                      _os_log_impl(&dword_1CCD48000, v335, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending deletion delegate callback for model: %@", buf, 0x20u);

                    }
                    objc_autoreleasePoolPop(v333);
                    v340 = [HMBProcessingModelDeletion alloc];
                    objc_msgSend(v303, "model");
                    v341 = (void *)objc_claimAutoreleasedReturnValue();
                    v324 = -[HMBProcessingModelResult initWithModel:options:mirrorOutputFuture:](v340, "initWithModel:options:mirrorOutputFuture:", v341, v456, v452);

                    objc_msgSend(v303, "model");
                    v342 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v342, "hmbParentModelID");
                    v343 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v334, "observersForModelWithID:", v343);
                    v344 = (void *)objc_claimAutoreleasedReturnValue();

                    v526 = 0u;
                    v527 = 0u;
                    v524 = 0u;
                    v525 = 0u;
                    v328 = v344;
                    v345 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v524, v601, 16);
                    if (v345)
                    {
                      v346 = *(_QWORD *)v525;
                      do
                      {
                        for (m = 0; m != v345; ++m)
                        {
                          if (*(_QWORD *)v525 != v346)
                            objc_enumerationMutation(v328);
                          objc_msgSend(*(id *)(*((_QWORD *)&v524 + 1) + 8 * m), "localZone:didProcessModelDeletion:", v334, v324);
                          v348 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v348)
                            objc_msgSend(v54, "addObject:", v348);

                        }
                        v345 = objc_msgSend(v328, "countByEnumeratingWithState:objects:count:", &v524, v601, 16);
                      }
                      while (v345);
                    }
                  }

                }
                context = (id)v466;
                goto LABEL_218;
              }
              v293 = (void *)MEMORY[0x1D17B6230]();
              v294 = v495;
              HMFGetOSLogHandle();
              v295 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v296 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v488, "identifier");
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v297, "shortDescription");
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v493, "model");
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v299, "hmbDescription");
                v300 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v296;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v298;
                *(_WORD *)&buf[22] = 2112;
                v604 = v300;
                *(_WORD *)v605 = 2112;
                *(_QWORD *)&v605[2] = v473;
                _os_log_impl(&dword_1CCD48000, v295, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode model %@: %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v293);
LABEL_218:

            }
            v459 = objc_msgSend(v454, "countByEnumeratingWithState:objects:count:", &v546, v602, 16);
            if (!v459)
            {
LABEL_220:

              v75 = 0;
              goto LABEL_221;
            }
          }
        }
      }
    }
    v62 = (void *)MEMORY[0x1D17B6230]();
    v63 = v447;
    HMFGetOSLogHandle();
    v64 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "shortDescription");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v65;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v67;
      *(_WORD *)&buf[22] = 2048;
      v604 = a2;
      *(_WORD *)v605 = 2112;
      *(_QWORD *)&v605[2] = v453;
      *(_WORD *)&v605[10] = 2112;
      *(_QWORD *)&v605[12] = context;
      _os_log_impl(&dword_1CCD48000, v64, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch transaction entries for %lu / %@: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v62);
    v564 = 0;
    v68 = objc_msgSend(v63, "removeBlockWithRow:error:", a2, &v564);
    v454 = v564;
    if ((v68 & 1) == 0)
    {
      v69 = (void *)MEMORY[0x1D17B6230]();
      v70 = v63;
      HMFGetOSLogHandle();
      v71 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v72 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "shortDescription");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v74;
        *(_WORD *)&buf[22] = 2112;
        v604 = v454;
        _os_log_impl(&dword_1CCD48000, v71, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up corrupt block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v69);
    }
    objc_msgSend(v448, "finishWithError:", context);
    v75 = 1;
LABEL_221:

LABEL_222:
    objc_autoreleasePoolPop(v444);
    if (v75 != 19 && v75)
      goto LABEL_261;
  }
  while (objc_msgSend((id)v567[5], "count"));
  v510 = 0;
  v511 = &v510;
  v512 = 0x3032000000;
  v513 = __Block_byref_object_copy__560;
  v514 = __Block_byref_object_dispose__561;
  v515 = 0;
  if (!v455)
    goto LABEL_228;
  v509 = 0;
  v504[0] = MEMORY[0x1E0C809B0];
  v504[1] = 3221225472;
  v504[2] = ____processRecords_block_invoke_125;
  v504[3] = &unk_1E89313F8;
  v363 = v447;
  v505 = v363;
  v507 = &v585;
  v506 = v455;
  v508 = &v510;
  v364 = objc_msgSend(v464, "sqlTransactionWithActivity:error:block:", v488, &v509, v504);
  v365 = v509;
  if ((v364 & 1) != 0)
  {

LABEL_228:
    v365 = (id)v576[5];
    if (v365)
    {
      v366 = (void *)v511[5];
      v367 = v447;
      v491 = v365;
      v487 = v366;
      v496 = v456;
      contextb = v488;
      objc_msgSend(v367, "localDatabase");
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v368, "local");
      v494 = (void *)objc_claimAutoreleasedReturnValue();

      v598 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v496, 1, &v598);
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      v370 = v598;
      if (v369)
      {
        v592 = MEMORY[0x1E0C809B0];
        v593 = 3221225472;
        v594 = (uint64_t)____finishEnqueueForOutput_block_invoke;
        v595 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8932F30;
        v371 = (void (*)(uint64_t))v491;
        v596 = v371;
        v597 = v369;
        objc_msgSend(v494, "sqlTransactionWithActivity:block:", contextb, &v592);
        v372 = objc_claimAutoreleasedReturnValue();

        if (v372)
        {
          v373 = (void *)MEMORY[0x1D17B6230]();
          v374 = v367;
          HMFGetOSLogHandle();
          v375 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v375, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(contextb, "identifier");
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v377, "shortDescription");
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v376;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v378;
            *(_WORD *)&buf[22] = 2112;
            v604 = (void *)v372;
            _os_log_impl(&dword_1CCD48000, v375, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update block to enqueue output: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v373);
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v372);
          v365 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v367, "mirror");
          v429 = (void *)objc_claimAutoreleasedReturnValue();

          v484 = (void *)MEMORY[0x1D17B6230]();
          v430 = v367;
          HMFGetOSLogHandle();
          v431 = objc_claimAutoreleasedReturnValue();
          v432 = os_log_type_enabled(v431, OS_LOG_TYPE_INFO);
          if (v429)
          {
            if (v432)
            {
              HMFGetLogIdentifier();
              v433 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(contextb, "identifier");
              v478 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v478, "shortDescription");
              v434 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v430, "mirror");
              v435 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v433;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v434;
              *(_WORD *)&buf[22] = 2112;
              v604 = v371;
              *(_WORD *)v605 = 2112;
              *(_QWORD *)&v605[2] = v435;
              _os_log_impl(&dword_1CCD48000, v431, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Triggering output for output block row %@ on %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v484);
            objc_msgSend(v430, "mirror");
            v436 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v436, "triggerOutputForOutputRow:options:", objc_msgSend(v371, "unsignedIntegerValue"), v496);
            v365 = (id)objc_claimAutoreleasedReturnValue();

            if (v487)
            {
              objc_initWeak(&location, v430);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = ____finishEnqueueForOutput_block_invoke_130;
              v604 = &unk_1E8931420;
              objc_copyWeak((id *)&v605[16], &location);
              *(_QWORD *)v605 = contextb;
              *(_QWORD *)&v605[8] = v487;
              v437 = (id)objc_msgSend(v365, "addCompletionBlock:", buf);

              objc_destroyWeak((id *)&v605[16]);
              objc_destroyWeak(&location);
            }
          }
          else
          {
            if (v432)
            {
              HMFGetLogIdentifier();
              v438 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(contextb, "identifier");
              v439 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v439, "shortDescription");
              v440 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v438;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v440;
              _os_log_impl(&dword_1CCD48000, v431, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Unable to trigger output because self.mirror is nil", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v484);
            v441 = (void *)MEMORY[0x1E0D519C0];
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v441, "futureWithError:", v442);
            v365 = (id)objc_claimAutoreleasedReturnValue();

          }
        }

        v370 = (id)v372;
      }
      else
      {
        v399 = (void *)MEMORY[0x1D17B6230]();
        v400 = v367;
        HMFGetOSLogHandle();
        v401 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(contextb, "identifier");
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v403, "shortDescription");
          v404 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v402;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v404;
          *(_WORD *)&buf[22] = 2112;
          v604 = v370;
          _os_log_impl(&dword_1CCD48000, v401, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode options for output: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v399);
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v370);
        v365 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v452, "completionHandlerAdapter");
      v405 = (void *)objc_claimAutoreleasedReturnValue();
      v406 = (id)objc_msgSend(v365, "addCompletionBlock:", v405);

    }
    v503 = 0;
    v407 = objc_msgSend(v447, "removeBlockWithRow:error:", a2, &v503);
    contextc = v503;
    if ((v407 & 1) == 0)
    {
      v408 = (void *)MEMORY[0x1D17B6230]();
      v409 = v447;
      HMFGetOSLogHandle();
      v410 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v411 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v412 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v412, "shortDescription");
        v413 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v411;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v413;
        *(_WORD *)&buf[22] = 2112;
        v604 = contextc;
        _os_log_impl(&dword_1CCD48000, v410, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to clean up processed block: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v408);
    }
    v414 = -[HMBProcessingResult initWithOptions:actions:mirrorOutputResult:]([HMBProcessingResult alloc], "initWithOptions:actions:mirrorOutputResult:", v456, v54, v365);
    objc_msgSend(v447, "delegate");
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    v416 = objc_opt_respondsToSelector();
    if ((v416 & 1) != 0)
    {
      v417 = (void *)MEMORY[0x1D17B6230]();
      v418 = v447;
      HMFGetOSLogHandle();
      v419 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v419, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v420 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v488, "identifier");
        v421 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v421, "shortDescription");
        v422 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v420;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v422;
        *(_WORD *)&buf[22] = 2112;
        v604 = v414;
        _os_log_impl(&dword_1CCD48000, v419, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Sending processing complete callback with result: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v417);
      v416 = objc_msgSend(v415, "localZone:didCompleteProcessingWithResult:", v418, v414);
    }
    v423 = (void *)MEMORY[0x1D17B6230](v416);
    v424 = v447;
    HMFGetOSLogHandle();
    v425 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v425, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v426 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v427 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v427, "shortDescription");
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v426;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v428;
      *(_WORD *)&buf[22] = 2048;
      v604 = v451;
      *(_WORD *)v605 = 2048;
      *(_QWORD *)&v605[2] = a2;
      _os_log_impl(&dword_1CCD48000, v425, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Finished processing %lu row(s) for blockRow: %lu", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v423);
    objc_msgSend(v448, "finishWithResult:", v414);

    v398 = contextc;
  }
  else
  {
    v392 = (void *)MEMORY[0x1D17B6230]();
    v393 = v363;
    HMFGetOSLogHandle();
    v394 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v394, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v395 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v488, "identifier");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v396, "shortDescription");
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v395;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v397;
      *(_WORD *)&buf[22] = 2112;
      v604 = v365;
      _os_log_impl(&dword_1CCD48000, v394, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to write rollback entries: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v392);
    objc_msgSend(v448, "finishWithError:", v365);

    v398 = v505;
  }

  _Block_object_dispose(&v510, 8);
LABEL_261:
  _Block_object_dispose(&v566, 8);

LABEL_262:
  _Block_object_dispose(&v575, 8);

LABEL_263:
  v33 = v443;
LABEL_264:

LABEL_265:
  _Block_object_dispose(&v585, 8);

}

void sub_1CCD55A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;
  id *v71;

  objc_destroyWeak(v71);
  objc_destroyWeak((id *)&STACK[0x650]);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x538], 8);
  _Block_object_dispose(&STACK[0x5A8], 8);
  _Block_object_dispose(&STACK[0x620], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__560(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__561(uint64_t a1)
{

}

id ____processRecords_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v9;

  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(a2, "_selectBlockWithRow:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  return v5;
}

id ____processRecords_block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v10;

  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v4 = objc_msgSend(a2, "_insertBlockWithZoneRow:type:error:", v3, 0, &v10);
  v5 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return v5;
}

id ____processRecords_block_invoke_108(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;

  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v11 = 0;
  objc_msgSend(a2, "_selectItemsWithBlockRow:rowGreaterThan:limit:returning:error:", v3, v4, v5, -1, &v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = *(_QWORD *)(a1[4] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  return v7;
}

id ____processRecords_block_invoke_110(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = a1[6];
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v4, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "_selectRecordModelIDWithZoneRow:externalID:error:", v3, v6, &v12);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  return v8;
}

id ____processRecords_block_invoke_111(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = 0;
  objc_msgSend(v3, "_deleteItemWithRow:error:", objc_msgSend(v2, "itemRow"), &v5);

  return v5;
}

id ____processRecords_block_invoke_112(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = 0;
  objc_msgSend(v3, "_deleteItemWithRow:error:", objc_msgSend(v2, "itemRow"), &v5);

  return v5;
}

id ____processRecords_block_invoke_118(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v11 = 0;
  objc_msgSend(v4, "_deleteRecordWithRow:error:", objc_msgSend(v3, "recordRow"), &v11);

  v5 = v11;
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
  v10 = v5;
  objc_msgSend(v6, "_deleteQueryForRecordRow:error:", v7, &v10);
  v8 = v10;

  return v8;
}

id ____processRecords_block_invoke_121(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  id v104;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v123 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "recordRow"))
  {
    if (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48))
    {
      v3 = (void *)MEMORY[0x1D17B6230]();
      v4 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "identifier");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
        v114 = *(_QWORD *)(a1 + 48);
        v116 = *(void **)(a1 + 128);
        objc_msgSend(*(id *)(a1 + 88), "hmbDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = *(void **)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 96), "hmbDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "hmbDescription");
        v120 = v3;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "model");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmbModelID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545666;
        v134 = v6;
        v135 = 2114;
        v136 = (uint64_t)v7;
        v137 = 2048;
        v138 = v112;
        v139 = 2112;
        v140 = v114;
        v141 = 2048;
        v142 = v116;
        v143 = 2112;
        v144 = v8;
        v145 = 2112;
        v146 = v110;
        v147 = 2112;
        v148 = v9;
        v149 = 2112;
        v150 = v10;
        v151 = 2112;
        v152 = v12;
        _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating record row: %lu %@ %lu %@ %@ %@ %@ %@", buf, 0x66u);

        v3 = v120;
      }

      objc_autoreleasePoolPop(v3);
      v13 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
      v14 = *(_QWORD *)(a1 + 136);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 112);
      v131 = 0;
      objc_msgSend(v123, "_updateRecordWithRow:modelEncoding:modelData:modelSchema:error:", v13, v14, v15, v16, &v131);
      v17 = v131;
      if (*(_QWORD *)(a1 + 48))
      {
        v18 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 88);
        v21 = *(_QWORD *)(a1 + 128);
        v130 = v17;
        v22 = &v130;
        v23 = &v130;
        v24 = v123;
      }
      else
      {
        if (!*(_BYTE *)(a1 + 152))
          goto LABEL_9;
        objc_msgSend(*(id *)(a1 + 80), "outputBlockRow");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v71)
          goto LABEL_9;
        v72 = (void *)MEMORY[0x1D17B6230]();
        v73 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
          *(_DWORD *)buf = 138543618;
          v134 = v75;
          v135 = 2048;
          v136 = v76;
          _os_log_impl(&dword_1CCD48000, v74, OS_LOG_TYPE_INFO, "%{public}@Received change from mirror while existing record row %lu has pending output push", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v72);
        v77 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 120), "externalData");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "externalData");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v77) = objc_msgSend(v77, "shouldMirrorInputExternalData:overwriteExistingExternalData:", v78, v79);

        if (!(_DWORD)v77)
          goto LABEL_9;
        v80 = (void *)MEMORY[0x1D17B6230]();
        v81 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "identifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "shortDescription");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v134 = v83;
          v135 = 2114;
          v136 = (uint64_t)v85;
          _os_log_impl(&dword_1CCD48000, v82, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Resetting pending output push data due to change from mirror", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v80);
        v18 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
        v129 = v17;
        v22 = &v129;
        v23 = &v129;
        v24 = v123;
        v19 = 0;
        v20 = 0;
        v21 = 0;
      }
      objc_msgSend(v24, "_updateRecordWithRow:pushBlockRow:pushData:pushEncoding:error:", v18, v19, v20, v21, v23);
      v25 = *v22;

      v17 = v25;
LABEL_9:
      if (*(_QWORD *)(a1 + 104))
      {
        v26 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
        v27 = *(_QWORD *)(a1 + 96);
        v28 = *(_QWORD *)(a1 + 104);
        v128 = v17;
        objc_msgSend(v123, "_updateRecordWithRow:externalID:externalData:error:", v26, v27, v28, &v128);
        v29 = v128;

        v17 = v29;
      }
      if (*(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 112))
      {
        v30 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
        v31 = *(_QWORD *)(a1 + 72);
        v32 = *(_QWORD *)(a1 + 112);
        v127 = v17;
        objc_msgSend(v123, "_updateRecordWithRow:modelType:modelSchema:error:", v30, v31, v32, &v127);
        v33 = v127;

        v17 = v33;
      }
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "encodedQueryableColumns");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(*(id *)(a1 + 32), "queryTable");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *(_QWORD *)(a1 + 144);
          v37 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
          objc_msgSend(*(id *)(a1 + 32), "encodedQueryableColumns");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v17;
          objc_msgSend(v35, "_updateQueryForZoneRow:recordRow:encodedColumns:error:", v36, v37, v38, &v126);
          v39 = v126;

          v17 = v39;
        }
      }
      goto LABEL_38;
    }
    v93 = (void *)MEMORY[0x1D17B6230]();
    v94 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "identifier");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "shortDescription");
      v122 = v93;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
      v100 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 80), "model");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "hmbModelID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v134 = v96;
      v135 = 2114;
      v136 = (uint64_t)v98;
      v137 = 2048;
      v138 = v99;
      v139 = 2112;
      v140 = v100;
      v141 = 2112;
      v142 = v102;
      _os_log_impl(&dword_1CCD48000, v95, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Deleting record row: %lu %@ %@", buf, 0x34u);

      v93 = v122;
    }

    objc_autoreleasePoolPop(v93);
    v103 = objc_msgSend(*(id *)(a1 + 32), "recordRow");
    v132 = 0;
    objc_msgSend(v123, "_deleteRecordWithRow:error:", v103, &v132);
    v92 = v132;
LABEL_37:
    v17 = v92;
    goto LABEL_38;
  }
  v40 = *(void **)(a1 + 120);
  if (!v40)
  {
    v86 = (void *)MEMORY[0x1D17B6230]();
    v87 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "identifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "shortDescription");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v134 = v89;
      v135 = 2114;
      v136 = (uint64_t)v91;
      _os_log_impl(&dword_1CCD48000, v88, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No record row to update or updated model to insert", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v86);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v92 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v41 = *(_QWORD *)(a1 + 144);
  v42 = *(_QWORD *)(a1 + 96);
  v43 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v40, "model");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "hmbModelID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 120), "model");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "hmbParentModelID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *(_QWORD *)(a1 + 72);
  v49 = *(_QWORD *)(a1 + 112);
  v51 = *(_QWORD *)(a1 + 128);
  v50 = *(_QWORD *)(a1 + 136);
  v52 = *(_QWORD *)(a1 + 88);
  v53 = *(_QWORD *)(a1 + 40);
  v54 = *(_QWORD *)(a1 + 48);
  v125 = 0;
  v55 = objc_msgSend(v123, "_insertRecordWithZoneRow:externalID:externalData:modelID:parentModelID:modelType:modelEncoding:modelData:modelSchema:pushEncoding:pushData:pushBlockRow:error:", v41, v42, v43, v45, v47, v48, v50, v53, v49, v51, v52, v54, &v125);
  v17 = v125;

  objc_msgSend(*(id *)(a1 + 32), "encodedQueryableColumns");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryTable");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *(_QWORD *)(a1 + 144);
    objc_msgSend(*(id *)(a1 + 32), "encodedQueryableColumns");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v17;
    objc_msgSend(v57, "_updateQueryForZoneRow:recordRow:encodedColumns:error:", v58, v55, v59, &v124);
    v60 = v124;

    v17 = v60;
  }
  v61 = (void *)MEMORY[0x1D17B6230]();
  v62 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "identifier");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "shortDescription");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = *(_QWORD *)(a1 + 48);
    v109 = *(void **)(a1 + 128);
    objc_msgSend(*(id *)(a1 + 120), "model");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "hmbModelID");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "UUIDString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 120), "model");
    v107 = v55;
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "hmbParentModelID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "UUIDString");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 96), "hmbDescription");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 104), "hmbDescription");
    v121 = v61;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "hmbDescription");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v134 = v64;
    v135 = 2114;
    v136 = (uint64_t)v65;
    v137 = 2048;
    v138 = v107;
    v139 = 2112;
    v140 = v108;
    v141 = 2048;
    v142 = v109;
    v143 = 2112;
    v144 = v66;
    v145 = 2112;
    v146 = v67;
    v147 = 2112;
    v148 = v106;
    v149 = 2112;
    v150 = v68;
    v151 = 2112;
    v152 = v69;
    v153 = 2112;
    v154 = v70;
    _os_log_impl(&dword_1CCD48000, v63, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Inserting record row: %lu %@ %lu %@ %@ %@ %@ %@ %@", buf, 0x70u);

    v61 = v121;
  }

  objc_autoreleasePoolPop(v61);
LABEL_38:
  v104 = v17;

  return v104;
}

id ____processRecords_block_invoke_125(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "optionsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v14 = 0;
  v8 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:options:items:error:", v5, 3, v6, v7, &v14);

  v9 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return v9;
}

id ____finishEnqueueForOutput_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "unsignedIntegerValue");
  v6 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v4, "_updateBlockWithRow:options:error:", v5, v6, &v8);

  return v8;
}

void ____finishEnqueueForOutput_block_invoke_130(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  char v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *context;
  id v49;
  _QWORD v50[4];
  id v51;
  _BYTE *v52;
  uint8_t v53[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        v60 = v15;
        LOWORD(v61) = 2112;
        *(_QWORD *)((char *)&v61 + 2) = v6;
        _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Rolling back block %@ due to push failure: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v8);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v60 = __Block_byref_object_copy__560;
      *(_QWORD *)&v61 = __Block_byref_object_dispose__561;
      *((_QWORD *)&v61 + 1) = 0;
      objc_msgSend(v9, "sql");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = ____finishEnqueueForOutput_block_invoke_131;
      v50[3] = &unk_1E8933B78;
      v52 = buf;
      v51 = a1[5];
      objc_msgSend(v16, "sqlBlockWithActivity:block:", 0, v50);
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        context = (void *)MEMORY[0x1D17B6230]();
        v18 = v9;
        HMFGetOSLogHandle();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier", context);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "shortDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v53 = 138543874;
          v54 = v20;
          v55 = 2114;
          v56 = v22;
          v57 = 2112;
          v58 = v17;
          _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to get block for rollback: %@", v53, 0x20u);

        }
      }
      else
      {
        v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v38)
        {
          __rollbackBlock(v9, v38);
          context = (void *)MEMORY[0x1D17B6230]();
          v39 = v9;
          HMFGetOSLogHandle();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "identifier", context);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shortDescription");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
            *(_DWORD *)v53 = 138543874;
            v54 = v40;
            v55 = 2114;
            v56 = v42;
            v57 = 2112;
            v58 = v43;
            _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Rollback completed successfully for block %@.", v53, 0x20u);

          }
        }
        else
        {
          context = (void *)MEMORY[0x1D17B6230]();
          v44 = v9;
          HMFGetOSLogHandle();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "identifier", context);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "shortDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v53 = 138543618;
            v54 = v45;
            v55 = 2114;
            v56 = v47;
            _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No block fetched! (no block found)", v53, 0x16u);

          }
        }
      }

      objc_autoreleasePoolPop(context);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v60 = v29;
        _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Removing unused rollback block %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v30 = objc_msgSend(a1[5], "unsignedIntegerValue");
      v49 = 0;
      v31 = objc_msgSend(v9, "removeBlockWithRow:error:", v30, &v49);
      v17 = (uint64_t (*)(uint64_t, uint64_t))v49;
      if ((v31 & 1) == 0)
      {
        v32 = (void *)MEMORY[0x1D17B6230]();
        v33 = v9;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "shortDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 2112;
          v60 = v17;
          _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to cleanup rollback block: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
      }
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@[LocalZone] unable to cleanup rollback block: (lost self)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

}

void sub_1CCD57290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ____finishEnqueueForOutput_block_invoke_131(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v10 = 0;
  objc_msgSend(v4, "_selectBlockWithRow:error:", objc_msgSend(v3, "unsignedIntegerValue"), &v10);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = v10;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  return v6;
}

void __rollbackBlock(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = objc_opt_class();
  objc_msgSend(v4, "optionsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, &v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v40;

  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = v3;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v14;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@rollback options: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v39 = v9;
    objc_msgSend(v11, "fetchItemsInBlock:error:", v4, &v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39;

    objc_msgSend(v11, "sql");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = ____rollbackBlock_block_invoke;
    v35[3] = &unk_1E8933A70;
    v18 = v11;
    v36 = v18;
    v19 = v4;
    v37 = v19;
    v20 = v15;
    v38 = v20;
    objc_msgSend(v17, "sqlTransactionWithActivity:block:", 0, v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v33 = v20;
      v22 = v8;
      v23 = (void *)MEMORY[0x1D17B6230]();
      v24 = v18;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2112;
        v44 = v21;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to rollback block: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v8 = v22;
      v20 = v33;
    }
    v34 = v21;
    v27 = objc_msgSend(v18, "removeBlockWithRow:error:", objc_msgSend(v19, "blockRow"), &v34);
    v9 = v34;

    if ((v27 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1D17B6230]();
      v29 = v18;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove rollback block: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine options for rollback block (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

id ____rollbackBlock_block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id *v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v3 = (void *)MEMORY[0x1D17B6230]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1[5], "blockRow");
    *(_DWORD *)buf = 138543618;
    v56 = v6;
    v57 = 2048;
    v58 = v7;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@invalidating push for block %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = objc_msgSend(a1[5], "blockRow");
  v54 = 0;
  objc_msgSend(v47, "_updateRecordsClearPushWithPushBlockRow:error:", v8, &v54);
  v9 = v54;
  if (!v9)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = a1[6];
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    if (v44)
    {
      v43 = *(_QWORD *)v51;
      v39 = a1;
      while (2)
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v51 != v43)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "externalData");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v14 = (void *)objc_msgSend(v12, "initWithUUIDBytes:", objc_msgSend(v13, "bytes"));

          v15 = objc_msgSend(a1[4], "zoneRow");
          v49 = 0;
          objc_msgSend(v47, "_selectRecordWithZoneRow:modelID:returning:error:", v15, v14, 2, &v49);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v49;
          v9 = v17;
          if (v16)
            goto LABEL_10;
          if (v17)
          {
            v16 = 0;
LABEL_23:

            goto LABEL_24;
          }
          if (!objc_msgSend(v11, "modelEncoding"))
          {
LABEL_10:
            v45 = v9;
            v46 = v14;
            v18 = (void *)MEMORY[0x1D17B6230]();
            v19 = a1[4];
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v16, "recordRow");
              objc_msgSend(v46, "UUIDString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v16;
              v23 = v18;
              v24 = objc_msgSend(v11, "modelEncoding");
              objc_msgSend(v11, "modelData");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "hmbDescription");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v56 = v21;
              v57 = 2048;
              v58 = v41;
              v59 = 2112;
              v60 = v22;
              v61 = 2048;
              v62 = v24;
              v18 = v23;
              v16 = v42;
              v63 = 2112;
              v64 = v26;
              _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@reverting record row %lu / %@ to %lu / %@", buf, 0x34u);

              a1 = v39;
            }

            objc_autoreleasePoolPop(v18);
            v27 = objc_msgSend(v16, "recordRow");
            v28 = objc_msgSend(v11, "modelEncoding");
            objc_msgSend(v11, "modelData");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "modelSchema");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v45;
            objc_msgSend(v47, "_updateRecordWithRow:modelEncoding:modelData:modelSchema:error:", v27, v28, v29, v30, &v48);
            v9 = v48;

            v14 = v46;
            if (v9)
              goto LABEL_23;
          }
          else
          {
            v31 = (void *)MEMORY[0x1D17B6230]();
            v32 = a1[4];
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(a1[4], "zoneRow");
              objc_msgSend(v14, "UUIDString");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v56 = v34;
              v57 = 2048;
              v58 = v35;
              a1 = v39;
              v59 = 2112;
              v60 = v36;
              _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_ERROR, "%{public}@Rollback is having issues. Expected to find a record row %lu / %@, but we didn't", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v31);
          }

        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
        if (v44)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_24:

  }
  v37 = v9;

  return v37;
}

void sub_1CCD5A578(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD5AC90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD5CCCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __pushRecords(void *a1, void *a2, void *a3, void *a4, char a5, unsigned int a6, void *a7, void *a8)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id obj;
  id obja;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  char v87;
  id location;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[128];
  uint8_t buf[4];
  id v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v72 = a1;
  v13 = a2;
  v63 = a3;
  v62 = a4;
  v14 = a7;
  v59 = a8;
  v74 = v14;
  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__pushRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v15, "initWithName:", v16);

  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v13;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v17)
  {
    v69 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v102 != v69)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1D17B6230]();
        v21 = v72;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "shortDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hmbDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v107 = v23;
          v108 = 2114;
          v109 = v25;
          v110 = 2112;
          v111 = v26;
          _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Pushing update for record: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(v19, "hmbDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "markWithFormat:", CFSTR("about to update: %@"), v27, v59);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v17);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v65 = v63;
  v28 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v28)
  {
    v70 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v98 != v70)
          objc_enumerationMutation(v65);
        v30 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
        v31 = (void *)MEMORY[0x1D17B6230]();
        v32 = v72;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "shortDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "hmbDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v107 = v34;
          v108 = 2114;
          v109 = v36;
          v110 = 2112;
          v111 = v37;
          _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Pushing removal for record: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(v30, "hmbDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "markWithFormat:", CFSTR("about to remove: %@"), v38);

      }
      v28 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v65, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", obj, v65);
  objc_msgSend(v41, "setConfiguration:", v62);
  objc_msgSend(v41, "setSavePolicy:", 0);
  objc_msgSend(v41, "setMarkAsParticipantNeedsNewInvitationToken:", a6);
  v42 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = ____pushRecords_block_invoke;
  v93[3] = &unk_1E8932BD8;
  v43 = v72;
  v94 = v43;
  v44 = v74;
  v95 = v44;
  v45 = v39;
  v96 = v45;
  objc_msgSend(v41, "setPerRecordSaveBlock:", v93);
  v89[0] = v42;
  v89[1] = 3221225472;
  v89[2] = ____pushRecords_block_invoke_14;
  v89[3] = &unk_1E8931578;
  v46 = v43;
  v90 = v46;
  v47 = v44;
  v91 = v47;
  v48 = v40;
  v92 = v48;
  objc_msgSend(v41, "setPerRecordDeleteBlock:", v89);
  objc_initWeak(&location, v41);
  v76[0] = v42;
  v76[1] = 3221225472;
  v76[2] = ____pushRecords_block_invoke_16;
  v76[3] = &unk_1E89315C8;
  v49 = v46;
  v77 = v49;
  v75 = v47;
  v78 = v75;
  v86 = a5;
  v50 = obj;
  v79 = v50;
  v64 = v65;
  v80 = v64;
  v66 = v62;
  v81 = v66;
  v87 = a6;
  v71 = v59;
  v82 = v71;
  objc_copyWeak(&v85, &location);
  obja = v45;
  v83 = obja;
  v73 = v48;
  v84 = v73;
  v51 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v41, "setModifyRecordsCompletionBlock:", v76));
  v52 = v49;
  HMFGetOSLogHandle();
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "identifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "shortDescription");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "operationID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v107 = v54;
    v108 = 2114;
    v109 = v56;
    v110 = 2114;
    v111 = v57;
    _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKModifyRecordsOperation with operationID: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v51);
  objc_msgSend(v52, "database");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addOperation:", v41);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&location);

}

void sub_1CCD5D814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  id *v36;

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____pushRecords_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = a1[4];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v21 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      v24 = 2114;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully saved record: %@", buf, 0x20u);

      v7 = v21;
    }

    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[6], "addObject:", v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      v26 = 2112;
      v27 = v7;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to save record with ID %@: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void ____pushRecords_block_invoke_14(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmbDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to delete record with ID %@: %{public}@", (uint8_t *)&v19, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmbDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v15;
      v21 = 2114;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully deleted record with ID: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "addObject:", v5);
  }

}

void ____pushRecords_block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMBCloudZoneRecordPushResult *v39;
  void *v40;
  void *v41;
  HMBCloudZoneRecordPushResult *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL8 v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  __int16 v100;
  _BYTE buf[24];
  void *v102;
  id v103;
  id v104;
  _QWORD v105[2];
  uint8_t v106[4];
  void *v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "shortDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v38;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordsOperation succeeded", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("success"));
    goto LABEL_18;
  }
  if (v13)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDescription");
    v17 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    v102 = v9;
    _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordsOperation failed: %{public}@", buf, 0x20u);

    v7 = v17;
    v8 = v15;

  }
  objc_autoreleasePoolPop(v10);
  if (objc_msgSend(v9, "hmbIsCKLimitExceededError") && !*(_BYTE *)(a1 + 104))
  {
    v90 = v7;
    v92 = v8;
    v43 = *(void **)(a1 + 48);
    v44 = *(void **)(a1 + 56);
    v45 = *(unsigned __int8 *)(a1 + 105);
    v46 = *(void **)(a1 + 40);
    v47 = *(void **)(a1 + 64);
    v48 = *(void **)(a1 + 72);
    v49 = *(id *)(a1 + 32);
    v50 = v43;
    v51 = v44;
    v52 = v47;
    v84 = v46;
    v53 = v48;
    v54 = v51;
    v82 = v53;
    if ((unint64_t)objc_msgSend(v50, "count") <= 1 && (unint64_t)objc_msgSend(v51, "count") <= 1)
    {
      v55 = (void *)MEMORY[0x1D17B6230]();
      v56 = v49;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v52;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v106 = 138543874;
        v107 = v59;
        v108 = 2112;
        v109 = (uint64_t)v50;
        v110 = 2112;
        v111 = (uint64_t)v54;
        _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot bifurcate, not enough items: (updates: %@, removes: %@)", v106, 0x20u);

        v52 = v58;
      }

      objc_autoreleasePoolPop(v55);
      v7 = v90;
      v8 = v92;
      goto LABEL_12;
    }
    v88 = v52;
    v60 = (unint64_t)objc_msgSend(v50, "count") >> 1;
    objc_msgSend(v50, "subarrayWithRange:", 0, v60);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "subarrayWithRange:", v60, objc_msgSend(v50, "count") - v60);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (unint64_t)objc_msgSend(v54, "count") >> 1;
    objc_msgSend(v54, "subarrayWithRange:", 0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "subarrayWithRange:", v61, objc_msgSend(v54, "count") - v61);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)MEMORY[0x1D17B6230]();
    v64 = v49;
    HMFGetOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v50, "count");
      v68 = objc_msgSend(v54, "count");
      *(_DWORD *)v106 = 138543874;
      v107 = v66;
      v108 = 2048;
      v109 = v67;
      v110 = 2048;
      v111 = v68;
      _os_log_impl(&dword_1CCD48000, v65, OS_LOG_TYPE_INFO, "%{public}@Record limit exceeded (updates: %lu, removes: %lu), bifurcating operation", v106, 0x20u);

    }
    v69 = v45 != 0;

    objc_autoreleasePoolPop(v63);
    v70 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v71 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    __pushRecords(v64, v86, v62, v88, 0, v69, v84, v70);
    __pushRecords(v64, v87, v85, v88, 0, v69, v84, v71);
    v81 = v54;
    v72 = (void *)MEMORY[0x1E0D519C0];
    v105[0] = v70;
    v105[1] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "operationScheduler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "combineAllFutures:ignoringErrors:scheduler:", v73, 0, v74);
    v80 = v50;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____pushRecordsBifurcated_block_invoke;
    v102 = &unk_1E89315F0;
    v103 = v64;
    v104 = v82;
    v76 = v82;
    v83 = v64;
    objc_msgSend(v75, "addSuccessBlock:", buf);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "errorOnlyCompletionHandlerAdapter");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (id)objc_msgSend(v77, "addFailureBlock:", v78);

    v7 = v90;
    v8 = v92;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v20 = WeakRetained;
    v21 = *(void **)(a1 + 32);
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = ____pushRecords_block_invoke_19;
    v93[3] = &unk_1E89315A0;
    v94 = v21;
    v95 = *(id *)(a1 + 48);
    v96 = *(id *)(a1 + 56);
    v97 = *(id *)(a1 + 64);
    v100 = *(_WORD *)(a1 + 104);
    v98 = *(id *)(a1 + 40);
    v99 = *(id *)(a1 + 72);
    v22 = objc_msgSend(v94, "retryCloudKitOperation:afterError:retryBlock:", v20, v9, v93);
    v23 = v22;
    if (v22)
    {
      v91 = v8;
      v24 = (void *)MEMORY[0x1D17B6230]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v89 = v7;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifyRecordsOperation will be retried", buf, 0x16u);

        v7 = v89;
      }

      objc_autoreleasePoolPop(v24);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
      v8 = v91;
    }

    if ((v23 & 1) == 0)
    {
LABEL_12:
      v30 = (void *)MEMORY[0x1D17B6230]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2114;
        v102 = v9;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifyRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v9);
LABEL_18:
      v39 = [HMBCloudZoneRecordPushResult alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 80));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 88));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:error:](v39, "initWithUpdatedRecords:deletedRecordIDs:error:", v40, v41, v9);

      objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", v42);
    }
  }

}

void ____pushRecordsBifurcated_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
    v14 = v9 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Both bifurcated pushes failed: %@, %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "finishWithError:", v19);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Bifurcated push succeeded, merging results", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "pushResultByMergingWithPushResult:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v19);
  }

}

uint64_t ____pushRecords_block_invoke_19(uint64_t a1)
{
  return __pushRecords(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void sub_1CCD60780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____buildTableForClass_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ BLOB"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void ____updateIndexesForClass_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("q"))
    && (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "runSQLite3:", objc_msgSend(v6, "UTF8String"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing unused index: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (v7)
    {
      v12 = (void *)MEMORY[0x1D17B6230]();
      v13 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to drop index: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }
    objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v3);

  }
}

void ____updateIndexesForClass_block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMBLocalSQLContextQueryIndex *v41;
  void *v42;
  HMBLocalSQLContextQueryIndex *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "indexName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v5, "indexedColumns");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      objc_msgSend(v5, "indexedColumns");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 == v14)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "indexName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "modelType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryable_%@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "indexedColumns");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)"), v16, v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1D17B6230]();
        v23 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v25;
          v47 = 2112;
          v48 = v21;
          _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating index: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v26 = *(void **)(a1 + 48);
        v27 = objc_retainAutorelease(v21);
        objc_msgSend(v26, "runSQLite3:", objc_msgSend(v27, "UTF8String"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)MEMORY[0x1D17B6230]();
          v30 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v32;
            v47 = 2112;
            v48 = v27;
            v49 = 2112;
            v50 = v28;
            _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create index %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v29);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          v40 = *(void **)(a1 + 32);
          v41 = [HMBLocalSQLContextQueryIndex alloc];
          objc_msgSend(v5, "indexedColumns");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[HMBLocalSQLContextQueryIndex initWithColumns:](v41, "initWithColumns:", v42);
          objc_msgSend(v5, "indexName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKey:", v43, v44);

        }
      }
      else
      {
        v33 = (void *)MEMORY[0x1D17B6230]();
        v34 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "indexName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "indexedColumns");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "componentsJoinedByString:", CFSTR(", "));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v36;
          v47 = 2112;
          v48 = v37;
          v49 = 2112;
          v50 = v39;
          _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_ERROR, "%{public}@Column list for query %@ has duplicate values: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v33);
      }
    }
  }

}

void ____prepareStatementsForClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("?%lu"), a3 + 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void ____prepareStatementsForClass_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "prepareOnTable:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "userQueries");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

id ____updateIndexesForClass_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "indexName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1CCD61FD4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD620C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD62144(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD62228(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD626BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD63ECC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD654F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1501(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1502(uint64_t a1)
{

}

void sub_1CCD6745C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1CCD687AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCD69068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __setProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmbCanonicalType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = (id)objc_opt_class();
      v15 = v32;
      v16 = "%{public}@Unable to set property %@ of %@ from type %@ (no such property exists)";
      goto LABEL_10;
    }
LABEL_12:

    objc_autoreleasePoolPop(v10);
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "hmbPropertyIsAvailable:", v6) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmbCanonicalType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = (id)objc_opt_class();
      v15 = v32;
      v16 = "%{public}@Unable to set property %@ of %@ from type %@ (property is unavailable)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "hmbPropertyIsReadOnly:", v6))
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmbCanonicalType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v13;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = (id)objc_opt_class();
      v15 = v32;
      v16 = "%{public}@Unable to set property %@ of %@ from type %@ (property is read-only)";
LABEL_10:
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0x2Au);

LABEL_11:
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (v7)
  {
    objc_msgSend(v9, "classObj");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1D17B6230]();
        v11 = v5;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_12;
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmbCanonicalType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_opt_class();
        v23 = v21;
        NSStringFromClass((Class)objc_msgSend(v9, "classObj"));
        v24 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v26 = v13;
        v27 = 2112;
        v28 = v6;
        v29 = 2112;
        v30 = v20;
        v31 = 2112;
        v32 = v21;
        v33 = 2112;
        v34 = v22;
        _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to set property %@ of %@ from type %@ (does not match the expected type %@)", buf, 0x34u);

        v10 = v24;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(v5, "hmbReserved");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHmbReserved:", v18);

  }
  objc_msgSend(v5, "hmbReserved");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, v6);

LABEL_13:
}

uint64_t __isEqualDeepCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t isEqualDeepCompare;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v3, "count");
      if (v5 == objc_msgSend(v4, "count"))
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v6 = v3;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKey:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13 || !__isEqualDeepCompare(v12, v13))
              {

                isEqualDeepCompare = 0;
                goto LABEL_29;
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            isEqualDeepCompare = 1;
            if (v8)
              continue;
            goto LABEL_29;
          }
        }
LABEL_25:
        isEqualDeepCompare = 1;
LABEL_29:

        goto LABEL_30;
      }
LABEL_27:
      isEqualDeepCompare = 0;
      goto LABEL_30;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v3, "count");
      if (v15 == objc_msgSend(v4, "count"))
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v6 = v3;
        v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v25;
LABEL_19:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v6);
            v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20);
            objc_msgSend(v4, "objectAtIndex:", v18 + v20, (_QWORD)v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualDeepCompare = __isEqualDeepCompare(v21, v22);

            if (!(_DWORD)isEqualDeepCompare)
              goto LABEL_29;
            if (v17 == ++v20)
            {
              v18 += v20;
              v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v17)
                goto LABEL_19;
              goto LABEL_25;
            }
          }
        }
        goto LABEL_25;
      }
      goto LABEL_27;
    }
  }
  isEqualDeepCompare = HMFEqualObjects();
LABEL_30:

  return isEqualDeepCompare;
}

void __calculateUnavailableReadOnly(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  char v32;

  v24 = a1;
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmbReserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("_U"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "hmbReserved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("_R"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "dataVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmbDataVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isGreaterThan:", v10);

    if (v11)
    {
      objc_msgSend(v3, "unavailableVersionsForModelClass:", objc_opt_class());
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "readOnlyVersionsForModelClass:", objc_opt_class());
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v13;
      v6 = (void *)v12;
    }
  }
  v14 = objc_msgSend(v24, "hmbIsModelReadOnly");
  v15 = objc_msgSend(v24, "hmbIsModelGenericRepresentation");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmbContainerDataVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ____calculateUnavailableReadOnly_block_invoke;
  v25[3] = &unk_1E8931A78;
  v26 = v6;
  v27 = v8;
  v31 = v15;
  v28 = v18;
  v29 = v16;
  v32 = v14;
  v30 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v18;
  v22 = v8;
  v23 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);
  objc_msgSend(v24, "setHmbUnavailableProperties:", v20);
  objc_msgSend(v24, "setHmbReadOnlyProperties:", v19);

}

void ____calculateUnavailableReadOnly_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72)
    || (v5 = *(void **)(a1 + 48)) != 0 && v3 && objc_msgSend(v5, "isGreaterThanOrEqualTo:", v3))
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  }
  if (*(_BYTE *)(a1 + 73)
    || (v6 = *(void **)(a1 + 48)) != 0 && v4 && objc_msgSend(v6, "isLessThanOrEqualTo:", v4))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);
  }

}

uint64_t __Block_byref_object_copy__1632(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1633(uint64_t a1)
{

}

id __modelReferenceFields(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v1 = a1;
  if (__modelReferenceFields_onceToken != -1)
    dispatch_once(&__modelReferenceFields_onceToken, &__block_literal_global_369);
  v2 = (void *)objc_opt_class();
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__modelReferenceFields_referenceFields, "objectForKey:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "hmbProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = ____modelReferenceFields_block_invoke_2;
      v9[3] = &unk_1E8931FF0;
      v6 = v4;
      v10 = v6;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
      v3 = v6;
      objc_msgSend((id)__modelReferenceFields_referenceFields, "setObject:forKey:", v3, v2);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__modelReferenceFields_referenceFields, "setObject:forKey:", v3, v2);
    }
  }
  v7 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&__modelReferenceFields_lock);
  return v7;
}

void sub_1CCD6BEBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&__modelReferenceFields_lock);
  _Unwind_Resume(a1);
}

uint64_t ____dataDictionaryFromVersionDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hmbData");
}

void ____modelReferenceFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend((id)objc_msgSend(a3, "classObj"), "isSubclassOfClass:", objc_opt_class()))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void ____modelReferenceFields_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__modelReferenceFields_referenceFields;
  __modelReferenceFields_referenceFields = v0;

}

uint64_t ____versionDictionaryFromDataDictionary_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D286E0], "hmbVersionFromData:");
}

void sub_1CCD6CFCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&__modelExternalStorageFields_lock);
  _Unwind_Resume(a1);
}

void ____modelExternalStorageFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "externalRecordField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void ____modelExternalStorageFields_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__modelExternalStorageFields_externalStorageFields;
  __modelExternalStorageFields_externalStorageFields = v0;

}

void __fetchChanges(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  _QWORD *v78;
  _QWORD *v79;
  id v80;
  id location;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  char v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  char v98;
  id v99;
  _QWORD v100[5];
  id v101;
  _QWORD v102[5];
  id v103;
  uint8_t buf[4];
  id v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  id v109;
  __int16 v110;
  id v111;
  __int16 v112;
  void *v113;
  void *v114;
  id v115;
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v69 = a2;
  v64 = a3;
  v10 = a4;
  v65 = a5;
  v66 = v10;
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v11, "initWithName:", v12);

  }
  objc_msgSend(v9, "localZone");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v102[0] = 0;
    v102[1] = v102;
    if (v69)
      v13 = 1;
    else
      v13 = 2;
    v102[2] = 0x3032000000;
    v102[3] = __Block_byref_object_copy__1860;
    v102[4] = __Block_byref_object_dispose__1861;
    v103 = 0;
    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x3032000000;
    v100[3] = __Block_byref_object_copy__1860;
    v100[4] = __Block_byref_object_dispose__1861;
    v101 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
    objc_msgSend(v9, "defaultDesiredKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setDesiredKeys:", v14);

    objc_msgSend(v67, "setPreviousServerChangeToken:", v69);
    v99 = 0;
    objc_msgSend(v68, "createMirrorInputWithError:", &v99);
    v15 = objc_claimAutoreleasedReturnValue();
    v61 = v99;
    v62 = (void *)v15;
    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0C94DE8]);
      objc_msgSend(v9, "cloudZoneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "zoneID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudZoneID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "zoneID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v21;
      v115 = v67;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v16, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v19, v22);

      objc_msgSend(v9, "cloudDatabase");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "operationConfigurationWithProcessingOptions:", v64);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setConfiguration:", v25);

      v26 = MEMORY[0x1E0C809B0];
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = ____fetchChanges_block_invoke;
      v92[3] = &unk_1E8931C00;
      v27 = v9;
      v93 = v27;
      v28 = v66;
      v94 = v28;
      v95 = v67;
      v98 = v13;
      v29 = v63;
      v96 = v29;
      v30 = v62;
      v97 = v30;
      objc_msgSend(v23, "setRecordWasChangedBlock:", v92);
      v87[0] = v26;
      v87[1] = 3221225472;
      v87[2] = ____fetchChanges_block_invoke_15;
      v87[3] = &unk_1E8931C28;
      v31 = v27;
      v88 = v31;
      v91 = v13;
      v32 = v28;
      v89 = v32;
      v33 = v30;
      v90 = v33;
      objc_msgSend(v23, "setRecordWithIDWasDeletedBlock:", v87);
      v82[0] = v26;
      v82[1] = 3221225472;
      v82[2] = ____fetchChanges_block_invoke_17;
      v82[3] = &unk_1E8931C50;
      v85 = v100;
      v86 = v102;
      v34 = v31;
      v83 = v34;
      v35 = v32;
      v84 = v35;
      objc_msgSend(v23, "setRecordZoneFetchCompletionBlock:", v82);
      objc_initWeak(&location, v23);
      v70[0] = v26;
      v70[1] = 3221225472;
      v70[2] = ____fetchChanges_block_invoke_19;
      v70[3] = &unk_1E8931CA0;
      v78 = v100;
      v36 = v34;
      v71 = v36;
      v37 = v35;
      v72 = v37;
      v73 = v33;
      v38 = v64;
      v74 = v38;
      v75 = v65;
      objc_copyWeak(&v80, &location);
      v39 = v69;
      v76 = v39;
      v77 = v29;
      v79 = v102;
      v40 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v23, "setFetchRecordZoneChangesCompletionBlock:", v70));
      v41 = v36;
      HMFGetOSLogHandle();
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v60 = v40;
        HMFGetLogIdentifier();
        v43 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "shortDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "operationID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v105 = v43;
        v106 = 2114;
        v107 = v45;
        v108 = 2112;
        v109 = v39;
        v110 = 2112;
        v111 = v38;
        v112 = 2114;
        v113 = v46;
        _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchRecordZoneChangesOperation with token: %@ options: %@ operationID: %{public}@", buf, 0x34u);

        v40 = v60;
      }

      objc_autoreleasePoolPop(v40);
      objc_msgSend(v41, "database");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addOperation:", v23);

      objc_destroyWeak(&v80);
      objc_destroyWeak(&location);

      v48 = v62;
    }
    else
    {
      v54 = (void *)MEMORY[0x1D17B6230]();
      v55 = v9;
      HMFGetOSLogHandle();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "identifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "shortDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v105 = v57;
        v106 = 2114;
        v107 = v59;
        v108 = 2114;
        v109 = v61;
        _os_log_impl(&dword_1CCD48000, v56, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to create a new mirror input: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v54);
      v48 = 0;
      objc_msgSend(v66, "markWithReason:", CFSTR("failed mirror input creation"));
      objc_msgSend(v65, "finishWithError:", v61);
    }

    _Block_object_dispose(v100, 8);
    _Block_object_dispose(v102, 8);

  }
  else
  {
    v49 = (void *)MEMORY[0x1D17B6230]();
    v50 = v9;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v52;
      _os_log_impl(&dword_1CCD48000, v51, OS_LOG_TYPE_ERROR, "%{public}@Lost localZone in __fetchChanges", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "finishWithError:", v53);

  }
}

void sub_1CCD6E460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  uint64_t v63;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v63 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1860(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1861(uint64_t a1)
{

}

void ____fetchChanges_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  char v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v73 = v9;
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 48), "desiredKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    objc_msgSend(v11, "decodeModelFromRecord:externalRecordFields:source:error:", v8, v14, 2, &v77);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v77;

    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v69 = v17;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "shortDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmbDescription");
        v38 = v8;
        v39 = v7;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v79 = v35;
        v80 = 2114;
        v81 = v37;
        v82 = 2112;
        v83 = v40;
        v84 = 2114;
        v85 = v16;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Received record %@, but failed to decode: %{public}@", buf, 0x2Au);

        v7 = v39;
        v8 = v38;
        v15 = 0;

        v17 = v69;
      }

      objc_autoreleasePoolPop(v17);
      goto LABEL_13;
    }
    v21 = *(_BYTE *)(a1 + 72);
    v72 = v7;
    if (os_log_type_enabled(v19, v21))
    {
      HMFGetLogIdentifier();
      v66 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v68 = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v67 = v8;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hmbCanonicalType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v79 = v22;
      v80 = 2114;
      v81 = v25;
      v82 = 2112;
      v83 = v26;
      v84 = 2112;
      v85 = v27;
      _os_log_impl(&dword_1CCD48000, v20, v21, "%{public}@[%{public}@] Received and decoded record: %@/%@", buf, 0x2Au);

      v8 = v67;
      v15 = v24;

      v17 = v68;
      v16 = v66;
      v7 = v72;
    }

    objc_autoreleasePoolPop(v17);
    if (objc_msgSend(*(id *)(a1 + 32), "isInternalModel:", v15))
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
LABEL_13:
      v10 = v73;
LABEL_28:

      goto LABEL_29;
    }
    v76 = v16;
    objc_msgSend(v8, "externalID:", &v76);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v76;

    if (!v41)
    {
      v55 = (void *)MEMORY[0x1D17B6230]();
      v56 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v59 = v8;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "shortDescription");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v79 = v58;
        v80 = 2114;
        v81 = v61;
        v82 = 2112;
        v83 = v59;
        v84 = 2114;
        v85 = v42;
        _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID from record %@: %{public}@", buf, 0x2Au);

        v8 = v59;
      }

      objc_autoreleasePoolPop(v55);
      v7 = v72;
      goto LABEL_27;
    }
    v75 = v42;
    objc_msgSend(v8, "externalData:", &v75);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v75;

    if (v43)
    {
      v45 = *(void **)(a1 + 64);
      v74 = v44;
      v46 = objc_msgSend(v45, "stageAdditionForModel:externalID:externalData:error:", v15, v41, v43, &v74);
      v42 = v74;

      if ((v46 & 1) != 0)
      {
LABEL_26:
        v7 = v72;

LABEL_27:
        v10 = v73;

        v16 = v42;
        goto LABEL_28;
      }
      v70 = MEMORY[0x1D17B6230]();
      v47 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = v47;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v51 = v8;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "shortDescription");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v50;
        v80 = 2114;
        v81 = v53;
        v82 = 2114;
        v83 = v42;
        _os_log_impl(&dword_1CCD48000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add model to update to block: %{public}@", buf, 0x20u);

        v8 = v51;
        v47 = v49;
      }
      v44 = v42;
      v54 = (void *)v70;
    }
    else
    {
      v54 = (void *)MEMORY[0x1D17B6230]();
      v47 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v71 = v47;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v63 = v8;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "shortDescription");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v79 = v62;
        v80 = 2114;
        v81 = v65;
        v82 = 2112;
        v83 = v63;
        v84 = 2114;
        v85 = v44;
        _os_log_impl(&dword_1CCD48000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalData from record %@: %{public}@", buf, 0x2Au);

        v8 = v63;
        v47 = v71;
      }
    }

    objc_autoreleasePoolPop(v54);
    v42 = v44;
    goto LABEL_26;
  }
  v28 = (void *)MEMORY[0x1D17B6230]();
  v29 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shortDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmbDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v79 = v31;
    v80 = 2114;
    v81 = v33;
    v82 = 2112;
    v83 = v34;
    v84 = 2114;
    v85 = v10;
    _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch changes for record with ID %@: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v28);
LABEL_29:

}

void ____fetchChanges_block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(a1 + 56);
  if (os_log_type_enabled(v9, v10))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = v5;
    v14 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordName");
    v31 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v11;
    v36 = 2114;
    v37 = v15;
    v38 = 2114;
    v39 = v14;
    v40 = 2114;
    v41 = v16;
    _os_log_impl(&dword_1CCD48000, v9, v10, "%{public}@[%{public}@] Received record deletion for %{public}@/%{public}@", buf, 0x2Au);

    v7 = v31;
    v6 = v14;
    v5 = v13;

  }
  objc_autoreleasePoolPop(v7);
  v33 = 0;
  objc_msgSend(v5, "externalID:", &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v33;
  if (!v17)
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v28;
      v36 = 2114;
      v37 = v30;
      v38 = 2114;
      v39 = v5;
      v40 = 2114;
      v41 = v18;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID from recordID %{public}@: %{public}@", buf, 0x2Au);

    }
    goto LABEL_10;
  }
  v19 = *(void **)(a1 + 48);
  v32 = v18;
  v20 = objc_msgSend(v19, "stageRemovalForModelWithExternalID:error:", v17, &v32);
  v21 = v32;

  if ((v20 & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v25;
      v36 = 2114;
      v37 = v27;
      v38 = 2114;
      v39 = v21;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add model to remove to block: %{public}@", buf, 0x20u);

    }
    v18 = v21;
LABEL_10:

    objc_autoreleasePoolPop(v22);
    v21 = v18;
  }

}

void ____fetchChanges_block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a6);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v15 = (void *)MEMORY[0x1D17B6230]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v31 = v13;
      v20 = v12;
      v21 = v11;
      v22 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v19;
      v35 = 2114;
      v36 = v24;
      v37 = 2114;
      v38 = v25;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Failed to fetch newest records: %{public}@", buf, 0x20u);

      v10 = v22;
      v11 = v21;
      v12 = v20;
      v13 = v31;

    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v10;
    objc_msgSend(v30, "shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "hmbDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = v26;
    v35 = 2114;
    v36 = v27;
    v37 = 2112;
    v38 = v28;
    v39 = 2112;
    v40 = v29;
    _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched newest records with moreComing: %@ and serverChangeToken: %@", buf, 0x2Au);

    v10 = v32;
  }

  objc_autoreleasePoolPop(v15);
}

void ____fetchChanges_block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMBCloudZonePullResult *v45;
  id WeakRetained;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v71 = v3;
  if (!v4)
    v4 = v3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B6230]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v10;
      v84 = 2114;
      v85 = v12;
      v86 = 2114;
      v87 = (uint64_t)v5;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 48), "abort");
    if (objc_msgSend(v5, "hmbIsCKChangeTokenExpiredError"))
    {
      v13 = (void *)MEMORY[0x1D17B6230]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v16;
        v84 = 2114;
        v85 = v18;
        v86 = 2114;
        v87 = (uint64_t)v5;
        _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Performing cloud pull again with nil change token due to expired change token error: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      __fetchChanges(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (!WeakRetained)
        _HMFPreconditionFailure();
      v47 = WeakRetained;
      v48 = *(void **)(a1 + 32);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = ____fetchChanges_block_invoke_22;
      v76[3] = &unk_1E89338D0;
      v77 = v48;
      v78 = *(id *)(a1 + 72);
      v79 = *(id *)(a1 + 56);
      v80 = *(id *)(a1 + 40);
      v81 = *(id *)(a1 + 64);
      if (objc_msgSend(v77, "retryCloudKitOperation:afterError:retryBlock:", v47, v5, v76))
      {
        v49 = (void *)MEMORY[0x1D17B6230]();
        v50 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "shortDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v52;
          v84 = 2114;
          v85 = v54;
          _os_log_impl(&dword_1CCD48000, v51, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation will be retried", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v49);
        objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
      }
      else
      {
        v55 = objc_msgSend(v5, "hmbIsCKZoneDeletedError");
        if ((_DWORD)v55)
        {
          v56 = (void *)MEMORY[0x1D17B6230]();
          v57 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "shortDescription");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v83 = v59;
            v84 = 2114;
            v85 = v61;
            v86 = 2114;
            v87 = (uint64_t)v5;
            _os_log_impl(&dword_1CCD48000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Received cloud zone deletion error: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v56);
          v55 = objc_msgSend(*(id *)(a1 + 32), "handleDeletion");
        }
        v62 = (void *)MEMORY[0x1D17B6230](v55);
        v63 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "shortDescription");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v83 = v65;
          v84 = 2114;
          v85 = v67;
          v86 = 2114;
          v87 = (uint64_t)v5;
          _os_log_impl(&dword_1CCD48000, v64, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch record zone changes: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v62);
        objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v5);
      }

    }
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v19;
      v84 = 2114;
      v85 = v21;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Committing mirror input block", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v22 = *(void **)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    v75 = 0;
    objc_msgSend(v22, "commitWithOptions:error:", v23, &v75);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v75;
    v26 = (void *)MEMORY[0x1D17B6230]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v24)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "shortDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(*(id *)(a1 + 80), "count");
        *(_DWORD *)buf = 138543874;
        v83 = v30;
        v84 = 2114;
        v85 = v32;
        v86 = 2048;
        v87 = v33;
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Successfully committed block. Handling %lu internal model updates", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
      {
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = ____fetchChanges_block_invoke_28;
        v72[3] = &unk_1E8931C78;
        v34 = *(id *)(a1 + 32);
        v35 = *(_QWORD *)(a1 + 96);
        v73 = v34;
        v74 = v35;
        v36 = (id)objc_msgSend(v24, "addSuccessBlock:", v72);

      }
      v37 = objc_msgSend(*(id *)(a1 + 80), "count");
      if (v37)
        v37 = objc_msgSend(*(id *)(a1 + 32), "handleUpdatedInternalModels:", *(_QWORD *)(a1 + 80));
      v38 = (void *)MEMORY[0x1D17B6230](v37);
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "shortDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v41;
        v84 = 2114;
        v85 = v43;
        _os_log_impl(&dword_1CCD48000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZoneChangesOperation succeeded", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      v44 = *(void **)(a1 + 64);
      v45 = -[HMBCloudZonePullResult initWithProcessingFuture:]([HMBCloudZonePullResult alloc], "initWithProcessingFuture:", v24);
      objc_msgSend(v44, "finishWithResult:", v45);

      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("success"));
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "shortDescription");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v68;
        v84 = 2114;
        v85 = v70;
        v86 = 2114;
        v87 = (uint64_t)v25;
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to commit block: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("failed (commit)."));
      objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v25);
    }

  }
}

uint64_t ____fetchChanges_block_invoke_22(_QWORD *a1)
{
  return __fetchChanges(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void ____fetchChanges_block_invoke_28(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v2, "cloudZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateServerChangeToken:forZoneWithID:", v3, v4);

}

void __performCodeOperation(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47[2];
  id location;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  if (!v17)
  {
    v19 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__performCodeOperation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v19, "initWithName:", v20);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C18]), "initWithServiceName:functionName:responseClass:", v14, v15, a5);
  objc_msgSend(v21, "setRequest:", v16);
  objc_msgSend(v13, "operationConfigurationWithProcessingOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConfiguration:", v22);

  v23 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = ____performCodeOperation_block_invoke;
  v49[3] = &unk_1E8931D10;
  v24 = v13;
  v50 = v24;
  v25 = v17;
  v51 = v25;
  objc_msgSend(v21, "setRequestCompletedBlock:", v49);
  objc_initWeak(&location, v21);
  v40[0] = v23;
  v40[1] = 3221225472;
  v40[2] = ____performCodeOperation_block_invoke_7;
  v40[3] = &unk_1E8931D60;
  v26 = v24;
  v41 = v26;
  v27 = v25;
  v42 = v27;
  objc_copyWeak(v47, &location);
  v39 = v14;
  v43 = v39;
  v28 = v15;
  v44 = v28;
  v37 = v16;
  v45 = v37;
  v47[1] = a5;
  v38 = v18;
  v46 = v38;
  v29 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v21, "setCodeOperationCompletionBlock:", v40));
  v30 = v26;
  HMFGetOSLogHandle();
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shortDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "operationID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v53 = v32;
    v54 = 2114;
    v55 = v34;
    v56 = 2112;
    v57 = v28;
    v58 = 2112;
    v59 = v39;
    v60 = 2114;
    v61 = v35;
    _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting %@ CKCodeOperation for service: %@ operationID: %{public}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v29);
  objc_msgSend(v30, "privateDatabase");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addOperation:", v21);

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);

}

void sub_1CCD70E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void ____performCodeOperation_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation finished with request UUID: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void ____performCodeOperation_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v11;
      v38 = 2114;
      v39 = v13;
      v40 = 2114;
      v41 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKCodeOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v15 = WeakRetained;
    v16 = *(void **)(a1 + 32);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ____performCodeOperation_block_invoke_9;
    v28[3] = &unk_1E8931D38;
    v29 = v16;
    v30 = *(id *)(a1 + 48);
    v31 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 88);
    v32 = v17;
    v35 = v18;
    v33 = *(id *)(a1 + 40);
    v34 = *(id *)(a1 + 72);
    if (objc_msgSend(v29, "retryCloudKitOperation:afterError:retryBlock:", v15, v6, v28))
    {
      v19 = (void *)MEMORY[0x1D17B6230]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "finishWithError:", v6);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      v38 = 2114;
      v39 = v27;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKCodeOperation succeeded", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", v5);
  }

}

uint64_t ____performCodeOperation_block_invoke_9(_QWORD *a1)
{
  return __performCodeOperation(a1[4], a1[5], a1[6], a1[7], a1[10], a1[8], a1[9]);
}

void sub_1CCD71530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCD716CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD71868(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD71AD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD71D1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __transitionToState(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32[2];
  id location;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a3;
  objc_msgSend(v11, "cloudZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    buf[0] = &a9;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v12, &a9);
    objc_initWeak(&location, v11);
    v18 = objc_alloc_init(MEMORY[0x1E0D519D8]);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = ____transitionToState_block_invoke;
    v29[3] = &unk_1E8931DF8;
    objc_copyWeak(v32, &location);
    v19 = v18;
    v30 = v19;
    v32[1] = a2;
    v20 = v17;
    v31 = v20;
    objc_msgSend(v16, "addOperationWithBlock:", v29);
    objc_msgSend(v19, "future");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = v11;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = v25;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get operation queue to change state transition", (uint8_t *)buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v26 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithError:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

void sub_1CCD72160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____transitionToState_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    __updateState(WeakRetained, *(_QWORD *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 32));
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

void __updateState(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_unfair_lock_s *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  os_unfair_lock_s *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  os_unfair_lock_s *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMBCloudZoneRebuilderStatus *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  os_unfair_lock_s *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  os_unfair_lock_s *v55;
  NSObject *v56;
  void *v57;
  os_unfair_lock_s *v58;
  id v59;
  dispatch_time_t v60;
  os_unfair_lock_s *v61;
  os_unfair_lock_s *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  os_unfair_lock_s *v67;
  void *v68;
  os_unfair_lock_s *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  os_unfair_lock_s *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  HMBCloudZoneEncodingContext *v82;
  void *v83;
  os_unfair_lock_s *v84;
  NSObject *v85;
  uint64_t v86;
  const __CFString *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  BOOL v91;
  int v93;
  void *v94;
  os_unfair_lock_s *v95;
  NSObject *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  char v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  os_unfair_lock_s *v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  void *context;
  void *contexta;
  void *contextb;
  id v120;
  _QWORD v121[4];
  id v122;
  id location;
  _BYTE buf[24];
  void *v125;
  _BYTE v126[10];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v116 = a3;
  v115 = a4;
  objc_msgSend(v7, "rebuilderStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)objc_msgSend(v8, "rebuildState");

  v9 = (void *)MEMORY[0x1D17B6230]();
  v10 = (os_unfair_lock_s *)v7;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", context);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s rebuildCompleteFuture](v10, "rebuildCompleteFuture");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "isFinished");
      HMFBooleanToString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v125 = v20;
      *(_WORD *)v126 = 2112;
      *(_QWORD *)&v126[2] = v22;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Requested state transition from %@ to %@ (finished: %@).", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    if (a2 == 7 && !context)
    {
      v23 = (void *)MEMORY[0x1D17B6230]();
      v24 = v10;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_INFO, "%{public}@Initial state transition to complete finishes waitForRebuildCompletion early.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      -[os_unfair_lock_s rebuildCompleteFuture](v24, "rebuildCompleteFuture");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "finishWithNoResult");

      v28 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", context);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s rebuildCompleteFuture](v10, "rebuildCompleteFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "isFinished");
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v125 = v15;
      *(_WORD *)v126 = 2112;
      *(_QWORD *)&v126[2] = v17;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Requested state transition from %@ to %@ (finished: %@).", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
  }
  if ((unint64_t)(a2 - 1) < 6)
  {
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s rebuildCompleteFuture](v10, "rebuildCompleteFuture");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isFinished");

    if (v30)
    {
      v31 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[os_unfair_lock_s setRebuildCompleteFuture:](v10, "setRebuildCompleteFuture:", v31);

      os_unfair_lock_unlock(v10 + 2);
      v32 = (void *)MEMORY[0x1D17B6230]();
      v33 = v10;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v35;
        _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@Expected future to be in-progress but it's NOT!", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
    }
    else
    {
      os_unfair_lock_unlock(v10 + 2);
    }
    goto LABEL_19;
  }
  if (a2 == 7)
  {
LABEL_19:
    v28 = 0;
    goto LABEL_24;
  }
  v36 = (void *)MEMORY[0x1D17B6230]();
  v37 = v10;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v40;
    _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Attempting to transition into invalid state %@ (treating as Complete)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v36);
  v28 = 0;
LABEL_23:
  a2 = 7;
LABEL_24:
  v41 = -[HMBCloudZoneRebuilderStatus initWithState:message:]([HMBCloudZoneRebuilderStatus alloc], "initWithState:message:", a2, v116);
  -[os_unfair_lock_s setRebuilderStatus:](v10, "setRebuilderStatus:", v41);

  -[os_unfair_lock_s cloudZone](v10, "cloudZone");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cloudDatabase");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_unfair_lock_s rebuilderStatus](v10, "rebuilderStatus");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cloudZoneID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "updateRebuildStatus:forZoneWithID:", v44, v45);

  if (context == (void *)a2)
    v46 = 1;
  else
    v46 = v28;
  if ((v46 & 1) == 0)
  {
    objc_msgSend(v42, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1D17B6230]();
    v49 = v10;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s rebuilderStatus](v49, "rebuilderStatus");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v47;
      *(_WORD *)&buf[22] = 2112;
      v125 = v52;
      _os_log_impl(&dword_1CCD48000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying delegate %@ of updated rebuild status: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v48);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[os_unfair_lock_s rebuilderStatus](v49, "rebuilderStatus");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "cloudZone:didChangeRebuildStatus:", v42, v53);

    }
    else
    {
      v54 = (void *)MEMORY[0x1D17B6230]();
      v55 = v49;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v57;
        _os_log_impl(&dword_1CCD48000, v56, OS_LOG_TYPE_INFO, "%{public}@Delegate does not respond to selector.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v54);
    }

  }
  switch(a2)
  {
    case 2:
      v58 = v10;
      v114 = (int)arc4random_uniform(0x3938700u);
      v59 = (id)__transitionToState(v58, 3, CFSTR("Delaying rebuild for %lu usec"));
      v60 = dispatch_time(0, 1000 * v114);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____holdoffDelay_block_invoke;
      v125 = &unk_1E8932260;
      *(_QWORD *)v126 = v58;
      v61 = v58;
      dispatch_after(v60, MEMORY[0x1E0C80D38], buf);

      objc_msgSend(v115, "finishWithNoResult", v114);
      goto LABEL_63;
    case 4:
      v62 = v10;
      __fetchSentinelModel(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v62);
      v64 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____checkLockAcquire_block_invoke;
      v125 = &unk_1E8931E20;
      objc_copyWeak((id *)v126, &location);
      v65 = (id)objc_msgSend(v63, "addSuccessBlock:", buf);
      v121[0] = v64;
      v121[1] = 3221225472;
      v121[2] = ____checkLockAcquire_block_invoke_2;
      v121[3] = &unk_1E8931E70;
      objc_copyWeak(&v122, &location);
      v66 = (id)objc_msgSend(v63, "addFailureBlock:", v121);
      objc_destroyWeak(&v122);
      objc_destroyWeak((id *)v126);
      objc_destroyWeak(&location);

      goto LABEL_62;
    case 5:
      v67 = v10;
      v68 = (void *)MEMORY[0x1D17B6230]();
      v69 = v67;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v71;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 0x4082C00000000000;
        _os_log_impl(&dword_1CCD48000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting %.2f seconds for an expected cloud push.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v68);
      os_unfair_lock_lock_with_options();
      v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 600.0);
      -[os_unfair_lock_s setUploadMonitorWatchdogTimer:](v69, "setUploadMonitorWatchdogTimer:", v72);

      os_unfair_lock_unlock(v69 + 2);
      -[os_unfair_lock_s uploadMonitorWatchdogTimer](v69, "uploadMonitorWatchdogTimer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setDelegate:", v69);

      -[os_unfair_lock_s uploadMonitorWatchdogTimer](v69, "uploadMonitorWatchdogTimer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "resume");

      goto LABEL_62;
    case 6:
      v75 = v10;
      -[os_unfair_lock_s cloudZone](v75, "cloudZone");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localZone");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "modelContainer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "localDatabase");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "queue");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76 && v77 && v78 && v80)
      {
        objc_msgSend(v77, "queryAllRowRecordsReturning:", 2);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = -[HMBCloudZoneEncodingContext initWithModelContainer:]([HMBCloudZoneEncodingContext alloc], "initWithModelContainer:", v78);
        __pushChunk(v75, v76, v77, v78, v80, v82, v81);

      }
      else
      {
        contexta = (void *)MEMORY[0x1D17B6230]();
        v84 = v75;
        HMFGetOSLogHandle();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v86 = objc_claimAutoreleasedReturnValue();
          v87 = CFSTR("<NON-NULL>");
          if (!v80)
            v87 = CFSTR("operationQueue");
          if (!v78)
            v87 = CFSTR("modelContainer");
          if (!v77)
            v87 = CFSTR("localZone");
          if (!v76)
            v87 = CFSTR("cloudZone");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v86;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v87;
          v88 = (void *)v86;
          _os_log_impl(&dword_1CCD48000, v85, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ for cloud zone rebuild", buf, 0x16u);

        }
        objc_autoreleasePoolPop(contexta);
      }

      goto LABEL_62;
    case 7:
      -[os_unfair_lock_s setLastRebuildUUID:](v10, "setLastRebuildUUID:", 0);
      -[os_unfair_lock_s setPreviousSentinelRebuildRecord:](v10, "setPreviousSentinelRebuildRecord:", 0);
      if (!context || context == (void *)7)
        goto LABEL_49;
      objc_msgSend(v42, "localZone");
      contextb = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "cloudDatabase");
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = (void *)v89;
      if (v42)
        v91 = contextb == 0;
      else
        v91 = 1;
      v93 = v91 || v89 == 0;
      v94 = (void *)MEMORY[0x1D17B6230]();
      v95 = v10;
      HMFGetOSLogHandle();
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = v96;
      if (v93)
      {
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v98 = objc_claimAutoreleasedReturnValue();
          v99 = (void *)v98;
          v100 = CFSTR("<NON-NULL>");
          if (!v90)
            v100 = CFSTR("cloudDatabase");
          if (!contextb)
            v100 = CFSTR("localZone");
          if (!v42)
            v100 = CFSTR("cloudZone");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v98;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v100;
          _os_log_impl(&dword_1CCD48000, v97, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ while completing rebuild.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v94);
        __failedToComplete(v95, v115);

      }
      else
      {
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v101;
          _os_log_impl(&dword_1CCD48000, v97, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all records and resetting serverChangeToken.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v94);
        v120 = 0;
        v102 = objc_msgSend(contextb, "destroyWithError:", &v120);
        v103 = v120;
        if ((v102 & 1) != 0)
        {
          objc_msgSend(v42, "cloudZoneID");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "updateServerChangeToken:forZoneWithID:", 0, v104);

          +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("Rebuild Complete Fetch."));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (id)objc_msgSend(v42, "performCloudPullWithOptions:", v105);
          objc_msgSend(v90, "delegate");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v42, "cloudZoneID");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "cloudDatabase:didChangeManateeKeysForZoneWithID:", v90, v108);

          }
LABEL_49:
          -[os_unfair_lock_s rebuildCompleteFuture](v10, "rebuildCompleteFuture");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "finishWithNoResult");

LABEL_62:
          objc_msgSend(v115, "finishWithNoResult", v113);
        }
        else
        {
          v109 = (void *)MEMORY[0x1D17B6230]();
          v110 = v95;
          HMFGetOSLogHandle();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v112;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v103;
            _os_log_impl(&dword_1CCD48000, v111, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all records from local zone: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v109);
          __failedToComplete(v110, v115);

        }
      }
LABEL_63:

      return;
    default:
      goto LABEL_62;
  }
}

void sub_1CCD73204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ____holdoffDelay_block_invoke(uint64_t a1)
{
  return (id)__transitionToState(*(_QWORD *)(a1 + 32), 4, CFSTR("Preparing to begin lock acquisition."));
}

id __fetchSentinelModel(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v1 = a1;
  objc_msgSend(v1, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C95070]);
    +[HMBCloudZoneRebuilderModel sentinelUUID](HMBCloudZoneRebuilderModel, "sentinelUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cloudZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v5, v7);

    objc_msgSend(v2, "fetchRecordWithRecordID:canRetry:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v1);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ____fetchSentinelModel_block_invoke;
    v17[3] = &unk_1E8932C48;
    v11 = v9;
    v18 = v11;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v2, "operationScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithBlock:scheduler:", v17, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void sub_1CCD73444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____checkLockAcquire_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "hasCompleted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      v7 = (id)__transitionToState(WeakRetained, 7, CFSTR("Rebuild found complete at start of check lock acquire."));
    }
    else
    {
      objc_msgSend(v3, "uniqueToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "lastRebuildUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
      {
        v14 = (void *)MEMORY[0x1D17B6230]();
        v15 = WeakRetained;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v17;
          _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record has not mutated.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "cloudZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localDatabase");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "queue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = ____checkLockAcquire_block_invoke_156;
        v26[3] = &unk_1E8932260;
        v27 = v15;
        objc_msgSend(v21, "addOperationWithBlock:", v26);

      }
      else
      {
        objc_msgSend(WeakRetained, "lastRebuildUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "uniqueToken");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)__transitionToState(WeakRetained, 5, CFSTR("Continue monitoring of upload (token change %@ -> %@)"));

        objc_msgSend(v3, "uniqueToken", v22, v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setLastRebuildUUID:", v24);

      }
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void ____checkLockAcquire_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id val;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudDatabase");
  val = (id)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && v5 && val)
  {
    if (objc_msgSend(v3, "isHMFError") && objc_msgSend(v3, "code") == 2)
    {
      objc_msgSend(v5, "localZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = ____checkLockAcquire_block_invoke_161;
      v24[3] = &unk_1E8932260;
      v25 = WeakRetained;
      objc_msgSend(v8, "addOperationWithBlock:", v24);

    }
    else if ((objc_msgSend(v3, "hmbIsCloudKitError") & 1) != 0)
    {
      if (objc_msgSend(v3, "code") == 26 || objc_msgSend(v3, "code") == 28)
      {
        v15 = (id)__transitionToState(WeakRetained, 7, CFSTR("Zone appears removed by the user."));
        objc_initWeak((id *)buf, val);
        objc_msgSend(v5, "startUp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = ____checkLockAcquire_block_invoke_2_166;
        v21[3] = &unk_1E8931E48;
        objc_copyWeak(&v23, (id *)buf);
        v22 = WeakRetained;
        v17 = (id)objc_msgSend(v16, "addSuccessBlock:", v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else if (objc_msgSend(v3, "code") != 112)
      {
        v19 = (id)__transitionToState(WeakRetained, 2, CFSTR("Failed to fetch rebuild model with non-zone related failure: %@"));
      }
    }
    else
    {
      v18 = (id)__transitionToState(WeakRetained, 2, CFSTR("Unable to fetch rebuild model: %@"));
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("<NON-NULL>");
      if (!val)
        v14 = CFSTR("cloudDatabase");
      if (!v5)
        v14 = CFSTR("cloudZone");
      if (!WeakRetained)
        v14 = CFSTR("self");
      *(_DWORD *)buf = 138543618;
      v27 = v12;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Lost %@ for cloud zone rebuild", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void sub_1CCD73AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __pushChunk(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  int v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  id v58;
  BOOL v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  unint64_t v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  BOOL v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v78 = a2;
  v76 = a3;
  v79 = a4;
  v73 = a5;
  v75 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v72 = 0;
  do
  {
    v17 = v15;
    do
    {
      objc_msgSend(v14, "nextObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v55 = 0;
        goto LABEL_35;
      }
      v17 = v15;
    }
    while (!objc_msgSend(v15, "modelEncoding"));
    objc_msgSend(v15, "modelData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "modelEncoding");
    v94 = v16;
    objc_msgSend(v79, "modelFromData:encoding:storageLocation:error:", v18, v19, 2, &v94);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v94;

    if (v20)
    {
      v22 = objc_opt_class();
      if (v22 == objc_opt_class() || (v23 = objc_opt_class(), v23 == objc_opt_class()))
      {
        v33 = 2;
        v16 = v21;
      }
      else
      {
        v93 = v21;
        objc_msgSend(v78, "encodeRecordFromModel:existingRecord:encodingContext:error:", v20, 0, v75, &v93);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v93;

        if (v24)
        {
          objc_msgSend(v75, "createdRecords");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "recordID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "hmbModelID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v27, v28);

          v29 = objc_msgSend(v24, "size");
          objc_msgSend(v24, "recordID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKey:", v15, v30);

          objc_msgSend(v77, "addObject:", v24);
          v31 = objc_msgSend(v77, "count");
          v72 += v29;
          if (v72 > 0x200000 || v31 > 0x64)
            v33 = 3;
          else
            v33 = 0;
          v16 = v25;
        }
        else
        {
          v45 = (void *)MEMORY[0x1D17B6230]();
          v71 = v13;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "hmbDescription");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v98 = v47;
            v99 = 2112;
            v100 = (uint64_t)v48;
            v101 = 2112;
            v102 = v25;
            _os_log_impl(&dword_1CCD48000, v46, OS_LOG_TYPE_ERROR, "%{public}@unable to re-encode model %@ for cloud: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v45);
          objc_msgSend(v15, "modelID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "remove:", v50);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v51 = (void *)MEMORY[0x1D17B6230]();
            v52 = v71;
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v98 = v54;
              v99 = 2112;
              v100 = (uint64_t)v16;
              _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_ERROR, "%{public}@unable to remove corrupt record: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v51);
          }
          v33 = 2;
        }

      }
    }
    else
    {
      v34 = (void *)MEMORY[0x1D17B6230]();
      v35 = v13;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v15, "recordRow");
        *(_DWORD *)buf = 138543874;
        v98 = v37;
        v99 = 2048;
        v100 = v38;
        v101 = 2112;
        v102 = v21;
        _os_log_impl(&dword_1CCD48000, v36, OS_LOG_TYPE_ERROR, "%{public}@unable to decode model from row %lu: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      objc_msgSend(v15, "modelID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "remove:", v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v41 = (void *)MEMORY[0x1D17B6230]();
        v42 = v35;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v98 = v44;
          v99 = 2112;
          v100 = (uint64_t)v16;
          _os_log_impl(&dword_1CCD48000, v43, OS_LOG_TYPE_ERROR, "%{public}@unable to remove corrupt record: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
      }
      v33 = 2;
    }

    v55 = v15;
  }
  while (v33 != 3);
LABEL_35:
  objc_msgSend(v14, "error");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56 == 0;

  if (v57)
  {
    v59 = v15 == 0;
    objc_msgSend(v13, "previousSentinelRebuildRecord");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v16;
    __updatedSentinelRecord(v13, v60, v15 == 0, &v92);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v92;

    if (v61)
    {
      objc_msgSend(v77, "addObject:", v61);
    }
    else
    {
      v63 = (void *)MEMORY[0x1D17B6230]();
      v64 = v13;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v98 = v66;
        v99 = 2112;
        v100 = (uint64_t)v62;
        _os_log_impl(&dword_1CCD48000, v65, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate updated sentinel model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v63);
    }
    objc_msgSend(v78, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v77, MEMORY[0x1E0C9AA60], 0, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v13);
    v68 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = ____pushChunk_block_invoke;
    v82[3] = &unk_1E8931F38;
    objc_copyWeak(&v90, (id *)buf);
    v83 = v74;
    v84 = v76;
    v91 = v59;
    v85 = v73;
    v86 = v78;
    v87 = v79;
    v88 = v75;
    v89 = v14;
    v69 = (id)objc_msgSend(v67, "addSuccessBlock:", v82);
    v80[0] = v68;
    v80[1] = 3221225472;
    v80[2] = ____pushChunk_block_invoke_2;
    v80[3] = &unk_1E89327A8;
    v81 = v13;
    v70 = (id)objc_msgSend(v67, "addFailureBlock:", v80);

    objc_destroyWeak(&v90);
    objc_destroyWeak((id *)buf);

    v16 = v62;
  }
  else
  {
    v58 = (id)__transitionToState(v13, 2, CFSTR("Iteration of rows failed: %@"));
  }

}

void sub_1CCD743E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void __failedToComplete(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v10 = a1;
  objc_msgSend(v10, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRebuildOnManateeKeyLoss");

  if (v6)
  {
    v7 = CFSTR("Going to try to rebuild again.");
    v8 = v10;
    v9 = 2;
  }
  else
  {
    v7 = CFSTR("Waiting for a rebuild.");
    v8 = v10;
    v9 = 1;
  }
  __updateState(v8, v9, v7, v3);

}

id __updatedSentinelRecord(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  HMBCloudZoneRebuilderModel *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  objc_msgSend(v7, "cloudZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(HMBCloudZoneRebuilderModel);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZoneRebuilderModel setHasCompleted:](v10, "setHasCompleted:", v11);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZoneRebuilderModel setUniqueToken:](v10, "setUniqueToken:", v12);

    v22 = 0;
    objc_msgSend(v9, "encodeRecordFromModel:existingRecord:error:", v10, v8, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    v15 = v14;
    if (v13)
    {
      v16 = v13;
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode sentinel model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void ____pushChunk_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  os_unfair_lock_s *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  os_unfair_lock_s *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  os_unfair_lock_s *v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(v3, "fatalError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hmbIsCloudKitError") & 1) != 0)
  {
    objc_msgSend(v3, "fatalError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "code");

    if (v7 == 1)
    {
      objc_msgSend(v3, "fatalError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)__transitionToState(WeakRetained, 2, CFSTR("Failed recovery push with error: %@"));

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "conflicts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (id)__transitionToState(WeakRetained, 2, CFSTR("Failed recovery push due to conflicts."));
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2216;
    v39 = __Block_byref_object_dispose__2217;
    v40 = 0;
    +[HMBCloudZoneRebuilderModel sentinelUUID](HMBCloudZoneRebuilderModel, "sentinelUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "updatedRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = ____pushChunk_block_invoke_200;
    v29[3] = &unk_1E8931EE8;
    v16 = v13;
    v30 = v16;
    v34 = &v35;
    v17 = (os_unfair_lock_s *)WeakRetained;
    v31 = v17;
    v32 = *(id *)(a1 + 32);
    v33 = *(id *)(a1 + 40);
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v29);

    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s setPreviousSentinelRebuildRecord:](v17, "setPreviousSentinelRebuildRecord:", v36[5]);
    os_unfair_lock_unlock(v17 + 2);
    if (*(_BYTE *)(a1 + 96))
    {
      v18 = (id)__transitionToState(v17, 7, CFSTR("Successfully completed recovery."));
    }
    else
    {
      v19 = *(void **)(a1 + 48);
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = ____pushChunk_block_invoke_204;
      v21[3] = &unk_1E8931F10;
      v22 = v17;
      v23 = *(id *)(a1 + 56);
      v24 = *(id *)(a1 + 40);
      v25 = *(id *)(a1 + 64);
      v26 = *(id *)(a1 + 48);
      v27 = *(id *)(a1 + 72);
      v28 = *(id *)(a1 + 80);
      objc_msgSend(v19, "addOperationWithBlock:", v21);

    }
    _Block_object_dispose(&v35, 8);

  }
LABEL_11:

}

void sub_1CCD749F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  uint64_t v2;

  os_unfair_lock_unlock(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

id ____pushChunk_block_invoke_2(uint64_t a1)
{
  return (id)__transitionToState(*(_QWORD *)(a1 + 32), 2, CFSTR("Failed recovery push with error (entering back into Holdoff): %@"));
}

uint64_t __Block_byref_object_copy__2216(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2217(uint64_t a1)
{

}

void ____pushChunk_block_invoke_200(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(v4, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v8, "externalID:", &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;

    if (!v9)
    {
      v11 = (void *)MEMORY[0x1D17B6230]();
      v12 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hmbDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v14;
        v37 = 2112;
        v38 = (uint64_t)v16;
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate externalID from %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
    v33 = v10;
    objc_msgSend(v4, "externalData:", &v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v33;

    if (!v17)
    {
      v19 = (void *)MEMORY[0x1D17B6230]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hmbDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v22;
        v37 = 2112;
        v38 = (uint64_t)v23;
        v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate externalData from %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
    }
    v24 = *(void **)(a1 + 48);
    objc_msgSend(v4, "recordID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(*(id *)(a1 + 56), "setExternalID:externalData:forRecordRow:", v9, v17, objc_msgSend(v26, "recordRow"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x1D17B6230]();
        v29 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v26, "recordRow");
          *(_DWORD *)buf = 138543874;
          v36 = v31;
          v37 = 2048;
          v38 = v32;
          v39 = 2112;
          v40 = v27;
          _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset externalID and externalData for %lu: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v28);
      }
    }
    else
    {
      v27 = v18;
    }

  }
}

uint64_t ____pushChunk_block_invoke_204(_QWORD *a1)
{
  return __pushChunk(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

void ____checkLockAcquire_block_invoke_161(uint64_t a1)
{
  __lockAcquire(*(void **)(a1 + 32));
}

void ____checkLockAcquire_block_invoke_2_166(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(WeakRetained, "removePrivateZoneWithID:", v6);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Lost cloudDatabase for cloud zone rebuild", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __lockAcquire(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[3];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = v1;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v5;
    _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to acquire lock.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(v3, "cloudZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "cloudDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0D519C0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = ____lockAcquire_block_invoke;
      v27[3] = &unk_1E8932450;
      v10 = v3;
      v28 = v10;
      objc_msgSend(v7, "operationScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lazyFutureWithBlock:scheduler:", v27, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "cloudZoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removePrivateZoneWithID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v14;
      objc_msgSend(v7, "cloudZoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createPrivateZoneWithID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v16;
      v29[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v10);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = ____lockAcquire_block_invoke_2;
      v25[3] = &unk_1E8931E98;
      objc_copyWeak(&v26, (id *)buf);
      v19 = (id)objc_msgSend(v18, "addSuccessBlock:", v25);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = ____lockAcquire_block_invoke_3;
      v23[3] = &unk_1E8931E70;
      objc_copyWeak(&v24, (id *)buf);
      v20 = (id)objc_msgSend(v18, "addFailureBlock:", v23);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v22 = (id)__transitionToState(v3, 2, CFSTR("Lost pointer to cloudDatabase"));
    }

  }
  else
  {
    v21 = (id)__transitionToState(v3, 2, CFSTR("Lost pointer to cloudZone"));
  }

}

void sub_1CCD752C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void ____lockAcquire_block_invoke(uint64_t a1, void *a2)
{
  __pushSentinelModel(*(void **)(a1 + 32), 0, a2);
}

void ____lockAcquire_block_invoke_2(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)__transitionToState(WeakRetained, 6, CFSTR("Acquired zone lock for rebuild."));

}

void ____lockAcquire_block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (id)__transitionToState(WeakRetained, 2, CFSTR("Failed to acquire lock due to sentinel model push failure: %@"));

}

void __pushSentinelModel(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v31 = 0;
    __updatedSentinelRecord(v5, 0, a2, &v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmbDescription");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Pushing sentinel record: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v32 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v16, MEMORY[0x1E0C9AA60], 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "errorOnlyCompletionHandlerAdapter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v17, "addFailureBlock:", v18);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = ____pushSentinelModel_block_invoke;
      v27[3] = &unk_1E8931EC0;
      v28 = v11;
      v29 = v6;
      v30 = v7;
      v20 = (id)objc_msgSend(v17, "addSuccessBlock:", v27);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "zoneID");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        v37 = 2112;
        v38 = v9;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to create sentinel model for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v6, "finishWithError:", v9);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B6230]();
    v22 = v5;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = CFSTR("cloudZone");
      _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@Lost %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v9);
  }

}

void ____pushSentinelModel_block_invoke(id *a1, void *a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  os_unfair_lock_s *v41;
  id v42;
  NSObject *v43;
  objc_class *v44;
  __CFString *v45;
  id v46;
  void *v47;
  void *v48;
  void *context;
  void *v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[__CFString fatalError](v3, "fatalError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hmbIsCloudKitError") & 1) == 0)
  {

LABEL_7:
    objc_msgSend(a1[4], "cloudZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v27 = (void *)MEMORY[0x1D17B6230]();
      v28 = a1[4];
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v30;
        v54 = 2112;
        v55 = CFSTR("localCloudZone");
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@Lost %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      v31 = a1[5];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "finishWithError:", v20);
      goto LABEL_34;
    }
    -[__CFString conflicts](v3, "conflicts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1D17B6230]();
      v17 = a1[4];
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v19;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sentinel record already exists on the server. Returning server version.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v15, "serverRecord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if (v20)
        goto LABEL_12;
    }
    else
    {
      -[__CFString updatedRecords](v3, "updatedRecords");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "anyObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
      if (v21)
      {
LABEL_12:
        v51 = 0;
        objc_msgSend(v13, "decodeModelFromRecord:externalRecordFields:source:error:", v20, 0, 4, &v51);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (__CFString *)v51;
        if (v22)
        {
          v23 = (void *)MEMORY[0x1D17B6230]();
          v24 = a1[4];
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v26;
            v54 = 2112;
            v55 = v22;
            _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from CK Record: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          objc_msgSend(a1[5], "finishWithError:", v22);
        }
        else
        {
          v38 = v50;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
          v40 = v39;

          if (v40)
          {
            objc_msgSend(a1[6], "handleUpdatedRebuilderModel:", v40);
            v41 = (os_unfair_lock_s *)((char *)a1[4] + 8);
            os_unfair_lock_lock_with_options();
            objc_msgSend(a1[4], "setPreviousSentinelRebuildRecord:", v21);
            os_unfair_lock_unlock(v41);
            objc_msgSend(a1[5], "finishWithResult:", v40);
          }
          else
          {
            context = (void *)MEMORY[0x1D17B6230]();
            v42 = a1[4];
            HMFGetOSLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (objc_class *)objc_opt_class();
              NSStringFromClass(v44);
              v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v48;
              v54 = 2112;
              v55 = v45;
              _os_log_impl(&dword_1CCD48000, v43, OS_LOG_TYPE_ERROR, "%{public}@Record was not expected type (got %@)", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            v46 = a1[5];
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "finishWithError:", v47);

          }
        }

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
    }
    v33 = (void *)MEMORY[0x1D17B6230]();
    v34 = a1[4];
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v36;
      v54 = 2112;
      v55 = v3;
      _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to find appropriate error for sentinel record push result: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v37 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "finishWithError:", v22);
    goto LABEL_33;
  }
  -[__CFString fatalError](v3, "fatalError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 != 1)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString fatalError](v3, "fatalError");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Sentinel model push failed with fatal error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = a1[5];
  -[__CFString fatalError](v3, "fatalError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finishWithError:", v13);
LABEL_35:

}

void sub_1CCD75DBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____checkLockAcquire_block_invoke_156(uint64_t a1)
{
  __lockAcquire(*(void **)(a1 + 32));
}

void ____fetchSentinelModel_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "addFailureBlock:", v5);

  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____fetchSentinelModel_block_invoke_2;
  v10[3] = &unk_1E8931F88;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v8 = v3;
  v11 = v8;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v10);

  objc_destroyWeak(&v12);
}

void sub_1CCD75EB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ____fetchSentinelModel_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *context;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cloudZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v34 = 0;
      objc_msgSend(v6, "decodeModelFromRecord:externalRecordFields:source:error:", v3, 0, 4, &v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      if (v9)
      {
        v10 = (void *)MEMORY[0x1D17B6230]();
        v11 = v5;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v13;
          v37 = 2112;
          v38 = v9;
          _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from CK Record: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
      }
      else
      {
        v23 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;
        v25 = v24;

        if (!v25)
        {
          context = (void *)MEMORY[0x1D17B6230]();
          v26 = v5;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v32;
            v37 = 2112;
            v38 = v29;
            _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_ERROR, "%{public}@Record was not expected type (got %@)", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
          v30 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "finishWithError:", v31);

        }
        objc_msgSend(v5, "setPreviousSentinelRebuildRecord:", v3);
        objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v25);

      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17B6230]();
      v19 = v5;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v21;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Lost cloudZone for cloud zone rebuild", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v22 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "finishWithError:", v9);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v16;
      _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_ERROR, "%{public}@Lost self for cloud zone rebuild", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishWithError:", v7);
  }

}

id __processSentinelModel(void *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v19;

  v3 = a1;
  objc_msgSend(a2, "hasCompleted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v11 = CFSTR("Startup with completed sentinel model.");
    v12 = v3;
    v13 = 7;
  }
  else
  {
    objc_msgSend(v3, "cloudZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldRebuildOnManateeKeyLoss");

    v11 = CFSTR("Startup with missing manatee key.");
    v12 = v3;
    if (v16)
      v13 = 4;
    else
      v13 = 1;
  }
  __transitionToState(v12, (void *)v13, v11, v6, v7, v8, v9, v10, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void ____startUp_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __processSentinelModel(*(void **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched sentinel model: %@.", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "addCompletionBlock:", v9);

}

void ____startUp_block_invoke_211(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _BYTE v23[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138543618;
    *(_QWORD *)&v23[4] = v7;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Sentinel model push failed: %@.", v23, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v13 = objc_msgSend(v3, "hmbIsCKMissingManateeIdentityError");
  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(v14, "cloudZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldRebuildOnManateeKeyLoss");

    v14 = *(void **)(a1 + 32);
    if (v17)
    {
      v18 = CFSTR("Came up in Manatee Key Loss. Going to try to blow things away and fix them.");
      v19 = 4;
    }
    else
    {
      v18 = CFSTR("Don't have keys, waiting for someone else to rebuild the zone.");
      v19 = 1;
    }
  }
  else
  {
    v18 = CFSTR("Unable to push sentinel model due to some other issue. Letting startup continue normally.");
    v19 = 7;
  }
  __transitionToState(v14, (void *)v19, v18, v8, v9, v10, v11, v12, *(uint64_t *)v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "addCompletionBlock:", v21);

}

void sub_1CCD77524(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD77690(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD7BC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CCD7C2A0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD7C8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCD7D2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CCD7DA7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD7DB34(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2986(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2987(uint64_t a1)
{

}

id ____fetchStoreInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "_fetchAllZones:", &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  return v4;
}

id ____createZone_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v4, "_insertZoneWithIdentification:name:error:", v5, v6, &v10);

  v8 = v10;
  objc_msgSend(*(id *)(a1 + 32), "setZoneRow:", v7);

  return v8;
}

void sub_1CCD7E254(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD7ED20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD7FFE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD803B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CCD80858(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD80D68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD81274(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD81F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CCD82F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

id __waitForAccountAvailability(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  id v7;
  id location;

  v1 = a1;
  objc_initWeak(&location, v1);
  v2 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v7, &location);
  objc_msgSend(v1, "operationScheduler", v6, 3221225472, ____waitForAccountAvailability_block_invoke, &unk_1E8932388);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lazyFutureWithBlock:scheduler:", &v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void sub_1CCD84828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____waitForAccountAvailability_block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "credentialsAvailabilityListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForAccountAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v6);
}

id __synchronizeZoneStateForZoneIDs(void *a1, void *a2, void *a3, char a4)
{
  os_unfair_lock_s *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  os_unfair_lock_s *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *context;
  _QWORD v25[4];
  id v26;
  os_unfair_lock_s *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v9, "lastAdministrativeFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmbModelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v7 + 2);
  if ((a4 & 1) != 0 || (v14 = objc_msgSend(v10, "timeIntervalSinceNow"), v15 < -604800.0))
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = ____synchronizeZoneStateForZoneIDs_block_invoke;
    v25[3] = &unk_1E8932568;
    v26 = v8;
    v27 = v7;
    v28 = v12;
    v29 = v11;
    v30 = v13;
    v31 = v9;
    -[os_unfair_lock_s operationScheduler](v27, "operationScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lazyFutureWithBlock:scheduler:", v25, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    context = (void *)MEMORY[0x1D17B6230](v14);
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v23;
      v34 = 2114;
      v35 = v12;
      v36 = 2114;
      v37 = v21;
      v38 = 2114;
      v39 = v10;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Not synchronizing zone state for %{public}@ because force=%{public}@ and last administrative fetch was %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(context);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void sub_1CCD84D84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_unfair_lock_s *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D28540]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__synchronizeZoneStateForZoneIDs_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:", v4);

  v6 = *(_QWORD *)(a1 + 32) == 0;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v57 = v15;
      v58 = 2114;
      v59 = v17;
      v60 = 2112;
      v61 = v18;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Synchronizing zone state for all zone IDs in database: %@", buf, 0x20u);

    }
  }
  else if (v10)
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v11;
    v58 = 2114;
    v59 = v13;
    v60 = 2112;
    v61 = v14;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Synchronizing zone state for zone IDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 40), "zoneStateByZoneID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_302;
  v51[3] = &unk_1E8932478;
  v52 = *(id *)(a1 + 32);
  v53 = *(id *)(a1 + 48);
  v23 = v19;
  v54 = v23;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v51);

  os_unfair_lock_unlock(v20);
  v24 = (void *)MEMORY[0x1D17B6230]();
  v25 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v27;
    v58 = 2114;
    v59 = v29;
    v60 = 2112;
    v61 = v23;
    _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Created pre-fetch mapping of zone state by zone ID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(*(id *)(a1 + 40), "fetchZonesWithIDs:inDatabase:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fetchSubscriptionsInDatabase:", *(_QWORD *)(a1 + 56));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D519C0];
  v55[0] = v30;
  v55[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "chainFutures:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v22;
  v43[1] = 3221225472;
  v43[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_303;
  v43[3] = &unk_1E8932540;
  v44 = *(id *)(a1 + 40);
  v45 = v5;
  v46 = v30;
  v47 = *(id *)(a1 + 64);
  v48 = v31;
  v49 = *(id *)(a1 + 72);
  v50 = v23;
  v35 = v23;
  v36 = v31;
  v37 = v30;
  v38 = v5;
  objc_msgSend(v34, "addSuccessBlock:", v43);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "completionHandlerAdapter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v39, "addCompletionBlock:", v40);

}

void sub_1CCD852EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6 || objc_msgSend(v6, "containsObject:", v11))
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    v8 = objc_msgSend(v11, "scope");
    if (v8 == objc_msgSend(*(id *)(a1 + 40), "scope"))
    {
      objc_msgSend(v7, "needsZoneCreation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v11);
    }

  }
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_303(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  os_unfair_lock_s *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  os_unfair_lock_s *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v3 = (void *)MEMORY[0x1D17B6230]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v71 = v6;
    v72 = 2114;
    v73 = v8;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Processing fetched zones and subscriptions for zone state synchronization", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_304;
  v66[3] = &unk_1E89324A0;
  v15 = *(void **)(a1 + 48);
  v67 = *(id *)(a1 + 56);
  v16 = v13;
  v68 = v16;
  v17 = (id)objc_msgSend(v15, "addSuccessBlock:", v66);
  v18 = *(void **)(a1 + 32);
  v19 = *(void **)(a1 + 64);
  v62[0] = v14;
  v62[1] = 3221225472;
  v62[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_2;
  v62[3] = &unk_1E89324C8;
  v63 = v18;
  v64 = *(id *)(a1 + 72);
  v20 = v16;
  v65 = v20;
  v21 = (id)objc_msgSend(v19, "addSuccessBlock:", v62);
  v22 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v23 = *(void **)(a1 + 80);
  v56[0] = v14;
  v56[1] = 3221225472;
  v56[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_3;
  v56[3] = &unk_1E89324F0;
  v24 = v20;
  v57 = v24;
  v58 = *(id *)(a1 + 32);
  v59 = *(id *)(a1 + 40);
  v25 = v10;
  v60 = v25;
  v48 = v12;
  v61 = v48;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v56);
  v51[0] = v14;
  v51[1] = 3221225472;
  v51[2] = ____synchronizeZoneStateForZoneIDs_block_invoke_306;
  v51[3] = &unk_1E8932518;
  v52 = *(id *)(a1 + 32);
  v53 = *(id *)(a1 + 40);
  v50 = v11;
  v54 = v50;
  v49 = v9;
  v55 = v49;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v51);
  v46 = v24;
  objc_msgSend(*(id *)(a1 + 32), "stateZone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  objc_msgSend(v26, "update:", v50);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1D17B6230]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v71 = v32;
      v72 = 2114;
      v73 = v34;
      v74 = 2112;
      v75 = v50;
      v76 = 2112;
      v77 = v28;
      _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update zone models in local DB %@: %@", buf, 0x2Au);

      v27 = v25;
    }

    objc_autoreleasePoolPop(v29);
  }

  os_unfair_lock_unlock(v22);
  objc_msgSend(*(id *)(a1 + 32), "handleRemovedZoneIDs:userInitiated:", v27, 0);
  objc_msgSend(*(id *)(a1 + 32), "handleCreatedZoneIDs:", v49);
  v35 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "setLastAdministrativeFetch:", v36);

  objc_msgSend(*(id *)(a1 + 32), "stateZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "update:remove:", v38, v48);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x1D17B6230]();
    v41 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "shortDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v43;
      v72 = 2114;
      v73 = v45;
      v74 = 2112;
      v75 = v39;
      _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to update database state for zone state synchronization: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v40);
  }

  os_unfair_lock_unlock(v35);
}

void sub_1CCD85A3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_304(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____processZones_block_invoke;
  v8[3] = &unk_1E8932428;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  v6 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v8);

}

void ____synchronizeZoneStateForZoneIDs_block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  void *v22;
  HMBCloudZoneID *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMBCloudZoneID *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  os_unfair_lock_s *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id obj;
  void *v42;
  os_unfair_lock_s *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE buf[24];
  void *v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v6 = (void *)a1[6];
  v7 = v4;
  v8 = v5;
  v9 = v3;
  v38 = v6;
  v43 = v7;
  os_unfair_lock_lock_with_options();
  v37 = v8;
  objc_msgSend(v8, "cloudID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v7 + 2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v46;
    v40 = *MEMORY[0x1E0C94730];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          if (objc_msgSend(v44, "scope") == 3
            && (objc_msgSend(v15, "zoneID"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v16, "ownerName"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "isEqualToString:", v40),
                v17,
                v16,
                v18))
          {
            v19 = (void *)MEMORY[0x1D17B6230]();
            v20 = v43;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v15;
              _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unexpected subscription on shared zone: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v19);
          }
          else
          {
            v23 = [HMBCloudZoneID alloc];
            -[os_unfair_lock_s containerID](v43, "containerID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v44, "scope");
            objc_msgSend(v15, "zoneID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v23, "initWithContainerID:scope:zoneID:", v24, v25, v26);

            objc_msgSend(v42, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v28, v27);
            }
            objc_msgSend(v28, "addObject:", v15);

          }
        }
        else
        {
          v29 = v13;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v30 = v29;
          else
            v30 = 0;
          v31 = v30;

          if (v31)
          {
            objc_msgSend(v39, "addObject:", v31);
          }
          else
          {
            v32 = (void *)MEMORY[0x1D17B6230]();
            v33 = v43;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v35;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v29;
              _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@Got unexpected subscription %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v32);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v10);
  }

  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ____processSubscriptions_block_invoke;
  v50 = &unk_1E8932400;
  v36 = v42;
  v51 = v36;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", buf);
  os_unfair_lock_lock_with_options();
  objc_msgSend(v37, "setSubscriptions:", v39);
  os_unfair_lock_unlock(v43 + 2);

}

void sub_1CCD86018(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone was deleted with ID: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v14 = *(void **)(a1 + 56);
    objc_msgSend(v6, "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    v16 = *(void **)(a1 + 64);
    objc_msgSend(v6, "hmbModelID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    objc_msgSend(*(id *)(a1 + 40), "zoneStateByZoneID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v5);

  }
}

void ____synchronizeZoneStateForZoneIDs_block_invoke_306(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "zoneStateByZoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "subscriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1D17B6230]();
      v13 = a1[4];
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "subscriptions");
        v30 = v12;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hmbDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "subscriptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hmbDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v32 = v15;
        v33 = 2114;
        v34 = v16;
        v35 = 2112;
        v36 = v5;
        v37 = 2112;
        v38 = v17;
        v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Updating subscriptions for zone ID %@ from %@ to %@", buf, 0x34u);

        v12 = v30;
      }

      objc_autoreleasePoolPop(v12);
      objc_msgSend(v6, "subscriptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubscriptions:", v19);

      objc_msgSend(a1[6], "addObject:", v8);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = a1[4];
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      v33 = 2114;
      v34 = v25;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone was created with ID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(a1[7], "addObject:", v5);
    objc_msgSend(a1[6], "addObject:", v6);
    objc_msgSend(a1[4], "zoneStateByZoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v6, v5);

  }
}

void ____processSubscriptions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "setSubscriptions:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubscriptions:", v6);

  }
}

void ____processZones_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMBCloudZoneStateModel *v4;
  void *v5;
  HMBCloudZoneStateModel *v6;

  v3 = a2;
  v4 = [HMBCloudZoneStateModel alloc];
  objc_msgSend(v3, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBCloudZoneStateModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, *(_QWORD *)(a1 + 32));

  -[HMBCloudZoneStateModel setZoneID:](v6, "setZoneID:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v3);

}

void sub_1CCD86768(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ____synchronizeAllZoneState_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "privateDatabaseState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __synchronizeZoneStateForZoneIDs(v4, 0, v5, *(_BYTE *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "sharedDatabaseState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __synchronizeZoneStateForZoneIDs(v7, 0, v8, *(_BYTE *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "operationScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineAllFutures:scheduler:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ____synchronizeAllZoneState_block_invoke_2;
  v16[3] = &unk_1E89323B0;
  v17 = v3;
  v14 = v3;
  v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v16);

}

void ____removeDeletedZones_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____removeDeletedZones_block_invoke_2;
  v13[3] = &unk_1E8932400;
  v9 = v4;
  v14 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  os_unfair_lock_unlock(v5);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = ____removeDeletedZones_block_invoke_3;
  v10[3] = &unk_1E8932428;
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v8 = v3;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v8, "finishWithNoResult");

}

void sub_1CCD86DD0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____removeDeletedZones_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "needsZoneDeletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void ____removeDeletedZones_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Found zone ID that needs deletion: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "removeZoneWithID:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v9);

}

uint64_t ____synchronizeAllZoneState_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithNoResult");
  else
    return objc_msgSend(v2, "finishWithError:");
}

void __modifyRecordZoneOperation(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  void *context;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id from;
  id location;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  unint64_t v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v35 = a1;
  v36 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  v37 = (void *)v12;
  v38 = (void *)v11;
  if (v11 | v12)
  {
    v34 = v14;
    v16 = v35;
    if (!v13)
    {
      v17 = objc_alloc(MEMORY[0x1E0D28540]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__modifyRecordZoneOperation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v17, "initWithName:", v18);

    }
    v19 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
    objc_msgSend(v35, "operationConfigurationWithProcessingOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConfiguration:", v20);

    if (v38)
    {
      v60[0] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRecordZonesToSave:", v21);

    }
    if (v12)
    {
      v59 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRecordZoneIDsToDelete:", v22);

    }
    objc_initWeak(&location, v35);
    objc_initWeak(&from, v19);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = ____modifyRecordZoneOperation_block_invoke;
    v39[3] = &unk_1E89326C0;
    v31 = &v45;
    objc_copyWeak(&v45, &location);
    v13 = v13;
    v40 = v13;
    objc_copyWeak(&v46, &from);
    v41 = v34;
    v33 = v36;
    v42 = v33;
    v23 = v38;
    v43 = v23;
    v24 = (id)v12;
    v44 = v24;
    context = (void *)MEMORY[0x1D17B6230](objc_msgSend(v19, "setModifyRecordZonesCompletionBlock:", v39));
    v25 = v35;
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier", &v45, context);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "operationID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v50 = v27;
      v51 = 2114;
      v52 = v29;
      v53 = 2112;
      v54 = v23;
      v55 = 2112;
      v56 = v24;
      v57 = 2114;
      v58 = v30;
      _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKModifyRecordZonesOperation with zoneToSave: %@ zoneIDToRemove: %@ operationID: %{public}@", buf, 0x34u);

      v16 = v35;
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(v33, "addOperation:", v19);

    objc_destroyWeak(&v46);
    objc_destroyWeak(v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v15 = v34;
  }
  else
  {
    objc_msgSend(v14, "finishWithNoResult");
    v16 = v35;
  }

}

void sub_1CCD87D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,id a30)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a29);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

void ____modifyRecordZoneOperation_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE *v53;
  uint8_t v54[4];
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  _BYTE buf[24];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v41 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (v7)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2114;
      v61 = v7;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordZonesOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v61) = 1;
    v15 = objc_msgSend(v7, "hmbIsCKPartialFailureError");
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
      objc_msgSend(v7, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hmf_dictionaryForKey:", *MEMORY[0x1E0C94940]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v50[0] = v16;
      v50[1] = 3221225472;
      v50[2] = ____modifyRecordZoneOperation_block_invoke_30;
      v50[3] = &unk_1E8932670;
      v51 = v10;
      v52 = a1[4];
      v53 = buf;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v50);

    }
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v19 = objc_loadWeakRetained(a1 + 10);
      if (!v19)
      {
        _HMFPreconditionFailure();
        __break(1u);
      }
      v42[0] = v16;
      v42[1] = 3221225472;
      v42[2] = ____modifyRecordZoneOperation_block_invoke_32;
      v42[3] = &unk_1E8932698;
      objc_copyWeak(&v49, a1 + 9);
      v43 = a1[5];
      v20 = v7;
      v44 = v20;
      v45 = a1[6];
      v46 = a1[7];
      v47 = a1[8];
      v48 = a1[4];
      v21 = objc_msgSend(v10, "retryCloudKitOperation:afterError:retryBlock:", v19, v20, v42);
      v22 = (void *)MEMORY[0x1D17B6230]();
      v23 = v10;
      if (v21)
      {
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = v22;
          HMFGetLogIdentifier();
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "shortDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138543618;
          v55 = v26;
          v56 = 2114;
          v57 = v28;
          _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifyRecordZonesOperation will be retried", v54, 0x16u);

          v22 = v25;
        }

        objc_autoreleasePoolPop(v22);
        objc_msgSend(a1[4], "markWithReason:", CFSTR("deferred"));
      }
      else
      {
        HMFGetOSLogHandle();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v39 = v22;
          HMFGetLogIdentifier();
          v36 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "shortDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138543874;
          v55 = v36;
          v56 = 2114;
          v57 = v38;
          v58 = 2114;
          v59 = v20;
          _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifyRecordZonesOperation failed and cannot be retried: %{public}@", v54, 0x20u);

          v22 = v39;
        }

        objc_autoreleasePoolPop(v22);
        objc_msgSend(a1[4], "markWithFormat:", CFSTR("failed with error: %@"), v20);
        objc_msgSend(a1[5], "finishWithError:", v20);
      }

      objc_destroyWeak(&v49);
      _Block_object_dispose(buf, 8);
      goto LABEL_20;
    }
    _Block_object_dispose(buf, 8);
  }
  v29 = (void *)MEMORY[0x1D17B6230]();
  v30 = WeakRetained;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shortDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v34;
    _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifyRecordZonesOperation succeeded", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  objc_msgSend(a1[5], "finishWithNoResult");
LABEL_20:

}

void sub_1CCD88360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v12 - 144), 8);
  _Unwind_Resume(a1);
}

void ____modifyRecordZoneOperation_block_invoke_30(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(v8, "hmbIsCKMissingManateeIdentityError") & 1) != 0
    || objc_msgSend(v8, "hmbIsCKUnsyncedKeychainError"))
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Ignoring partial error for zoneID %{public}@: %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void ____modifyRecordZoneOperation_block_invoke_32(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
    __modifyRecordZoneOperation(WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));

}

void sub_1CCD889E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __fetchCloudZones(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id location;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    v14 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchCloudZones");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v14, "initWithName:", v15);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v17 = objc_alloc(MEMORY[0x1E0C94E08]);
    objc_msgSend(v10, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithRecordZoneIDs:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94E08], "fetchAllRecordZonesOperation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "operationConfigurationWithProcessingOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConfiguration:", v20);

  v21 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = ____fetchCloudZones_block_invoke;
  v49[3] = &unk_1E89325F8;
  v22 = v9;
  v50 = v22;
  v23 = v12;
  v51 = v23;
  v24 = v16;
  v52 = v24;
  objc_msgSend(v19, "setPerRecordZoneCompletionBlock:", v49);
  objc_initWeak(&location, v19);
  v40[0] = v21;
  v40[1] = 3221225472;
  v40[2] = ____fetchCloudZones_block_invoke_17;
  v40[3] = &unk_1E8932648;
  v25 = v22;
  v41 = v25;
  v39 = v23;
  v42 = v39;
  objc_copyWeak(&v47, &location);
  v26 = v10;
  v43 = v26;
  v27 = v11;
  v44 = v27;
  v37 = v13;
  v45 = v37;
  v38 = v24;
  v46 = v38;
  v28 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v19, "setFetchRecordZonesCompletionBlock:", v40));
  v29 = v25;
  HMFGetOSLogHandle();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v26;
    HMFGetLogIdentifier();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shortDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hmbDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "operationID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v54 = v31;
    v55 = 2114;
    v56 = v33;
    v57 = 2112;
    v58 = v34;
    v59 = 2114;
    v60 = v35;
    _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchRecordZonesOperation for database: %@ operationID: %{public}@", buf, 0x2Au);

    v26 = v36;
  }

  objc_autoreleasePoolPop(v28);
  objc_msgSend(v27, "addOperation:", v19);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

}

void sub_1CCD88E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void ____fetchCloudZones_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
LABEL_7:
    objc_msgSend(a1[6], "addObject:", v7);
    goto LABEL_8;
  }
  if ((objc_msgSend(v9, "hmbIsCKMissingManateeIdentityError") & 1) != 0
    || objc_msgSend(v10, "hmbIsCKUnsyncedKeychainError"))
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmbDescription");
      v25 = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v14;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31 = v17;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Ignoring Manatee error for zoneID %{public}@: %{public}@", buf, 0x2Au);

      v11 = v25;
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_7;
  }
  v18 = (void *)MEMORY[0x1D17B6230]();
  v19 = a1[4];
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmbDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v21;
    v28 = 2114;
    v29 = v23;
    v30 = 2114;
    v31 = v24;
    v32 = 2114;
    v33 = v10;
    _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Could not fetch record with zone ID %{public}@: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v18);
LABEL_8:

}

void ____fetchCloudZones_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "hmbIsCKPartialFailureError") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v23;
      v51 = 2114;
      v52 = v25;
      v53 = 2114;
      v54 = v7;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZonesOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v19 = WeakRetained;
    v27 = *(void **)(a1 + 32);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = ____fetchCloudZones_block_invoke_19;
    v43[3] = &unk_1E89338D0;
    v44 = v27;
    v45 = *(id *)(a1 + 48);
    v46 = *(id *)(a1 + 56);
    v47 = *(id *)(a1 + 40);
    v48 = *(id *)(a1 + 64);
    v28 = objc_msgSend(v44, "retryCloudKitOperation:afterError:retryBlock:", v19, v7, v43);
    v29 = (void *)MEMORY[0x1D17B6230]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v28)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v33;
        v51 = 2114;
        v52 = v35;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordZonesOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v36;
        v51 = 2114;
        v52 = v38;
        v53 = 2114;
        v54 = v7;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordZonesOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v7);
      objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v7);
    }

  }
  else
  {
    v8 = *(void **)(a1 + 72);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = ____fetchCloudZones_block_invoke_25;
    v40[3] = &unk_1E8932620;
    v41 = *(id *)(a1 + 32);
    v42 = *(id *)(a1 + 56);
    objc_msgSend(v8, "na_map:", v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbDescription");
      v39 = v10;
      v16 = v7;
      v17 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v13;
      v51 = 2114;
      v52 = v15;
      v53 = 2112;
      v54 = v18;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordZonesOperation succeeded with zones: %@", buf, 0x20u);

      v5 = v17;
      v7 = v16;
      v10 = v39;

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", v9);

    v19 = v41;
  }

}

uint64_t ____fetchCloudZones_block_invoke_19(_QWORD *a1)
{
  return __fetchCloudZones(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

HMBCloudZoneID *____fetchCloudZones_block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  HMBCloudZoneID *v4;
  void *v5;
  HMBCloudZoneID *v6;

  v3 = a2;
  v4 = [HMBCloudZoneID alloc];
  objc_msgSend(*(id *)(a1 + 32), "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v4, "initWithContainerID:scope:zoneID:", v5, objc_msgSend(*(id *)(a1 + 40), "scope"), v3);

  return v6;
}

void ____bindProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  sqlite3_stmt *v8;
  int v9;
  void *v10;
  id *v11;
  uint64_t *v12;
  sqlite3_stmt *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v15 = a3;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(sqlite3_stmt **)(a1 + 32);
  v9 = objc_msgSend(v6, "intValue");

  v10 = v15;
  if (v7 == v15)
  {
    v17 = 0;
    v11 = (id *)&v17;
    v12 = &v17;
    v13 = v8;
    v14 = v9;
    v10 = 0;
  }
  else
  {
    v16 = 0;
    v11 = (id *)&v16;
    v12 = &v16;
    v13 = v8;
    v14 = v9;
  }
  hmbBindDataSQLite3(v13, v14, v10, v12);

}

id __encodeArguments(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a2;
  objc_msgSend(v8, "arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ____encodeArguments_block_invoke;
  v17[3] = &unk_1E89328C0;
  v18 = v5;
  v19 = v6;
  v20 = v10;
  v12 = v10;
  v13 = v6;
  v14 = v5;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);

  v15 = (void *)objc_msgSend(v12, "copy");
  return v15;
}

void ____encodeArguments_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SEL v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;

  v22 = a2;
  v5 = a3;
  if ((objc_msgSend(v22, "hasPrefix:", CFSTR("_")) & 1) != 0)
    goto LABEL_11;
  v6 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v22;
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v7, "encodedDefaultValuesByArgumentName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v15;

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v12)
  {
    objc_msgSend(v7, "argumentFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_13;
    objc_msgSend(v14, "encodeQueryableValue:", v10);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v5);

LABEL_11:
    return;
  }
  _HMFPreconditionFailure();
LABEL_13:
  v17 = (void *)_HMFPreconditionFailure();
  +[HMBModelUnindexedQuery queryWithSQLPredicate:ascending:arguments:](v17, v18, v19, v20, v21);
}

void sub_1CCD8E874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCD8F14C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD8F1CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD8F27C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD8F5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCD8F7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4043(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4044(uint64_t a1)
{

}

void sub_1CCD939A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD94690(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __fetchRecordsWithRecordIDs(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  id location;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchRecordsWithRecordIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v13, "initWithName:", v14);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C94E18]);
  objc_msgSend(v10, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithRecordIDs:", v17);

  objc_msgSend(v9, "cloudDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "operationConfigurationWithProcessingOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConfiguration:", v20);

  v21 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = ____fetchRecordsWithRecordIDs_block_invoke;
  v48[3] = &unk_1E8932AE8;
  v22 = v9;
  v49 = v22;
  v23 = v11;
  v50 = v23;
  v24 = v15;
  v51 = v24;
  objc_msgSend(v18, "setPerRecordCompletionBlock:", v48);
  objc_initWeak(&location, v18);
  v39[0] = v21;
  v39[1] = 3221225472;
  v39[2] = ____fetchRecordsWithRecordIDs_block_invoke_62;
  v39[3] = &unk_1E8932B38;
  v25 = v22;
  v40 = v25;
  v38 = v23;
  v41 = v38;
  objc_copyWeak(&v45, &location);
  v46 = a3;
  v37 = v10;
  v42 = v37;
  v26 = v12;
  v43 = v26;
  v36 = v24;
  v44 = v36;
  v27 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v18, "setFetchRecordsCompletionBlock:", v39));
  v28 = v25;
  HMFGetOSLogHandle();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "shortDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hmbDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "operationID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v53 = v30;
    v54 = 2114;
    v55 = v32;
    v56 = 2112;
    v57 = v33;
    v58 = 2114;
    v59 = v34;
    _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchRecordsOperation with record IDs: %@ operationID: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(v28, "database");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addOperation:", v18);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

}

void sub_1CCD94AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void ____fetchRecordsWithRecordIDs_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = a1[4];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v23 = v10;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v14;
      v26 = 2114;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched record with ID %@: %@", buf, 0x2Au);

      v9 = v16;
      v10 = v23;

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v19;
      v26 = 2114;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch record with ID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void ____fetchRecordsWithRecordIDs_block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v11;
      v47 = 2114;
      v48 = v13;
      v49 = 2114;
      v50 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v15 = WeakRetained;
    v16 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 80))
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = ____fetchRecordsWithRecordIDs_block_invoke_65;
      v39[3] = &unk_1E8932B10;
      v40 = v16;
      v41 = *(id *)(a1 + 48);
      v44 = *(_BYTE *)(a1 + 80);
      v42 = *(id *)(a1 + 40);
      v43 = *(id *)(a1 + 56);
      v17 = objc_msgSend(v40, "retryCloudKitOperation:afterError:retryBlock:", v15, v6, v39);

      if ((v17 & 1) != 0)
      {
        v18 = (void *)MEMORY[0x1D17B6230]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "shortDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v21;
          v47 = 2114;
          v48 = v23;
          _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordsOperation will be retried", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v16, "notifyDelegateOfError:forOperation:", v6, v15);
    }
    if (objc_msgSend(v6, "hmbIsCKPartialFailureError") && *(_QWORD *)(a1 + 64))
    {
      v27 = (void *)MEMORY[0x1D17B6230]();
      v28 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "shortDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v30;
        v47 = 2114;
        v48 = v32;
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation partially failed, but returning those records that were successfully fetched", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(a1 + 64));
    }
    else
    {
      v33 = (void *)MEMORY[0x1D17B6230]();
      v34 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v36;
        v47 = 2114;
        v48 = v38;
        v49 = 2114;
        v50 = v6;
        _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v6);
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
    }
    goto LABEL_22;
  }
  if (v10)
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v24;
    v47 = 2114;
    v48 = v26;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation succeeded", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("succeeded"));
  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(a1 + 64));
LABEL_23:

}

uint64_t ____fetchRecordsWithRecordIDs_block_invoke_65(uint64_t a1)
{
  return __fetchRecordsWithRecordIDs(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_1CCD95F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4646(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4647(uint64_t a1)
{

}

id ____fetchNextBatch_block_invoke_4649(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  uint64_t v18;
  id v19;
  id v20;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "statement");
  objc_msgSend(*(id *)(a1 + 32), "currentSequenceAsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v3, "bindPropertiesToStatement:currentSequence:error:", v6, v7, &v20);
  v8 = v20;

  objc_msgSend(*(id *)(a1 + 32), "statement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "statement");
  v19 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____fetchNextBatch_block_invoke_2_4652;
  v15[3] = &unk_1E8932B88;
  v16 = *(id *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 56);
  LOBYTE(v10) = objc_msgSend(v4, "fetchSQLite3:error:block:", v10, &v19, v15);

  v11 = v19;
  if ((v10 & 1) == 0)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
  return v11;
}

id ____fetchNextBatch_block_invoke_2_4652(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  id v13;
  id obj;
  char v15;

  v15 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  v13 = 0;
  obj = v7;
  objc_msgSend(v5, "fetchRowFromStatement:skip:updatedSequenceColumn:error:", a2, &v15, &obj, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v9 = v13;
  if (v8)
  {
    if (v15
      || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1,
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8),
          v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"),
          v10 < +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect")))
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      *a3 = 1;
    }
  }
  else
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setCurrentSequence:", 0);
    v11 = v9;
  }

  return v11;
}

void __queryRecordsWithRecordType(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id location;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v15)
  {
    if (v14)
      goto LABEL_6;
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__queryRecordsWithRecordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v17, "initWithName:", v18);

    if (v14)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v19 = objc_alloc(MEMORY[0x1E0C95010]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "initWithRecordType:predicate:", v12, v20);

  v22 = objc_alloc(MEMORY[0x1E0C95038]);
  v44 = (void *)v21;
  if (v13)
    v23 = objc_msgSend(v22, "initWithCursor:", v13);
  else
    v23 = objc_msgSend(v22, "initWithQuery:", v21);
  v24 = (void *)v23;
  objc_msgSend(v11, "cloudZoneID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "zoneID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setZoneID:", v26);

  v27 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = ____queryRecordsWithRecordType_block_invoke;
  v55[3] = &unk_1E8932BD8;
  v28 = v11;
  v56 = v28;
  v29 = v15;
  v57 = v29;
  v30 = v14;
  v58 = v30;
  objc_msgSend(v24, "setRecordMatchedBlock:", v55);
  objc_initWeak(&location, v24);
  v46[0] = v27;
  v46[1] = 3221225472;
  v46[2] = ____queryRecordsWithRecordType_block_invoke_9;
  v46[3] = &unk_1E8932C00;
  v31 = v28;
  v47 = v31;
  v45 = v29;
  v48 = v45;
  objc_copyWeak(&v53, &location);
  v32 = v12;
  v49 = v32;
  v41 = v13;
  v50 = v41;
  v42 = v30;
  v51 = v42;
  v43 = v16;
  v52 = v43;
  v33 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v24, "setQueryCompletionBlock:", v46));
  v34 = v31;
  HMFGetOSLogHandle();
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "identifier", v41, v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "shortDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "operationID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v60 = v36;
    v61 = 2114;
    v62 = v38;
    v63 = 2112;
    v64 = v32;
    v65 = 2114;
    v66 = v39;
    _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKQueryOperation for record type: %@ operationID: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(v34, "database");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addOperation:", v24);

  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

}

void sub_1CCD96C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____queryRecordsWithRecordType_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = a1[4];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v24 = v10;
      v17 = v9;
      v18 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v14;
      v27 = 2114;
      v28 = v16;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Queried record: %@", buf, 0x20u);

      v7 = v18;
      v9 = v17;
      v10 = v24;

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[6], "addObject:", v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmbDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v20;
      v27 = 2114;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to query record with ID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void ____queryRecordsWithRecordType_block_invoke_9(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(_QWORD *);
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v10;
      v58 = 2114;
      v59 = v12;
      v60 = 2114;
      v61 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKQueryOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v14 = WeakRetained;
    v15 = a1[4];
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = ____queryRecordsWithRecordType_block_invoke_11;
    v49 = &unk_1E8933F68;
    v50 = v15;
    v51 = a1[6];
    v52 = a1[7];
    v53 = a1[8];
    v54 = a1[5];
    v55 = a1[9];
    v16 = objc_msgSend(v50, "retryCloudKitOperation:afterError:retryBlock:", v14, v6, &v46);
    if ((_DWORD)v16)
    {
      v24 = (void *)MEMORY[0x1D17B6230](v16, v17, v18, v19, v20, v21, v22, v23, v46);
      v25 = a1[4];
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v27;
        v58 = 2114;
        v59 = v29;
        _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
    }
    else
    {
      if (objc_msgSend(v6, "hmbIsCKZoneDeletedError", v46, v47, v48, v49, v50, v51, v52, v53, v54))
      {
        v37 = (void *)MEMORY[0x1D17B6230]();
        v38 = a1[4];
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "shortDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v57 = v40;
          v58 = 2114;
          v59 = v42;
          v60 = 2114;
          v61 = v6;
          _os_log_impl(&dword_1CCD48000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Received cloud zone deletion error: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
        objc_msgSend(a1[4], "handleDeletion");
      }
      objc_msgSend(a1[9], "finishWithError:", v6);
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1D17B6230]();
    v31 = a1[4];
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v33)
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v34;
        v58 = 2114;
        v59 = v36;
        v60 = 2112;
        v61 = v5;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation finished with cursor: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      __queryRecordsWithRecordType(a1[4], a1[6], v5, a1[8], a1[5], a1[9]);
    }
    else
    {
      if (v33)
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "shortDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v43;
        v58 = 2114;
        v59 = v45;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKQueryOperation succeeded", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(a1[9], "finishWithResult:", a1[8]);
    }
  }

}

uint64_t ____queryRecordsWithRecordType_block_invoke_11(_QWORD *a1)
{
  return __queryRecordsWithRecordType(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void sub_1CCD98184(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD98324(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD9851C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD98884(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD98BB4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD98F14(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD997D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __fetchSubscriptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *context;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchSubscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v11, "initWithName:", v12);

  }
  objc_msgSend(MEMORY[0x1E0C94E60], "fetchAllSubscriptionsOperation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationConfigurationWithProcessingOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConfiguration:", v14);

  objc_initWeak(&location, v13);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = ____fetchSubscriptions_block_invoke;
  v28[3] = &unk_1E8932C70;
  v15 = v7;
  v29 = v15;
  v16 = v9;
  v30 = v16;
  objc_copyWeak(&v33, &location);
  v17 = v8;
  v31 = v17;
  v18 = v10;
  v32 = v18;
  context = (void *)MEMORY[0x1D17B6230](objc_msgSend(v13, "setFetchSubscriptionCompletionBlock:", v28));
  v19 = v15;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v26 = v18;
    HMFGetLogIdentifier();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmbDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v21;
    v37 = 2114;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    v41 = 2114;
    v42 = v25;
    _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchSubscriptionsOperation for database: %@ operationID: %{public}@", buf, 0x2Au);

    v18 = v26;
  }

  objc_autoreleasePoolPop(context);
  objc_msgSend(v17, "addOperation:", v13);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void sub_1CCD99D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void ____fetchSubscriptions_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v11;
      v46 = 2114;
      v47 = v13;
      v48 = 2114;
      v49 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchSubscriptionsOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v15 = WeakRetained;
    v16 = a1[4];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = ____fetchSubscriptions_block_invoke_16;
    v39[3] = &unk_1E89335A0;
    v40 = v16;
    v41 = a1[6];
    v42 = a1[5];
    v43 = a1[7];
    v17 = objc_msgSend(v40, "retryCloudKitOperation:afterError:retryBlock:", v15, v6, v39);
    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = a1[4];
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = v5;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v22;
        v46 = 2114;
        v47 = v25;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchSubscriptionsOperation will be retried", buf, 0x16u);

        v5 = v24;
      }

      objc_autoreleasePoolPop(v18);
      objc_msgSend(a1[5], "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "shortDescription");
        v36 = v5;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v34;
        v46 = 2114;
        v47 = v37;
        v48 = 2114;
        v49 = v6;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchSubscriptionsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

        v5 = v36;
      }

      objc_autoreleasePoolPop(v18);
      objc_msgSend(a1[5], "markWithFormat:", CFSTR("failed with error: %@"), v6);
      objc_msgSend(a1[7], "finishWithError:", v6);
    }

    v33 = v40;
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v38 = v5;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "hmbDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v26;
      v46 = 2114;
      v47 = v28;
      v48 = 2112;
      v49 = v30;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchSubscriptionsOperation succeeded with subscription IDs: %@", buf, 0x20u);

      v5 = v38;
    }

    objc_autoreleasePoolPop(v7);
    v31 = a1[7];
    v32 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v15);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "finishWithResult:", v33);
  }

}

uint64_t ____fetchSubscriptions_block_invoke_16(_QWORD *a1)
{
  return __fetchSubscriptions(a1[4], a1[5], a1[6], a1[7]);
}

void sub_1CCD9B238(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x230]);
  _Unwind_Resume(a1);
}

void sub_1CCD9B514(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____performCloudPush_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "inProgressPushFuturesByOutputBlockRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  os_unfair_lock_unlock(v6);
}

void sub_1CCD9BCBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __pushWithRecovery(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;

  v13 = a1;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v13, "cloudDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "operationConfigurationWithProcessingOptions:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v21, v16, v20, objc_msgSend(v17, "shouldRollBackIfMirrorOutputFails"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = ____pushWithRecovery_block_invoke;
  v42[3] = &unk_1E8932D60;
  v24 = v13;
  v43 = v24;
  v25 = v18;
  v44 = v25;
  v26 = (id)objc_msgSend(v22, "addFailureBlock:", v42);
  v34[0] = v23;
  v34[1] = 3221225472;
  v34[2] = ____pushWithRecovery_block_invoke_33;
  v34[3] = &unk_1E8932D88;
  v35 = v25;
  v36 = v17;
  v37 = v24;
  v38 = v14;
  v39 = v15;
  v40 = v16;
  v41 = a2;
  v27 = v16;
  v28 = v15;
  v29 = v14;
  v30 = v24;
  v31 = v17;
  v32 = v25;
  v33 = (id)objc_msgSend(v22, "addSuccessBlock:", v34);

}

void sub_1CCD9D1D4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5001(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5002(uint64_t a1)
{

}

void ____modelRequiresPostProcessing_block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a3, "conformsToHMBModelNativeCKWrapper"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x1E0C9AAB0];

    *a4 = 1;
  }
}

void ____pushWithRecovery_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Records push failed immediately: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

void ____pushWithRecovery_block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMBCloudZoneRecordPushResult *v41;
  void *v42;
  void *v43;
  HMBCloudZoneRecordPushResult *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  void *v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "conflicts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
LABEL_26:
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
    goto LABEL_27;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "shouldRollBackIfMirrorOutputFails") & 1) != 0)
    goto LABEL_23;
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  v8 = *(void **)(a1 + 48);
  objc_msgSend(v3, "conflicts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "cloudZone:didEncounterConflicts:options:", v8, v11, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v12 = objc_msgSend(v8, "resolveConflicts:options:", v9, *(_QWORD *)(a1 + 40));
  }

  if ((v12 & 1) == 0)
  {
LABEL_23:
    v36 = (void *)MEMORY[0x1D17B6230]();
    v37 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v39;
      _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Drop all cloud records requested by conflict resolution delegate callback.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    goto LABEL_26;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = v3;
  objc_msgSend(v3, "conflicts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v13)
  {
    v14 = v13;
    v51 = *(_QWORD *)v53;
    v46 = a1;
    do
    {
      v15 = 0;
      v47 = v14;
      do
      {
        if (*(_QWORD *)v53 != v51)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v15);
        v17 = *(void **)(a1 + 56);
        objc_msgSend(v16, "recordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1D17B6230]();
        v21 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v23)
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "recordID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "hmbDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "model");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "hmbDescription");
            v27 = v20;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v24;
            v58 = 2112;
            v59 = v25;
            v60 = 2112;
            v61 = v28;
            _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping cloud push record %@ / %@ due to conflict.", buf, 0x20u);

            v20 = v27;
            v14 = v47;

            a1 = v46;
          }
        }
        else if (v23)
        {
          HMFGetLogIdentifier();
          v50 = v20;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "recordID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "hmbDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v29;
          v58 = 2112;
          v59 = v31;
          _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping cloud push record %@ due to conflict.", buf, 0x16u);

          v14 = v47;
          v20 = v50;
        }

        objc_autoreleasePoolPop(v20);
        v32 = *(void **)(a1 + 56);
        objc_msgSend(v16, "recordID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v33);

        v34 = *(void **)(a1 + 64);
        objc_msgSend(v16, "recordID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", 0, v35);

        ++v15;
      }
      while (v14 != v15);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v14);
  }

  if (objc_msgSend(*(id *)(a1 + 64), "count") || objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    __pushWithRecovery(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    v40 = *(void **)(a1 + 32);
    v41 = [HMBCloudZoneRecordPushResult alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:error:](v41, "initWithUpdatedRecords:deletedRecordIDs:error:", v42, v43, 0);
    objc_msgSend(v40, "finishWithResult:", v44);

  }
  v3 = v45;
LABEL_27:

}

void sub_1CCD9E784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id ____reindexTable_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 40), "zoneRow");
  v4 = 0;
  objc_msgSend(v1, "_deleteAllQueriesForZoneRow:error:", v2, &v4);
  return v4;
}

uint64_t __Block_byref_object_copy__5118(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5119(uint64_t a1)
{

}

void ____reindexTable_block_invoke_84(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id obj;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buildQueriableFieldsForModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ____reindexTable_block_invoke_2;
  v13[3] = &unk_1E8932E50;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v9 = v5;
  v16 = v9;
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 56);
  v17 = v10;
  v18 = v11;
  v12 = objc_msgSend(v7, "sqlBlockWithActivity:error:block:", 0, &obj, v13);
  objc_storeStrong((id *)(v8 + 40), obj);

  if ((v12 & 1) == 0)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

id ____reindexTable_block_invoke_86(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  objc_msgSend(*(id *)(a1 + 40), "modelType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "_insertIndexSentinelWithZoneRow:modelType:error:", v5, v6, &v9);

  v7 = v9;
  return v7;
}

id ____reindexTable_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "zoneRow");
  v6 = objc_msgSend(*(id *)(a1 + 48), "hmbRecordRow");
  v7 = *(_QWORD *)(a1 + 56);
  v18 = 0;
  objc_msgSend(v4, "_updateQueryForZoneRow:recordRow:encodedColumns:error:", v5, v6, v7, &v18);
  v8 = v18;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(_QWORD *)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v10 + 1;
  if ((v10 & 0x3FF) == 0)
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - 1;
      objc_msgSend(*(id *)(a1 + 32), "modelType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v14;
      v21 = 2048;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Have re-indexed %lu records of %@ type.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

  return v8;
}

void sub_1CCD9F4FC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCD9F8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CCD9FFF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDA02E4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CCDA2764(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDA338C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1CCDA3930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void ____initializeShareParticipantModels_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "participant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "ckShareParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 64);
    objc_msgSend(v3, "participant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ckShareParticipant");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "participantID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Removing participant that is no longer on share: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v18 = *(void **)(a1 + 48);
    objc_msgSend(v3, "hmbModelID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v18, "remove:", v20);

    objc_msgSend(*(id *)(a1 + 40), "recordIDForModel:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  }

}

uint64_t ____initializeShareParticipantModels_block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushDeletedParticipantRecordIDs:", *(_QWORD *)(a1 + 40));
}

uint64_t ____initializeShareParticipantModels_block_invoke_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "participant");
}

uint64_t ____initializeShareParticipantModels_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "participantID");
}

uint64_t ____fetchShareModel_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbModelID");
}

void sub_1CCDA5B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CCDA63AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDA6534(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDA65F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __removeParticipantFromShare(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = v5;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v11;
    v62 = 2112;
    v63 = (uint64_t)v6;
    v64 = 2112;
    v65 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ from share %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v6);

  if ((v13 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1D17B6230]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v24;
    v62 = 2112;
    v63 = (uint64_t)v6;
    v64 = 2112;
    v65 = v7;
    v25 = "%{public}@Not removing participant %@ from share because it doesn't exist on share: %@";
LABEL_10:
    _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, v25, buf, 0x20u);

    goto LABEL_11;
  }
  if (objc_msgSend(v6, "role") == 1)
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = v9;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v17;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_FAULT, "%{public}@Cannot remove participant from share: Cannot remove the owner from a share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x1E0D519C0];
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("Cannot remove the owner from a share");
LABEL_16:
    objc_msgSend(v19, "hmfErrorWithCode:reason:", 5, v20);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v26 = (void *)v32;

    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isCurrentUser"))
  {
    v27 = (void *)MEMORY[0x1D17B6230]();
    v28 = v9;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v30;
      _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_FAULT, "%{public}@Cannot remove participant from share: Cannot remove the current user from the share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v18 = (void *)MEMORY[0x1E0D519C0];
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("Cannot remove the current user from the share");
    goto LABEL_16;
  }
  objc_msgSend(v7, "currentUserParticipant");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "role") == 1)
  {

LABEL_22:
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v7, "participants");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v56;
LABEL_24:
      v41 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v41);
        if ((objc_msgSend(v6, "isEqual:", v42) & 1) != 0)
          break;
        if (v39 == ++v41)
        {
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v39)
            goto LABEL_24;
          goto LABEL_30;
        }
      }
      v31 = v42;

      if (!v31)
        goto LABEL_33;
      objc_msgSend(v7, "removeParticipant:", v31);
      objc_msgSend(v9, "_pushUpdatedShare:", v7);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_30:

LABEL_33:
    v21 = (void *)MEMORY[0x1D17B6230]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v24;
    v62 = 2112;
    v63 = (uint64_t)v6;
    v64 = 2112;
    v65 = v7;
    v25 = "%{public}@Didn't find requested participant %@ on share %@. Considering this success";
    goto LABEL_10;
  }
  objc_msgSend(v7, "currentUserParticipant");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "role");

  if (v36 == 2)
    goto LABEL_22;
  v43 = (void *)MEMORY[0x1D17B6230]();
  v44 = v9;
  HMFGetOSLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUserParticipant");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "role");
    *(_DWORD *)buf = 138543618;
    v61 = v46;
    v62 = 2048;
    v63 = v48;
    _os_log_impl(&dword_1CCD48000, v45, OS_LOG_TYPE_FAULT, "%{public}@Current user participant with non-owner role %ld cannot remove participants from a share", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v43);
  v49 = (void *)MEMORY[0x1E0D519C0];
  v50 = (void *)MEMORY[0x1E0CB35C8];
  v51 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "currentUserParticipant");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringWithFormat:", CFSTR("Current user participant with non-owner role %ld cannot remove participants from a share"), objc_msgSend(v52, "role"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "hmfErrorWithCode:reason:", 5, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "futureWithError:", v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v26;
}

uint64_t __Block_byref_object_copy__5635(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5636(uint64_t a1)
{

}

id __addParticipantToShare(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = v5;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding participant %@ to share %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v6);

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = v9;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ because it already exists on share %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    __removeParticipantFromShare(v15, v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = ____addParticipantToShare_block_invoke;
    v21[3] = &unk_1E8933160;
    v22 = v15;
    v23 = v6;
    objc_msgSend(v18, "flatMap:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "addParticipant:", v6);
    objc_msgSend(v9, "_pushUpdatedShare:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

uint64_t ____addParticipantToShare_block_invoke(uint64_t a1, uint64_t a2)
{
  return __addParticipantToShare(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

BOOL __reloadSQLQueryMetadata(void *a1, _QWORD *a2)
{
  id v3;
  sqlite3 *v4;
  void *v5;
  id v6;
  sqlite3 *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  void *v22;
  id v23;
  void (*v24)(uint64_t);
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE buf[24];
  void *v37;
  id v38;
  uint64_t *v39;
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (sqlite3 *)objc_msgSend(v3, "context");
  v27 = 0;
  selectSQLite3(v4, "SELECT master.tbl_name, master.name, index_info.seqno, index_info.name FROM sqlite_master AS master, PRAGMA_INDEX_INFO(master.name) AS index_info WHERE master.type = 'index' AND master.tbl_name like 'queryable_%' ORDER BY master.tbl_name, master.name, index_info.seqno", MEMORY[0x1E0C9AA70], &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  v7 = (sqlite3 *)objc_msgSend(v3, "context");
  v26 = v6;
  selectSQLite3(v7, "SELECT master.name, table_info.name, table_info.type, master.sql FROM sqlite_master AS master, PRAGMA_TABLE_XINFO(master.name) AS table_info WHERE master.name LIKE 'queryable%' ORDER BY master.name, table_info.name", MEMORY[0x1E0C9AA70], &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v3;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Significant failure during preparation of queries: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (a2)
      *a2 = objc_retainAutorelease(v9);
  }
  else
  {
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = (uint64_t)&v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__5747;
    v34 = __Block_byref_object_dispose__5748;
    v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__5747;
    v28[4] = __Block_byref_object_dispose__5748;
    v29 = 0;
    v16 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____parseExistingTables_block_invoke;
    v37 = &unk_1E8933470;
    v39 = &v30;
    v40 = v28;
    v17 = v15;
    v38 = v17;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", buf);
    objc_msgSend(v17, "na_dictionaryByMappingValues:", &__block_literal_global_5749);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

    objc_msgSend(v3, "setQueryTables:", v18);
    objc_msgSend(v3, "queryTables");
    v19 = (void (*)(uint64_t))(id)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0C99E08];
    v21 = v5;
    objc_msgSend(v20, "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v16;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____parseExistingIndexes_block_invoke;
    v37 = &unk_1E89334D8;
    v38 = v22;
    v23 = v22;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", buf);

    v30 = v16;
    v31 = 3221225472;
    v32 = (uint64_t)____parseExistingIndexes_block_invoke_2;
    v33 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8933528;
    v34 = v19;
    v24 = v19;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", &v30);

  }
  return v9 == 0;
}

void sub_1CCDA9228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDA94E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5747(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5748(uint64_t a1)
{

}

void ____parseExistingTables_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "objectAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v3, "objectAtIndex:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v3, "objectAtIndex:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_30;
  }
  if (!v9)
  {
LABEL_30:
    _HMFPreconditionFailure();
LABEL_31:
    _HMFPreconditionFailure();
  }
  if (!v12)
    goto LABEL_31;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", v6) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("_")) & 1) == 0)
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("BLOB"))
      && objc_msgSend(v15, "containsString:", CFSTR("CONSTRAINT fk_queryable_"))
      && (objc_msgSend(v15, "containsString:", CFSTR("FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE")) & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v19 = (void *)MEMORY[0x1D17B6230]();
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v15, "containsString:", CFSTR("CONSTRAINT fk_queryable_"));
          HMFBooleanToString();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "containsString:", CFSTR("FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE"));
          HMFBooleanToString();
          v29 = v19;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v31 = v21;
          v32 = 2112;
          v33 = v28;
          v34 = 2112;
          v35 = v12;
          v36 = 2112;
          v37 = v22;
          v38 = 2112;
          v39 = v23;
          _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_INFO, "%{public}@discarding existing index table %@ (%@ / %@ / %@)", buf, 0x34u);

          v19 = v29;
        }

        objc_autoreleasePoolPop(v19);
      }
      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = 0;

    }
  }

}

void ____parseExistingIndexes_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v18, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v18, "objectAtIndex:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v18, "objectAtIndex:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v8)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v11)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v14)
  {
LABEL_27:
    v17 = _HMFPreconditionFailure();
    ____parseExistingIndexes_block_invoke_2(v17);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v15, v5);
  }
  objc_msgSend(v15, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v8);
  }
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("_")) & 1) == 0)
    objc_msgSend(v16, "addObject:", v14);

}

void ____parseExistingIndexes_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ____parseExistingIndexes_block_invoke_3;
    v8[3] = &unk_1E8933500;
    v9 = v5;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void ____parseExistingIndexes_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  HMBLocalSQLContextQueryIndex *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[HMBLocalSQLContextQueryIndex initWithColumns:]([HMBLocalSQLContextQueryIndex alloc], "initWithColumns:", v5);

  objc_msgSend(*(id *)(a1 + 32), "mutableIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

HMBLocalSQLContextQueryTable *____parseExistingTables_block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  HMBLocalSQLContextQueryTable *v4;

  v3 = a3;
  v4 = -[HMBLocalSQLContextQueryTable initWithColumnNames:]([HMBLocalSQLContextQueryTable alloc], "initWithColumnNames:", v3);

  return v4;
}

void __fetchUserRecord(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  id location;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchUserRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v11, "initWithName:", v12);

  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__5827;
  v42[4] = __Block_byref_object_dispose__5828;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C94E18], "fetchCurrentUserRecordOperation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationConfigurationWithProcessingOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConfiguration:", v14);

  v15 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = ____fetchUserRecord_block_invoke;
  v38[3] = &unk_1E8933640;
  v16 = v7;
  v39 = v16;
  v17 = v9;
  v40 = v17;
  v41 = v42;
  objc_msgSend(v13, "setPerRecordCompletionBlock:", v38);
  objc_initWeak(&location, v13);
  v30[0] = v15;
  v30[1] = 3221225472;
  v30[2] = ____fetchUserRecord_block_invoke_31;
  v30[3] = &unk_1E8933668;
  v18 = v16;
  v31 = v18;
  v29 = v17;
  v32 = v29;
  v28 = &v36;
  objc_copyWeak(&v36, &location);
  v19 = v8;
  v33 = v19;
  v20 = v10;
  v34 = v20;
  v35 = v42;
  v21 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v13, "setFetchRecordsCompletionBlock:", v30));
  v22 = v18;
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier", &v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v24;
    v46 = 2114;
    v47 = v26;
    v48 = 2114;
    v49 = v27;
    _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchRecordsOperation for current user record with operationID: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v19, "addOperation:", v13);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  _Block_object_dispose(v42, 8);
}

void sub_1CCDAA620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5827(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5828(uint64_t a1)
{

}

void ____fetchUserRecord_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1D17B6230]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v21 = v9;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v17;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetched user record: %@", buf, 0x20u);

      v9 = v21;
    }

    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("finished"));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch user record: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v10);
  }

}

void ____fetchUserRecord_block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v10;
      v47 = 2114;
      v48 = v12;
      v49 = 2114;
      v50 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v14 = WeakRetained;
    v15 = *(void **)(a1 + 32);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = ____fetchUserRecord_block_invoke_32;
    v40[3] = &unk_1E89335A0;
    v41 = v15;
    v42 = *(id *)(a1 + 48);
    v43 = *(id *)(a1 + 40);
    v44 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v41, "retryCloudKitOperation:afterError:retryBlock:", v14, v6, v40);
    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v21;
        v47 = 2114;
        v48 = v23;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchRecordsOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v33;
        v47 = 2114;
        v48 = v35;
        v49 = 2114;
        v50 = v6;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v6);
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
    }

LABEL_17:
    goto LABEL_18;
  }
  v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v25 = (void *)MEMORY[0x1D17B6230]();
  v26 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v24)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "shortDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v36;
      v47 = 2114;
      v48 = v38;
      _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchRecordsOperation did not retrieve user record, but no error was returned", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v39 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "finishWithError:", v14);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shortDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    v46 = v29;
    v47 = 2114;
    v48 = v31;
    v49 = 2112;
    v50 = v32;
    _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchRecordsOperation succeeded with record: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
LABEL_18:

}

uint64_t ____fetchUserRecord_block_invoke_32(_QWORD *a1)
{
  return __fetchUserRecord(a1[4], a1[5], a1[6], a1[7]);
}

void __acceptInvitation(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[5];
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__acceptInvitation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v11, "initWithName:", v12);

  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__5827;
  v43[4] = __Block_byref_object_dispose__5828;
  v44 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C94B78]);
  objc_msgSend(v7, "operationConfigurationWithProcessingOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConfiguration:", v14);

  v53[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShareMetadatas:", v15);

  v16 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = ____acceptInvitation_block_invoke;
  v39[3] = &unk_1E8933618;
  v17 = v7;
  v40 = v17;
  v18 = v9;
  v41 = v18;
  v42 = v43;
  objc_msgSend(v13, "setPerShareCompletionBlock:", v39);
  objc_initWeak(&location, v13);
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = ____acceptInvitation_block_invoke_27;
  v31[3] = &unk_1E89335C8;
  v19 = v17;
  v32 = v19;
  v30 = v18;
  v33 = v30;
  objc_copyWeak(&v37, &location);
  v20 = v8;
  v34 = v20;
  v29 = v10;
  v35 = v29;
  v36 = v43;
  v21 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v13, "setAcceptSharesCompletionBlock:", v31));
  v22 = v19;
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v46 = v24;
    v47 = 2114;
    v48 = v26;
    v49 = 2112;
    v50 = v20;
    v51 = 2114;
    v52 = v27;
    _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKAcceptSharesOperation with share metadata: %@ operationID: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v22, "container");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v13);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  _Block_object_dispose(v43, 8);
}

void sub_1CCDAB1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____acceptInvitation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v21 = v10;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2114;
      v25 = v17;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Successfully accepted share for share metadata %@: %@", buf, 0x2Au);

      v9 = v16;
      v10 = v21;

    }
    objc_autoreleasePoolPop(v10);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to accept share metadata %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void ____acceptInvitation_block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2114;
      v37 = v10;
      v38 = 2114;
      v39 = v3;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKAcceptSharesOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v12 = WeakRetained;
    v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = ____acceptInvitation_block_invoke_28;
    v29[3] = &unk_1E89335A0;
    v30 = v13;
    v31 = *(id *)(a1 + 48);
    v32 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 56);
    v14 = objc_msgSend(v30, "retryCloudKitOperation:afterError:retryBlock:", v12, v3, v29);
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKAcceptSharesOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        v38 = 2114;
        v39 = v3;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKAcceptSharesOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v3);
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
    }

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2114;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKAcceptSharesOperation succeeded with share: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("finished"));
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

uint64_t ____acceptInvitation_block_invoke_28(_QWORD *a1)
{
  return __acceptInvitation(a1[4], a1[5], a1[6], a1[7]);
}

void __fetchShareMetadata(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  id v41;
  id location;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchShareMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v11, "initWithName:", v12);

  }
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__5827;
  v47[4] = __Block_byref_object_dispose__5828;
  v48 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C94E30]);
  objc_msgSend(v7, "operationConfigurationWithProcessingOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConfiguration:", v14);

  objc_msgSend(v8, "shareURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShareURLs:", v16);

  objc_msgSend(v8, "shareURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v17;
  objc_msgSend(v8, "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShareInvitationTokensByShareURL:", v19);

  v20 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = ____fetchShareMetadata_block_invoke;
  v43[3] = &unk_1E89335F0;
  v21 = v7;
  v44 = v21;
  v22 = v9;
  v45 = v22;
  v46 = v47;
  objc_msgSend(v13, "setPerShareMetadataBlock:", v43);
  objc_initWeak(&location, v13);
  v35[0] = v20;
  v35[1] = 3221225472;
  v35[2] = ____fetchShareMetadata_block_invoke_23;
  v35[3] = &unk_1E89335C8;
  v23 = v21;
  v36 = v23;
  v34 = v22;
  v37 = v34;
  objc_copyWeak(&v41, &location);
  v24 = v8;
  v38 = v24;
  v33 = v10;
  v39 = v33;
  v40 = v47;
  v25 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v13, "setFetchShareMetadataCompletionBlock:", v35));
  v26 = v23;
  HMFGetOSLogHandle();
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shortDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v50 = v28;
    v51 = 2114;
    v52 = v30;
    v53 = 2112;
    v54 = v24;
    v55 = 2114;
    v56 = v31;
    _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchShareMetadataOperation for invitation: %@ operationID: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v26, "container");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addOperation:", v13);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  _Block_object_dispose(v47, 8);
}

void sub_1CCDABCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____fetchShareMetadata_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v21 = v10;
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2114;
      v25 = v17;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Fetched share metadata for url %@: %@", buf, 0x2Au);

      v9 = v16;
      v10 = v21;

    }
    objc_autoreleasePoolPop(v10);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      v26 = 2112;
      v27 = v7;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch share metadata for url %@: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void ____fetchShareMetadata_block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2114;
      v37 = v10;
      v38 = 2114;
      v39 = v3;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareMetadataOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v12 = WeakRetained;
    v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = ____fetchShareMetadata_block_invoke_24;
    v29[3] = &unk_1E89335A0;
    v30 = v13;
    v31 = *(id *)(a1 + 48);
    v32 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 56);
    v14 = objc_msgSend(v30, "retryCloudKitOperation:afterError:retryBlock:", v12, v3, v29);
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchShareMetadataOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        v38 = 2114;
        v39 = v3;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchShareMetadataOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v3);
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
    }

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2114;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareMetadataOperation succeeded with share metadata: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("finished"));
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

uint64_t ____fetchShareMetadata_block_invoke_24(_QWORD *a1)
{
  return __fetchShareMetadata(a1[4], a1[5], a1[6], a1[7]);
}

void __fetchParticipant(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[5];
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__fetchParticipant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v11, "initWithName:", v12);

  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__5827;
  v43[4] = __Block_byref_object_dispose__5828;
  v44 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C94E50]);
  objc_msgSend(v7, "operationConfigurationWithProcessingOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConfiguration:", v14);

  v53[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserIdentityLookupInfos:", v15);

  v16 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = ____fetchParticipant_block_invoke;
  v39[3] = &unk_1E8933578;
  v17 = v7;
  v40 = v17;
  v18 = v9;
  v41 = v18;
  v42 = v43;
  objc_msgSend(v13, "setShareParticipantFetchedBlock:", v39);
  objc_initWeak(&location, v13);
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = ____fetchParticipant_block_invoke_9;
  v31[3] = &unk_1E89335C8;
  v19 = v17;
  v32 = v19;
  v30 = v18;
  v33 = v30;
  objc_copyWeak(&v37, &location);
  v20 = v8;
  v34 = v20;
  v29 = v10;
  v35 = v29;
  v36 = v43;
  v21 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v13, "setFetchShareParticipantsCompletionBlock:", v31));
  v22 = v19;
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v46 = v24;
    v47 = 2114;
    v48 = v26;
    v49 = 2112;
    v50 = v20;
    v51 = 2114;
    v52 = v27;
    _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKFetchShareParticipantsOperation for lookup info: %@ operationID: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v22, "container");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v13);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  _Block_object_dispose(v43, 8);
}

void sub_1CCDAC794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ____fetchParticipant_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Fetched share participant: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;

}

void ____fetchParticipant_block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2114;
      v37 = v10;
      v38 = 2114;
      v39 = v3;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareParticipantsOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v12 = WeakRetained;
    v13 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = ____fetchParticipant_block_invoke_11;
    v29[3] = &unk_1E89335A0;
    v30 = v13;
    v31 = *(id *)(a1 + 48);
    v32 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 56);
    v14 = objc_msgSend(v30, "retryCloudKitOperation:afterError:retryBlock:", v12, v3, v29);
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchShareParticipantsOperation will be retried", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v26;
        v36 = 2114;
        v37 = v28;
        v38 = 2114;
        v39 = v3;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchShareParticipantsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v3);
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
    }

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2114;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchShareParticipantsOperation succeeded with participants: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("finished"));
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

uint64_t ____fetchParticipant_block_invoke_11(_QWORD *a1)
{
  return __fetchParticipant(a1[4], a1[5], a1[6], a1[7]);
}

void sub_1CCDADA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDADB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDADC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDADDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDADF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDAE058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDAE568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDAE68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6021(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6022(uint64_t a1)
{

}

void sub_1CCDB16F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDB17BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __performCloudPull(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  os_unfair_lock_s *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  id v22;
  id v23;
  id v24;
  os_unfair_lock_s *v25;
  id v26;
  id v27;
  id v28;
  os_unfair_lock_s *v29;
  id v30;
  void *v31;
  os_unfair_lock_s *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  os_unfair_lock_s *v55;
  id v56;
  id v57;
  id *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id location;
  _QWORD v68[4];
  os_unfair_lock_s *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  os_unfair_lock_s *v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v51 = a3;
  v11 = a4;
  v49 = a5;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbModelID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v9 + 2);
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28540]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__performCloudPull");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v13, "initWithName:", v14);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", v51);
  -[os_unfair_lock_s operationConfigurationWithProcessingOptions:](v9, "operationConfigurationWithProcessingOptions:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConfiguration:", v19);

  objc_msgSend(v18, "setFetchAllChanges:", 1);
  v20 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = ____performCloudPull_block_invoke;
  v74[3] = &unk_1E8933880;
  v21 = v9;
  v75 = v21;
  v22 = v11;
  v76 = v22;
  v23 = v12;
  v77 = v23;
  v24 = v15;
  v78 = v24;
  objc_msgSend(v18, "setRecordZoneWithIDChangedBlock:", v74);
  v68[0] = v20;
  v68[1] = 3221225472;
  v68[2] = ____performCloudPull_block_invoke_11;
  v68[3] = &unk_1E89338A8;
  v25 = v21;
  v69 = v25;
  v26 = v22;
  v70 = v26;
  v53 = v23;
  v71 = v53;
  v27 = v16;
  v72 = v27;
  v28 = v17;
  v73 = v28;
  objc_msgSend(v18, "setRecordZoneWithIDWasDeletedBlock:", v68);
  objc_initWeak(&location, v18);
  v54[0] = v20;
  v54[1] = 3221225472;
  v54[2] = ____performCloudPull_block_invoke_12;
  v54[3] = &unk_1E89338F8;
  v29 = v25;
  v55 = v29;
  v50 = v26;
  v56 = v50;
  v30 = v10;
  v57 = v30;
  v39 = v49;
  v58 = v39;
  objc_copyWeak(&v66, &location);
  v52 = v51;
  v59 = v52;
  v42 = v24;
  v60 = v42;
  v40 = v47;
  v61 = v40;
  v41 = v45;
  v62 = v41;
  v44 = v43;
  v63 = v44;
  v46 = v27;
  v64 = v46;
  v48 = v28;
  v65 = v48;
  v31 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v18, "setFetchDatabaseChangesCompletionBlock:", v54));
  v32 = v29;
  HMFGetOSLogHandle();
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shortDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "hmbDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "operationID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v80 = v34;
    v81 = 2114;
    v82 = v36;
    v83 = 2112;
    v84 = v37;
    v85 = 2112;
    v86 = v52;
    v87 = 2114;
    v88 = v38;
    _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting CKFetchDatabaseChangesOperation with database: %@ token: %@ operationID: %{public}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(v53, "addOperation:", v18);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&location);

}

void sub_1CCDB1D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a37);
  _Unwind_Resume(a1);
}

void ____performCloudPull_block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMBCloudZoneID *v10;
  void *v11;
  HMBCloudZoneID *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID changed: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = [HMBCloudZoneID alloc];
  objc_msgSend(a1[4], "containerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v10, "initWithContainerID:scope:zoneID:", v11, objc_msgSend(a1[6], "scope"), v3);

  objc_msgSend(a1[7], "addObject:", v12);
}

void ____performCloudPull_block_invoke_11(id *a1, void *a2)
{
  HMBCloudZoneID *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMBCloudZoneID *v10;
  void *v11;
  HMBCloudZoneID *v12;
  os_unfair_lock_s *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  HMBCloudZoneID *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v7;
    v25 = 2114;
    v26 = v9;
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID was deleted: %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = [HMBCloudZoneID alloc];
  objc_msgSend(a1[4], "containerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v10, "initWithContainerID:scope:zoneID:", v11, objc_msgSend(a1[6], "scope"), v3);

  objc_msgSend(a1[7], "addObject:", v12);
  v13 = (os_unfair_lock_s *)((char *)a1[4] + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1[4], "zoneStateByZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmbModelID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v13);
  if (v16)
  {
    objc_msgSend(a1[8], "addObject:", v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2114;
      v26 = v22;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Got a zone deletion for a non-existent zone ID: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

void sub_1CCDB21F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____performCloudPull_block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  HMBCloudZoneStateModel *v39;
  void *v40;
  HMBCloudZoneStateModel *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  id WeakRetained;
  void *v69;
  int v70;
  void *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint8_t v98[128];
  uint8_t buf[4];
  id v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v83 = a2;
  v84 = a4;
  v6 = (void *)MEMORY[0x1D17B6230]();
  v86 = a1;
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v100 = v9;
    v101 = 2114;
    v102 = v11;
    v103 = 2112;
    v104 = v83;
    v105 = 2112;
    v106 = v12;
    v107 = 2114;
    v108 = v84;
    _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetch database changes operation completed with token: %@ moreComing: %@ error: %{public}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v6);
  if (v84)
  {
    v13 = (void *)MEMORY[0x1D17B6230]();
    v14 = *(id *)(v86 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v86 + 40), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v100 = v16;
      v101 = 2114;
      v102 = v18;
      v103 = 2114;
      v104 = v84;
      _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    if (objc_msgSend(v84, "hmbIsCKChangeTokenExpiredError"))
    {
      v19 = (void *)MEMORY[0x1D17B6230]();
      v20 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v86 + 40), "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v100 = v22;
        v101 = 2114;
        v102 = v24;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Retrying CKFetchDatabaseChangesOperation with nil change token due to expired change token error", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      __performCloudPull(*(_QWORD *)(v86 + 32), *(_QWORD *)(v86 + 48), 0, *(_QWORD *)(v86 + 40), *(_QWORD *)(v86 + 56));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(v86 + 120));
      if (!WeakRetained)
      {
        _HMFPreconditionFailure();
        __break(1u);
      }
      v69 = *(void **)(v86 + 32);
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = ____performCloudPull_block_invoke_14;
      v91[3] = &unk_1E89338D0;
      v92 = v69;
      v93 = *(id *)(v86 + 48);
      v94 = *(id *)(v86 + 64);
      v95 = *(id *)(v86 + 40);
      v96 = *(id *)(v86 + 56);
      v70 = objc_msgSend(v92, "retryCloudKitOperation:afterError:retryBlock:", WeakRetained, v84, v91);
      v71 = (void *)MEMORY[0x1D17B6230]();
      v72 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v70)
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v86 + 40), "identifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "shortDescription");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v100 = v75;
          v101 = 2114;
          v102 = v77;
          _os_log_impl(&dword_1CCD48000, v74, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation will be retried", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v71);
        objc_msgSend(*(id *)(v86 + 40), "markWithReason:", CFSTR("deferred"));
      }
      else
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v86 + 40), "identifier");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "shortDescription");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v100 = v78;
          v101 = 2114;
          v102 = v80;
          v103 = 2114;
          v104 = v84;
          _os_log_impl(&dword_1CCD48000, v74, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation failed and cannot be retried: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v71);
        objc_msgSend(*(id *)(v86 + 40), "markWithFormat:", CFSTR("failed with error: %@"), v84);
        objc_msgSend(*(id *)(v86 + 56), "finishWithError:", v84);
      }

    }
  }
  else
  {
    v25 = v86;
    lock = (os_unfair_lock_s *)(*(_QWORD *)(v86 + 32) + 8);
    os_unfair_lock_lock_with_options();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v26 = (void *)objc_msgSend(*(id *)(v86 + 72), "copy");
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v27)
    {
      v85 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v88 != v85)
            objc_enumerationMutation(v26);
          v29 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          objc_msgSend(*(id *)(v25 + 32), "zoneStateByZoneID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31 == 0;

          if (v32)
          {
            v33 = (void *)MEMORY[0x1D17B6230]();
            v34 = *(id *)(v86 + 32);
            HMFGetOSLogHandle();
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v36 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v86 + 40), "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "shortDescription");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v36;
              v101 = 2114;
              v102 = v38;
              v103 = 2112;
              v104 = v29;
              _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Zone with ID was created: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v33);
            v39 = [HMBCloudZoneStateModel alloc];
            objc_msgSend(v29, "modelID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[HMBCloudZoneStateModel initWithModelID:parentModelID:](v39, "initWithModelID:parentModelID:", v40, *(_QWORD *)(v86 + 80));

            -[HMBCloudZoneStateModel setZoneID:](v41, "setZoneID:", v29);
            objc_msgSend(*(id *)(v86 + 88), "addObject:", v29);
            objc_msgSend(*(id *)(v86 + 32), "zoneStateByZoneID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v29);

            objc_msgSend(*(id *)(v86 + 96), "addObject:", v41);
            objc_msgSend(*(id *)(v86 + 72), "removeObject:", v29);

          }
          v25 = v86;
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      }
      while (v27);
    }

    objc_msgSend(*(id *)(v86 + 32), "stateZone");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "update:", *(_QWORD *)(v86 + 96));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x1D17B6230]();
      v46 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v86 + 40), "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "shortDescription");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(void **)(v86 + 96);
        *(_DWORD *)buf = 138544130;
        v100 = v48;
        v101 = 2114;
        v102 = v50;
        v103 = 2112;
        v104 = v51;
        v105 = 2114;
        v106 = v44;
        _os_log_impl(&dword_1CCD48000, v47, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add created zone models to local DB %@: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v45);
    }

    os_unfair_lock_unlock(lock);
    objc_msgSend(*(id *)(v86 + 32), "handleRemovedZoneIDs:userInitiated:", *(_QWORD *)(v86 + 104), 0);
    objc_msgSend(*(id *)(v86 + 32), "handleUpdatedZonesIDs:", *(_QWORD *)(v86 + 72));
    objc_msgSend(*(id *)(v86 + 32), "handleCreatedZoneIDs:", *(_QWORD *)(v86 + 88));
    locka = (os_unfair_lock_s *)(*(_QWORD *)(v86 + 32) + 8);
    os_unfair_lock_lock_with_options();
    if (v83)
      objc_msgSend(*(id *)(v86 + 48), "setServerChangeToken:");
    objc_msgSend(*(id *)(v86 + 32), "stateZone");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = *(_QWORD *)(v86 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "update:remove:", v53, *(_QWORD *)(v86 + 112));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = (void *)MEMORY[0x1D17B6230]();
      v56 = *(id *)(v86 + 32);
      HMFGetOSLogHandle();
      v57 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v86 + 40), "identifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "shortDescription");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = *(void **)(v86 + 112);
        *(_DWORD *)buf = 138544130;
        v100 = v58;
        v101 = 2114;
        v102 = v60;
        v103 = 2112;
        v104 = v61;
        v105 = 2114;
        v106 = v54;
        _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove zone model IDs from local DB %@: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v55);
    }

    os_unfair_lock_unlock(locka);
    v62 = (void *)MEMORY[0x1D17B6230]();
    v63 = *(id *)(v86 + 32);
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v86 + 40), "identifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "shortDescription");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = v65;
      v101 = 2114;
      v102 = v67;
      _os_log_impl(&dword_1CCD48000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKFetchDatabaseChangesOperation succeeded", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v62);
    objc_msgSend(*(id *)(v86 + 56), "finishWithNoResult");
  }

}

void sub_1CCDB2DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

uint64_t ____performCloudPull_block_invoke_14(_QWORD *a1)
{
  return __performCloudPull(a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void sub_1CCDB4D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB4E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __execSQLite3(void *a1, sqlite3_stmt *a2, _QWORD *a3)
{
  id v5;
  int v6;
  uint64_t v7;

  v5 = a1;
  if (sqlite3_step(a2) != 101)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a2);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_reset(a2);
LABEL_8:
    v7 = 0;
    goto LABEL_10;
  }
  v6 = sqlite3_changes((sqlite3 *)objc_msgSend(v5, "context"));
  if (!sqlite3_reset(a2))
  {
    v7 = v6;
    goto LABEL_10;
  }
  if (!a3)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a2);
  v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

id __removeExtraWhitespace(const char *a1)
{
  void *v2;
  char v3;
  BOOL v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", strlen(a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *a1;
  if (*a1)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)(a1 + 1);
    v6 = MEMORY[0x1E0C80978];
    do
    {
      v7 = v3;
      if (v3 < 0)
        v8 = __maskrune(v3, 0x4000uLL);
      else
        v8 = *(_DWORD *)(v6 + 4 * v7 + 60) & 0x4000;
      v9 = v8 != 0;
      if (v8)
      {
        if (!v4)
          objc_msgSend(v2, "appendString:", CFSTR(" "));
      }
      else
      {
        objc_msgSend(v2, "appendFormat:", CFSTR("%c"), v7);
      }
      v10 = *v5++;
      v3 = v10;
      v4 = v9;
    }
    while (v10);
  }
  return v2;
}

uint64_t __Block_byref_object_copy__6527(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6528(uint64_t a1)
{

}

id selectSQLite3(sqlite3 *a1, const char *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  unsigned int v15;
  unint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  id v21;
  char isKindOfClass;
  void *v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  id v59;
  void *v60;
  sqlite3_stmt *ppStmt;
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  __removeExtraWhitespace(a2);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  ppStmt = 0;
  if (*a4)
    goto LABEL_50;
  if (sqlite3_prepare_v2(a1, v9, -1, &ppStmt, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:statement:", a1, v9);
    v11 = 0;
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  v60 = v10;
  v13 = sqlite3_bind_parameter_count(ppStmt);
  if (v13 >= 2)
  {
    v14 = v13;
    v15 = 1;
    v16 = 0x1E0CB3000uLL;
    v56 = *MEMORY[0x1E0D27FC8];
    while (1)
    {
      if (*a4)
      {
LABEL_47:
        v11 = 0;
LABEL_49:
        v12 = 0;
        v10 = v60;
        goto LABEL_50;
      }
      v17 = sqlite3_bind_parameter_name(ppStmt, v15);
      if (!v17)
      {
        v43 = (void *)MEMORY[0x1E0CB35C8];
        v67[0] = &unk_1E89477D8;
        v66[0] = CFSTR("extcode");
        v66[1] = CFSTR("text");
        objc_msgSend(*(id *)(v16 + 2368), "stringWithFormat:", CFSTR("statement cannot contain nameless parameters (%ld is nameless)"), v15);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v44;
        v66[2] = CFSTR("statement");
        objc_msgSend(*(id *)(v16 + 2368), "stringWithUTF8String:", v9);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v67[2] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorWithDomain:code:userInfo:", v56, 3, v46);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_47;
      }
      v18 = v17;
      objc_msgSend(*(id *)(v16 + 2368), "stringWithUTF8String:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
      }
      sqlite3_bind_null(ppStmt, v15);
LABEL_24:

      if (v14 == ++v15)
        goto LABEL_32;
    }
    v21 = v20;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v23 = v21;
    else
      v23 = 0;
    v59 = v23;

    if ((isKindOfClass & 1) != 0)
    {
      hmbBindDataSQLite3(ppStmt, v15, v21, a4);
    }
    else
    {
      v24 = v21;
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();
      if ((v25 & 1) != 0)
        v26 = v24;
      else
        v26 = 0;
      v27 = v26;

      if ((v25 & 1) != 0)
      {
        hmbBindStringSQLite3(ppStmt, v15, v24, a4);
        goto LABEL_22;
      }
      v57 = v9;
      v28 = v24;
      objc_opt_class();
      v29 = objc_opt_isKindOfClass();
      if ((v29 & 1) != 0)
        v30 = v28;
      else
        v30 = 0;
      v31 = v30;

      if ((v29 & 1) != 0)
      {
        hmbBindIntSQLite3(ppStmt, v15, objc_msgSend(v28, "longLongValue"), a4);
        v24 = 0;
        v9 = v57;
        goto LABEL_23;
      }
      v54 = (void *)MEMORY[0x1E0CB35C8];
      v65[0] = &unk_1E89477D8;
      v64[0] = CFSTR("extcode");
      v64[1] = CFSTR("text");
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("bind parameter %s is not of a recognized type %@ is not a (NSNull, NSData, NSString, or NSNumber)"), v18, v55);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v53;
      v64[2] = CFSTR("statement");
      v9 = v57;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v57);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "errorWithDomain:code:userInfo:", v56, 3, v35);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
LABEL_22:
    v28 = 0;
LABEL_23:

    v16 = 0x1E0CB3000;
    goto LABEL_24;
  }
LABEL_32:
  v10 = v60;
  if (*a4)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v58 = v9;
    v36 = 0;
    v37 = sqlite3_column_count(ppStmt);
    while (1)
    {
      v38 = sqlite3_step(ppStmt);
      if (v38 != 100)
        break;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v37);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)v37 >= 1)
      {
        v39 = 0;
        do
        {
          v40 = sqlite3_column_type(ppStmt, v39);
          switch(v40)
          {
            case 1:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(ppStmt, v39));
              v41 = objc_claimAutoreleasedReturnValue();
              break;
            case 2:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(ppStmt, v39));
              v41 = objc_claimAutoreleasedReturnValue();
              break;
            case 3:
              objc_msgSend(MEMORY[0x1E0CB3940], "hmbStringWithSQLite3Column:column:", ppStmt, v39);
              v41 = objc_claimAutoreleasedReturnValue();
              break;
            case 4:
              objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", ppStmt, v39);
              v41 = objc_claimAutoreleasedReturnValue();
              break;
            case 5:
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v41 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              v47 = (void *)MEMORY[0x1E0CB35C8];
              v48 = *MEMORY[0x1E0D27FC8];
              v63[0] = &unk_1E89477D8;
              v62[0] = CFSTR("extcode");
              v62[1] = CFSTR("text");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("column %ld is of SQLite3 type %ld (not recognized)"), v39, v40);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v63[1] = v49;
              v62[2] = CFSTR("statement");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v58);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v63[2] = v50;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 3, v51);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_49;
          }
          v42 = (void *)v41;
          objc_msgSend(v11, "addObject:", v41);

          v39 = (v39 + 1);
        }
        while ((_DWORD)v37 != (_DWORD)v39);
      }
      v10 = v60;
      objc_msgSend(v60, "addObject:", v11);
      v36 = v11;
    }
    if (v38 != 101)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", ppStmt);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_finalize(ppStmt);
    if (*a4)
      v12 = 0;
    else
      v12 = v10;
    v11 = v36;
  }
LABEL_50:

  return v12;
}

void hmbBindDataSQLite3(sqlite3_stmt *a1, int a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  id v12;

  v7 = a3;
  v8 = v7;
  if (!*a4)
  {
    v12 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "length"))
      {
        if (objc_msgSend(v12, "length"))
        {
          v9 = objc_retainAutorelease(v12);
          v10 = sqlite3_bind_blob64(a1, a2, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0);
        }
        else
        {
          v10 = sqlite3_bind_zeroblob(a1, a2, 0);
        }
      }
      else
      {
        v10 = sqlite3_bind_zeroblob64(a1, a2, 0);
      }
    }
    else
    {
      v10 = sqlite3_bind_null(a1, a2);
    }
    v8 = v12;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      *a4 = v11;
    }
  }

}

void hmbBindStringSQLite3(sqlite3_stmt *a1, int a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v7 = a3;
  v8 = v7;
  if (!*a4)
  {
    v11 = v7;
    if (v7)
      v9 = sqlite3_bind_text(a1, a2, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, 0);
    else
      v9 = sqlite3_bind_null(a1, a2);
    v8 = v11;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      *a4 = v10;
    }
  }

}

sqlite3_stmt *hmbBindIntSQLite3(sqlite3_stmt *result, int a2, sqlite3_int64 a3, _QWORD *a4)
{
  sqlite3_stmt *v5;

  if (!*a4)
  {
    v5 = result;
    result = (sqlite3_stmt *)sqlite3_bind_int64(result, a2, a3);
    if ((_DWORD)result)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", v5);
      result = (sqlite3_stmt *)(id)objc_claimAutoreleasedReturnValue();
      *a4 = result;
    }
  }
  return result;
}

sqlite3_stmt *prepareSQLite3(sqlite3 *a1, const char *a2, _QWORD *a3)
{
  id v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  __removeExtraWhitespace(a2);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (sqlite3_prepare_v2(a1, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:statement:", a1, a2);
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = ppStmt;
  }

  return v7;
}

void sub_1CCDB67A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);
  _Unwind_Resume(a1);
}

void sub_1CCDB6E38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);
  _Unwind_Resume(a1);
}

uint64_t __open(void *a1, _QWORD *a2)
{
  id v3;
  sqlite3 *v4;
  id v5;
  id v6;
  sqlite3 *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  sqlite3 *v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v63 = 0;
  v4 = __sqlite3Open(v3, 0, &v63);
  v5 = v63;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v3, "setContext:", v4);
    v7 = (sqlite3 *)objc_msgSend(v3, "context");
    v62 = v6;
    selectSQLite3(v7, "PRAGMA user_version;", MEMORY[0x1E0C9AA70], &v62);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v62;

    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = v3;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v17;
      v66 = 2112;
      v67 = v13;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v61 = v9;
    v18 = objc_msgSend(v15, "migrateFromSchemaVersion:error:", objc_msgSend(v13, "integerValue"), &v61);
    v6 = v61;

    if (v18 == 2)
    {
      v38 = (void *)MEMORY[0x1D17B6230]();
      v39 = v15;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v41;
        v66 = 2112;
        v67 = v39;
        _os_log_impl(&dword_1CCD48000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Migration needs reopen for context %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      sqlite3_close(v4);
    }
    else
    {
      if (v18 != 1)
      {
        if (v18)
        {
          v23 = 1;
        }
        else
        {
          v19 = (void *)MEMORY[0x1D17B6230]();
          v20 = v15;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v65 = v22;
            v66 = 2112;
            v67 = v20;
            v68 = 2114;
            v69 = v6;
            _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Migration failed for context %@: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v19);
          v23 = 0;
          if (a2)
            *a2 = objc_retainAutorelease(v6);
        }
        goto LABEL_37;
      }
      v42 = (void *)MEMORY[0x1D17B6230]();
      v39 = v15;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v44;
        v66 = 2112;
        v67 = v39;
        _os_log_impl(&dword_1CCD48000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Migration needs re-init for context %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v42);
      sqlite3_close(v4);
      objc_msgSend(v39, "url");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      __clean(v45);

    }
    v23 = __open(v39, a2);
LABEL_37:

    goto LABEL_38;
  }
  objc_msgSend(v5, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmf_numberForKey:", CFSTR("extcode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "integerValue");

  if (v26 != 14)
  {
    if (a2)
    {
LABEL_36:
      v6 = objc_retainAutorelease(v6);
      v23 = 0;
      *a2 = v6;
      goto LABEL_38;
    }
LABEL_49:
    v23 = 0;
    goto LABEL_38;
  }

  v60 = 0;
  v27 = __sqlite3Open(v3, 1, &v60);
  v28 = v60;
  objc_msgSend(v3, "url");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scheme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("memory"));

  if ((v31 & 1) == 0)
  {
    v59 = v28;
    selectSQLite3(v27, "PRAGMA journal_mode=WAL;", MEMORY[0x1E0C9AA70], &v59);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v59;

    if (v32)
    {
      v33 = (void *)MEMORY[0x1D17B6230]();
      v34 = v3;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v36;
        v66 = 2112;
        v67 = v34;
        _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Re-opening newly created database after successfully turning on WAL for context: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      sqlite3_close(v27);
      v58 = v6;
      v27 = __sqlite3Open(v34, 0, &v58);
      v28 = v58;

      if (v27)
      {

        goto LABEL_21;
      }
      if (a2)
        *a2 = objc_retainAutorelease(v28);
      v51 = (void *)MEMORY[0x1D17B6230]();
      v55 = v34;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v56;
        v66 = 2112;
        v67 = v55;
        v68 = 2114;
        v69 = v28;
        _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed re-open of WAL-enabled context %@: %{public}@", buf, 0x20u);

      }
      v6 = v28;
    }
    else
    {
      if (a2)
        *a2 = objc_retainAutorelease(v6);
      v51 = (void *)MEMORY[0x1D17B6230]();
      v52 = v3;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v54;
        v66 = 2112;
        v67 = v52;
        v68 = 2114;
        v69 = v6;
        _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to turn on WAL for context %@: %{public}@", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v51);
    goto LABEL_49;
  }
LABEL_21:
  objc_msgSend(v3, "setContext:", v27);
  v57 = v28;
  v37 = objc_msgSend(v3, "initializeNewlyCreatedDatabaseWithError:", &v57);
  v6 = v57;

  if ((v37 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1D17B6230]();
    v47 = v3;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v49;
      v66 = 2112;
      v67 = v47;
      v68 = 2112;
      v69 = v6;
      _os_log_impl(&dword_1CCD48000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize newly created database for context %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v46);
    if (a2)
      goto LABEL_36;
    goto LABEL_49;
  }
  v23 = 1;
LABEL_38:

  return v23;
}

sqlite3 *__sqlite3Open(void *a1, int a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  sqlite3 *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  sqlite3 *v32;
  NSObject *v33;
  void *v34;
  sqlite3 *v35;
  id v36;
  sqlite3 *v37;
  sqlite3 *ppDb;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  sqlite3 *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if (a2)
    v7 = 6;
  else
    v7 = 2;
  ppDb = 0;
  objc_msgSend(v5, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("memory"));

  if (v10)
  {
    if ((a2 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1D17B6230]();
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to open memory database with create == NO", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      if (a3)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v48 = CFSTR("extcode");
        v49[0] = &unk_1E89477F0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "hmfErrorWithCode:userInfo:", 3, v30);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_25;
    }
    v11 = ":memory:";
  }
  else
  {
    objc_msgSend(v6, "url");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

  }
  v13 = sqlite3_open_v2(v11, &ppDb, v7, 0);
  if ((_DWORD)v13)
  {
    v14 = v13;
    if ((_DWORD)v13 == 14 && (a2 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17B6230]();
      v36 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = ppDb;
      objc_msgSend(v36, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Status:", 14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v18;
      v42 = 2048;
      v43 = v37;
      v44 = 2112;
      v45 = v20;
      v46 = 2114;
      v47 = v21;
      v22 = "%{public}@Can't open context %p without creating because no database exists already at %@: %{public}@";
      v23 = v17;
      v24 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B6230]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = ppDb;
      objc_msgSend(v16, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Status:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v18;
      v42 = 2048;
      v43 = v19;
      v44 = 2112;
      v45 = v20;
      v46 = 2114;
      v47 = v21;
      v22 = "%{public}@Failed to open context %p at %@: %{public}@";
      v23 = v17;
      v24 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1CCD48000, v23, v24, v22, buf, 0x2Au);

LABEL_23:
    objc_autoreleasePoolPop(v15);
    sqlite3_close(ppDb);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Status:", v14);
      v35 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_25:
    v35 = 0;
    goto LABEL_26;
  }
  v31 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v6, "setContext:", ppDb));
  v32 = v6;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    v42 = 2112;
    v43 = v32;
    _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully opened context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  v35 = ppDb;
LABEL_26:

  return v35;
}

void __clean(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _QWORD v44[3];
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, &v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v43;
  v32 = v3;
  if (v5)
  {
    v26 = v4;
    v27 = v1;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v25 = v5;
    obj = v5;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v40;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(obj);
          v31 = v7;
          v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v44[0] = &stru_1E8935680;
          v44[1] = CFSTR("-shm");
          v44[2] = CFSTR("-wal");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v36 != v12)
                  objc_enumerationMutation(v33);
                objc_msgSend(v3, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v9, "isEqualToString:", v14);

                if (v15)
                {
                  v34 = v6;
                  v16 = objc_msgSend(v2, "removeItemAtURL:error:", v8, &v34);
                  v17 = v34;

                  if ((v16 & 1) == 0)
                  {
                    v18 = (void *)MEMORY[0x1D17B6230]();
                    HMFGetOSLogHandle();
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v20 = v2;
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v48 = v21;
                      v49 = 2112;
                      v50 = v8;
                      v51 = 2112;
                      v52 = v17;
                      _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@unable to remove %@: %@", buf, 0x20u);

                      v2 = v20;
                      v3 = v32;
                    }

                    objc_autoreleasePoolPop(v18);
                  }
                  v6 = v17;
                }
              }
              v11 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v11);
          }

          v7 = v31 + 1;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v30);
    }

    v4 = v26;
    v1 = v27;
    v5 = v25;
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v24;
      v49 = 2112;
      v50 = v4;
      v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);

      v3 = v32;
    }

    objc_autoreleasePoolPop(v22);
  }

}

void hmbBindUUIDSQLite3(sqlite3_stmt *a1, int a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!*a4)
  {
    if (!v7)
    {
      if (!sqlite3_bind_null(a1, a2))
        goto LABEL_5;
      goto LABEL_4;
    }
    v9[0] = 0;
    v9[1] = 0;
    objc_msgSend(v7, "getUUIDBytes:", v9);
    if (sqlite3_bind_blob64(a1, a2, v9, 0x10uLL, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_5:

}

void hmbBindIntNumberSQLite3(sqlite3_stmt *a1, int a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v7 = a3;
  v8 = v7;
  if (!*a4)
  {
    v11 = v7;
    if (v7)
      v9 = sqlite3_bind_int64(a1, a2, objc_msgSend(v7, "unsignedIntegerValue"));
    else
      v9 = sqlite3_bind_null(a1, a2);
    v8 = v11;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Statement:", a1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      *a4 = v10;
    }
  }

}

void sub_1CCDB8F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB90E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB921C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB9354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB97C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6732(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6733(uint64_t a1)
{

}

void sub_1CCDB9E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDB9F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDBA068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDBA1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __modelsFromRecords(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D17B6230]();
        v21 = v14;
        objc_msgSend(v6, "modelFromRecord:storageLocation:error:", v15, 2, &v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v21;

        if (v17)
        {
          if (!a3 || (objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v20, "addObject:", v17);
        }
        else if (!objc_msgSend(v11, "isHMFError") || objc_msgSend(v11, "code") != 2)
        {

          objc_autoreleasePoolPop(v16);
          goto LABEL_16;
        }

        objc_autoreleasePoolPop(v16);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  if (!v20)
  {
LABEL_16:
    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v20 = 0;
      *a4 = v11;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

void sub_1CCDBD1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDBD6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDBE8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __execAndSetError(void *a1, sqlite3_stmt *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(v7, "execSQLite3:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v9 = v8;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = v7;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v13;
    v17 = 2080;
    v18 = sqlite3_sql(a2);
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_INFO, "%{public}@ignoring exec due to previous error %s: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (a4)
  {
LABEL_7:
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_9:

  return v9 == 0;
}

uint64_t __Block_byref_object_copy__6904(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6905(uint64_t a1)
{

}

uint64_t __execRowAndSetError(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v18 = 0;
    v10 = objc_msgSend(v7, "insertSQLite3:error:", a2, &v18);
    v11 = v18;
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1D17B6230]();
      v14 = v7;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error executing statement: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      if (a4)
      {
        if (v11)
        {
          *a4 = objc_retainAutorelease(v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a4 = v17;

        }
      }
    }

  }
  return v10;
}

void sub_1CCDC1104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDC123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDC1344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CCDC147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7150(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7151(uint64_t a1)
{

}

__CFString *HMBStringFromLoggingVisibility(unint64_t a1)
{
  if (a1 < 4)
    return off_1E8933E10[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<UNKNOWN %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1CCDC49F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC4E60(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC501C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC56A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC5868(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __unregisterSubscriptionForSubscriptionID(void *a1, void *a2, void *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_unfair_lock_s *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  os_unfair_lock_s *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  -[os_unfair_lock_s initialCloudSyncFuture](v5, "initialCloudSyncFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFinished");

  if ((v9 & 1) == 0)
    _HMFPreconditionFailure();
  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(v5 + 2);
  v11 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke;
  v27[3] = &unk_1E8933F40;
  v12 = v6;
  v28 = v12;
  if ((objc_msgSend(v10, "na_any:", v27) & 1) != 0)
  {
    objc_msgSend(v7, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:](v5, "pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:", v13, MEMORY[0x1E0C9AA60], v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke_43;
    v22[3] = &unk_1E8933EA0;
    v23 = v5;
    v24 = v7;
    v25 = v10;
    v26 = v12;
    objc_msgSend(v15, "addSuccessBlock:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = v5;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v20;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Not unregistering database subscription ID %@ because it is not in our list of existing database subscription: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void sub_1CCDC5BC4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ____unregisterSubscriptionForSubscriptionID_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "subscriptionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void ____unregisterSubscriptionForSubscriptionID_block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ____unregisterSubscriptionForSubscriptionID_block_invoke_2;
  v14[3] = &unk_1E8933F40;
  v5 = *(void **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v5, "na_filter:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubscriptions:", v6);

  objc_msgSend(*(id *)(a1 + 32), "stateZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "update:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

  os_unfair_lock_unlock(v4);
}

void sub_1CCDC5E0C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ____unregisterSubscriptionForSubscriptionID_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "subscriptionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void sub_1CCDC6344(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC6650(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __modifySubscriptions(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *context;
  id v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id location;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v34 = a2;
  v12 = a3;
  v37 = a4;
  v13 = a5;
  v35 = a6;
  v36 = v12;
  if (objc_msgSend(v12, "count") || objc_msgSend(v37, "count"))
  {
    if (!v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0D28540]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__modifySubscriptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v14, "initWithName:", v15);

    }
    v16 = objc_alloc_init(MEMORY[0x1E0C94F28]);
    objc_msgSend(v11, "operationConfigurationWithProcessingOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConfiguration:", v17);

    objc_msgSend(v16, "setSubscriptionsToSave:", v12);
    objc_msgSend(v16, "setSubscriptionIDsToDelete:", v37);
    objc_initWeak(&location, v16);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = ____modifySubscriptions_block_invoke;
    v38[3] = &unk_1E8933F90;
    v18 = v11;
    v39 = v18;
    v13 = v13;
    v40 = v13;
    objc_copyWeak(&v45, &location);
    v32 = v34;
    v41 = v32;
    v19 = v12;
    v42 = v19;
    v20 = v37;
    v43 = v20;
    v44 = v35;
    context = (void *)MEMORY[0x1D17B6230](objc_msgSend(v16, "setModifySubscriptionsCompletionBlock:", v38));
    v21 = v18;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v31 = v11;
      HMFGetLogIdentifier();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "operationID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v48 = v23;
      v49 = 2114;
      v50 = v25;
      v51 = 2112;
      v52 = v19;
      v53 = 2112;
      v54 = v20;
      v55 = 2114;
      v56 = v26;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting CKModifySubscriptionsOperation with subscriptionsToSave: %@ subscriptionIDsToRemove: %@ operationID: %{public}@", buf, 0x34u);

      v11 = v31;
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(v32, "addOperation:", v16);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17B6230]();
    v28 = v11;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Skipping subscription modify for empty save and remove lists", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(v35, "finishWithNoResult");
  }

}

void sub_1CCDC6AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void ____modifySubscriptions_block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = a1[4];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v14;
      v49 = 2114;
      v50 = v16;
      v51 = 2114;
      v52 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] CKModifySubscriptionsOperation failed: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    if (!WeakRetained)
      _HMFPreconditionFailure();
    v18 = WeakRetained;
    v19 = a1[4];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = ____modifySubscriptions_block_invoke_34;
    v40[3] = &unk_1E8933F68;
    v41 = v19;
    v42 = a1[6];
    v43 = a1[7];
    v44 = a1[8];
    v45 = a1[5];
    v46 = a1[9];
    v20 = objc_msgSend(v41, "retryCloudKitOperation:afterError:retryBlock:", v18, v9, v40);
    v21 = (void *)MEMORY[0x1D17B6230]();
    v22 = a1[4];
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shortDescription");
        v38 = v8;
        v27 = v7;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v25;
        v49 = 2114;
        v50 = v28;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifySubscriptionsOperation will be retried", buf, 0x16u);

        v7 = v27;
        v8 = v38;

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(a1[5], "markWithReason:", CFSTR("deferred"));
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v8;
        v34 = v7;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "shortDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v35;
        v49 = 2114;
        v50 = v37;
        v51 = 2114;
        v52 = v9;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] CKModifySubscriptionsOperation failed and cannot be retried: %{public}@", buf, 0x20u);

        v7 = v34;
        v8 = v39;
      }

      objc_autoreleasePoolPop(v21);
      objc_msgSend(a1[5], "markWithFormat:", CFSTR("failed with error: %@"), v9);
      objc_msgSend(a1[9], "finishWithError:", v9);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = v8;
      v30 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      v49 = 2114;
      v50 = v33;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] CKModifySubscriptionsOperation succeeded", buf, 0x16u);

      v7 = v30;
      v8 = v29;
    }

    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[5], "markWithReason:", CFSTR("succeeded"));
    objc_msgSend(a1[9], "finishWithNoResult");
  }

}

uint64_t ____modifySubscriptions_block_invoke_34(_QWORD *a1)
{
  return __modifySubscriptions(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

void sub_1CCDC72A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CCDC7C20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1E0C946F0]();
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1E0C94778]();
}

uint64_t CKStringFromParticipantPermission()
{
  return MEMORY[0x1E0C94AD8]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1E0D1AD88]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1E0D27E00]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1E0D27E08]();
}

uint64_t HMFDispatchQueueName()
{
  return MEMORY[0x1E0D27E28]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1E0D27FC0]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1E0D27FD0]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1E0D27FD8]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1E0D1B4C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1E0D1B4D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1E0D28700]();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return MEMORY[0x1E0D28708]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1E0D28710]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1E0DE92C8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE85B8](a1);
}

const char *__cdecl sqlite3_bind_parameter_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE85C8](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x1E0DE85F8](a1, *(_QWORD *)&a2, *(_QWORD *)&n);
}

int sqlite3_bind_zeroblob64(sqlite3_stmt *a1, int a2, sqlite3_uint64 a3)
{
  return MEMORY[0x1E0DE8600](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x1E0DE8748](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1E0DE87E0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1E0DE87F8]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

