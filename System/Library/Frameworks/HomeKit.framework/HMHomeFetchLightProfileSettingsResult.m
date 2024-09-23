@implementation HMHomeFetchLightProfileSettingsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMHomeFetchLightProfileSettingsResult error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMHomeFetchLightProfileSettingsResultKeyError"));

  -[HMHomeFetchLightProfileSettingsResult settings](self, "settings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMHomeFetchLightProfileSettingsResultKeySettings"));

}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (HMLightProfileSettings)settings
{
  return (HMLightProfileSettings *)objc_getProperty(self, a2, 16, 1);
}

- (HMHomeFetchLightProfileSettingsResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  HMHomeFetchLightProfileSettingsResult *v9;
  HMHomeFetchLightProfileSettingsResult *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeFetchLightProfileSettingsResultKeyError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHomeFetchLightProfileSettingsResultKeySettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v10 = -[HMHomeFetchLightProfileSettingsResult initWithError:](self, "initWithError:", v5);
LABEL_12:
    self = v10;
    v9 = self;
    goto LABEL_13;
  }
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v10 = -[HMHomeFetchLightProfileSettingsResult initWithSettings:](self, "initWithSettings:", v6);
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (HMHomeFetchLightProfileSettingsResult)initWithSettings:(id)a3
{
  id v4;
  HMHomeFetchLightProfileSettingsResult *v5;
  uint64_t v6;
  HMLightProfileSettings *settings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMHomeFetchLightProfileSettingsResult;
  v5 = -[HMHomeFetchLightProfileSettingsResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    settings = v5->_settings;
    v5->_settings = (HMLightProfileSettings *)v6;

  }
  return v5;
}

- (HMHomeFetchLightProfileSettingsResult)initWithError:(id)a3
{
  id v4;
  HMHomeFetchLightProfileSettingsResult *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMHomeFetchLightProfileSettingsResult;
  v5 = -[HMHomeFetchLightProfileSettingsResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    error = v5->_error;
    v5->_error = (NSError *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "error"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMHomeFetchLightProfileSettingsResult error](self, "error"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = HMFEqualObjects(),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v7, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeFetchLightProfileSettingsResult settings](self, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMHomeFetchLightProfileSettingsResult error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMHomeFetchLightProfileSettingsResult settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeFetchLightProfileSettingsResult settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Settings"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeFetchLightProfileSettingsResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Error"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
