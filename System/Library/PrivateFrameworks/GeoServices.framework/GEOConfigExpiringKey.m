@implementation GEOConfigExpiringKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOConfigExpiringKey)initWithCoder:(id)a3
{
  id v4;
  GEOConfigExpiringKey *v5;
  uint64_t v6;
  NSString *keyPath;
  uint64_t v8;
  NSDate *expireTime;
  uint64_t v10;
  NSString *expireOSVersion;
  GEOConfigExpiringKey *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOConfigExpiringKey;
  v5 = -[GEOConfigExpiringKey init](&v14, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kp"));
  v6 = objc_claimAutoreleasedReturnValue();
  keyPath = v5->_keyPath;
  v5->_keyPath = (NSString *)v6;

  if (!-[NSString length](v5->_keyPath, "length"))
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
  v8 = objc_claimAutoreleasedReturnValue();
  expireTime = v5->_expireTime;
  v5->_expireTime = (NSDate *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osv"));
  v10 = objc_claimAutoreleasedReturnValue();
  expireOSVersion = v5->_expireOSVersion;
  v5->_expireOSVersion = (NSString *)v10;

  if (v5->_expireTime || -[NSString length](v5->_expireOSVersion, "length"))
LABEL_5:
    v12 = v5;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *expireTime;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyPath, CFSTR("kp"));
  expireTime = self->_expireTime;
  if (expireTime)
    objc_msgSend(v5, "encodeObject:forKey:", expireTime, CFSTR("time"));
  if (-[NSString length](self->_expireOSVersion, "length"))
    objc_msgSend(v5, "encodeObject:forKey:", self->_expireOSVersion, CFSTR("osv"));

}

- (GEOConfigExpiringKey)initWithKey:(id)a3 time:(id)a4 osVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOConfigExpiringKey *v11;
  uint64_t v12;
  NSString *keyPath;
  uint64_t v14;
  NSDate *expireTime;
  uint64_t v16;
  NSString *expireOSVersion;
  GEOConfigExpiringKey *v18;
  NSObject *v20;
  const char *v21;
  objc_super v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_11:
      v18 = 0;
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
    v21 = "Assertion failed: key.length > 0";
LABEL_13:
    _os_log_fault_impl(&dword_1885A9000, v20, OS_LOG_TYPE_FAULT, v21, buf, 2u);
    goto LABEL_11;
  }
  if (!v9 && !objc_msgSend(v10, "length"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
    v21 = "Assertion failed: date != ((void *)0) || osVersion.length > 0";
    goto LABEL_13;
  }
  v22.receiver = self;
  v22.super_class = (Class)GEOConfigExpiringKey;
  v11 = -[GEOConfigExpiringKey init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    keyPath = v11->_keyPath;
    v11->_keyPath = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    expireTime = v11->_expireTime;
    v11->_expireTime = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    expireOSVersion = v11->_expireOSVersion;
    v11->_expireOSVersion = (NSString *)v16;

  }
  self = v11;
  v18 = self;
LABEL_7:

  return v18;
}

+ (id)expiringKey:(id)a3 withTime:(id)a4 osVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOConfigExpiringKey *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEOConfigExpiringKey initWithKey:time:osVersion:]([GEOConfigExpiringKey alloc], "initWithKey:time:osVersion:", v9, v8, v7);

  return v10;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOConfigExpiringKey _isExpiredRelativeTo:osVersion:](self, "_isExpiredRelativeTo:osVersion:", v3, v5);

  return (char)self;
}

- (BOOL)_isExpiredRelativeTo:(id)a3 osVersion:(id)a4
{
  id v6;
  id v7;
  NSDate *expireTime;
  double v9;
  NSString *expireOSVersion;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  int v24;
  id v25;
  uint64_t v26;
  BOOL v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  if (v6
    && (expireTime = self->_expireTime) != 0
    && (-[NSDate timeIntervalSinceDate:](expireTime, "timeIntervalSinceDate:", v6), v9 <= 0.0))
  {
    v27 = 1;
  }
  else if (-[NSString length](self->_expireOSVersion, "length") && objc_msgSend(v7, "length"))
  {
    expireOSVersion = self->_expireOSVersion;
    v11 = v7;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", expireOSVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invertedSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isAtEnd") & 1) == 0)
    {
      while (1)
      {
        if ((objc_msgSend(v13, "isAtEnd") & 1) != 0)
          goto LABEL_18;
        v33 = 0;
        v16 = objc_msgSend(v12, "scanCharactersFromSet:intoString:", v14, &v33);
        v17 = v33;
        v18 = 0;
        if (v16)
        {
          v32 = 0;
          v19 = objc_msgSend(v13, "scanCharactersFromSet:intoString:", v14, &v32);
          v18 = v32;
          if (v19)
          {
            v20 = objc_msgSend(v17, "integerValue");
            v21 = objc_msgSend(v18, "integerValue");
            if (v21)
            {
              if (v20 && v20 != v21)
                break;
            }
          }
        }
        v31 = v17;
        v22 = objc_msgSend(v12, "scanCharactersFromSet:intoString:", v15, &v31);
        v23 = v31;

        if (v22)
        {
          v30 = v18;
          v24 = objc_msgSend(v13, "scanCharactersFromSet:intoString:", v15, &v30);
          v25 = v30;

          if (v24)
          {
            v26 = objc_msgSend(v23, "compare:", v25);
            if (v26)
            {
              v27 = v26 == -1;
              goto LABEL_26;
            }
          }
          v18 = v25;
        }

        if (objc_msgSend(v12, "isAtEnd"))
          goto LABEL_18;
      }
      v27 = v20 < v21;
      v23 = v17;
      v25 = v18;
LABEL_26:

      goto LABEL_27;
    }
LABEL_18:
    v27 = objc_msgSend(v12, "isAtEnd") && !objc_msgSend(v13, "isAtEnd");
LABEL_27:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (NSString)expireOSVersion
{
  return self->_expireOSVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireOSVersion, 0);
  objc_storeStrong((id *)&self->_expireTime, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
