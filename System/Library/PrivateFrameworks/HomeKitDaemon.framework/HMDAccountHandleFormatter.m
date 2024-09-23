@implementation HMDAccountHandleFormatter

+ (id)defaultFormatter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (v5)
    goto LABEL_9;
  v7 = v4;
  objc_opt_class();
  v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  v9 = v8;

  -[HMDAccountHandleFormatter accountHandleFromString:](self, "accountHandleFromString:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_9:
    objc_msgSend(v6, "URI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unprefixedURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = (void *)IDSCopyAddressDestinationForDestination();
  if ((objc_msgSend(v7, "_appearsToBeEmail") & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("mailto:")))
  {
    v8 = objc_alloc(MEMORY[0x24BE4FCE0]);
    v9 = MEMORY[0x227675558](v7);
LABEL_7:
    v10 = (void *)v9;
    v11 = (void *)objc_msgSend(v8, "initWithPrefixedURI:", v9);

    if (a3)
      *a3 = -[HMDAccountHandle initWithURI:]([HMDAccountHandle alloc], "initWithURI:", v11);
    v12 = 1;
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "_appearsToBePhoneNumber") & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("tel:")))
  {
    v8 = objc_alloc(MEMORY[0x24BE4FCE0]);
    v9 = IDSCopyIDForPhoneNumber();
    goto LABEL_7;
  }
  v12 = 0;
  v11 = 0;
  if (a5)
    *a5 = CFSTR("String does not appear to be valid handle type");
LABEL_10:

  return v12;
}

- (id)accountHandleFromString:(id)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = -[HMDAccountHandleFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", &v8, a3, 0);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (v3)
    v6 = v4;

  return v6;
}

- (id)privateStringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAccountHandleFormatter *v14;
  id v15;
  uint64_t v16;
  void *v17;
  HMDAccountHandleFormatter *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  HMDAccountHandleFormatter *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  HMDAccountHandleFormatter *v59;
  HMDAccountHandleFormatter *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = v4;
  if (!v6)
  {
    v8 = v4;
    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    v10 = v9;

    -[HMDAccountHandleFormatter accountHandleFromString:](self, "accountHandleFromString:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "type");
  if (v11 == 2)
  {
    objc_msgSend(v7, "URI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unprefixedURI");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self;
    v15 = v23;
    v24 = MEMORY[0x227676638]();
    v25 = objc_msgSend(v15, "length");
    v26 = objc_msgSend(v15, "characterAtIndex:", 0) == 43;
    v27 = (unint64_t)(v25 - v26) >= 4;
    v28 = v25 - v26 - 4;
    if (v28 != 0 && v27)
    {
      v60 = v14;
      v37 = v24;
      v38 = v12;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 >= 1)
      {
        v40 = v28;
        do
        {
          objc_msgSend(v39, "appendString:", CFSTR("."));
          --v40;
        }
        while (v40);
      }
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v26, v28, v39);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v12 = v38;
      v24 = v37;
      v14 = v60;
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v14;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Phone number is too short to partially redact", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      v33 = 0;
    }
    v36 = (void *)v24;
    goto LABEL_31;
  }
  if (v11 != 1)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v7, "URI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unprefixedURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  v15 = v13;
  v16 = MEMORY[0x227676638]();
  if ((unint64_t)objc_msgSend(v15, "length") > 4)
  {
    v34 = objc_msgSend(v15, "rangeOfString:", CFSTR("@"));
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v35 = v34;
      if (v34)
      {
        v58 = v16;
        v59 = v14;
        v61 = v12;
        objc_msgSend(v15, "substringToIndex:", v34);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringByReplacingCharactersInRange:withString:", 1, v35 - 1, CFSTR("***"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "substringFromIndex:", v35 + 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsSeparatedByString:", CFSTR("."));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v47 = v45;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v63 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              if (objc_msgSend(v52, "length"))
              {
                objc_msgSend(v52, "stringByReplacingCharactersInRange:withString:", 1, objc_msgSend(v52, "length") - 1, CFSTR("***"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "addObject:", v53);

              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
          }
          while (v49);
        }

        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("."));
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v54, "lowercaseString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "stringWithFormat:", CFSTR("%@@%@"), v57, v56);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v14 = v59;
        v12 = v61;
        v16 = v58;
        goto LABEL_25;
      }
    }
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v20;
      v21 = "%{public}@Failed to determine '@' range";
      goto LABEL_23;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v20;
      v21 = "%{public}@Invalid email address length";
LABEL_23:
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v17);
  v33 = 0;
LABEL_25:
  v36 = (void *)v16;
LABEL_31:
  objc_autoreleasePoolPop(v36);
  v41 = CFSTR("<redacted>");
  if (v33)
    v41 = v33;
  v22 = v41;

LABEL_34:
  return v22;
}

@end
