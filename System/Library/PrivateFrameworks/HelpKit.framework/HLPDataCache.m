@implementation HLPDataCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HLPDataCache *v4;

  v4 = +[HLPDataCache allocWithZone:](HLPDataCache, "allocWithZone:", a3);
  -[HLPDataCache setCacheType:](v4, "setCacheType:", self->_cacheType);
  -[HLPDataCache setMaxAge:](v4, "setMaxAge:", self->_maxAge);
  -[HLPDataCache setFileSize:](v4, "setFileSize:", self->_fileSize);
  -[HLPDataCache setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[HLPDataCache setUpdatedDate:](v4, "setUpdatedDate:", self->_updatedDate);
  -[HLPDataCache setLastModified:](v4, "setLastModified:", self->_lastModified);
  -[HLPDataCache setLanguageCode:](v4, "setLanguageCode:", self->_languageCode);
  return v4;
}

- (HLPDataCache)initWithCoder:(id)a3
{
  id v4;
  HLPDataCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HLPDataCache;
  v5 = -[HLPDataCache init](&v11, sel_init);
  if (v5)
  {
    -[HLPDataCache setMaxAge:](v5, "setMaxAge:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HLPDataCacheMaxAge")));
    -[HLPDataCache setCacheType:](v5, "setCacheType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HLPDataCacheType")));
    -[HLPDataCache setFileSize:](v5, "setFileSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HLPDataCacheFileSize")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HLPDataCacheIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCache setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HLPDataCacheLastModified"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCache setLastModified:](v5, "setLastModified:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HLPDataCacheLangaugeCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCache setLanguageCode:](v5, "setLanguageCode:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HLPDataCacheUpdatedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPDataCache setUpdatedDate:](v5, "setUpdatedDate:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache maxAge](self, "maxAge"), CFSTR("HLPDataCacheMaxAge"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache cacheType](self, "cacheType"), CFSTR("HLPDataCacheType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HLPDataCache fileSize](self, "fileSize"), CFSTR("HLPDataCacheFileSize"));
  -[HLPDataCache identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HLPDataCacheIdentifier"));

  -[HLPDataCache updatedDate](self, "updatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HLPDataCacheUpdatedDate"));

  -[HLPDataCache lastModified](self, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HLPDataCacheLastModified"));

  -[HLPDataCache languageCode](self, "languageCode");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HLPDataCacheLangaugeCode"));

}

- (BOOL)expired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HLPDataCache updatedDate](self, "updatedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)self->_maxAge);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPDataCache updatedDate](self, "updatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(v4, "compare:", v5) == -1;
  else
    v7 = 1;

  return v7;
}

- (id)debugDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("HLPDataCacheIdentifier"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("HLPDataCacheType"), self->_cacheType);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("HLPDataCacheMaxAge"), self->_maxAge);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %zd\n"), CFSTR("HLPDataCacheUpdatedDate"), self->_fileSize);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("HLPDataCacheFileSize"), self->_updatedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("HLPDataCacheLastModified"), self->_lastModified);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("HLPDataCacheLangaugeCode"), self->_languageCode);
  return v3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(int64_t)a3
{
  self->_maxAge = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
