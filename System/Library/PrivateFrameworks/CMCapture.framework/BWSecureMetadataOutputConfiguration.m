@implementation BWSecureMetadataOutputConfiguration

- (BWSecureMetadataOutputConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfiguration;
  return -[BWSecureMetadataOutputConfiguration init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfiguration;
  -[BWSecureMetadataOutputConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BWSecureMetadataOutputConfiguration *v4;
  double v5;

  v4 = -[BWSecureMetadataOutputConfiguration init](+[BWSecureMetadataOutputConfiguration allocWithZone:](BWSecureMetadataOutputConfiguration, "allocWithZone:", a3), "init");
  -[BWSecureMetadataOutputConfiguration setObjectDetectionEnabled:](v4, "setObjectDetectionEnabled:", self->_objectDetectionEnabled);
  -[BWSecureMetadataOutputConfiguration setEnabledDetectedObjectTypes:](v4, "setEnabledDetectedObjectTypes:", self->_enabledDetectedObjectTypes);
  *(float *)&v5 = self->_objectDetectionTargetFrameRate;
  -[BWSecureMetadataOutputConfiguration setObjectDetectionTargetFrameRate:](v4, "setObjectDetectionTargetFrameRate:", v5);
  -[BWSecureMetadataOutputConfiguration setAttentionDetectionEnabled:](v4, "setAttentionDetectionEnabled:", self->_attentionDetectionEnabled);
  -[BWSecureMetadataOutputConfiguration setEyeReliefStatusDetectionEnabled:](v4, "setEyeReliefStatusDetectionEnabled:", self->_eyeReliefStatusDetectionEnabled);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  float v5;
  BOOL result;

  if (a3 == self)
    return 1;
  objc_opt_class();
  result = (objc_opt_isKindOfClass() & 1) != 0
        && self->_objectDetectionEnabled == objc_msgSend(a3, "objectDetectionEnabled")
        && (NSSet *)objc_msgSend(a3, "enabledDetectedObjectTypes") == self->_enabledDetectedObjectTypes
        && (objc_msgSend(a3, "objectDetectionTargetFrameRate"), v5 == self->_objectDetectionTargetFrameRate)
        && self->_attentionDetectionEnabled == objc_msgSend(a3, "attentionDetectionEnabled")
        && self->_eyeReliefStatusDetectionEnabled == objc_msgSend(a3, "eyeReliefStatusDetectionEnabled");
  return result;
}

- (float)objectDetectionTargetFrameRate
{
  return self->_objectDetectionTargetFrameRate;
}

- (void)setObjectDetectionTargetFrameRate:(float)a3
{
  self->_objectDetectionTargetFrameRate = a3;
}

- (NSDictionary)metadataOutputConfigurationDictionary
{
  NSDictionary *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_objectDetectionEnabled);
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D06700]);
  if (self->_objectDetectionEnabled)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D064A0]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07068]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D064B0]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6E0, *MEMORY[0x1E0D07078]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D064B8]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07080]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D06498]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07060]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D064A8]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07070]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D06488]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07050]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D06490]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07058]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D06478]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07040]);
    if (-[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D06480]))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E49FA6C8, *MEMORY[0x1E0D07048]);
    if (self->_objectDetectionTargetFrameRate > 0.0)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D07CA0]);
    }
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_attentionDetectionEnabled);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D07970]);
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D066F8]);
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_eyeReliefStatusDetectionEnabled);
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D066F0]);
  return v3;
}

- (BOOL)isEmpty
{
  return !self->_objectDetectionEnabled && !self->_eyeReliefStatusDetectionEnabled;
}

- (BOOL)objectDetectionEnabled
{
  return self->_objectDetectionEnabled;
}

- (void)setObjectDetectionEnabled:(BOOL)a3
{
  self->_objectDetectionEnabled = a3;
}

- (NSSet)enabledDetectedObjectTypes
{
  return self->_enabledDetectedObjectTypes;
}

- (void)setEnabledDetectedObjectTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  self->_attentionDetectionEnabled = a3;
}

- (BOOL)eyeReliefStatusDetectionEnabled
{
  return self->_eyeReliefStatusDetectionEnabled;
}

- (void)setEyeReliefStatusDetectionEnabled:(BOOL)a3
{
  self->_eyeReliefStatusDetectionEnabled = a3;
}

@end
