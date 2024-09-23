@implementation AVAudioApplicationSpecification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->audioAppType, CFSTR("audioAppType"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->_appAuditToken, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("appAuditToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->attributionBundleID, CFSTR("attributionBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->processName, CFSTR("processName"));

}

- (AVAudioApplicationSpecification)initWithCoder:(id)a3
{
  id v4;
  AVAudioApplicationSpecification *v5;
  void *v6;
  uint64_t v7;
  NSString *attributionBundleID;
  uint64_t v9;
  NSString *processName;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioApplicationSpecification;
  v5 = -[AVAudioApplicationSpecification init](&v12, sel_init);
  if (v5)
  {
    v5->audioAppType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("audioAppType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appAuditToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", &v5->_appAuditToken, 32);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionBundleID"));
    v7 = objc_claimAutoreleasedReturnValue();
    attributionBundleID = v5->attributionBundleID;
    v5->attributionBundleID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processName"));
    v9 = objc_claimAutoreleasedReturnValue();
    processName = v5->processName;
    v5->processName = (NSString *)v9;

  }
  return v5;
}

- (int64_t)audioAppType
{
  return self->audioAppType;
}

- (void)setAudioAppType:(int64_t)a3
{
  self->audioAppType = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)appAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAppAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_appAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_appAuditToken.val[4] = v3;
}

- (NSString)attributionBundleID
{
  return self->attributionBundleID;
}

- (void)setAttributionBundleID:(id)a3
{
  objc_storeStrong((id *)&self->attributionBundleID, a3);
}

- (NSString)processName
{
  return self->processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->processName, 0);
  objc_storeStrong((id *)&self->attributionBundleID, 0);
}

@end
