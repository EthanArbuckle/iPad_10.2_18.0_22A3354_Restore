@implementation HMDSetting

- (HMDSetting)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSetting *v11;

  v4 = a3;
  +[HMDSetting settingValueWithModel:](HMDSetting, "settingValueWithModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbParentModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMDSetting initWithIdentifier:parentIdentifier:name:properties:type:value:constraints:](self, "initWithIdentifier:parentIdentifier:name:properties:type:value:constraints:", v6, v7, v8, v9, v10, v5, MEMORY[0x1E0C9AA60]);
  return v11;
}

- (HMDSetting)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 properties:(id)a6 type:(id)a7 value:(id)a8 constraints:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDSetting *v22;
  uint64_t v23;
  NSUUID *identifier;
  uint64_t v25;
  NSUUID *parentIdentifier;
  uint64_t v27;
  NSString *name;
  uint64_t v29;
  NSString *keyPath;
  uint64_t v31;
  NSNumber *type;
  uint64_t v33;
  NSNumber *properties;
  uint64_t v35;
  NSMutableArray *constraints;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDSetting;
  v22 = -[HMDSetting init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    v25 = objc_msgSend(v16, "copy");
    parentIdentifier = v22->_parentIdentifier;
    v22->_parentIdentifier = (NSUUID *)v25;

    v27 = objc_msgSend(v17, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v27;

    v29 = objc_msgSend(v17, "copy");
    keyPath = v22->_keyPath;
    v22->_keyPath = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    type = v22->_type;
    v22->_type = (NSNumber *)v31;

    objc_storeStrong((id *)&v22->_internalValue, a8);
    v33 = objc_msgSend(v18, "copy");
    properties = v22->_properties;
    v22->_properties = (NSNumber *)v33;

    v35 = objc_msgSend(v21, "mutableCopy");
    constraints = v22->_constraints;
    v22->_constraints = (NSMutableArray *)v35;

  }
  return v22;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSetting name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSetting identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSetting internalValue](self, "internalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDSetting: %@/%@ - %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)value
{
  id v2;
  uint64_t v3;
  HMDSettingValueSelectionItem *v4;
  HMDSettingValueSelectionItem *v5;
  void *v6;
  void *v7;

  -[HMDSetting internalValue](self, "internalValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v2, "type"))
  {
    case 1:
      objc_msgSend(v2, "dataValue");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(v2, "numberValue");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(v2, "stringValue");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = (HMDSettingValueSelectionItem *)v3;
      break;
    case 4:
      v5 = [HMDSettingValueSelectionItem alloc];
      objc_msgSend(v2, "selectionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "selectionValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HMDSettingValueSelectionItem initWithIdentifier:selection:](v5, "initWithIdentifier:selection:", v6, v7);

      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

- (NSArray)constraints
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_constraints, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setConstraints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *constraints;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  constraints = self->_constraints;
  self->_constraints = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)addConstraint:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)updateWithSettingValue:(id)a3
{
  id v4;
  void *v5;
  HMDSetting *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  HMDSetting *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HMDSetting isValidValue:error:](self, "isValidValue:error:", v4, 0))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Received value is not valid %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    goto LABEL_9;
  }
  if (!-[HMDSetting wouldValueUpdate:](self, "wouldValueUpdate:", v4))
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSetting name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSetting internalValue](v6, "internalValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ in transaction from %@ to %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSetting setInternalValue:](v6, "setInternalValue:", v4);
  v11 = 1;
LABEL_10:

  return v11;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSetting identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSetting name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  HMDSetting *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDSetting *v12;
  NSObject *v13;
  void *v14;
  HMDSetting *v15;
  id v16;
  const char *v17;
  uint64_t i;
  void *v19;
  void *v20;
  HMDSetting *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  long double v38;
  long double v39;
  double v40;
  uint64_t v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  HMDSetting *v46;
  NSObject *v47;
  void *v48;
  HMDSetting *v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  HMDSetting *v53;
  BOOL v54;
  void *v55;
  HMDSetting *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMDSetting *v60;
  NSObject *v61;
  HMDSetting *v62;
  void *v63;
  void *v64;
  HMDSetting *v65;
  NSObject *v66;
  void *v67;
  const char *v68;
  void *v69;
  HMDSetting *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id *v74;
  id v75;
  NSObject *v76;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  void *v83;
  NSObject *v84;
  void *v86;
  id *v88;
  id v89;
  id obj;
  void *context;
  void *contexta;
  void *contextc;
  void *contextb;
  uint64_t v95;
  void *v96;
  HMDSetting *v97;
  HMDSetting *v98;
  HMDSetting *v99;
  HMDSetting *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[4];
  void *v106;
  __int16 v107;
  id v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  v8 = v6;
  -[HMDSetting type](v7, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 1:
      if (objc_msgSend(v8, "type") == 1)
        goto LABEL_53;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v7;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_62;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      v107 = 2112;
      v108 = v16;
      v17 = "%{public}@Unexpected value type: %@ expected data";
      goto LABEL_61;
    case 2:
      if (objc_msgSend(v8, "type") != 2)
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = v7;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138543618;
          v106 = v14;
          v107 = 2112;
          v108 = v16;
          v17 = "%{public}@Unexpected value class: %@ expected number";
LABEL_61:
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v17, v105, 0x16u);

          v7 = v15;
        }
LABEL_62:

        objc_autoreleasePoolPop(v11);
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
          v54 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_95;
        }
        goto LABEL_94;
      }
      v88 = a4;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      -[HMDSetting constraints](v7, "constraints");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
      if (!v95)
        goto LABEL_48;
      context = *(void **)v102;
      v89 = v8;
      break;
    case 3:
      if (objc_msgSend(v8, "type") == 3)
        goto LABEL_53;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v7;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_62;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      v107 = 2112;
      v108 = v16;
      v17 = "%{public}@Unexpected value type: %@ expected string";
      goto LABEL_61;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_53;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v7;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_62;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      v107 = 2112;
      v108 = (id)objc_opt_class();
      v15 = v7;
      v16 = v108;
      v17 = "%{public}@Unexpected value class: %@";
      goto LABEL_61;
    case 5:
      v55 = (void *)MEMORY[0x1D17BA0A0]();
      v56 = v7;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v105 = 138543362;
        v106 = v58;
        _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Value cannot be used for collection.", v105, 0xCu);

      }
      objc_autoreleasePoolPop(v55);
      goto LABEL_94;
    default:
      goto LABEL_94;
  }
  do
  {
    for (i = 0; i != v95; ++i)
    {
      if (*(void **)v102 != context)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
      objc_msgSend(v8, "numberValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v7;
      v22 = v20;
      v23 = v19;
      -[HMDSetting value](v21, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v25;

      objc_msgSend(v23, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "integerValue");

      switch(v28)
      {
        case 3:
          objc_msgSend(v23, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v33 = v29;
          else
            v33 = 0;
          v34 = v33;

          if (v34)
          {
            if (!v22)
            {
              v69 = (void *)MEMORY[0x1D17BA0A0]();
              v70 = v21;
              HMFGetOSLogHandle();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v97 = v7;
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "value");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v110 = v72;
                v111 = 2112;
                v112 = v73;
                _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@Value is nil but have step value constraint: %@", buf, 0x16u);

                v7 = v97;
              }

              objc_autoreleasePoolPop(v69);
              v22 = 0;
              v32 = v26;
              goto LABEL_92;
            }
            v32 = v26;
            objc_msgSend(v22, "doubleValue");
            v36 = v35;
            objc_msgSend(v26, "doubleValue");
            v38 = vabdd_f64(v36, v37);
            objc_msgSend(v34, "doubleValue");
            v40 = fmod(v38, v39);
            if (v40 > 0.00000011920929)
            {
              v41 = objc_msgSend(v34, "doubleValue");
              if (v40 < v42 + -0.00000011920929)
              {
                contextb = (void *)MEMORY[0x1D17BA0A0](v41);
                v100 = v21;
                HMFGetOSLogHandle();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v110 = v86;
                  v111 = 2112;
                  v112 = v22;
                  v113 = 2112;
                  v114 = v34;
                  v115 = 2112;
                  v116 = v26;
                  _os_log_impl(&dword_1CD062000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, does not conform to step, %@, from current value: %@", buf, 0x2Au);

                  v32 = v26;
                }

                objc_autoreleasePoolPop(contextb);
                v74 = v88;
                if (v88)
                {
                  v79 = (void *)MEMORY[0x1E0CB35C8];
                  v80 = 43;
LABEL_90:
                  objc_msgSend(v79, "hmErrorWithCode:", v80);
                  v75 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:
                  *v74 = v75;
                }
LABEL_92:

LABEL_93:
LABEL_94:
                v54 = 0;
                goto LABEL_95;
              }
            }
          }
          else
          {
            v29 = 0;
            v32 = v26;
          }
          break;
        case 2:
          objc_msgSend(v23, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v43 = v29;
          else
            v43 = 0;
          v44 = v43;

          if (!v44)
          {
            v45 = (void *)MEMORY[0x1D17BA0A0]();
            v53 = v21;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "value");
              v49 = v7;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v110 = v48;
              v111 = 2112;
              v112 = v50;
              v51 = v47;
              v52 = "%{public}@Invalid maximum constraint value: %@";
LABEL_44:
              _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 0x16u);

              v7 = v49;
              v8 = v89;

            }
LABEL_45:
            v32 = v26;

            objc_autoreleasePoolPop(v45);
            v29 = 0;
            break;
          }
          if (!v22)
          {
            v64 = (void *)MEMORY[0x1D17BA0A0]();
            v65 = v21;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v96 = v64;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v67;
              v111 = 2112;
              v112 = 0;
              v113 = 2112;
              v114 = v44;
              v68 = "%{public}@Value is %@, but have maximum value constraint: %@";
LABEL_74:
              _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_DEFAULT, v68, buf, 0x20u);

              v64 = v96;
            }
LABEL_75:

            objc_autoreleasePoolPop(v64);
            v74 = v88;
            v32 = v26;
            if (v88)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 44);
              v75 = (id)objc_claimAutoreleasedReturnValue();
              v22 = 0;
              goto LABEL_91;
            }
            v22 = 0;
            goto LABEL_92;
          }
          v32 = v26;
          if (objc_msgSend(v22, "compare:", v44) == 1)
          {
            contextc = (void *)MEMORY[0x1D17BA0A0]();
            v99 = v21;
            HMFGetOSLogHandle();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v83;
              v111 = 2112;
              v112 = v22;
              v113 = 2112;
              v114 = v44;
              _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, more than maximum value: %@", buf, 0x20u);

              v32 = v26;
            }

            objc_autoreleasePoolPop(contextc);
            v74 = v88;
            if (v88)
            {
              v79 = (void *)MEMORY[0x1E0CB35C8];
              v80 = 45;
              goto LABEL_90;
            }
            goto LABEL_92;
          }
          break;
        case 1:
          objc_msgSend(v23, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v30 = v29;
          else
            v30 = 0;
          v31 = v30;

          if (!v31)
          {
            v45 = (void *)MEMORY[0x1D17BA0A0]();
            v46 = v21;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "value");
              v49 = v7;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v110 = v48;
              v111 = 2112;
              v112 = v50;
              v51 = v47;
              v52 = "%{public}@Invalid minimum constraint value: %@";
              goto LABEL_44;
            }
            goto LABEL_45;
          }
          if (!v22)
          {
            v64 = (void *)MEMORY[0x1D17BA0A0]();
            v65 = v21;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v96 = v64;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v67;
              v111 = 2112;
              v112 = 0;
              v113 = 2112;
              v114 = v31;
              v68 = "%{public}@Value is %@, but have minimum value constraint: %@";
              goto LABEL_74;
            }
            goto LABEL_75;
          }
          v32 = v26;
          if (objc_msgSend(v22, "compare:", v31) == -1)
          {
            contexta = (void *)MEMORY[0x1D17BA0A0]();
            v98 = v21;
            HMFGetOSLogHandle();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v78;
              v111 = 2112;
              v112 = v22;
              v113 = 2112;
              v114 = v31;
              _os_log_impl(&dword_1CD062000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, less than minimum value: %@", buf, 0x20u);

              v32 = v26;
            }

            objc_autoreleasePoolPop(contexta);
            v74 = v88;
            if (v88)
            {
              v79 = (void *)MEMORY[0x1E0CB35C8];
              v80 = 44;
              goto LABEL_90;
            }
            goto LABEL_92;
          }
          break;
        default:
          v59 = (void *)MEMORY[0x1D17BA0A0]();
          v60 = v21;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v62 = v7;
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v110 = v63;
            v111 = 2112;
            v112 = v22;
            _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@Did not understand value %@", buf, 0x16u);

            v7 = v62;
          }

          objc_autoreleasePoolPop(v59);
          v32 = v26;
          goto LABEL_93;
      }

    }
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
  }
  while (v95);
LABEL_48:

LABEL_53:
  v54 = 1;
LABEL_95:

  return v54;
}

- (BOOL)wouldValueUpdate:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDSetting internalValue](self, "internalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6 ^ 1;
}

- (id)constraintsByKeyPathWithCurrentKeyPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDSetting constraints](self, "constraints");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setValue:forKey:", v10, v13);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (HMDSetting)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSetting *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) != 0)
  {
    -[HMDSetting identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB7E78]);

    -[HMDSetting parentIdentifier](self, "parentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDSettingParentIdentifierCodingKey"));

    -[HMDSetting properties](self, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB7E88]);

    -[HMDSetting name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x1E0CB7E80]);

    -[HMDSetting constraints](self, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB7E50]);

    -[HMDSetting value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, *MEMORY[0x1E0CB7EE0]);

    -[HMDSetting type](self, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, *MEMORY[0x1E0CB7EB8]);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Did not encode setting as transport is not XPC.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (NSNumber)type
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)properties
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (HMSettingValue)internalValue
{
  return (HMSettingValue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInternalValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalValue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

+ (id)settingValueWithModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "integerValue"))
  {
    case 1:
      objc_msgSend(v3, "dataValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      goto LABEL_10;
    case 2:
      objc_msgSend(v3, "numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      v5 = 0;
      goto LABEL_11;
    case 3:
      objc_msgSend(v3, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      v5 = 0;
      v11 = 0;
      goto LABEL_12;
    case 4:
      objc_msgSend(v3, "selectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "selectionValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v10;
        v17 = 2112;
        v18 = v3;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine type of setting value for model %@ of type %@.", (uint8_t *)&v15, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v6 = 0;
      v7 = 0;
LABEL_9:
      v5 = 0;
LABEL_10:
      v11 = 0;
LABEL_11:
      v12 = 0;
LABEL_12:
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA820]), "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", objc_msgSend(v4, "integerValue"), v12, v11, v5, v7, v6);

      return v13;
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1)
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_334);
  return (id)logCategory__hmf_once_v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __25__HMDSetting_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8;
  logCategory__hmf_once_v8 = v0;

}

@end
