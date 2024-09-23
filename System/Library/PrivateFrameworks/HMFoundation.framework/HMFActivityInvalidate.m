@implementation HMFActivityInvalidate

void ____HMFActivityInvalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE info[12];
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = mach_continuous_time();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 96);
  else
    v4 = 0;
  *(_QWORD *)info = 0;
  v5 = mach_timebase_info((mach_timebase_info_t)info);
  v6 = *(unsigned int *)info;
  v7 = *(unsigned int *)&info[4];
  v8 = (void *)MEMORY[0x1A1AC355C](v5);
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (double)((v2 - v4) * v6 / v7) / 1000000000.0;
    HMFGetLogIdentifier(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)info = 138543618;
    *(_QWORD *)&info[4] = v12;
    v28 = 2048;
    v29 = v11;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Invalidated after %fs", info, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v13 + 80) & 4) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
  }
  else
  {
    objc_msgSend((id)v13, "parent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markWithFormat:", CFSTR("Stopped child activity: %@"), v15);

    v13 = *(_QWORD *)(a1 + 32);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (!v13)
    {
      v16 = 0;
      goto LABEL_10;
    }
  }
  v16 = *(void **)(v13 + 88);
LABEL_10:
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "invalidate");
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

@end
