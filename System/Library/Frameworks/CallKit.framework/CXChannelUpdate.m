@implementation CXChannelUpdate

- (CXChannelUpdate)init
{
  char *v2;
  CXChannelUpdate *v3;
  NSUUID *v4;
  NSUUID *UUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXChannelUpdate;
  v2 = -[CXChannelUpdate init](&v7, sel_init);
  v3 = (CXChannelUpdate *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 9) = 0;
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    UUID = v3->_UUID;
    v3->_UUID = v4;

  }
  return v3;
}

- (void)setActiveRemoteParticipant:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 1u;
  objc_storeStrong((id *)&self->_activeRemoteParticipant, a3);
}

- (void)setAudioBluetoothFormat:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 2u;
  self->_audioBluetoothFormat = a3;
}

- (void)setAudioCategory:(id)a3
{
  NSString *v4;
  NSString *audioCategory;

  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 4u;
  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioCategory = self->_audioCategory;
  self->_audioCategory = v4;

}

- (void)setAudioInterruptionOperationMode:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x10u;
  self->_audioInterruptionOperationMode = a3;
}

- (void)setAudioInterruptionProvider:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 8u;
  self->_audioInterruptionProvider = a3;
}

- (void)setAudioMode:(id)a3
{
  NSString *v4;
  NSString *audioMode;

  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x20u;
  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioMode = self->_audioMode;
  self->_audioMode = v4;

}

- (void)setSandboxExtendedImageURL:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x80u;
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, a3);
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x40u;
  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setServiceStatus:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x100u;
  self->_serviceStatus = a3;
}

- (void)setTransmissionMode:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x200u;
  self->_transmissionMode = a3;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x400u;
  self->_accessoryButtonEventsEnabled = a3;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;

  -[CXChannelUpdate sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    CXGetSandboxExtendedFileURL(a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CXChannelUpdate setSandboxExtendedImageURL:](self, "setSandboxExtendedImageURL:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;

  v13 = (char *)a3;
  -[CXChannelUpdate UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a4);
  v8 = (void *)*((_QWORD *)v13 + 12);
  *((_QWORD *)v13 + 12) = v7;

  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    *(_WORD *)(v13 + 9) |= 1u;
    -[CXChannelUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActiveRemoteParticipant:", v9);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x40) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x40u;
    -[CXChannelUpdate name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a4);
    objc_msgSend(v13, "setName:", v11);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x80) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x80u;
    -[CXChannelUpdate sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSandboxExtendedImageURL:", v12);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x100) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x100u;
    objc_msgSend(v13, "setServiceStatus:", -[CXChannelUpdate serviceStatus](self, "serviceStatus"));
  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x200) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x200u;
    objc_msgSend(v13, "setTransmissionMode:", -[CXChannelUpdate transmissionMode](self, "transmissionMode"));
  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x400) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x400u;
    objc_msgSend(v13, "setAccessoryButtonEventsEnabled:", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }

}

- (id)sanitizedCopy
{
  return -[CXChannelUpdate sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXChannelUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;

  v10 = (char *)a3;
  -[CXChannelUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:");
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    *(_WORD *)(v10 + 9) |= 2u;
    objc_msgSend(v10, "setAudioBluetoothFormat:", -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"));
  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    *(_WORD *)(v10 + 9) |= 4u;
    -[CXChannelUpdate audioCategory](self, "audioCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a4);
    objc_msgSend(v10, "setAudioCategory:", v7);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x10) != 0)
  {
    *(_WORD *)(v10 + 9) |= 0x10u;
    objc_msgSend(v10, "setAudioInterruptionOperationMode:", -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 8) != 0)
  {
    *(_WORD *)(v10 + 9) |= 8u;
    objc_msgSend(v10, "setAudioInterruptionProvider:", -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x20) != 0)
  {
    *(_WORD *)(v10 + 9) |= 0x20u;
    -[CXChannelUpdate audioMode](self, "audioMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a4);
    objc_msgSend(v10, "setAudioMode:", v9);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXChannelUpdate updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelUpdate)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  _WORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  CXChannelUpdate *v33;
  id v34;
  uint64_t v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CXChannelUpdate;
  v5 = -[CXChannelUpdate init](&v37, sel_init);
  if (!v5)
  {
LABEL_34:
    v33 = v5;
    goto LABEL_35;
  }
  v36 = 0;
  v6 = objc_retainAutorelease(v4);
  NSStringFromSelector(sel_hasSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_WORD *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", v7, &v36);

  if (v36 == 2)
  {
    *(_WORD *)(v5 + 9) = *v8;
    v9 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v11;

    if ((objc_msgSend(v5, "hasSet") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v13, CFSTR("activeRemoteParticipant"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v14;

    }
    if ((objc_msgSend(v5, "hasSet") & 2) != 0)
      *((_QWORD *)v5 + 6) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("audioBluetoothFormat"));
    if ((objc_msgSend(v5, "hasSet") & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v16, CFSTR("audioCategory"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v5 + 7);
      *((_QWORD *)v5 + 7) = v17;

    }
    if ((objc_msgSend(v5, "hasSet") & 0x10) != 0)
      *((_QWORD *)v5 + 8) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("audioInterruptionOperationMode"));
    if ((objc_msgSend(v5, "hasSet") & 8) != 0)
      *((_QWORD *)v5 + 9) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("audioInterruptionProvider"));
    if ((objc_msgSend(v5, "hasSet") & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v19, CFSTR("audioMode"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)*((_QWORD *)v5 + 10);
      *((_QWORD *)v5 + 10) = v20;

    }
    if ((objc_msgSend(v5, "hasSet") & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v22, CFSTR("name"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)*((_QWORD *)v5 + 3);
      *((_QWORD *)v5 + 3) = v23;

    }
    if ((objc_msgSend(v5, "hasSet") & 0x100) != 0)
      *((_QWORD *)v5 + 4) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("serviceStatus"));
    if ((objc_msgSend(v5, "hasSet") & 0x200) != 0)
      *((_QWORD *)v5 + 5) = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("transmissionMode"));
    if ((objc_msgSend(v5, "hasSet") & 0x400) != 0)
      v5[8] = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("accessoryButtonEventsEnabled"));
    v25 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtendedImageURL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "connection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "cx_clientSandboxCanAccessFileURL:", v29);

        if (v30)
        {
          v31 = v27;
          v32 = *((_QWORD *)v5 + 11);
          *((_QWORD *)v5 + 11) = v31;
        }
        else
        {
          CXDefaultLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v27;
            _os_log_impl(&dword_1A402D000, v32, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access %@", buf, 0xCu);
          }
        }

      }
      else
      {
        v34 = v27;
        v28 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v34;
      }

    }
    goto LABEL_34;
  }
  v33 = 0;
LABEL_35:

  return v33;
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
  -[CXChannelUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, v5);

  NSStringFromSelector(sel_hasSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeBytes:length:forKey:", &self->_accessoryButtonEventsEnabled + 1, 2, v6);

  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXChannelUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("activeRemoteParticipant"));

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 2) != 0)
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"), CFSTR("audioBluetoothFormat"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXChannelUpdate audioCategory](self, "audioCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("audioCategory"));

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x10) != 0)
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"), CFSTR("audioInterruptionOperationMode"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 8) != 0)
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"), CFSTR("audioInterruptionProvider"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x20) != 0)
  {
    -[CXChannelUpdate audioMode](self, "audioMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("audioMode"));

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x40) != 0)
  {
    -[CXChannelUpdate name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("name"));

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x80) != 0)
  {
    -[CXChannelUpdate sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("sandboxExtendedImageURL"));

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x100) != 0)
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate serviceStatus](self, "serviceStatus"), CFSTR("serviceStatus"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x200) != 0)
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate transmissionMode](self, "transmissionMode"), CFSTR("transmissionMode"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x400) != 0)
    objc_msgSend(v12, "encodeBool:forKey:", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"), CFSTR("accessoryButtonEventsEnabled"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXChannelUpdate UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p UUID=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXChannelUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipant=%@"), v5);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 2) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioBluetoothFormat=%ld"), -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXChannelUpdate audioCategory](self, "audioCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioCategory=%@"), v6);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x10) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioInterruptionOperationMode=%ld"), -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 8) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioInterruptionProvider=%ld"), -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x20) != 0)
  {
    -[CXChannelUpdate audioMode](self, "audioMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioMode=%@"), v7);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x80) != 0)
  {
    -[CXChannelUpdate sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" imageURL=%@"), v8);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x40) != 0)
  {
    -[CXChannelUpdate name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" name=%@"), v9);

  }
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x100) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" serviceStatus=%ld"), -[CXChannelUpdate serviceStatus](self, "serviceStatus"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x200) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" transmissionMode=%ld"), -[CXChannelUpdate transmissionMode](self, "transmissionMode"));
  if ((-[CXChannelUpdate hasSet](self, "hasSet") & 0x400) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" accessoryButtonEventsEnabled=%d"), -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CXChannelUpdate)updateWithUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)-[CXChannelUpdate copy](self, "copy");
  if ((objc_msgSend(v4, "hasSet") & 1) != 0)
  {
    objc_msgSend(v4, "activeRemoteParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveRemoteParticipant:", v6);

  }
  if ((objc_msgSend(v4, "hasSet") & 2) != 0)
    objc_msgSend(v5, "setAudioBluetoothFormat:", objc_msgSend(v4, "audioBluetoothFormat"));
  if ((objc_msgSend(v4, "hasSet") & 4) != 0)
  {
    objc_msgSend(v4, "audioCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAudioCategory:", v7);

  }
  if ((objc_msgSend(v4, "hasSet") & 0x10) != 0)
    objc_msgSend(v5, "setAudioInterruptionOperationMode:", objc_msgSend(v4, "audioInterruptionOperationMode"));
  if ((objc_msgSend(v4, "hasSet") & 8) != 0)
    objc_msgSend(v5, "setAudioInterruptionProvider:", objc_msgSend(v4, "audioInterruptionProvider"));
  if ((objc_msgSend(v4, "hasSet") & 0x20) != 0)
  {
    objc_msgSend(v4, "audioMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAudioMode:", v8);

  }
  if ((objc_msgSend(v4, "hasSet") & 0x40) != 0)
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v9);

  }
  if ((objc_msgSend(v4, "hasSet") & 0x80) != 0)
  {
    objc_msgSend(v4, "sandboxExtendedImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSandboxExtendedImageURL:", v10);

  }
  if ((objc_msgSend(v4, "hasSet") & 0x100) != 0)
    objc_msgSend(v5, "setServiceStatus:", objc_msgSend(v4, "serviceStatus"));
  if ((objc_msgSend(v4, "hasSet") & 0x200) != 0)
    objc_msgSend(v5, "setTransmissionMode:", objc_msgSend(v4, "transmissionMode"));
  if ((objc_msgSend(v4, "hasSet") & 0x400) != 0)
    objc_msgSend(v5, "setAccessoryButtonEventsEnabled:", objc_msgSend(v4, "accessoryButtonEventsEnabled"));

  return (CXChannelUpdate *)v5;
}

- (CXParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (int64_t)audioBluetoothFormat
{
  return self->_audioBluetoothFormat;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (int64_t)audioInterruptionOperationMode
{
  return self->_audioInterruptionOperationMode;
}

- (int64_t)audioInterruptionProvider
{
  return self->_audioInterruptionProvider;
}

- (NSString)audioMode
{
  return self->_audioMode;
}

- (CXChannelUpdateHasSet)hasSet
{
  return (CXChannelUpdateHasSet)*(unsigned __int16 *)(&self->_accessoryButtonEventsEnabled + 1);
}

- (CXSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
}

@end
