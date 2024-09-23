@implementation AMSDataMigratorOptions

- (AMSDataMigratorOptions)init
{
  return -[AMSDataMigratorOptions initWithOptionsArray:](self, "initWithOptionsArray:", 0);
}

- (AMSDataMigratorOptions)initWithOptionsArray:(id)a3
{
  id v4;
  AMSDataMigratorOptions *v5;
  uint64_t v6;
  NSString *currentBuildVersion;
  uint64_t v8;
  NSString *previousBuildVersion;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSDataMigratorOptions;
  v5 = -[AMSDataMigratorOptions init](&v12, sel_init);
  if (v5)
  {
    +[AMSDataMigratorOptions _stringFromOptionsArray:atIndex:](AMSDataMigratorOptions, "_stringFromOptionsArray:atIndex:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    currentBuildVersion = v5->_currentBuildVersion;
    v5->_currentBuildVersion = (NSString *)v6;

    +[AMSDataMigratorOptions _stringFromOptionsArray:atIndex:](AMSDataMigratorOptions, "_stringFromOptionsArray:atIndex:", v4, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    previousBuildVersion = v5->_previousBuildVersion;
    v5->_previousBuildVersion = (NSString *)v8;

    +[AMSDataMigratorOptions _stringFromOptionsArray:atIndex:](AMSDataMigratorOptions, "_stringFromOptionsArray:atIndex:", v4, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scenario = objc_msgSend(v10, "integerValue");

  }
  return v5;
}

- (NSArray)optionsArray
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[AMSDataMigratorOptions currentBuildVersion](self, "currentBuildVersion");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E2548760;
  -[AMSDataMigratorOptions previousBuildVersion](self, "previousBuildVersion", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E2548760;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSDataMigratorOptions scenario](self, "scenario"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

+ (id)_stringFromOptionsArray:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  if (objc_msgSend(v5, "count") <= a4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)previousBuildVersion
{
  return self->_previousBuildVersion;
}

- (void)setPreviousBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(unint64_t)a3
{
  self->_scenario = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBuildVersion, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
}

@end
