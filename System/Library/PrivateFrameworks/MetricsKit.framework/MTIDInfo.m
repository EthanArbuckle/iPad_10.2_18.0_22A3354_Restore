@implementation MTIDInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MTIDInfo scheme](self, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idNamespace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "idNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v9))
    {
      -[MTIDInfo idString](self, "idString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        -[MTIDInfo expirationDate](self, "expirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "expirationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
        {
          v15 = 1;
        }
        else
        {
          v18 = v13;
          -[MTIDInfo expirationDate](self, "expirationDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "expirationDate");
          v19 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v17, "isEqual:", v14);

          v12 = v19;
          v13 = v18;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (NSDictionary)metricsFields
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  int64_t v7;
  void *v8;
  const __CFString *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  -[MTIDInfo idString](self, "idString");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[MTIDInfo shouldGenerateMetricsFields](self, "shouldGenerateMetricsFields"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MTIDInfo idType](self, "idType");
    if (v7 == 1)
    {
      -[MTIDInfo idString](self, "idString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("clientId"));

      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("device"), CFSTR("xpClientIdSource"));
    }
    else if (v7 == 2)
    {
      -[MTIDInfo idString](self, "idString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("userId"));

      if (-[MTIDInfo isSynchronized](self, "isSynchronized"))
        v9 = CFSTR("synchronized");
      else
        v9 = CFSTR("unsynchronized");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("xpUserIdSyncState"));
      -[MTIDInfo lifespan](self, "lifespan");
      if (v10 > 0.0)
      {
        v11 = (void *)MEMORY[0x24BDD16E0];
        -[MTIDInfo lifespan](self, "lifespan");
        objc_msgSend(v11, "numberWithDouble:", v12 * 1000.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("xpUserIdLifespan"));

      }
    }
    v14 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1B8];
  }
  return (NSDictionary *)v14;
}

- (NSString)idString
{
  return self->_idString;
}

- (BOOL)shouldGenerateMetricsFields
{
  return self->_shouldGenerateMetricsFields;
}

- (double)lifespan
{
  void *v2;
  double v3;

  -[MTIDInfo scheme](self, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "lifespan");

  return v3;
}

- (int64_t)idType
{
  void *v2;
  int64_t v3;

  -[MTIDInfo scheme](self, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idType");

  return v3;
}

- (MTIDScheme)scheme
{
  return self->_scheme;
}

- (NSNumber)dsId
{
  return self->_dsId;
}

- (BOOL)isSynchronized
{
  return self->_isSynchronized;
}

- (void)setIsSynchronized:(BOOL)a3
{
  self->_isSynchronized = a3;
}

- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return -[MTIDInfo initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:shouldGenerateMetricsFields:](self, "initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:shouldGenerateMetricsFields:", a3, a4, a5, a6, a7, a8, v9);
}

- (MTIDInfo)initWithScheme:(id)a3 secret:(id)a4 idString:(id)a5 dsId:(id)a6 effectiveDate:(id)a7 expirationDate:(id)a8 shouldGenerateMetricsFields:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MTIDInfo *v21;
  MTIDInfo *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MTIDInfo;
  v21 = -[MTIDInfo init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    -[MTIDInfo setScheme:](v21, "setScheme:", v15);
    -[MTIDInfo setSecret:](v22, "setSecret:", v16);
    -[MTIDInfo setIdString:](v22, "setIdString:", v17);
    -[MTIDInfo setDsId:](v22, "setDsId:", v18);
    -[MTIDInfo setExpirationDate:](v22, "setExpirationDate:", v20);
    -[MTIDInfo setEffectiveDate:](v22, "setEffectiveDate:", v19);
    -[MTIDInfo setShouldGenerateMetricsFields:](v22, "setShouldGenerateMetricsFields:", a9);
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDInfo setComputedDate:](v22, "setComputedDate:", v24);

  }
  return v22;
}

- (void)setShouldGenerateMetricsFields:(BOOL)a3
{
  self->_shouldGenerateMetricsFields = a3;
}

- (void)setSecret:(id)a3
{
  objc_storeStrong((id *)&self->_secret, a3);
}

- (void)setScheme:(id)a3
{
  objc_storeStrong((id *)&self->_scheme, a3);
}

- (void)setIdString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setEffectiveDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDsId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setComputedDate:(id)a3
{
  objc_storeStrong((id *)&self->_computedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_dsId, 0);
  objc_storeStrong((id *)&self->_idString, 0);
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

- (NSString)idNamespace
{
  void *v2;
  void *v3;

  -[MTIDInfo scheme](self, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "idNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isValueExpired
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[MTIDInfo expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "compare:", v2) == 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDInfo idString](self, "idString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDInfo scheme](self, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, idString: %@, namespace: %@ >"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)debugInfo
{
  void *v3;
  void *v4;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDInfo idString](self, "idString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ID"));

  -[MTIDInfo scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("namespace"));

  -[MTIDInfo secret](self, "secret");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("secret"));

  -[MTIDInfo effectiveDate](self, "effectiveDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("effectiveDate"));

  -[MTIDInfo expirationDate](self, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("expirationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MTIDInfo isSynchronized](self, "isSynchronized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isSynchronized"));

  -[MTIDInfo dsId](self, "dsId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dsId"));

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (MTIDSecret)secret
{
  return self->_secret;
}

- (NSDate)computedDate
{
  return self->_computedDate;
}

@end
