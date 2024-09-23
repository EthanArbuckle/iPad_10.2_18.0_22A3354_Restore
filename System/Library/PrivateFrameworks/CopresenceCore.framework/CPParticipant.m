@implementation CPParticipant

- (CPParticipant)initWithAccountIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CPParticipant *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPParticipant initWithUUID:accountIdentifier:](self, "initWithUUID:accountIdentifier:", v6, v5);

  return v7;
}

- (CPParticipant)initWithUUID:(id)a3 accountIdentifier:(id)a4
{
  id v7;
  id v8;
  CPParticipant *v9;
  CPParticipant *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPParticipant;
  v9 = -[CPParticipant init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_UUID, a3);
    objc_storeStrong((id *)&v10->_accountIdentifier, a4);
    *(_OWORD *)&v10->_audioToken = xmmword_1ACF59DC0;
  }

  return v10;
}

- (unint64_t)spatialAudioSourceID
{
  return self->_spatialAudioSourceIdentifier;
}

- (void)_setSpatialAudioSourceId:(unint64_t)a3
{
  self->_spatialAudioSourceIdentifier = a3;
}

- (unint64_t)participantID
{
  return self->_participantIdentifier;
}

- (void)_setParticipantID:(int64_t)a3
{
  self->_participantIdentifier = a3;
}

- (void)_setAVCStreams:(id)a3
{
  objc_storeStrong((id *)&self->_avcStreams, a3);
}

- (void)_setAudioToken:(int64_t)a3
{
  self->_audioToken = a3;
}

- (void)_setLocalStatus:(unsigned __int8)a3
{
  self->_localStatus = a3;
}

- (id)_localStatusDescription
{
  unsigned int v2;

  v2 = -[CPParticipant localStatus](self, "localStatus");
  if (v2 > 3)
    return CFSTR("<unknown>");
  else
    return (id)*((_QWORD *)&off_1E5C81008 + (char)v2);
}

- (BOOL)_isNearby
{
  return self->_localStatus == 3;
}

- (BOOL)_isLocal
{
  return self->_localStatus == 1;
}

- (BOOL)_isSpectator
{
  return self->_localStatus == 2;
}

- (unsigned)localStatus
{
  return self->_localStatus;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPParticipant UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" UUID=%@"), v7);

  -[CPParticipant accountIdentifier](self, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" accountIdentifier=%@"), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(" participantID=%llu"), -[CPParticipant participantIdentifier](self, "participantIdentifier"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" streamToken=%ld"), -[CPParticipant streamToken](self, "streamToken"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" screenToken=%ld"), -[CPParticipant screenToken](self, "screenToken"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isVideoEnabled=%d"), -[CPParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" isScreenEnabled=%d"), -[CPParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" spatialAudioSourceIdentifier=%llu"), -[CPParticipant spatialAudioSourceIdentifier](self, "spatialAudioSourceIdentifier"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" localStatus=%d"), -[CPParticipant localStatus](self, "localStatus"));
  -[CPParticipant avcStreams](self, "avcStreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" avcStreams=%@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CPParticipant isEquivalentToParticipant:](self, "isEquivalentToParticipant:", v4);

  return v5;
}

- (BOOL)isEquivalentToParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  -[CPParticipant accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = -[CPParticipant participantIdentifier](self, "participantIdentifier");
    v8 = v7 == objc_msgSend(v4, "participantIdentifier");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[CPParticipant accountIdentifier](self, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[CPParticipant participantIdentifier](self, "participantIdentifier") ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPParticipant)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CPParticipant *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *userContext;
  void *v22;
  uint64_t v23;
  NSDictionary *avcStreams;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_accountIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CPParticipant initWithUUID:accountIdentifier:](self, "initWithUUID:accountIdentifier:", v7, v10);
  if (v11)
  {
    NSStringFromSelector(sel_participantIdentifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_participantIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v12);

    NSStringFromSelector(sel_spatialAudioSourceIdentifier);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_spatialAudioSourceIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v13);

    NSStringFromSelector(sel_localStatus);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_localStatus = objc_msgSend(v4, "decodeInt32ForKey:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_userContext);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    userContext = v11->_userContext;
    v11->_userContext = (NSDictionary *)v20;

    NSStringFromSelector(sel_avcStreams);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    avcStreams = v11->_avcStreams;
    v11->_avcStreams = (NSDictionary *)v23;

    NSStringFromSelector(sel_audioToken);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_audioToken = objc_msgSend(v4, "decodeIntegerForKey:", v25);

    NSStringFromSelector(sel_streamToken);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_streamToken = objc_msgSend(v4, "decodeIntegerForKey:", v26);

    NSStringFromSelector(sel_screenToken);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_screenToken = objc_msgSend(v4, "decodeIntegerForKey:", v27);

    NSStringFromSelector(sel_isAudioEnabled);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_audioEnabled = objc_msgSend(v4, "decodeBoolForKey:", v28);

    NSStringFromSelector(sel_isVideoEnabled);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_videoEnabled = objc_msgSend(v4, "decodeBoolForKey:", v29);

    NSStringFromSelector(sel_isScreenEnabled);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_screenEnabled = objc_msgSend(v4, "decodeBoolForKey:", v30);

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  void *v6;
  NSString *accountIdentifier;
  void *v8;
  unint64_t participantIdentifier;
  void *v10;
  unint64_t spatialAudioSourceIdentifier;
  void *v12;
  uint64_t localStatus;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _BOOL8 v29;
  id v30;

  UUID = self->_UUID;
  v5 = a3;
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", UUID, v6);

  accountIdentifier = self->_accountIdentifier;
  NSStringFromSelector(sel_accountIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, v8);

  participantIdentifier = self->_participantIdentifier;
  NSStringFromSelector(sel_participantIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", participantIdentifier, v10);

  spatialAudioSourceIdentifier = self->_spatialAudioSourceIdentifier;
  NSStringFromSelector(sel_spatialAudioSourceIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", spatialAudioSourceIdentifier, v12);

  localStatus = self->_localStatus;
  NSStringFromSelector(sel_localStatus);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt32:forKey:", localStatus, v14);

  -[CPParticipant userContext](self, "userContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userContext);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, v16);

  -[CPParticipant avcStreams](self, "avcStreams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avcStreams);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, v18);

  v19 = -[CPParticipant audioToken](self, "audioToken");
  NSStringFromSelector(sel_audioToken);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", v19, v20);

  v21 = -[CPParticipant streamToken](self, "streamToken");
  NSStringFromSelector(sel_streamToken);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", v21, v22);

  v23 = -[CPParticipant screenToken](self, "screenToken");
  NSStringFromSelector(sel_screenToken);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", v23, v24);

  v25 = -[CPParticipant isAudioEnabled](self, "isAudioEnabled");
  NSStringFromSelector(sel_isAudioEnabled);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v25, v26);

  v27 = -[CPParticipant isVideoEnabled](self, "isVideoEnabled");
  NSStringFromSelector(sel_isVideoEnabled);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v27, v28);

  v29 = -[CPParticipant isScreenEnabled](self, "isScreenEnabled");
  NSStringFromSelector(sel_isScreenEnabled);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v29, v30);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPParticipant *v4;
  uint64_t v5;
  NSDictionary *userContext;

  v4 = -[CPParticipant initWithUUID:accountIdentifier:]([CPParticipant alloc], "initWithUUID:accountIdentifier:", self->_UUID, self->_accountIdentifier);
  v4->_participantIdentifier = self->_participantIdentifier;
  v5 = -[NSDictionary copy](self->_userContext, "copy");
  userContext = v4->_userContext;
  v4->_userContext = (NSDictionary *)v5;

  v4->_spatialAudioSourceIdentifier = self->_spatialAudioSourceIdentifier;
  v4->_localStatus = self->_localStatus;
  objc_storeStrong((id *)&v4->_avcStreams, self->_avcStreams);
  v4->_audioToken = self->_audioToken;
  v4->_streamToken = self->_streamToken;
  v4->_screenToken = self->_screenToken;
  v4->_audioEnabled = self->_audioEnabled;
  v4->_videoEnabled = self->_videoEnabled;
  v4->_screenEnabled = self->_screenEnabled;
  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)_setParticipantIdentifier:(unint64_t)a3
{
  self->_participantIdentifier = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)avcStreams
{
  return self->_avcStreams;
}

- (int64_t)audioToken
{
  return self->_audioToken;
}

- (unint64_t)spatialAudioSourceIdentifier
{
  return self->_spatialAudioSourceIdentifier;
}

- (void)_setSpatialAudioSourceIdentifier:(unint64_t)a3
{
  self->_spatialAudioSourceIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avcStreams, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
