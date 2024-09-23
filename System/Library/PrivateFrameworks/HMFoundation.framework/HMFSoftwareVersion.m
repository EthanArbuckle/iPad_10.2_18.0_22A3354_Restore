@implementation HMFSoftwareVersion

- (id)versionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  -[HMFSoftwareVersion buildVersion](self, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v10.receiver = self;
    v10.super_class = (Class)HMFSoftwareVersion;
    -[HMFVersion versionString](&v10, sel_versionString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFSoftwareVersion buildVersion](self, "buildVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFSoftwareVersion;
    -[HMFVersion versionString](&v9, sel_versionString);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

- (HMFSoftwareVersion)initWithVersionString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMFSoftwareVersion *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[HMFSoftwareVersion versionRegex](HMFSoftwareVersion, "versionRegex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "numberOfRanges"))
        {
          v8 = objc_msgSend(v7, "rangeAtIndex:", 1);
          objc_msgSend(v4, "substringWithRange:", v8, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 4
            && (v11 = objc_msgSend(v7, "rangeAtIndex:", 3), v12))
          {
            objc_msgSend(v4, "substringWithRange:", v11, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 6
            && (v18 = objc_msgSend(v7, "rangeAtIndex:", 5), v19))
          {
            objc_msgSend(v4, "substringWithRange:", v18, v19);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }
          if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 0xD
            && (v20 = objc_msgSend(v7, "rangeAtIndex:", 12), v21))
          {
            objc_msgSend(v4, "substringWithRange:", v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
          if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 0xB)
          {
            v23 = objc_msgSend(v7, "rangeAtIndex:", 10);
            if (v24)
            {
              objc_msgSend(v4, "substringWithRange:", v23, v24);
              v25 = objc_claimAutoreleasedReturnValue();

              v22 = (void *)v25;
            }
          }
          if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 9)
          {
            v26 = objc_msgSend(v7, "rangeAtIndex:", 8);
            if (v27)
            {
              objc_msgSend(v4, "substringWithRange:", v26, v27);
              v28 = objc_claimAutoreleasedReturnValue();

              v22 = (void *)v28;
            }
          }
          self = -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", objc_msgSend(v10, "integerValue", v6), objc_msgSend(v13, "integerValue"), objc_msgSend(v34, "integerValue"), v22);

          v14 = self;
          v6 = v33;
        }
        else
        {
          v29 = (void *)MEMORY[0x1A1AC355C]();
          self = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier(self);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v31;
            v37 = 2112;
            v38 = v4;
            _os_log_impl(&dword_19B546000, v30, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          v14 = 0;
        }

      }
      else
      {
        v15 = (void *)MEMORY[0x1A1AC355C]();
        self = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v17;
          v37 = 2112;
          v38 = v4;
          _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalid version string: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5 buildVersion:(id)a6
{
  id v10;
  HMFSoftwareVersion *v11;
  uint64_t v12;
  NSString *buildVersion;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMFSoftwareVersion;
  v11 = -[HMFVersion initWithMajorVersion:minorVersion:updateVersion:](&v15, sel_initWithMajorVersion_minorVersion_updateVersion_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    buildVersion = v11->_buildVersion;
    v11->_buildVersion = (NSString *)v12;

  }
  return v11;
}

+ (id)versionRegex
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(\\d+)(\\.(\\d+))?(\\.(\\d+))?((;(.*))|(\\s*\\((.*)\\))|(\\.(.*)))?.*$"),
    0,
    &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_ERROR, "%{public}@HMFSoftwareVersion: Failed to create version string regex with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMFSoftwareVersion;
  v5 = -[HMFVersion compare:](&v13, sel_compare_, v4);
  if (!v5)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    -[HMFSoftwareVersion buildVersion](self, "buildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v8, "buildVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[HMFSoftwareVersion buildVersion](self, "buildVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "buildVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v10, "compare:options:", v11, 65);

      }
      else
      {
        v5 = 0;
      }
    }

  }
  return (int64_t)v5;
}

- (HMFSoftwareVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 updateVersion:(unint64_t)a5
{
  return -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", a3, a4, a5, 0);
}

- (NSString)shortVersionString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFSoftwareVersion;
  -[HMFVersion versionString](&v3, sel_versionString);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValidVersionString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  +[HMFSoftwareVersion versionRegex](HMFSoftwareVersion, "versionRegex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)versionFromOperatingSystemVersion:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMajorVersion:minorVersion:updateVersion:", a3->var0, a3->var1, a3->var2);
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  retstr->var0 = -[HMFVersion majorVersion](self, "majorVersion");
  retstr->var1 = -[HMFVersion minorVersion](self, "minorVersion");
  result = -[HMFVersion updateVersion](self, "updateVersion");
  retstr->var2 = (int64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFSoftwareVersion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  HMFSoftwareVersion *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.major"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.minor"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.update"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.build"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMFSoftwareVersion;
  v4 = a3;
  -[HMFVersion encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMFSoftwareVersion buildVersion](self, "buildVersion", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.build"));

}

+ (id)logCategory
{
  if (qword_1ED012EB0 != -1)
    dispatch_once(&qword_1ED012EB0, &__block_literal_global_118);
  return (id)qword_1ED012EB8;
}

void __33__HMFSoftwareVersion_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFSoftwareVersion"), CFSTR("com.apple.HomeKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012EB8;
  qword_1ED012EB8 = v0;

}

@end
