@implementation BTCloudSoundProfileRecord

- (BTCloudSoundProfileRecord)initWithCustomData:(id)a3
{
  id v4;
  BTCloudSoundProfileRecord *v5;
  BTCloudSoundProfileRecord *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = -[BTCloudSoundProfileRecord init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BTCloudSoundProfileRecord setSoundProfileData:](v5, "setSoundProfileData:", v4);

  return v6;
}

- (BTCloudSoundProfileRecord)initWithFileURL:(id)a3
{
  id v4;
  BTCloudSoundProfileRecord *v5;
  BTCloudSoundProfileRecord *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = -[BTCloudSoundProfileRecord init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[BTCloudSoundProfileRecord setSoundProfileFileURL:](v5, "setSoundProfileFileURL:", v4);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudSoundProfileRecord setSoundProfileData:](v6, "setSoundProfileData:", v7);

  }
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BTCloudSoundProfileRecord soundProfileData](self, "soundProfileData");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("BTCloudSoundProfileRecord: %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BTCloudSoundProfileRecord soundProfileFileURL](self, "soundProfileFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("BTCloudSoundProfileRecord: %@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)soundProfileRecordWithCustomData:(id)a3
{
  id v3;
  BTCloudSoundProfileRecord *v4;

  v3 = a3;
  v4 = -[BTCloudSoundProfileRecord initWithCustomData:]([BTCloudSoundProfileRecord alloc], "initWithCustomData:", v3);

  return v4;
}

+ (id)soundProfileRecordWithFileURL:(id)a3
{
  id v3;
  BTCloudSoundProfileRecord *v4;

  v3 = a3;
  v4 = -[BTCloudSoundProfileRecord initWithFileURL:]([BTCloudSoundProfileRecord alloc], "initWithFileURL:", v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BTCloudSoundProfileRecord soundProfileData](self, "soundProfileData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundProfileData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[BTCloudSoundProfileRecord soundProfileFileURL](self, "soundProfileFileURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundProfileFileURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (BTCloudSoundProfileRecord)initWithCoder:(id)a3
{
  id v4;
  BTCloudSoundProfileRecord *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BTCloudSoundProfileRecord;
  v5 = -[BTCloudSoundProfileRecord init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_soundProfileData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudSoundProfileRecord setSoundProfileData:](v5, "setSoundProfileData:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_soundProfileFileURL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudSoundProfileRecord setSoundProfileFileURL:](v5, "setSoundProfileFileURL:", v11);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)soundProfileData
{
  return self->_soundProfileData;
}

- (void)setSoundProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_soundProfileData, a3);
}

- (NSURL)soundProfileFileURL
{
  return self->_soundProfileFileURL;
}

- (void)setSoundProfileFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, 0);
  objc_storeStrong((id *)&self->_soundProfileData, 0);
}

@end
