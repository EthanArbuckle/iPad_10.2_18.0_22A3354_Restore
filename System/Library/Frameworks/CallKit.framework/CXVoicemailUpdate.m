@implementation CXVoicemailUpdate

- (CXVoicemailUpdate)initWithVoicemailUUID:(id)a3
{
  id v4;
  CXVoicemailUpdate *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSUUID *voicemailUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXVoicemailUpdate;
  v5 = -[CXVoicemailUpdate init](&v11, sel_init);
  if (v5)
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXVoicemailUpdate initWithVoicemailUUID:]", CFSTR("voicemailUUID"));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = objc_msgSend(v4, "copy");
    voicemailUUID = v5->_voicemailUUID;
    v5->_voicemailUUID = (NSUUID *)v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXVoicemailUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v5);

  -[CXVoicemailUpdate voicemailUUID](self, "voicemailUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" voicemailUUID=%@"), v7);

  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXVoicemailUpdate sender](self, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" sender=%@"), v8);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    -[CXVoicemailUpdate dateReceived](self, "dateReceived");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" dateReceived=%@"), v9);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXVoicemailUpdate audioFileURL](self, "audioFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioFileURL=%@"), v10);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 8) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" played=%d"), -[CXVoicemailUpdate isPlayed](self, "isPlayed"));
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 0x10) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" trashed=%d"), -[CXVoicemailUpdate isTrashed](self, "isTrashed"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)setSender:(id)a3
{
  CXHandle *v4;
  CXHandle *sender;

  *(_BYTE *)&self->_hasSet |= 1u;
  v4 = (CXHandle *)objc_msgSend(a3, "copy");
  sender = self->_sender;
  self->_sender = v4;

}

- (void)setDateReceived:(id)a3
{
  NSDate *v4;
  NSDate *dateReceived;

  *(_BYTE *)&self->_hasSet |= 2u;
  v4 = (NSDate *)objc_msgSend(a3, "copy");
  dateReceived = self->_dateReceived;
  self->_dateReceived = v4;

}

- (void)setAudioFileURL:(id)a3
{
  NSURL *v4;
  NSURL *audioFileURL;

  *(_BYTE *)&self->_hasSet |= 4u;
  v4 = (NSURL *)objc_msgSend(a3, "copy");
  audioFileURL = self->_audioFileURL;
  self->_audioFileURL = v4;

}

- (void)setPlayed:(BOOL)a3
{
  *(_BYTE *)&self->_hasSet |= 8u;
  self->_played = a3;
}

- (void)setTrashed:(BOOL)a3
{
  *(_BYTE *)&self->_hasSet |= 0x10u;
  self->_trashed = a3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE *v14;

  v14 = a3;
  -[CXVoicemailUpdate UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a4);
  objc_msgSend(v14, "setUUID:", v7);

  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    v14[12] |= 1u;
    -[CXVoicemailUpdate sender](self, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a4);
    objc_msgSend(v14, "setSender:", v9);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    v14[12] |= 2u;
    -[CXVoicemailUpdate dateReceived](self, "dateReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a4);
    objc_msgSend(v14, "setDateReceived:", v11);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    v14[12] |= 4u;
    -[CXVoicemailUpdate audioFileURL](self, "audioFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a4);
    objc_msgSend(v14, "setAudioFileURL:", v13);

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 8) != 0)
  {
    v14[12] |= 8u;
    objc_msgSend(v14, "setPlayed:", -[CXVoicemailUpdate isPlayed](self, "isPlayed"));
  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 0x10) != 0)
  {
    v14[12] |= 0x10u;
    objc_msgSend(v14, "setTrashed:", -[CXVoicemailUpdate isTrashed](self, "isTrashed"));
  }

}

- (id)sanitizedCopy
{
  return -[CXVoicemailUpdate sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXVoicemailUpdate voicemailUUID](self, "voicemailUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithVoicemailUUID:", v7);

  -[CXVoicemailUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v8, a3);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXVoicemailUpdate voicemailUUID](self, "voicemailUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithVoicemailUUID:", v7);

  -[CXVoicemailUpdate updateCopy:withZone:](self, "updateCopy:withZone:", v8, a3);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXVoicemailUpdate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CXVoicemailUpdate *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUUID *UUID;
  id v13;
  void *v14;
  CXVoicemailUpdateHasSet *v15;
  void *v16;
  uint64_t v17;
  CXHandle *sender;
  void *v19;
  uint64_t v20;
  NSDate *dateReceived;
  void *v22;
  uint64_t v23;
  NSURL *audioFileURL;
  CXVoicemailUpdate *v25;
  uint64_t v27;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_voicemailUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CXVoicemailUpdate initWithVoicemailUUID:](self, "initWithVoicemailUUID:", v7);
  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v11;

    v27 = 0;
    v13 = objc_retainAutorelease(v4);
    NSStringFromSelector(sel_hasSet);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (CXVoicemailUpdateHasSet *)objc_msgSend(v13, "decodeBytesForKey:returnedLength:", v14, &v27);

    if (v27 != 4)
    {
      v25 = 0;
      goto LABEL_15;
    }
    v8->_hasSet = *v15;
    if ((-[CXVoicemailUpdate hasSet](v8, "hasSet") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v16, CFSTR("sender"));
      v17 = objc_claimAutoreleasedReturnValue();
      sender = v8->_sender;
      v8->_sender = (CXHandle *)v17;

    }
    if ((-[CXVoicemailUpdate hasSet](v8, "hasSet") & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v19, CFSTR("dateReceived"));
      v20 = objc_claimAutoreleasedReturnValue();
      dateReceived = v8->_dateReceived;
      v8->_dateReceived = (NSDate *)v20;

    }
    if ((-[CXVoicemailUpdate hasSet](v8, "hasSet") & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v22, CFSTR("audioFileURL"));
      v23 = objc_claimAutoreleasedReturnValue();
      audioFileURL = v8->_audioFileURL;
      v8->_audioFileURL = (NSURL *)v23;

    }
    if ((-[CXVoicemailUpdate hasSet](v8, "hasSet") & 8) != 0)
      v8->_played = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("played"));
    if ((-[CXVoicemailUpdate hasSet](v8, "hasSet") & 0x10) != 0)
      v8->_trashed = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("trashed"));
  }
  v25 = v8;
LABEL_15:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CXVoicemailUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, v5);

  -[CXVoicemailUpdate voicemailUUID](self, "voicemailUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_voicemailUUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, v7);

  NSStringFromSelector(sel_hasSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeBytes:length:forKey:", &self->_hasSet, 4, v8);

  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXVoicemailUpdate sender](self, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("sender"));

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    -[CXVoicemailUpdate dateReceived](self, "dateReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("dateReceived"));

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXVoicemailUpdate audioFileURL](self, "audioFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("audioFileURL"));

  }
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 8) != 0)
    objc_msgSend(v12, "encodeBool:forKey:", -[CXVoicemailUpdate isPlayed](self, "isPlayed"), CFSTR("played"));
  if ((-[CXVoicemailUpdate hasSet](self, "hasSet") & 0x10) != 0)
    objc_msgSend(v12, "encodeBool:forKey:", -[CXVoicemailUpdate isTrashed](self, "isTrashed"), CFSTR("trashed"));

}

- (NSUUID)voicemailUUID
{
  return self->_voicemailUUID;
}

- (CXHandle)sender
{
  return self->_sender;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (CXVoicemailUpdateHasSet)hasSet
{
  return self->_hasSet;
}

- (void)setHasSet:(CXVoicemailUpdateHasSet)a3
{
  self->_hasSet = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_voicemailUUID, 0);
}

@end
