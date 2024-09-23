@implementation VCCapabilities

+ (id)DataOnlyVCCapabilities
{
  VCCapabilities *v2;

  v2 = objc_alloc_init(VCCapabilities);
  -[VCCapabilities setIsAudioEnabled:](v2, "setIsAudioEnabled:", 0);
  -[VCCapabilities setIsVideoEnabled:](v2, "setIsVideoEnabled:", 0);
  -[VCCapabilities setIsDuplexAudioOnly:](v2, "setIsDuplexAudioOnly:", 0);
  -[VCCapabilities setIsDuplexVideoOnly:](v2, "setIsDuplexVideoOnly:", 1);
  -[VCCapabilities setIsVideoPausedToStart:](v2, "setIsVideoPausedToStart:", 0);
  return v2;
}

+ (id)AudioOnlyVCCapabilities
{
  VCCapabilities *v2;

  v2 = objc_alloc_init(VCCapabilities);
  -[VCCapabilities setIsAudioEnabled:](v2, "setIsAudioEnabled:", 1);
  -[VCCapabilities setIsVideoEnabled:](v2, "setIsVideoEnabled:", 0);
  -[VCCapabilities setIsDuplexAudioOnly:](v2, "setIsDuplexAudioOnly:", 1);
  -[VCCapabilities setIsDuplexVideoOnly:](v2, "setIsDuplexVideoOnly:", 0);
  -[VCCapabilities setIsVideoPausedToStart:](v2, "setIsVideoPausedToStart:", 0);
  return v2;
}

+ (id)VideoOnlyVCCapabilities
{
  VCCapabilities *v2;

  v2 = objc_alloc_init(VCCapabilities);
  -[VCCapabilities setIsAudioEnabled:](v2, "setIsAudioEnabled:", 1);
  -[VCCapabilities setIsVideoEnabled:](v2, "setIsVideoEnabled:", 1);
  -[VCCapabilities setIsDuplexAudioOnly:](v2, "setIsDuplexAudioOnly:", 0);
  -[VCCapabilities setIsDuplexVideoOnly:](v2, "setIsDuplexVideoOnly:", 1);
  -[VCCapabilities setIsVideoPausedToStart:](v2, "setIsVideoPausedToStart:", 0);
  return v2;
}

+ (id)screenSharingVCCapabilities
{
  VCCapabilities *v2;

  v2 = objc_alloc_init(VCCapabilities);
  -[VCCapabilities setIsAudioEnabled:](v2, "setIsAudioEnabled:", 1);
  -[VCCapabilities setIsVideoEnabled:](v2, "setIsVideoEnabled:", 1);
  -[VCCapabilities setIsVideoSourceScreen:](v2, "setIsVideoSourceScreen:", 1);
  -[VCCapabilities setIsDuplexAudioOnly:](v2, "setIsDuplexAudioOnly:", 0);
  -[VCCapabilities setIsDuplexVideoOnly:](v2, "setIsDuplexVideoOnly:", 1);
  -[VCCapabilities setIsVideoPausedToStart:](v2, "setIsVideoPausedToStart:", 0);
  -[VCCapabilities setDeviceRole:](v2, "setDeviceRole:", 5);
  return v2;
}

- (VCCapabilities)init
{
  VCCapabilities *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCapabilities;
  result = -[VCCapabilities init](&v3, sel_init);
  if (result)
  {
    result->isAudioEnabled = 1;
    *(_DWORD *)&result->isAudioPausedToStart = 0;
    *(_WORD *)&result->isDuplexAudioOnly = 0;
    *(_OWORD *)&result->preferredAudioCodec = xmmword_1D910D520;
    *(_DWORD *)&result->isKeyExchangeEnabled = 16777472;
    result->isDTLSEnabled = 0;
    result->deviceRole = 0;
  }
  return result;
}

- (VCCapabilities)initWithEncodedDictionary:(id)a3
{
  VCCapabilities *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCCapabilities;
  v4 = -[VCCapabilities init](&v6, sel_init);
  -[VCCapabilities decodeFromNSDictionary:](v4, "decodeFromNSDictionary:", a3);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{VCCapabilities: isAudioEnabled = %d, isAudioPausedToStart = %d, isVideoEnabled = %d, isVideoPausedToStart = %d, isVideoSourceScreen = %d, isDuplexAudioOnly = %d, isDuplexVideoOnly = %d, isHalfDuplexAudio = %d, isKeyExchangeEnabled = %d, isRelayEnabled = %d, isRelayForced = %d, requiresWifi = %d, isDTLSEnabled = %d, preferredAudioCodec = %u, actualAudioCodec = %u, preferredVideoCodec = %u, actualVideoCodec = %u, deviceRole = %d}"), self->isAudioEnabled, self->isAudioPausedToStart, self->isVideoEnabled, self->isVideoPausedToStart, self->isVideoSourceScreen, self->isDuplexAudioOnly, self->isDuplexVideoOnly, self->isHalfDuplexAudio, self->isKeyExchangeEnabled, self->isRelayEnabled, self->isRelayForced, self->requiresWifi, self->isDTLSEnabled, self->preferredAudioCodec, self->actualAudioCodec, self->preferredVideoCodec,
               self->actualVideoCodec,
               self->deviceRole);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->isAudioEnabled, CFSTR("audioEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isVideoEnabled, CFSTR("videoEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isVideoSourceScreen, CFSTR("videoSourceScreen"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isDuplexAudioOnly, CFSTR("duplexAudioOnly"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isDuplexVideoOnly, CFSTR("duplexVideoOnly"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isHalfDuplexAudio, CFSTR("halfDuplexAudio"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isKeyExchangeEnabled, CFSTR("keyExchangeEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isAudioPausedToStart, CFSTR("startAudioPaused"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isVideoPausedToStart, CFSTR("startVideoPaused"));
  objc_msgSend(a3, "encodeInt:forKey:", self->preferredAudioCodec, CFSTR("preferredAudioCodec"));
  objc_msgSend(a3, "encodeInt:forKey:", self->actualAudioCodec, CFSTR("actualAudioCodec"));
  objc_msgSend(a3, "encodeInt:forKey:", self->preferredVideoCodec, CFSTR("preferredVideoCodec"));
  objc_msgSend(a3, "encodeInt:forKey:", self->actualVideoCodec, CFSTR("actualVideoCodec"));
  objc_msgSend(a3, "encodeInt:forKey:", self->deviceRole, CFSTR("deviceRole"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isRelayEnabled, CFSTR("relayEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isRelayForced, CFSTR("relayForced"));
  objc_msgSend(a3, "encodeBool:forKey:", self->requiresWifi, CFSTR("requiresWifi"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isDTLSEnabled, CFSTR("DTLSEnabled"));
}

- (VCCapabilities)initWithCoder:(id)a3
{
  self->isAudioEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("audioEnabled"));
  self->isVideoEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("videoEnabled"));
  self->isVideoSourceScreen = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("videoSourceScreen"));
  self->isDuplexAudioOnly = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("duplexAudioOnly"));
  self->isDuplexVideoOnly = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("duplexVideoOnly"));
  self->isHalfDuplexAudio = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("halfDuplexAudio"));
  self->isKeyExchangeEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("keyExchangeEnabled"));
  self->isAudioPausedToStart = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("startAudioPaused"));
  self->isVideoPausedToStart = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("startVideoPaused"));
  self->preferredAudioCodec = objc_msgSend(a3, "decodeIntForKey:", CFSTR("preferredAudioCodec"));
  self->actualAudioCodec = objc_msgSend(a3, "decodeIntForKey:", CFSTR("actualAudioCodec"));
  self->preferredVideoCodec = objc_msgSend(a3, "decodeIntForKey:", CFSTR("preferredVideoCodec"));
  self->actualVideoCodec = objc_msgSend(a3, "decodeIntForKey:", CFSTR("actualVideoCodec"));
  self->deviceRole = objc_msgSend(a3, "decodeIntForKey:", CFSTR("deviceRole"));
  self->isRelayEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("relayEnabled"));
  self->isRelayForced = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("relayForced"));
  self->requiresWifi = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requiresWifi"));
  self->isDTLSEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("DTLSEnabled"));
  return self;
}

- (id)newEncodedDictionary
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isAudioEnabled);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isVideoEnabled);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isVideoSourceScreen);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isDuplexAudioOnly);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isDuplexVideoOnly);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isHalfDuplexAudio);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isKeyExchangeEnabled);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isAudioPausedToStart);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isVideoPausedToStart);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->deviceRole);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", self->preferredAudioCodec);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", self->actualAudioCodec);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", self->preferredVideoCodec);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", self->actualVideoCodec);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isRelayEnabled);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isRelayForced);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->requiresWifi);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->isDTLSEnabled);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v21, CFSTR("audioEnabled"), v20, CFSTR("videoEnabled"), v19, CFSTR("videoSourceScreen"), v18, CFSTR("duplexAudioOnly"), v17, CFSTR("duplexVideoOnly"), v16, CFSTR("halfDuplexAudio"), v15, CFSTR("keyExchangeEnabled"), v14, CFSTR("startAudioPaused"), v22,
                 CFSTR("startVideoPaused"),
                 v3,
                 CFSTR("preferredAudioCodec"),
                 v7,
                 CFSTR("actualAudioCodec"),
                 v8,
                 CFSTR("preferredVideoCodec"),
                 v9,
                 CFSTR("actualVideoCodec"),
                 v10,
                 CFSTR("relayEnabled"),
                 v11,
                 CFSTR("relayForced"),
                 v4,
                 CFSTR("requiresWifi"),
                 v12,
                 CFSTR("DTLSEnabled"),
                 v13,
                 CFSTR("deviceRole"),
                 0);

  return v6;
}

- (void)decodeFromNSDictionary:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a3)
  {
    v21 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("audioEnabled"));
    v20 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("videoEnabled"));
    v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("videoSourceScreen"));
    v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duplexAudioOnly"));
    v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duplexVideoOnly"));
    v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("halfDuplexAudio"));
    v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("keyExchangeEnabled"));
    v14 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("startAudioPaused"));
    v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("startVideoPaused"));
    v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preferredAudioCodec"));
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("actualAudioCodec"));
    v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preferredVideoCodec"));
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("actualVideoCodec"));
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("relayEnabled"));
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("relayForced"));
    v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requiresWifi"));
    v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DTLSEnabled"));
    v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("deviceRole"));
    self->isAudioEnabled = objc_msgSend(v21, "BOOLValue");
    self->isVideoEnabled = objc_msgSend(v20, "BOOLValue");
    self->isVideoSourceScreen = objc_msgSend(v19, "BOOLValue");
    self->isDuplexAudioOnly = objc_msgSend(v18, "BOOLValue");
    self->isDuplexVideoOnly = objc_msgSend(v17, "BOOLValue");
    self->isHalfDuplexAudio = objc_msgSend(v16, "BOOLValue");
    self->isKeyExchangeEnabled = objc_msgSend(v15, "BOOLValue");
    self->isAudioPausedToStart = objc_msgSend(v14, "BOOLValue");
    self->isVideoPausedToStart = objc_msgSend(v13, "BOOLValue");
    self->preferredAudioCodec = objc_msgSend(v4, "unsignedIntValue");
    self->actualAudioCodec = objc_msgSend(v5, "unsignedIntValue");
    self->preferredVideoCodec = objc_msgSend(v6, "unsignedIntValue");
    self->actualVideoCodec = objc_msgSend(v7, "unsignedIntValue");
    self->isRelayEnabled = objc_msgSend(v8, "BOOLValue");
    self->isRelayForced = objc_msgSend(v9, "BOOLValue");
    self->requiresWifi = objc_msgSend(v10, "BOOLValue");
    self->isDTLSEnabled = objc_msgSend(v11, "BOOLValue");
    self->deviceRole = objc_msgSend(v12, "intValue");

  }
}

- (BOOL)isAudioEnabled
{
  return self->isAudioEnabled;
}

- (void)setIsAudioEnabled:(BOOL)a3
{
  self->isAudioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->isVideoEnabled;
}

- (void)setIsVideoEnabled:(BOOL)a3
{
  self->isVideoEnabled = a3;
}

- (BOOL)isVideoSourceScreen
{
  return self->isVideoSourceScreen;
}

- (void)setIsVideoSourceScreen:(BOOL)a3
{
  self->isVideoSourceScreen = a3;
}

- (BOOL)isDuplexVideoOnly
{
  return self->isDuplexVideoOnly;
}

- (void)setIsDuplexVideoOnly:(BOOL)a3
{
  self->isDuplexVideoOnly = a3;
}

- (BOOL)isDuplexAudioOnly
{
  return self->isDuplexAudioOnly;
}

- (void)setIsDuplexAudioOnly:(BOOL)a3
{
  self->isDuplexAudioOnly = a3;
}

- (BOOL)isKeyExchangeEnabled
{
  return self->isKeyExchangeEnabled;
}

- (void)setIsKeyExchangeEnabled:(BOOL)a3
{
  self->isKeyExchangeEnabled = a3;
}

- (unsigned)preferredAudioCodec
{
  return self->preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(unsigned int)a3
{
  self->preferredAudioCodec = a3;
}

- (unsigned)actualAudioCodec
{
  return self->actualAudioCodec;
}

- (void)setActualAudioCodec:(unsigned int)a3
{
  self->actualAudioCodec = a3;
}

- (unsigned)preferredVideoCodec
{
  return self->preferredVideoCodec;
}

- (void)setPreferredVideoCodec:(unsigned int)a3
{
  self->preferredVideoCodec = a3;
}

- (unsigned)actualVideoCodec
{
  return self->actualVideoCodec;
}

- (void)setActualVideoCodec:(unsigned int)a3
{
  self->actualVideoCodec = a3;
}

- (BOOL)isAudioPausedToStart
{
  return self->isAudioPausedToStart;
}

- (void)setIsAudioPausedToStart:(BOOL)a3
{
  self->isAudioPausedToStart = a3;
}

- (BOOL)isVideoPausedToStart
{
  return self->isVideoPausedToStart;
}

- (void)setIsVideoPausedToStart:(BOOL)a3
{
  self->isVideoPausedToStart = a3;
}

- (BOOL)isRelayEnabled
{
  return self->isRelayEnabled;
}

- (void)setIsRelayEnabled:(BOOL)a3
{
  self->isRelayEnabled = a3;
}

- (BOOL)isRelayForced
{
  return self->isRelayForced;
}

- (void)setIsRelayForced:(BOOL)a3
{
  self->isRelayForced = a3;
}

- (BOOL)requiresWifi
{
  return self->requiresWifi;
}

- (void)setRequiresWifi:(BOOL)a3
{
  self->requiresWifi = a3;
}

- (BOOL)isDTLSEnabled
{
  return self->isDTLSEnabled;
}

- (void)setIsDTLSEnabled:(BOOL)a3
{
  self->isDTLSEnabled = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->deviceRole = a3;
}

- (BOOL)isHalfDuplexAudio
{
  return self->isHalfDuplexAudio;
}

- (void)setIsHalfDuplexAudio:(BOOL)a3
{
  self->isHalfDuplexAudio = a3;
}

@end
