@implementation HAPAccessoryReachabilityProfile

- (HAPAccessoryReachabilityProfile)init
{
  HAPAccessoryReachabilityProfile *v2;
  HAPAccessoryReachabilityProfile *v3;
  HAPAccessoryReachabilityProfile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAPAccessoryReachabilityProfile;
  v2 = -[HAPAccessoryReachabilityProfile init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (HAPAccessoryReachabilityProfile)initWithProfile:(id)a3
{
  id v4;
  HAPAccessoryReachabilityProfile *v5;
  double v6;
  uint64_t v7;
  HAPCharacteristic *pollCharacteristic;
  uint64_t v9;
  HAPCharacteristic *sleepIntervalCharacteristic;
  HAPAccessoryReachabilityProfile *v11;

  v4 = a3;
  v5 = -[HAPAccessoryReachabilityProfile init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "sleepInterval");
    v5->_sleepInterval = v6;
    objc_msgSend(v4, "pollCharacteristic");
    v7 = objc_claimAutoreleasedReturnValue();
    pollCharacteristic = v5->_pollCharacteristic;
    v5->_pollCharacteristic = (HAPCharacteristic *)v7;

    objc_msgSend(v4, "sleepIntervalCharacteristic");
    v9 = objc_claimAutoreleasedReturnValue();
    sleepIntervalCharacteristic = v5->_sleepIntervalCharacteristic;
    v5->_sleepIntervalCharacteristic = (HAPCharacteristic *)v9;

    v11 = v5;
  }

  return v5;
}

- (HAPAccessoryReachabilityProfile)initWithDiscoveredServices:(id)a3
{
  id v4;
  HAPAccessoryReachabilityProfile *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  HAPAccessoryReachabilityProfile *v28;
  HAPAccessoryReachabilityProfile *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HAPAccessoryReachabilityProfile init](self, "init");
  if (v5)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("00000239-0000-1000-8000-0026BB765291"));

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (!v14)
        goto LABEL_29;
      v31 = v14;
      v32 = v4;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v14, "characteristics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v20, "type");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("0000023A-0000-1000-8000-0026BB765291"));

            if (v22)
            {
              objc_msgSend(v20, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v20, "value");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v20, "value");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v25 = 0;
                }

                objc_msgSend((id)objc_opt_class(), "timeIntervalFromMillisecondNumberValue:", v25);
                -[HAPAccessoryReachabilityProfile setSleepInterval:](v5, "setSleepInterval:");

              }
              -[HAPAccessoryReachabilityProfile setSleepIntervalCharacteristic:](v5, "setSleepIntervalCharacteristic:", v20);
            }
            else
            {
              objc_msgSend(v20, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("0000023C-0000-1000-8000-0026BB765291"));

              if (v27)
                -[HAPAccessoryReachabilityProfile setPollCharacteristic:](v5, "setPollCharacteristic:", v20);
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v17);
      }

      v28 = v5;
      v4 = v32;
    }
    else
    {
LABEL_10:

LABEL_29:
      v29 = v5;
    }
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  double sleepInterval;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HAPAccessoryReachabilityProfile;
  -[HMFObject description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  sleepInterval = self->_sleepInterval;
  -[HAPCharacteristic instanceID](self->_sleepIntervalCharacteristic, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic instanceID](self->_pollCharacteristic, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ sleepInterval=%f sleepIntervalChar=%@ pollChar=%@"), v3, *(_QWORD *)&sleepInterval, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPAccessoryReachabilityProfile sleepInterval](self, "sleepInterval");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Sleep Interval"), v5);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPAccessoryReachabilityProfile sleepIntervalCharacteristic](self, "sleepIntervalCharacteristic", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Sleep Interval Characteristic"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPAccessoryReachabilityProfile pollCharacteristic](self, "pollCharacteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Poll Characteristic"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAPAccessoryReachabilityProfile initWithProfile:](+[HAPAccessoryReachabilityProfile allocWithZone:](HAPAccessoryReachabilityProfile, "allocWithZone:", a3), "initWithProfile:", self);
}

- (double)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(double)a3
{
  self->_sleepInterval = a3;
}

- (HAPCharacteristic)sleepIntervalCharacteristic
{
  return self->_sleepIntervalCharacteristic;
}

- (void)setSleepIntervalCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_sleepIntervalCharacteristic, a3);
}

- (HAPCharacteristic)pollCharacteristic
{
  return self->_pollCharacteristic;
}

- (void)setPollCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_pollCharacteristic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollCharacteristic, 0);
  objc_storeStrong((id *)&self->_sleepIntervalCharacteristic, 0);
}

+ (double)timeIntervalFromMillisecondNumberValue:(id)a3
{
  return (double)(unint64_t)objc_msgSend(a3, "unsignedIntegerValue") / 1000.0;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
