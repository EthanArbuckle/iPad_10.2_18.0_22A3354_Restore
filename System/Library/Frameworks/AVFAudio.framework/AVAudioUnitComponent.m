@implementation AVAudioUnitComponent

- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3
{
  AVAudioUnitComponent *v4;
  AVAudioUnitComponentImpl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAudioUnitComponent;
  v4 = -[AVAudioUnitComponent init](&v7, sel_init);
  if (v4)
  {
    v5 = (AVAudioUnitComponentImpl *)operator new();
    AVAudioUnitComponentImpl::AVAudioUnitComponentImpl(v5, a3, 0);
    v4->_impl = v5;
  }
  else
  {
    MEMORY[8] = 0;
  }
  return v4;
}

- (AVAudioUnitComponent)initWithComponentDescription:(AudioComponentDescription *)a3 withAVAUManagerImpl:(AVAudioUnitComponentManagerImpl *)a4
{
  AVAudioUnitComponent *v6;
  AVAudioUnitComponentImpl *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAudioUnitComponent;
  v6 = -[AVAudioUnitComponent init](&v9, sel_init);
  if (v6)
  {
    v7 = (AVAudioUnitComponentImpl *)operator new();
    AVAudioUnitComponentImpl::AVAudioUnitComponentImpl(v7, a3, a4);
    v6->_impl = v7;
  }
  else
  {
    MEMORY[8] = 0;
  }
  return v6;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitComponent;
  -[AVAudioUnitComponent dealloc](&v4, sel_dealloc);
}

- (void)localeChanged
{
  AVAudioUnitComponentImpl::FetchLocalizedStandardTags((id *)self->_impl);
}

- (AudioComponent)audioComponent
{
  return (AudioComponent)*((_QWORD *)self->_impl + 1);
}

- (NSString)name
{
  return (NSString *)*((_QWORD *)self->_impl + 6);
}

- (NSString)typeName
{
  return (NSString *)-[AVAudioUnitComponent GetTypeName:](self, "GetTypeName:", *((unsigned int *)self->_impl + 4));
}

- (NSString)localizedTypeName
{
  void *impl;
  const __CFString *v3;
  NSString *result;
  __CFBundle *BundleWithIdentifier;

  impl = self->_impl;
  v3 = -[AVAudioUnitComponent typeName](self, "typeName");
  result = (NSString *)*((_QWORD *)impl + 8);
  if (v3 && !result)
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.audio.units.Components"));
    if (BundleWithIdentifier)
    {
      result = (NSString *)CFBundleCopyLocalizedString(BundleWithIdentifier, v3, v3, CFSTR("AudioUnitTypes"));
      *((_QWORD *)impl + 8) = result;
    }
    else
    {
      return (NSString *)*((_QWORD *)impl + 8);
    }
  }
  return result;
}

- (NSString)manufacturerName
{
  return (NSString *)*((_QWORD *)self->_impl + 7);
}

- (NSString)versionString
{
  NSString *result;

  result = (NSString *)*((_QWORD *)self->_impl + 5);
  if (!result)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-"));
  return result;
}

- (NSURL)iconURL
{
  NSURL *result;

  result = (NSURL *)*((_QWORD *)self->_impl + 19);
  if (!result)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3BED4C0);
  return result;
}

- (UIImage)icon
{
  return AudioComponentCopyIcon(*((AudioComponent *)self->_impl + 1));
}

- (NSArray)userTagNames
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *((_QWORD *)self->_impl + 11));
}

- (void)setUserTagNames:(NSArray *)userTagNames
{
  NSArray *v3;
  unsigned int *impl;
  NSArray *v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  _xpc_connection_s *v10;
  xpc_object_t v11;
  const __CFData *Data;
  const __CFData *v13;
  CFIndex Length;
  const UInt8 *BytePtr;
  _xpc_connection_s *v16;
  void *v17;
  uint64_t v18;
  NSArray *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**handler)(XPC_Dictionary *__hidden);
  xpc_object_t xdict;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;

  v3 = userTagNames;
  if (userTagNames)
  {
    if (-[NSArray count](userTagNames, "count"))
    {
      v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
      if ((-[NSArray isSubsetOfSet:](v3, "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *((_QWORD *)self->_impl + 11))) & 1) != 0)return;
      if (v3)
        v3 = (NSArray *)-[NSArray allObjects](v3, "allObjects");
    }
    else
    {
      v3 = 0;
    }
  }
  impl = (unsigned int *)self->_impl;
  v6 = (NSArray *)*((_QWORD *)impl + 11);
  if (v6 != v3)
  {
    if (!v6)
    {
      v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *((_QWORD *)impl + 11) = v6;
    }
    -[NSArray removeAllObjects](v6, "removeAllObjects");
    if (-[NSArray count](v3, "count"))
      objc_msgSend(*((id *)impl + 11), "addObjectsFromArray:", v3);
    v7 = operator new();
    v8 = xpc_connection_create("com.apple.audio.ComponentTagHelper", *((dispatch_queue_t *)impl + 14));
    *(_BYTE *)(v7 + 16) = 1;
    *(_QWORD *)v7 = &off_1E3BE6628;
    *(_QWORD *)(v7 + 8) = v8;
    *(_QWORD *)(v7 + 24) = 0;
    *(_QWORD *)(v7 + 40) = 0;
    if (v8)
    {
      handler = (void (**)(XPC_Dictionary *__hidden))MEMORY[0x1E0C809B0];
      xdict = (xpc_object_t)0x40000000;
      v26 = ___ZN14XPC_Connection10InitializeEv_block_invoke;
      v27 = &__block_descriptor_tmp_1455;
      v28 = v7;
      xpc_connection_set_event_handler(v8, &handler);
      xpc_connection_set_context(*(xpc_connection_t *)(v7 + 8), (void *)v7);
      v9 = *(_xpc_connection_s **)(v7 + 8);
      if (v9)
      {
        xpc_connection_set_finalizer_f(v9, (xpc_finalizer_t)XPC_Connection::Finalize);
        v10 = *(_xpc_connection_s **)(v7 + 8);
        if (v10)
          xpc_connection_resume(v10);
      }
    }
    v11 = xpc_dictionary_create(0, 0, 0);
    LOBYTE(v26) = 1;
    handler = &off_1E3BE6650;
    xdict = v11;
    if (v11)
    {
      xpc_dictionary_set_uint64(v11, "Request", 1uLL);
      if (xdict)
      {
        xpc_dictionary_set_uint64(xdict, "type", impl[4]);
        if (xdict)
        {
          xpc_dictionary_set_uint64(xdict, "subtype", impl[5]);
          if (xdict)
          {
            xpc_dictionary_set_uint64(xdict, "manufacturer", impl[6]);
            if (xdict)
              xpc_dictionary_set_uint64(xdict, "version", impl[9]);
          }
        }
      }
    }
    Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *((CFPropertyListRef *)impl + 11), kCFPropertyListXMLFormat_v1_0, 0, 0);
    v13 = Data;
    if (Data)
    {
      Length = CFDataGetLength(Data);
      BytePtr = CFDataGetBytePtr(v13);
      if (xdict)
        xpc_dictionary_set_data(xdict, "UserTags", BytePtr, Length);
      v16 = *(_xpc_connection_s **)(v7 + 8);
      if (v16)
        xpc_connection_send_message(v16, xdict);
      CFRelease(v13);
    }
    v17 = *(void **)(v7 + 8);
    if (v17)
    {
      atomic_store(0, (unsigned __int8 *)(v7 + 16));
      xpc_release(v17);
    }
    XPC_Object::~XPC_Object((XPC_Object *)&handler);
    impl = (unsigned int *)self->_impl;
  }
  v18 = *((_QWORD *)impl + 15);
  v19 = v3;
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(v18 + 16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isSubsetOfSet:", v21))
    {
      NSLog(CFSTR("No changes"));
    }
    else
    {
      NSLog(CFSTR("New tags found, add it to the allTags"));
      objc_msgSend(v21, "unionSet:", v20);
      objc_msgSend(*(id *)(v18 + 16), "removeAllObjects");
      v22 = *(void **)(v18 + 16);
      objc_msgSend(v21, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObjectsFromArray:", v23);

    }
  }

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVAudioUnitComponentTagsDidChangeNotification"), self);
}

- (NSArray)allTagNames
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *((_QWORD *)self->_impl + 10));
}

- (NSURL)componentURL
{
  NSURL *result;

  result = (NSURL *)*((_QWORD *)self->_impl + 12);
  if (!result)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3BED4C0);
  return result;
}

- (NSArray)availableArchitectures
{
  void *impl;
  const __CFURL *v5;

  impl = self->_impl;
  if (*((_QWORD *)impl + 13))
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  v5 = (const __CFURL *)*((_QWORD *)impl + 12);
  if (v5 && (*((_QWORD *)self->_impl + 13) = CFBundleCopyExecutableArchitecturesForURL(v5)) != 0)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSUInteger)version
{
  return *((unsigned int *)self->_impl + 9);
}

- (BOOL)hasCustomView
{
  return *((_BYTE *)self->_impl + 144);
}

- (BOOL)passesAUVal
{
  void *impl;

  impl = self->_impl;
  if (*((_DWORD *)impl + 32) == 1)
    return 1;
  AudioComponentValidate(*((AudioComponent *)impl + 1), 0, (AudioComponentValidationResult *)impl + 32);
  return *((_DWORD *)impl + 32) == 1;
}

- (BOOL)isSandboxSafe
{
  return *((_BYTE *)self->_impl + 72);
}

- (BOOL)hasMIDIInput
{
  unsigned int v2;

  v2 = *((_DWORD *)self->_impl + 4) - 1635085670;
  return (v2 < 0x10) & (0x8009u >> v2);
}

- (BOOL)hasMIDIOutput
{
  unsigned int v2;

  v2 = *((_DWORD *)self->_impl + 4) - 1635085670;
  return (v2 < 0x10) & (0x8009u >> v2);
}

- (NSDictionary)configurationDictionary
{
  _BYTE *impl;
  void *v4;

  impl = self->_impl;
  if (!impl[132])
    AVAudioUnitComponentImpl::FetchConfigurationDictionary((AudioComponent *)self->_impl);
  if (!*((_QWORD *)impl + 17))
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v4 = self->_impl;
  if (!*((_BYTE *)v4 + 132))
    AVAudioUnitComponentImpl::FetchConfigurationDictionary((AudioComponent *)v4);
  return (NSDictionary *)*((_QWORD *)v4 + 17);
}

- (BOOL)validateWithResults:(id)a3 inCompletionHandler:(id)a4
{
  OpaqueAudioComponent *v4;
  _QWORD inCompletionHandler[5];

  v4 = (OpaqueAudioComponent *)*((_QWORD *)self->_impl + 1);
  inCompletionHandler[0] = MEMORY[0x1E0C809B0];
  inCompletionHandler[1] = 3221225472;
  inCompletionHandler[2] = __64__AVAudioUnitComponent_validateWithResults_inCompletionHandler___block_invoke;
  inCompletionHandler[3] = &unk_1E3BEB538;
  inCompletionHandler[4] = a4;
  return AudioComponentValidateWithResults(v4, (CFDictionaryRef)a3, inCompletionHandler) == 0;
}

- (AudioComponentDescription)audioComponentDescription
{
  *retstr = *(AudioComponentDescription *)(*(_QWORD *)&self->componentManufacturer + 16);
  return self;
}

- (BOOL)supportsNumberInputChannels:(NSInteger)numInputChannels outputChannels:(NSInteger)numOutputChannels
{
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", numInputChannels);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", numOutputChannels);
  v8 = -[AVAudioUnitComponent configurationDictionary](self, "configurationDictionary");
  if (v8
    && (v9 = v8,
        v10 = -[NSDictionary objectForKey:](v8, "objectForKey:", CFSTR("InitialInputs")),
        v11 = -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("InitialOutputs")),
        v10)
    && (v12 = (void *)v11) != 0
    && objc_msgSend(v10, "containsObject:", v6))
  {
    return objc_msgSend(v12, "containsObject:", v7);
  }
  else
  {
    return 0;
  }
}

- (id)GetTypeName:(unsigned int)a3
{
  if ((int)a3 > 1635086187)
  {
    if ((int)a3 <= 1635086950)
    {
      switch(a3)
      {
        case 0x61756F6Cu:
          return CFSTR("Offline Effect");
        case 0x61756F75u:
          return CFSTR("Output");
        case 0x6175706Eu:
          return CFSTR("Panner");
      }
    }
    else if ((int)a3 > 1635086956)
    {
      if (a3 == 1635086957)
        return CFSTR("Remote Music Effect");
      if (a3 == 1635086968)
        return CFSTR("Remote Effect");
    }
    else
    {
      if (a3 == 1635086951)
        return CFSTR("Remote Generator");
      if (a3 == 1635086953)
        return CFSTR("Remote Instrument");
    }
  }
  else if ((int)a3 <= 1635085669)
  {
    switch(a3)
    {
      case 0x61756663u:
        return CFSTR("Format Converter");
      case 0x61756678u:
        return CFSTR("Effect");
      case 0x6175676Eu:
        return CFSTR("Generator");
    }
  }
  else if ((int)a3 > 1635085684)
  {
    if (a3 == 1635085685)
      return CFSTR("Music Device");
    if (a3 == 1635085688)
      return CFSTR("Mixer");
  }
  else
  {
    if (a3 == 1635085670)
      return CFSTR("Music Effect");
    if (a3 == 1635085673)
      return CFSTR("MIDI Processor");
  }
  return CFSTR("Unknown");
}

- (BOOL)isComponentDescriptionMatch:(AudioComponentDescription *)a3
{
  if (self)
    -[AVAudioUnitComponent audioComponentDescription](self, "audioComponentDescription");
  return !a3->componentType && !a3->componentSubType && a3->componentManufacturer == 0;
}

uint64_t __64__AVAudioUnitComponent_validateWithResults_inCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
