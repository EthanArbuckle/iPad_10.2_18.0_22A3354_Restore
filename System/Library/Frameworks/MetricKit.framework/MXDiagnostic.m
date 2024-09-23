@implementation MXDiagnostic

- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4
{
  id v7;
  id v8;
  MXDiagnostic *v9;
  MXDiagnostic *v10;
  NSMeasurementFormatter *v11;
  NSMeasurementFormatter *measurementFormatter;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MXDiagnostic;
  v9 = -[MXDiagnostic init](&v16, sel_init);
  if (!v9)
    goto LABEL_5;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v9->_measurementFormatter;
    v9->_measurementFormatter = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v9->_measurementFormatter, "setLocale:", v13);

    -[NSMeasurementFormatter setUnitOptions:](v9->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v9->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v9->_measurementFormatter, "numberFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaximumFractionDigits:", 0);

    objc_storeStrong((id *)&v9->_metaData, a3);
    objc_storeStrong((id *)&v9->_applicationVersion, a4);
LABEL_5:
    v10 = v9;
  }

  return v10;
}

- (MXDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 andPID:(int)a6
{
  id v11;
  id v12;
  id v13;
  MXDiagnostic *v14;
  MXDiagnostic *v15;
  NSMeasurementFormatter *v16;
  NSMeasurementFormatter *measurementFormatter;
  void *v18;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MXDiagnostic;
  v14 = -[MXDiagnostic init](&v21, sel_init);
  if (!v14)
    goto LABEL_5;
  v15 = 0;
  if (v11 && v12)
  {
    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v14->_measurementFormatter;
    v14->_measurementFormatter = v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v14->_measurementFormatter, "setLocale:", v18);

    -[NSMeasurementFormatter setUnitOptions:](v14->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v14->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v14->_measurementFormatter, "numberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMaximumFractionDigits:", 0);

    objc_storeStrong((id *)&v14->_metaData, a3);
    objc_storeStrong((id *)&v14->_applicationVersion, a4);
    objc_storeStrong((id *)&v14->_signpostData, a5);
    v14->_pid = a6;
LABEL_5:
    v15 = v14;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXMetaData *metaData;
  id v5;
  id v6;

  metaData = self->_metaData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metaData, CFSTR("diagnosticMetaData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationVersion, CFSTR("appVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signpostData, CFSTR("signpostData"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("pid"));

}

- (MXDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXDiagnostic *v5;
  NSMeasurementFormatter *v6;
  NSMeasurementFormatter *measurementFormatter;
  void *v8;
  void *v9;
  uint64_t v10;
  MXMetaData *metaData;
  uint64_t v12;
  NSString *applicationVersion;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *signpostData;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXDiagnostic;
  v5 = -[MXDiagnostic init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v5->_measurementFormatter;
    v5->_measurementFormatter = v6;

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v5->_measurementFormatter, "setLocale:", v8);

    -[NSMeasurementFormatter setUnitOptions:](v5->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v5->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v5->_measurementFormatter, "numberFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaximumFractionDigits:", 0);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diagnosticMetaData"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (MXMetaData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("signpostData"));
    v17 = objc_claimAutoreleasedReturnValue();
    signpostData = v5->_signpostData;
    v5->_signpostData = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v19, "intValue");

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  id v4;
  MXMetaData *metaData;
  void *v6;
  NSString *applicationVersion;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  metaData = self->_metaData;
  if (metaData)
  {
    -[MXMetaData toDictionary](metaData, "toDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
    objc_msgSend(v4, "setObject:forKey:", applicationVersion, CFSTR("appVersion"));
  if (self->_signpostData)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_signpostData;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("signpostData"));
  }
  if (objc_msgSend(v4, "count", (_QWORD)v17))
  {
    v15 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("diagnosticMetaData"));

  }
  objc_msgSend(v3, "setObject:forKey:", CFSTR("1.0.0"), CFSTR("version"));

  return v3;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXDiagnostic toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (MXMetaData)metaData
{
  return (MXMetaData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetaData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)applicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)signpostData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignpostData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_signpostData, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

@end
