@implementation CXVoicemail

- (CXVoicemail)init
{

  return 0;
}

- (CXVoicemail)initWithUUID:(id)a3
{
  id v5;
  CXVoicemail *v6;
  CXVoicemail *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXVoicemail;
  v6 = -[CXVoicemail init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_UUID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXVoicemail)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CXVoicemail *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CXHandle *sender;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDate *dateReceived;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSURL *audioFileURL;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CXVoicemail initWithUUID:](self, "initWithUUID:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sender);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sender = v8->_sender;
    v8->_sender = (CXHandle *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_dateReceived);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dateReceived = v8->_dateReceived;
    v8->_dateReceived = (NSDate *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_audioFileURL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    audioFileURL = v8->_audioFileURL;
    v8->_audioFileURL = (NSURL *)v19;

    NSStringFromSelector(sel_isPlayed);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_played = objc_msgSend(v4, "decodeBoolForKey:", v21);

    NSStringFromSelector(sel_isTrashed);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_trashed = objc_msgSend(v4, "decodeBoolForKey:", v22);

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  id v16;

  v4 = a3;
  -[CXVoicemail UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXVoicemail sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[CXVoicemail dateReceived](self, "dateReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateReceived);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[CXVoicemail audioFileURL](self, "audioFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audioFileURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[CXVoicemail isPlayed](self, "isPlayed");
  NSStringFromSelector(sel_isPlayed);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[CXVoicemail isTrashed](self, "isTrashed");
  NSStringFromSelector(sel_isTrashed);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXVoicemail UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v5);

  -[CXVoicemail sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sender=%@"), v6);

  -[CXVoicemail dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateReceived=%@"), v7);

  -[CXVoicemail audioFileURL](self, "audioFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioFileURL=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" played=%d"), -[CXVoicemail isPlayed](self, "isPlayed"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" trashed=%d"), -[CXVoicemail isTrashed](self, "isTrashed"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXVoicemail isEqualToVoicemail:](self, "isEqualToVoicemail:", v4);

  return v5;
}

- (BOOL)isEqualToVoicemail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;
  uint64_t v17;

  v4 = a3;
  -[CXVoicemail UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CXVoicemail sender](self, "sender");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sender");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8 && !objc_msgSend((id)v7, "isEqual:", v8))
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      -[CXVoicemail dateReceived](self, "dateReceived");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateReceived");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10))
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        -[CXVoicemail audioFileURL](self, "audioFileURL");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "audioFileURL");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 | v12 && !objc_msgSend((id)v11, "isEqual:", v12))
        {
          LOBYTE(v14) = 0;
        }
        else
        {
          v17 = v9;
          v13 = -[CXVoicemail isPlayed](self, "isPlayed");
          if (v13 == objc_msgSend(v4, "isPlayed"))
          {
            v15 = -[CXVoicemail isTrashed](self, "isTrashed");
            v14 = v15 ^ objc_msgSend(v4, "isTrashed") ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }
          v9 = v17;
        }

      }
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  -[CXVoicemail UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXVoicemail sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CXVoicemail dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CXVoicemail audioFileURL](self, "audioFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  if (-[CXVoicemail isPlayed](self, "isPlayed"))
    v11 = 1231;
  else
    v11 = 1237;
  if (-[CXVoicemail isTrashed](self, "isTrashed"))
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v10 ^ v11 ^ v12;

  return v13;
}

- (id)sanitizedCopy
{
  return -[CXVoicemail sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CXVoicemail updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v9, a4);
  -[CXVoicemail sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSender:", v6);

  -[CXVoicemail dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDateReceived:", v7);

  -[CXVoicemail audioFileURL](self, "audioFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAudioFileURL:", v8);

  objc_msgSend(v9, "setPlayed:", -[CXVoicemail isPlayed](self, "isPlayed"));
  objc_msgSend(v9, "setTrashed:", -[CXVoicemail isTrashed](self, "isTrashed"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXVoicemail UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUID:", v6);

  -[CXVoicemail updateCopy:withZone:](self, "updateCopy:withZone:", v7, a3);
  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CXHandle)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (void)setPlayed:(BOOL)a3
{
  self->_played = a3;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
