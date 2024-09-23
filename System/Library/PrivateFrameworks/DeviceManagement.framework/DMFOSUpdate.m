@implementation DMFOSUpdate

- (DMFOSUpdate)initWithProductKey:(id)a3 humanReadableName:(id)a4 productName:(id)a5 version:(id)a6 build:(id)a7 downloadSize:(unint64_t)a8 installSize:(unint64_t)a9 isCritical:(BOOL)a10 restartRequired:(BOOL)a11 allowsInstallLater:(BOOL)a12 isSplat:(BOOL)a13 supplementalBuild:(id)a14 supplementalVersionExtra:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  DMFOSUpdate *v26;
  uint64_t v27;
  NSString *productKey;
  uint64_t v29;
  NSString *humanReadableName;
  uint64_t v31;
  NSString *productName;
  uint64_t v33;
  NSString *version;
  uint64_t v35;
  NSString *build;
  uint64_t v37;
  NSString *supplementalBuild;
  uint64_t v39;
  NSString *supplementalVersionExtra;
  id v42;
  id v43;
  objc_super v44;

  v43 = a3;
  v42 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a14;
  v25 = a15;
  v44.receiver = self;
  v44.super_class = (Class)DMFOSUpdate;
  v26 = -[DMFOSUpdate init](&v44, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v43, "copy");
    productKey = v26->_productKey;
    v26->_productKey = (NSString *)v27;

    v29 = objc_msgSend(v42, "copy");
    humanReadableName = v26->_humanReadableName;
    v26->_humanReadableName = (NSString *)v29;

    v31 = objc_msgSend(v21, "copy");
    productName = v26->_productName;
    v26->_productName = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    version = v26->_version;
    v26->_version = (NSString *)v33;

    v35 = objc_msgSend(v23, "copy");
    build = v26->_build;
    v26->_build = (NSString *)v35;

    v26->_downloadSize = a8;
    v26->_installSize = a9;
    v26->_isCritical = a10;
    v26->_restartRequired = a11;
    v26->_allowsInstallLater = a12;
    v26->_isSplat = a13;
    v37 = objc_msgSend(v24, "copy");
    supplementalBuild = v26->_supplementalBuild;
    v26->_supplementalBuild = (NSString *)v37;

    v39 = objc_msgSend(v25, "copy");
    supplementalVersionExtra = v26->_supplementalVersionExtra;
    v26->_supplementalVersionExtra = (NSString *)v39;

  }
  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = objc_alloc((Class)objc_opt_class());
  -[DMFOSUpdate productKey](self, "productKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate humanReadableName](self, "humanReadableName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate productName](self, "productName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DMFOSUpdate downloadSize](self, "downloadSize");
  v7 = -[DMFOSUpdate installSize](self, "installSize");
  v8 = -[DMFOSUpdate isCritical](self, "isCritical");
  v9 = -[DMFOSUpdate restartRequired](self, "restartRequired");
  v10 = -[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater");
  v11 = -[DMFOSUpdate isSplat](self, "isSplat");
  -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v16) = v11;
  BYTE2(v16) = v10;
  BYTE1(v16) = v9;
  LOBYTE(v16) = v8;
  v14 = (void *)objc_msgSend(v20, "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:", v19, v18, v4, v5, v6, v17, v7, v16, v12, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFOSUpdate)initWithCoder:(id)a3
{
  id v4;
  DMFOSUpdate *v5;
  void *v6;
  uint64_t v7;
  NSString *productKey;
  void *v9;
  uint64_t v10;
  NSString *humanReadableName;
  void *v12;
  uint64_t v13;
  NSString *productName;
  void *v15;
  uint64_t v16;
  NSString *version;
  void *v18;
  uint64_t v19;
  NSString *build;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *supplementalBuild;
  void *v30;
  uint64_t v31;
  NSString *supplementalVersionExtra;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DMFOSUpdate;
  v5 = -[DMFOSUpdate init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("productKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("humanReadableName"));
    v10 = objc_claimAutoreleasedReturnValue();
    humanReadableName = v5->_humanReadableName;
    v5->_humanReadableName = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("productName"));
    v13 = objc_claimAutoreleasedReturnValue();
    productName = v5->_productName;
    v5->_productName = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("version"));
    v16 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("build"));
    v19 = objc_claimAutoreleasedReturnValue();
    build = v5->_build;
    v5->_build = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadSize"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downloadSize = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installSize = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCritical"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCritical = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restartRequired"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_restartRequired = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsInstallLater"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsInstallLater = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isSplat"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSplat = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("supplementalBuild"));
    v28 = objc_claimAutoreleasedReturnValue();
    supplementalBuild = v5->_supplementalBuild;
    v5->_supplementalBuild = (NSString *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("supplementalVersionExtra"));
    v31 = objc_claimAutoreleasedReturnValue();
    supplementalVersionExtra = v5->_supplementalVersionExtra;
    v5->_supplementalVersionExtra = (NSString *)v31;

  }
  return v5;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[DMFOSUpdate productKey](self, "productKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productKey"));

  -[DMFOSUpdate humanReadableName](self, "humanReadableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("humanReadableName"));

  -[DMFOSUpdate productName](self, "productName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productName"));

  -[DMFOSUpdate version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("version"));

  -[DMFOSUpdate build](self, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("build"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFOSUpdate downloadSize](self, "downloadSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("downloadSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFOSUpdate installSize](self, "installSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("installSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFOSUpdate isCritical](self, "isCritical"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("isCritical"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFOSUpdate restartRequired](self, "restartRequired"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("restartRequired"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("allowsInstallLater"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFOSUpdate isSplat](self, "isSplat"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("isSplat"));

  -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("supplementalBuild"));

  -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("supplementalVersionExtra"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;

  -[DMFOSUpdate productKey](self, "productKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMFOSUpdate humanReadableName](self, "humanReadableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DMFOSUpdate productName](self, "productName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DMFOSUpdate version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DMFOSUpdate build](self, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[DMFOSUpdate downloadSize](self, "downloadSize");
  v14 = v10 ^ v13 ^ -[DMFOSUpdate installSize](self, "installSize");
  v15 = -[DMFOSUpdate isCritical](self, "isCritical");
  v16 = v15 ^ -[DMFOSUpdate restartRequired](self, "restartRequired");
  v17 = v14 ^ v16 ^ -[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater");
  v18 = -[DMFOSUpdate isSplat](self, "isSplat");
  -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17 ^ v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  DMFOSUpdate *v4;
  DMFOSUpdate *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  BOOL v34;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  id v51;
  id v52;
  unint64_t v53;

  v4 = (DMFOSUpdate *)a3;
  if (self == v4)
  {
    v34 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFOSUpdate productKey](self, "productKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFOSUpdate productKey](v5, "productKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v34 = 0;
      }
      else
      {
        -[DMFOSUpdate humanReadableName](self, "humanReadableName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFOSUpdate humanReadableName](v5, "humanReadableName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if (v13 | v14
          && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
        {
          v34 = 0;
        }
        else
        {
          -[DMFOSUpdate productName](self, "productName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMFOSUpdate productName](v5, "productName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v16;
          v53 = v17;
          if (v18 | v53
            && (v19 = objc_msgSend((id)v18, "isEqual:", v53), (id)v53, (id)v18, !v19))
          {
            v34 = 0;
          }
          else
          {
            v50 = v18;
            -[DMFOSUpdate version](self, "version");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DMFOSUpdate version](v5, "version");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v20;
            v51 = v22;
            v52 = v21;
            if (__PAIR128__((unint64_t)v52, (unint64_t)v22) == 0
              || (v23 = objc_msgSend(v22, "isEqual:", v52), v52, v22, v23))
            {
              -[DMFOSUpdate build](self, "build");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[DMFOSUpdate build](v5, "build");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v24;
              v48 = v25;
              v49 = (void *)v26;
              if (v26 | v48
                && (v27 = objc_msgSend((id)v26, "isEqual:", v48), (id)v48, v49, !v27))
              {
                v34 = 0;
                v18 = v50;
                v22 = v51;
              }
              else
              {
                v28 = -[DMFOSUpdate downloadSize](self, "downloadSize");
                v22 = v51;
                if (v28 == -[DMFOSUpdate downloadSize](v5, "downloadSize")
                  && (v29 = -[DMFOSUpdate installSize](self, "installSize"),
                      v29 == -[DMFOSUpdate installSize](v5, "installSize"))
                  && (v30 = -[DMFOSUpdate isCritical](self, "isCritical"),
                      v30 == -[DMFOSUpdate isCritical](v5, "isCritical"))
                  && (v31 = -[DMFOSUpdate restartRequired](self, "restartRequired"),
                      v31 == -[DMFOSUpdate restartRequired](v5, "restartRequired"))
                  && (v32 = -[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater"),
                      v32 == -[DMFOSUpdate allowsInstallLater](v5, "allowsInstallLater"))
                  && (v33 = -[DMFOSUpdate isSplat](self, "isSplat"), v33 == -[DMFOSUpdate isSplat](v5, "isSplat")))
                {
                  -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DMFOSUpdate supplementalBuild](v5, "supplementalBuild");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = v36;
                  v39 = v37;
                  v47 = (void *)v39;
                  if (v38 | v39
                    && (v40 = (void *)v39,
                        v41 = objc_msgSend((id)v38, "isEqual:", v39),
                        v40,
                        (id)v38,
                        !v41))
                  {
                    v34 = 0;
                    v18 = v50;
                    v22 = v51;
                  }
                  else
                  {
                    -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra", v38, v47);
                    v42 = objc_claimAutoreleasedReturnValue();
                    -[DMFOSUpdate supplementalVersionExtra](v5, "supplementalVersionExtra");
                    v43 = objc_claimAutoreleasedReturnValue();
                    if (v42 | v43)
                    {
                      v44 = v43;
                      v45 = objc_msgSend((id)v42, "isEqual:", v43);
                      v43 = v44;
                      v34 = v45;
                    }
                    else
                    {
                      v34 = 1;
                    }
                    v18 = v50;
                    v22 = v51;

                    v38 = v46;
                  }

                }
                else
                {
                  v34 = 0;
                  v18 = v50;
                }
              }

            }
            else
            {
              v34 = 0;
              v18 = v50;
            }

          }
        }

      }
    }
    else
    {
      v34 = 0;
    }
  }

  return v34;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFOSUpdate productKey](self, "productKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[DMFOSUpdate productKey](self, "productKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tProduct Key                : “%@”"), v6);

  }
  -[DMFOSUpdate humanReadableName](self, "humanReadableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[DMFOSUpdate humanReadableName](self, "humanReadableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tHuman Readable Name        : “%@”"), v9);

  }
  -[DMFOSUpdate productName](self, "productName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[DMFOSUpdate productName](self, "productName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tProduct Name               : “%@”"), v12);

  }
  -[DMFOSUpdate version](self, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[DMFOSUpdate version](self, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tVersion                    : “%@”"), v15);

  }
  -[DMFOSUpdate build](self, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[DMFOSUpdate build](self, "build");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tBuild                      : “%@”"), v18);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tDownload Size              : %lu"), -[DMFOSUpdate downloadSize](self, "downloadSize"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tInstall Size               : %lu"), -[DMFOSUpdate installSize](self, "installSize"));
  if (-[DMFOSUpdate isCritical](self, "isCritical"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tIs Critical                : %@"), v19);
  if (-[DMFOSUpdate restartRequired](self, "restartRequired"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tRestart Required           : %@"), v20);
  if (-[DMFOSUpdate allowsInstallLater](self, "allowsInstallLater"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tAllows Install Later       : %@"), v21);
  if (-[DMFOSUpdate isSplat](self, "isSplat"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tIs Splat                   : %@"), v22);
  -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    -[DMFOSUpdate supplementalBuild](self, "supplementalBuild");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSupplemental Build         : “%@”"), v25);

  }
  -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    -[DMFOSUpdate supplementalVersionExtra](self, "supplementalVersionExtra");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tSupplemental Version Extra : “%@”"), v28);

  }
  objc_msgSend(v3, "appendString:", CFSTR("\n}>"));
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)build
{
  return self->_build;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (unint64_t)installSize
{
  return self->_installSize;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (BOOL)allowsInstallLater
{
  return self->_allowsInstallLater;
}

- (BOOL)isSplat
{
  return self->_isSplat;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (NSString)supplementalVersionExtra
{
  return self->_supplementalVersionExtra;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalVersionExtra, 0);
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end
