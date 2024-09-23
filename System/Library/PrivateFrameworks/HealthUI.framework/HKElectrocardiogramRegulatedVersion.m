@implementation HKElectrocardiogramRegulatedVersion

- (HKElectrocardiogramRegulatedVersion)initWithSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  id v6;
  HKElectrocardiogramRegulatedVersion *v7;
  HKElectrocardiogramRegulatedVersion *v8;
  uint64_t v9;
  NSString *updateVersion;
  uint64_t v11;
  NSString *featureVersion;
  HKElectrocardiogramRegulatedVersion *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramRegulatedVersion;
  v7 = -[HKElectrocardiogramRegulatedVersion init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!-[HKElectrocardiogramRegulatedVersion _validateSourceVersion:algorithmVersion:](v7, "_validateSourceVersion:algorithmVersion:", v6, a4))
    {
      v13 = 0;
      goto LABEL_6;
    }
    -[HKElectrocardiogramRegulatedVersion _updateVersionFromSourceVersion:algorithmVersion:](v8, "_updateVersionFromSourceVersion:algorithmVersion:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    updateVersion = v8->_updateVersion;
    v8->_updateVersion = (NSString *)v9;

    -[HKElectrocardiogramRegulatedVersion _featureVersionFromUpdateVersion:](v8, "_featureVersionFromUpdateVersion:", v8->_updateVersion);
    v11 = objc_claimAutoreleasedReturnValue();
    featureVersion = v8->_featureVersion;
    v8->_featureVersion = (NSString *)v11;

  }
  v13 = v8;
LABEL_6:

  return v13;
}

- (BOOL)_validateSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  BOOL v4;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  return !v4;
}

- (id)_updateVersionFromSourceVersion:(id)a3 algorithmVersion:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  MEMORY[0x1D829F100](&v6, a3, a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), a4, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_featureVersionFromUpdateVersion:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "integerValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v3);
}

- (NSString)updateVersion
{
  return self->_updateVersion;
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_updateVersion, 0);
}

@end
