@implementation DKTelephonyProvider

- (id)cellularPlans
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(MEMORY[0x24BE856E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = 0x24F20D000uLL;
    v26 = v2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        _DKLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "carrierName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "phoneNumber");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v4;
          v19 = v8;
          v20 = objc_msgSend(v10, "type");
          v21 = objc_msgSend(v10, "transferredStatus");
          *(_DWORD *)buf = 138413058;
          v22 = CFSTR("YES");
          if (!v21)
            v22 = CFSTR("NO");
          v32 = v16;
          v33 = 2112;
          v34 = v17;
          v35 = 2048;
          v36 = v20;
          v8 = v19;
          v4 = v18;
          v37 = 2112;
          v38 = v22;
          _os_log_debug_impl(&dword_229405000, v11, OS_LOG_TYPE_DEBUG, "cellularPlans - planItem carrierName:%@  phoneNumber:%@ type:%li IsTransfered:%@", buf, 0x2Au);

          v2 = v26;
        }

        if (objc_msgSend(v10, "type") == 2 || objc_msgSend(v10, "type") == 3)
        {
          v12 = objc_alloc(*(Class *)(v8 + 2184));
          objc_msgSend(v10, "carrierName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "phoneNumber");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v12, "initWithCarrierName:phoneNumber:isTransferred:", v13, v14, objc_msgSend(v10, "transferredStatus") != 0);

          objc_msgSend(v2, "addObject:", v15);
        }
        ++v9;
      }
      while (v6 != v9);
      v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      v6 = v23;
    }
    while (v23);
  }

  v24 = (void *)objc_msgSend(v2, "copy");
  return v24;
}

@end
