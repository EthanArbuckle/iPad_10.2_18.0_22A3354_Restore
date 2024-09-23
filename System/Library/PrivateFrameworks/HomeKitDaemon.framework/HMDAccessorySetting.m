@implementation HMDAccessorySetting

- (HMDAccessorySetting)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccessorySetting)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessorySetting *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id value;
  void *v19;
  HMDAccessorySetting *v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = -[HMDAccessorySetting initWithIdentifier:name:](self, "initWithIdentifier:name:", v6, v8);

  if (v9)
  {
    objc_msgSend(v4, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_type = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_properties = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "configurationVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_configurationVersion = objc_msgSend(v12, "unsignedIntegerValue");

    v13 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v14, v15, &v24);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v24;
    value = v9->_value;
    v9->_value = (id)v16;

    if (!v9->_value)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive supported value from the model's value data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  return v9;
}

- (HMDAccessorySetting)initWithIdentifier:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  HMDAccessorySetting *v9;
  HMDAccessorySetting *v10;
  uint64_t v11;
  NSMutableArray *constraints;
  uint64_t v13;
  NSMutableArray *inMemoryCachedConstraints;
  uint64_t v15;
  NSMutableSet *inMemoryCachedConstraintRemovals;
  HMDAccessorySetting *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDAccessorySetting;
    v9 = -[HMDAccessorySetting init](&v19, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_identifier, a3);
      objc_storeStrong((id *)&v10->_name, a4);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      constraints = v10->_constraints;
      v10->_constraints = (NSMutableArray *)v11;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = objc_claimAutoreleasedReturnValue();
      inMemoryCachedConstraints = v10->_inMemoryCachedConstraints;
      v10->_inMemoryCachedConstraints = (NSMutableArray *)v13;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      inMemoryCachedConstraintRemovals = v10->_inMemoryCachedConstraintRemovals;
      v10->_inMemoryCachedConstraintRemovals = (NSMutableSet *)v15;

    }
    self = v10;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessorySetting keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMD-Accessory-Setting: %@/%@ - %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySetting name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\r %@ name = %@, identifier = %@\n"), v7, v8, v9);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessorySetting constraints](self, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v6, "appendFormat:", CFSTR("\r     %@ %@\n"), v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessorySetting name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessorySetting *v4;
  HMDAccessorySetting *v5;
  HMDAccessorySetting *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessorySetting *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessorySetting name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetting name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)compareConstraints:(id)a3
{
  HMDAccessorySetting *v4;
  HMDAccessorySetting *v5;
  HMDAccessorySetting *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMDAccessorySetting *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMDAccessorySetting type](self, "type");
      if (v7 == 4 || v7 == 2)
      {
        v8 = (void *)MEMORY[0x24BDBCF20];
        -[HMDAccessorySetting constraints](self, "constraints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x24BDBCF20];
        -[HMDAccessorySetting constraints](v6, "constraints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "isEqualToSet:", v13);

      }
      else
      {
        v14 = 1;
      }
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (id)copyIdentical
{
  HMDAccessorySetting *v3;
  void *v4;
  void *v5;
  HMDAccessorySetting *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *constraints;
  uint64_t v10;
  id value;

  v3 = [HMDAccessorySetting alloc];
  -[HMDAccessorySetting identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAccessorySetting initWithIdentifier:name:](v3, "initWithIdentifier:name:", v4, v5);

  v6->_type = -[HMDAccessorySetting type](self, "type");
  v6->_properties = -[HMDAccessorySetting properties](self, "properties");
  -[HMDAccessorySetting constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  constraints = v6->_constraints;
  v6->_constraints = (NSMutableArray *)v8;

  -[HMDAccessorySetting value](self, "value");
  v10 = objc_claimAutoreleasedReturnValue();
  value = v6->_value;
  v6->_value = (id)v10;

  return v6;
}

- (id)copyReplica
{
  HMDAccessorySetting *v3;
  void *v4;
  void *v5;
  HMDAccessorySetting *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *constraints;
  uint64_t v11;
  id value;

  v3 = [HMDAccessorySetting alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAccessorySetting initWithIdentifier:name:](v3, "initWithIdentifier:name:", v4, v5);

  v6->_type = -[HMDAccessorySetting type](self, "type");
  v6->_properties = -[HMDAccessorySetting properties](self, "properties");
  -[HMDAccessorySetting constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __deepCopiedConstraints(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mutableCopy");
  constraints = v6->_constraints;
  v6->_constraints = (NSMutableArray *)v9;

  -[HMDAccessorySetting value](self, "value");
  v11 = objc_claimAutoreleasedReturnValue();
  value = v6->_value;
  v6->_value = (id)v11;

  return v6;
}

- (void)setGroup:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *parentIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *keyPath;
  NSString *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v5;

  objc_msgSend(v4, "keyPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySetting name](self, "name");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(".%@"), v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyPath = self->_keyPath;
    self->_keyPath = v8;

  }
  else
  {
    v10 = self->_keyPath;
    self->_keyPath = v7;
    v7 = v10;
  }

}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  int64_t result;

  result = __getType((os_unfair_lock_s *)self);
  if ((unint64_t)result >= 6)
    return 0;
  return result;
}

- (void)_setType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  HMDAccessorySetting *v5;

  if (self)
  {
    p_lock = &self->_lock;
    v5 = self;
    os_unfair_lock_lock_with_options();
    v5->_type = a3;
    os_unfair_lock_unlock(p_lock);

  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (BOOL)isValid:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDAccessorySetting *v11;
  id v12;
  void *v13;
  HMDAccessorySetting *v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDAccessorySetting *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  long double v37;
  long double v38;
  double v39;
  uint64_t v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  HMDAccessorySetting *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDAccessorySetting *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  HMDAccessorySetting *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  HMDAccessorySetting *v60;
  NSObject *v61;
  void *v63;
  uint64_t v64;
  void *v65;
  HMDAccessorySetting *v66;
  NSObject *v67;
  void *v69;
  void *v70;
  HMDAccessorySetting *v71;
  NSObject *v72;
  void *v74;
  id v76;
  id v77;
  HMDAccessorySetting *v78;
  id obj;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t v94[128];
  uint8_t v95[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  id v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAccessorySetting type](self, "type"))
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    -[HMDAccessorySetting constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v87;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v87 != v8)
          objc_enumerationMutation(v5);
        if (!__isConstraintValid(self, *(void **)(*((_QWORD *)&v86 + 1) + 8 * v9), a3))
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
          if (!v7)
            goto LABEL_10;
          goto LABEL_4;
        }
      }

      return 0;
    }
LABEL_10:

    -[HMDAccessorySetting value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    v12 = v10;
    if (!v12)
    {
LABEL_71:
      v16 = 1;
      goto LABEL_94;
    }
    switch(-[HMDAccessorySetting type](v11, "type"))
    {
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_71;
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v11;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_76;
        goto LABEL_75;
      case 2:
        v17 = v12;
        objc_opt_class();
        v18 = objc_opt_isKindOfClass() & 1;
        if (v18)
          v19 = v17;
        else
          v19 = 0;
        v82 = v19;

        if (v18)
        {
          v76 = v17;
          v77 = v12;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          -[HMDAccessorySetting constraints](v11, "constraints");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
          if (!v81)
          {
LABEL_66:

            v16 = 1;
            v12 = v77;
            goto LABEL_94;
          }
          v80 = *(_QWORD *)v91;
          v78 = v11;
LABEL_25:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v91 != v80)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v20);
            v22 = v11;
            v23 = v82;
            v24 = v21;
            -[HMDAccessorySetting value](v22, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v26 = v25;
            else
              v26 = 0;
            v27 = v26;

            v28 = objc_msgSend(v24, "type");
            switch(v28)
            {
              case 3:
                objc_msgSend(v24, "value");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v32 = v29;
                else
                  v32 = 0;
                v33 = v32;

                if (v33)
                {
                  objc_msgSend(v23, "doubleValue");
                  v35 = v34;
                  objc_msgSend(v27, "doubleValue");
                  v37 = vabdd_f64(v35, v36);
                  objc_msgSend(v33, "doubleValue");
                  v39 = fmod(v37, v38);
                  if (v39 > 0.00000011920929)
                  {
                    v40 = objc_msgSend(v33, "doubleValue");
                    if (v39 < v41 + -0.00000011920929)
                    {
                      v70 = (void *)MEMORY[0x227676638](v40);
                      v71 = v22;
                      HMFGetOSLogHandle();
                      v72 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v85 = v70;
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v100 = v74;
                        v101 = 2112;
                        v102 = v76;
                        v103 = 2112;
                        v104 = v33;
                        v105 = 2112;
                        v106 = v27;
                        _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, does not conform to step, %@, from current value: %@", buf, 0x2Au);

                        v70 = v85;
                      }

                      objc_autoreleasePoolPop(v70);
                      if (a3)
                      {
                        v64 = 43;
LABEL_90:
                        v11 = v78;
                        v12 = v77;
                        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v64);
                        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_92:

LABEL_93:
                        v16 = 0;
                        goto LABEL_94;
                      }
LABEL_91:
                      v11 = v78;
                      v12 = v77;
                      goto LABEL_92;
                    }
                  }
                  goto LABEL_63;
                }
                goto LABEL_62;
              case 2:
                objc_msgSend(v24, "value");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v42 = v29;
                else
                  v42 = 0;
                v43 = v42;

                if (v43)
                {
                  if (objc_msgSend(v23, "compare:", v43) == 1)
                  {
                    v65 = (void *)MEMORY[0x227676638]();
                    v66 = v22;
                    HMFGetOSLogHandle();
                    v67 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v84 = v65;
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v100 = v69;
                      v101 = 2112;
                      v102 = v76;
                      v103 = 2112;
                      v104 = v43;
                      _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, more than maximum value: %@", buf, 0x20u);

                      v65 = v84;
                    }

                    objc_autoreleasePoolPop(v65);
                    if (a3)
                    {
                      v64 = 45;
                      goto LABEL_90;
                    }
                    goto LABEL_91;
                  }
                  goto LABEL_63;
                }
                v48 = (void *)MEMORY[0x227676638]();
                v55 = v22;
                HMFGetOSLogHandle();
                v50 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_61;
                HMFGetLogIdentifier();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "value");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v100 = v51;
                v101 = 2112;
                v102 = v52;
                v53 = v50;
                v54 = "%{public}@Invalid maximum constraint value: %@";
                break;
              case 1:
                objc_msgSend(v24, "value");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v30 = v29;
                else
                  v30 = 0;
                v31 = v30;

                if (v31)
                {
                  if (objc_msgSend(v23, "compare:", v31) == -1)
                  {
                    v59 = (void *)MEMORY[0x227676638]();
                    v60 = v22;
                    HMFGetOSLogHandle();
                    v61 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v83 = v59;
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v100 = v63;
                      v101 = 2112;
                      v102 = v76;
                      v103 = 2112;
                      v104 = v31;
                      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, less than minimum value: %@", buf, 0x20u);

                      v59 = v83;
                    }

                    objc_autoreleasePoolPop(v59);
                    if (a3)
                    {
                      v64 = 44;
                      goto LABEL_90;
                    }
                    goto LABEL_91;
                  }
                  goto LABEL_63;
                }
                v48 = (void *)MEMORY[0x227676638]();
                v49 = v22;
                HMFGetOSLogHandle();
                v50 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_61;
                HMFGetLogIdentifier();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "value");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v100 = v51;
                v101 = 2112;
                v102 = v52;
                v53 = v50;
                v54 = "%{public}@Invalid minimum constraint value: %@";
                break;
              default:
                v44 = (void *)MEMORY[0x227676638]();
                v45 = v22;
                HMFGetOSLogHandle();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v100 = v47;
                  v101 = 2112;
                  v102 = v24;
                  _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring numeric constraint: %@", buf, 0x16u);

                  v11 = v78;
                }

                objc_autoreleasePoolPop(v44);
                goto LABEL_64;
            }
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 0x16u);

            v11 = v78;
LABEL_61:

            objc_autoreleasePoolPop(v48);
LABEL_62:
            v29 = 0;
LABEL_63:

LABEL_64:
            if (v81 == ++v20)
            {
              v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
              if (!v81)
                goto LABEL_66;
              goto LABEL_25;
            }
          }
        }
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v11;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
LABEL_75:
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_opt_class();
          *(_DWORD *)v95 = 138543618;
          v96 = v56;
          v97 = 2112;
          v98 = v57;
          v58 = v57;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Unexpected value class: %@", v95, 0x16u);

        }
LABEL_76:

        objc_autoreleasePoolPop(v13);
        if (!a3)
          goto LABEL_93;
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_94:

        break;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_71;
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v11;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_75;
        goto LABEL_76;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_71;
        v13 = (void *)MEMORY[0x227676638]();
        v14 = v11;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_75;
        goto LABEL_76;
      default:
        goto LABEL_93;
    }
  }
  else
  {
    if (!a3)
      return 0;
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
    v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (BOOL)canAddConstraint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  HMDAccessorySetting *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HMDAccessorySetting *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessorySetting constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (!v8)
  {
    if (__isConstraintValid(self, v6, a4))
    {
      v13 = 1;
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a4;
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint, %@, with error: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Duplicate constraint: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (!a4)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 1);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
}

- (BOOL)canRemoveConstraint:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMDAccessorySetting *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetting constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Missing Constraint: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6;
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

- (id)counterpartConstraintFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDAccessorySetting *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessorySetting *v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __itemFromConstraint(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[HMDAccessorySetting constraints](self, "constraints", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          __itemFromConstraint(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && objc_msgSend(v5, "isEqual:", v12))
          {
            v18 = (void *)MEMORY[0x227676638]();
            v19 = self;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v28 = v21;
              v29 = 2112;
              v30 = v11;
              v31 = 2112;
              v32 = v4;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found counterpart constraint %@ for %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
            v13 = v11;

            goto LABEL_18;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_18:

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Can't decode constraint %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (id)constraintWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_constraints;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)inMemoryConstraintWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_inMemoryCachedConstraints;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
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

- (id)replicatedMissingConstraintsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessorySetting *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetting constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __missingElementsFromLeftNotInRight(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@found constraints that are not present returning, %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    __deepCopiedConstraints(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)mergeConstraintsFromOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessorySetting *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetting constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __missingElementsFromLeftNotInRight(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@found constraints that are not present adding, %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    __deepCopiedConstraints(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[HMDAccessorySetting addConstraint:](v8, "addConstraint:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)addConstraint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v5) & 1) == 0)
      -[NSMutableArray addObject:](self->_constraints, "addObject:", v5);
    if (-[NSMutableArray containsObject:](self->_inMemoryCachedConstraints, "containsObject:", v5))
      -[NSMutableArray removeObject:](self->_inMemoryCachedConstraints, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeConstraint:(id)a3
{
  id v4;
  NSMutableSet *inMemoryCachedConstraintRemovals;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_lock_lock_with_options();
    inMemoryCachedConstraintRemovals = self->_inMemoryCachedConstraintRemovals;
    objc_msgSend(v9, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(inMemoryCachedConstraintRemovals) = -[NSMutableSet containsObject:](inMemoryCachedConstraintRemovals, "containsObject:", v6);

    if ((_DWORD)inMemoryCachedConstraintRemovals)
    {
      v7 = self->_inMemoryCachedConstraintRemovals;
      objc_msgSend(v9, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v7, "removeObject:", v8);

    }
    if (-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v9))
      -[NSMutableArray removeObject:](self->_constraints, "removeObject:", v9);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v9;
  }

}

- (void)addConstraintsInMemory:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v9, (_QWORD)v10) & 1) == 0
          && (-[NSMutableArray containsObject:](self->_inMemoryCachedConstraints, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_inMemoryCachedConstraints, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeConstraintsInMemory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableSet *inMemoryCachedConstraintRemovals;
  void *v10;
  NSMutableSet *v11;
  void *v12;
  NSMutableSet *v13;
  void *v14;
  NSMutableSet *v15;
  void *v16;
  os_unfair_lock_t lock;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v8, lock))
        {
          inMemoryCachedConstraintRemovals = self->_inMemoryCachedConstraintRemovals;
          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(inMemoryCachedConstraintRemovals) = -[NSMutableSet containsObject:](inMemoryCachedConstraintRemovals, "containsObject:", v10);

          if ((inMemoryCachedConstraintRemovals & 1) == 0)
          {
            v11 = self->_inMemoryCachedConstraintRemovals;
            objc_msgSend(v8, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v11, "addObject:", v12);

          }
        }
        if (-[NSMutableArray containsObject:](self->_inMemoryCachedConstraints, "containsObject:", v8))
        {
          v13 = self->_inMemoryCachedConstraintRemovals;
          objc_msgSend(v8, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = -[NSMutableSet containsObject:](v13, "containsObject:", v14);

          if ((v13 & 1) == 0)
          {
            -[NSMutableArray removeObject:](self->_inMemoryCachedConstraints, "removeObject:", v8);
            v15 = self->_inMemoryCachedConstraintRemovals;
            objc_msgSend(v8, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v15, "addObject:", v16);

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_mergeConstraintsLocallyWithAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[HMDAccessorySetting removeConstraint:](self, "removeConstraint:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[HMDAccessorySetting addConstraint:](self, "addConstraint:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)isConstraintMergeStrategyReflection
{
  void *v2;
  char v3;

  -[HMDAccessorySetting name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("alarms"));

  return v3;
}

- (BOOL)isCollectionType
{
  return -[HMDAccessorySetting type](self, "type") == 5;
}

- (id)modelsForConstraintsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessorySetting *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAccessorySetting *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  HMDAccessorySettingConstraintModel *v26;
  void *v27;
  void *v28;
  HMDAccessorySettingConstraintModel *v29;
  void *v30;
  void *v31;
  HMDAccessorySetting *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessorySetting isConstraintMergeStrategyReflection](self, "isConstraintMergeStrategyReflection"))
  {
    -[HMDAccessorySetting _modelsForMergeStrategyConstraintsUpdate:](self, "_modelsForMergeStrategyConstraintsUpdate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v10;
      v59 = 2112;
      v60 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updating constraints: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x24BDBCF20];
    -[HMDAccessorySetting constraints](v8, "constraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v4;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    v44 = (void *)v14;
    v16 = (void *)MEMORY[0x227676638](objc_msgSend(v15, "minusSet:", v14));
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v19;
      v59 = 2112;
      v60 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing constraints: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v52 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v26 = [HMDAccessorySettingConstraintModel alloc];
          objc_msgSend(v25, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessorySetting identifier](v17, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v26, "initWithObjectChangeType:uuid:parentUUID:", 3, v27, v28);

          objc_msgSend(v6, "addObject:", v29);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v22);
    }

    v30 = (void *)objc_msgSend(v44, "mutableCopy");
    v31 = (void *)MEMORY[0x227676638](objc_msgSend(v30, "minusSet:", v46));
    v32 = v17;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v34;
      v59 = 2112;
      v60 = v30;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Adding constraints: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v35 = v30;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          -[HMDAccessorySetting identifier](v32, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "modelWithParentIdentifier:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "setObjectChangeType:", 1);
          objc_msgSend(v6, "addObject:", v42);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v37);
    }

    v5 = (void *)objc_msgSend(v6, "copy");
    v4 = v45;
  }

  return v5;
}

- (id)value
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setValue:(id)a3
{
  os_unfair_lock_s *p_lock;
  id *p_value;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_value = &self->_value;
  if ((HMFEqualObjects() & 1) == 0)
    objc_storeStrong(p_value, a3);
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)shouldBlockSettingUpdateFromVersion:(id)a3 isMultiUserEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v12;
  HMDAccessorySetting *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("6.0"));
  -[HMDAccessorySetting keyPath](self, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("root.siri.language"));
  if (!v6 || !v9 || objc_msgSend(v6, "compare:", v7) != -1)
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }

  if (!v4)
    goto LABEL_5;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v15;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Settings update blocked due to attempting language setting update with homekit version: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)shouldTurnOffPersonalRequestsOnLanguageChangeTo:(id)a3 supportedMultiUserLanguageCodes:(id)a4 isMultiUserEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  HMDAccessorySetting *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  HMDAccessorySetting *v34;
  NSObject *v35;
  void *v36;
  HMDAccessorySetting *v37;
  void *v38;
  void *context;
  NSObject *log;
  os_log_t loga;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v5 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDAccessorySetting value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[HMDAccessorySetting keyPath](self, "keyPath"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", CFSTR("root.siri.language")),
        v11,
        v12))
  {
    v13 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = v15;
    v17 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    v20 = v19;
    v44 = v16;
    objc_msgSend(v16, "title");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject componentsSeparatedByString:](v21, "componentsSeparatedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v23;
    if ((unint64_t)objc_msgSend(v23, "count") < 4)
    {
      v32 = v24;
      v33 = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        loga = v21;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize selected language.", buf, 0xCu);

        v21 = loga;
      }

      objc_autoreleasePoolPop(v33);
      v31 = 0;
      v24 = v32;
    }
    else
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "containsObject:", v25))
      {
        v43 = v24;
        if ((unint64_t)objc_msgSend(v24, "count") >= 4
          && (objc_msgSend(v24, "objectAtIndexedSubscript:", 0),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v9, "containsObject:", v26),
              v26,
              v27))
        {
          context = (void *)MEMORY[0x227676638]();
          v28 = self;
          HMFGetOSLogHandle();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v47 = v29;
            v48 = 2112;
            v49 = v25;
            v50 = 2112;
            v51 = v30;
            _os_log_impl(&dword_2218F0000, log, OS_LOG_TYPE_INFO, "%{public}@Language changing from %@ to %@ and both are supported.", buf, 0x20u);

          }
          v31 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v37 = self;
          HMFGetOSLogHandle();
          v31 = 1;
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v38;
            v48 = 2112;
            v49 = v25;
            _os_log_impl(&dword_2218F0000, log, OS_LOG_TYPE_INFO, "%{public}@Found recognition language %@ in supported languages need to turn off personal requests.", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(context);
        v24 = v43;
      }
      else
      {
        v31 = 0;
      }

    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (unint64_t)configurationVersion
{
  os_unfair_lock_s *p_lock;
  unint64_t configurationVersion;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configurationVersion = self->_configurationVersion;
  os_unfair_lock_unlock(p_lock);
  return configurationVersion;
}

- (void)setConfigurationVersion:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_configurationVersion < a3)
    self->_configurationVersion = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessorySetting identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_modelsForMergeStrategyConstraintsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessorySetting *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  HMDAccessorySettingConstraintModel *v21;
  void *v22;
  HMDAccessorySettingConstraintModel *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAccessorySetting *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  HMDAccessorySetting *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  HMDAccessorySetting *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetting constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __missingElementsFromLeftNotInRight(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v4;
  v46 = v5;
  v44 = v7;
  if ((objc_msgSend(v7, "hmf_isEmpty") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v11;
      v53 = 2112;
      v54 = v7;
      v55 = 2112;
      v56 = v9;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@will remove %@ from %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessorySetting identifier](v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v21 = [HMDAccessorySettingConstraintModel alloc];
          objc_msgSend(v20, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v21, "initWithObjectChangeType:uuid:parentUUID:", 3, v22, v12);

          objc_msgSend(v14, "addObject:", v23);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
      }
      while (v17);
    }

    v5 = v46;
    objc_msgSend(v46, "addObjectsFromArray:", v14);

    v7 = v44;
  }
  -[HMDAccessorySetting constraints](self, "constraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  __missingElementsFromLeftNotInRight(v4, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v25, "hmf_isEmpty") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v29;
      v53 = 2112;
      v54 = v25;
      v55 = 2112;
      v56 = v27;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@will add %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMDAccessorySetting identifier](v27, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    __deepCopiedConstraints(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "modelWithParentIdentifier:", v30);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObjectChangeType:", 1);
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
      }
      while (v35);
    }

    v5 = v46;
    objc_msgSend(v46, "addObjectsFromArray:", v32);

    v7 = v44;
    v4 = v45;
  }
  if (objc_msgSend(v5, "count"))
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v42;
      v53 = 2112;
      v54 = v5;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEBUG, "%{public}@fixing up accessory constraints %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
  }

  return v5;
}

- (HMDAccessorySetting)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySetting *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDAccessorySetting *)-[HMDAccessorySetting _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAccessorySetting *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id value;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4E20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4E28]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccessorySetting initWithIdentifier:name:](self, "initWithIdentifier:name:", v5, v6);
  if (v7)
  {
    v7->_type = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD4E60]);
    v7->_properties = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD4E30]);
    objc_msgSend((id)objc_opt_class(), "supportedConstraintClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, *MEMORY[0x24BDD4DF8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "supportedConstraintClasses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HM.constraintsV1"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v10, "addObjectsFromArray:", v12);
      objc_storeStrong((id *)&v7->_constraints, v10);

    }
    objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, *MEMORY[0x24BDD4E88]);
    v14 = objc_claimAutoreleasedReturnValue();
    value = v7->_value;
    v7->_value = (id)v14;

    v7->_configurationVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.version"));
  }

  return v7;
}

- (id)constraintsForCodingXPC
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__235063;
  v16 = __Block_byref_object_dispose__235064;
  v17 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_constraints, "copy");
  v5 = (void *)-[NSMutableArray copy](self->_inMemoryCachedConstraints, "copy");
  v6 = -[NSMutableSet copy](self->_inMemoryCachedConstraintRemovals, "copy");
  v7 = (void *)v13[5];
  v13[5] = v6;

  os_unfair_lock_unlock(p_lock);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__HMDAccessorySetting_constraintsForCodingXPC__block_invoke;
  v11[3] = &unk_24E7980B0;
  v11[4] = &v12;
  objc_msgSend(v4, "hmf_objectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDAccessorySetting _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  uint64_t Type;
  char v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v6 = objc_msgSend(v4, "hmd_isForRemoteTransport");
  -[HMDAccessorySetting identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD4E20]);

  v8 = -[HMDAccessorySetting properties](self, "properties");
  objc_msgSend(v4, "encodeInteger:forKey:", v8, *MEMORY[0x24BDD4E30]);
  -[HMDAccessorySetting name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x24BDD4E28]);

  -[HMDAccessorySetting value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, *MEMORY[0x24BDD4E88]);

  if ((v6 & 1) == 0)
  {
    if ((v5 & 1) != 0)
      -[HMDAccessorySetting constraintsForCodingXPC](self, "constraintsForCodingXPC");
    else
      -[HMDAccessorySetting constraints](self, "constraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v24, *MEMORY[0x24BDD4DF8]);

    if ((v5 & 1) != 0)
      goto LABEL_21;
LABEL_20:
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAccessorySetting configurationVersion](self, "configurationVersion"), CFSTR("HM.version"));
    goto LABEL_21;
  }
  v27 = v5;
  v28 = v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HMDAccessorySetting constraints](self, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          v21 = v12;
        else
          v21 = v11;
        objc_msgSend(v21, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(v11, "copy");
  v4 = v28;
  objc_msgSend(v28, "encodeObject:forKey:", v22, *MEMORY[0x24BDD4DF8]);

  if (objc_msgSend(v12, "count"))
  {
    v23 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v28, "encodeObject:forKey:", v23, CFSTR("HM.constraintsV1"));

  }
  v5 = v27;
  if ((v27 & 1) == 0)
    goto LABEL_20;
LABEL_21:
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v25 = -[HMDAccessorySetting isReflected](self, "isReflected");
    objc_msgSend(v4, "encodeBool:forKey:", v25, *MEMORY[0x24BDD4E48]);
  }
  if ((v5 & 1) != 0)
    Type = -[HMDAccessorySetting type](self, "type");
  else
    Type = __getType((os_unfair_lock_s *)self);
  objc_msgSend(v4, "encodeInteger:forKey:", Type, *MEMORY[0x24BDD4E60]);

}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (BOOL)isReflected
{
  return self->_reflected;
}

- (void)setReflected:(BOOL)a3
{
  self->_reflected = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (HMDAccessorySettingModel)model
{
  return (HMDAccessorySettingModel *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)models
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_inMemoryCachedConstraints, 0);
  objc_storeStrong((id *)&self->_inMemoryCachedConstraintRemovals, 0);
}

uint64_t __46__HMDAccessorySetting_constraintsForCodingXPC__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

+ (id)decodedValue:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = a3;
  +[HMDAccessorySetting supportedValueClasses](HMDAccessorySetting, "supportedValueClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t58 != -1)
    dispatch_once(&logCategory__hmf_once_t58, &__block_literal_global_235146);
  return (id)logCategory__hmf_once_v59;
}

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken != -1)
    dispatch_once(&supportedValueClasses_onceToken, &__block_literal_global_37_235145);
  return (id)supportedValueClasses_supportedValueClasses;
}

+ (id)supportedConstraintClasses
{
  if (supportedConstraintClasses_onceToken != -1)
    dispatch_once(&supportedConstraintClasses_onceToken, &__block_literal_global_41_235143);
  return (id)supportedConstraintClasses_supportedConstraintClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__HMDAccessorySetting_supportedConstraintClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedConstraintClasses_supportedConstraintClasses;
  supportedConstraintClasses_supportedConstraintClasses = v2;

}

void __44__HMDAccessorySetting_supportedValueClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedValueClasses_supportedValueClasses;
  supportedValueClasses_supportedValueClasses = v2;

}

void __34__HMDAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v59;
  logCategory__hmf_once_v59 = v0;

}

@end
