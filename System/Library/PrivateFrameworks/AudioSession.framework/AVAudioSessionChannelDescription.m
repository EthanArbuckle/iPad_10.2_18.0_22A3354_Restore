@implementation AVAudioSessionChannelDescription

+ (id)privateCreateArray:(id)a3 portUID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (v5 && (v7 = objc_msgSend(v5, "count")) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 + 1;
      v12 = +[AVAudioSessionChannelDescription privateCreate:portUID:channelNumber:](AVAudioSessionChannelDescription, "privateCreate:portUID:channelNumber:", v10, v6, v9 + 1);
      if (v12)
        objc_msgSend(v8, "insertObject:atIndex:", v12, v9);

      ++v9;
    }
    while (v7 != v11);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)privateCreate:(id)a3 portUID:(id)a4 channelNumber:(unsigned int)a5
{
  id v7;
  as::client *v8;
  as::client *v9;
  AVAudioSessionChannelDescription *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (as::client *)a4;
  v9 = v8;
  if (v7)
  {
    v10 = objc_alloc_init(AVAudioSessionChannelDescription);
    v11 = -[AVAudioSessionChannelDescription privateGetImplementation](v10, "privateGetImplementation");
    v12 = (id)*MEMORY[0x1E0D49E68];
    objc_msgSend(v7, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)*MEMORY[0x1E0D49E60];
    objc_msgSend(v7, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v13);
      v17 = *(void **)v11;
      *(_QWORD *)v11 = v16;

    }
    if (v9)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v9);
      v19 = *(void **)(v11 + 8);
      *(_QWORD *)(v11 + 8) = v18;

    }
    if (v15)
      *(_DWORD *)(v11 + 20) = objc_msgSend(v15, "unsignedIntValue");
    *(_DWORD *)(v11 + 16) = a5;

  }
  else
  {
    v20 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v8));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "AVAudioSessionChannelImpl.mm";
      v24 = 1024;
      v25 = 133;
      _os_log_impl(&dword_19EF50000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected nil channel description", (uint8_t *)&v22, 0x12u);
    }
    v10 = 0;
  }

  return v10;
}

- (ChannelDescriptionImpl)privateGetImplementation
{
  return (ChannelDescriptionImpl *)self->_impl;
}

- (AVAudioSessionChannelDescription)init
{
  AVAudioSessionChannelDescription *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioSessionChannelDescription;
  v2 = -[AVAudioSessionChannelDescription init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_impl = v3;
  }
  return v2;
}

- (void)dealloc
{
  id *impl;
  objc_super v4;

  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A1AF1C48](impl, 0x1080C40CC6EE3FDLL);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionChannelDescription;
  -[AVAudioSessionChannelDescription dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  AVAudioSessionChannelDescription *v4;
  AVAudioSessionChannelDescription *v5;
  BOOL v6;

  v4 = (AVAudioSessionChannelDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[AVAudioSessionChannelDescription isEqualToChannel:](self, "isEqualToChannel:", v5);

  return v6;
}

- (BOOL)isEqualToChannel:(id)a3
{
  AVAudioSessionChannelDescription *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  NSUInteger v11;
  BOOL v12;

  v4 = (AVAudioSessionChannelDescription *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    -[AVAudioSessionChannelDescription channelName](self, "channelName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionChannelDescription channelName](v4, "channelName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0
      && (-[AVAudioSessionChannelDescription owningPortUID](self, "owningPortUID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[AVAudioSessionChannelDescription owningPortUID](v4, "owningPortUID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToString:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      v11 = -[AVAudioSessionChannelDescription channelNumber](self, "channelNumber");
      v12 = v11 == -[AVAudioSessionChannelDescription channelNumber](v4, "channelNumber");
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)channelName
{
  return (NSString *)*(id *)self->_impl;
}

- (NSString)owningPortUID
{
  return (NSString *)*((id *)self->_impl + 1);
}

- (NSUInteger)channelNumber
{
  return *((unsigned int *)self->_impl + 4);
}

- (AudioChannelLabel)channelLabel
{
  return *((_DWORD *)self->_impl + 5);
}

- (id)description
{
  _QWORD *impl;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  impl = self->_impl;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, name = %@; label = %u (0x%x); number = %d; port UID = %@>"),
    v6,
    self,
    *impl,
    *((unsigned int *)impl + 5),
    *((unsigned int *)impl + 5),
    *((unsigned int *)impl + 4),
    impl[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
