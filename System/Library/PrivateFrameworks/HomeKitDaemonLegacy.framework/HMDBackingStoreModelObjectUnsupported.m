@implementation HMDBackingStoreModelObjectUnsupported

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  char v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDBackingStoreModelObjectUnsupported *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  HMDBackingStoreModelObjectUnsupported *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  os_log_type_t type;
  char v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject bsoType](self, "bsoType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreModelObject bsoType](self, "bsoType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v17;
  }
  type = a5;
  v41 = v9;
  objc_msgSend(v8, "appendFormat:", CFSTR("%@values: (%@)"), v7, v9);
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\n  uuid: %@"), v19);

  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\n  parent: %@"), v21);

  -[HMDBackingStoreModelObject bsoDataVersion](self, "bsoDataVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\n  version: %@"), v22);

  -[HMDBackingStoreModelObject bsoIgnoredBefore](self, "bsoIgnoredBefore");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = self;
  if (v23)
    objc_msgSend(v8, "appendFormat:", CFSTR("\n  ignore before: %@"), v23);
  v40 = v24;
  v44 = v8;
  v43 = shouldLogPrivateInformation();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSMutableDictionary allKeys](self->super._reserved, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if ((objc_msgSend(v31, "hasPrefix:", CFSTR("_")) & 1) == 0)
        {
          -[NSMutableDictionary valueForKey:](v25->super._reserved, "valueForKey:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            if ((v43 & 1) != 0)
            {
              +[HMDBackingStoreModelObject formatValue:](HMDBackingStoreModelObject, "formatValue:", v32);
              v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v34 = CFSTR("...");
              v35 = CFSTR("...");
            }

            objc_msgSend(v44, "appendFormat:", CFSTR("\n  %@ (read-only) (unsupported): %@"), v31, v34, v40);
          }
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v28);
  }

  v36 = (void *)MEMORY[0x1D17BA0A0]();
  v37 = v25;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, type))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v39;
    v51 = 2112;
    v52 = v44;
    _os_log_impl(&dword_1CD062000, v38, type, "%{public}@HMDBackingStoreModelObjectUnsupported %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v36);

}

- (void)dumpDebug:(id)a3
{
  -[HMDBackingStoreModelObjectUnsupported dumpWithVerbosity:prefix:logType:](self, "dumpWithVerbosity:prefix:logType:", 0, a3, 1);
}

- (void)dumpDebug
{
  -[HMDBackingStoreModelObjectUnsupported dumpDebug:](self, "dumpDebug:", &stru_1E89C3E38);
}

@end
