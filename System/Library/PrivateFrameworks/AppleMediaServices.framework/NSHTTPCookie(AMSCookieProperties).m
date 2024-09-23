@implementation NSHTTPCookie(AMSCookieProperties)

+ (uint64_t)ams_cookiesForProperties:()AMSCookieProperties
{
  return objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_146);
}

+ (uint64_t)ams_propertyXPCClasses
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (uint64_t)ams_propertiesForCookies:()AMSCookieProperties
{
  return objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_109);
}

+ (id)ams_cookiesByMergingProperties:()AMSCookieProperties intoProperties:
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  uint64_t v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v55 = v7;
  objc_msgSend(a1, "ams_cookiesForProperties:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  objc_msgSend(a1, "ams_cookiesForProperties:", v8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v53);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v11)
  {
    v12 = v11;
    v13 = MEMORY[0x1E0C809B0];
    v67 = *(_QWORD *)v72;
    v62 = v10;
    do
    {
      v14 = 0;
      v65 = v12;
      do
      {
        v69 = v4;
        if (*(_QWORD *)v72 != v67)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v14);
        v70[0] = v13;
        v70[1] = 3221225472;
        v70[2] = __83__NSHTTPCookie_AMSCookieProperties__ams_cookiesByMergingProperties_intoProperties___block_invoke;
        v70[3] = &unk_1E2547A78;
        v70[4] = v15;
        v16 = objc_msgSend(v10, "indexOfObjectPassingTest:", v70);
        v17 = v68;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v18, "OSLogObject");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            AMSLogKey();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0CB3940];
            v22 = objc_opt_class();
            v23 = v22;
            if (v20)
            {
              AMSLogKey();
              v64 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v64);
              v24 = objc_claimAutoreleasedReturnValue();
              v63 = (void *)v24;
            }
            else
            {
              objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
              v24 = objc_claimAutoreleasedReturnValue();
              v17 = (void *)v24;
            }
            AMSHashIfNeeded(v15);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = v24;
            v77 = 2114;
            v78 = v43;
            _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Added cookie %{public}@ from source into existing.", buf, 0x16u);
            v44 = v17;
            if (v20)
            {

              v44 = (void *)v64;
            }
            v68 = v17;

            v12 = v65;
          }

          objc_msgSend(v10, "addObject:", v15);
          v4 = v69;
        }
        else
        {
          v25 = v16;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v15, "ams_shouldReplaceCookie:", v26);
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v27)
          {
            if (!v28)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v29, "OSLogObject");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              AMSLogKey();
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)MEMORY[0x1E0CB3940];
              v33 = objc_opt_class();
              v34 = v33;
              v61 = (void *)v31;
              if (v31)
              {
                AMSLogKey();
                v58 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] "), v34, v58);
                v35 = objc_claimAutoreleasedReturnValue();
                v57 = (void *)v35;
                v36 = v60;
              }
              else
              {
                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: "), v33);
                v35 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v35;
              }
              AMSHashIfNeeded(v26);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v15);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v76 = v35;
              v77 = 2114;
              v78 = v45;
              v79 = 2114;
              v80 = v46;
              _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing cookie %{public}@ with cookie %{public}@.", buf, 0x20u);
              v60 = v36;
              v47 = v36;
              if (v61)
              {

                v47 = (void *)v58;
              }

              v10 = v62;
              v12 = v65;
            }

            objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v25, v15);
            v13 = MEMORY[0x1E0C809B0];
            v4 = v69;
          }
          else
          {
            if (!v28)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v29, "OSLogObject");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              AMSLogKey();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)MEMORY[0x1E0CB3940];
              v40 = objc_opt_class();
              v41 = v40;
              if (v38)
              {
                AMSLogKey();
                v59 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "stringWithFormat:", CFSTR("%@: [%@] "), v41, v59);
                v42 = objc_claimAutoreleasedReturnValue();
                v56 = (void *)v42;
                v4 = v69;
              }
              else
              {
                objc_msgSend(v39, "stringWithFormat:", CFSTR("%@: "), v40);
                v42 = objc_claimAutoreleasedReturnValue();
                v4 = (void *)v42;
              }
              AMSHashIfNeeded(v26);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v15);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v76 = v42;
              v77 = 2114;
              v78 = v48;
              v79 = 2114;
              v80 = v49;
              _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Found equivalent cookie %{public}@, but the newer cookie version already exists. Discard this old cookie %{public}@.", buf, 0x20u);
              v50 = v4;
              if (v38)
              {

                v50 = (void *)v59;
              }

              v10 = v62;
              v13 = MEMORY[0x1E0C809B0];
              v12 = v65;
            }
            else
            {
              v4 = v69;
            }

          }
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v12);
  }

  v51 = (void *)objc_msgSend(v10, "copy");
  return v51;
}

@end
