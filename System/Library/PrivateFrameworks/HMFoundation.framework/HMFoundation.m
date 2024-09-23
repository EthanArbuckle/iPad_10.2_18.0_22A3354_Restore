void sub_19B548BA0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    v18 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v17;
      _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_ERROR, "%{public}@Exception while searching list (%@)", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);

    objc_end_catch();
    JUMPOUT(0x19B548B38);
  }
  _Unwind_Resume(a1);
}

void sub_19B54A9DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54B0C0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54B298(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    objc_msgSend(v1, "end");
  _Unwind_Resume(exception_object);
}

void sub_19B54B380(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54BC9C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54BD68(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMFEqualObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;

  v3 = a1;
  v4 = a2;
  if (v3 == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v3;
      v6 = v4;
      v7 = v6;
      v8 = 0;
      if (v5 && v6)
      {
        if (CFNumberIsFloatType((CFNumberRef)v5) || CFNumberIsFloatType((CFNumberRef)v7))
        {
          objc_msgSend(v5, "floatValue");
          v10 = v9;
          objc_msgSend(v7, "floatValue");
          v8 = vabds_f32(v10, v11) < 0.00000011921;
        }
        else
        {
          v8 = objc_msgSend(v5, "isEqualToNumber:", v7);
        }
      }

    }
    else
    {
      v8 = objc_msgSend(v3, "isEqual:", v4);
    }
  }

  return v8;
}

__CFString *HMFBooleanToString(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

void __HMFActivityInvalidate(void *a1)
{
  _QWORD *v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  os_signpost_id_t v17;
  _BYTE buf[22];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  HMFGetOSLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_enabled(v2);

  if (v3)
  {
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v5 = (void *)v1[7];
    v6 = v1;
    objc_msgSend(v5, "getUUIDBytes:", buf);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", buf, 16, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "getBytes:range:", &v17, objc_msgSend(v7, "length") - 8, 8);
    v8 = v17;
    if (os_signpost_enabled(v4))
    {
      if (v8 + 1 >= 2)
        v9 = v8;
      else
        v9 = 0xEEEEB0B5B2B2EEEELL;
      v10 = v6[7];
      v11 = v6[9];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_signpost_emit_with_name_impl(&dword_19B546000, v4, OS_SIGNPOST_INTERVAL_END, v9, "HMFActivity", "Identifier = %@, Name = %@", buf, 0x16u);
    }

  }
  v12 = (void *)MEMORY[0x1A1AC355C]();
  v13 = v1[1];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____HMFActivityInvalidate_block_invoke;
  v15[3] = &unk_1E3B37AF8;
  v14 = v1;
  v16 = v14;
  os_activity_apply(v13, v15);

  objc_autoreleasePoolPop(v12);
  __HMFActivityEnd(v14);

}

void sub_19B54C7E8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __NSUUIDCreateUUIDVersion5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  _BYTE v23[128];
  _QWORD data[3];

  data[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  memset(&c, 0, sizeof(c));
  data[0] = 0;
  data[1] = 0;
  objc_msgSend(a2, "getUUIDBytes:", data);
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, data, 0x10u);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_retainAutorelease(v14);
          CC_SHA1_Update(&c, (const void *)objc_msgSend(v15, "UTF8String", (_QWORD)v17), objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  if (v7)
  {
    v16 = objc_retainAutorelease(v7);
    CC_SHA1_Update(&c, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
  }
  CC_SHA1_Final(md, &c);
  *(_OWORD *)a1 = *(_OWORD *)md;
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a1 + 6) & 0xF | 0x50;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 8) & 0x3F | 0x80;

}

void sub_19B54CBB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54CF54(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMFActivityBegin(void *a1)
{
  _BYTE *v1;
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1[48])
  {
    v20 = 0;
    __HMFActivityGetCurrentThreadContext(v1, &v20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = v2;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Beginning activity in context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    if (!v20)
    {
      if (v5[2])
      {
        v8 = (void *)MEMORY[0x1A1AC355C]();
        v9 = v5;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v9[2];
          *(_DWORD *)buf = 138543618;
          v22 = v11;
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Adopting voucher: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        v13 = v9[2];
        v14 = (void *)voucher_adopt();
        objc_msgSend(v3, "setVoucher:", v14);

        objc_msgSend(v3, "setShouldRestoreVoucher:", 1);
      }
      objc_msgSend(v5[3], "addObject:", v3);
    }
    objc_msgSend(v3, "setCount:", objc_msgSend(v3, "count") + 1);

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC355C]();
    v16 = v2;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)v16[9];
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_ERROR, "%{public}@Beginning an invalidated activity is prohibited: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

id HMFGetDefaultOSLogHandle()
{
  if (_MergedGlobals_66 != -1)
    dispatch_once(&_MergedGlobals_66, &__block_literal_global_33);
  return (id)qword_1ED0131B8;
}

void __HMFActivityEnd(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0;
  __HMFActivityGetCurrentThreadContext(v1, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v3 = (void *)MEMORY[0x1A1AC355C]();
    v4 = (id *)v1;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Ending activity in context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    if (objc_msgSend(v2, "count"))
      objc_msgSend(v2, "setCount:", objc_msgSend(v2, "count") - 1);
    if (!objc_msgSend(v2, "count"))
    {
      if (objc_msgSend(v2, "shouldRestoreVoucher"))
      {
        v7 = (void *)MEMORY[0x1A1AC355C]();
        v8 = v4;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "voucher");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v14 = v10;
          v15 = 2112;
          v16 = v11;
          _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Restoring voucher: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(v2, "voucher");
        objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v4[3], "removeObject:", v2);
    }
  }

}

id __HMFActivityGetCurrentThreadContext(void *a1, BOOL *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    v3 = a1;
    +[__HMFThreadContext currentContext](__HMFThreadContext, "currentContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[3];

    objc_msgSend(v5, "member:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    if (a2)
      *a2 = v6 != 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

void sub_19B54DB84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_64);
  _Unwind_Resume(a1);
}

void sub_19B54DE58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_68);
  _Unwind_Resume(a1);
}

__CFString *HMFGetActivityIdentifier(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("[%@] "), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E3B39EC0;
  }
  return v4;
}

id HMFObjectDescriptionWithOptions(void *a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "attributeDescriptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hmf_isEmpty") & 1) != 0)
      {
        v6 = &stru_1E3B39EC0;
      }
      else if ((a2 & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v14 = v5;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "privateDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v16);
        }

        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR(", "), "stringByAppendingString:", v20);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR(", "), "stringByAppendingString:", v12);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((a2 & 2) != 0)
      {
        v8 = (void *)MEMORY[0x1A1AC355C]();
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "shortDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v10;
          v35 = 2112;
          v36 = v11;
          _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Attempting to privately log legacy attribute description for object: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
      }
      objc_msgSend(v3, "propertyDescription");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E3B39EC0;
    }
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\t"), CFSTR("\t"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), &stru_1E3B39EC0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if ((a2 & 4) != 0)
    {
      objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@%@%@>"), v25, &stru_1E3B39EC0, v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), v3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@%@%@>"), v26, v27, v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

__CFString *HMFGetLogIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v1, "logIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@] "), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E3B39EC0;
  }

  return v4;
}

id HMFAttributeDescriptionDescriptionWithOptions(void *a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v22;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v14 = 0;
      goto LABEL_26;
    }
    if ((a2 & 2) == 0)
    {
LABEL_17:
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v17, "shortDescription");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_22;
LABEL_26:

          objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@"), v6, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }

      }
LABEL_22:
      objc_msgSend(v7, "formatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringForObjectValue:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = v19;
      }
      else
      {
        objc_msgSend(v8, "description");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v14 = v20;

      goto LABEL_26;
    }
    v22 = v5;
    v9 = v7;
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || (objc_msgSend(v9, "formatter"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "privateStringForObjectValue:", v10),
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v14))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "privateDescription");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = (__CFString *)v15;
        goto LABEL_16;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "redactedDescription");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if ((v12 & 1) != 0)
        v14 = CFSTR("<private>");
      else
        v14 = 0;
    }
LABEL_16:

    v5 = v22;
    if (v14)
      goto LABEL_26;
    goto LABEL_17;
  }
  v16 = 0;
LABEL_27:

  return v16;
}

void sub_19B54EBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void __HMFMessageDispatcherRegisterHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    os_unfair_lock_lock_with_options();
    v5 = objc_msgSend(*((id *)v3 + 2), "indexOfObject:", v4);
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = (id *)v3;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      HMFGetOSLogHandle();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Registering handler: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7[2], "addObject:", v4);
    }
    else
    {
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v11;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating handler: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7[2], "replaceObjectAtIndex:withObject:", v5, v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 2);
  }

}

void sub_19B54F014(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B54F0CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __kick(void *a1)
{
  char v1;
  int64_t v2;
  dispatch_time_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;

  v8 = a1;
  v1 = -[uint64_t options](v8, "options");
  v2 = (uint64_t)(*((double *)v8 + 4) * 1000000000.0);
  if ((v1 & 1) != 0)
    v3 = dispatch_walltime(0, v2);
  else
    v3 = dispatch_time(0, v2);
  v4 = v3;
  -[uint64_t timer](v8, "timer");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v5, v4, 0xFFFFFFFFFFFFFFFFLL, v8[5]);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *((double *)v8 + 4));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v8[7];
  v8[7] = v6;

}

void __activateIfNecessary(void *a1)
{
  NSObject *v1;
  _QWORD *v2;
  id *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  const char *v6;
  qos_class_t v7;
  dispatch_qos_class_t v8;
  dispatch_block_t v9;
  dispatch_source_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v2 = a1;
  v3 = (id *)v2;
  if (!v2[9])
  {
    v4 = v2[2];
    v5 = v4;
    if (!v4)
    {
      v6 = (const char *)HMFDispatchQueueName(v2, 0);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v1 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create(v6, v1);
    }
    objc_storeStrong(v3 + 3, v5);
    if (!v4)
    {

    }
    objc_initWeak(&location, v3);
    if (((_BYTE)v3[10] & 0x10) != 0)
    {
      v8 = QOS_CLASS_USER_INITIATED;
    }
    else
    {
      v7 = qos_class_self();
      if (v7 <= QOS_CLASS_UTILITY)
        v8 = QOS_CLASS_UTILITY;
      else
        v8 = v7;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ____activateIfNecessary_block_invoke;
    v12[3] = &unk_1E3B37BF8;
    objc_copyWeak(&v13, &location);
    v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v12);
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v3[3]);
    v11 = v3[9];
    v3[9] = v10;

    dispatch_source_set_event_handler((dispatch_source_t)v3[9], v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void sub_19B54F35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __disabledDueToParent(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue") ^ 1;
  else
    v3 = 0;

  return v3;
}

void sub_19B54FD7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

_QWORD *__HMFActivityScopeLeave(_QWORD *result)
{
  if (result)
  {
    result = (_QWORD *)*result;
    if (result)
      return (_QWORD *)objc_msgSend(result, "end");
  }
  return result;
}

uint64_t HMFQOSClassFromQualityOfService(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;

  if (a1 == -1)
    v1 = 21;
  else
    v1 = 0;
  if (a1 <= 8)
    v2 = v1;
  else
    v2 = 9;
  if (a1 <= 16)
    v3 = v2;
  else
    v3 = 17;
  if (a1 <= 24)
    v4 = v3;
  else
    v4 = 25;
  if (a1 <= 32)
    return v4;
  else
    return 33;
}

uint64_t getBYSetupAssistantFinishedDarwinNotification()
{
  void *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  v7 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    v1 = (void *)SetupAssistantLibrary();
    v0 = dlsym(v1, "BYSetupAssistantFinishedDarwinNotification");
    v5[3] = (uint64_t)v0;
    getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(_QWORD *)v0;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v0;
  void *v2;

  if (_MergedGlobals_74)
    return _MergedGlobals_74;
  _MergedGlobals_74 = _sl_dlopen();
  v0 = _MergedGlobals_74;
  if (!_MergedGlobals_74)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_19B551674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  os_unfair_lock_s *v18;
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  os_unfair_lock_unlock(v18);
  _Unwind_Resume(a1);
}

void sub_19B55193C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B552750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
  id *v11;

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMFProductPlatformFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Mac OS X")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("macOS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone OS")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Watch OS")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Apple TVOS")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("xrOS")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id HMFObjectDescription(void *a1)
{
  uint64_t v1;
  id v2;
  char v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;

  v1 = qword_1ED013280;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_1ED013280, &__block_literal_global_91);
  v3 = _MergedGlobals_77;
  +[HMFPreferences sharedPreferences](HMFPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceForKey:", CFSTR("shouldLogPrivateInformation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = v3;
  else
    v7 = v3 | 2;
  HMFObjectDescriptionWithOptions(v2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_19B553FB8(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_19B55444C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *HMFQualityOfServiceToString(uint64_t a1)
{
  if (a1 <= 16)
  {
    if (a1 == -1)
      return CFSTR("Default");
    if (a1 == 9)
      return CFSTR("Background");
  }
  else
  {
    switch(a1)
    {
      case 17:
        return CFSTR("Utility");
      case 25:
        return CFSTR("User Initiated");
      case 33:
        return CFSTR("User Interactive");
    }
  }
  return CFSTR("Unknown");
}

void sub_19B555968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B555A54(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B555F1C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __suspend(_BYTE *a1)
{
  NSObject *v1;
  _BYTE *v2;

  if (a1[48])
  {
    v2 = a1;
    objc_msgSend(v2, "timer");
    v1 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v1);

    v2[48] = 0;
  }
}

double HMFUptime()
{
  return (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
}

void __HMFLocationAuthorizationInitialize(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  Class isa;
  uint64_t v4;
  Class v5;
  uint64_t v6;
  Class v7;

  v1 = a1;
  __HMFLocationAuthorizationCreateQueue(v1);
  v2 = objc_claimAutoreleasedReturnValue();
  isa = v1[8].isa;
  v1[8].isa = (Class)v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v1[5].isa;
  v1[5].isa = (Class)v4;

  +[HMFScheduler defaultScheduler](HMFScheduler, "defaultScheduler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v1[2].isa;
  v1[2].isa = (Class)v6;

}

dispatch_queue_t __HMFLocationAuthorizationCreateQueue(NSObject *a1)
{
  dispatch_queue_t v1;
  NSObject *v2;
  const char *v3;

  v1 = a1;
  if (a1)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (const char *)HMFDispatchQueueName(v1, 0);
    v1 = dispatch_queue_create(v3, v2);

  }
  return v1;
}

void sub_19B5571C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void __HMFLocationManagerOperationStartMonitoring(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  objc_msgSend(v1, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____HMFLocationManagerOperationStartMonitoring_block_invoke;
  block[3] = &unk_1E3B37AF8;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

void sub_19B557758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1ED012E80;
  v7 = qword_1ED012E80;
  if (!qword_1ED012E80)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1E3B382D8;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19B557B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B557D78(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED012E88)
  {
    qword_1ED012E88 = _sl_dlopen();
    if (!qword_1ED012E88)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED012E80 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED013028)
  {
    qword_1ED013028 = _sl_dlopen();
    if (!qword_1ED013028)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED013020 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19B558648(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t __HMFLocationAuthorizationHandleAuthorizationStatus(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    if ((a2 - 3) < 2)
    {
      objc_msgSend(v3, "finish");
    }
    else
    {
      if ((a2 - 1) > 1)
      {
        v6 = 1;
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancelWithError:", v5);

    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

void sub_19B558CB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B558D40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B559068(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B559270(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMFDispatchQueueName(void *a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR(".");
  else
    v8 = &stru_1E3B39EC0;
  if (v4)
    v9 = v4;
  else
    v9 = &stru_1E3B39EC0;
  v10 = objc_msgSend(v5, "hash");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.HMFoundation.%@%@%@.%tu"), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = objc_msgSend(v12, "UTF8String");

  return v13;
}

void __HMFLocationAuthorizationUpdateState(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = (os_unfair_lock_s *)v3;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2048;
    v11 = a2;
    _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating authorization state to %ld", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[os_unfair_lock_s willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("isMonitoring"));
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&v5[8]._os_unfair_lock_opaque = a2;
  os_unfair_lock_unlock(v5 + 2);
  -[os_unfair_lock_s didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("isMonitoring"));

}

void sub_19B55B068(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____activateIfNecessary_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__handleExpiration");

}

void __HMFLocationAuthorizationStopMonitoring(void *a1)
{
  id v1;
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    os_unfair_lock_lock_with_options();
    if (objc_msgSend(*((id *)v1 + 5), "hmf_isEmpty"))
    {
      v2 = (void *)MEMORY[0x1A1AC355C]();
      v3 = v1;
      HMFGetOSLogHandle();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v5;
        _os_log_impl(&dword_19B546000, v4, OS_LOG_TYPE_INFO, "%{public}@Stop monitoring", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      v6 = (void *)v3[11];
      if (v6)
      {
        v7 = v6;
        v8 = (void *)v3[11];
        v3[11] = 0;

        v9 = dispatch_time(0, 1000000000);
        v10 = v3[8];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ____HMFLocationAuthorizationStopMonitoring_block_invoke;
        block[3] = &unk_1E3B37AF8;
        v13 = v7;
        v11 = v7;
        dispatch_after(v9, v10, block);

      }
      os_unfair_lock_unlock((os_unfair_lock_t)v1 + 2);
      __HMFLocationAuthorizationUpdateState(v3, 0);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v1 + 2);
    }
  }

}

void sub_19B55B29C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B55B980(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B55BF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t Sequence.asyncForEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[7] = AssociatedTypeWitness;
  v5[8] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5[9] = swift_task_alloc();
  sub_19B5B9EC0();
  v5[10] = swift_task_alloc();
  v5[11] = *(_QWORD *)(a3 - 8);
  v5[12] = swift_task_alloc();
  v8 = swift_getAssociatedTypeWitness();
  v5[13] = v8;
  v5[14] = *(_QWORD *)(v8 - 8);
  v5[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B55C128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v5;
  _QWORD *v6;
  uint64_t (*v7)(_QWORD);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  sub_19B5B9D1C();
  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  swift_getAssociatedConformanceWitness();
  sub_19B5B9ECC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(int **)(v0 + 16);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 32))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
    v7 = (uint64_t (*)(_QWORD))((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v6;
    *v6 = v0;
    v6[1] = sub_19B55C28C;
    return v7(*(_QWORD *)(v0 + 72));
  }
}

uint64_t sub_19B55C28C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55C2F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v5;
  _QWORD *v6;
  uint64_t (*v7)(_QWORD);

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  swift_getAssociatedConformanceWitness();
  sub_19B5B9ECC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(int **)(v0 + 16);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 32))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
    v7 = (uint64_t (*)(_QWORD))((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v6;
    *v6 = v0;
    v6[1] = sub_19B55C28C;
    return v7(*(_QWORD *)(v0 + 72));
  }
}

uint64_t sub_19B55C430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[10] = AssociatedTypeWitness;
  v6[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6[12] = swift_task_alloc();
  sub_19B5B9EC0();
  v6[13] = swift_task_alloc();
  v6[14] = *(_QWORD *)(a3 - 8);
  v6[15] = swift_task_alloc();
  v9 = swift_getAssociatedTypeWitness();
  v6[16] = v9;
  v6[17] = *(_QWORD *)(v9 - 8);
  v6[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B55C5E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v10;
  _QWORD *v11;
  int *v12;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 16) = sub_19B5B9CC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_19B5B9D1C();
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 88);
  swift_getAssociatedConformanceWitness();
  sub_19B5B9ECC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    v8 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }
  else
  {
    v10 = *(int **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 32))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    v12 = (int *)((char *)v10 + *v10);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v11;
    *v11 = v0;
    v11[1] = sub_19B55C780;
    return ((uint64_t (*)(_QWORD, _QWORD))v12)(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96));
  }
}

uint64_t sub_19B55C780()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_19B55C7EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v9;
  _QWORD *v10;
  int *v11;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_19B5B9DC4();
  sub_19B5B9DAC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 88);
  swift_getAssociatedConformanceWitness();
  sub_19B5B9ECC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    v7 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  else
  {
    v9 = *(int **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 32))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    v11 = (int *)((char *)v9 + *v9);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v10;
    *v10 = v0;
    v10[1] = sub_19B55C780;
    return ((uint64_t (*)(_QWORD, _QWORD))v11)(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96));
  }
}

uint64_t sub_19B55C974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Sequence<>.parallelForEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_19B55CA30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_19B55CAC8;
  return sub_19B5B9FC8();
}

uint64_t sub_19B55CAC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55CB34()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55CB40()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55CB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;

  v7[13] = a6;
  v7[14] = a7;
  v7[11] = a4;
  v7[12] = a5;
  v7[9] = a2;
  v7[10] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[15] = AssociatedTypeWitness;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7[16] = v10;
  v7[17] = *(_QWORD *)(v10 + 64);
  v7[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  sub_19B5B9EC0();
  v7[21] = swift_task_alloc();
  v7[22] = *(_QWORD *)(a6 - 8);
  v7[23] = swift_task_alloc();
  v11 = swift_getAssociatedTypeWitness();
  v7[24] = v11;
  v7[25] = *(_QWORD *)(v11 - 8);
  v7[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B55CCC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, uint64_t, uint64_t);
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);

  v23 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 16))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104));
  sub_19B5B9D1C();
  while (1)
  {
    v2 = *(_QWORD *)(v0 + 168);
    v3 = *(_QWORD *)(v0 + 120);
    swift_getAssociatedConformanceWitness();
    sub_19B5B9ECC();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v2, 1, v3) == 1)
      break;
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = *(_QWORD *)(v0 + 144);
    v27 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 120);
    v8 = *(_QWORD *)(v0 + 96);
    v25 = v4;
    v26 = *(_QWORD *)(v0 + 88);
    v9 = sub_19B5B9E24();
    v10 = *(_QWORD *)(v9 - 8);
    v24 = *(_OWORD *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v4, 1, 1, v9);
    v11 = *(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 32);
    v11(v6, v5, v7);
    v12 = (*(unsigned __int8 *)(v23 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = 0;
    v14 = (_QWORD *)(v13 + 16);
    *(_QWORD *)(v13 + 24) = 0;
    *(_OWORD *)(v13 + 32) = v24;
    *(_QWORD *)(v13 + 48) = v26;
    *(_QWORD *)(v13 + 56) = v8;
    v11(v13 + v12, v6, v7);
    sub_19B55FA9C(v25, v27);
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v27, 1, v9);
    swift_retain();
    v15 = *(_QWORD *)(v0 + 152);
    if ((_DWORD)v7 == 1)
    {
      sub_19B55FA5C(*(_QWORD *)(v0 + 152));
      if (*v14)
        goto LABEL_6;
    }
    else
    {
      sub_19B5B9E18();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v15, v9);
      if (*v14)
      {
LABEL_6:
        swift_getObjectType();
        swift_unknownObjectRetain();
        v16 = sub_19B5B9DD0();
        v18 = v17;
        swift_unknownObjectRelease();
        goto LABEL_9;
      }
    }
    v16 = 0;
    v18 = 0;
LABEL_9:
    v19 = **(_QWORD **)(v0 + 72);
    v20 = v18 | v16;
    if (v18 | v16)
    {
      v20 = v0 + 16;
      *(_QWORD *)(v0 + 16) = 0;
      *(_QWORD *)(v0 + 24) = 0;
      *(_QWORD *)(v0 + 32) = v16;
      *(_QWORD *)(v0 + 40) = v18;
    }
    v1 = *(_QWORD *)(v0 + 160);
    *(_QWORD *)(v0 + 48) = 1;
    *(_QWORD *)(v0 + 56) = v20;
    *(_QWORD *)(v0 + 64) = v19;
    swift_task_create();
    swift_release();
    sub_19B55FA5C(v1);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  v28 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EE3F6C08 + dword_1EE3F6C08);
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v21;
  *v21 = v0;
  v21[1] = sub_19B55CFD4;
  return v28(0, 0);
}

uint64_t sub_19B55CFD4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B55D070(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_19B55FFB4;
  return sub_19B55CB74(a1, a2, v8, v9, v10, v6, v7);
}

uint64_t sub_19B55D100(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v8;
  *v8 = v6;
  v8[1] = sub_19B55D164;
  return v10(a6);
}

uint64_t sub_19B55D164()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B55D1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  MEMORY[0x1E0C80A78](v7, v8, v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19B55FA9C(a1, (uint64_t)v11);
  v12 = sub_19B5B9E24();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_19B55FA5C((uint64_t)v11);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_19B5B9DD0();
      v16 = v15;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19B5B9E18();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v17 = *v4;
  v18 = (_QWORD *)(v16 | v14);
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v17;
  swift_task_create();
  return swift_release();
}

uint64_t sub_19B55D330(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  if (a1)
  {
    swift_getObjectType();
    v4 = sub_19B5B9DD0();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v3[10] = v4;
  v3[11] = v6;
  return swift_task_switch();
}

uint64_t sub_19B55D3A4()
{
  uint64_t v0;
  int isPlatformVersionAtLeast;
  _QWORD *v3;

  *(_QWORD *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BA0);
  if ((sub_19B5B9E48() & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  isPlatformVersionAtLeast = __isPlatformVersionAtLeast(2, 18, 0, 0);
  *(_DWORD *)(v0 + 128) = isPlatformVersionAtLeast;
  *(_QWORD *)(v0 + 104) = 0;
  if (!isPlatformVersionAtLeast)
    return swift_taskGroup_wait_next_throwing();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6C20);
  *v3 = v0;
  v3[1] = sub_19B55D4BC;
  return sub_19B5B9E3C();
}

uint64_t sub_19B55D4BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 120) = v0;
  else
    *(_BYTE *)(v2 + 134) = *(_BYTE *)(v2 + 132);
  return swift_task_switch();
}

uint64_t sub_19B55D528()
{
  uint64_t v0;
  uint64_t v1;

  if (v0)
    *(_QWORD *)(v1 + 120) = v0;
  else
    *(_BYTE *)(v1 + 135) = *(_BYTE *)(v1 + 133);
  return swift_task_switch();
}

uint64_t sub_19B55D558()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if ((*(_BYTE *)(v0 + 134) & 1) == 0)
    goto LABEL_7;
  v1 = *(_QWORD *)(v0 + 104);
  if ((sub_19B5B9E48() & 1) == 0)
  {
    *(_QWORD *)(v0 + 104) = v1;
LABEL_7:
    if (!*(_DWORD *)(v0 + 128))
      return swift_taskGroup_wait_next_throwing();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6C20);
    *v3 = v0;
    v3[1] = sub_19B55D4BC;
    return sub_19B5B9E3C();
  }
  if (v1)
    swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55D658()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if ((*(_BYTE *)(v0 + 135) & 1) == 0)
    goto LABEL_7;
  v1 = *(_QWORD *)(v0 + 104);
  if ((sub_19B5B9E48() & 1) == 0)
  {
    *(_QWORD *)(v0 + 104) = v1;
LABEL_7:
    if (!*(_DWORD *)(v0 + 128))
      return swift_taskGroup_wait_next_throwing();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6C20);
    *v3 = v0;
    v3[1] = sub_19B55D4BC;
    return sub_19B5B9E3C();
  }
  if (v1)
    swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55D758()
{
  uint64_t v0;
  void *v1;
  _QWORD *v3;

  v1 = *(void **)(v0 + 120);
  if (*(_QWORD *)(v0 + 104))
  {

    v1 = *(void **)(v0 + 104);
  }
  if ((sub_19B5B9E48() & 1) != 0)
  {
    if (v1)
      swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 104) = v1;
    if (*(_DWORD *)(v0 + 128))
    {
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6C20);
      *v3 = v0;
      v3[1] = sub_19B55D4BC;
      return sub_19B5B9E3C();
    }
    else
    {
      return swift_taskGroup_wait_next_throwing();
    }
  }
}

uint64_t Sequence<>.parallelMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return swift_task_switch();
}

uint64_t sub_19B55D888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  __int128 v7;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v7 = *(_OWORD *)(v0 + 48);
  swift_getTupleTypeMetadata2();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v7;
  *(_QWORD *)(v3 + 40) = v1;
  *(_OWORD *)(v3 + 48) = v4;
  sub_19B5B9DC4();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = sub_19B55D988;
  return sub_19B5B9FC8();
}

uint64_t sub_19B55D988()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55D9F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_19B55DA00()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55DA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v8[12] = TupleTypeMetadata2;
  v8[13] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6BA0);
  v10 = sub_19B5BA064();
  v8[17] = v10;
  v11 = sub_19B5B9EC0();
  v8[18] = v11;
  v8[19] = *(_QWORD *)(v11 - 8);
  v8[20] = swift_task_alloc();
  v8[21] = *(_QWORD *)(v10 - 8);
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[24] = AssociatedTypeWitness;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[25] = v13;
  v8[26] = *(_QWORD *)(v13 + 64);
  v8[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  v8[28] = swift_task_alloc();
  v14 = sub_19B5B9EC0();
  v8[29] = v14;
  v8[30] = *(_QWORD *)(v14 - 8);
  v8[31] = swift_task_alloc();
  v8[32] = swift_getTupleTypeMetadata2();
  v15 = sub_19B5B9EC0();
  v8[33] = v15;
  v8[34] = *(_QWORD *)(v15 - 8);
  v8[35] = swift_task_alloc();
  v8[36] = swift_task_alloc();
  v8[37] = sub_19B5B9FB0();
  v8[38] = swift_task_alloc();
  v16 = sub_19B5B9FA4();
  v8[39] = v16;
  v8[40] = *(_QWORD *)(v16 - 8);
  v8[41] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B55DCC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);

  v33 = v0[34];
  v1 = v0[32];
  v31 = v0[25];
  sub_19B5B9D34();
  sub_19B5B9F8C();
  v2 = 0;
  v32 = v1;
  while (1)
  {
    v4 = v0[35];
    v3 = v0[36];
    v6 = v0[32];
    v5 = v0[33];
    sub_19B5B9F98();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v3, v4, v5);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 48))(v3, 1, v6);
    if ((_DWORD)result == 1)
    {
      v24 = v0[30];
      v23 = v0[31];
      v25 = v0[29];
      v26 = v0[10];
      (*(void (**)(_QWORD, _QWORD))(v0[40] + 8))(v0[41], v0[39]);
      v27 = *(_QWORD *)(v26 - 8);
      v0[42] = v27;
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v0[43] = v28;
      v28(v23, 1, 1, v26);
      v29 = sub_19B55F8D0(v23, v2, v25);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      v0[2] = v29;
      v0[44] = 0;
      v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3F6BE0 + dword_1EE3F6BE0);
      v30 = (_QWORD *)swift_task_alloc();
      v0[45] = v30;
      sub_19B5B9E54();
      *v30 = v0;
      v30[1] = sub_19B55DFE8;
      return v39(v0[20], 0, 0);
    }
    if (__OFADD__(v2, 1))
      break;
    v8 = (uint64_t *)v0[36];
    v9 = (char *)v0[27];
    v10 = v0[28];
    v11 = v0[24];
    v37 = v10;
    v38 = v2;
    v13 = v0[10];
    v12 = v0[11];
    v14 = v0[9];
    v35 = v0[7];
    v36 = v0[8];
    v15 = (char *)v8 + *(int *)(v1 + 48);
    v34 = *v8;
    v16 = sub_19B5B9E24();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
    v17 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    v17(v9, v15, v11);
    v18 = (*(unsigned __int8 *)(v31 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    v19 = (char *)swift_allocObject();
    *((_QWORD *)v19 + 2) = 0;
    *((_QWORD *)v19 + 3) = 0;
    *((_QWORD *)v19 + 4) = v14;
    *((_QWORD *)v19 + 5) = v13;
    *((_QWORD *)v19 + 6) = v12;
    *((_QWORD *)v19 + 7) = v34;
    *((_QWORD *)v19 + 8) = v35;
    *((_QWORD *)v19 + 9) = v36;
    v17(&v19[v18], v9, v11);
    v21 = *((_QWORD *)v19 + 2);
    v20 = *((_QWORD *)v19 + 3);
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v21;
    v22[3] = v20;
    v22[4] = v14;
    v22[5] = v13;
    v22[6] = v12;
    v22[7] = &unk_1EE3F6BF0;
    v22[8] = v19;
    v1 = v32;
    sub_19B5B9E54();
    swift_retain();
    swift_unknownObjectRetain();
    sub_19B55D1AC(v37, (uint64_t)&unk_1EE3F6C00, (uint64_t)v22);
    sub_19B55FA5C(v37);
    v2 = v38 + 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_19B55DFE8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55E03C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 136);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) != 1)
  {
    v8 = *(_QWORD *)(v0 + 176);
    v7 = *(_QWORD *)(v0 + 184);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v7, v1, v3);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v8, v7, v3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = *(_QWORD *)(v0 + 352);
      v10 = *(void ***)(v0 + 176);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 136));
      v11 = *v10;
      if (!v9)
      {
LABEL_9:
        *(_QWORD *)(v0 + 352) = v11;
        v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3F6BE0 + dword_1EE3F6BE0);
        v26 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 360) = v26;
        sub_19B5B9E54();
        *v26 = v0;
        v26[1] = sub_19B55DFE8;
        return v42(*(_QWORD *)(v0 + 160), 0, 0);
      }

    }
    else
    {
      v12 = *(_QWORD *)(v0 + 336);
      v35 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 344);
      v13 = *(_QWORD *)(v0 + 240);
      v34 = *(char **)(v0 + 248);
      v14 = *(_QWORD *)(v0 + 232);
      v15 = *(unint64_t **)(v0 + 176);
      v40 = *(_QWORD *)(v0 + 136);
      v41 = *(_QWORD *)(v0 + 184);
      v16 = *(unint64_t **)(v0 + 112);
      v38 = *(_QWORD *)(v0 + 104);
      v39 = *(_QWORD *)(v0 + 168);
      v17 = *(_QWORD *)(v0 + 80);
      v18 = *(int *)(*(_QWORD *)(v0 + 96) + 48);
      v19 = *(_QWORD *)(v0 + 96);
      v36 = v19;
      v37 = *(unint64_t **)(v0 + 120);
      v20 = (char *)v37 + v18;
      v21 = *v15;
      *v37 = *v15;
      v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v22((char *)v37 + v18, (char *)v15 + v18, v17);
      v23 = (char *)v16 + *(int *)(v19 + 48);
      *v16 = v21;
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v23, v20, v17);
      v22(v34, v23, v17);
      v35((uint64_t)v34, 0, 1, v17);
      v24 = sub_19B5B9DC4();
      sub_19B5B9D7C();
      v25 = *(_QWORD *)(v0 + 16);
      sub_19B55F880(v21, v25);
      (*(void (**)(unint64_t, char *, uint64_t))(v13 + 40))(v25+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v21, v34, v14);
      nullsub_1(v24);
      (*(void (**)(unint64_t *, uint64_t))(v38 + 8))(v37, v36);
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
    }
    v11 = *(void **)(v0 + 352);
    goto LABEL_9;
  }
  v4 = *(_QWORD *)(v0 + 352);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(v1, *(_QWORD *)(v0 + 144));
  if (v4)
  {
    v5 = *(void **)(v0 + 352);
    v6 = v5;
    swift_bridgeObjectRelease();
    swift_willThrow();

  }
  else
  {
    v28 = *(_QWORD *)(v0 + 72);
    v29 = *(uint64_t **)(v0 + 32);
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 16);
    v30 = swift_task_alloc();
    v31 = *(_OWORD *)(v0 + 80);
    *(_QWORD *)(v30 + 16) = v28;
    *(_OWORD *)(v30 + 24) = v31;
    v32 = sub_19B5B9DC4();
    swift_bridgeObjectRetain();
    MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v32);
    v33 = sub_19B5B9D28();
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v29 = v33;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55E4F4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v11 = v2[6];
  v10 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_19B55D164;
  return sub_19B55DA34(a1, a2, v9, v11, v10, v6, v7, v8);
}

uint64_t sub_19B55E588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t);

  *(_QWORD *)(v7 + 16) = a4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)a5 + *a5);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v10;
  *v10 = v7;
  v10[1] = sub_19B55E600;
  return v12(a1, a7);
}

uint64_t sub_19B55E600()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  v4 = swift_task_dealloc();
  if (!v0)
    v4 = *(_QWORD *)(v2 + 16);
  return (*(uint64_t (**)(uint64_t))(v3 + 8))(v4);
}

uint64_t sub_19B55E64C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  *(_QWORD *)(v4 + 16) = a1;
  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v7;
  *v7 = v4;
  v7[1] = sub_19B55E6E4;
  return v9(v6);
}

uint64_t sub_19B55E6E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_19B55E740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[2] = a2;
  v3[3] = a3;
  v4 = (_QWORD *)swift_task_alloc();
  v3[4] = v4;
  *v4 = v3;
  v4[1] = sub_19B55E7A8;
  return sub_19B5B9E30();
}

uint64_t sub_19B55E7A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 16))
  {
    swift_getObjectType();
    sub_19B5B9DD0();
  }
  return swift_task_switch();
}

uint64_t sub_19B55E840()
{
  return swift_unexpectedError();
}

uint64_t Sequence<>.parallelMapToResults<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return swift_task_switch();
}

uint64_t sub_19B55E87C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  __int128 v7;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6BA0);
  v7 = *(_OWORD *)(v0 + 48);
  sub_19B5BA064();
  swift_getTupleTypeMetadata2();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v7;
  *(_QWORD *)(v3 + 40) = v1;
  *(_OWORD *)(v3 + 48) = v4;
  sub_19B5B9DC4();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = sub_19B55E9A0;
  return sub_19B5B9F38();
}

uint64_t sub_19B55E9A0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55E9FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AC3AFC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_19B55EA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t TupleTypeMetadata2;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6BA0);
  v8[12] = sub_19B5BA064();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v8[13] = TupleTypeMetadata2;
  v8[14] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[17] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[18] = v11;
  v8[19] = *(_QWORD *)(v11 + 64);
  v8[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  v8[21] = swift_task_alloc();
  sub_19B5B9EC0();
  v8[22] = swift_task_alloc();
  v12 = sub_19B5B9E00();
  v8[23] = v12;
  v8[24] = *(_QWORD *)(v12 - 8);
  v8[25] = swift_task_alloc();
  v13 = sub_19B5B9EC0();
  v8[26] = v13;
  v8[27] = *(_QWORD *)(v13 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_getTupleTypeMetadata2();
  v14 = sub_19B5B9EC0();
  v8[30] = v14;
  v8[31] = *(_QWORD *)(v14 - 8);
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  v8[34] = sub_19B5B9FB0();
  v8[35] = swift_task_alloc();
  v15 = sub_19B5B9FA4();
  v8[36] = v15;
  v8[37] = *(_QWORD *)(v15 - 8);
  v8[38] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B55ECCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;

  v1 = *(_QWORD *)(v0 + 232);
  v26 = *(_QWORD *)(v0 + 144);
  v27 = *(_QWORD *)(v0 + 248);
  sub_19B5B9D34();
  sub_19B5B9F8C();
  for (i = 0; ; ++i)
  {
    v3 = *(_QWORD *)(v0 + 256);
    v2 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 232);
    v4 = *(_QWORD *)(v0 + 240);
    sub_19B5B9F98();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v2, v3, v4);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 48))(v2, 1, v5);
    if ((_DWORD)result == 1)
    {
      v19 = *(_QWORD *)(v0 + 216);
      v18 = *(_QWORD *)(v0 + 224);
      v20 = *(_QWORD *)(v0 + 208);
      v21 = *(_QWORD *)(v0 + 96);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
      v22 = *(_QWORD *)(v21 - 8);
      *(_QWORD *)(v0 + 312) = v22;
      v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
      *(_QWORD *)(v0 + 320) = v23;
      v23(v18, 1, 1, v21);
      v24 = sub_19B55F8D0(v18, i, v20);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      *(_QWORD *)(v0 + 16) = v24;
      sub_19B5B9DE8();
      v25 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 328) = v25;
      *v25 = v0;
      v25[1] = sub_19B55EF88;
      return sub_19B5B9DF4();
    }
    if (__OFADD__(i, 1))
      break;
    v7 = *(uint64_t **)(v0 + 264);
    v9 = *(char **)(v0 + 160);
    v8 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 136);
    v11 = *(_QWORD *)(v0 + 64);
    v31 = *(_QWORD *)(v0 + 56);
    v12 = (char *)v7 + *(int *)(v1 + 48);
    v29 = *v7;
    v30 = *(_QWORD *)(v0 + 88);
    v13 = sub_19B5B9E24();
    v28 = *(_OWORD *)(v0 + 72);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
    v14 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
    v14(v9, v12, v10);
    v15 = (*(unsigned __int8 *)(v26 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = 0;
    *(_OWORD *)(v16 + 32) = v28;
    *(_QWORD *)(v16 + 48) = v30;
    *(_QWORD *)(v16 + 56) = v29;
    *(_QWORD *)(v16 + 64) = v31;
    *(_QWORD *)(v16 + 72) = v11;
    v14((char *)(v16 + v15), v9, v10);
    v17 = sub_19B5B9E0C();
    swift_retain();
    sub_19B55F570(v8, (uint64_t)&unk_1EE3F6BC8, v16, v17);
    sub_19B55FA5C(v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_19B55EF88()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55EFDC()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  __int128 v22;
  char *v23;
  void (*v24)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;

  v1 = *(unint64_t **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(uint64_t **)(v0 + 32);
    v22 = *(_OWORD *)(v0 + 72);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 16);
    v6 = swift_task_alloc();
    *(_OWORD *)(v6 + 16) = v22;
    *(_QWORD *)(v6 + 32) = v4;
    v7 = sub_19B5B9DC4();
    swift_bridgeObjectRetain();
    MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v7);
    v8 = sub_19B5B9D28();
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v5 = v8;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v27 = v2;
    v10 = *(_QWORD *)(v0 + 312);
    v11 = *(_QWORD *)(v0 + 216);
    v23 = *(char **)(v0 + 224);
    v24 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 320);
    v25 = *(_QWORD *)(v0 + 208);
    v12 = *(unint64_t **)(v0 + 120);
    v26 = *(unint64_t **)(v0 + 128);
    v13 = *(_QWORD *)(v0 + 96);
    v14 = *(int *)(v3 + 48);
    v15 = (char *)v26 + v14;
    v16 = *v1;
    *v26 = *v1;
    v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v17((char *)v26 + v14, (char *)v1 + v14, v13);
    v18 = (char *)v12 + *(int *)(v3 + 48);
    *v12 = v16;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v15, v13);
    v17(v23, v18, v13);
    v24((uint64_t)v23, 0, 1, v13);
    v19 = sub_19B5B9DC4();
    sub_19B5B9D7C();
    v20 = *(_QWORD *)(v0 + 16);
    sub_19B55F880(v16, v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 40))(v20+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v16, v23, v25);
    nullsub_1(v19);
    (*(void (**)(unint64_t *, uint64_t))(v27 + 8))(v26, v3);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v21;
    *v21 = v0;
    v21[1] = sub_19B55EF88;
    return sub_19B5B9DF4();
  }
}

uint64_t sub_19B55F2EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v11 = v2[6];
  v10 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_19B55FFB4;
  return sub_19B55EA48(a1, a2, v9, v11, v10, v6, v7, v8);
}

uint64_t sub_19B55F380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;

  v7[6] = a7;
  v7[7] = v9;
  v7[4] = a5;
  v7[5] = a6;
  v7[2] = a1;
  v7[3] = a4;
  return swift_task_switch();
}

uint64_t sub_19B55F3A8()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  int *v8;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(int **)(v0 + 32);
  v3 = *(_QWORD **)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6BA0);
  *(_QWORD *)(v0 + 64) = sub_19B5BA064();
  v4 = *(int *)(swift_getTupleTypeMetadata2() + 48);
  *(_DWORD *)(v0 + 88) = v4;
  v5 = (char *)v3 + v4;
  *v3 = v2;
  v8 = (int *)((char *)v1 + *v1);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v6;
  *v6 = v0;
  v6[1] = sub_19B55F478;
  return ((uint64_t (*)(char *, _QWORD))v8)(v5, *(_QWORD *)(v0 + 48));
}

uint64_t sub_19B55F478()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B55F4DC()
{
  uint64_t v0;

  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55F51C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(int *)(v0 + 88);
  v3 = *(_QWORD **)(v0 + 16);
  *v3 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)((char *)v3 + v2) = v1;
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B55F570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v24[4];
  _QWORD v25[4];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  MEMORY[0x1E0C80A78](v10, v11, v12);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19B55FA9C(a1, (uint64_t)v14);
  v15 = sub_19B5B9E24();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_19B55FA5C((uint64_t)v14);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v17 = sub_19B5B9DD0();
      v19 = v18;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19B5B9E18();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v17 = 0;
  v19 = 0;
LABEL_6:
  v20 = *v5;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = *(_QWORD *)(a4 + 16);
  v21[3] = a2;
  v21[4] = a3;
  v22 = (_QWORD *)(v19 | v17);
  if (v19 | v17)
  {
    v25[0] = 0;
    v25[1] = 0;
    v22 = v25;
    v25[2] = v17;
    v25[3] = v19;
  }
  v24[1] = 1;
  v24[2] = v22;
  v24[3] = v20;
  swift_task_create();
  return swift_release();
}

uint64_t sub_19B55F714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6BA0);
  sub_19B5BA064();
  v4 = sub_19B5B9EC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AC3AF0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_19B55F7D0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B55F834;
  return v6(a1);
}

uint64_t sub_19B55F834()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B55F880(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  v5 = a2 & 0xFFFFFFFFFFFFF8;
  if ((result & 1) == 0)
    v5 = a2;
  if (*(_QWORD *)(v5 + 16) <= a1)
    goto LABEL_7;
  return result;
}

uint64_t sub_19B55F8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_19B5B9D88();
  v15 = result;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v8 = v7;
      v9 = *(_QWORD *)(a3 - 8);
      v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
      v10(v7, a1, a3);
      v11 = a2 - 1;
      if (v11)
      {
        v12 = *(_QWORD *)(v9 + 72);
        v13 = v8 + v12;
        do
        {
          v10(v13, a1, a3);
          v13 += v12;
          --v11;
        }
        while (v11);
      }
    }
    v14 = sub_19B5B9DC4();
    nullsub_1(v14);
    return v15;
  }
  return result;
}

uint64_t sub_19B55F988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_19B55F714(a1, a2);
}

uint64_t sub_19B55F9A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v6 = *(_QWORD *)(v1 + 56);
  v7 = v1 + ((v5 + 80) & ~v5);
  v8 = swift_task_alloc();
  v9 = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v2 + 16) = v8;
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = sub_19B55D164;
  *(_QWORD *)(v8 + 48) = v7;
  *(_QWORD *)(v8 + 56) = v4;
  *(_OWORD *)(v8 + 32) = v9;
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = v6;
  return swift_task_switch();
}

uint64_t sub_19B55FA5C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19B55FA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19B55FAE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B55FB08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE3F6BD0 + dword_1EE3F6BD0))(a1, v4);
}

uint64_t sub_19B55FB88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_19B5B9EC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_19B55FC74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 56);
  v6 = *(int **)(v1 + 64);
  v7 = v1 + ((v4 + 80) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_19B55FD48;
  v8[2] = v5;
  v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v9 = (_QWORD *)swift_task_alloc();
  v8[3] = v9;
  *v9 = v8;
  v9[1] = sub_19B55E600;
  return v11(a1, v7);
}

uint64_t sub_19B55FD48(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_19B55FD98()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B55FDC4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[7];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_19B55FFB4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EE3F6BF8 + dword_1EE3F6BF8))(a1, v4, v5, v6);
}

uint64_t sub_19B55FE6C()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_19B55FEFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v2 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  v3 = *(int **)(v0 + 48);
  v4 = v0 + ((v2 + 64) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55D164;
  return v8(v4);
}

void sub_19B55FFB8()
{
  type metadata accessor for HierarchicalStateMachine.RootState();
}

void sub_19B56003C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v10 = (_QWORD *)(v2 + *(int *)(a1 + 68));
  *v10 = 0;
  v10[1] = 0;
  v9 = (_QWORD *)(v2 + *(int *)(a1 + 72));
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)(v8 - 160) = v4;
  *(_QWORD *)(v8 - 152) = v7;
  *(_QWORD *)(v8 - 144) = v6;
  *(_QWORD *)(v8 - 136) = v5;
  *(_QWORD *)(v8 - 128) = v1;
  *(_QWORD *)(v8 - 120) = v3;
  _s4NodeO13NodeStateTypeOMa();
}

void sub_19B5600C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  *(_QWORD *)(v6 - 160) = v2;
  *(_QWORD *)(v6 - 152) = v5;
  *(_QWORD *)(v6 - 144) = v4;
  *(_QWORD *)(v6 - 136) = v3;
  *(_QWORD *)(v6 - 128) = v0;
  *(_QWORD *)(v6 - 120) = v1;
  _s4NodeOMa();
}

void sub_19B5600F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t TupleTypeMetadata;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t AssociatedTypeWitness;
  _QWORD *v37;

  sub_19B5B9DC4();
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  swift_allocBox();
  v34 = v33;
  v35 = (_QWORD *)(v33 + *(int *)(TupleTypeMetadata + 48));
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v34, 1, 1, AssociatedTypeWitness);
  v37 = (_QWORD *)swift_allocObject();
  v37[2] = v27;
  v37[3] = v30;
  v37[4] = v29;
  v37[5] = v28;
  v37[6] = v24;
  v37[7] = v26;
  *v35 = &unk_1EE3F6DE0;
  v35[1] = v37;
  *(_QWORD *)(v31 - 160) = a16;
  *(_QWORD *)(v31 - 152) = a23;
  *(_QWORD *)(v31 - 144) = a21;
  *(_QWORD *)(v31 - 136) = a24;
  *(_QWORD *)(v31 - 128) = a22;
  *(_QWORD *)(v31 - 120) = a15;
  *(_QWORD *)(v31 - 112) = v25;
  *(_QWORD *)(v31 - 104) = a19;
  *(_QWORD *)(v31 - 96) = a20;
  type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components();
}

void sub_19B560220(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  *a11 = sub_19B5670CC(a1);
  a11[1] = v22;
  *(_QWORD *)(v19 + a12) = v16;
  *a14 = a13;
  *(_QWORD *)(v21 - 160) = a10;
  *(_QWORD *)(v21 - 152) = v17;
  *(_QWORD *)(v21 - 144) = v20;
  *(_QWORD *)(v21 - 136) = v14;
  *(_QWORD *)(v21 - 128) = v18;
  *(_QWORD *)(v21 - 120) = v15;
  _s4NodeOMa();
}

uint64_t sub_19B560260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_storeEnumTagMultiPayload();
  if (v1)
    v2 = v0;
  else
    v2 = 0;
  v3 = *v7;
  swift_bridgeObjectRetain();
  sub_19B564300(v1);
  sub_19B564310(v3);
  *v7 = v1;
  v7[1] = v2;
  if (v9)
  {
    swift_retain();
    v4 = v9;
    v5 = v10;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  swift_bridgeObjectRelease();
  sub_19B564310(v11);
  sub_19B564310(v12);
  sub_19B564310(v1);
  sub_19B564310(v4);
  result = sub_19B564310(*v8);
  *v8 = v9;
  v8[1] = v5;
  return result;
}

uint64_t sub_19B56033C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_19B560358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t TupleTypeMetadata2;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v1, 1, 2, TupleTypeMetadata2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)(v6 + 88) = a5;
  *(_QWORD *)(v6 + 96) = v5;
  *(_QWORD *)(v6 + 72) = a2;
  *(_QWORD *)(v6 + 80) = a3;
  *(_QWORD *)(v6 + 64) = a1;
  *(_QWORD *)(v6 + 104) = swift_task_alloc();
  v8 = a5[2];
  v9 = a5[3];
  *(_OWORD *)(v6 + 16) = a5[1];
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  _s4NodeOMa();
}

void sub_19B560438(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *v6 = v2;
  v6[1] = sub_19B560478;
  sub_19B56059C(v5, v4, v3, v1, a1);
}

uint64_t sub_19B560478()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B5604CC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD);

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 96) + *(int *)(*(_QWORD *)(v0 + 88) + 72));
  if (!*v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(*v1 + *(int *)*v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v2;
  *v2 = v0;
  v2[1] = sub_19B560554;
  return v4(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 64));
}

uint64_t sub_19B560554()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_19B56059C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6[18] = a5;
  v6[19] = v5;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  v7 = a5[2];
  v6[20] = v7;
  v8 = a5[3];
  v6[21] = v8;
  v9 = a5[4];
  v6[22] = v9;
  v10 = a5[5];
  v6[23] = v10;
  v11 = a5[6];
  v6[24] = v11;
  v12 = a5[7];
  v6[2] = v7;
  v6[25] = v12;
  v6[3] = v8;
  v6[4] = v9;
  v6[5] = v10;
  v6[6] = v11;
  v6[7] = v12;
  type metadata accessor for HierarchicalStateMachine.EventReaction();
}

void sub_19B560618(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[26] = a1;
  v4[27] = *(_QWORD *)(a1 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v9 = sub_19B5B9EC0();
  v4[30] = v9;
  v4[31] = *(_QWORD *)(v9 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = *(_QWORD *)(v3 - 8);
  v10 = swift_task_alloc();
  v4[8] = v2;
  v4[34] = v10;
  v4[9] = v5;
  v4[10] = v6;
  v4[11] = v1;
  v4[12] = v7;
  v4[13] = v8;
  _s4NodeO13NodeStateTypeOMa();
}

uint64_t sub_19B5606AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t AssociatedTypeWitness;

  v1[35] = a1;
  v1[36] = *(_QWORD *)(a1 - 8);
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1[39] = AssociatedTypeWitness;
  v1[40] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v1[41] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B560748()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v0[40];
  v1 = v0[41];
  v3 = v0[38];
  v4 = v0[37];
  v5 = v0[23];
  v12 = v0[24];
  v13 = v0[25];
  v11 = v0[22];
  v6 = v0[20];
  v9 = v0[39];
  v10 = v0[21];
  v7 = (_QWORD *)v0[18];
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v6, v5);
  sub_19B5643DC(v7, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v9);
  sub_19B561CD8(v3, v4, v6, v10, v11, v5, v12, v13);
}

uint64_t sub_19B560814(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t TupleTypeMetadata2;
  _QWORD *v21;
  uint64_t v22;
  int *v23;

  v5 = *(void (**)(uint64_t))(v22 + 8);
  v5(v3);
  v5(v1);
  if ((a1 & 1) != 0)
  {
    v8 = (int *)sub_19B5645A0(*(_OWORD **)(v2 + 144), v6, v7);
    *(_QWORD *)(v2 + 336) = v9;
    v23 = (int *)((char *)v8 + *v8);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 344) = v10;
    *v10 = v2;
    v10[1] = sub_19B560A24;
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v23)(*(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 136));
  }
  else
  {
    v12 = *(_QWORD *)(v2 + 256);
    v13 = *(_QWORD *)(v2 + 264);
    v14 = *(_QWORD **)(v2 + 144);
    sub_19B5647A4(*(_QWORD *)(v2 + 328), v14, v7, v12);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v13 + 48))(v12, 1, v14);
    v16 = *(_QWORD *)(v2 + 256);
    if (v15 != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v2 + 264) + 32))(*(_QWORD *)(v2 + 272), *(_QWORD *)(v2 + 256), *(_QWORD *)(v2 + 144));
      v21 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v2 + 352) = v21;
      *v21 = v2;
      v21[1] = sub_19B560B10;
      sub_19B56059C(*(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136), *(_QWORD **)(v2 + 144));
    }
    v17 = *(_QWORD *)(v2 + 240);
    v18 = *(_QWORD *)(v2 + 248);
    v19 = *(_QWORD *)(v2 + 112);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 320) + 8))(*(_QWORD *)(v2 + 328), *(_QWORD *)(v2 + 312));
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v19, 1, 2, TupleTypeMetadata2);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_19B560A24()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_19B560A80()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B560B10()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B560B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t TupleTypeMetadata2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;

  v1 = *(_QWORD *)(v0 + 224);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 16))(v1, *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 208));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v1, 2, TupleTypeMetadata2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 224);
    v4 = *(_QWORD *)(v0 + 208);
    v5 = *(_OWORD **)(v0 + 144);
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 8);
    *(_QWORD *)(v0 + 360) = v6;
    v6(v3, v4);
    v9 = (int *)sub_19B5645A0(v5, v7, v8);
    *(_QWORD *)(v0 + 368) = v10;
    v21 = (int *)((char *)v9 + *v9);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 376) = v11;
    *v11 = v0;
    v11[1] = sub_19B560D2C;
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v21)(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 136));
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 320);
    v13 = *(_QWORD *)(v0 + 328);
    v15 = *(_QWORD *)(v0 + 312);
    v17 = *(_QWORD *)(v0 + 224);
    v16 = *(_QWORD *)(v0 + 232);
    v18 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 216);
    v20 = *(_QWORD *)(v0 + 112);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 264) + 8))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 144));
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v20, v16, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_19B560D2C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_19B560D88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 320);
  v1 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD))(v0 + 360))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 208));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void _s4NodeOMa()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v4;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)(v4 + 64) = swift_task_alloc();
  v6 = a4[2];
  v7 = a4[3];
  *(_OWORD *)(v4 + 16) = a4[1];
  *(_OWORD *)(v4 + 32) = v6;
  *(_OWORD *)(v4 + 48) = v7;
  _s4NodeOMa();
}

void sub_19B560EB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *v5 = v2;
  v5[1] = sub_19B560EE8;
  sub_19B560F30(v4, v3, v1, a1);
}

uint64_t sub_19B560EE8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_19B560F30(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[17] = a4;
  v5[18] = v4;
  v5[15] = a2;
  v5[16] = a3;
  v5[14] = a1;
  v6 = a4[2];
  v5[19] = v6;
  v7 = a4[3];
  v5[20] = v7;
  v8 = a4[4];
  v5[21] = v8;
  v9 = a4[5];
  v5[22] = v9;
  v10 = a4[6];
  v5[23] = v10;
  v11 = a4[7];
  v5[2] = v6;
  v5[24] = v11;
  v5[3] = v7;
  v5[4] = v8;
  v5[5] = v9;
  v5[6] = v10;
  v5[7] = v11;
  type metadata accessor for HierarchicalStateMachine.StateTransition();
}

void sub_19B560FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[25] = a1;
  v4[26] = *(_QWORD *)(a1 - 8);
  v4[27] = swift_task_alloc();
  v9 = sub_19B5B9EC0();
  v4[28] = v9;
  v4[29] = *(_QWORD *)(v9 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = *(_QWORD *)(v3 - 8);
  v10 = swift_task_alloc();
  v4[8] = v2;
  v4[32] = v10;
  v4[9] = v5;
  v4[10] = v6;
  v4[11] = v1;
  v4[12] = v7;
  v4[13] = v8;
  _s4NodeO13NodeStateTypeOMa();
}

uint64_t sub_19B561030(uint64_t a1)
{
  _QWORD *v1;
  uint64_t AssociatedTypeWitness;

  v1[33] = a1;
  v1[34] = *(_QWORD *)(a1 - 8);
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1[37] = AssociatedTypeWitness;
  v1[38] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v1[39] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B5610CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v0[38];
  v1 = v0[39];
  v3 = v0[36];
  v4 = v0[35];
  v5 = v0[22];
  v12 = v0[23];
  v13 = v0[24];
  v11 = v0[21];
  v6 = v0[19];
  v9 = v0[37];
  v10 = v0[20];
  v7 = (_QWORD *)v0[17];
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v6, v5);
  sub_19B5643DC(v7, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v9);
  sub_19B561CD8(v3, v4, v6, v10, v11, v5, v12, v13);
}

void sub_19B561340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  sub_19B564A70(*(_OWORD **)(v0 + 136), v1, v2);
  *(_QWORD *)(v0 + 336) = v3;
  *(_QWORD *)(v0 + 344) = swift_task_alloc();
  JUMPOUT(0x19B5611F4);
}

uint64_t sub_19B5614B8()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_19B561514()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B5615A0()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *v0;
  v3 = *v0;
  swift_task_dealloc();
  swift_release();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 352) = v2;
  *v2 = v3;
  v2[1] = sub_19B561618;
  sub_19B560F30(*(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD **)(v1 + 136));
}

uint64_t sub_19B561618()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56166C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 136));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B561708()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56175C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  int *v8;

  v4 = (int *)sub_19B564A70(*(_OWORD **)(v3 + 136), a2, a3);
  *(_QWORD *)(v3 + 368) = v5;
  v8 = (int *)((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 376) = v6;
  *v6 = v3;
  v6[1] = sub_19B5617CC;
  return ((uint64_t (*)(_QWORD, _QWORD))v8)(*(_QWORD *)(v3 + 112), *(_QWORD *)(v3 + 128));
}

uint64_t sub_19B5617CC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

void HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)(v5 + 64) = swift_task_alloc();
  v7 = a5[2];
  v8 = a5[3];
  *(_OWORD *)(v5 + 16) = a5[1];
  *(_OWORD *)(v5 + 32) = v7;
  *(_OWORD *)(v5 + 48) = v8;
  _s4NodeOMa();
}

uint64_t sub_19B56188C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *v6 = v2;
  v6[1] = sub_19B565B30;
  return sub_19B5618CC(v5, v4, v3, v1, a1);
}

uint64_t sub_19B5618CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v8 = sub_19B5B9EC0();
  v6[8] = v8;
  v6[9] = *(_QWORD *)(v8 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = *(_QWORD *)(a5 - 8);
  v6[12] = swift_task_alloc();
  v6[13] = *(_QWORD *)(a5 + 40);
  v6[14] = *(_QWORD *)(a5 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[15] = AssociatedTypeWitness;
  v6[16] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6[17] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B5619A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[17];
  v2 = v0[10];
  v3 = v0[11];
  v4 = (_QWORD *)v0[6];
  (*(void (**)(uint64_t))(v0[13] + 24))(v0[14]);
  sub_19B5647A4(v1, v4, v5, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v3 + 48))(v2, 1, v4) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v0[9] + 8))(v0[10], v0[8]);
    v6 = (_QWORD *)swift_task_alloc();
    v0[20] = (uint64_t)v6;
    *v6 = v0;
    v6[1] = sub_19B561C20;
    sub_19B560F30(v0[2], v0[3], v0[5], (_QWORD *)v0[6]);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[11] + 32))(v0[12], v0[10], v0[6]);
  sub_19B564C78();
}

uint64_t sub_19B561B04()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B561B58()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 48));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B561BCC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B561C20()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B561C74()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B561CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[12];

  v18[4] = a1;
  v18[5] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v15, v16);
  v18[0] = (char *)v18 - v17;
  v18[1] = a3;
  v18[6] = a3;
  v18[7] = a4;
  v18[8] = a5;
  v18[9] = a6;
  v18[2] = a6;
  v18[10] = a7;
  v18[11] = a8;
  _s4NodeO13NodeStateTypeOMa();
}

uint64_t sub_19B561D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  void (*v17)(_BYTE *, _BYTE *, uint64_t);
  unsigned int (*v18)(_BYTE *, uint64_t, uint64_t);
  char v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  _BYTE v23[96];

  v6 = a1;
  v7 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  v9 = &v23[-v8];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v5 - 152) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v13 = MEMORY[0x1E0C80A78](TupleTypeMetadata2, v11, v12);
  v15 = &v23[-v14];
  v16 = &v23[*(int *)(v13 + 48) - v14];
  v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16);
  v17(&v23[-v14], *(_BYTE **)(v5 - 144), v6);
  v17(v16, *(_BYTE **)(v5 - 136), v6);
  v18 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48);
  if (v18(v15, 1, v3) == 1)
  {
    v19 = 1;
    if (v18(v16, 1, v3) == 1)
      goto LABEL_8;
  }
  else
  {
    v17(v9, v15, v6);
    if (v18(v16, 1, v3) != 1)
    {
      v20 = *(_QWORD *)(v5 - 176);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32))(v20, v16, v3);
      swift_getAssociatedConformanceWitness();
      v19 = sub_19B5B9CE0();
      v21 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      v21(v20, v3);
      v21((uint64_t)v9, v3);
      goto LABEL_8;
    }
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);
  }
  v19 = 0;
  v7 = *(_QWORD *)(v5 - 152);
  v6 = TupleTypeMetadata2;
LABEL_8:
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v15, v6);
  return v19 & 1;
}

void sub_19B561F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19B55FFB4;
  HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:)(a1, a2, a3, a4, a5);
}

void sub_19B561FBC(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_19B55FFB4;
  HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:)(a1, a2, a3, a4);
}

void sub_19B562030(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_19B561CD8(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7]);
}

void HierarchicalStateMachine.RootState<>.debugDescription.getter()
{
  _s4NodeOMa();
}

void sub_19B562074()
{
  sub_19B56208C();
}

void sub_19B56208C()
{
  _s4NodeO13NodeStateTypeOMa();
}

uint64_t sub_19B5620E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t EnumCaseMultiPayload;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t TupleTypeMetadata;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v42[96];

  *(_QWORD *)(v8 - 152) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  *(_QWORD *)(v8 - 160) = &v42[-v10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v15 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v13, v14);
  v17 = &v42[-v16];
  MEMORY[0x1E0C80A78](v15, v18, v19);
  v21 = &v42[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v22 + 16))(v21, v7, v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    *(_QWORD *)(v8 - 192) = *v21;
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload, v24, v25);
    strcpy(&v42[-64], "nodeState eventHandler stateTransitionHandler substates ");
    *(_QWORD *)(v8 - 128) = a1;
    v26 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
    *(_QWORD *)(v8 - 120) = v26;
    *(_QWORD *)(v8 - 112) = v26;
    *(_QWORD *)(v8 - 104) = sub_19B5B9DC4();
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v28 = swift_projectBox();
    v29 = *(_QWORD *)(v28 + *(int *)(TupleTypeMetadata + 80));
    v30 = *(_QWORD *)(v8 - 160);
    v31 = *(_QWORD *)(v8 - 152);
    v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v28, a1);
    *(_QWORD *)(v8 - 128) = v29;
    MEMORY[0x1E0C80A78](v32, v33, v34);
    *(_QWORD *)&v42[-64] = v5;
    *(_QWORD *)&v42[-56] = v3;
    *(_QWORD *)&v42[-48] = *(_QWORD *)(v8 - 168);
    *(_QWORD *)&v42[-40] = v6;
    v35 = *(_QWORD *)(v8 - 184);
    *(_QWORD *)&v42[-32] = *(_QWORD *)(v8 - 176);
    *(_QWORD *)&v42[-24] = v35;
    *(_QWORD *)&v42[-16] = *(_QWORD *)(v8 - 144);
    v36 = sub_19B5B9DC4();
    v37 = MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF50], v36);
    *(_QWORD *)(v8 - 128) = sub_19B563E44((void (*)(char *, char *))sub_19B564320, (uint64_t)&v42[-80], v36, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEDCE8], v37, MEMORY[0x1E0DEDD18], v38);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6DE8);
    sub_19B564390();
    sub_19B5B9CD4();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v8 - 128) = sub_19B564134(a1);
    *(_QWORD *)(v8 - 120) = v39;
    sub_19B5B9D04();
    sub_19B5B9D04();
    swift_bridgeObjectRelease();
    sub_19B5B9D04();
    v40 = *(_QWORD *)(v8 - 128);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, a1);
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v12 + 32))(v17, v21, AssociatedTypeWitness);
    v40 = sub_19B5B9FD4();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v17, AssociatedTypeWitness);
  }
  return v40;
}

_UNKNOWN **sub_19B562498()
{
  return &protocol witness table for HierarchicalStateMachine<A, B, C>.EventReaction;
}

void sub_19B5624A4()
{
  JUMPOUT(0x1A1AC3B08);
}

_UNKNOWN **sub_19B5624B4()
{
  return &protocol witness table for HierarchicalStateMachine<A, B, C>.StateTransition;
}

uint64_t sub_19B5624C0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 40);
}

void sub_19B5624C8()
{
  HierarchicalStateMachine.RootState<>.debugDescription.getter();
}

uint64_t sub_19B5624D0()
{
  return swift_allocateGenericValueMetadata();
}

void sub_19B5624D8()
{
  _s4NodeOMa();
}

_QWORD *sub_19B562560(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v10;
  unsigned int v11;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 31) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
  }
  else
  {
    v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v11 >= 2)
      v11 = *(_DWORD *)a2 + 2;
    v13 = v7 | 1;
    if (v11 == 1)
    {
      v15 = *a2;
      v14 = (char *)a2 + 7;
      *a1 = v15;
      v16 = (char *)a1 + 7;
      v17 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      v16 = (char *)a1 + 7;
      v18 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = (char *)a2 + 7;
      v19 = (_QWORD *)((unint64_t)&v14[v6] & 0xFFFFFFFFFFFFFFF8);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      v21 = (_QWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
      v22 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      swift_retain();
      v17 = 0;
    }
    swift_retain();
    *((_BYTE *)a1 + v7) = v17;
    v24 = (unint64_t)&v16[v13] & 0xFFFFFFFFFFFFFFF8;
    v25 = (unint64_t)&v14[v13] & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v25 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v24 = *(_OWORD *)v25;
    }
    else
    {
      v26 = *(_QWORD *)(v25 + 8);
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *(_QWORD *)(v24 + 8) = v26;
      swift_retain();
    }
    v27 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
    v28 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v28 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v27 = *(_OWORD *)v28;
      return a1;
    }
    v29 = *(_QWORD *)(v28 + 8);
    *(_QWORD *)v27 = *(_QWORD *)v28;
    *(_QWORD *)(v27 + 8) = v29;
  }
  swift_retain();
  return a1;
}

uint64_t sub_19B562730(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t result;
  _QWORD *v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_QWORD *)(v3 + 64);
  if (((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v5 = 8;
  else
    v5 = ((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v6 = *((unsigned __int8 *)a1 + v5);
  if (v6 >= 2 && (v5 & 0xFFFFFFF8) != 0)
    v6 = *a1 + 2;
  if (v6 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
    swift_release();
  }
  result = swift_release();
  v9 = (_QWORD *)(((unint64_t)a1 + v5 + 8) & 0xFFFFFFFFFFFFFFF8);
  if (*v9 >= 0xFFFFFFFFuLL)
    result = swift_release();
  if (*(_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
    return swift_release();
  return result;
}

_QWORD *sub_19B56284C(_QWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *(_QWORD *)a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v11 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_retain();
    v10 = 0;
  }
  swift_retain();
  *((_BYTE *)a1 + v7) = v10;
  v17 = ((unint64_t)a1 + v7 + 8) & 0xFFFFFFFFFFFFFFF8;
  v18 = ((unint64_t)a2 + v7 + 8) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v18 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v17 = *(_OWORD *)v18;
  }
  else
  {
    v19 = *(_QWORD *)(v18 + 8);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *(_QWORD *)(v17 + 8) = v19;
    swift_retain();
  }
  v20 = (v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v21 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  else
  {
    v22 = *(_QWORD *)(v21 + 8);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *(_QWORD *)(v20 + 8) = v22;
    swift_retain();
  }
  return a1;
}

_DWORD *sub_19B5629CC(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = AssociatedTypeWitness;
  if (a1 != a2)
  {
    v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v8 = 8;
    else
      v8 = ((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    v9 = *((unsigned __int8 *)a1 + v8);
    v10 = v9 < 2 || (v8 & 0xFFFFFFF8) == 0;
    if (!v10)
      v9 = *a1 + 2;
    if (v9 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    v11 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v11 >= 2)
      v11 = *a2 + 2;
    if (v11 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_BYTE *)a1 + v8) = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      v13 = (_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = (_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      v16 = (_QWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      v17 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      *((_BYTE *)a1 + v8) = 0;
      swift_retain();
    }
    swift_retain();
  }
  v19 = (((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v20 = v19 + 24;
  v10 = v19 == -16;
  v21 = 16;
  if (!v10)
    v21 = v20;
  v22 = (_QWORD *)(((unint64_t)a1 + v21) & 0xFFFFFFFFFFFFFFF8);
  v23 = (unint64_t *)(((unint64_t)a2 + v21) & 0xFFFFFFFFFFFFFFF8);
  v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v26 = v23[1];
      *v22 = v24;
      v22[1] = v26;
      swift_retain();
      goto LABEL_31;
    }
  }
  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v25 = v23[1];
      *v22 = v24;
      v22[1] = v25;
      swift_retain();
      swift_release();
      goto LABEL_31;
    }
    swift_release();
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
LABEL_31:
  v27 = (_QWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      v31 = v28[1];
      *v27 = v29;
      v27[1] = v31;
      swift_retain();
      return a1;
    }
LABEL_37:
    *(_OWORD *)v27 = *(_OWORD *)v28;
    return a1;
  }
  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_37;
  }
  v30 = v28[1];
  *v27 = v29;
  v27[1] = v30;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_19B562C5C(_QWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;
  _OWORD *v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *(_QWORD *)a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    v10 = 0;
    v11 = (_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v12 = (_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v11 = *v12;
    *(_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFF8);
  }
  *((_BYTE *)a1 + v7) = v10;
  v13 = ((unint64_t)a1 + v7 + 8) & 0xFFFFFFFFFFFFFFF8;
  v14 = ((unint64_t)a2 + v7 + 8) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v15 = *(_QWORD *)(v14 + 8);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *(_QWORD *)(v13 + 8) = v15;
  }
  v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  v17 = (uint64_t *)((v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = *v17;
  if ((unint64_t)*v17 < 0xFFFFFFFF)
  {
    *(_OWORD *)v16 = *(_OWORD *)v17;
  }
  else
  {
    v19 = v17[1];
    *(_QWORD *)v16 = v18;
    *(_QWORD *)(v16 + 8) = v19;
  }
  return a1;
}

_DWORD *sub_19B562DB8(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  char v13;
  _OWORD *v14;
  _OWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = AssociatedTypeWitness;
  if (a1 != a2)
  {
    v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v8 = 8;
    else
      v8 = ((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    v9 = *((unsigned __int8 *)a1 + v8);
    v10 = v9 < 2 || (v8 & 0xFFFFFFF8) == 0;
    if (!v10)
      v9 = *a1 + 2;
    if (v9 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    v11 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v11 >= 2)
      v11 = *a2 + 2;
    if (v11 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v13 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v13 = 0;
      v14 = (_OWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      v15 = (_OWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      *v14 = *v15;
      *(_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFF8);
    }
    *((_BYTE *)a1 + v8) = v13;
  }
  v16 = (((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v17 = v16 + 24;
  v10 = v16 == -16;
  v18 = 16;
  if (!v10)
    v18 = v17;
  v19 = (_QWORD *)(((unint64_t)a1 + v18) & 0xFFFFFFFFFFFFFFF8);
  v20 = (unint64_t *)(((unint64_t)a2 + v18) & 0xFFFFFFFFFFFFFFF8);
  v21 = *v20;
  if (*v19 < 0xFFFFFFFFuLL)
  {
    if (v21 >= 0xFFFFFFFF)
    {
      v23 = v20[1];
      *v19 = v21;
      v19[1] = v23;
      goto LABEL_31;
    }
  }
  else
  {
    if (v21 >= 0xFFFFFFFF)
    {
      v22 = v20[1];
      *v19 = v21;
      v19[1] = v22;
      swift_release();
      goto LABEL_31;
    }
    swift_release();
  }
  *(_OWORD *)v19 = *(_OWORD *)v20;
LABEL_31:
  v24 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  v25 = (unint64_t *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  v26 = *v25;
  if (*v24 < 0xFFFFFFFFuLL)
  {
    if (v26 >= 0xFFFFFFFF)
    {
      v28 = v25[1];
      *v24 = v26;
      v24[1] = v28;
      return a1;
    }
LABEL_37:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    return a1;
  }
  if (v26 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_37;
  }
  v27 = v25[1];
  *v24 = v26;
  v24[1] = v27;
  swift_release();
  return a1;
}

uint64_t sub_19B563020(_DWORD *a1, unsigned int a2)
{
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v15;
  unint64_t v16;

  v4 = (((*(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = v4 + 17;
  v6 = v4 == -16;
  v7 = 9;
  if (!v6)
    v7 = v5;
  if (!a2)
    return 0;
  if (a2 < 0x7FFFFFFF)
    goto LABEL_23;
  v8 = ((v7 + 30) & 0xFFFFFFFFFFFFFFF8) + 16;
  v9 = v8 & 0xFFFFFFF8;
  v10 = a2 - 2147483645;
  if ((v8 & 0xFFFFFFF8) != 0)
    v10 = 2;
  if (v10 >= 0x10000)
    v11 = 4;
  else
    v11 = 2;
  if (v10 < 0x100)
    v12 = 1;
  else
    v12 = v11;
  if (v12 == 4)
  {
    v13 = *(_DWORD *)((char *)a1 + v8);
    if (v13)
      goto LABEL_19;
LABEL_23:
    v16 = *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    if (v16 >= 0xFFFFFFFF)
      LODWORD(v16) = -1;
    if ((v16 + 1) >= 2)
      return v16;
    else
      return 0;
  }
  if (v12 != 2)
  {
    v13 = *((unsigned __int8 *)a1 + v8);
    if (v13)
      goto LABEL_19;
    goto LABEL_23;
  }
  v13 = *(unsigned __int16 *)((char *)a1 + v8);
  if (!v13)
    goto LABEL_23;
LABEL_19:
  v15 = v13 - 1;
  if (v9)
  {
    v15 = 0;
    LODWORD(v9) = *a1;
  }
  return (v9 | v15) + 0x7FFFFFFF;
}

void sub_19B56314C(_DWORD *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;

  v6 = (((*(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = v6 + 17;
  v8 = v6 == -16;
  v9 = 9;
  if (!v8)
    v9 = v7;
  if (a3 < 0x7FFFFFFF)
  {
    v12 = 0u;
  }
  else
  {
    v10 = a3 - 2147483645;
    if ((((_DWORD)v9 + 30) & 0xFFFFFFF8) != 0xFFFFFFF0)
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v12 = 1;
    else
      v12 = v11;
  }
  if (a2 <= 0x7FFFFFFE)
    __asm { BR              X11 }
  if ((((_DWORD)v9 + 30) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    bzero(a1, ((v9 + 30) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = a2 - 0x7FFFFFFF;
  }
  __asm { BR              X10 }
}

void sub_19B56327C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_19B563284()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_WORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x19B56328CLL);
}

void sub_19B5632A4(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  *(_DWORD *)(v1 + v3) = 0;
  if (v2)
    *(_QWORD *)((v1 + a1 + 7) & 0xFFFFFFFFFFFFF8) = v2;
}

void sub_19B5632B0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

void type metadata accessor for HierarchicalStateMachine.RootState()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B5632E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_19B5632E8()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[4] = v2;
    v2[5] = "\b";
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19B563388(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v10;
  unsigned int v11;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || (v7 | 1) > 0x18)
  {
    v10 = *a2;
    *a1 = v10;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
  }
  else
  {
    v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v11 >= 2)
      v11 = *(_DWORD *)a2 + 2;
    if (v11 == 1)
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      v13 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      v16 = (_QWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      v17 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      *((_BYTE *)a1 + v7) = 0;
      swift_retain();
    }
  }
  swift_retain();
  return a1;
}

uint64_t sub_19B5634C8(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = 8;
  if (((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) != 0xFFFFFFFFFFFFFFF0)
    v5 = ((((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v6 = *((unsigned __int8 *)a1 + v5);
  v7 = v5 & 0xFFFFFFF8;
  if (v6 >= 2 && v7 != 0)
    v6 = *a1 + 2;
  if (v6 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_19B563584(_QWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *(_QWORD *)a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v11 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_retain();
    v10 = 0;
  }
  swift_retain();
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_DWORD *sub_19B563688(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v7 = 8;
    else
      v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
      v8 = *a1 + 2;
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    if (v10 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      v12 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v13 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = v13[1];
      *v12 = *v13;
      v12[1] = v14;
      v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
      v16 = (_QWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      *((_BYTE *)a1 + v7) = 0;
      swift_retain();
    }
    swift_retain();
  }
  return a1;
}

_QWORD *sub_19B563800(_QWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;
  _OWORD *v11;
  _OWORD *v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  else
    v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *(_QWORD *)a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    v10 = 0;
    v11 = (_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v12 = (_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v11 = *v12;
    *(_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFF8);
  }
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_DWORD *sub_19B5638F0(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  char v12;
  _OWORD *v13;
  _OWORD *v14;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v7 = 8;
    else
      v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
      v8 = *a1 + 2;
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    if (v10 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      v12 = 0;
      v13 = (_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8);
      v14 = (_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
      *v13 = *v14;
      *(_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFF8);
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_19B563A58(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  int v9;
  int v11;
  int v12;
  unsigned int v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = ((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v5 = 8;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_20;
  v6 = v5 | 1;
  v7 = 8 * (v5 | 1);
  if ((v5 | 1) <= 3)
  {
    v8 = (a2 + ~(-1 << v7) - 254) >> v7;
    if (v8 > 0xFFFE)
    {
      v9 = *(_DWORD *)&a1[v6];
      if (!v9)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v8 > 0xFE)
    {
      v9 = *(unsigned __int16 *)&a1[v6];
      if (!*(_WORD *)&a1[v6])
        goto LABEL_20;
      goto LABEL_13;
    }
    if (!v8)
      goto LABEL_20;
  }
  v9 = a1[v6];
  if (!a1[v6])
  {
LABEL_20:
    v13 = a1[v5];
    if (v13 >= 2)
      return (v13 ^ 0xFF) + 1;
    else
      return 0;
  }
LABEL_13:
  v11 = (v9 - 1) << v7;
  if (v6 >= 4)
    v11 = 0;
  if ((_DWORD)v6 == 1)
    v12 = *a1;
  else
    v12 = *(_DWORD *)a1;
  return (v12 | v11) + 255;
}

void sub_19B563B6C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = ((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 8;
  v8 = v7 | 1;
  if (a3 < 0xFF)
  {
    v9 = 0u;
  }
  else if (v8 <= 3)
  {
    v11 = (a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8);
    if (v11 > 0xFFFE)
    {
      v9 = 4u;
    }
    else if (v11 >= 0xFF)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 != 0;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v10 = a2 - 255;
  if (v8 < 4)
  {
    v10 &= ~(-1 << (8 * v8));
    bzero(a1, v8);
    if ((_DWORD)v8 == 1)
    {
      *a1 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    bzero(a1, v7 | 1);
  }
  *(_DWORD *)a1 = v10;
LABEL_18:
  __asm { BR              X10 }
}

uint64_t sub_19B563D28(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = ((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v3 = 8;
  result = *((unsigned __int8 *)a1 + v3);
  v5 = v3 & 0xFFFFFFF8;
  if (result >= 2 && v5 != 0)
    return (*a1 + 2);
  return result;
}

void sub_19B563DAC(unsigned int *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  size_t v5;
  char v6;
  unsigned int v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v5 = 8;
  else
    v5 = ((((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 16;
  if (a2 > 1)
  {
    if ((_DWORD)v5)
      v6 = 2;
    else
      v6 = a2;
    if ((_DWORD)v5)
      v7 = a2 - 2;
    else
      v7 = 0;
    *((_BYTE *)a1 + v5) = v6;
    bzero(a1, v5);
    *a1 = v7;
  }
  else
  {
    *((_BYTE *)a1 + v5) = a2;
  }
}

uint64_t sub_19B563E44(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  void (*v30)(char *, _QWORD);
  void (*v31)(char *);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char v49[32];
  uint64_t v50;

  v36 = a5;
  v37 = a8;
  v44 = a1;
  v45 = a2;
  v35 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  v46 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v12, v13);
  v16 = (char *)&v35 - v15;
  MEMORY[0x1E0C80A78](v14, v17, v18);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(v21 - 8);
  v39 = v21;
  MEMORY[0x1E0C80A78](v21, v22, v23);
  v25 = (char *)&v35 - v24;
  v26 = sub_19B5B9E6C();
  if (!v26)
    return sub_19B5B9D88();
  v42 = AssociatedTypeWitness;
  v27 = v26;
  v50 = sub_19B5B9CC8();
  v40 = sub_19B5B9F68();
  sub_19B5B9F44();
  v43 = v8;
  result = sub_19B5B9E60();
  if ((v27 & 0x8000000000000000) == 0)
  {
    v29 = v27;
    v41 = v20;
    while (v29)
    {
      v47 = v29;
      v30 = (void (*)(char *, _QWORD))sub_19B5B9E90();
      v31 = *(void (**)(char *))(v11 + 16);
      v32 = v11;
      v33 = v42;
      v31(v16);
      v30(v49, 0);
      v34 = v48;
      v44(v16, v46);
      if (v34)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v33);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v39);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v37, v46, v36);
      }
      v48 = 0;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v33);
      sub_19B5B9F50();
      result = sub_19B5B9E78();
      v29 = v47 - 1;
      v11 = v32;
      if (v47 == 1)
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v39);
        return v50;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_19B564134(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v2 = v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v6, v7);
  v10 = (char *)&v18 - v9;
  MEMORY[0x1E0C80A78](v8, v11, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, v2, a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, AssociatedTypeWitness) == 1)
    return 0x3E746F6F723CLL;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v14, AssociatedTypeWitness);
  v16 = sub_19B5B9FD4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, AssociatedTypeWitness);
  return v16;
}

void sub_19B564270()
{
  sub_19B56208C();
}

uint64_t sub_19B564278(uint64_t a1)
{
  return sub_19B564134(a1);
}

void _s4NodeO13NodeStateTypeOMa()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B56428C()
{
  return swift_deallocObject();
}

uint64_t sub_19B56429C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55D164;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_19B564300(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_19B564310(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_19B564320()
{
  _s4NodeOMa();
}

void sub_19B564364()
{
  sub_19B56208C();
}

uint64_t sub_19B564370(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

unint64_t sub_19B564390()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3F6DF0[0];
  if (!qword_1EE3F6DF0[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DE8);
    result = MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, qword_1EE3F6DF0);
  }
  return result;
}

uint64_t sub_19B5643DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  _QWORD v17[6];

  MEMORY[0x1E0C80A78](a1, v3, a2);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = a1[3];
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    v13 = a1[7];
    v17[0] = a1[2];
    v17[1] = v9;
    v17[2] = v10;
    v17[3] = v11;
    v17[4] = v12;
    v17[5] = v13;
    _s4NodeO13NodeStateTypeOMa();
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  swift_getTupleTypeMetadata3();
  swift_release();
  swift_release();
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a3, v7, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_19B5645A0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  _OWORD v16[3];

  v4 = v3;
  MEMORY[0x1E0C80A78](a1, v4, a3);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload, v10, v11);
    strcpy((char *)&v16[-4], "nodeState eventHandler stateTransitionHandler substates ");
    v12 = a1[2];
    v16[0] = a1[1];
    v16[1] = v12;
    v16[2] = a1[3];
    _s4NodeO13NodeStateTypeOMa();
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  v14 = *(_QWORD *)&v7[*(int *)(swift_getTupleTypeMetadata3() + 48)];
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v7, AssociatedTypeWitness);
  return v14;
}

uint64_t sub_19B5647A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedTypeWitness;
  _QWORD v22[10];

  v7 = *(a2 - 1);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, _QWORD *))(v7 + 16))(v9, v10, a2);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    v22[1] = v22;
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload, v12, v13);
    strcpy((char *)&v22[-8], "nodeState eventHandler stateTransitionHandler substates ");
    v14 = a2[2];
    v15 = a2[3];
    v16 = a2[4];
    v17 = a2[5];
    v22[2] = a4;
    v22[0] = a1;
    v18 = a2[6];
    v19 = a2[7];
    v22[4] = v14;
    v22[5] = v15;
    v22[6] = v16;
    v22[7] = v17;
    v22[8] = v18;
    v22[9] = v19;
    _s4NodeO13NodeStateTypeOMa();
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  swift_getTupleTypeMetadata3();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 56))(a4, 1, 1, a2);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v9, AssociatedTypeWitness);
}

uint64_t sub_19B564A70(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t AssociatedTypeWitness;
  uint64_t TupleTypeMetadata3;
  uint64_t v15;
  _OWORD v17[3];

  v4 = v3;
  MEMORY[0x1E0C80A78](a1, v4, a3);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload, v10, v11);
    strcpy((char *)&v17[-4], "nodeState eventHandler stateTransitionHandler substates ");
    v12 = a1[2];
    v17[0] = a1[1];
    v17[1] = v12;
    v17[2] = a1[3];
    _s4NodeO13NodeStateTypeOMa();
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  swift_release();
  v15 = *(_QWORD *)&v7[*(int *)(TupleTypeMetadata3 + 64)];
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v7, AssociatedTypeWitness);
  return v15;
}

void sub_19B564C78()
{
  _s4NodeO13NodeStateTypeOMa();
}

uint64_t sub_19B564CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t EnumCaseMultiPayload;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t TupleTypeMetadata;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v60[96];

  *(_QWORD *)(v9 - 200) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v9 - 192) = a1;
  v10 = MEMORY[0x1E0C80A78](a1, a2, a3);
  *(_QWORD *)(v9 - 184) = &v60[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v10, v12, v13);
  *(_QWORD *)(v9 - 152) = &v60[-v14];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v9 - 168) = *(_QWORD *)(AssociatedTypeWitness - 8);
  v18 = MEMORY[0x1E0C80A78](AssociatedTypeWitness, v16, v17);
  v20 = &v60[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = MEMORY[0x1E0C80A78](v18, v21, v22);
  v25 = &v60[-v24];
  MEMORY[0x1E0C80A78](v23, v26, v27);
  v29 = (uint64_t *)&v60[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v30 + 16))(v29, *(_QWORD *)(v9 - 160), v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 1)
  {
    *(_QWORD *)(v9 - 256) = v20;
    *(_QWORD *)(v9 - 240) = v8;
    *(_QWORD *)(v9 - 232) = v3;
    *(_QWORD *)(v9 - 224) = v7;
    *(_QWORD *)(v9 - 216) = v4;
    v34 = *v29;
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload, v32, v33);
    strcpy(&v60[-64], "nodeState eventHandler stateTransitionHandler substates ");
    v35 = *(_QWORD *)(v9 - 192);
    *(_QWORD *)(v9 - 136) = v35;
    v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
    *(_QWORD *)(v9 - 128) = v36;
    *(_QWORD *)(v9 - 120) = v36;
    *(_QWORD *)(v9 - 112) = sub_19B5B9DC4();
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v38 = swift_projectBox();
    *(_QWORD *)(v9 - 248) = *(_QWORD *)(v38 + *(int *)(TupleTypeMetadata + 80));
    v39 = *(_QWORD *)(v9 - 200);
    v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16);
    v41 = *(_QWORD *)(v9 - 152);
    v40(v41, v38, v35);
    v42 = *(_QWORD *)(v9 - 184);
    v40(v42, v41, v35);
    v43 = *(_QWORD *)(v9 - 168);
    v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v42, 1, AssociatedTypeWitness);
    *(_QWORD *)(v9 - 160) = v34;
    if (v44 == 1)
    {
      v45 = (*(uint64_t (**)(_QWORD, uint64_t))(v39 + 8))(*(_QWORD *)(v9 - 184), v35);
      v48 = *(_QWORD *)(v9 - 176);
      v49 = *(_QWORD *)(v9 - 216);
LABEL_7:
      *(_QWORD *)(v9 - 136) = *(_QWORD *)(v9 - 248);
      MEMORY[0x1E0C80A78](v45, v46, v47);
      v56 = *(_QWORD *)(v9 - 208);
      *(_QWORD *)&v60[-64] = v49;
      *(_QWORD *)&v60[-56] = v56;
      *(_QWORD *)&v60[-48] = *(_QWORD *)(v9 - 224);
      *(_QWORD *)&v60[-40] = v5;
      v57 = *(_QWORD *)(v9 - 240);
      *(_QWORD *)&v60[-32] = *(_QWORD *)(v9 - 232);
      *(_QWORD *)&v60[-24] = v57;
      *(_QWORD *)&v60[-16] = v48;
      v58 = sub_19B5B9DC4();
      MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v58);
      v51 = sub_19B5B9D58();
      (*(void (**)(_QWORD, uint64_t))(v39 + 8))(*(_QWORD *)(v9 - 152), v35);
      swift_release();
      return v51 & 1;
    }
    v52 = *(_QWORD *)(v9 - 256);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 32))(v52, *(_QWORD *)(v9 - 184), AssociatedTypeWitness);
    v49 = *(_QWORD *)(v9 - 216);
    swift_getAssociatedConformanceWitness();
    v48 = *(_QWORD *)(v9 - 176);
    v53 = sub_19B5B9CE0();
    v54 = v52;
    v55 = *(_QWORD *)(v9 - 152);
    v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(v54, AssociatedTypeWitness);
    if ((v53 & 1) == 0)
      goto LABEL_7;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v55, v35);
    swift_release();
    v51 = 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    v50 = *(_QWORD *)(v9 - 168);
    (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v50 + 32))(v25, v29, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    v51 = sub_19B5B9CE0();
    (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v25, AssociatedTypeWitness);
  }
  return v51 & 1;
}

void sub_19B565144()
{
  sub_19B56515C();
}

uint64_t sub_19B565150(char a1)
{
  return a1 & 1;
}

void sub_19B56515C()
{
  _s4NodeOMa();
}

void sub_19B565198()
{
  sub_19B564C78();
}

uint64_t sub_19B5651A8(char a1)
{
  return a1 & 1;
}

uint64_t sub_19B5651C4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_19B5651CC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19B565238(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  int v6;
  size_t v7;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (*(_DWORD *)(v5 + 84))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v5 + 64) + 1;
  if (*(_DWORD *)(v5 + 80) > 7u || (v6 & 0x100000) != 0 || v7 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v11 = AssociatedTypeWitness;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v11);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_19B565330(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t result;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, AssociatedTypeWitness);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  return result;
}

void *sub_19B5653B4(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84))
      v6 = *(_QWORD *)(v5 + 64);
    else
      v6 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *sub_19B56546C(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  size_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, AssociatedTypeWitness);
  v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *sub_19B565570(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84))
      v6 = *(_QWORD *)(v5 + 64);
    else
      v6 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *sub_19B565628(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  size_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, AssociatedTypeWitness);
  v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t sub_19B56572C(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v13;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  if (a2 > v6)
  {
    v8 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (v9)
        goto LABEL_15;
    }
    else
    {
      if (v10 <= 0xFF)
      {
        if (v10 < 2)
          goto LABEL_22;
LABEL_8:
        v9 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_22;
LABEL_15:
        v11 = (v9 - 1) << v8;
        if (v7 > 3)
          v11 = 0;
        if ((_DWORD)v7)
        {
          if (v7 > 3)
            LODWORD(v7) = 4;
          __asm { BR              X12 }
        }
        return v6 + v11 + 1;
      }
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v5 < 2)
    return 0;
  v13 = (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
  if (v13 >= 2)
    return v13 - 1;
  else
    return 0;
}

void sub_19B56588C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v6 = 0u;
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  if (a3 > v9)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 >= a2)
LABEL_20:
        __asm { BR              X11 }
LABEL_13:
      v12 = ~v9 + a2;
      if (v10 < 4)
      {
        if ((_DWORD)v10)
        {
          v13 = v12 & ~(-1 << (8 * v10));
          bzero(a1, v10);
          if ((_DWORD)v10 == 3)
          {
            *(_WORD *)a1 = v13;
            a1[2] = BYTE2(v13);
          }
          else if ((_DWORD)v10 == 2)
          {
            *(_WORD *)a1 = v13;
          }
          else
          {
            *a1 = v13;
          }
        }
      }
      else
      {
        bzero(a1, v10);
        *(_DWORD *)a1 = v12;
      }
      __asm { BR              X10 }
    }
    v11 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v11))
    {
      v6 = 4u;
      if (v9 >= a2)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v11 >= 0x100)
      v6 = 2;
    else
      v6 = v11 > 1;
  }
  if (v9 >= a2)
    goto LABEL_20;
  goto LABEL_13;
}

void sub_19B565A58()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_19B565A60()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_19B565A84(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(a1, 1, AssociatedTypeWitness);
}

uint64_t sub_19B565AD8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, a2, 1, AssociatedTypeWitness);
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t TupleTypeMetadata2;
  _QWORD *v17;
  _QWORD *v18;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v17 = (_QWORD *)(a8 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a8, a1, a2);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a2;
  v18[3] = a3;
  v18[4] = a4;
  v18[5] = a5;
  v18[6] = a6;
  v18[7] = a7;
  *v17 = &unk_1EE3F6E80;
  v17[1] = v18;
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(a8, 0, 2, TupleTypeMetadata2);
}

uint64_t sub_19B565C24()
{
  uint64_t v0;

  return sub_19B566A34(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_19B565C30()
{
  return swift_deallocObject();
}

uint64_t sub_19B565C40()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  return sub_19B55D164();
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t TupleTypeMetadata2;
  _QWORD *v18;
  _QWORD *v19;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = (_QWORD *)(a9 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(a9, a1, a4);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a10;
  v19[8] = a2;
  v19[9] = a3;
  *v18 = &unk_1EE3F6E90;
  v18[1] = v19;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(a9, 0, 2, TupleTypeMetadata2);
  return swift_retain();
}

uint64_t sub_19B565D8C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_19B55FFB4;
  return v5();
}

uint64_t sub_19B565DE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B565E04()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 64);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_19B55D164;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_19B55FFB4;
  return v6();
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t TupleTypeMetadata2;
  _QWORD *v11;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = (_QWORD *)(a5 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(a5, a1, a4);
  *v11 = a2;
  v11[1] = a3;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(a5, 0, 2, TupleTypeMetadata2);
  return swift_retain();
}

uint64_t sub_19B565F34()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19B565FAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
LABEL_14:
    swift_retain();
    return a1;
  }
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    v11 = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    if (v11 >= 0xFFFFFFFF)
      LODWORD(v11) = -1;
    if ((_DWORD)v11 != -1)
      goto LABEL_9;
    goto LABEL_13;
  }
  if (!(*(unsigned int (**)(uint64_t *))(v6 + 48))(a2))
  {
LABEL_13:
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v12 = (_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    v13 = v12[1];
    v14 = (_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v14 = *v12;
    v14[1] = v13;
    goto LABEL_14;
  }
LABEL_9:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

uint64_t sub_19B5660C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  if (*(_DWORD *)(v4 + 84) >= 0x7FFFFFFFu)
  {
    result = (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
    if ((_DWORD)result)
      return result;
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
    return swift_release();
  }
  v6 = *(_QWORD *)((a1 + *(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFF8);
  if (v6 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  result = (v6 + 1);
  if ((_DWORD)v6 == -1)
    goto LABEL_7;
  return result;
}

void *sub_19B56616C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    v8 = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    if (v8 >= 0xFFFFFFFF)
      LODWORD(v8) = -1;
    if ((_DWORD)v8 != -1)
      goto LABEL_3;
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    v9 = (_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    v10 = v9[1];
    v11 = (_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v11 = *v9;
    v11[1] = v10;
    swift_retain();
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v6 + 48))(a2))
    goto LABEL_7;
LABEL_3:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

void *sub_19B566248(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 >= 0x7FFFFFFF)
  {
    v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
    v10 = v9(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16));
    v11 = v9(a2, v7, v5);
    if (v10)
      goto LABEL_3;
LABEL_8:
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      v17 = (_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
      v18 = (_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      swift_retain();
      swift_release();
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    swift_release();
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  v16 = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  v11 = v16 + 1;
  if (v15 >= 0xFFFFFFFF)
    goto LABEL_8;
LABEL_3:
  if (v11)
  {
LABEL_10:
    memcpy(a1, a2, ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
  v12 = (_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  v14 = (_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v12;
  v14[1] = v13;
  swift_retain();
  return a1;
}

void *sub_19B5663D8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    v8 = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    if (v8 >= 0xFFFFFFFF)
      LODWORD(v8) = -1;
    if ((_DWORD)v8 != -1)
      goto LABEL_3;
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    *(_OWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v6 + 48))(a2))
    goto LABEL_7;
LABEL_3:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

void *sub_19B5664B0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 >= 0x7FFFFFFF)
  {
    v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
    v10 = v9(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16));
    v11 = v9(a2, v7, v5);
    if (v10)
      goto LABEL_3;
LABEL_8:
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      *(_OWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      swift_release();
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    swift_release();
    goto LABEL_10;
  }
  v12 = *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  v13 = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v11 = v13 + 1;
  if (v12 >= 0xFFFFFFFF)
    goto LABEL_8;
LABEL_3:
  if (v11)
  {
LABEL_10:
    memcpy(a1, a2, ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
  *(_OWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19B566634(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  unint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 - 2 < a2)
  {
    v8 = a2 - v6 + 3;
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    __asm { BR              X15 }
  }
  if (v5 < 0x7FFFFFFF)
  {
    v13 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    if (v13 >= 0xFFFFFFFF)
      LODWORD(v13) = -1;
    v12 = v13 + 1;
  }
  else
  {
    v12 = (*(uint64_t (**)(void))(v4 + 48))();
  }
  if (v12 >= 3)
    return v12 - 2;
  else
    return 0;
}

void sub_19B566760(int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = v6 - 2;
  if (v6 - 2 >= a3)
  {
    v10 = 0u;
    if (v7 >= a2)
      goto LABEL_16;
  }
  else
  {
    v8 = a3 - v6 + 3;
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (v7 >= a2)
LABEL_16:
      __asm { BR              X13 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = a2 - v6 + 1;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_19B566860()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x19B566914);
}

void sub_19B566868(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x19B566870);
  JUMPOUT(0x19B566914);
}

void sub_19B5668CC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B566914);
}

void sub_19B5668D4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B566914);
}

uint64_t sub_19B5668DC(uint64_t a1, int a2, unsigned int a3)
{
  int v3;
  uint64_t v5;
  unsigned int v6;
  int *v7;
  size_t v8;

  *(_WORD *)((char *)v7 + v8) = 0;
  if (!a2)
LABEL_8:
    JUMPOUT(0x19B566914);
  if (a2 + 2 > v6)
  {
    if ((_DWORD)v8)
    {
      v3 = a2 - v6 + 1;
      bzero(v7, v8);
      *v7 = v3;
    }
    goto LABEL_8;
  }
  if (a2 == -2)
    goto LABEL_8;
  if (a3 < 0x7FFFFFFF)
    JUMPOUT(0x19B5668E8);
  return (*(uint64_t (**)(int *, _QWORD))(v5 + 56))(v7, (a2 + 2));
}

uint64_t sub_19B56692C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  if (*(_DWORD *)(v2 + 84) >= 0x7FFFFFFFu)
    return (*(uint64_t (**)(void))(v2 + 48))();
  v4 = *(_QWORD *)((a1 + *(_QWORD *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFF8);
  if (v4 >= 0xFFFFFFFF)
    LODWORD(v4) = -1;
  return (v4 + 1);
}

void sub_19B566974(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (a2)
    {
      if (v5 < 0x7FFFFFFF)
      {
        v9 = (_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
        if ((a2 & 0x80000000) != 0)
        {
          *v9 = a2 ^ 0x80000000;
          v9[1] = 0;
        }
        else
        {
          *v9 = a2 - 1;
        }
      }
      else
      {
        (*(void (**)(_DWORD *))(v4 + 56))(a1);
      }
    }
  }
  else if ((((_DWORD)v7 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v8 = ~v6 + a2;
    bzero(a1, (((_DWORD)v7 + 7) & 0xFFFFFFF8) + 16);
    *a1 = v8;
  }
}

void type metadata accessor for HierarchicalStateMachine.EventReaction()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B566A34(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t StateMachine.Error.description.getter()
{
  sub_19B5B9F08();
  swift_bridgeObjectRelease();
  sub_19B5B9D04();
  sub_19B5B9D04();
  return 0xD000000000000013;
}

_QWORD *_s5ErrorOwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5ErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s5ErrorOwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *_s5ErrorOwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5ErrorOwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s5ErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_19B566C0C()
{
  return 0;
}

ValueMetadata *type metadata accessor for StateMachine.Error()
{
  return &type metadata for StateMachine.Error;
}

uint64_t unwrap<A>(_:_:fileID:function:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v22[4] = a6;
  v23 = a7;
  v22[2] = a4;
  v22[3] = a5;
  v22[1] = a3;
  v12 = sub_19B5B9EC0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14, v15);
  v17 = (char *)v22 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v22 - v16, a1, v12);
  v18 = *(_QWORD *)(a9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, a9) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a8, v17, a9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_19B5B9F08();
  swift_bridgeObjectRelease();
  if (a2)
  {
    v24 = 0xD000000000000011;
    v25 = 0x800000019B5C1CF0;
    sub_19B5B9D04();
    sub_19B5B9D04();
  }
  else
  {
    v24 = 0xD00000000000001DLL;
    v25 = 0x800000019B5C1CD0;
  }
  sub_19B5B9D04();
  sub_19B5B9D04();
  sub_19B5B9D04();
  sub_19B5B9D04();
  v26 = v23;
  sub_19B5B9FD4();
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  _s12HMFoundation4FlowO5erroryySSFZ_0();
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_19B5B9CEC();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_hmfErrorWithCode_reason_, 19, v21);

  return swift_willThrow();
}

uint64_t HMF.VisibleDevice.init(idsIdentifierString:mediaRouteIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t HMF.VisibleDevice.idsIdentifierString.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.VisibleDevice.mediaRouteIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _s13VisibleDeviceVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s13VisibleDeviceVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s13VisibleDeviceVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s13VisibleDeviceVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *_s13VisibleDeviceVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13VisibleDeviceVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13VisibleDeviceVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.VisibleDevice()
{
  return &type metadata for HMF.VisibleDevice;
}

void *sub_19B5670CC(_OWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  _OWORD *v12;
  __int128 v13;

  v3 = v1[1];
  v4 = v1[3];
  v5 = v1[4];
  if (v3)
    v6 = v1[2];
  else
    v6 = 0;
  if (v4)
    v7 = v5;
  else
    v7 = 0;
  if (!v3)
  {
    if (!v4)
    {
      v12 = (_OWORD *)swift_allocObject();
      v13 = a1[2];
      v12[1] = a1[1];
      v12[2] = v13;
      v12[3] = a1[3];
      v10 = &unk_1EE3F7968;
      goto LABEL_11;
    }
    sub_19B564300(0);
  }
  v8 = swift_allocObject();
  v9 = a1[2];
  *(_OWORD *)(v8 + 16) = a1[1];
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = a1[3];
  *(_QWORD *)(v8 + 64) = v3;
  *(_QWORD *)(v8 + 72) = v6;
  *(_QWORD *)(v8 + 80) = v4;
  *(_QWORD *)(v8 + 88) = v7;
  v10 = &unk_1EE3F7978;
LABEL_11:
  sub_19B564300(v3);
  sub_19B564300(v4);
  return v10;
}

void HierarchicalStateMachine.__allocating_init(stateValueType:eventType:delegateEventType:builder:)()
{
  type metadata accessor for HierarchicalStateMachine.RootState();
}

void sub_19B567214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = MEMORY[0x1E0C80A78](a1, a2, a3);
  *(_QWORD *)(v10 - 208) = (char *)&a9 - v12;
  v9(v11);
  v13 = *(_QWORD *)(v10 - 144);
  v15 = *(_QWORD *)(v10 - 136);
  v14 = *(_QWORD *)(v10 - 128);
  v17 = *(_QWORD *)(v10 - 120);
  v16 = *(_QWORD *)(v10 - 112);
  v19 = *(_QWORD *)(v10 - 104);
  v18 = *(_QWORD *)(v10 - 96);
  v20 = *(_QWORD *)(v10 - 88);
  *(_QWORD *)(v10 - 152) = *(_QWORD *)(v10 - 152);
  *(_QWORD *)(v10 - 144) = v13;
  *(_QWORD *)(v10 - 136) = v15;
  *(_QWORD *)(v10 - 128) = v14;
  *(_QWORD *)(v10 - 120) = v17;
  *(_QWORD *)(v10 - 112) = v16;
  *(_QWORD *)(v10 - 104) = v19;
  *(_QWORD *)(v10 - 96) = v18;
  *(_QWORD *)(v10 - 216) = v18;
  *(_QWORD *)(v10 - 88) = v20;
  swift_bridgeObjectRetain();
  sub_19B564300(v13);
  sub_19B564300(v14);
  sub_19B564300(v16);
  sub_19B564300(v18);
  sub_19B55FFB8();
}

void sub_19B5672C8()
{
  HierarchicalStateMachine.__allocating_init(rootState:)();
}

uint64_t sub_19B5672D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_19B564310(v3);
  sub_19B564310(v2);
  sub_19B564310(v1);
  sub_19B564310(*(_QWORD *)(v4 - 216));
  return a1;
}

uint64_t static HierarchicalStateMachine.makeStartedMachine(initialValue:eventType:delegateEventType:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

void sub_19B567354()
{
  HierarchicalStateMachine.__allocating_init(stateValueType:eventType:delegateEventType:builder:)();
}

uint64_t sub_19B567374(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;

  v1[8] = a1;
  v2 = (_QWORD *)swift_task_alloc();
  v1[9] = (uint64_t)v2;
  *v2 = v1;
  v2[1] = sub_19B5673B8;
  return HierarchicalStateMachine.start(with:)(v1[2]);
}

uint64_t sub_19B5673B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *v0;
  v3 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(*(_QWORD *)(v1 + 64));
}

void sub_19B567400()
{
  swift_bridgeObjectRetain();
  _s4NodeOMa();
}

uint64_t sub_19B567460()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v9);
  result = sub_19B5B9DA0();
  v11 = v1[1];
  if (v11)
  {
    v7 = v1[2];
  }
  else
  {
    result = sub_19B564300(v8);
    v11 = v8;
  }
  v1[1] = v11;
  v1[2] = v7;
  v12 = v1[3];
  if (v12)
  {
    v5 = v1[4];
  }
  else
  {
    result = sub_19B564300(v6);
    v12 = v6;
  }
  v1[3] = v12;
  v1[4] = v5;
  v13 = v1[5];
  if (v13)
  {
    v3 = v1[6];
  }
  else
  {
    result = sub_19B564300(v4);
    v13 = v4;
  }
  v1[5] = v13;
  v1[6] = v3;
  v14 = v1[7];
  if (v14)
  {
    v0 = v1[8];
  }
  else
  {
    result = sub_19B564300(v2);
    v14 = v2;
  }
  v1[7] = v14;
  v1[8] = v0;
  return result;
}

uint64_t sub_19B567544(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_19B55FFB4;
  return v5();
}

void sub_19B567598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  *(_QWORD *)(v11 + 104) = a7;
  *(_QWORD *)(v11 + 112) = a8;
  *(_QWORD *)(v11 + 88) = a5;
  *(_QWORD *)(v11 + 96) = a6;
  *(_QWORD *)(v11 + 72) = a3;
  *(_QWORD *)(v11 + 80) = a4;
  *(_QWORD *)(v11 + 56) = a11;
  *(_QWORD *)(v11 + 64) = a1;
  *(_QWORD *)(v11 + 16) = a7;
  *(_QWORD *)(v11 + 24) = a8;
  *(_OWORD *)(v11 + 32) = a9;
  *(_QWORD *)(v11 + 48) = a10;
  type metadata accessor for HierarchicalStateMachine.StateTransition();
}

uint64_t sub_19B5675E0(uint64_t a1)
{
  _QWORD *v1;

  v1[15] = a1;
  v1[16] = *(_QWORD *)(a1 - 8);
  v1[17] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B567620()
{
  _QWORD *v0;
  char *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[16] + 16))(v0[17], v0[8], v0[15]);
  v1 = (char *)sub_19B567680 + 4 * byte_19B5C61B0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_19B567680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t TupleTypeMetadata3;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v5 = v1 + *(int *)(TupleTypeMetadata3 + 48);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
  v6(v1 + *(int *)(TupleTypeMetadata3 + 64), v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  v6(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56779C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B5677F0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B567830()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void static HierarchicalStateMachine.RootState.RootStateBuilder.buildBlock(_:)()
{
  _s4NodeOMa();
}

void sub_19B5678E0()
{
  uint64_t v0;

  sub_19B5B9CC8();
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components();
}

uint64_t sub_19B567920()
{
  uint64_t v0;

  v0 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v0);
  return sub_19B5B9D4C();
}

void sub_19B567990()
{
  type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components();
}

void sub_19B5679E0()
{
  sub_19B567400();
}

void static HierarchicalStateMachine.RootState.RootStateBuilder.buildExpression(_:)()
{
  sub_19B567B84();
}

{
  sub_19B567B84();
}

{
  swift_retain();
  _s4NodeOMa();
}

{
  swift_retain();
  _s4NodeOMa();
}

{
  swift_retain();
  _s4NodeOMa();
}

{
  swift_retain();
  _s4NodeOMa();
}

void sub_19B567A30(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t TupleTypeMetadata3;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v8 = (_QWORD *)(a2 + *(int *)(TupleTypeMetadata3 + 48));
  v9 = (_QWORD *)(a2 + *(int *)(TupleTypeMetadata3 + 64));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v3, AssociatedTypeWitness);
  v10 = *(int *)(a1 + 72);
  v11 = (_QWORD *)(v3 + *(int *)(a1 + 68));
  v12 = v11[1];
  *v8 = *v11;
  v8[1] = v12;
  v13 = v3 + v10;
  v14 = *(_QWORD *)(v3 + v10);
  v15 = *(_QWORD *)(v13 + 8);
  *v9 = v14;
  v9[1] = v15;
  _s4NodeOMa();
}

uint64_t sub_19B567B18()
{
  swift_storeEnumTagMultiPayload();
  swift_retain();
  return swift_retain();
}

void sub_19B567B84()
{
  _s4NodeOMa();
}

double sub_19B567BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  void (*v10)(uint64_t);
  uint64_t (*v11)(_QWORD, uint64_t *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_19B5B9FE0();
  swift_allocObject();
  v7 = sub_19B5B9D64();
  v12 = v6;
  v13 = v5;
  v14 = v4;
  v15 = v3;
  v16 = v2;
  v17 = v1;
  v8 = v11(0, &v12);
  v10(v8);
  sub_19B5B9DC4();
  *(_QWORD *)v0 = v7;
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

void sub_19B567C90()
{
  _s4NodeO13NodeStateTypeOMa();
}

void sub_19B567D40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 120) = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  *(_QWORD *)(v1 - 112) = v2;
  *(_QWORD *)(v1 - 104) = v2;
  _s4NodeOMa();
}

void sub_19B567D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t *a15)
{
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int *TupleTypeMetadata;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t AssociatedTypeWitness;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;

  *(_QWORD *)(v17 - 96) = sub_19B5B9DC4();
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  v30 = swift_allocBox();
  v20 = v19;
  v21 = (_QWORD *)(v19 + TupleTypeMetadata[12]);
  v22 = (_QWORD *)(v19 + TupleTypeMetadata[16]);
  v23 = TupleTypeMetadata[20];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v20, v15, AssociatedTypeWitness);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v20, 0, 1, AssociatedTypeWitness);
  v26 = (_QWORD *)(v15 + v16[18]);
  v27 = v26[1];
  *v21 = *v26;
  v21[1] = v27;
  v28 = (_QWORD *)(v15 + v16[19]);
  v29 = v28[1];
  *v22 = *v28;
  v22[1] = v29;
  *(_QWORD *)(v20 + v23) = *(_QWORD *)(v15 + v16[17]);
  *a15 = v30;
  _s4NodeOMa();
}

uint64_t sub_19B567E74()
{
  swift_storeEnumTagMultiPayload();
  swift_retain();
  swift_retain();
  return swift_bridgeObjectRetain();
}

double sub_19B567F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)v0 = sub_19B5B9CC8();
  *(_QWORD *)(v0 + 8) = v2;
  *(_QWORD *)(v0 + 16) = v1;
  result = 0.0;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

double sub_19B567FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)v0 = sub_19B5B9CC8();
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v0 + 32) = v1;
  result = 0.0;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

double sub_19B568054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)v0 = sub_19B5B9CC8();
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_QWORD *)(v0 + 40) = v2;
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  return result;
}

double sub_19B5680F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)v0 = sub_19B5B9CC8();
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = v1;
  return result;
}

void sub_19B56812C()
{
  swift_bridgeObjectRetain();
  _s4NodeOMa();
}

uint64_t sub_19B56817C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v5);
  result = sub_19B5B9DA0();
  v7 = v1[1];
  if (v7)
  {
    v3 = v1[2];
  }
  else
  {
    result = sub_19B564300(v4);
    v7 = v4;
  }
  v1[1] = v7;
  v1[2] = v3;
  v8 = v1[3];
  if (v8)
  {
    v0 = v1[4];
  }
  else
  {
    result = sub_19B564300(v2);
    v8 = v2;
  }
  v1[3] = v8;
  v1[4] = v0;
  return result;
}

void static HierarchicalStateMachine.RootState.CompositeStateBuilder.buildBlock(_:)()
{
  _s4NodeOMa();
}

void sub_19B568264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_19B5B9CC8();
  *(_QWORD *)(v6 - 112) = v5;
  *(_QWORD *)(v6 - 104) = v4;
  *(_QWORD *)(v6 - 96) = v3;
  *(_QWORD *)(v6 - 88) = v2;
  *(_QWORD *)(v6 - 80) = v1;
  *(_QWORD *)(v6 - 72) = v0;
  type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components();
}

uint64_t sub_19B56829C()
{
  uint64_t v0;

  v0 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v0);
  return sub_19B5B9D4C();
}

void sub_19B568308()
{
  type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components();
}

void sub_19B56834C()
{
  sub_19B56812C();
}

void static HierarchicalStateMachine.RootState.CompositeStateBuilder.buildExpression(_:)()
{
  sub_19B5683CC();
}

{
  sub_19B5683CC();
}

{
  swift_retain();
  _s4NodeOMa();
}

{
  swift_retain();
  _s4NodeOMa();
}

void sub_19B5683CC()
{
  _s4NodeOMa();
}

double sub_19B56842C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  void (*v10)(uint64_t);
  uint64_t (*v11)(_QWORD, uint64_t *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_19B5B9FE0();
  swift_allocObject();
  v7 = sub_19B5B9D64();
  v12 = v6;
  v13 = v5;
  v14 = v4;
  v15 = v3;
  v16 = v2;
  v17 = v1;
  v8 = v11(0, &v12);
  v10(v8);
  sub_19B5B9DC4();
  *(_QWORD *)v0 = v7;
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  return result;
}

uint64_t sub_19B568530()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = sub_19B5B9CC8();
  *v0 = result;
  v0[1] = v2;
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v1;
  return result;
}

uint64_t sub_19B5685C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = sub_19B5B9CC8();
  *v0 = result;
  v0[1] = 0;
  v0[2] = 0;
  v0[3] = v2;
  v0[4] = v1;
  return result;
}

uint64_t *sub_19B5685F0(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = result[2];
  v2 = result[3];
  v4 = *v1;
  if (*v1)
  {
    v5 = v1[1];
  }
  else
  {
    v4 = *result;
    v5 = result[1];
    result = (uint64_t *)sub_19B564300(*result);
  }
  *v1 = v4;
  v1[1] = v5;
  v6 = v1[2];
  if (v6)
  {
    v2 = v1[3];
  }
  else
  {
    result = (uint64_t *)sub_19B564300(v3);
    v6 = v3;
  }
  v1[2] = v6;
  v1[3] = v2;
  return result;
}

void static HierarchicalStateMachine.RootState.StateBuilder.buildBlock(_:)()
{
  type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components();
}

uint64_t sub_19B5686AC()
{
  uint64_t v0;

  v0 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v0);
  return sub_19B5B9D4C();
}

void sub_19B568710()
{
  type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components();
}

uint64_t *sub_19B568748()
{
  uint64_t v1;

  return sub_19B5685F0(&v1);
}

uint64_t static HierarchicalStateMachine.RootState.StateBuilder.buildExpression(_:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  a2[2] = 0;
  a2[3] = 0;
  return swift_retain();
}

{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = v2;
  a2[3] = v3;
  return swift_retain();
}

void HierarchicalStateMachine.RootState.BuilderTypes.State.init(_:eventHandler:stateTransitionHandler:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a2, a1, AssociatedTypeWitness);
  type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State();
}

uint64_t sub_19B56881C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)(v3 + *(int *)(result + 68));
  *v4 = v2;
  v4[1] = v1;
  v5 = (_QWORD *)(v3 + *(int *)(result + 72));
  *v5 = v6;
  v5[1] = v7;
  return result;
}

void HierarchicalStateMachine.RootState.BuilderTypes.State.init(_:builder:)(uint64_t a1@<X0>, void (*a2)(_QWORD *__return_ptr)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD v21[6];

  a2(v21);
  v16 = v21[0];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a8, a1, AssociatedTypeWitness);
  if (v16)
  {
    v18 = a5;
    v19 = a9;
  }
  else
  {
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = a3;
    v20[3] = a4;
    v20[4] = a5;
    v20[5] = a6;
    v18 = a5;
    v19 = a9;
    v20[6] = a7;
    v20[7] = a9;
  }
  v21[0] = a3;
  v21[1] = a4;
  v21[2] = v18;
  v21[3] = a6;
  v21[4] = a7;
  v21[5] = v19;
  type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State();
}

_QWORD *sub_19B56896C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *result;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = (_QWORD *)(v19 + *(int *)(a1 + 68));
  *v9 = v8;
  v9[1] = v3;
  sub_19B564300(v4);
  if (v17)
  {
    sub_19B564300(v17);
    sub_19B564310(v4);
    sub_19B564310(v17);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v2;
    v10[3] = v5;
    v10[4] = v1;
    v10[5] = v15;
    v10[6] = v7;
    v10[7] = v6;
    v11 = &unk_1EE3F6F58;
    v10[8] = v17;
    v10[9] = v18;
    v12 = v15;
  }
  else
  {
    sub_19B564310(v4);
    sub_19B564310(0);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v2;
    v10[3] = v5;
    v12 = v15;
    v10[4] = v1;
    v10[5] = v15;
    v11 = &unk_1EE3F6F38;
    v10[6] = v7;
    v10[7] = v6;
  }
  result = (_QWORD *)swift_allocObject();
  result[2] = v2;
  result[3] = v5;
  result[4] = v1;
  result[5] = v12;
  result[6] = v7;
  result[7] = v6;
  result[8] = v11;
  result[9] = v10;
  v14 = (_QWORD *)(v19 + *(int *)(a1 + 72));
  *v14 = &unk_1EE3F6F48;
  v14[1] = result;
  return result;
}

uint64_t sub_19B568AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_19B568AC8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_19B55FFB4;
  return v9(a2, a3);
}

uint64_t sub_19B568B34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_19B55FFB4;
  return v6();
}

void HierarchicalStateMachine.RootState.BuilderTypes.CompositeState.init(_:eventHandler:stateTransitionHandler:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);
  _s4NodeOMa();
}

void sub_19B568C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_19B5B9D88();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState();
}

_QWORD *sub_19B568C7C(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *result;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v13 + a1[17]) = v1;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = v3;
  v9[4] = v2;
  v9[5] = v5;
  v9[6] = v7;
  v9[7] = v6;
  v9[8] = v14;
  v9[9] = v15;
  v10 = (_QWORD *)(v13 + a1[18]);
  *v10 = &unk_1EE3F6F68;
  v10[1] = v9;
  result = (_QWORD *)swift_allocObject();
  result[2] = v4;
  result[3] = v3;
  result[4] = v2;
  result[5] = v5;
  result[6] = v7;
  result[7] = v6;
  result[8] = v16;
  result[9] = v17;
  v12 = (_QWORD *)(v13 + a1[19]);
  *v12 = &unk_1EE3F6F78;
  v12[1] = result;
  return result;
}

uint64_t sub_19B568D2C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_19B55FFB4;
  return v9(a1, a2);
}

uint64_t sub_19B568D9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_19B55FFB4;
  return v7(a1);
}

void HierarchicalStateMachine.RootState.BuilderTypes.CompositeState.init(_:builder:)(uint64_t a1@<X0>, void (*a2)(_QWORD *__return_ptr)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  _QWORD v17[6];

  a2(v17);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a8, a1, AssociatedTypeWitness);
  v17[0] = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  v17[4] = a7;
  v17[5] = a9;
  type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState();
}

_QWORD *sub_19B568EB4(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *result;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = v1;
  *(_QWORD *)(v5 + a1[17]) = v2;
  v23 = v4;
  if (v9)
  {
    v11 = (void *)v9;
    v12 = v20;
  }
  else
  {
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v1;
    v12[3] = v8;
    v12[4] = v3;
    v12[5] = v6;
    v11 = &unk_1EE3F6F88;
    v12[6] = v7;
    v12[7] = v4;
  }
  v13 = (_QWORD *)(v5 + a1[18]);
  *v13 = v11;
  v13[1] = v12;
  swift_bridgeObjectRetain();
  sub_19B564300(v9);
  if (v21)
  {
    sub_19B564300(v21);
    swift_bridgeObjectRelease();
    sub_19B564310(v9);
    sub_19B564310(v21);
    v14 = (_QWORD *)swift_allocObject();
    v16 = v4;
    v15 = v24;
    v14[2] = v24;
    v14[3] = v8;
    v14[4] = v3;
    v14[5] = v6;
    v14[6] = v7;
    v14[7] = v4;
    v17 = &unk_1EE3F6FA8;
    v14[8] = v21;
    v14[9] = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_19B564310(v9);
    sub_19B564310(0);
    v14 = (_QWORD *)swift_allocObject();
    v16 = v4;
    v15 = v24;
    v14[2] = v24;
    v14[3] = v8;
    v14[4] = v3;
    v14[5] = v6;
    v17 = &unk_1EE3F6F98;
    v14[6] = v7;
    v14[7] = v23;
  }
  result = (_QWORD *)swift_allocObject();
  result[2] = v15;
  result[3] = v8;
  result[4] = v3;
  result[5] = v6;
  result[6] = v7;
  result[7] = v16;
  result[8] = v17;
  result[9] = v14;
  v19 = (_QWORD *)(v5 + a1[19]);
  *v19 = &unk_1EE3F6FA0;
  v19[1] = result;
  return result;
}

uint64_t sub_19B569060()
{
  uint64_t v0;

  return sub_19B566A34(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnEvent.eventHandler.modify())()
{
  return nullsub_1;
}

_QWORD *HierarchicalStateMachine.RootState.BuilderTypes.OnEvent.init(eventHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a7;
  result[7] = a8;
  result[8] = a1;
  result[9] = a2;
  *a9 = &unk_1EE3F6FB8;
  a9[1] = result;
  return result;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_release();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.modify())()
{
  return nullsub_1;
}

_QWORD *HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.init(stateTransitionHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a7;
  result[7] = a8;
  result[8] = a1;
  result[9] = a2;
  *a9 = &unk_1EE3F6FC8;
  a9[1] = result;
  return result;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.init(stateTransitionHandler:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_19B569210(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_19B55FFB4;
  return v7(a2);
}

uint64_t sub_19B569270(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_19B55FFB4;
  return v5();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent.onDelegateEvent.modify())()
{
  return nullsub_1;
}

uint64_t sub_19B5692E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v7 = a3 + a2;
  v9 = *a1;
  v8 = a1[1];
  v10 = swift_allocObject();
  v11 = *(_OWORD *)(v7 - 32);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v7 - 48);
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v7 - 16);
  *(_QWORD *)(v10 + 64) = v9;
  *(_QWORD *)(v10 + 72) = v8;
  *a5 = a4;
  a5[1] = v10;
  return swift_retain();
}

uint64_t sub_19B569344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = sub_19B55FFB4;
  return v11(a2, a3, a4);
}

uint64_t sub_19B5693BC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t result;

  v8 = a4 + a3;
  v10 = *a1;
  v9 = a1[1];
  v11 = swift_allocObject();
  v12 = *(_OWORD *)(v8 - 32);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)(v8 - 48);
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v8 - 16);
  *(_QWORD *)(v11 + 64) = v10;
  *(_QWORD *)(v11 + 72) = v9;
  swift_retain();
  result = swift_release();
  *a2 = a6;
  a2[1] = v11;
  return result;
}

uint64_t sub_19B569434(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_19B55FFB4;
  return v7();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction.traceEventReaction.modify())()
{
  return nullsub_1;
}

uint64_t sub_19B5694BC(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19B55FFB4;
  return v4();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize.onInitialize.modify())()
{
  return nullsub_1;
}

uint64_t sub_19B569524(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v9 = *a1;
  v8 = a1[1];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v8;
  swift_retain();
  result = swift_release();
  *a2 = a6;
  a2[1] = v10;
  return result;
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate.onInvalidate.modify())()
{
  return nullsub_1;
}

void sub_19B569598()
{
  sub_19B567990();
}

void type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void sub_19B5695DC()
{
  sub_19B568308();
}

void type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void sub_19B569608()
{
  sub_19B568710();
}

void type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B569634()
{
  return swift_deallocObject();
}

uint64_t sub_19B569644(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_19B5696A8()
{
  return swift_deallocObject();
}

uint64_t sub_19B5696B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  return sub_19B55D164();
}

void sub_19B5696FC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X8; sub_19B568B34 }
}

void sub_19B5697A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X9; sub_19B568AC8 }
}

uint64_t sub_19B569868(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v6 = *(int **)(v2 + 64);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55FFB4;
  v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_19B55FFB4;
  return v10(a1, a2);
}

uint64_t sub_19B5698FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 64);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55FFB4;
  return v8(a1);
}

uint64_t sub_19B569984()
{
  return swift_deallocObject();
}

uint64_t sub_19B569994(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_19B5699F8()
{
  return swift_deallocObject();
}

uint64_t sub_19B569A08()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  return sub_19B55D164();
}

uint64_t sub_19B569A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v6 = *(int **)(v2 + 64);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55FFB4;
  v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_19B55FFB4;
  return v10(a1, a2);
}

uint64_t sub_19B569AE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 64);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55FFB4;
  return v8(a1);
}

uint64_t sub_19B569B68@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_19B569B74(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v4 = *a1;
  v3 = a1[1];
  swift_retain();
  result = swift_release();
  *a2 = v4;
  a2[1] = v3;
  return result;
}

uint64_t sub_19B569BB4()
{
  return 48;
}

__n128 sub_19B569BC0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19B569BD4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_19B5692E0(a1, a2, a3, (uint64_t)&unk_1EE3F7958, a4);
}

uint64_t sub_19B569BF8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19B5693BC(a1, a2, a3, a4, (uint64_t)&unk_1E3B373E0, (uint64_t)&unk_1EE3F7948);
}

uint64_t sub_19B569C1C()
{
  return 48;
}

__n128 sub_19B569C28(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19B569C3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_19B5692E0(a1, a2, a3, (uint64_t)&unk_1EE3F7938, a4);
}

uint64_t sub_19B569C60(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19B5693BC(a1, a2, a3, a4, (uint64_t)&unk_1E3B37390, (uint64_t)&unk_1EE3F7928);
}

uint64_t sub_19B569C84()
{
  return 48;
}

__n128 sub_19B569C90(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19B569CA4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_19B5692E0(a1, a2, a3, (uint64_t)&unk_1EE3F7918, a4);
}

uint64_t sub_19B569CC8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19B5693BC(a1, a2, a3, a4, (uint64_t)&unk_1E3B37340, (uint64_t)&unk_1EE3F7908);
}

uint64_t sub_19B569CEC()
{
  return 48;
}

__n128 sub_19B569CF8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19B569D0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_61Tm(a1, (uint64_t)&unk_1EE3F78F8, a2);
}

uint64_t sub_19B569D20(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19B569524(a1, a2, a3, a4, (uint64_t)&unk_1E3B372F0, (uint64_t)&unk_1EE3F78F0);
}

uint64_t sub_19B569D44()
{
  return 48;
}

__n128 sub_19B569D50(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19B569D64@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_61Tm(a1, (uint64_t)&unk_1EE3F78E8, a2);
}

uint64_t keypath_get_61Tm@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  *a3 = a2;
  a3[1] = v7;
  return swift_retain();
}

uint64_t sub_19B569DC0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_19B569524(a1, a2, a3, a4, (uint64_t)&unk_1E3B372A0, (uint64_t)&unk_1EE3F78D8);
}

uint64_t sub_19B569DE4()
{
  return 48;
}

__n128 sub_19B569DF0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Actions()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B569E28()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_19B569E30(_QWORD *a1)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if (a1[1])
    result = swift_release();
  if (a1[3])
    result = swift_release();
  if (a1[5])
    result = swift_release();
  if (a1[7])
    return swift_release();
  return result;
}

_QWORD *sub_19B569E9C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v5 = a2 + 1;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  v7 = a2[3];
  if (v7)
  {
    v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  v9 = a2[5];
  if (v9)
  {
    v10 = a2[6];
    a1[5] = v9;
    a1[6] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  }
  v11 = a2[7];
  if (v11)
  {
    v12 = a2[8];
    a1[7] = v11;
    a1[8] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
  }
  return a1;
}

_QWORD *sub_19B569F7C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[1];
  if (a1[1])
  {
    if (!v4)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize();
    v5 = a2[2];
    a1[1] = v4;
    a1[2] = v5;
    swift_retain();
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  }
  v7 = a2[3];
  if (a1[3])
  {
    if (!v7)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate();
    v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[4];
    a1[3] = v7;
    a1[4] = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  v10 = a2[5];
  if (a1[5])
  {
    if (!v10)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent();
    v11 = a2[6];
    a1[5] = v10;
    a1[6] = v11;
    swift_retain();
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[6];
    a1[5] = v10;
    a1[6] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  }
  v13 = a2[7];
  if (a1[7])
  {
    if (!v13)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction();
    v14 = a2[8];
    a1[7] = v13;
    a1[8] = v14;
    swift_retain();
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[8];
    a1[7] = v13;
    a1[8] = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
  }
  return a1;
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

_QWORD *sub_19B56A228(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[1];
  if (a1[1])
  {
    if (!v4)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize();
    v5 = a2[2];
    a1[1] = v4;
    a1[2] = v5;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  }
  v6 = a2[3];
  if (a1[3])
  {
    if (!v6)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate();
    v7 = a2[4];
    a1[3] = v6;
    a1[4] = v7;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  v8 = a2[5];
  if (a1[5])
  {
    if (!v8)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent();
    v9 = a2[6];
    a1[5] = v8;
    a1[6] = v9;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  }
  v10 = a2[7];
  if (a1[7])
  {
    if (!v10)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction();
    v11 = a2[8];
    a1[7] = v10;
    a1[8] = v11;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
  }
  return a1;
}

uint64_t sub_19B56A408(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_19B56A450(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Actions()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B56A4B8(uint64_t a1)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 8))
    result = swift_release();
  if (*(_QWORD *)(a1 + 24))
    return swift_release();
  return result;
}

_QWORD *sub_19B56A504(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v5 = a2 + 1;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  v7 = a2[3];
  if (v7)
  {
    v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

_QWORD *sub_19B56A594(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[1];
  if (a1[1])
  {
    if (!v4)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent();
    v5 = a2[2];
    a1[1] = v4;
    a1[2] = v5;
    swift_retain();
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  }
  v7 = a2[3];
  if (a1[3])
  {
    if (!v7)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition();
    v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[4];
    a1[3] = v7;
    a1[4] = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *sub_19B56A718(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[1];
  if (a1[1])
  {
    if (!v4)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent();
    v5 = a2[2];
    a1[1] = v4;
    a1[2] = v5;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  }
  v6 = a2[3];
  if (a1[3])
  {
    if (!v6)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition();
    v7 = a2[4];
    a1[3] = v6;
    a1[4] = v7;
    swift_release();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

uint64_t sub_19B56A830(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_19B56A878(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Actions()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

_QWORD *sub_19B56A8D8(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (*result)
    result = (_QWORD *)swift_release();
  if (v1[2])
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *sub_19B56A91C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*a2)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

_QWORD *sub_19B56A988(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  if (*a1)
  {
    if (!v4)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent();
    v5 = a2[1];
    *a1 = v4;
    a1[1] = v5;
    swift_retain();
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v7 = a2[2];
  if (a1[2])
  {
    if (!v7)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition();
    v8 = a2[3];
    a1[2] = v7;
    a1[3] = v8;
    swift_retain();
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

_QWORD *sub_19B56AAC0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*a1)
  {
    if (!*a2)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent();
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_release();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = a2[2];
  if (a1[2])
  {
    if (!v5)
      type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition();
    v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_release();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

uint64_t sub_19B56ABC0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_19B56AC1C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_19B56AC70()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_19B56AD00(_QWORD *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *a1 = v9;
    a1 = (_QWORD *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v10 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_19B56ADF8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  swift_release();
  return swift_release();
}

uint64_t sub_19B56AE70(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_19B56AF18(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  v10 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19B56AFD4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19B56B068(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = v6 + a2;
  v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 23;
  *v7 = *(_OWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v9 & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_19B56B110(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 < a2)
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    __asm { BR              X15 }
  }
  if (v5 >= 0x7FFFFFFF)
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
  v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

void sub_19B56B264(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0x7FFFFFFFu)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v10 = 0u;
    if (a2 <= v7)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v7 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v7)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = ~v7 + a2;
    bzero(a1, ((((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_19B56B384()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x19B56B400);
}

void sub_19B56B38C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x19B56B394);
  JUMPOUT(0x19B56B400);
}

void sub_19B56B3D8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B56B400);
}

void sub_19B56B3E0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B56B400);
}

uint64_t sub_19B56B3E8@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v3 + v5) = 0;
  if (!(_DWORD)v4)
    JUMPOUT(0x19B56B400);
  if (a1 < 0x7FFFFFFF)
  {
    if ((v4 & 0x80000000) == 0)
      JUMPOUT(0x19B56B3FCLL);
    JUMPOUT(0x19B56B3F4);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(v3, v4);
}

uint64_t sub_19B56B418()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_19B56B4B4(_QWORD *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *a1 = v9;
    a1 = (_QWORD *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v10 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v10 = *v11;
    v12 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
    v16 = (_QWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_19B56B5CC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_19B56B650(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_19B56B710(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = v6 + a2;
  v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 15;
  *v7 = *(_QWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v9 &= 0xFFFFFFFFFFFFFFF8;
  v11 = *(_QWORD *)(v9 + 8);
  *v10 = *(_QWORD *)v9;
  v10[1] = v11;
  swift_retain();
  swift_release();
  v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19B56B7EC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _OWORD *v9;
  _OWORD *v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8);
  v10 = (_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  *(_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19B56B890(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _OWORD *v9;
  _OWORD *v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_bridgeObjectRelease();
  v9 = (_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  *v9 = *v10;
  swift_release();
  *(_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_19B56B950(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 < a2)
  {
    if (((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    __asm { BR              X15 }
  }
  if (v5 >= 0x7FFFFFFF)
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
  v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

void sub_19B56BAAC(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v6 + 84) <= 0x7FFFFFFFu)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v10 = 0u;
    if (a2 <= v7)
      goto LABEL_17;
  }
  else
  {
    if (((((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v7 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v7)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = ~v7 + a2;
    bzero(a1, ((((((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_19B56BBD4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x19B56BC4CLL);
}

void sub_19B56BBDC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x19B56BBE4);
  JUMPOUT(0x19B56BC4CLL);
}

void sub_19B56BC28()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B56BC4CLL);
}

void sub_19B56BC30()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x19B56BC4CLL);
}

uint64_t sub_19B56BC38@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v3 + v5) = 0;
  if (!(_DWORD)v4)
    JUMPOUT(0x19B56BC4CLL);
  if (a1 < 0x7FFFFFFF)
  {
    if ((v4 & 0x80000000) == 0)
      JUMPOUT(0x19B56BC48);
    JUMPOUT(0x19B56BC44);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(v3, v4);
}

_QWORD *sub_19B56BC70(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_19B56BC9C()
{
  return swift_release();
}

_OWORD *sub_19B56BCA4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

_QWORD *sub_19B56BCD4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19B56BD0C(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_19B56BD54(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_19B56BD90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B56BDB4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_19B55FFB4;
  return ((uint64_t (*)(int *))((char *)&dword_1EE3F78D0 + dword_1EE3F78D0))(v2);
}

uint64_t sub_19B56BE18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE3F78E0 + dword_1EE3F78E0))(a1, v4);
}

void sub_19B56BE88()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X8; sub_19B569434 }
}

void sub_19B56BF48()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X9; sub_19B569344 }
}

uint64_t sub_19B56C004()
{
  swift_release();
  return swift_deallocObject();
}

void sub_19B56C028()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X8; sub_19B569270 }
}

void sub_19B56C0D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X9; sub_19B569210 }
}

void sub_19B56C180()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X8; sub_19B568B34 }
}

void sub_19B56C228()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  __asm { BR              X9; sub_19B568AC8 }
}

uint64_t sub_19B56C2EC()
{
  return swift_deallocObject();
}

uint64_t sub_19B56C2FC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_19B55FFB4;
  return sub_19B55D164();
}

uint64_t sub_19B56C340()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 64))
    swift_release();
  if (*(_QWORD *)(v0 + 80))
    swift_release();
  return swift_deallocObject();
}

void sub_19B56C37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v15 = v11[3];
  v21 = v11[2];
  v16 = v11[8];
  v17 = v11[9];
  v19 = v11[10];
  v18 = v11[11];
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v12 + 16) = v20;
  *v20 = v12;
  v20[1] = sub_19B55D164;
  sub_19B567598(a1, a2, v16, v17, v19, v18, v21, v15, a9, a10, a11);
}

uint64_t sub_19B56C4C4()
{
  return sub_19B569060();
}

uint64_t HierarchicalStateMachine.start(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_19B56C4E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = v0[2];
  v1 = v0[3];
  v3 = swift_task_alloc();
  v0[4] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v6 = (uint64_t (*)(void))((char *)&dword_1EE3F7998 + dword_1EE3F7998);
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_19B56C574;
  return v6();
}

uint64_t sub_19B56C574()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

void HierarchicalStateMachine.__allocating_init(rootState:)()
{
  swift_allocObject();
  HierarchicalStateMachine.init(rootState:)();
}

uint64_t sub_19B56C600()
{
  uint64_t v0;

  return v0;
}

void HierarchicalStateMachine.init(rootState:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)v0;
  swift_defaultActor_initialize();
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 152);
  *(_QWORD *)&v0[v2] = sub_19B5B9CC8();
  (*(void (**)(char *, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 56))(&v0[*(_QWORD *)(*(_QWORD *)v0 + 160)], 1, 2, *(_QWORD *)(v1 + 80));
  type metadata accessor for AsyncSerialQueue();
  v3 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_BYTE *)(v3 + 112) = 0;
  *(_QWORD *)(v3 + 120) = *(_QWORD *)sub_19B5B9C8C();
  *(_QWORD *)(v3 + 128) = sub_19B56F9BC;
  *(_QWORD *)(v3 + 136) = 0;
  *((_QWORD *)v0 + 14) = v3;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56C6DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v3, v1, a1);
  swift_retain();
  return v2;
}

void HierarchicalStateMachine.currentValue.getter()
{
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56C758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  v10 = (char *)&v16 - v9;
  v11 = v4 + *(_QWORD *)(v5 + 160);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, a1);
  v12 = *(_QWORD *)(v6 - 112);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 2, v12))
  {
    v14 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v3, v10, v12);
    v14 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v3, v14, 1, v12);
}

void sub_19B56C824(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)(v3 + 112) = a2;
  *(_QWORD *)(v3 + 120) = a3;
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 80);
  *(_QWORD *)(v3 + 128) = v5;
  v6 = *(_QWORD *)(v4 + 120);
  v7 = *(_OWORD *)(v4 + 88);
  v8 = *(_OWORD *)(v4 + 104);
  *(_QWORD *)(v3 + 16) = v5;
  *(_OWORD *)(v3 + 24) = v7;
  *(_OWORD *)(v3 + 40) = v8;
  *(_QWORD *)(v3 + 56) = v6;
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56C874(uint64_t a1)
{
  _QWORD *v1;

  v1[17] = a1;
  v1[18] = *(_QWORD *)(a1 - 8);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56C8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 112) + *(_QWORD *)(**(_QWORD **)(v0 + 112) + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 2, v4);
  if (v7)
  {
    if (v7 == 1)
    {
      v9 = *(_QWORD *)(v0 + 144);
      v8 = *(_QWORD *)(v0 + 152);
      v11 = *(_QWORD *)(v0 + 128);
      v10 = *(_QWORD *)(v0 + 136);
      v13 = *(_QWORD *)(v0 + 112);
      v12 = *(_QWORD *)(v0 + 120);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v12, v11);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v8, 0, 2, v11);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v5, v8, v10);
      swift_endAccess();
      v14 = swift_task_alloc();
      *(_QWORD *)(v0 + 168) = v14;
      *(_QWORD *)(v14 + 16) = v13;
      *(_QWORD *)(v14 + 24) = v12;
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v15;
      *v15 = v0;
      v15[1] = sub_19B56CA74;
      return sub_19B56CD3C((uint64_t)v15, (uint64_t)&unk_1EE3F7C38, v14);
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56CA74()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56CAD4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56CB10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;

  v5 = *(uint64_t **)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_19B55FFB4;
  sub_19B56C824(a1, v5, v4);
}

void sub_19B56CB74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4[18] = a3;
  v4[19] = a4;
  v4[17] = a2;
  v5 = *(_QWORD **)a3;
  v6 = *(_QWORD *)(*(_QWORD *)a3 + 80);
  v4[20] = v6;
  v7 = v5[11];
  v8 = v5[12];
  v9 = v5[13];
  v10 = v5[14];
  v11 = v5[15];
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  v4[5] = v9;
  v4[6] = v10;
  v4[7] = v11;
  type metadata accessor for HierarchicalStateMachine.StateTransition();
}

void sub_19B56CBD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[21] = a1;
  v3[22] = *(_QWORD *)(a1 - 8);
  v8 = swift_task_alloc();
  v3[8] = v1;
  v3[23] = v8;
  v3[9] = v2;
  v3[10] = v4;
  v3[11] = v5;
  v3[12] = v6;
  v3[13] = v7;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56CC10(uint64_t a1)
{
  _QWORD *v1;

  v1[24] = a1;
  v1[25] = *(_QWORD *)(a1 - 8);
  v1[26] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B56CC5C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[25];
  v1 = v0[26];
  v4 = v0[23];
  v3 = v0[24];
  v5 = v0[20];
  v6 = v0[19];
  v7 = v0[18] + *(_QWORD *)(*(_QWORD *)v0[18] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v4, v6, v5);
  swift_storeEnumTagMultiPayload();
  v8 = (_QWORD *)swift_task_alloc();
  v0[27] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_19B571BA4;
  HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:)(v0[23], v0[19], v0[17], (_OWORD *)v0[24]);
}

uint64_t sub_19B56CD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  v5 = *v3;
  v4[22] = *v3;
  v6 = *(_QWORD *)(v5 + 96);
  v4[23] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[24] = v7;
  v4[25] = *(_QWORD *)(v7 + 64);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56CDB8()
{
  _QWORD *v0;
  _QWORD *v1;
  int *v2;
  uint64_t v3;
  _QWORD *v4;
  int *v6;

  v1 = (_QWORD *)v0[22];
  v2 = (int *)v0[19];
  v0[28] = v1[10];
  v0[29] = v1[11];
  v0[30] = v1[13];
  v0[31] = v1[14];
  v0[32] = v1[15];
  v0[14] = sub_19B571BB8();
  v0[15] = v3;
  v6 = (int *)((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v0[33] = v4;
  *v4 = v0;
  v4[1] = sub_19B56CE5C;
  return ((uint64_t (*)(_QWORD, _QWORD *))v6)(v0[18], v0 + 14);
}

uint64_t sub_19B56CE5C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56CEB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 112);
  swift_beginAccess();
  v1 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF38], v1);
  sub_19B5B9DA0();
  swift_endAccess();
  *(_QWORD *)(v0 + 272) = *(_QWORD *)(v0 + 120);
  if (!MEMORY[0x1A1AC2740]())
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    __asm { BR              X0 }
  }
  *(_QWORD *)(v0 + 280) = *(_QWORD *)(**(_QWORD **)(v0 + 168) + 144);
  v2 = sub_19B5B9D94();
  sub_19B5B9D70();
  if ((v2 & 1) != 0)
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 16))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80)), *(_QWORD *)(v0 + 184));
    goto LABEL_4;
  }
  v5 = *(_QWORD *)(v0 + 200);
  result = sub_19B5B9F20();
  if (v5 == 8)
  {
    v7 = result;
    v8 = *(_QWORD *)(v0 + 216);
    v9 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)(v0 + 136) = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v0 + 136, v9);
    swift_unknownObjectRelease();
LABEL_4:
    *(_QWORD *)(v0 + 288) = 1;
    v3 = *(_QWORD *)(v0 + 256);
    v4 = *(_QWORD *)(v0 + 184);
    v11 = *(_OWORD *)(v0 + 224);
    v12 = *(_OWORD *)(v0 + 240);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v0 + 192) + 32))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), v4);
    swift_beginAccess();
    *(_OWORD *)(v0 + 16) = v11;
    *(_QWORD *)(v0 + 32) = v4;
    *(_OWORD *)(v0 + 40) = v12;
    *(_QWORD *)(v0 + 56) = v3;
    type metadata accessor for HierarchicalStateMachine.RootState();
  }
  __break(1u);
  return result;
}

uint64_t sub_19B56D198()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 296);
  swift_task_dealloc();
  sub_19B564310(v1);
  return swift_task_switch();
}

uint64_t sub_19B56D208()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
  v1 = *(_QWORD *)(v0 + 288);
  if (v1 == MEMORY[0x1A1AC2740](*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 184)))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = *(_QWORD *)(v0 + 288);
  v4 = sub_19B5B9D94();
  sub_19B5B9D70();
  if ((v4 & 1) != 0)
  {
    result = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 16))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 272)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80))+ *(_QWORD *)(*(_QWORD *)(v0 + 192) + 72) * v3, *(_QWORD *)(v0 + 184));
LABEL_5:
    *(_QWORD *)(v0 + 288) = v3 + 1;
    if (!__OFADD__(v3, 1))
    {
      v5 = *(_QWORD *)(v0 + 256);
      v6 = *(_QWORD *)(v0 + 184);
      v12 = *(_OWORD *)(v0 + 224);
      v13 = *(_OWORD *)(v0 + 240);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v0 + 192) + 32))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), v6);
      swift_beginAccess();
      *(_OWORD *)(v0 + 16) = v12;
      *(_QWORD *)(v0 + 32) = v6;
      *(_OWORD *)(v0 + 40) = v13;
      *(_QWORD *)(v0 + 56) = v5;
      type metadata accessor for HierarchicalStateMachine.RootState();
    }
    __break(1u);
    goto LABEL_10;
  }
  v7 = *(_QWORD *)(v0 + 200);
  result = sub_19B5B9F20();
  if (v7 == 8)
  {
    v8 = result;
    v9 = *(_QWORD *)(v0 + 216);
    v10 = *(_QWORD *)(v0 + 184);
    v11 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)(v0 + 136) = v8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v0 + 136, v10);
    result = swift_unknownObjectRelease();
    goto LABEL_5;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t HierarchicalStateMachine.invalidate()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_19B56D484()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3F7998 + dword_1EE3F7998);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_19B56D4F0;
  return v3((uint64_t)v3, (uint64_t)&unk_1EE3F79B0, *(_QWORD *)(v0 + 16));
}

uint64_t sub_19B56D4F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56D544()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56D54C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)(v2 + 136) = a2;
  v3 = *a2;
  v4 = *(_QWORD *)(*a2 + 80);
  *(_QWORD *)(v2 + 144) = v4;
  *(_QWORD *)(v2 + 152) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 160) = swift_task_alloc();
  v5 = *(_QWORD *)(v3 + 120);
  v6 = *(_OWORD *)(v3 + 88);
  v7 = *(_OWORD *)(v3 + 104);
  *(_QWORD *)(v2 + 16) = v4;
  *(_OWORD *)(v2 + 24) = v6;
  *(_OWORD *)(v2 + 40) = v7;
  *(_QWORD *)(v2 + 56) = v5;
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56D5BC(uint64_t a1)
{
  _QWORD *v1;

  v1[21] = a1;
  v1[22] = *(_QWORD *)(a1 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56D610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 136) + *(_QWORD *)(**(_QWORD **)(v0 + 136) + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v1, 2, v4);
  if (v7)
  {
    if (v7 == 1)
    {
      v9 = *(_QWORD *)(v0 + 176);
      v8 = *(_QWORD *)(v0 + 184);
      v10 = *(_QWORD *)(v0 + 168);
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 56))(v8, 2, 2, *(_QWORD *)(v0 + 144));
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v6, v8, v10);
      swift_endAccess();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 184);
    v13 = *(_QWORD *)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 136);
    v17 = *(_QWORD *)(v0 + 144);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 32))(v15, *(_QWORD *)(v0 + 192), v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v12, 2, 2, v17);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v6, v12, v13);
    swift_endAccess();
    v19 = swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v19;
    *(_QWORD *)(v19 + 16) = v18;
    *(_QWORD *)(v19 + 24) = v15;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v20;
    *v20 = v0;
    v20[1] = sub_19B56D80C;
    return sub_19B56CD3C((uint64_t)v20, (uint64_t)&unk_1EE3F7C28, v19);
  }
}

uint64_t sub_19B56D80C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56D86C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56D8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4[18] = a3;
  v4[19] = a4;
  v4[17] = a2;
  v5 = *(_QWORD **)a3;
  v6 = *(_QWORD *)(*(_QWORD *)a3 + 80);
  v4[20] = v6;
  v7 = v5[11];
  v8 = v5[12];
  v9 = v5[13];
  v10 = v5[14];
  v11 = v5[15];
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  v4[5] = v9;
  v4[6] = v10;
  v4[7] = v11;
  type metadata accessor for HierarchicalStateMachine.StateTransition();
}

void sub_19B56D924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[21] = a1;
  v3[22] = *(_QWORD *)(a1 - 8);
  v8 = swift_task_alloc();
  v3[8] = v1;
  v3[23] = v8;
  v3[9] = v2;
  v3[10] = v4;
  v3[11] = v5;
  v3[12] = v6;
  v3[13] = v7;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56D960(uint64_t a1)
{
  _QWORD *v1;

  v1[24] = a1;
  v1[25] = *(_QWORD *)(a1 - 8);
  v1[26] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B56D9AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[25];
  v1 = v0[26];
  v4 = v0[23];
  v3 = v0[24];
  v5 = v0[20];
  v6 = v0[19];
  v7 = v0[18] + *(_QWORD *)(*(_QWORD *)v0[18] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v4, v6, v5);
  swift_storeEnumTagMultiPayload();
  v8 = (_QWORD *)swift_task_alloc();
  v0[27] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_19B56DA8C;
  HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:)(v0[23], v0[19], v0[17], (_OWORD *)v0[24]);
}

uint64_t sub_19B56DA8C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(*v0 + 208);
  v2 = *(_QWORD *)(*v0 + 192);
  v3 = *(_QWORD *)(*v0 + 200);
  v5 = *(_QWORD *)(*v0 + 176);
  v4 = *(_QWORD *)(*v0 + 184);
  v6 = *(_QWORD *)(*v0 + 168);
  v8 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t HierarchicalStateMachine.enqueue(event:)(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  v3 = *v1;
  v2[5] = *v1;
  v4 = *(_QWORD *)(v3 + 88);
  v2[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(_QWORD *)(v5 + 64);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56DB88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = v0[9];
  v2 = v0[6];
  v3 = v0[7];
  v4 = v0[4];
  v5 = v0[5];
  v6 = v0[3];
  v0[10] = *(_QWORD *)(v4 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  v0[11] = v8;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v5 + 80);
  *(_QWORD *)(v8 + 24) = v2;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v5 + 96);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(v5 + 104);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v5 + 120);
  *(_QWORD *)(v8 + 64) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_19B56DC5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v1 = v0[10];
  v2 = v0[11];
  v0[2] = 0;
  sub_19B57003C();
  v3 = (_QWORD *)swift_task_alloc();
  v0[12] = v3;
  v3[2] = v0 + 2;
  v3[3] = v1;
  v3[4] = &unk_1EE3F79C8;
  v3[5] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  *v4 = v0;
  v4[1] = sub_19B56DD24;
  return sub_19B5B9FEC();
}

uint64_t sub_19B56DD24()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56DD84()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_19B56DDD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_19B571BA8;
  sub_19B56DE2C(a3);
}

void sub_19B56DE2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = v1;
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 88);
  *(_QWORD *)(v2 + 160) = v4;
  *(_QWORD *)(v2 + 168) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  v5 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v2 + 184) = v5;
  v6 = *(_OWORD *)(v3 + 96);
  v7 = *(_OWORD *)(v3 + 112);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 24) = v4;
  *(_OWORD *)(v2 + 32) = v6;
  *(_OWORD *)(v2 + 48) = v7;
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56DE94(uint64_t a1)
{
  _QWORD *v1;

  v1[24] = a1;
  v1[25] = *(_QWORD *)(a1 - 8);
  v1[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56DED8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 152) + *(_QWORD *)(**(_QWORD **)(v0 + 152) + 152));
  swift_beginAccess();
  *(_QWORD *)(v0 + 136) = *v1;
  v2 = sub_19B5B9DC4();
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF50], v2);
  result = sub_19B5B9E84();
  if ((result & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 200);
    v4 = *(_QWORD *)(v0 + 208);
    v7 = *(_QWORD *)(v0 + 184);
    v6 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 152) + *(_QWORD *)(**(_QWORD **)(v0 + 152) + 160);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8, v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v4, 2, v7))
    {
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 16))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 160));
      swift_beginAccess();
      sub_19B5B9DAC();
      swift_endAccess();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v9;
      *v9 = v0;
      v9[1] = sub_19B56E070;
      return sub_19B56E2A0();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_19B56E070()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56E0C8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HierarchicalStateMachine.enqueueAndWait(event:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_19B56E12C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = v0[2];
  v1 = v0[3];
  v3 = swift_task_alloc();
  v0[4] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v6 = (uint64_t (*)(void))((char *)&dword_1EE3F7998 + dword_1EE3F7998);
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_19B56C574;
  return v6();
}

void sub_19B56E1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_19B55F834;
  sub_19B56DE2C(a3);
}

uint64_t HierarchicalStateMachine.runToCompletion()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_19B56E224()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EE3F7998 + dword_1EE3F7998);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_19B56D4F0;
  return v3((uint64_t)v3, (uint64_t)&unk_1EE3F79F8, 0);
}

uint64_t sub_19B56E290()
{
  uint64_t v0;

  return sub_19B570E64(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_19B56E2A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[9] = v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56E300()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(v0 + 104) = v2;
  v3 = (_QWORD *)(v1 + v2);
  swift_beginAccess();
  *(_QWORD *)(v0 + 64) = *v3;
  v4 = sub_19B5B9DC4();
  *(_QWORD *)(v0 + 112) = v4;
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF50], v4);
  if ((sub_19B5B9E84() & 1) == 0)
  {
    v6 = *(_QWORD *)(v0 + 112);
    swift_beginAccess();
    MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF58], v6);
    sub_19B5B9E9C();
    swift_endAccess();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v7;
    *v7 = v0;
    v7[1] = sub_19B56E434;
    sub_19B56E598(*(_QWORD *)(v0 + 96));
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56E434()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56E48C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v3 + v2);
  MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF50], v1);
  if ((sub_19B5B9E84() & 1) == 0)
  {
    v5 = *(_QWORD *)(v0 + 112);
    swift_beginAccess();
    MEMORY[0x1A1AC3B08](MEMORY[0x1E0DEAF58], v5);
    sub_19B5B9E9C();
    swift_endAccess();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v6;
    *v6 = v0;
    v6[1] = sub_19B56E434;
    sub_19B56E598(*(_QWORD *)(v0 + 96));
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56E598(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[17] = a1;
  v2[18] = v1;
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2[19] = v4;
  v5 = v3[11];
  v6 = v3[12];
  v7 = v3[13];
  v8 = v3[14];
  v9 = v3[15];
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  v2[6] = v8;
  v2[7] = v9;
  type metadata accessor for HierarchicalStateMachine.EventReaction();
}

void sub_19B56E5F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[20] = a1;
  v2[21] = *(_QWORD *)(a1 - 8);
  v2[22] = swift_task_alloc();
  v8 = swift_task_alloc();
  v2[8] = v1;
  v2[23] = v8;
  v2[9] = v3;
  v2[10] = v4;
  v2[11] = v5;
  v2[12] = v6;
  v2[13] = v7;
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56E63C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[24] = a1;
  v2[25] = *(_QWORD *)(a1 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = *(_QWORD *)(v1 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56E6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  int8x16_t *v13;
  _QWORD *v14;
  int8x16_t v15;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 144) + *(_QWORD *)(**(_QWORD **)(v0 + 144) + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v6, v3);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 2, v5);
  v8 = *(_QWORD *)(v0 + 208);
  if (v7)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 232);
    v11 = *(_QWORD *)(v0 + 152);
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 32);
    *(_QWORD *)(v0 + 240) = v12;
    v15 = *(int8x16_t *)(v0 + 136);
    v12(v10, v8, v11);
    v13 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v13;
    v13[1] = vextq_s8(v15, v15, 8uLL);
    v13[2].i64[0] = v10;
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v14;
    *v14 = v0;
    v14[1] = sub_19B56E830;
    return sub_19B56CD3C(*(_QWORD *)(v0 + 184), (uint64_t)&unk_1EE3F7BA0, (uint64_t)v13);
  }
}

uint64_t sub_19B56E830()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56E890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t TupleTypeMetadata2;
  uint64_t v3;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 176);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 16))(v1, *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE3F6DD0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v1, 2, TupleTypeMetadata2))
  {
    v5 = *(void (**)(uint64_t))(v0 + 240);
    v6 = *(_QWORD *)(v0 + 224);
    v7 = (uint64_t *)(*(_QWORD *)(v0 + 176) + *(int *)(TupleTypeMetadata2 + 48));
    v9 = *v7;
    v8 = v7[1];
    *(_QWORD *)(v0 + 264) = v8;
    v5(v6);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v10;
    *v10 = v0;
    v10[1] = sub_19B56E9F0;
    sub_19B56EC94(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 136), v9, v8);
  }
  v3 = *(_QWORD *)(v0 + 216);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56E9F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56EA48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 152);
  swift_release();
  v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v7(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56EB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)(v5 + 112) = a4;
  *(_QWORD *)(v5 + 120) = a5;
  *(_QWORD *)(v5 + 96) = a2;
  *(_QWORD *)(v5 + 104) = a3;
  *(_QWORD *)(v5 + 88) = a1;
  v6 = *(_OWORD *)(*(_QWORD *)a3 + 96);
  v7 = *(_OWORD *)(*(_QWORD *)a3 + 112);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(*(_QWORD *)a3 + 80);
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56EB44(uint64_t a1)
{
  _QWORD *v1;

  v1[16] = a1;
  v1[17] = *(_QWORD *)(a1 - 8);
  v1[18] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B56EB84()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[17];
  v1 = v0[18];
  v3 = v0[16];
  v4 = v0[13] + *(_QWORD *)(*(_QWORD *)v0[13] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[19] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_19B56EC28;
  HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:)(v0[11], v0[14], v0[15], v0[12], (_OWORD *)v0[16]);
}

uint64_t sub_19B56EC28()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 144);
  v2 = *(_QWORD *)(*v0 + 128);
  v3 = *(_QWORD *)(*v0 + 136);
  v5 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void sub_19B56EC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6[21] = a5;
  v6[22] = v5;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  v7 = *(_QWORD **)v5;
  v8 = *(_QWORD *)(*(_QWORD *)v5 + 80);
  v6[23] = v8;
  v9 = v7[11];
  v6[24] = v9;
  v10 = v7[12];
  v6[25] = v10;
  v11 = v7[13];
  v6[26] = v11;
  v12 = v7[14];
  v6[27] = v12;
  v13 = v7[15];
  v6[2] = v8;
  v6[28] = v13;
  v6[3] = v9;
  v6[4] = v10;
  v6[5] = v11;
  v6[6] = v12;
  v6[7] = v13;
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

void sub_19B56ED10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[29] = a1;
  v3[30] = *(_QWORD *)(a1 - 8);
  v8 = swift_task_alloc();
  v3[8] = v1;
  v3[31] = v8;
  v3[9] = v2;
  v3[10] = v4;
  v3[11] = v5;
  v3[12] = v6;
  v3[13] = v7;
  type metadata accessor for HierarchicalStateMachine.StateTransition();
}

uint64_t sub_19B56ED4C(uint64_t a1)
{
  _QWORD *v1;

  v1[32] = a1;
  v1[33] = *(_QWORD *)(a1 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56EDA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t TupleTypeMetadata3;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t, uint64_t);
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v16;

  v1 = v0[35];
  v3 = v0[23];
  v2 = v0[24];
  v16 = v0[22];
  v4 = v0[18];
  v5 = v0[19];
  v6 = v0[17];
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v0[36] = TupleTypeMetadata3;
  v8 = v1 + *(int *)(TupleTypeMetadata3 + 48);
  v9 = v1 + *(int *)(TupleTypeMetadata3 + 64);
  v10 = *(_QWORD *)(v3 - 8);
  v0[37] = v10;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v0[38] = v11;
  v11(v1, v6, v3);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v0[39] = v12;
  v12(v8, v5, v2);
  v11(v9, v4, v3);
  swift_storeEnumTagMultiPayload();
  v13 = (_QWORD *)swift_task_alloc();
  v0[40] = v13;
  v13[2] = v16;
  v13[3] = v1;
  v13[4] = v6;
  v13[5] = v4;
  v14 = (_QWORD *)swift_task_alloc();
  v0[41] = v14;
  *v14 = v0;
  v14[1] = sub_19B56EEEC;
  return sub_19B56CD3C((uint64_t)v14, (uint64_t)&unk_1EE3F7BC0, (uint64_t)v13);
}

uint64_t sub_19B56EEEC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56EF4C()
{
  uint64_t v0;
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _QWORD *v5;

  v1 = (_OWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v1;
  v2 = *(_OWORD *)(v0 + 200);
  v3 = *(_OWORD *)(v0 + 216);
  v4 = *(_OWORD *)(v0 + 160);
  v1[1] = *(_OWORD *)(v0 + 184);
  v1[2] = v2;
  v1[3] = v3;
  v1[4] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v5;
  *v5 = v0;
  v5[1] = sub_19B56EFD4;
  return sub_19B56CD3C((uint64_t)v5, (uint64_t)&unk_1EE3F7BD0, (uint64_t)v1);
}

uint64_t sub_19B56EFD4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56F034()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
  v3 = v0[36];
  v2 = v0[37];
  v4 = v0[34];
  v5 = v0[31];
  v20 = (void (*)(uint64_t, uint64_t, uint64_t))v0[39];
  v15 = v0[30];
  v16 = v0[29];
  v6 = v0[23];
  v7 = v0[22];
  v8 = v0[18];
  v18 = v0[19];
  v19 = v0[24];
  v17 = v0[17];
  v1(v5, v8, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v5, 0, 2, v6);
  v9 = v7 + *(_QWORD *)(*(_QWORD *)v7 + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v9, v5, v16);
  swift_endAccess();
  v10 = v4 + *(int *)(v3 + 48);
  v11 = v4 + *(int *)(v3 + 64);
  v1(v4, v17, v6);
  v20(v10, v18, v19);
  v1(v11, v8, v6);
  swift_storeEnumTagMultiPayload();
  v12 = (_QWORD *)swift_task_alloc();
  v0[44] = v12;
  v12[2] = v7;
  v12[3] = v4;
  v12[4] = v8;
  v12[5] = v17;
  v13 = (_QWORD *)swift_task_alloc();
  v0[45] = v13;
  *v13 = v0;
  v13[1] = sub_19B56F1C0;
  return sub_19B56CD3C((uint64_t)v13, (uint64_t)&unk_1EE3F7BE0, (uint64_t)v12);
}

uint64_t sub_19B56F1C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56F220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 8);
  v3(*(_QWORD *)(v0 + 272), v2);
  v3(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19B56F298(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)(v6 + 112) = a5;
  *(_QWORD *)(v6 + 120) = a6;
  *(_QWORD *)(v6 + 96) = a3;
  *(_QWORD *)(v6 + 104) = a4;
  *(_QWORD *)(v6 + 88) = a2;
  v7 = *a3;
  v8 = *(_QWORD *)(*a3 + 104);
  *(_QWORD *)(v6 + 128) = v8;
  v9 = *(_QWORD *)(v7 + 80);
  *(_QWORD *)(v6 + 136) = v9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v6 + 144) = AssociatedTypeWitness;
  *(_QWORD *)(v6 + 152) = *(_QWORD *)(AssociatedTypeWitness - 8);
  *(_QWORD *)(v6 + 160) = swift_task_alloc();
  v11 = *(_OWORD *)(v7 + 88);
  v12 = *(_OWORD *)(v7 + 112);
  *(_QWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 24) = v11;
  *(_QWORD *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 48) = v12;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56F338(uint64_t a1)
{
  _QWORD *v1;

  v1[21] = a1;
  v1[22] = *(_QWORD *)(a1 - 8);
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B56F37C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[22];
  v1 = v0[23];
  v3 = v0[21];
  v5 = v0[16];
  v4 = v0[17];
  v6 = v0[12] + *(_QWORD *)(*(_QWORD *)v0[12] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  v7 = (_QWORD *)swift_task_alloc();
  v0[24] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_19B571BB4;
  HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:)(v0[13], v0[14], v0[20], v0[11], (_OWORD *)v0[21]);
}

void sub_19B56F44C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  __int128 v11;
  __int128 v12;

  *(_QWORD *)(v6 + 112) = a5;
  *(_QWORD *)(v6 + 120) = a6;
  *(_QWORD *)(v6 + 96) = a3;
  *(_QWORD *)(v6 + 104) = a4;
  *(_QWORD *)(v6 + 88) = a2;
  v7 = *a3;
  v8 = *(_QWORD *)(*a3 + 104);
  *(_QWORD *)(v6 + 128) = v8;
  v9 = *(_QWORD *)(v7 + 80);
  *(_QWORD *)(v6 + 136) = v9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v6 + 144) = AssociatedTypeWitness;
  *(_QWORD *)(v6 + 152) = *(_QWORD *)(AssociatedTypeWitness - 8);
  *(_QWORD *)(v6 + 160) = swift_task_alloc();
  v11 = *(_OWORD *)(v7 + 88);
  v12 = *(_OWORD *)(v7 + 112);
  *(_QWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 24) = v11;
  *(_QWORD *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 48) = v12;
  type metadata accessor for HierarchicalStateMachine.RootState();
}

uint64_t sub_19B56F4EC(uint64_t a1)
{
  _QWORD *v1;

  v1[21] = a1;
  v1[22] = *(_QWORD *)(a1 - 8);
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

void sub_19B56F530()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[22];
  v1 = v0[23];
  v3 = v0[21];
  v5 = v0[16];
  v4 = v0[17];
  v6 = v0[12] + *(_QWORD *)(*(_QWORD *)v0[12] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  v7 = (_QWORD *)swift_task_alloc();
  v0[24] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_19B56F600;
  HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:)(v0[13], v0[14], v0[20], v0[11], (_OWORD *)v0[21]);
}

uint64_t sub_19B56F600()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(*v0 + 184);
  v2 = *(_QWORD *)(*v0 + 168);
  v3 = *(_QWORD *)(*v0 + 176);
  v5 = *(_QWORD *)(*v0 + 152);
  v4 = *(_QWORD *)(*v0 + 160);
  v6 = *(_QWORD *)(*v0 + 144);
  v8 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v8 + 8))();
}

void HierarchicalStateMachine.deinit()
{
  swift_release();
  type metadata accessor for HierarchicalStateMachine.RootState();
}

void sub_19B56F6EC(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
  swift_bridgeObjectRelease();
  type metadata accessor for HierarchicalStateMachine.MetaState();
}

uint64_t sub_19B56F734(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
  swift_defaultActor_destroy();
  return v2;
}

void HierarchicalStateMachine.__deallocating_deinit()
{
  HierarchicalStateMachine.deinit();
}

uint64_t sub_19B56F77C()
{
  return swift_defaultActor_deallocate();
}

uint64_t HierarchicalStateMachine.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_19B56F794()
{
  return HierarchicalStateMachine.unownedExecutor.getter();
}

uint64_t sub_19B56F7AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

void sub_19B56F7C4()
{
  HierarchicalStateMachine.currentValue.getter();
}

uint64_t sub_19B56F7E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56F7F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B571BA8;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t sub_19B56F858()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19B55FFB4;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_19B56F8B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_19B55FFB4;
  return HierarchicalStateMachine.enqueue(event:)(a1);
}

uint64_t sub_19B56F900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B55FFB4;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t sub_19B56F960()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_19B55FFB4;
  v2[2] = v0;
  return swift_task_switch();
}

void sub_19B56F9BC(void (*a1)(void))
{
  a1();
  sub_19B5B9F80();
  __break(1u);
}

uint64_t sub_19B56FA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B56FA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (qword_1EE3F6B50 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  sub_19B5BA07C();
  LOBYTE(v1) = sub_19B5787AC(v1, *(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease();
  if ((v1 & 1) != 0)
  {
    (*(void (**)(unint64_t (*)(), _QWORD, const char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 104) + 128))(sub_19B578874, 0, "/Library/Caches/com.apple.xbs/Sources/HMFoundation/HMFoundation/Swift/AsyncSerialQueue.swift", 92, 2, 114);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_beginAccess();
  v6 = *(_QWORD *)(v0 + 104);
  if (*(_QWORD *)(*(_QWORD *)(v3 + 120) + 24) || (*(_BYTE *)(v6 + 112) & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 120);
    sub_19B57003C();
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v8;
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v9;
    *v9 = v0;
    v9[1] = sub_19B56FCF8;
    return sub_19B5B9FEC();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 112);
    v11 = *(_QWORD *)(v0 + 120);
    *(_BYTE *)(v6 + 112) = 1;
    sub_19B5719DC(v11, v12);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4);
    v14 = *(_QWORD *)(v0 + 112);
    if (v13 == 1)
    {
      sub_19B5719A0(*(_QWORD *)(v0 + 112), &qword_1EE3F7C00);
    }
    else
    {
      sub_19B5B9DDC();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v4);
    }
    v15 = swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v15;
    *(_QWORD *)v15 = v0;
    *(_QWORD *)(v15 + 8) = sub_19B56FDBC;
    v16 = *(_QWORD *)(v0 + 104);
    v17 = *(_OWORD *)(v0 + 80);
    *(_QWORD *)(v15 + 48) = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v15 + 56) = v16;
    *(_OWORD *)(v15 + 32) = v17;
    return swift_task_switch();
  }
}

uint64_t sub_19B56FCF8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56FD58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = sub_19B56FDBC;
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_OWORD *)(v0 + 80);
  *(_QWORD *)(v1 + 48) = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v1 + 56) = v2;
  *(_OWORD *)(v1 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_19B56FDBC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B56FE20()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  sub_19B578AA4();
  sub_19B5719A0(v1, &qword_1EE3F7C00);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B56FE80()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  sub_19B578AA4();
  sub_19B5719A0(v1, &qword_1EE3F7C00);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void type metadata accessor for HierarchicalStateMachine.MetaState()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

void sub_19B56FEEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B55FFB4;
  sub_19B56D54C(a1, v1);
}

uint64_t sub_19B56FF40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_19B56FFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80);
  v3 = v0 + ((v2 + 72) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_19B55FFB4;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_19B571BA8;
  sub_19B56DE2C(v3);
}

unint64_t sub_19B57003C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3F79D0;
  if (!qword_1EE3F79D0)
  {
    v1 = type metadata accessor for AsyncSerialQueue();
    result = MEMORY[0x1A1AC3B08](&protocol conformance descriptor for AsyncSerialQueue, v1);
    atomic_store(result, (unint64_t *)&qword_1EE3F79D0);
  }
  return result;
}

uint64_t sub_19B570084(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t *v28;

  v27 = a4;
  v28 = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8, v11, v12);
  v13 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  MEMORY[0x1E0C80A78](v14, v15, v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_19B5B9E24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a1, v8);
  v20 = sub_19B57003C();
  v21 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = a3;
  *((_QWORD *)v23 + 3) = v20;
  *((_QWORD *)v23 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v23[v21], v13, v8);
  v24 = &v23[v22];
  *(_QWORD *)v24 = v27;
  *((_QWORD *)v24 + 1) = a5;
  swift_retain_n();
  swift_retain();
  v25 = sub_19B5714BC((uint64_t)v18, (uint64_t)&unk_1EE3F7BF8, (uint64_t)v23);
  *v28 = v25;
  return swift_release();
}

uint64_t sub_19B57021C(uint64_t a1)
{
  uint64_t v1;

  return sub_19B570084(a1, *(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

void sub_19B570228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_19B55FFB4;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_19B55F834;
  sub_19B56DE2C(v2);
}

void sub_19B5702A0()
{
  JUMPOUT(0x1A1AC3B08);
}

void sub_19B5702B4()
{
  type metadata accessor for HierarchicalStateMachine.RootState();
}

void type metadata accessor for HierarchicalStateMachine()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t method lookup function for HierarchicalStateMachine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HierarchicalStateMachine.__allocating_init(rootState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_19B5703C0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19B570418(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _BOOL8 v20;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 = v10 + v8;
  }
  v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 2, *(_QWORD *)(a3 + 16)))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            v18 = 4;
          }
          else
          {
            v20 = v19 != 0;
            v13 = v19 >= 0xFF;
            v18 = 2;
            if (!v13)
              v18 = v20;
          }
        }
        else
        {
          v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t sub_19B5705B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 2, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_19B57060C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_19B5706FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *sub_19B57084C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_19B57093C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t sub_19B570A8C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 2;
  v7 = *(_QWORD *)(v4 + 64);
  if (v5 <= 1)
  {
    v6 = 0;
    if (v7 <= 3)
    {
      v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        v8 = 4;
      }
      else
      {
        v10 = v9 != 0;
        v11 = v9 >= 0xFF;
        v8 = 2;
        if (!v11)
          v8 = v10;
      }
    }
    else
    {
      v8 = 1;
    }
    v7 += v8;
  }
  if (!a2)
    return 0;
  v12 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_29;
  v13 = 8 * v7;
  if (v7 <= 3)
  {
    v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v7);
      if (!v14)
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_29:
      if (v6)
      {
        v18 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v18 >= 3)
          return v18 - 2;
        else
          return 0;
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_29;
LABEL_20:
  v16 = (v14 - 1) << v13;
  if (v7 > 3)
    v16 = 0;
  if ((_DWORD)v7)
  {
    if (v7 <= 3)
      v17 = v7;
    else
      v17 = 4;
    __asm { BR              X12 }
  }
  return v6 + v16 + 1;
}

void sub_19B570C20(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = v7 - 2;
  v9 = *(_QWORD *)(v6 + 64);
  if (v7 <= 1)
  {
    v8 = 0;
    if (v9 <= 3)
    {
      v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 += v10;
  }
  v13 = a3 >= v8;
  v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      v17 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v17))
      {
        v15 = 4u;
      }
      else if (v17 >= 0x100)
      {
        v15 = 2;
      }
      else
      {
        v15 = v17 > 1;
      }
    }
    else
    {
      v15 = 1u;
    }
  }
  else
  {
    v15 = 0u;
  }
  if (v8 < a2)
  {
    v16 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v18 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v18;
          *((_BYTE *)a1 + 2) = BYTE2(v18);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v18;
        }
        else
        {
          *(_BYTE *)a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_19B570E3C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t sub_19B570E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t sub_19B570E64(uint64_t (*a1)(void))
{
  return a1();
}

void sub_19B570E70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_19B55FFB4;
  sub_19B56EB00(a1, a2, v6, v7, v8);
}

void sub_19B570EEC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = (uint64_t *)v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_19B55FFB4;
  sub_19B56F298(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_19B570F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  v5 = *(int **)(v2 + 64);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_19B55FFB4;
  v9 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_19B55FFB4;
  return v9(a2);
}

void sub_19B570FF4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = (uint64_t *)v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_19B55FFB4;
  sub_19B56F44C(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_19B571074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  v7[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B5710EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v2, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v1, 0, 1, v4);
  swift_beginAccess();
  v6 = *(_QWORD *)(v0 + 48);
  if (*(_QWORD *)(*(_QWORD *)(v3 + 120) + 24) || (*(_BYTE *)(v6 + 112) & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 88);
    sub_19B57003C();
    v8 = swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v9;
    *v9 = v0;
    v9[1] = sub_19B5712D0;
    return sub_19B5B9FEC();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 88);
    *(_BYTE *)(v6 + 112) = 1;
    sub_19B5719DC(v11, v12);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4);
    v14 = *(_QWORD *)(v0 + 80);
    if (v13 == 1)
    {
      sub_19B5719A0(*(_QWORD *)(v0 + 80), &qword_1EE3F7C00);
    }
    else
    {
      sub_19B5B9DDC();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v4);
    }
    v15 = swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v15;
    *(_QWORD *)v15 = v0;
    *(_QWORD *)(v15 + 8) = sub_19B571398;
    v16 = *(_QWORD *)(v0 + 40);
    v17 = *(_OWORD *)(v0 + 64);
    *(_QWORD *)(v15 + 56) = *(_QWORD *)(v0 + 48);
    *(_OWORD *)(v15 + 40) = v17;
    *(_QWORD *)(v15 + 32) = v16;
    return swift_task_switch();
  }
}

uint64_t sub_19B5712D0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B571330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = sub_19B571398;
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 56) = *(_QWORD *)(v0 + 48);
  *(_OWORD *)(v1 + 40) = v3;
  *(_QWORD *)(v1 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_19B571398()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B5713FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  sub_19B578AA4();
  sub_19B5719A0(v1, &qword_1EE3F7C00);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B57145C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  sub_19B578AA4();
  sub_19B5719A0(v1, &qword_1EE3F7C00);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B5714BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_19B5B9E24();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19B5B9E18();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_19B5719A0(a1, &qword_1EE3F6BB8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19B5B9DD0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_19B5715F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t sub_19B57160C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;
  uint64_t v6[10];

  if (qword_1EE3F6B50 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 40);
  sub_19B5BA07C();
  sub_19B579660(v6, v1);
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  sub_19B57003C();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *v3 = v0;
  v3[1] = sub_19B57173C;
  v6[8] = 120;
  v6[9] = MEMORY[0x1E0DEE9C0] + 8;
  return sub_19B5BA0A0();
}

uint64_t sub_19B57173C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B5717C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B5717D4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B55D164;
  return v6(a1);
}

uint64_t sub_19B571838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B5718D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = (_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = *v10;
  v12 = v10[1];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_19B55FFB4;
  return sub_19B571074(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_19B571998(uint64_t a1)
{
  uint64_t v1;

  return sub_19B578648(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_19B5719A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19B5719DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19B571A24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55D164;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55D164;
  return v8(a1);
}

void sub_19B571AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_19B55D164;
  sub_19B56D8C4(a1, a2, v7, v6);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_19B571B38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_19B55FFB4;
  sub_19B56CB74(a1, a2, v7, v6);
}

uint64_t sub_19B571BB8()
{
  uint64_t v0;

  v0 = sub_19B5B9CC8();
  sub_19B5B9CC8();
  return v0;
}

uint64_t HierarchicalStateMachine.HandlerDelegate.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 24);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v3);
  sub_19B5B9DC4();
  return sub_19B5B9DAC();
}

uint64_t HierarchicalStateMachine.HandlerDelegate.enqueue(delegating:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 32);
  MEMORY[0x1E0C80A78](a1, a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v3);
  sub_19B5B9DC4();
  return sub_19B5B9DAC();
}

uint64_t sub_19B571CFC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 56);
}

uint64_t sub_19B571D04(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 48);
}

uint64_t sub_19B571D18()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_19B571D40(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_19B571D74(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_19B571DD0(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for HierarchicalStateMachine.HandlerDelegate()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

uint64_t sub_19B571E18()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8) + 64;
    v6 = v2;
    result = swift_checkMetadataState();
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout3();
      v7 = &v5;
      swift_getTupleTypeLayout3();
      v8 = &v4;
      v9 = v2;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

_QWORD *sub_19B571EDC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  _QWORD *result;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *, _QWORD *, uint64_t);
  void (*v21)(_QWORD *, _QWORD *, uint64_t);

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = v7 + v9;
  v11 = *(_QWORD *)(v8 + 64);
  v12 = *(_DWORD *)(v6 + 80);
  if (((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7 <= v7)
    v13 = *(_QWORD *)(v6 + 64);
  else
    v13 = ((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7;
  if ((v12 | v9) > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || (unint64_t)(v13 + 1) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + (((v12 | v9) + 16) & ~(v12 | v9)));
    swift_retain();
  }
  else
  {
    v19 = ~v9;
    switch(*((_BYTE *)a2 + v13))
    {
      case 0:
        (*(void (**)(_QWORD *, _QWORD *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
        *((_BYTE *)v4 + v13) = 0;
        break;
      case 1:
        v20 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16);
        v20(a1, a2, v5);
        (*(void (**)(void))(v8 + 16))();
        v20((_QWORD *)(((((unint64_t)v4 + v10) & v19) + v11 + v12) & ~v12), (_QWORD *)(((((unint64_t)a2 + v10) & v19) + v11 + v12) & ~v12), v5);
        *((_BYTE *)v4 + v13) = 1;
        break;
      case 2:
        v21 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16);
        v21(a1, a2, v5);
        (*(void (**)(void))(v8 + 16))();
        v21((_QWORD *)(((((unint64_t)v4 + v10) & v19) + v11 + v12) & ~v12), (_QWORD *)(((((unint64_t)a2 + v10) & v19) + v11 + v12) & ~v12), v5);
        *((_BYTE *)v4 + v13) = 2;
        break;
      case 3:
        (*(void (**)(_QWORD *, _QWORD *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
        *((_BYTE *)v4 + v13) = 3;
        break;
      default:
        if (v13 <= 3)
          v18 = v13;
        else
          v18 = 4;
        __asm { BR              X14 }
        return result;
    }
  }
  return v4;
}

uint64_t sub_19B57214C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  void (*v18)(uint64_t, uint64_t);

  v2 = a1;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = v6 + v8;
  v10 = *(_QWORD *)(v7 + 64);
  v11 = *(unsigned __int8 *)(v5 + 80);
  if (((v10 + v11 + ((v6 + v8) & ~v8)) & ~v11) + v6 > v6)
    v6 += (v10 + v11 + ((v6 + v8) & ~v8)) & ~v11;
  v13 = ~v8;
  switch(*(_BYTE *)(a1 + v6))
  {
    case 0:
    case 3:
      v14 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
      v15 = *(_QWORD *)(a2 + 16);
      break;
    case 1:
    case 2:
      v18 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
      v18(a1, v3);
      v16 = (v9 + v2) & v13;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v16, v4);
      a1 = (v16 + v10 + v11) & ~v11;
      v15 = v3;
      v14 = (uint64_t (*)(uint64_t, uint64_t))v18;
      break;
    default:
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X15 }
      return result;
  }
  return v14(a1, v15);
}

uint64_t sub_19B5722B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = *(_QWORD *)(v8 + 64);
  v12 = *(unsigned __int8 *)(v6 + 80);
  if (((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7 <= v7)
    v13 = *(_QWORD *)(v6 + 64);
  else
    v13 = ((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7;
  v15 = ~v9;
  v16 = ~v12;
  switch(*(_BYTE *)(a2 + v13))
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
      v17 = 0;
      break;
    case 1:
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      v23 = *(_QWORD *)(a3 + 24);
      v25 = *(_QWORD *)(v8 + 64);
      v21(a1, a2, v5);
      v18 = (v10 + a2) & v15;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v10 + a1) & v15, v18, v23);
      v21((((v10 + a1) & v15) + v25 + v12) & v16, (v18 + v25 + v12) & v16, v5);
      v17 = 1;
      break;
    case 2:
      v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      v24 = *(_QWORD *)(a3 + 24);
      v26 = *(_QWORD *)(v8 + 64);
      v22(a1, a2, v5);
      v19 = (v10 + a2) & v15;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v10 + a1) & v15, v19, v24);
      v22((((v10 + a1) & v15) + v26 + v12) & v16, (v19 + v26 + v12) & v16, v5);
      v17 = 2;
      break;
    case 3:
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
      v17 = 3;
      break;
    default:
      if (v13 <= 3)
        v14 = v13;
      else
        v14 = 4;
      __asm { BR              X14 }
      return result;
  }
  *(_BYTE *)(a1 + v13) = v17;
  return a1;
}

uint64_t sub_19B5724E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v34 = *(_QWORD *)(a3 + 24);
    v8 = *(_QWORD *)(v34 - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = v7 + v9;
    v11 = *(unsigned __int8 *)(v6 + 80);
    v33 = *(_QWORD *)(v8 + 64);
    if (((v33 + v11 + ((v7 + v9) & ~v9)) & ~v11) + v7 <= v7)
      v12 = *(_QWORD *)(v6 + 64);
    else
      v12 = ((v33 + v11 + ((v7 + v9) & ~v9)) & ~v11) + v7;
    v14 = ~v9;
    v32 = ~v11;
    switch(*(_BYTE *)(a1 + v12))
    {
      case 0:
      case 3:
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
        break;
      case 1:
      case 2:
        v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
        v15(a1, v5);
        v16 = v10 + a1;
        v31 = v10;
        v17 = v14;
        v18 = v16 & v14;
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v18, v34);
        v19 = v18 + v33 + v11;
        v14 = v17;
        v10 = v31;
        v15(v19 & v32, v5);
        break;
      default:
        if (v12 <= 3)
          v13 = v12;
        else
          v13 = 4;
        __asm { BR              X13 }
        return result;
    }
    switch(*(_BYTE *)(a2 + v12))
    {
      case 0:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
        v21 = 0;
        break;
      case 1:
        v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
        v22(a1, a2, v5);
        v23 = v14;
        v24 = (v10 + a1) & v14;
        v25 = (v10 + a2) & v23;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v24, v25, v34);
        v22((v24 + v33 + v11) & v32, (v25 + v33 + v11) & v32, v5);
        v21 = 1;
        break;
      case 2:
        v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
        v26(a1, a2, v5);
        v27 = v14;
        v28 = (v10 + a1) & v14;
        v29 = (v10 + a2) & v27;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v28, v29, v34);
        v26((v28 + v33 + v11) & v32, (v29 + v33 + v11) & v32, v5);
        v21 = 2;
        break;
      case 3:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
        v21 = 3;
        break;
      default:
        if (v12 <= 3)
          v20 = v12;
        else
          v20 = 4;
        __asm { BR              X12 }
        return result;
    }
    *(_BYTE *)(a1 + v12) = v21;
  }
  return a1;
}

uint64_t sub_19B572800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = *(_QWORD *)(v8 + 64);
  v12 = *(unsigned __int8 *)(v6 + 80);
  if (((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7 <= v7)
    v13 = *(_QWORD *)(v6 + 64);
  else
    v13 = ((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7;
  v15 = ~v9;
  v16 = ~v12;
  switch(*(_BYTE *)(a2 + v13))
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 32))(a1, a2, *(_QWORD *)(a3 + 16));
      v17 = 0;
      break;
    case 1:
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
      v23 = *(_QWORD *)(a3 + 24);
      v25 = *(_QWORD *)(v8 + 64);
      v21(a1, a2, v5);
      v18 = (v10 + a2) & v15;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))((v10 + a1) & v15, v18, v23);
      v21((((v10 + a1) & v15) + v25 + v12) & v16, (v18 + v25 + v12) & v16, v5);
      v17 = 1;
      break;
    case 2:
      v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
      v24 = *(_QWORD *)(a3 + 24);
      v26 = *(_QWORD *)(v8 + 64);
      v22(a1, a2, v5);
      v19 = (v10 + a2) & v15;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))((v10 + a1) & v15, v19, v24);
      v22((((v10 + a1) & v15) + v26 + v12) & v16, (v19 + v26 + v12) & v16, v5);
      v17 = 2;
      break;
    case 3:
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 32))(a1, a2, *(_QWORD *)(a3 + 16));
      v17 = 3;
      break;
    default:
      if (v13 <= 3)
        v14 = v13;
      else
        v14 = 4;
      __asm { BR              X14 }
      return result;
  }
  *(_BYTE *)(a1 + v13) = v17;
  return a1;
}

uint64_t sub_19B572A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v34 = *(_QWORD *)(a3 + 24);
    v8 = *(_QWORD *)(v34 - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = v7 + v9;
    v11 = *(unsigned __int8 *)(v6 + 80);
    v33 = *(_QWORD *)(v8 + 64);
    if (((v33 + v11 + ((v7 + v9) & ~v9)) & ~v11) + v7 <= v7)
      v12 = *(_QWORD *)(v6 + 64);
    else
      v12 = ((v33 + v11 + ((v7 + v9) & ~v9)) & ~v11) + v7;
    v14 = ~v9;
    v32 = ~v11;
    switch(*(_BYTE *)(a1 + v12))
    {
      case 0:
      case 3:
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
        break;
      case 1:
      case 2:
        v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
        v15(a1, v5);
        v16 = v10 + a1;
        v31 = v10;
        v17 = v14;
        v18 = v16 & v14;
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v18, v34);
        v19 = v18 + v33 + v11;
        v14 = v17;
        v10 = v31;
        v15(v19 & v32, v5);
        break;
      default:
        if (v12 <= 3)
          v13 = v12;
        else
          v13 = 4;
        __asm { BR              X13 }
        return result;
    }
    switch(*(_BYTE *)(a2 + v12))
    {
      case 0:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
        v21 = 0;
        break;
      case 1:
        v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
        v22(a1, a2, v5);
        v23 = v14;
        v24 = (v10 + a1) & v14;
        v25 = (v10 + a2) & v23;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v24, v25, v34);
        v22((v24 + v33 + v11) & v32, (v25 + v33 + v11) & v32, v5);
        v21 = 1;
        break;
      case 2:
        v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
        v26(a1, a2, v5);
        v27 = v14;
        v28 = (v10 + a1) & v14;
        v29 = (v10 + a2) & v27;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v28, v29, v34);
        v26((v28 + v33 + v11) & v32, (v29 + v33 + v11) & v32, v5);
        v21 = 2;
        break;
      case 3:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
        v21 = 3;
        break;
      default:
        if (v12 <= 3)
          v20 = v12;
        else
          v20 = 4;
        __asm { BR              X12 }
        return result;
    }
    *(_BYTE *)(a1 + v12) = v21;
  }
  return a1;
}

uint64_t sub_19B572D4C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v9;
  unsigned int v11;
  int v12;
  unsigned int v13;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = ((((v4 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64)
       + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
     + v4;
  if (v5 <= v4)
    v6 = v4;
  else
    v6 = v5;
  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_22;
  v7 = v6 + 1;
  v8 = 8 * (v6 + 1);
  if ((v6 + 1) <= 3)
  {
    v11 = ((a2 + ~(-1 << v8) - 252) >> v8) + 1;
    if (HIWORD(v11))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v11 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v11 < 2)
    {
LABEL_22:
      v13 = *(unsigned __int8 *)(a1 + v6);
      if (v13 >= 4)
        return (v13 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_22;
LABEL_15:
  v12 = (v9 - 1) << v8;
  if (v7 > 3)
    v12 = 0;
  if (!(_DWORD)v7)
    return (v12 + 253);
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_19B572E34 + 4 * byte_19B5C6610[(v7 - 1)]))();
}

void sub_19B572E80(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((((v6 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64)
       + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + v6;
  if (v7 <= v6)
    v7 = v6;
  v8 = v7 + 1;
  if (a3 < 0xFD)
  {
    v9 = 0u;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 + ~(-1 << (8 * v8)) - 252) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (a2 <= 0xFC)
    __asm { BR              X11 }
  v10 = a2 - 253;
  if (v8 < 4)
  {
    if ((_DWORD)v7 != -1)
    {
      v12 = v10 & ~(-1 << (8 * v8));
      bzero(a1, v8);
      if ((_DWORD)v8 == 3)
      {
        *a1 = v12;
        *((_BYTE *)a1 + 2) = BYTE2(v12);
      }
      else if ((_DWORD)v8 == 2)
      {
        *a1 = v12;
      }
      else
      {
        *(_BYTE *)a1 = v12;
      }
    }
  }
  else
  {
    bzero(a1, v7 + 1);
    *(_DWORD *)a1 = v10;
  }
  __asm { BR              X10 }
}

uint64_t sub_19B57304C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = ((((v3 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64)
       + *(unsigned __int8 *)(v2 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
     + v3;
  if (v4 <= v3)
    v5 = v3;
  else
    v5 = v4;
  if (*(unsigned __int8 *)(a1 + v5) < 4u)
    return *(unsigned __int8 *)(a1 + v5);
  if (v5 <= 3)
    v6 = v5;
  else
    v6 = 4;
  return ((uint64_t (*)(void))((char *)&loc_19B5730B8 + 4 * byte_19B5C661E[v6]))();
}

void sub_19B573100(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  size_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = ((((v5 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64)
       + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + v5;
  if (a2 > 3)
  {
    if (v6 <= v5)
      v7 = *(_QWORD *)(v4 + 64);
    else
      v7 = ((((v5 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80))
           + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64)
           + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
         + v5;
    v8 = a2 - 4;
    if (v7 < 4)
    {
      v9 = v8 >> (8 * v7);
      v10 = v8 & ~(-1 << (8 * v7));
      a1[v7] = v9 + 4;
      bzero(a1, v7);
      if ((_DWORD)v7 == 3)
      {
        *(_WORD *)a1 = v10;
        a1[2] = BYTE2(v10);
      }
      else if ((_DWORD)v7 == 2)
      {
        *(_WORD *)a1 = v10;
      }
      else
      {
        *a1 = v10;
      }
    }
    else
    {
      a1[v7] = 4;
      bzero(a1, v7);
      *(_DWORD *)a1 = v8;
    }
  }
  else
  {
    if (v6 > v5)
      v5 += (((v5 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 80))
           + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64)
           + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    a1[v5] = a2;
  }
}

void type metadata accessor for HierarchicalStateMachine.StateTransition()
{
  JUMPOUT(0x1A1AC3A9CLL);
}

ValueMetadata *type metadata accessor for StateMachine()
{
  return &type metadata for StateMachine;
}

uint64_t dispatch thunk of StateMachine.StateValue.stateLabel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_19B57321C()
{
  qword_1EE3F7D78 = 0x746C7561666544;
  unk_1EE3F7D80 = 0xE700000000000000;
}

uint64_t static Flow.defaultLogCategory.getter()
{
  uint64_t v0;

  if (qword_1EE3F6B28 != -1)
    swift_once();
  v0 = qword_1EE3F7D78;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_19B57329C()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E40);
  swift_allocObject();
  result = sub_19B5BA070();
  qword_1EE3F7D88 = result;
  return result;
}

uint64_t static Flow.$flow.getter()
{
  return sub_19B573638(&qword_1EE3F6B30);
}

uint64_t static Flow.flow.getter()
{
  uint64_t v1;

  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  return v1;
}

uint64_t sub_19B573364()
{
  uint64_t result;

  if (qword_1EE3F6B28 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E38);
  swift_allocObject();
  swift_bridgeObjectRetain();
  result = sub_19B5BA070();
  qword_1EE3F7D90 = result;
  return result;
}

uint64_t static Flow.$category.getter()
{
  return sub_19B573638(&qword_1EE3F6B38);
}

uint64_t static Flow.category.getter()
{
  return sub_19B5734C0(&qword_1EE3F6B38);
}

uint64_t sub_19B573428()
{
  uint64_t result;

  sub_19B5B9CF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E38);
  swift_allocObject();
  result = sub_19B5BA070();
  qword_1EE3F7D98 = result;
  return result;
}

uint64_t static Flow.$subsystem.getter()
{
  return sub_19B573638(&qword_1EE3F6B40);
}

uint64_t static Flow.subsystem.getter()
{
  return sub_19B5734C0(&qword_1EE3F6B40);
}

uint64_t sub_19B5734C0(_QWORD *a1)
{
  uint64_t v2;

  if (*a1 != -1)
    swift_once();
  sub_19B5BA07C();
  return v2;
}

uint64_t sub_19B57350C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v0 = sub_19B5B9CBC();
  MEMORY[0x1E0C80A78](v0, v1, v2);
  if (qword_1EE3F6B40 != -1)
    swift_once();
  sub_19B5BA07C();
  if (qword_1EE3F6B38 != -1)
    swift_once();
  sub_19B5BA07C();
  sub_19B5B9CB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E30);
  swift_allocObject();
  result = sub_19B5BA070();
  qword_1EE3F7DA0 = result;
  return result;
}

uint64_t static Flow.$logger.getter()
{
  return sub_19B573638(&qword_1EE3F6B48);
}

uint64_t sub_19B573638(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t static Flow.logger.getter()
{
  if (qword_1EE3F6B48 != -1)
    swift_once();
  return sub_19B5BA07C();
}

uint64_t static Flow.log(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19B5736E8(a1, a2, MEMORY[0x1E0DF2290]);
}

uint64_t static Flow.info(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19B5736E8(a1, a2, MEMORY[0x1E0DF2270]);
}

uint64_t static Flow.debug(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19B5736E8(a1, a2, MEMORY[0x1E0DF2278]);
}

uint64_t sub_19B5736E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;

  v4 = sub_19B5B9CBC();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  MEMORY[0x1E0C80A78](v4, v5, v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_19B5B9C80();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11, v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = 0x203A776F6C465BLL;
  v29 = 0xE700000000000000;
  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  v15 = v27;
  if (v27)
  {
    v16 = objc_msgSend(v27, sel_UUID);

    sub_19B5B9C74();
    sub_19B5B9C68();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  sub_19B5B9D04();
  sub_19B5B9D04();
  v18 = v28;
  v17 = v29;
  if (qword_1EE3F6B48 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v19 = sub_19B5B9CA4();
  v20 = a3();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v28 = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    v27 = (id)sub_19B575598(v18, v17, &v28);
    sub_19B5B9ED8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19B546000, v19, v20, "%s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC3BA4](v22, -1, -1);
    MEMORY[0x1A1AC3BA4](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v8, v26);
}

uint64_t static Flow.withNewFlow<A>(_:_:)()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v0 = _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0();
  v1 = sub_19B5B9CF8();
  v3 = v2;
  v4 = qword_1EE3F6B28;
  v5 = v0;
  if (v4 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  static Flow.with<A>(_:subsystem:category:_:)((uint64_t)v0, v1, v3);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static Flow.with<A>(_:subsystem:category:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[4];

  v3 = a1;
  if (qword_1EE3F6B30 != -1)
    a1 = swift_once();
  v5[1] = v5;
  v5[3] = v3;
  MEMORY[0x1E0C80A78](a1, a2, a3);
  return sub_19B5BA094();
}

uint64_t static Flow.withNewFlow<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_19B573C2C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;

  v1 = *(_QWORD *)(v0 + 56);
  v15 = *(_OWORD *)(v0 + 40);
  v2 = _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0();
  *(_QWORD *)(v0 + 64) = v2;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v15;
  v4 = sub_19B5B9CF8();
  v6 = v5;
  *(_QWORD *)(v0 + 80) = v5;
  v7 = qword_1EE3F6B28;
  v8 = v2;
  if (v7 != -1)
    swift_once();
  v10 = qword_1EE3F7D78;
  v9 = unk_1EE3F7D80;
  *(_QWORD *)(v0 + 88) = unk_1EE3F7D80;
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v11;
  *v11 = v0;
  v11[1] = sub_19B573D60;
  v12 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 16);
  v11[10] = v3;
  v11[11] = v12;
  v11[8] = v9;
  v11[9] = &unk_1EE3F7DB8;
  v11[6] = v6;
  v11[7] = v10;
  v11[4] = v8;
  v11[5] = v4;
  v11[3] = v13;
  return swift_task_switch();
}

uint64_t sub_19B573D60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_19B573DEC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B573E20()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Flow.with<A>(_:subsystem:category:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[10] = a8;
  v8[11] = v10;
  v8[8] = a6;
  v8[9] = a7;
  v8[6] = a4;
  v8[7] = a5;
  v8[4] = a2;
  v8[5] = a3;
  v8[3] = a1;
  return swift_task_switch();
}

uint64_t sub_19B573EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;

  if (qword_1EE3F6B30 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 32);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v6;
  v7 = *(_OWORD *)(v0 + 72);
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v3;
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v5;
  *(_QWORD *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 56) = v7;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v8;
  *v8 = v0;
  v8[1] = sub_19B573FB8;
  return sub_19B5BA0A0();
}

uint64_t sub_19B573FB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B57402C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Flow.withChildFlow<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  void (*v21)(char *, uint64_t);
  id v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD v41[3];
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[4];

  v46 = a3;
  v47 = a4;
  v41[1] = a1;
  v41[2] = a2;
  v48 = a6;
  v7 = sub_19B5B9CBC();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x1E0C80A78](v7, v8, v9);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_19B5B9C80();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14, v15);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  v18 = (id)v50[0];
  v49 = a5;
  if (!v50[0])
    v18 = objc_msgSend((id)objc_opt_self(), sel_untrackedPlaceholderFlow);
  v19 = objc_msgSend((id)objc_opt_self(), sel_internalOnlyInitializer);
  v50[0] = 0;
  v50[1] = 0xE000000000000000;
  sub_19B5B9F08();
  swift_bridgeObjectRelease();
  strcpy((char *)v50, "[ChildFlow: ");
  BYTE5(v50[1]) = 0;
  HIWORD(v50[1]) = -5120;
  v42 = v19;
  v20 = objc_msgSend(v19, sel_UUID);
  sub_19B5B9C74();

  sub_19B576334();
  sub_19B5B9FD4();
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v17, v12);
  sub_19B5B9D04();
  v45 = v18;
  v22 = objc_msgSend(v18, sel_UUID);
  sub_19B5B9C74();

  sub_19B5B9FD4();
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  v21(v17, v12);
  sub_19B5B9D04();
  sub_19B5B9D04();
  v24 = v50[0];
  v23 = v50[1];
  if (qword_1EE3F6B48 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v25 = sub_19B5B9CA4();
  v26 = sub_19B5B9EA8();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v50[0] = v28;
    *(_DWORD *)v27 = 136315138;
    swift_bridgeObjectRetain();
    v50[3] = sub_19B575598(v24, v23, v50);
    sub_19B5B9ED8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19B546000, v25, v26, "%s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC3BA4](v28, -1, -1);
    MEMORY[0x1A1AC3BA4](v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v29 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  v30 = v49;
  MEMORY[0x1E0C80A78](v29, v31, v32);
  v33 = v46;
  v41[-4] = v30;
  v41[-3] = v33;
  v41[-2] = v47;
  v34 = sub_19B5B9CF8();
  v36 = v35;
  v37 = qword_1EE3F6B28;
  v38 = (uint64_t)v42;
  v39 = v42;
  if (v37 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  static Flow.with<A>(_:subsystem:category:_:)(v38, v34, v36);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id static Flow.flowOrUntracked.getter()
{
  id result;
  void *v1;

  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  result = v1;
  if (!v1)
    return objc_msgSend((id)objc_opt_self(), sel_untrackedPlaceholderFlow);
  return result;
}

uint64_t static Flow.withChildFlow<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  v7 = sub_19B5B9CBC();
  v6[10] = v7;
  v6[11] = *(_QWORD *)(v7 - 8);
  v6[12] = swift_task_alloc();
  v8 = sub_19B5B9C80();
  v6[13] = v8;
  v6[14] = *(_QWORD *)(v8 - 8);
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B574624()
{
  uint64_t v0;
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[2];

  v1 = (id *)(v0 + 16);
  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  v2 = *v1;
  if (!*v1)
    v2 = objc_msgSend((id)objc_opt_self(), sel_untrackedPlaceholderFlow);
  *(_QWORD *)(v0 + 128) = v2;
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = objc_msgSend((id)objc_opt_self(), sel_internalOnlyInitializer);
  *(_QWORD *)(v0 + 136) = v6;
  sub_19B5B9F08();
  swift_bridgeObjectRelease();
  strcpy((char *)v37, "[ChildFlow: ");
  BYTE5(v37[1]) = 0;
  HIWORD(v37[1]) = -5120;
  v7 = objc_msgSend(v6, sel_UUID);
  sub_19B5B9C74();

  sub_19B576334();
  sub_19B5B9FD4();
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v4, v5);
  sub_19B5B9D04();
  v9 = objc_msgSend(v2, sel_UUID);
  sub_19B5B9C74();

  sub_19B5B9FD4();
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  v8(v4, v5);
  sub_19B5B9D04();
  sub_19B5B9D04();
  v10 = v37[0];
  v11 = v37[1];
  if (qword_1EE3F6B48 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v12 = sub_19B5B9CA4();
  v13 = sub_19B5B9EA8();
  v14 = os_log_type_enabled(v12, v13);
  v16 = *(_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 80);
  if (v14)
  {
    v36 = *(_QWORD *)(v0 + 80);
    v35 = *(_QWORD *)(v0 + 88);
    v18 = (uint8_t *)swift_slowAlloc();
    v34 = v15;
    v19 = swift_slowAlloc();
    v37[0] = v19;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 24) = sub_19B575598(v10, v11, v37);
    sub_19B5B9ED8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19B546000, v12, v13, "%s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC3BA4](v19, -1, -1);
    MEMORY[0x1A1AC3BA4](v18, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  v20 = *(_QWORD *)(v0 + 72);
  v21 = swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v21;
  v22 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v21 + 16) = v20;
  *(_OWORD *)(v21 + 24) = v22;
  v23 = sub_19B5B9CF8();
  v25 = v24;
  *(_QWORD *)(v0 + 152) = v24;
  v26 = qword_1EE3F6B28;
  v27 = v6;
  if (v26 != -1)
    swift_once();
  v29 = qword_1EE3F7D78;
  v28 = unk_1EE3F7D80;
  *(_QWORD *)(v0 + 160) = unk_1EE3F7D80;
  swift_bridgeObjectRetain();
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v30;
  *v30 = v0;
  v30[1] = sub_19B574AB0;
  v31 = *(_QWORD *)(v0 + 72);
  v32 = *(_QWORD *)(v0 + 32);
  v30[10] = v21;
  v30[11] = v31;
  v30[8] = v28;
  v30[9] = &unk_1EE3F7DF0;
  v30[6] = v25;
  v30[7] = v29;
  v30[4] = v27;
  v30[5] = v23;
  v30[3] = v32;
  return swift_task_switch();
}

uint64_t sub_19B574AB0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 136);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_19B574B3C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B574B94()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B574C10(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_19B55FFB4;
  return v6(a1);
}

uint64_t sub_19B574C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EE3F6B38 != -1)
    a1 = swift_once();
  MEMORY[0x1E0C80A78](a1, a2, a3);
  return sub_19B5BA094();
}

uint64_t sub_19B574D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EE3F6B40 != -1)
    a1 = swift_once();
  MEMORY[0x1E0C80A78](a1, a2, a3);
  return sub_19B5BA094();
}

uint64_t sub_19B574E78@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[0] = a2;
  v16[1] = a4;
  v6 = sub_19B5B9CBC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8, v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE3F6B48 != -1)
    swift_once();
  if (qword_1EE3F6B40 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v12 = sub_19B5B9CB0();
  MEMORY[0x1E0C80A78](v12, v13, v14);
  v16[-4] = a3;
  v16[-3] = a1;
  v16[-2] = v16[0];
  sub_19B5BA094();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
}

uint64_t sub_19B575018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  return swift_task_switch();
}

uint64_t sub_19B57503C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;

  if (qword_1EE3F6B38 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v6;
  v7 = *(_OWORD *)(v0 + 72);
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v3;
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v5;
  *(_QWORD *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 56) = v7;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v8;
  *v8 = v0;
  v8[1] = sub_19B573FB8;
  return sub_19B5BA0A0();
}

uint64_t sub_19B57514C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  return swift_task_switch();
}

uint64_t sub_19B575170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;

  if (qword_1EE3F6B40 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 24) = v3;
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v5;
  v6 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 48) = v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v7;
  *v7 = v0;
  v7[1] = sub_19B575274;
  return sub_19B5BA0A0();
}

uint64_t sub_19B575274()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B5752E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  v7 = sub_19B5B9CBC();
  v6[10] = v7;
  v6[11] = *(_QWORD *)(v7 - 8);
  v6[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B575350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  if (qword_1EE3F6B48 != -1)
    swift_once();
  if (qword_1EE3F6B40 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 72);
  v5 = *(_OWORD *)(v0 + 56);
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  sub_19B5B9CB0();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v3;
  *v3 = v0;
  v3[1] = sub_19B5754B8;
  return sub_19B5BA0A0();
}

uint64_t sub_19B5754B8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*v1 + 88);
  v2 = *(_QWORD *)(*v1 + 96);
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *v1;
  *(_QWORD *)(v5 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_19B575564()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B575598(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_19B575668(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_19B57661C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_19B57661C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19B575668(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_19B5B9EE4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_19B575820(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_19B5B9F2C();
  if (!v8)
  {
    sub_19B5B9F74();
    __break(1u);
LABEL_17:
    result = sub_19B5B9FBC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_19B575820(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_19B5758B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_19B575A8C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_19B575A8C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19B5758B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_19B575A28(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_19B5B9F14();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_19B5B9F74();
      __break(1u);
LABEL_10:
      v2 = sub_19B5B9D10();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_19B5B9FBC();
    __break(1u);
LABEL_14:
    result = sub_19B5B9F74();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_19B575A28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19B575A8C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7E28);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_19B5B9FBC();
  __break(1u);
  return result;
}

uint64_t _s12HMFoundation4FlowO5erroryySSFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;

  v20 = sub_19B5B9CBC();
  v0 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v1, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19B5B9C80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = 0x203A776F6C465BLL;
  v23 = 0xE700000000000000;
  if (qword_1EE3F6B30 != -1)
    swift_once();
  sub_19B5BA07C();
  v11 = v21;
  if (v21)
  {
    v12 = objc_msgSend(v21, sel_UUID);

    sub_19B5B9C74();
    sub_19B5B9C68();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  sub_19B5B9D04();
  sub_19B5B9D04();
  v14 = v22;
  v13 = v23;
  if (qword_1EE3F6B48 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v15 = sub_19B5B9CA4();
  v16 = sub_19B5B9EB4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v22 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    v21 = (id)sub_19B575598(v14, v13, &v22);
    sub_19B5B9ED8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19B546000, v15, v16, "%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC3BA4](v18, -1, -1);
    MEMORY[0x1A1AC3BA4](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v0 + 8))(v4, v20);
}

id _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v0 = sub_19B5B9CBC();
  v21 = *(_QWORD *)(v0 - 8);
  v22 = v0;
  MEMORY[0x1E0C80A78](v0, v1, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_19B5B9C80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(), sel_internalOnlyInitializer);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_19B5B9F08();
  swift_bridgeObjectRelease();
  v24 = 0x776F6C4677654E5BLL;
  v25 = 0xEA0000000000203ALL;
  v12 = objc_msgSend(v11, sel_UUID);
  sub_19B5B9C74();

  sub_19B5B9C68();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  sub_19B5B9D04();
  swift_bridgeObjectRelease();
  sub_19B5B9D04();
  sub_19B5B9D04();
  v14 = v24;
  v13 = v25;
  if (qword_1EE3F6B48 != -1)
    swift_once();
  sub_19B5BA07C();
  swift_bridgeObjectRetain();
  v15 = sub_19B5B9CA4();
  v16 = sub_19B5B9EA8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v24 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    v23 = sub_19B575598(v14, v13, &v24);
    sub_19B5B9ED8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19B546000, v15, v16, "%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AC3BA4](v18, -1, -1);
    MEMORY[0x1A1AC3BA4](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
  return v11;
}

uint64_t sub_19B5761D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_19B5761F4()
{
  return sub_19B5765D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_19B574C74);
}

uint64_t sub_19B576210(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55D164;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55D164;
  return v8(a1);
}

uint64_t sub_19B576298(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;

  v4 = *(_QWORD *)(v1 + 16);
  v10 = *(_OWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 64);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)v7 = v2;
  *(_QWORD *)(v7 + 8) = sub_19B55FFB4;
  *(_QWORD *)(v7 + 80) = v6;
  *(_QWORD *)(v7 + 88) = v4;
  *(_OWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 56) = v5;
  *(_OWORD *)(v7 + 40) = v10;
  *(_QWORD *)(v7 + 32) = a1;
  return swift_task_switch();
}

unint64_t sub_19B576334()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3F7DD8;
  if (!qword_1EE3F7DD8)
  {
    v1 = sub_19B5B9C80();
    result = MEMORY[0x1A1AC3B08](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&qword_1EE3F7DD8);
  }
  return result;
}

uint64_t sub_19B57637C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55FFB4;
  return v8(a1);
}

ValueMetadata *type metadata accessor for Flow()
{
  return &type metadata for Flow;
}

uint64_t sub_19B576414(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;

  v4 = *(_QWORD *)(v1 + 16);
  v10 = *(_OWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 64);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)v7 = v2;
  *(_QWORD *)(v7 + 8) = sub_19B55FFB4;
  *(_QWORD *)(v7 + 80) = v6;
  *(_QWORD *)(v7 + 88) = v4;
  *(_OWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 56) = v5;
  *(_OWORD *)(v7 + 40) = v10;
  *(_QWORD *)(v7 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_19B5764B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_19B55FFB4;
  return sub_19B5752E8(a1, v5, v6, v7, v8, v4);
}

uint64_t sub_19B576530(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55FFB4;
  return v8(a1);
}

uint64_t sub_19B5765B8()
{
  return sub_19B5765D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_19B574D78);
}

uint64_t sub_19B5765D4(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[2]);
}

uint64_t sub_19B5765FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_19B574E78(v1[5], v1[6], v1[2], a1);
}

uint64_t sub_19B57661C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19B57665C()
{
  return sub_19B5761D4();
}

BOOL static HMF.NetworkInterfaceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HMF.NetworkInterfaceType.hash(into:)()
{
  return sub_19B5BA04C();
}

uint64_t HMF.NetworkInterfaceType.hashValue.getter()
{
  sub_19B5BA040();
  sub_19B5BA04C();
  return sub_19B5BA058();
}

BOOL sub_19B5766F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_19B576708()
{
  sub_19B5BA040();
  sub_19B5BA04C();
  return sub_19B5BA058();
}

uint64_t sub_19B57674C()
{
  return sub_19B5BA04C();
}

uint64_t sub_19B576774()
{
  sub_19B5BA040();
  sub_19B5BA04C();
  return sub_19B5BA058();
}

uint64_t HMF.WifiNetworkInfo.init(SSID:BSSID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t HMF.WifiNetworkInfo.SSID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_19B5767F0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t sub_19B5767F0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t HMF.WifiNetworkInfo.BSSID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_19B5767F0(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

__n128 HMF.NetworkInfo.init(name:type:macAddress:ipv4Addresses:ipv6Addresses:wifiInfo:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  __n128 result;
  __int128 v10;
  char v11;

  result = *(__n128 *)a8;
  v10 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(a9 + 56) = *(_OWORD *)a8;
  v11 = *a3;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = v11;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_OWORD *)(a9 + 72) = v10;
  return result;
}

uint64_t HMF.NetworkInfo.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void HMF.NetworkInfo.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t HMF.NetworkInfo.macAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkInfo.ipv4Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkInfo.ipv6Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkInfo.wifiInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = v1[7];
  v3 = v1[8];
  v4 = v1[9];
  v5 = v1[10];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_19B576910(v2, v3, v4, v5);
}

uint64_t sub_19B576910(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_19B5767F0(result, a2);
    return sub_19B5767F0(a3, a4);
  }
  return result;
}

__n128 HMF.NetworkServiceInfo.init(isPrimary:interfaceName:confirmedInterfaceName:ipv4Addresses:routerIPv4:networkSignatureV4:ipv6Addresses:routerIPv6:networkSignatureV6:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __n128 a12, uint64_t a13)
{
  __n128 result;

  result = a12;
  *(_BYTE *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(__n128 *)(a9 + 96) = a12;
  *(_QWORD *)(a9 + 112) = a13;
  return result;
}

uint64_t HMF.NetworkServiceInfo.isPrimary.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t HMF.NetworkServiceInfo.interfaceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.confirmedInterfaceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.ipv4Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkServiceInfo.routerIPv4.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.networkSignatureV4.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.ipv6Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkServiceInfo.routerIPv6.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.networkSignatureV6.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_19B576AA0()
{
  unint64_t result;

  result = qword_1EE3F7E48;
  if (!qword_1EE3F7E48)
  {
    result = MEMORY[0x1A1AC3B08](&protocol conformance descriptor for HMF.NetworkInterfaceType, &type metadata for HMF.NetworkInterfaceType);
    atomic_store(result, (unint64_t *)&qword_1EE3F7E48);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s20NetworkInterfaceTypeOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s20NetworkInterfaceTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_19B576BD0 + 4 * byte_19B5C66A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_19B576C04 + 4 * asc_19B5C66A0[v4]))();
}

uint64_t sub_19B576C04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B576C0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19B576C14);
  return result;
}

uint64_t sub_19B576C20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19B576C28);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_19B576C2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B576C34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19B576C40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_19B576C48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkInterfaceType()
{
  return &type metadata for HMF.NetworkInterfaceType;
}

uint64_t _s15WifiNetworkInfoVwxx(uint64_t a1)
{
  sub_19B576C8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_19B576C8C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_19B576C8C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t *_s15WifiNetworkInfoVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_19B5767F0(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v7 = a2[2];
  v6 = a2[3];
  sub_19B5767F0(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *_s15WifiNetworkInfoVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  sub_19B5767F0(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_19B576C8C(v6, v7);
  v9 = a2[2];
  v8 = a2[3];
  sub_19B5767F0(v9, v8);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_19B576C8C(v10, v11);
  return a1;
}

uint64_t *_s15WifiNetworkInfoVwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_19B576C8C(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_19B576C8C(v6, v7);
  return a1;
}

uint64_t _s15WifiNetworkInfoVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s15WifiNetworkInfoVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.WifiNetworkInfo()
{
  return &type metadata for HMF.WifiNetworkInfo;
}

uint64_t _s11NetworkInfoVwxx(_QWORD *a1)
{
  uint64_t result;
  unint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v3 = a1[8];
  if (v3 >> 60 != 15)
  {
    sub_19B576C8C(a1[7], v3);
    return sub_19B576C8C(a1[9], a1[10]);
  }
  return result;
}

uint64_t _s11NetworkInfoVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    v8 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v8;
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 56);
    sub_19B5767F0(v9, v7);
    *(_QWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 64) = v7;
    v11 = *(_QWORD *)(a2 + 72);
    v10 = *(_QWORD *)(a2 + 80);
    sub_19B5767F0(v11, v10);
    *(_QWORD *)(a1 + 72) = v11;
    *(_QWORD *)(a1 + 80) = v10;
  }
  return a1;
}

uint64_t _s11NetworkInfoVwca(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 56);
  v5 = (_OWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  if (*(_QWORD *)(a1 + 64) >> 60 == 15)
  {
    if (v6 >> 60 == 15)
    {
      v7 = *(_OWORD *)(a2 + 72);
      *v4 = *v5;
      *(_OWORD *)(a1 + 72) = v7;
    }
    else
    {
      v9 = *(_QWORD *)(a2 + 56);
      sub_19B5767F0(v9, *(_QWORD *)(a2 + 64));
      *(_QWORD *)(a1 + 56) = v9;
      *(_QWORD *)(a1 + 64) = v6;
      v11 = *(_QWORD *)(a2 + 72);
      v10 = *(_QWORD *)(a2 + 80);
      sub_19B5767F0(v11, v10);
      *(_QWORD *)(a1 + 72) = v11;
      *(_QWORD *)(a1 + 80) = v10;
    }
  }
  else if (v6 >> 60 == 15)
  {
    sub_19B577108(a1 + 56);
    v8 = *(_OWORD *)(a2 + 72);
    *v4 = *v5;
    *(_OWORD *)(a1 + 72) = v8;
  }
  else
  {
    v12 = *(_QWORD *)(a2 + 56);
    sub_19B5767F0(v12, *(_QWORD *)(a2 + 64));
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = v6;
    sub_19B576C8C(v13, v14);
    v16 = *(_QWORD *)(a2 + 72);
    v15 = *(_QWORD *)(a2 + 80);
    sub_19B5767F0(v16, v15);
    v17 = *(_QWORD *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a1 + 72) = v16;
    *(_QWORD *)(a1 + 80) = v15;
    sub_19B576C8C(v17, v18);
  }
  return a1;
}

uint64_t sub_19B577108(uint64_t a1)
{
  sub_19B576C8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_19B576C8C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s11NetworkInfoVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 64);
    if (v7 >> 60 != 15)
    {
      v9 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = v7;
      sub_19B576C8C(v9, v6);
      v10 = *(_QWORD *)(a1 + 72);
      v11 = *(_QWORD *)(a1 + 80);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      sub_19B576C8C(v10, v11);
      return a1;
    }
    sub_19B577108(a1 + 56);
  }
  v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = v8;
  return a1;
}

uint64_t _s11NetworkInfoVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s11NetworkInfoVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkInfo()
{
  return &type metadata for HMF.NetworkInfo;
}

uint64_t _s18NetworkServiceInfoVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s18NetworkServiceInfoVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18NetworkServiceInfoVwca(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t _s18NetworkServiceInfoVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18NetworkServiceInfoVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s18NetworkServiceInfoVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkServiceInfo()
{
  return &type metadata for HMF.NetworkServiceInfo;
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.currentValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55FFB4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.init(rootState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.start(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 40) + *(_QWORD *)(a3 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55D164;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55D164;
  return v7(a1, a2);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 56) + *(_QWORD *)(a3 + 56));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55FFB4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.enqueueAndWait(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 64) + *(_QWORD *)(a3 + 64));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_19B55FFB4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.runToCompletion()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 72) + *(_QWORD *)(a2 + 72));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  return v7(a1, a2);
}

uint64_t AsyncSerialQueue.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_BYTE *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = *(_QWORD *)sub_19B5B9C8C();
  *(_QWORD *)(v0 + 128) = sub_19B56F9BC;
  *(_QWORD *)(v0 + 136) = 0;
  swift_retain();
  return v0;
}

uint64_t sub_19B5779B0()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F8010);
  swift_allocObject();
  result = sub_19B5BA070();
  qword_1EE3F7E80 = result;
  return result;
}

uint64_t AsyncSerialQueue.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_BYTE *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = *(_QWORD *)sub_19B5B9C8C();
  *(_QWORD *)(v0 + 128) = sub_19B56F9BC;
  *(_QWORD *)(v0 + 136) = 0;
  swift_retain();
  return v0;
}

uint64_t sub_19B577A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B577AA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (qword_1EE3F6B50 != -1)
    swift_once();
  v1 = v0[11];
  sub_19B5BA07C();
  LOBYTE(v1) = sub_19B5787AC(v1, v0[6]);
  swift_bridgeObjectRelease();
  if ((v1 & 1) != 0)
  {
    (*(void (**)(unint64_t (*)(), _QWORD, const char *, uint64_t, uint64_t, uint64_t))(v0[11] + 128))(sub_19B578874, 0, "/Library/Caches/com.apple.xbs/Sources/HMFoundation/HMFoundation/Swift/AsyncSerialQueue.swift", 92, 2, 114);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }
  v2 = v0[12];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_19B577BCC;
  return sub_19B578290(v0[7], v0[12], v0[8], v0[9], v0[10]);
}

uint64_t sub_19B577BCC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 96);
  v3 = *v1;
  *(_QWORD *)(v3 + 112) = v0;
  swift_task_dealloc();
  sub_19B5719A0(v2, &qword_1EE3F7C00);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_19B577C5C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B577C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_19B577CAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 16) = 0;
  sub_19B57003C();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v0 + 16;
  *(_QWORD *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  *v5 = v0;
  v5[1] = sub_19B577D74;
  return sub_19B5B9FEC();
}

uint64_t sub_19B577D74()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B577DD4()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
    return (*(uint64_t (**)(void))(v0 + 8))();
  __break(1u);
  return result;
}

uint64_t sub_19B577DEC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;

  v29 = a6;
  v30 = a4;
  v31 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9, v12, v13);
  v14 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F6BB8);
  MEMORY[0x1E0C80A78](v15, v16, v17);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_19B5B9E24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, a1, v9);
  v21 = sub_19B57003C();
  v22 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v23 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject();
  *((_QWORD *)v24 + 2) = a3;
  *((_QWORD *)v24 + 3) = v21;
  *((_QWORD *)v24 + 4) = v29;
  *((_QWORD *)v24 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v22], v14, v9);
  v25 = &v24[v23];
  *(_QWORD *)v25 = v30;
  *((_QWORD *)v25 + 1) = a5;
  swift_retain_n();
  swift_retain();
  v26 = sub_19B578160((uint64_t)v19, (uint64_t)&unk_1EE3F8008, (uint64_t)v24);
  *v31 = v26;
  return swift_release();
}

uint64_t sub_19B577F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  v8[3] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  v8[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B577FF8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  v2 = v0[4];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v1, 0, 1, v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_19B57809C;
  return sub_19B578290(v0[2], v0[8], v0[5], v0[6], v0[7]);
}

uint64_t sub_19B57809C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 64);
  v3 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_19B5719A0(v2, &qword_1EE3F7C00);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_19B57812C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B578160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_19B5B9E24();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19B5B9E18();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_19B5719A0(a1, &qword_1EE3F6BB8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19B5B9DD0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_19B578290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  v6[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_19B5782F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 120) + 24);
  v3 = *(_QWORD *)(v0 + 80);
  if (v2 || (*(_BYTE *)(v3 + 112) & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 48);
    sub_19B57003C();
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v6;
    *v6 = v0;
    v6[1] = sub_19B5784A0;
    return sub_19B5B9FEC();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 48);
    *(_BYTE *)(v3 + 112) = 1;
    sub_19B5719DC(v9, v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
    v11 = *(_QWORD *)(v10 - 8);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10);
    v13 = *(_QWORD *)(v0 + 88);
    if (v12 == 1)
    {
      sub_19B5719A0(*(_QWORD *)(v0 + 88), &qword_1EE3F7C00);
    }
    else
    {
      sub_19B5B9DDC();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v10);
    }
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v14;
    *(_QWORD *)v14 = v0;
    *(_QWORD *)(v14 + 8) = sub_19B57856C;
    v15 = *(_QWORD *)(v0 + 80);
    v16 = *(_QWORD *)(v0 + 40);
    v17 = *(_OWORD *)(v0 + 56);
    *(_QWORD *)(v14 + 56) = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 40) = v17;
    *(_QWORD *)(v14 + 32) = v16;
    return swift_task_switch();
  }
}

uint64_t sub_19B5784A0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B578500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = sub_19B57856C;
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 56) = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v1 + 64) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(_QWORD *)(v1 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_19B57856C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_19B5785D0()
{
  uint64_t v0;

  sub_19B578AA4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B57860C()
{
  uint64_t v0;

  sub_19B578AA4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B578648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  MEMORY[0x1E0C80A78](v6, v7, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)(a2 + 120);
  swift_beginAccess();
  result = *(_QWORD *)(a2 + 120);
  v13 = *(_QWORD *)(result + 24);
  v14 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
  }
  else
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v11;
    if (*(_QWORD *)(*v11 + 16) < v14 || (isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_19B578E58(v14);
      v16 = *v11;
    }
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
    v18 = *(_QWORD *)(v17 - 8);
    sub_19B579094((_QWORD *)(v16 + 16), v16 + ((*(unsigned __int8 *)(v18 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), a1);
    swift_endAccess();
    sub_19B5719DC(a3, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) == 1)
    {
      return sub_19B5719A0((uint64_t)v10, &qword_1EE3F7C00);
    }
    else
    {
      sub_19B5B9DDC();
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v10, v17);
    }
  }
  return result;
}

BOOL sub_19B5787AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 result;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_19B5BA034();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v9 = ~v5;
  v10 = (v6 + 1) & v9;
  if (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    return 0;
  do
  {
    v11 = *(_QWORD *)(v8 + 8 * v10);
    result = v11 == a1;
    if (v11 == a1)
      break;
    v10 = (v10 + 1) & v9;
  }
  while (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

unint64_t sub_19B578874()
{
  return 0xD000000000000032;
}

uint64_t type metadata accessor for AsyncSerialQueue()
{
  return objc_opt_self();
}

uint64_t sub_19B5788B0(uint64_t a1)
{
  uint64_t v1;

  return sub_19B577DEC(a1, *(uint64_t **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16));
}

uint64_t sub_19B5788C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return swift_task_switch();
}

uint64_t sub_19B5788E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8[10];

  if (qword_1EE3F6B50 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v7 = *(_OWORD *)(v0 + 40);
  sub_19B5BA07C();
  sub_19B579660(v8, v1);
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 16);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v7;
  sub_19B57003C();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_19B578A0C;
  v5 = *(_QWORD *)(v0 + 56);
  v8[8] = 120;
  v8[9] = v5;
  return sub_19B5BA0A0();
}

uint64_t sub_19B578A0C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_19B578A98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19B578AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7C00);
  MEMORY[0x1E0C80A78](v2, v3, v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x1E0C80A78](v7, v9, v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v0 + 112) != 1)
  {
    __break(1u);
    goto LABEL_16;
  }
  swift_beginAccess();
  if (*(uint64_t *)(*(_QWORD *)(v0 + 120) + 24) >= 1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_19B579EEC();
    v14 = *(_QWORD **)(v0 + 120);
    result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v8 + 32))(v6, (unint64_t)v14+ ((*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v14[4], v7);
    v15 = v14[4];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (!v16)
    {
      v18 = v14[3];
      if (v17 >= v14[2])
        v17 = 0;
      v14[4] = v17;
      if (!__OFSUB__(v18, 1))
      {
        v19 = 0;
        v14[3] = v18 - 1;
        goto LABEL_11;
      }
LABEL_17:
      __break(1u);
      return result;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v19 = 1;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v19, 1, v7);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    result = sub_19B5719A0((uint64_t)v6, &qword_1EE3F7C00);
    *(_BYTE *)(v1 + 112) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    sub_19B5B9DDC();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t AsyncSerialQueue.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AsyncSerialQueue.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t AsyncSerialQueue.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_19B578CE0()
{
  uint64_t v0;

  return v0;
}

uint64_t method lookup function for AsyncSerialQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncSerialQueue.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AsyncSerialQueue.performAndWait<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 176)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 176));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_19B55D164;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AsyncSerialQueue.perform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 184)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 184));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_19B578E08;
  return v10(a1, a2, a3);
}

uint64_t sub_19B578E08(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

size_t sub_19B578E58(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t result;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v2 = *v1;
  v3 = (uint64_t *)(*v1 + 16);
  v4 = *v3;
  if (*v3 >= a1)
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FE0);
    v13 = swift_allocObject();
    v17 = *(_OWORD *)(v2 + 24);
    *(_QWORD *)(v13 + 16) = v4;
    *(_OWORD *)(v13 + 24) = v17;
    if ((uint64_t)v17 >= 1)
      sub_19B5794B4(v13 + 16, v13 + ((v16 + 40) & ~v16), v3, v2 + ((v16 + 40) & ~v16));
    goto LABEL_19;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *v1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  sub_19B5B9C98();
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v6 + 24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FE0);
    v11 = *(_QWORD *)(v8 + 72);
    v12 = (v9 + 40) & ~v9;
    v13 = swift_allocObject();
    result = _swift_stdlib_malloc_size((const void *)v13);
    if (v11)
    {
      if (result - v12 != 0x8000000000000000 || v11 != -1)
      {
        *(_QWORD *)(v13 + 16) = (uint64_t)(result - v12) / v11;
        *(_QWORD *)(v13 + 24) = v10;
        *(_QWORD *)(v13 + 32) = 0;
        if (v10 >= 1)
        {
          swift_retain();
          sub_19B57914C(v13 + 16, v13 + v12, (_QWORD *)(v6 + 16), v6 + v12);
          *(_QWORD *)(v6 + 24) = 0;
          swift_release();
        }
LABEL_19:
        result = swift_release();
        *v1 = v13;
        return result;
      }
      goto LABEL_22;
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v18 = *(_QWORD *)(v7 - 8);
  v19 = *(unsigned __int8 *)(v18 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FE0);
  v20 = *(_QWORD *)(v18 + 72);
  v21 = (v19 + 40) & ~v19;
  v13 = swift_allocObject();
  result = _swift_stdlib_malloc_size((const void *)v13);
  if (!v20)
    goto LABEL_21;
  if (result - v21 != 0x8000000000000000 || v20 != -1)
  {
    v23 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v13 + 16) = (uint64_t)(result - v21) / v20;
    *(_QWORD *)(v13 + 24) = v23;
    *(_QWORD *)(v13 + 32) = 0;
    if (v23 >= 1)
      sub_19B579304(v13 + 16, v13 + v21, (_QWORD *)(v6 + 16), v6 + v21);
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
  return result;
}

_QWORD *sub_19B579094(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = result[1];
  v4 = result[2];
  v5 = v4 + v3;
  if (!__OFADD__(v4, v3))
  {
    v8 = result;
    if ((v3 & 0x8000000000000000) == 0)
    {
      v9 = __OFSUB__(v5, *result);
      if (v5 < *result || (v5 -= *result, !v9))
      {
LABEL_9:
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a2 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v5, a3, v10);
        v11 = v8[1];
        v9 = __OFADD__(v11, 1);
        v12 = v11 + 1;
        if (!v9)
        {
          v8[1] = v12;
          return result;
        }
        goto LABEL_12;
      }
      __break(1u);
    }
    if (v5 < 0)
    {
      v9 = __OFADD__(v5, *result);
      v5 += *result;
      if (v9)
        goto LABEL_13;
    }
    goto LABEL_9;
  }
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

void sub_19B57914C(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v4 = a3[2];
  v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_32;
  }
  v8 = a3[1];
  if (v5 < v8)
  {
    v9 = v8 - v5;
    if (!__OFSUB__(v8, v5))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
      v11 = v5;
      v12 = a4;
      goto LABEL_6;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v12 = 0;
  v9 = 0;
  v11 = v8;
LABEL_6:
  v13 = v5 < v8;
  v14 = v9 != 0;
  v15 = v13 && v14;
  if (v13 && v14)
    v16 = v12;
  else
    v16 = 0;
  if (v13 && v14)
    v17 = v9;
  else
    v17 = 0;
  if (v11 < 1)
  {
    v11 = 0;
    goto LABEL_20;
  }
  if (!a4)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v18 = a4 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v4;
  if (v18 > a2
    || v18 + *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72) * v11 <= a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v18 != a2)
  {
    swift_arrayInitWithTakeBackToFront();
  }
LABEL_20:
  if (!v15 || v17 <= 0)
    return;
  if (!v16)
  {
LABEL_34:
    __break(1u);
    return;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72);
  v20 = a2 + v19 * v11;
  v21 = v16 + v19 * v17;
  if (v20 < v16 || v20 >= v21)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v20 != v16)
  {
    swift_arrayInitWithTakeBackToFront();
  }
}

uint64_t sub_19B579304(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v4 = a3[2];
  v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_26;
  }
  v8 = a3[1];
  if (v5 >= v8)
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
    v12 = 0;
    v9 = 0;
    v11 = v8;
    if (v8 < 1)
      goto LABEL_5;
    goto LABEL_7;
  }
  v9 = v8 - v5;
  if (__OFSUB__(v8, v5))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v11 = v5;
  v12 = a4;
  if (v5 < 1)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_13;
  }
LABEL_7:
  if (!a4)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v13 = a4 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * v4;
  v14 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72) * v11;
  v15 = a2 + v14;
  v16 = v13 + v14;
  if (v13 < v15 && v16 > a2)
    goto LABEL_29;
  result = swift_arrayInitWithCopy();
LABEL_13:
  if (v5 >= v8 || v9 < 1)
    return result;
  if (!v12)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    result = sub_19B5B9FBC();
    __break(1u);
    return result;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72);
  v20 = a2 + v19 * v11;
  v21 = v19 * v9;
  v22 = v20 + v21;
  v23 = v12 + v21;
  if (v22 > v12 && v20 < v23)
    goto LABEL_29;
  return swift_arrayInitWithCopy();
}

uint64_t sub_19B5794B4(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v4 = a3[2];
  v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_26;
  }
  v8 = a3[1];
  if (v5 >= v8)
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
    v12 = 0;
    v9 = 0;
    v11 = v8;
    if (v8 < 1)
      goto LABEL_14;
    goto LABEL_7;
  }
  v9 = v8 - v5;
  if (__OFSUB__(v8, v5))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v11 = v5;
  v12 = a4;
  if (v5 < 1)
    goto LABEL_14;
LABEL_7:
  if (!a4)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v13 = a4 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * v4;
  v14 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72);
  v15 = a2 + v14 * v4;
  v16 = v14 * v11;
  v17 = v15 + v16;
  v18 = v13 + v16;
  if (v13 < v17 && v15 < v18)
    goto LABEL_29;
  result = swift_arrayInitWithCopy();
LABEL_14:
  if (v5 < v8 && v9 >= 1)
  {
    if (v12)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8) + 72) * v9;
      v22 = a2 + v21;
      v23 = v12 + v21;
      if (v22 <= v12 || v23 <= a2)
        return swift_arrayInitWithCopy();
LABEL_29:
      result = sub_19B5B9FBC();
      __break(1u);
      return result;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  return result;
}

uint64_t sub_19B579660(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_19B5BA034();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_19B5799D8(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_19B579758()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FF8);
  result = sub_19B5B9EFC();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_19B5BA034();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_19B5799D8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_19B579758();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_19B579AF8();
      goto LABEL_14;
    }
    sub_19B579C8C();
  }
  v8 = *v3;
  result = sub_19B5BA034();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_19B5B9FF8();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_19B579AF8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FF8);
  v2 = *v0;
  v3 = sub_19B5B9EF0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19B579C8C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FF8);
  result = sub_19B5B9EFC();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_19B5BA034();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_19B579EEC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;

  v1 = *v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7FE0);
  v5 = swift_allocObject();
  v6 = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(v5 + 16) = v3;
  *(_OWORD *)(v5 + 24) = v6;
  if ((uint64_t)v6 >= 1)
    sub_19B5794B4(v5 + 16, v5 + ((v4 + 40) & ~v4), (_QWORD *)(v1 + 16), v1 + ((v4 + 40) & ~v4));
  result = swift_release();
  *v0 = v5;
  return result;
}

uint64_t sub_19B579FA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_19B55FFB4;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_19B55D164;
  return v8(a1);
}

uint64_t sub_19B57A02C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_19B57A0CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = v1[4];
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE3F7BE8) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v6;
  v11 = (_QWORD *)((char *)v1 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  v12 = *v11;
  v13 = v11[1];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_19B55FFB4;
  return sub_19B577F90(a1, v7, v8, v9, v10, v12, v13, v4);
}

uint64_t dispatch thunk of StateMachine.RootState.handleEvent(_:currentState:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 88)
                                                                                     + *(_QWORD *)(a6 + 88));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_19B55FFB4;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of StateMachine.RootState.handleStateTransition(_:currentState:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 96) + *(_QWORD *)(a5 + 96));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_19B55D164;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of StateMachine.HandlerDelegate.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of StateMachine.HandlerDelegate.enqueue(delegating:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

ValueMetadata *type metadata accessor for HMF()
{
  return &type metadata for HMF;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1ED0130A0 == -1)
  {
    if (qword_1ED0130A8)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1ED0130A0, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1ED0130A8)
      return _availability_version_check();
  }
  if (qword_1ED013098 == -1)
  {
    v8 = _MergedGlobals_51 < a2;
    if (_MergedGlobals_51 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1ED013098, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals_51 < a2;
    if (_MergedGlobals_51 > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1ED01308C > a3)
    return 1;
  return dword_1ED01308C >= a3 && dword_1ED013090 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1ED0130A8;
  if (qword_1ED0130A8)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1ED0130A8 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1A1AC32EC](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals_51, &dword_1ED01308C, &dword_1ED013090);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_19B57B5BC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57B628(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57B690(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57BA2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57BE34(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57BF40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57C030(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57C3DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57C724(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57C794(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57CD58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57D2BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B57D5D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B57E6D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B57FB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B57FF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HMFDataIsReversed(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = objc_msgSend(v3, "length");
    if (v7 == objc_msgSend(v5, "length"))
    {
      v8 = objc_retainAutorelease(v3);
      v9 = objc_msgSend(v8, "bytes");
      v10 = 0;
      v11 = objc_msgSend(objc_retainAutorelease(v5), "bytes") - 1;
      do
      {
        v12 = objc_msgSend(v8, "length");
        v6 = v12 <= v10;
        if (v12 <= v10)
          break;
        v13 = *(unsigned __int8 *)(v9 + v10++);
        v14 = *(unsigned __int8 *)(v11 + objc_msgSend(v8, "length"));
        --v11;
      }
      while (v13 == v14);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

id HMFHTTPProtocolVersionString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return **((id **)&unk_1E3B37E60 + a1);
}

void sub_19B580858(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_40n11_8_8_t0w8_s8(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_e8_40n4_8_s8(uint64_t a1)
{

}

void sub_19B5820F0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5826B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B582744(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5827D0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B582858(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5828E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMFWiFiAssertionOptionsDescription(unint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0)
        objc_msgSend(v2, "addObject:", CFSTR("Foreground"));
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("None");
  }
  return v4;
}

void sub_19B582AF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B582BC8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5837B0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19B5838A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B583B4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMFDescribeCollection(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0CB37A0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  HMFDescribeIntoBufferWithIndent(v3, &stru_1E3B39EC0, v2);

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

void HMFDescribeIntoBufferWithIndent(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "_stringRepresentation");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE40BED8) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3FFB38) & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v23 = v7;
              objc_msgSend(v5, "appendString:", CFSTR("{\n"));
              objc_msgSend(v6, "stringByAppendingString:", CFSTR("    "));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __HMFDescribeIntoBufferWithIndent_block_invoke;
              v34[3] = &unk_1E3B38318;
              v25 = v5;
              v35 = v25;
              v36 = v24;
              v26 = v24;
              objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v34);

              objc_msgSend(v25, "appendString:", v6);
              objc_msgSend(v25, "appendString:", CFSTR("}"));

              goto LABEL_11;
            }
            v27 = objc_msgSend(v6, "length");
            objc_msgSend(v7, "description");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v28;
            if (v27)
            {
              objc_msgSend(v28, "_stringRepresentation");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendString:", v29);

              goto LABEL_10;
            }
LABEL_9:
            objc_msgSend(v5, "appendString:", v9);
LABEL_10:

            goto LABEL_11;
          }
        }
      }
    }
    v10 = v7;
    objc_opt_class();
    v31 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = CFSTR("{(\n");
      v12 = CFSTR(")}");
    }
    else
    {
      v11 = CFSTR("(\n");
      v12 = CFSTR(")");
    }
    v30 = v12;
    objc_msgSend(v5, "appendString:", v11);
    v13 = objc_msgSend(v10, "count");
    v32 = v6;
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("    "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v10, "objectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        v19 = 0;
        v33 = v13;
        v20 = v13 - 1;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend(v5, "appendString:", v14);
          HMFDescribeIntoBufferWithIndent(v5, v14, v21);
          if (v20 == v19)
            v22 = CFSTR("\n");
          else
            v22 = CFSTR(",\n");
          objc_msgSend(v5, "appendString:", v22);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v13 = v33 - v19;
      }
      while (v17);
    }

    v6 = v32;
    objc_msgSend(v5, "appendString:", v32);
    objc_msgSend(v5, "appendString:", v30);

    v7 = v31;
  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("(null)"));
  }
LABEL_11:

}

id __getPlatformInformationForKey(void *a1)
{
  __CFString *v1;
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFTypeRef CFProperty;
  void *v7;
  CFTypeID v8;
  uint64_t v9;
  void *v10;
  CFTypeID v11;

  v1 = a1;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, v1, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = (void *)CFProperty;
      v8 = CFGetTypeID(CFProperty);
      if (v8 == CFStringGetTypeID())
      {
        v9 = objc_msgSend(v7, "copy");
      }
      else
      {
        v11 = CFGetTypeID(v7);
        if (v11 != CFDataGetTypeID())
        {
          v10 = 0;
          goto LABEL_11;
        }
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      }
      v10 = (void *)v9;
LABEL_11:
      IOObjectRelease(v5);
      CFRelease(v7);
      goto LABEL_12;
    }
    IOObjectRelease(v5);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

void sub_19B584734(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void __updateValue(void *a1, uint64_t a2)
{
  os_unfair_lock *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  BOOL v8;
  int v9;
  os_unfair_lock *v10;

  v3 = a1;
  if (v3)
  {
    v10 = v3;
    os_unfair_lock_assert_owner(v3 + 2);
    v3 = v10;
    v4 = *(_QWORD *)&v10[6]._os_unfair_lock_opaque;
    if (v4 != a2)
    {
      v5 = *(_QWORD *)&v10[8]._os_unfair_lock_opaque;
      -[os_unfair_lock willChangeValueForKey:](v10, "willChangeValueForKey:", CFSTR("value"));
      v6 = v4 == v5 || v5 == a2;
      v7 = v6;
      if (v6)
        -[os_unfair_lock willChangeValueForKey:](v10, "willChangeValueForKey:", CFSTR("full"));
      if (a2)
        v8 = v4 == 0;
      else
        v8 = 1;
      v9 = v8;
      if (v8)
        -[os_unfair_lock willChangeValueForKey:](v10, "willChangeValueForKey:", CFSTR("empty"));
      *(_QWORD *)&v10[6]._os_unfair_lock_opaque = a2;
      -[os_unfair_lock didChangeValueForKey:](v10, "didChangeValueForKey:", CFSTR("value"));
      if (v7)
        -[os_unfair_lock didChangeValueForKey:](v10, "didChangeValueForKey:", CFSTR("full"));
      v3 = v10;
      if (v9)
      {
        -[os_unfair_lock didChangeValueForKey:](v10, "didChangeValueForKey:", CFSTR("empty"));
        v3 = v10;
      }
    }
  }

}

void sub_19B584B78(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_19B584ED4(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

uint64_t NSOperatingSystemVersionToString(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld.%ld"), *a1, a1[1], a1[2]);
}

uint64_t HMFOperatingSystemVersionCompare(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  if (*a1 > *a2)
    return 1;
  if (*a1 < *a2)
    return -1;
  v2 = a1[1];
  v3 = a2[1];
  if (v2 > v3)
    return 1;
  if (v2 < v3)
    return -1;
  v5 = a1[2];
  v6 = a2[2];
  v7 = v5 <= v6;
  if (v5 >= v6)
    v8 = 0;
  else
    v8 = -1;
  if (v7)
    return v8;
  else
    return 1;
}

uint64_t ignore_block_invoke()
{
  return 1;
}

uint64_t __thenBlockForFinallyBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __objc2_class *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = HMFFuture;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (HMFFuture)
  {
    +[HMFFuture _futureWithOutcome:]((uint64_t)HMFFuture, v5, v6);
    v4 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __thenBlockForFinallyBlock_block_invoke_2;
  v11[3] = &unk_1E3B38408;
  v7 = v3;
  v12 = v7;
  -[__objc2_class then:](v4, "then:", v11);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure(CFSTR("future"));
  v9 = v8;

  return 3;
}

uint64_t __thenBlockForFinallyBlock_block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  return 1;
}

uint64_t __recoverBlockForFinallyBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __objc2_class *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = HMFFuture;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (HMFFuture)
  {
    +[HMFFuture _futureWithOutcome:]((uint64_t)HMFFuture, v5, v6);
    v4 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __recoverBlockForFinallyBlock_block_invoke_2;
  v11[3] = &unk_1E3B38408;
  v7 = v3;
  v12 = v7;
  -[__objc2_class then:](v4, "then:", v11);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure(CFSTR("future"));
  v9 = v8;

  return 3;
}

uint64_t __recoverBlockForFinallyBlock_block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = *(id *)(a1 + 32);
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

void sub_19B587020(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58707C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5870D8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58714C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5871D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B587258(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5872DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B587344(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5873AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5874DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B587690(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B587CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HMFRandomDataWithLength(unint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint32_t v9;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    v3 = 0;
    v4 = 0;
    v5 = 4;
    do
    {
      if (a1 >= v5)
        v6 = v5;
      else
        v6 = a1;
      v7 = v6 + v3;
      v9 = 0;
      v9 = arc4random();
      v4 += 4;
      objc_msgSend(v2, "appendBytes:length:", &v9, v7);
      v5 += 4;
      v3 -= 4;
    }
    while (v4 < a1);
  }
  return v2;
}

uint64_t HMFRandomUInt32()
{
  unsigned int bytes;

  bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 4uLL, &bytes))
    return arc4random();
  else
    return bytes;
}

double HMFSecondsFromMachTime(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (double)((unint64_t)info.numer * a1 / info.denom) / 1000000000.0;
}

BOOL HMFIsInternalBuild()
{
  void *v0;
  _BOOL8 v1;

  +[HMFProductInfo productInfo](HMFProductInfo, "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 3;

  return v1;
}

BOOL HMFIsDeveloperBuild()
{
  void *v0;
  _BOOL8 v1;

  +[HMFProductInfo productInfo](HMFProductInfo, "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 1;

  return v1;
}

BOOL HMFIsCustomerBuild()
{
  void *v0;
  _BOOL8 v1;

  +[HMFProductInfo productInfo](HMFProductInfo, "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 0;

  return v1;
}

BOOL HMFIsCarrierBuild()
{
  void *v0;
  _BOOL8 v1;

  +[HMFProductInfo productInfo](HMFProductInfo, "productInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "productVariant") == 2;

  return v1;
}

id HMFEncodedRootObject(void *a1)
{
  id v1;
  void *v2;
  HMFOSTransaction *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A1AC355C]();
  v3 = -[HMFOSTransaction initWithName:]([HMFOSTransaction alloc], "initWithName:", CFSTR("com.apple.HMFoundation.hmfutilities.encode-root."));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", v1, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_19B589324(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19B5893B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B589454(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58A29C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58A7C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

const __CFString *HMFSystemMemoryStateToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("HMFSystemMemoryStateUndefined");
  else
    return off_1E3B385D0[a1];
}

const __CFString *HMFProcessMemoryStateToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("HMFProcessMemoryStateUndefined");
  else
    return off_1E3B385F0[a1];
}

void sub_19B58BB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B58BF50(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void serverDidInvalidate(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Server invalidated", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverDidInvalidate:", v6);

  }
}

void serverDidReceiveError(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC355C]();
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = a2;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Server received error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void serverDidOpenConnection(void *a1, _HMFCFHTTPServerConnection *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _HMFCFHTTPServerConnection *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _HMFCFHTTPServerConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC355C]();
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = a2;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Server did open connection: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = -[_HMFCFHTTPServerConnection initWithConnectionRef:]([_HMFCFHTTPServerConnection alloc], "initWithConnectionRef:", a2);
    if (v11)
    {
      v12 = (void *)MEMORY[0x1A1AC355C]();
      v13 = v8;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v15;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Server did open connection: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v13, "connections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v11);

      objc_msgSend(v13, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "server:didOpenConnection:", v13, v11);

    }
  }

}

void serverDidCloseConnection(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v29 = v5;
    v7 = (void *)MEMORY[0x1A1AC355C]();
    v28 = v6;
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v10;
      v38 = 2112;
      v39 = a2;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Server did close connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v8, "connections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        v30 = v14;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
          if ((void *)objc_msgSend(v17, "internal", v28) == a2)
          {
            v18 = (void *)MEMORY[0x1A1AC355C]();
            v19 = v8;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier(v19);
              v21 = v15;
              v22 = a2;
              v23 = v12;
              v24 = v8;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v25;
              v38 = 2112;
              v39 = v17;
              _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_INFO, "%{public}@Server did close connection: %@", buf, 0x16u);

              v8 = v24;
              v12 = v23;
              a2 = v22;
              v15 = v21;
              v14 = v30;
            }

            objc_autoreleasePoolPop(v18);
            objc_msgSend(v17, "close");
            objc_msgSend(v19, "connections");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v17);

            objc_msgSend(v19, "delegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "server:didCloseConnection:", v19, v17);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    v6 = v28;
    v5 = v29;
  }

}

void sub_19B58EFA8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58F41C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B58F66C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _connectionDidInvalidate(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection invalidated", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void _connectionDidReceiveError(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC355C]();
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = a2;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection received error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void _connectionDidReceiveRequest(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_handleReceivedRequestRef:", a2);
    v6 = v7;
  }

}

void _connectionDidSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_handleCompletedResponse:error:", a3, 0);
    v7 = v8;
  }

}

void _connectionDidFailToSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleCompletedResponse:error:", a3, v7);

  }
}

CFTypeRef _retainInfo(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void _releaseInfo(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void readStreamCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleRequest:bodyReadStream:eventType:", v9, a1, a2);

  }
}

void sub_19B5910FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void __updateBatteryLevel(void *a1, float a2)
{
  os_unfair_lock_s *v3;
  float v4;
  os_unfair_lock_s *v5;
  void *v6;
  float *p_os_unfair_lock_opaque;

  v3 = a1;
  if (v3)
  {
    v4 = roundf(a2 * 1000.0) / 1000.0;
    v5 = v3 + 2;
    p_os_unfair_lock_opaque = (float *)&v3->_os_unfair_lock_opaque;
    os_unfair_lock_lock_with_options();
    if (vabds_f32(p_os_unfair_lock_opaque[4], v4) <= 0.1)
    {
      os_unfair_lock_unlock(v5);
    }
    else
    {
      p_os_unfair_lock_opaque[4] = v4;
      os_unfair_lock_unlock(v5);
      +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("HMFPowerManagerBatteryLevelDidChangeNotification"), p_os_unfair_lock_opaque);

    }
    v3 = (os_unfair_lock_s *)p_os_unfair_lock_opaque;
  }

}

void __updateBatteryState(void *a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = os_unfair_lock_lock_with_options();
    if (*(_QWORD *)&v3[6]._os_unfair_lock_opaque == a2)
    {
      os_unfair_lock_unlock(v3 + 2);
    }
    else
    {
      v5 = (void *)MEMORY[0x1A1AC355C](v4);
      v6 = v3;
      HMFGetOSLogHandle();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v8;
        v12 = 2048;
        v13 = a2;
        _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Battery state changed: %tu", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      *(_QWORD *)&v6[6]._os_unfair_lock_opaque = a2;
      os_unfair_lock_unlock(v3 + 2);
      +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("HMFPowerManagerBatteryStateDidChangeNotification"), v6);

    }
  }

}

void sub_19B592500(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _matchedBatteryMatchingCallback(void *a1, io_iterator_t a2)
{
  void *v4;
  io_object_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = a1;
  if (v5)
  {
    v6 = IOIteratorNext(a2);
    if ((_DWORD)v6)
    {
      v7 = v6;
      do
      {
        if (!IOServiceAddInterestNotification((IONotificationPortRef)-[io_object_t notificationPort](v5, "notificationPort"), v7, "IOGeneralInterest", (IOServiceInterestCallback)_batteryInterestCallback, v5, v5 + 5))-[io_object_t updateBatteryState:](v5, "updateBatteryState:", v7);
        IOObjectRelease(v7);
        v7 = IOIteratorNext(a2);
      }
      while ((_DWORD)v7);
    }
  }

  objc_autoreleasePoolPop(v4);
}

void *_batteryInterestCallback(void *a1, const char *a2, int a3)
{
  if (a1)
  {
    if (a3 == -536723200)
      return (void *)objc_msgSend(a1, "updateBatteryState:", a2);
  }
  return a1;
}

void sub_19B593D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_19B595270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __get_nw_parameters_block_invoke()
{
  return nw_udp_options_set_no_metadata();
}

void sub_19B596758(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B596888(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5969F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B597340(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __browse_result_changed_handler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id WeakRetained;
  nw_browse_result_change_t changes;
  uint64_t v8;
  HMFNetworkService *v9;
  nw_txt_record_t v10;
  NSObject *v11;
  void *v12;
  HMFNetworkService *v13;
  uint64_t v14;
  void *v15;
  NSObject *old_result;

  old_result = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  changes = nw_browse_result_get_changes(old_result, v5);
  if ((changes & 1) == 0)
  {
    if ((changes & 2) != 0)
    {
      v8 = 2;
    }
    else if ((changes & 4) != 0)
    {
      v8 = 3;
    }
    else
    {
      if (((changes >> 3) & 4) == 0)
        goto LABEL_14;
      v8 = (changes >> 3) & 4;
    }
    v9 = [HMFNetworkService alloc];
    v10 = nw_browse_result_copy_txt_record_object(v5);
    if (v5)
      v11 = v5;
    else
      v11 = old_result;
    objc_msgSend(WeakRetained, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMFNetworkService initWithTXTRecords:browseResult:queue:](v9, "initWithTXTRecords:browseResult:queue:", v10, v11, v12);

    objc_msgSend(WeakRetained, "updateBlock");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, HMFNetworkService *, uint64_t))(v14 + 16))(v14, v13, v8);

  }
LABEL_14:

}

void __networkServiceDidUpdate_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  switch(a3)
  {
    case 4:
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "_updateService:", v5);
      goto LABEL_7;
    case 3:
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "_removeService:", v5);
      goto LABEL_7;
    case 2:
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "_addService:", v5);
LABEL_7:
      v5 = v6;
      break;
  }

}

void ____registerForUpdates_block_invoke(uint64_t a1, const __CFString *a2)
{
  id WeakRetained;
  void *v4;
  CFComparisonResult v5;
  id v6;
  void *v7;
  CFTypeID TypeID;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v5 = CFStringCompare(a2, CFSTR("UserAssignedDeviceName"), 0);
    v4 = v12;
    if (v5 == kCFCompareEqualTo)
    {
      v6 = v12;
      v7 = (void *)MGCopyAnswer();
      TypeID = CFStringGetTypeID();
      objc_opt_class();
      if (v7 && CFGetTypeID(v7) != TypeID)
      {
        CFRelease(v7);
        v7 = 0;
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v7;
      else
        v9 = 0;
      v10 = v9;

      os_unfair_lock_lock_with_options();
      if ((HMFEqualObjects(*((void **)v6 + 3), v10) & 1) != 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      }
      else
      {
        objc_storeStrong((id *)v6 + 3, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
        objc_msgSend(v6, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataSource:didUpdateName:", v6, v10);

      }
      v4 = v12;
    }
  }

}

void sub_19B5979CC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5987D4(_Unwind_Exception *a1)
{
  os_unfair_recursive_lock_unlock();
  _Unwind_Resume(a1);
}

void sub_19B599000(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  const void *v2;

  CFRelease(*v1);
  *v1 = v2;
  _Unwind_Resume(a1);
}

void sub_19B599080(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  const void *v2;

  CFRelease(*v1);
  *v1 = v2;
  _Unwind_Resume(a1);
}

void HMFImplicitDispatchContextDestroy(id *a1)
{
  objc_storeWeak(a1 + 1, 0);
  free(a1);
}

HMFDispatchContext *HMFImplicitDispatchContext()
{
  char *specific;
  _QWORD *v1;
  id *v2;
  HMFDispatchContext *WeakRetained;

  specific = (char *)dispatch_get_specific(&implicitContextKey);
  if (specific)
  {
    v1 = specific;
    v2 = (id *)(specific + 8);
    WeakRetained = (HMFDispatchContext *)objc_loadWeakRetained((id *)specific + 1);
    if (!WeakRetained)
    {
      WeakRetained = -[HMFDispatchContext initWithQueue:]([HMFDispatchContext alloc], "initWithQueue:", *v1);
      objc_storeWeak(v2, WeakRetained);
    }
  }
  else
  {
    WeakRetained = 0;
  }
  return WeakRetained;
}

void sub_19B59ADEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_19B59AFC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_19B59B450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B59CA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B59CE18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __HMFHTTPClientHandleReachabilityChange(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = v3;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v7)
      {
        HMFGetLogIdentifier(v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v8;
        _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the server is now reachable", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      if ((objc_msgSend(v5, "isReachable") & 1) == 0)
      {
        objc_initWeak((id *)buf, v5);
        objc_msgSend(v5, "netService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = ____HMFHTTPClientHandleReachabilityChange_block_invoke;
        v19[3] = &unk_1E3B38FA8;
        objc_copyWeak(&v20, (id *)buf);
        objc_msgSend(v9, "resolveWithTimeout:completionHandler:", v19, 15.0);

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
      objc_msgSend(v5, "reachabilityProbeQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "operations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = (void *)MEMORY[0x1A1AC355C]();
        v14 = v5;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_INFO, "%{public}@Cancelling pending confirmations due to reachability change", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
      }
      objc_msgSend(v5, "reachabilityProbeQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancelAllOperations");

    }
    else
    {
      if (v7)
      {
        HMFGetLogIdentifier(v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the server is now unreachable", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      if ((objc_msgSend(v5, "isActive") & 1) != 0)
      {
        if ((objc_msgSend(v5, "isReachable") & 1) == 0)
          objc_msgSend(v5, "stopDelegatedPingTimer");
      }
      else
      {
        objc_msgSend(v5, "setReachable:", 0);
      }
    }
  }

}

void sub_19B59D4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_19B59E128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B59E314(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B59E50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B59E6E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19B59E8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B59EAE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _HMFPreconditionFailure(void *a1)
{
  const __CFString *v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  if (v1)
    v4 = v1;
  else
    v4 = CFSTR("(null)");
  objc_msgSend(CFSTR("Precondition not satisfied: "), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void _HMFPreconditionFailureWithFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;

  v9 = a1;
  _HMFPreconditionFailure((void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v9, &a9));
}

const __CFString *HMFProductPlatformToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E3B390A0[a1 - 1];
}

uint64_t HMFProductClassFromString(void *a1)
{
  void *v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  int v24;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("iPhone"), "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsString:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("iPod"), "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "containsString:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 2;
    }
    else
    {
      objc_msgSend(CFSTR("iPad"), "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "containsString:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 3;
      }
      else
      {
        objc_msgSend(CFSTR("AppleTV"), "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "containsString:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = 4;
        }
        else
        {
          objc_msgSend(CFSTR("Watch"), "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v1, "containsString:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = 5;
          }
          else
          {
            objc_msgSend(CFSTR("iMac"), "lowercaseString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v1, "containsString:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = 7;
            }
            else
            {
              objc_msgSend(CFSTR("MacBook"), "lowercaseString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v1, "containsString:", v15);

              if ((v16 & 1) != 0)
              {
                v4 = 8;
              }
              else
              {
                objc_msgSend(CFSTR("Macmini"), "lowercaseString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v1, "containsString:", v17);

                if ((v18 & 1) != 0)
                {
                  v4 = 9;
                }
                else
                {
                  objc_msgSend(CFSTR("MacPro"), "lowercaseString");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v1, "containsString:", v19);

                  if ((v20 & 1) != 0)
                  {
                    v4 = 10;
                  }
                  else
                  {
                    objc_msgSend(CFSTR("AudioAccessory"), "lowercaseString");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v1, "containsString:", v21);

                    if ((v22 & 1) != 0)
                    {
                      v4 = 6;
                    }
                    else
                    {
                      objc_msgSend(CFSTR("RealityDevice"), "lowercaseString");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(v1, "containsString:", v23);

                      if (v24)
                        v4 = 11;
                      else
                        v4 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

const __CFString *HMFProductClassToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E3B390C8[a1 - 1];
}

const __CFString *HMFProductVariantToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Customer");
  else
    return off_1E3B39120[a1 - 1];
}

__CFString *HMFProductColorToString(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown (%@)"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E3B39070[a1];
  }
  return v1;
}

os_log_t HMFCreateOSLogHandle(void *a1, id a2)
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;

  v3 = objc_retainAutorelease(a2);
  v4 = a1;
  v5 = (const char *)objc_msgSend(v3, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  return os_log_create(v5, v7);
}

id HMFGetOSLogHandle()
{
  void *v0;

  v0 = (void *)objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v0, "logCategory");
  else
    HMFGetDefaultOSLogHandle();
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFSocket *create_socket(CFSocketNativeHandle sock, CFSocketContext *context)
{
  const __CFAllocator *v2;
  __CFSocket *v3;
  __CFSocket *v4;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v6;
  __CFRunLoop *Main;

  if (sock < 0)
    return 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFSocketCreateWithNative((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sock, 1uLL, (CFSocketCallBack)SocketReadCallback, context);
  v4 = v3;
  if (v3 && (CFSocketGetSocketFlags(v3) & 0x80) == 0)
    __assert_rtn("create_socket", "HMFNetworkDiagnosticPing.m", 383, "CFSocketGetSocketFlags(socket) & kCFSocketCloseOnInvalidate");
  RunLoopSource = CFSocketCreateRunLoopSource(v2, v4, 0);
  if (!RunLoopSource)
    return 0;
  v6 = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRelease(v6);
  return v4;
}

void SocketReadCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "_readDataFromSocket:", a1);
}

uint64_t HMFQualityOfServiceCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  if (a1 <= a2)
    v2 = -1;
  v3 = -1;
  if (a1 >= 25)
    v3 = 1;
  if (a2 == -1)
    v2 = v3;
  v4 = 1;
  if (a2 >= 25)
    v4 = -1;
  if (a1 == -1)
    v2 = v4;
  if (a1 == a2)
    return 0;
  else
    return v2;
}

id _HMFValidateMessagePayload(id a1)
{
  if (a1)
    a1 = validatePayloadObject(a1);
  return a1;
}

id validatePayloadObject(void *a1)
{
  id v1;
  CFTypeID v2;
  __CFString *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v1 = a1;
  v2 = CFGetTypeID(v1);
  if (v2 == CFArrayGetTypeID())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = CFSTR(": NSMutableArray");
LABEL_17:
      v4 = (id)-[__CFString mutableCopy](v3, "mutableCopy");
      goto LABEL_20;
    }
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __validatePayloadObject_block_invoke;
    v9[3] = &unk_1E3B39270;
    v9[4] = &v10;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v9);
  }
  else
  {
    if (v2 != CFDictionaryGetTypeID())
    {
      if (v2 == CFSetGetTypeID())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = CFSTR(": NSMutableSet");
          goto LABEL_17;
        }
        v10 = 0;
        v11 = &v10;
        v12 = 0x3032000000;
        v13 = __Block_byref_object_copy__1;
        v14 = __Block_byref_object_dispose__1;
        v15 = 0;
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __validatePayloadObject_block_invoke_3;
        v7[3] = &unk_1E3B392C0;
        v7[4] = &v10;
        objc_msgSend(v1, "enumerateObjectsUsingBlock:", v7);
        _Block_object_dispose(&v10, 8);

      }
      else if (v2 == CFStringGetTypeID())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = (id)objc_msgSend(v1, "copy");

          if (v5 != v1)
          {
            v3 = CFSTR(": NSMutableString");
            goto LABEL_17;
          }
        }
      }
      v4 = 0;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = CFSTR(": NSMutableDictionary");
      goto LABEL_17;
    }
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __validatePayloadObject_block_invoke_2;
    v8[3] = &unk_1E3B39298;
    v8[4] = &v10;
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

LABEL_20:
  return v4;
}

void sub_19B5A32E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __validatePayloadObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = validatePayloadObject(a2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (v7)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%tu]"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertString:atIndex:", v11, 0);

    *a4 = 1;
  }
}

void __validatePayloadObject_block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = validatePayloadObject(v19);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertString:atIndex:", CFSTR(": invalid dictionary key"), 0);
LABEL_5:
    *a4 = 1;
    goto LABEL_6;
  }
  v11 = validatePayloadObject(v7);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (v11)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_stringRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@]"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertString:atIndex:", v18, 0);

    goto LABEL_5;
  }
LABEL_6:

}

void __validatePayloadObject_block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = validatePayloadObject(a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (v5)
    *a3 = 1;
}

void sortKeysAndValuesOfDictionary(void *a1, void *a2, void **a3, void **a4)
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v7 = _MergedGlobals_69;
  v8 = a2;
  v9 = a1;
  if (v7 != -1)
    dispatch_once(&_MergedGlobals_69, &__block_literal_global_35);
  v16 = (id)qword_1ED0131E8;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectsForKeys:notFoundMarker:", v11, v16);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *a3;
  *a3 = v11;
  v14 = v11;

  v15 = *a4;
  *a4 = (void *)v12;

}

void __sortKeysAndValuesOfDictionary_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DE7910]);
  v1 = (void *)qword_1ED0131E8;
  qword_1ED0131E8 = (uint64_t)v0;

}

void __updateName(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  os_unfair_lock_s *v5;
  void *v6;
  id *v7;

  v7 = a3;
  if (objc_msgSend(v7, "store") == a1)
  {
    v4 = (__CFString *)SCDynamicStoreCopyLocalHostName(0);
    v5 = (os_unfair_lock_s *)(v7 + 1);
    os_unfair_lock_lock_with_options();
    if ((HMFEqualObjects(v7[3], v4) & 1) != 0)
    {
      os_unfair_lock_unlock(v5);
    }
    else
    {
      objc_storeStrong(v7 + 3, v4);
      os_unfair_lock_unlock(v5);
      objc_msgSend(v7, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataSource:didUpdateName:", v7, v4);

    }
  }

}

void sub_19B5A5E6C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5A5FF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&futureForOperation__lock);
  _Unwind_Resume(a1);
}

void sub_19B5A7350(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(&_MergedGlobals_11);
  _Unwind_Resume(a1);
}

void sub_19B5A7624(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(&stru_1ED012DFC);
  _Unwind_Resume(a1);
}

void sub_19B5A7E74(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    objc_msgSend(v1, "end");
  _Unwind_Resume(exception_object);
}

void sub_19B5A817C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    objc_msgSend(v1, "end");
  _Unwind_Resume(exception_object);
}

id HMFTimeIntervalDescription(double a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v2, a1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 248, v2, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hmf_localTimeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_19B5A8770(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_72);
  _Unwind_Resume(a1);
}

void sub_19B5A9DD8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5AA558(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t __txtRecordDictionary_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
  if (a3 == 4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithData:encoding:", v11, 4);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v9);

  }
  else if (a3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &stru_1E3B39EC0, v9);
  }
  v13 = 1;
LABEL_7:

  return v13;
}

void sub_19B5AAA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __migrationFinishedCallback(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received notification migration has finished", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource:didUpdateMigrating:", v6, 0);

  }
}

const __CFString *HMFDigestAlgorithmToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6)
    return CFSTR("Unknown");
  else
    return off_1E3B39520[a1 - 2];
}

uint64_t HMFDigestAlgorithmFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA1"))
    && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-1")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA224"))
      && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-224")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA256"))
        && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-256")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA384"))
          && objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-384")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA512")))
            v2 = 8 * (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-512")) == 0);
          else
            v2 = 8;
        }
        else
        {
          v2 = 7;
        }
      }
      else
      {
        v2 = 6;
      }
    }
    else
    {
      v2 = 5;
    }
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

void sub_19B5ABA6C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5ABFC8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMFMainThreadAsyncContext()
{
  if (_MergedGlobals_75 != -1)
    dispatch_once(&_MergedGlobals_75, &__block_literal_global_44);
  return (id)qword_1ED013250;
}

id HMFCallerAsyncContext()
{
  if (qword_1ED013258 != -1)
    dispatch_once(&qword_1ED013258, &__block_literal_global_16);
  return (id)qword_1ED013260;
}

uint64_t _HMFThreadLocalAsyncContextPush(void *a1)
{
  id v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = (uint64_t *)_HMFThreadLocalAsyncContext();
  v3 = *v2;
  *v2 = v4;
  return v3;
}

void _HMFThreadLocalAsyncContextPop(CFTypeRef *a1)
{
  CFTypeRef *v2;

  v2 = (CFTypeRef *)_HMFThreadLocalAsyncContext();
  CFRelease(*v2);
  *v2 = *a1;
}

id HMFCurrentAsyncContext()
{
  id v0;

  v0 = *(id *)_HMFThreadLocalAsyncContext();
  if (!v0)
  {
    HMFImplicitDispatchContext();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    if (!v0)
    {
      if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        return 0;
      HMFMainThreadAsyncContext();
      v0 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v0;
}

id HMFRequireCurrentAsyncContext()
{
  id v0;
  id v2;

  v0 = *(id *)_HMFThreadLocalAsyncContext();
  if (!v0)
  {
    HMFImplicitDispatchContext();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    if (!v0)
    {
      if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("No current HMFAsyncContext"), 0);
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v2);
      }
      HMFMainThreadAsyncContext();
      v0 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v0;
}

void hmdWiFiClientDeviceAttachmentCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = a2;
    _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Device attachement callback: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "startWithWiFiDevice:", a2);

}

void hmdWiFiClientWoWStateChangedCallback(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __hmdWiFiClientWoWStateChangedCallback_block_invoke;
  v7[3] = &unk_1E3B395E8;
  v8 = v4;
  v9 = a2;
  v6 = v4;
  dispatch_async(v5, v7);

}

void sub_19B5AD2A4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5AD354(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t hmdWiFiDeviceClientExtendedLinkCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "handleWiFiLinkChangedWithEventDictionary:", a2);
}

void sub_19B5ADC00(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dynamicStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] captive state changed", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  return objc_msgSend(a3, "_invalidateCaptiveState");
}

void __hmdWiFiClientWoWStateChangedCallback_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource:didChangeWoWState:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) != 0);

}

BOOL HMFAreStringsEqualIgnoringCase(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "caseInsensitiveCompare:", v4) == 0;
  }

  return v6;
}

uint64_t HMFIntrinsicComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t HMFReverseIntrinsicComparator_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void sub_19B5AF9DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B0B24(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B0B94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B0C18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B0C9C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B12FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B5B1790(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B18D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B1A20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B222C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMFEnabledStatusToString(int a1)
{
  if (a1)
    return CFSTR("Enabled");
  else
    return CFSTR("Disabled");
}

void _networkReachabilityChangeCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "handleNetworkReachabilityChange:", a2);
}

__CFString *__SCNetworkReachabilityFlagsToString(unsigned int a1)
{
  void *v2;
  int i;
  const __CFString *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
  {
    for (i = 1; i - 1 < a1; i *= 2)
    {
      if ((i & a1) != 0)
      {
        if (i == 2)
        {
          v4 = CFSTR("Reachable");
          goto LABEL_8;
        }
        if (i == 0x40000)
        {
          v4 = CFSTR("WWAN");
LABEL_8:
          objc_msgSend(v2, "addObject:", v4);
        }
      }
    }
  }
  if ((objc_msgSend(v2, "hmf_isEmpty") & 1) != 0)
  {
    v5 = CFSTR("None");
  }
  else
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void sub_19B5B4810(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B5004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19B5B6AE4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B6C40(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B6D2C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __notifyUpdatedTXTRecord(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (v5 && v3)
  {
    objc_msgSend(v5, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "netService:didUpdateTXTRecord:", v5, v3);

  }
}

void sub_19B5B6E3C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMFNetServiceUpdatePort(void *a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a1;
    NSStringFromSelector(sel_port);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s willChangeValueForKey:](v3, "willChangeValueForKey:", v4);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)&v3[12]._os_unfair_lock_opaque = a2;
    os_unfair_lock_unlock(v3 + 2);
    NSStringFromSelector(sel_port);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s didChangeValueForKey:](v3, "didChangeValueForKey:", v5);

  }
}

void sub_19B5B86C4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19B5B8A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, uint64_t a12)
{
  os_unfair_lock_s *v12;

  os_unfair_lock_unlock(v12);
  _Unwind_Resume(a1);
}

void sub_19B5B8CDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19B5B9C68()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_19B5B9C74()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_19B5B9C80()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_19B5B9C8C()
{
  return MEMORY[0x1E0D12FB0]();
}

uint64_t sub_19B5B9C98()
{
  return MEMORY[0x1E0D12FE8]();
}

uint64_t sub_19B5B9CA4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_19B5B9CB0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19B5B9CBC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_19B5B9CC8()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_19B5B9CD4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_19B5B9CE0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19B5B9CEC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19B5B9CF8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19B5B9D04()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19B5B9D10()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19B5B9D1C()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_19B5B9D28()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_19B5B9D34()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_19B5B9D40()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_19B5B9D4C()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_19B5B9D58()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_19B5B9D64()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_19B5B9D70()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_19B5B9D7C()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_19B5B9D88()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_19B5B9D94()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_19B5B9DA0()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_19B5B9DAC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_19B5B9DB8()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_19B5B9DC4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_19B5B9DD0()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_19B5B9DDC()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_19B5B9DE8()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_19B5B9DF4()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t sub_19B5B9E00()
{
  return MEMORY[0x1E0DF0650]();
}

uint64_t sub_19B5B9E0C()
{
  return MEMORY[0x1E0DF0670]();
}

uint64_t sub_19B5B9E18()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_19B5B9E24()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_19B5B9E30()
{
  return MEMORY[0x1E0DF0940]();
}

uint64_t sub_19B5B9E3C()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t sub_19B5B9E48()
{
  return MEMORY[0x1E0DF0978]();
}

uint64_t sub_19B5B9E54()
{
  return MEMORY[0x1E0DF09B0]();
}

uint64_t sub_19B5B9E60()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_19B5B9E6C()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_19B5B9E78()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_19B5B9E84()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_19B5B9E90()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_19B5B9E9C()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t sub_19B5B9EA8()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_19B5B9EB4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19B5B9EC0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_19B5B9ECC()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_19B5B9ED8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19B5B9EE4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19B5B9EF0()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_19B5B9EFC()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_19B5B9F08()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19B5B9F14()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19B5B9F20()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_19B5B9F2C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19B5B9F38()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_19B5B9F44()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_19B5B9F50()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_19B5B9F5C()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_19B5B9F68()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_19B5B9F74()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19B5B9F80()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19B5B9F8C()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_19B5B9F98()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_19B5B9FA4()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_19B5B9FB0()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_19B5B9FBC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19B5B9FC8()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_19B5B9FD4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19B5B9FE0()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_19B5B9FEC()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_19B5B9FF8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_19B5BA004()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19B5BA010()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19B5BA01C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19B5BA028()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19B5BA034()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_19B5BA040()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19B5BA04C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19B5BA058()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19B5BA064()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_19B5BA070()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t sub_19B5BA07C()
{
  return MEMORY[0x1E0DF0F30]();
}

uint64_t sub_19B5BA088()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t sub_19B5BA094()
{
  return MEMORY[0x1E0DF0F40]();
}

uint64_t sub_19B5BA0A0()
{
  return MEMORY[0x1E0DF0F48]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1E0D1A970]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1E0C927E8](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1E0C927F0](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x1E0C927F8](message, headerField);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92838](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92840](alloc, statusCode, statusDescription, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
  MEMORY[0x1E0C92860](message, bodyData);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x1E0C92868](message, headerField, value);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1E0C98760]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x1E0C98B98](stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x1E0C98BA0](stream, q);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98E18](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1E0C98E20](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x1E0C98E38](s);
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x1E0C98E40](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x1E0C98E50](s);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1E0D1ABD8]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1E0D1AFD8]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1E0DE2B18]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1E0DE2B40]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1E0D1B5F8]();
}

uint64_t SCDynamicStoreAddWatchedKey()
{
  return MEMORY[0x1E0CE8730]();
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x1E0CE8750](store);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateHostNames(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1E0CE8790](allocator);
}

uint64_t SCDynamicStoreRemoveWatchedKey()
{
  return MEMORY[0x1E0CE87B8]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B798]();
}

uint64_t WiFiCopyCurrentNetworkInfo()
{
  return MEMORY[0x1E0D1B820]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1E0D1B828]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1E0D4FAF8]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1E0D4FB68]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1E0D4FC40]();
}

uint64_t WiFiManagerClientGetWoWState()
{
  return MEMORY[0x1E0D4FC50]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1E0D4FC58]();
}

uint64_t WiFiManagerClientRegisterWowStateChangedCallback()
{
  return MEMORY[0x1E0D4FC78]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x1E0D4FCA8]();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return MEMORY[0x1E0D4FCB0]();
}

uint64_t WiFiNetworkCopyBSSIDData()
{
  return MEMORY[0x1E0D4FCC8]();
}

uint64_t WiFiNetworkGetRSSI()
{
  return MEMORY[0x1E0D4FD28]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1E0D4FD30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFHTTPServerConnectionCopyProperty()
{
  return MEMORY[0x1E0C92E18]();
}

uint64_t _CFHTTPServerConnectionInvalidate()
{
  return MEMORY[0x1E0C92E20]();
}

uint64_t _CFHTTPServerConnectionIsValid()
{
  return MEMORY[0x1E0C92E28]();
}

uint64_t _CFHTTPServerConnectionSetClient()
{
  return MEMORY[0x1E0C92E30]();
}

uint64_t _CFHTTPServerConnectionSetDispatchQueue()
{
  return MEMORY[0x1E0C92E38]();
}

uint64_t _CFHTTPServerCopyProperty()
{
  return MEMORY[0x1E0C92E40]();
}

uint64_t _CFHTTPServerCreateService()
{
  return MEMORY[0x1E0C92E48]();
}

uint64_t _CFHTTPServerInvalidate()
{
  return MEMORY[0x1E0C92E50]();
}

uint64_t _CFHTTPServerIsValid()
{
  return MEMORY[0x1E0C92E58]();
}

uint64_t _CFHTTPServerRequestCopyBodyStream()
{
  return MEMORY[0x1E0C92E60]();
}

uint64_t _CFHTTPServerRequestCopyProperty()
{
  return MEMORY[0x1E0C92E68]();
}

uint64_t _CFHTTPServerRequestCreateResponseMessage()
{
  return MEMORY[0x1E0C92E70]();
}

uint64_t _CFHTTPServerResponseCreateWithData()
{
  return MEMORY[0x1E0C92E78]();
}

uint64_t _CFHTTPServerResponseEnqueue()
{
  return MEMORY[0x1E0C92E80]();
}

uint64_t _CFHTTPServerResponseSetClient()
{
  return MEMORY[0x1E0C92E88]();
}

uint64_t _CFHTTPServerSetDispatchQueue()
{
  return MEMORY[0x1E0C92E90]();
}

uint64_t _CFHTTPServerSetProperty()
{
  return MEMORY[0x1E0C92E98]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1E0CB3BF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1E0D1B890]();
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C82B70]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

uint64_t dispatch_block_create_with_voucher()
{
  return MEMORY[0x1E0C82C70]();
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return MEMORY[0x1E0C82C78]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1E0C82E68](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1E0C83960](*(_QWORD *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1E0CCEF08](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
  MEMORY[0x1E0CCEF18](descriptor, include_txt_record);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEF20](result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x1E0CCEF28](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1E0CCEF30](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF38](browser);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1E0CCEF40](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
  MEMORY[0x1E0CCEF48](browser, handler);
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCEF50](browser, queue);
}

void nw_browser_start(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF60](browser);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1E0CCEFE8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x1E0CCF3C0]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_domain(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3E8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F8](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF428](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1E0CCF6F8]();
}

void nw_ip_options_set_version(nw_protocol_options_t options, nw_ip_version_t version)
{
  MEMORY[0x1E0CCF7C0](options, *(_QWORD *)&version);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

void nw_parameters_prohibit_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x1E0CCFA30](parameters, interface);
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x1E0CCFCC0]();
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCFFD0](stack);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x1E0CD03E0](txt_record, applier);
}

size_t nw_txt_record_get_key_count(nw_txt_record_t txt_record)
{
  return MEMORY[0x1E0CD03F0](txt_record);
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x1E0CD0410]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return MEMORY[0x1E0C84508](activity, parent_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1E0C84980]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1E0C85068](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1E0C85310](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x1E0DF0FF0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1E0C85B28]();
}

