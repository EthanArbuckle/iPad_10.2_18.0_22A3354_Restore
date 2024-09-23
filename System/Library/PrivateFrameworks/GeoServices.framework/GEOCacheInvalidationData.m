@implementation GEOCacheInvalidationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOCacheInvalidationData)initWithTimestamp:(double)a3 ttl:(double)a4 version:(unsigned int)a5 domains:(id)a6
{
  id v11;
  GEOCacheInvalidationData *v12;
  GEOCacheInvalidationData *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)GEOCacheInvalidationData;
  v12 = -[GEOCacheInvalidationData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_timestamp = a3;
    v12->_ttl = a4;
    v12->_version = a5;
    objc_storeStrong((id *)&v12->_versionDomains, a6);
  }

  return v13;
}

- (GEOCacheInvalidationData)initWithCoder:(id)a3
{
  id v4;
  GEOCacheInvalidationData *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *versionDomains;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOCacheInvalidationData;
  v5 = -[GEOCacheInvalidationData init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOCacheInvalidationDataTimestampKey"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOCacheInvalidationDataTTLKey"));
    v5->_ttl = v7;
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("GEOCacheInvalidationDataVersionKey"));
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("GEOCacheInvalidationDataVersionDomainsKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    versionDomains = v5->_versionDomains;
    v5->_versionDomains = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOCacheInvalidationDataTimestampKey"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOCacheInvalidationDataTTLKey"), self->_ttl);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_version, CFSTR("GEOCacheInvalidationDataVersionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionDomains, CFSTR("GEOCacheInvalidationDataVersionDomainsKey"));

}

- (BOOL)isInvalidatedByServiceVersion:(unsigned int)a3 domains:(id)a4
{
  _BOOL4 v6;

  v6 = -[GEOCacheInvalidationData _isKey:subsetOf:](self, "_isKey:subsetOf:", self->_versionDomains, a4);
  if (v6)
    LOBYTE(v6) = self->_version < a3;
  return v6;
}

- (BOOL)_isKey:(id)a3 subsetOf:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v6, "count");
    if (v9 <= objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v7, "count"))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);
          v8 = v13 == 0;

          if (v13)
            break;
          ++v10;
        }
        while (v10 < objc_msgSend(v7, "count"));
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)ttl
{
  return self->_ttl;
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)versionDomains
{
  return self->_versionDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionDomains, 0);
}

@end
