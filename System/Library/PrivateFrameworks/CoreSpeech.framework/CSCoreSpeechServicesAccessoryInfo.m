@implementation CSCoreSpeechServicesAccessoryInfo

- (CSCoreSpeechServicesAccessoryInfo)init
{
  CSCoreSpeechServicesAccessoryInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoreSpeechServicesAccessoryInfo;
  result = -[CSCoreSpeechServicesAccessoryInfo init](&v3, sel_init);
  if (result)
    result->_supportsJustSiri = 0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = kSupportsJustSiriKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsJustSiri);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = kSupportsAlwaysOnAccelerometer;
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAlwaysOnAccelerometer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSCoreSpeechServicesAccessoryInfo *v4;

  v4 = objc_alloc_init(CSCoreSpeechServicesAccessoryInfo);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsJustSiri:](v4, "setSupportsJustSiri:", self->_supportsJustSiri);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsAlwaysOnAccelerometer:](v4, "setSupportsAlwaysOnAccelerometer:", self->_supportsAlwaysOnAccelerometer);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 supportsJustSiri;
  uint64_t v5;
  id v6;

  supportsJustSiri = self->_supportsJustSiri;
  v5 = kSupportsJustSiriKey;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", supportsJustSiri, v5);
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsAlwaysOnAccelerometer, kSupportsAlwaysOnAccelerometer);

}

- (CSCoreSpeechServicesAccessoryInfo)initWithCoder:(id)a3
{
  id v4;
  CSCoreSpeechServicesAccessoryInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSCoreSpeechServicesAccessoryInfo;
  v5 = -[CSCoreSpeechServicesAccessoryInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_supportsJustSiri = objc_msgSend(v4, "decodeBoolForKey:", kSupportsJustSiriKey);
    v5->_supportsAlwaysOnAccelerometer = objc_msgSend(v4, "decodeBoolForKey:", kSupportsAlwaysOnAccelerometer);
  }

  return v5;
}

- (BOOL)supportsJustSiri
{
  return self->_supportsJustSiri;
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  self->_supportsJustSiri = a3;
}

- (BOOL)supportsAlwaysOnAccelerometer
{
  return self->_supportsAlwaysOnAccelerometer;
}

- (void)setSupportsAlwaysOnAccelerometer:(BOOL)a3
{
  self->_supportsAlwaysOnAccelerometer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
