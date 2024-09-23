@implementation UARPUpdateFirmwareAnalyticsEventFrameworkParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)initWithCoder:(id)a3
{
  id v4;
  UARPUpdateFirmwareAnalyticsEventFrameworkParams *v5;
  uint64_t v6;
  NSNumber *stagingUserInitiated;
  uint64_t v8;
  NSNumber *stagingDuration;
  uint64_t v10;
  NSNumber *stagingIterations;
  uint64_t v12;
  NSNumber *stagingStatus;
  uint64_t v14;
  NSNumber *stagingVendorError;
  uint64_t v16;
  NSNumber *applyUserInitiated;
  uint64_t v18;
  NSNumber *applyDuration;
  uint64_t v20;
  NSNumber *applyStatus;
  uint64_t v22;
  NSNumber *applyVendorError;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UARPUpdateFirmwareAnalyticsEventFrameworkParams;
  v5 = -[UARPUpdateFirmwareAnalyticsEventFrameworkParams init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingUserInitiated"));
    v6 = objc_claimAutoreleasedReturnValue();
    stagingUserInitiated = v5->_stagingUserInitiated;
    v5->_stagingUserInitiated = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingDuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    stagingDuration = v5->_stagingDuration;
    v5->_stagingDuration = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingIterations"));
    v10 = objc_claimAutoreleasedReturnValue();
    stagingIterations = v5->_stagingIterations;
    v5->_stagingIterations = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingStatus"));
    v12 = objc_claimAutoreleasedReturnValue();
    stagingStatus = v5->_stagingStatus;
    v5->_stagingStatus = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagingVendorError"));
    v14 = objc_claimAutoreleasedReturnValue();
    stagingVendorError = v5->_stagingVendorError;
    v5->_stagingVendorError = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyUserInitiated"));
    v16 = objc_claimAutoreleasedReturnValue();
    applyUserInitiated = v5->_applyUserInitiated;
    v5->_applyUserInitiated = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyDuration"));
    v18 = objc_claimAutoreleasedReturnValue();
    applyDuration = v5->_applyDuration;
    v5->_applyDuration = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyStatus"));
    v20 = objc_claimAutoreleasedReturnValue();
    applyStatus = v5->_applyStatus;
    v5->_applyStatus = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyVendorError"));
    v22 = objc_claimAutoreleasedReturnValue();
    applyVendorError = v5->_applyVendorError;
    v5->_applyVendorError = (NSNumber *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *stagingUserInitiated;
  id v5;

  stagingUserInitiated = self->_stagingUserInitiated;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stagingUserInitiated, CFSTR("stagingUserInitiated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stagingDuration, CFSTR("stagingDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stagingIterations, CFSTR("stagingIterations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stagingStatus, CFSTR("stagingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stagingVendorError, CFSTR("stagingVendorError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyUserInitiated, CFSTR("applyUserInitiated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyDuration, CFSTR("applyDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyStatus, CFSTR("applyStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyVendorError, CFSTR("applyVendorError"));

}

- (BOOL)isEqual:(id)a3
{
  UARPUpdateFirmwareAnalyticsEventFrameworkParams *v4;
  UARPUpdateFirmwareAnalyticsEventFrameworkParams *v5;
  NSNumber *stagingUserInitiated;
  void *v7;
  NSNumber *stagingDuration;
  void *v9;
  NSNumber *stagingIterations;
  void *v11;
  NSNumber *stagingStatus;
  void *v13;
  NSNumber *stagingVendorError;
  void *v15;
  NSNumber *applyUserInitiated;
  void *v17;
  NSNumber *applyDuration;
  uint64_t v19;
  NSNumber *v20;
  void *v21;
  NSNumber *applyStatus;
  NSNumber *applyVendorError;
  void *v24;
  char v25;
  void *v27;
  void *v28;

  v4 = (UARPUpdateFirmwareAnalyticsEventFrameworkParams *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v25 = 1;
    }
    else
    {
      v5 = v4;
      stagingUserInitiated = self->_stagingUserInitiated;
      -[UARPUpdateFirmwareAnalyticsEventFrameworkParams stagingUserInitiated](v5, "stagingUserInitiated");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (nullableObjectsEqual(stagingUserInitiated, (uint64_t)v7))
      {
        stagingDuration = self->_stagingDuration;
        -[UARPUpdateFirmwareAnalyticsEventFrameworkParams stagingDuration](v5, "stagingDuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (nullableObjectsEqual(stagingDuration, (uint64_t)v9))
        {
          stagingIterations = self->_stagingIterations;
          -[UARPUpdateFirmwareAnalyticsEventFrameworkParams stagingIterations](v5, "stagingIterations");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (nullableObjectsEqual(stagingIterations, (uint64_t)v11))
          {
            stagingStatus = self->_stagingStatus;
            -[UARPUpdateFirmwareAnalyticsEventFrameworkParams stagingStatus](v5, "stagingStatus");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (nullableObjectsEqual(stagingStatus, (uint64_t)v13))
            {
              stagingVendorError = self->_stagingVendorError;
              -[UARPUpdateFirmwareAnalyticsEventFrameworkParams stagingVendorError](v5, "stagingVendorError");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (nullableObjectsEqual(stagingVendorError, (uint64_t)v15))
              {
                applyUserInitiated = self->_applyUserInitiated;
                -[UARPUpdateFirmwareAnalyticsEventFrameworkParams applyUserInitiated](v5, "applyUserInitiated");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (nullableObjectsEqual(applyUserInitiated, (uint64_t)v17))
                {
                  applyDuration = self->_applyDuration;
                  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams applyDuration](v5, "applyDuration");
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = applyDuration;
                  v21 = (void *)v19;
                  if (nullableObjectsEqual(v20, v19))
                  {
                    v28 = v21;
                    applyStatus = self->_applyStatus;
                    -[UARPUpdateFirmwareAnalyticsEventFrameworkParams applyStatus](v5, "applyStatus");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (nullableObjectsEqual(applyStatus, (uint64_t)v27))
                    {
                      applyVendorError = self->_applyVendorError;
                      -[UARPUpdateFirmwareAnalyticsEventFrameworkParams applyVendorError](v5, "applyVendorError", v27);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = nullableObjectsEqual(applyVendorError, (uint64_t)v24);

                    }
                    else
                    {
                      v25 = 0;
                    }
                    v21 = v28;

                  }
                  else
                  {
                    v25 = 0;
                  }

                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSNumber *stagingUserInitiated;
  const char *v8;
  NSNumber *stagingDuration;
  NSNumber *stagingIterations;
  NSNumber *stagingStatus;
  NSNumber *stagingVendorError;
  NSNumber *applyUserInitiated;
  const char *v14;
  NSNumber *applyDuration;
  NSNumber *applyStatus;
  NSNumber *applyVendorError;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n{\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  stagingUserInitiated = self->_stagingUserInitiated;
  if (stagingUserInitiated)
  {
    if (-[NSNumber BOOLValue](stagingUserInitiated, "BOOLValue"))
      v8 = "YES";
    else
      v8 = "NO";
    objc_msgSend(v6, "appendFormat:", CFSTR("\tStaging user initiated: %s\n"), v8);
  }
  stagingDuration = self->_stagingDuration;
  if (stagingDuration)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tStaging duration: %lus\n"), -[NSNumber unsignedIntegerValue](stagingDuration, "unsignedIntegerValue"));
  stagingIterations = self->_stagingIterations;
  if (stagingIterations)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tStaging iterations: %lu\n"), -[NSNumber unsignedIntegerValue](stagingIterations, "unsignedIntegerValue"));
  stagingStatus = self->_stagingStatus;
  if (stagingStatus)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tStaging status: %s\n"), UARPAnalyticsStagingStatusToString(-[NSNumber integerValue](stagingStatus, "integerValue")));
  stagingVendorError = self->_stagingVendorError;
  if (stagingVendorError)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tStaging vendor error: %u\n"), -[NSNumber unsignedIntValue](stagingVendorError, "unsignedIntValue"));
  applyUserInitiated = self->_applyUserInitiated;
  if (applyUserInitiated)
  {
    if (-[NSNumber BOOLValue](applyUserInitiated, "BOOLValue"))
      v14 = "YES";
    else
      v14 = "NO";
    objc_msgSend(v6, "appendFormat:", CFSTR("\tApply user initiated: %s\n"), v14);
  }
  applyDuration = self->_applyDuration;
  if (applyDuration)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tApply duration: %lus\n"), -[NSNumber unsignedIntegerValue](applyDuration, "unsignedIntegerValue"));
  applyStatus = self->_applyStatus;
  if (applyStatus)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tApply status: %s\n"), UARPAnalyticsApplyStatusToString(-[NSNumber integerValue](applyStatus, "integerValue")));
  applyVendorError = self->_applyVendorError;
  if (applyVendorError)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tApply vendor error: %u\n"), -[NSNumber unsignedIntValue](applyVendorError, "unsignedIntValue"));
  objc_msgSend(v6, "appendString:", CFSTR("}"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSNumber)stagingUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStagingUserInitiated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)stagingDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStagingDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)stagingIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStagingIterations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)stagingStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStagingStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)stagingVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStagingVendorError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)applyUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplyUserInitiated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)applyDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplyDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)applyStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplyStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)applyVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setApplyVendorError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyVendorError, 0);
  objc_storeStrong((id *)&self->_applyStatus, 0);
  objc_storeStrong((id *)&self->_applyDuration, 0);
  objc_storeStrong((id *)&self->_applyUserInitiated, 0);
  objc_storeStrong((id *)&self->_stagingVendorError, 0);
  objc_storeStrong((id *)&self->_stagingStatus, 0);
  objc_storeStrong((id *)&self->_stagingIterations, 0);
  objc_storeStrong((id *)&self->_stagingDuration, 0);
  objc_storeStrong((id *)&self->_stagingUserInitiated, 0);
}

@end
