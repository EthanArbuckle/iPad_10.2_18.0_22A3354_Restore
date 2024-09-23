@implementation MRVirtualVoiceInputDeviceDescriptor

- (MRVirtualVoiceInputDeviceDescriptor)initWithData:(id)a3
{
  id v4;
  _MRVoiceInputDeviceDescriptorProtobuf *v5;
  MRVirtualVoiceInputDeviceDescriptor *v6;

  v4 = a3;
  v5 = -[_MRVoiceInputDeviceDescriptorProtobuf initWithData:]([_MRVoiceInputDeviceDescriptorProtobuf alloc], "initWithData:", v4);

  v6 = -[MRVirtualVoiceInputDeviceDescriptor initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (MRVirtualVoiceInputDeviceDescriptor)initWithProtobuf:(id)a3
{
  id v4;
  MRVirtualVoiceInputDeviceDescriptor *v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *defaultFormat;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRVirtualVoiceInputDeviceDescriptor;
  v5 = -[MRVirtualVoiceInputDeviceDescriptor init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v4, "supportedFormatsCount"))
    {
      v7 = 0;
      v8 = 1;
      do
      {
        objc_msgSend(v4, "supportedFormatsAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v9, "formatSettingsPlistData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "propertyListWithData:options:format:error:", v11, 0, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        v7 = v8;
      }
      while (objc_msgSend(v4, "supportedFormatsCount") > (unint64_t)v8++);
    }
    objc_storeStrong((id *)&v5->_supportedFormats, v6);
    objc_msgSend(v4, "defaultFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "hasFormatSettingsPlistData") & 1) != 0)
    {
      v15 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v14, "formatSettingsPlistData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "propertyListWithData:options:format:error:", v16, 0, 0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      defaultFormat = v5->_defaultFormat;
      v5->_defaultFormat = (NSDictionary *)v17;

    }
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, supportedFormats = %@, defaultFormat = %@>"), objc_opt_class(), self, self->_supportedFormats, self->_defaultFormat);
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRVirtualVoiceInputDeviceDescriptor protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRVoiceInputDeviceDescriptorProtobuf)protobuf
{
  _MRVoiceInputDeviceDescriptorProtobuf *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _MRAudioFormatSettingsProtobuf *v10;
  void *v11;
  _MRAudioFormatSettingsProtobuf *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_MRVoiceInputDeviceDescriptorProtobuf);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_supportedFormats;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8), 200, 0, 0, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
        -[_MRAudioFormatSettingsProtobuf setFormatSettingsPlistData:](v10, "setFormatSettingsPlistData:", v9);
        -[_MRVoiceInputDeviceDescriptorProtobuf addSupportedFormats:](v3, "addSupportedFormats:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_defaultFormat, 200, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
  -[_MRAudioFormatSettingsProtobuf setFormatSettingsPlistData:](v12, "setFormatSettingsPlistData:", v11);
  -[_MRVoiceInputDeviceDescriptorProtobuf setDefaultFormat:](v3, "setDefaultFormat:", v12);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRVirtualVoiceInputDeviceDescriptor _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MRVirtualVoiceInputDeviceDescriptor _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc_init(a4);
  v6 = -[NSArray copy](self->_supportedFormats, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDictionary copy](self->_defaultFormat, "copy");
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (NSDictionary)defaultFormat
{
  return self->_defaultFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFormat, 0);
  objc_storeStrong((id *)&self->_supportedFormats, 0);
}

@end
