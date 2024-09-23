@implementation MIDICIProfileState

- (MIDICIProfileState)initWithEnabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled
{

  return 0;
}

- (MIDICIProfileState)initWithChannel:(MIDIChannelNumber)midiChannelNum enabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled
{
  NSArray *v9;
  NSArray *v10;
  MIDICIProfileState *v11;
  MIDICIProfileState *v12;
  objc_super v14;

  v9 = enabled;
  v10 = disabled;
  v14.receiver = self;
  v14.super_class = (Class)MIDICIProfileState;
  v11 = -[MIDICIProfileState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->midiChannel = midiChannelNum;
    objc_storeStrong((id *)&v11->enabledProfiles, enabled);
    objc_storeStrong((id *)&v12->disabledProfiles, disabled);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MIDICIProfileState;
  -[MIDICIProfileState dealloc](&v2, sel_dealloc);
}

- (MIDICIProfileState)initWithCoder:(id)a3
{
  id v4;
  MIDICIProfileState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *enabledProfiles;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *disabledProfiles;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MIDICIProfileState;
  v5 = -[MIDICIProfileState init](&v19, sel_init);
  if (v5)
  {
    v5->midiChannel = objc_msgSend(v4, "decodeIntForKey:", CFSTR("midiChannel"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("enabledProfiles"));
    v10 = objc_claimAutoreleasedReturnValue();
    enabledProfiles = v5->enabledProfiles;
    v5->enabledProfiles = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObjects:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("disabledProfiles"));
    v16 = objc_claimAutoreleasedReturnValue();
    disabledProfiles = v5->disabledProfiles;
    v5->disabledProfiles = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->midiChannel, CFSTR("midiChannel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->enabledProfiles, CFSTR("enabledProfiles"));
  objc_msgSend(v4, "encodeObject:forKey:", self->disabledProfiles, CFSTR("disabledProfiles"));

}

- (id)description
{
  NSArray *disabledProfiles;
  NSArray *enabledProfiles;

  disabledProfiles = (NSArray *)CFSTR("NONE");
  enabledProfiles = self->enabledProfiles;
  if (!enabledProfiles)
    enabledProfiles = (NSArray *)CFSTR("NONE");
  if (self->disabledProfiles)
    disabledProfiles = self->disabledProfiles;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MIDICIProfileState(%p) midiChannel:0x%x enabledProfiles: %@ disabledProfiles: %@>"), self, self->midiChannel, enabledProfiles, disabledProfiles);
}

- (void)updateWithEnabledProfiles:(id)a3 disabledProfiles:(id)a4
{
  NSArray *v6;
  NSArray *v7;
  NSArray *enabledProfiles;
  NSArray *disabledProfiles;
  NSArray *v10;

  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  enabledProfiles = self->enabledProfiles;
  self->enabledProfiles = v6;
  v10 = v6;

  disabledProfiles = self->disabledProfiles;
  self->disabledProfiles = v7;

}

- (id)bytesWithChannel:(unsigned __int8)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  char v27;
  unsigned __int8 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v27 = -[NSArray count](self->enabledProfiles, "count");
  v26 = -[NSArray count](self->disabledProfiles, "count");
  objc_msgSend(v4, "appendBytes:length:", &v28, 1);
  objc_msgSend(v4, "appendBytes:length:", &v27, 1);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->enabledProfiles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        objc_msgSend(v9, "profileID");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v10, "bytes"), 5);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "appendBytes:length:", &v26, 1);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->disabledProfiles;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        objc_msgSend(v15, "profileID", (_QWORD)v18);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v16, "bytes"), 5);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    }
    while (v12);
  }

  return v4;
}

- (MIDIChannelNumber)midiChannel
{
  return self->midiChannel;
}

- (NSArray)enabledProfiles
{
  return self->enabledProfiles;
}

- (NSArray)disabledProfiles
{
  return self->disabledProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disabledProfiles, 0);
  objc_storeStrong((id *)&self->enabledProfiles, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)description
{
  return CFSTR("MIDI-CI Profile State");
}

@end
