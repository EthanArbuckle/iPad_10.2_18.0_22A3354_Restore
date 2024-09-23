@implementation HMFVersion

- (NSString)versionString
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v3 = -[HMFVersion updateVersion](self, "updateVersion");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[HMFVersion majorVersion](self, "majorVersion");
  v6 = -[HMFVersion minorVersion](self, "minorVersion");
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%tu.%tu.%tu"), v5, v6, -[HMFVersion updateVersion](self, "updateVersion"));
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%tu.%tu"), v5, v6, v8);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)compare:(id)a3
{
  HMFVersion *v4;
  HMFVersion *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v13;

  v4 = (HMFVersion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 0;
    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_10;
  v6 = -[HMFVersion majorVersion](self, "majorVersion");
  if (v6 > -[HMFVersion majorVersion](v5, "majorVersion"))
    goto LABEL_10;
  v7 = -[HMFVersion majorVersion](self, "majorVersion");
  if (v7 < -[HMFVersion majorVersion](v5, "majorVersion"))
  {
LABEL_7:
    v10 = -1;
    goto LABEL_11;
  }
  v8 = -[HMFVersion minorVersion](self, "minorVersion");
  if (v8 > -[HMFVersion minorVersion](v5, "minorVersion"))
    goto LABEL_10;
  v9 = -[HMFVersion minorVersion](self, "minorVersion");
  if (v9 < -[HMFVersion minorVersion](v5, "minorVersion"))
    goto LABEL_7;
  v11 = -[HMFVersion updateVersion](self, "updateVersion");
  if (v11 > -[HMFVersion updateVersion](v5, "updateVersion"))
  {
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  v13 = -[HMFVersion updateVersion](self, "updateVersion");
  if (v13 >= -[HMFVersion updateVersion](v5, "updateVersion"))
    v10 = 0;
  else
    v10 = -1;
LABEL_11:

  return v10;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (HMFVersion)initWithVersionString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HMFVersion *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?.*$"), 0, &v30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v30;
    if (v5)
    {
      objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "numberOfRanges"))
        {
          v9 = objc_msgSend(v8, "rangeAtIndex:", 1);
          objc_msgSend(v4, "substringWithRange:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v8, "numberOfRanges") >= 4
            && (v12 = objc_msgSend(v8, "rangeAtIndex:", 3), v13))
          {
            objc_msgSend(v4, "substringWithRange:", v12, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = 0;
          }
          if ((unint64_t)objc_msgSend(v8, "numberOfRanges") >= 6
            && (v22 = objc_msgSend(v8, "rangeAtIndex:", 5), v23))
          {
            objc_msgSend(v4, "substringWithRange:", v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }
          self = -[HMFVersion initWithMajorVersion:minorVersion:updateVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v11, "integerValue", v6), objc_msgSend(v14, "integerValue"), objc_msgSend(v24, "integerValue"));

          v15 = self;
          v6 = v29;
        }
        else
        {
          v25 = (void *)MEMORY[0x1A1AC355C]();
          self = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier(self);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v27;
            v33 = 2112;
            v34 = v4;
            _os_log_impl(&dword_19B546000, v26, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          v15 = 0;
        }

      }
      else
      {
        v19 = (void *)MEMORY[0x1A1AC355C]();
        self = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(self);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v21;
          v33 = 2112;
          v34 = v4;
          _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        v15 = 0;
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC355C]();
      self = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create version string regex with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (HMFVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5
{
  HMFVersion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMFVersion;
  result = -[HMFVersion init](&v9, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_updateVersion = a5;
  }
  return result;
}

- (BOOL)isEqualToVersion:(id)a3
{
  return -[HMFVersion compare:](self, "compare:", a3) == 0;
}

- (HMFVersion)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HMFVersion majorVersion](self, "majorVersion");
  v4 = (-[HMFVersion minorVersion](self, "minorVersion") << 16) ^ (v3 << 48);
  return v4 ^ -[HMFVersion updateVersion](self, "updateVersion");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    v7 = -[HMFVersion isEqualToVersion:](self, "isEqualToVersion:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isAtLeastVersion:(id)a3
{
  return -[HMFVersion compare:](self, "compare:", a3) != -1;
}

- (BOOL)isGreaterThanVersion:(id)a3
{
  return -[HMFVersion compare:](self, "compare:", a3) == 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFVersion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.major"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.minor"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.update"));

  return -[HMFVersion initWithMajorVersion:minorVersion:updateVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion majorVersion](self, "majorVersion"), CFSTR("HM.major"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion minorVersion](self, "minorVersion"), CFSTR("HM.minor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFVersion updateVersion](self, "updateVersion"), CFSTR("HM.update"));

}

+ (id)logCategory
{
  if (_MergedGlobals_3_2 != -1)
    dispatch_once(&_MergedGlobals_3_2, &__block_literal_global_12);
  return (id)qword_1ED012EA8;
}

void __25__HMFVersion_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFVersion"), CFSTR("com.apple.HomeKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012EA8;
  qword_1ED012EA8 = v0;

}

@end
