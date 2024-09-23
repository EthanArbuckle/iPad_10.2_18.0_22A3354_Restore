@implementation CSFAudioDeviceInfo

- (CSFAudioDeviceInfo)initWithRecordDeviceInfo:(id)a3 playbackRoute:(id)a4 playbackDeviceTypeList:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSFAudioDeviceInfo *v11;
  uint64_t v12;
  CSFAudioRecordDeviceInfo *recordDeviceInfo;
  uint64_t v14;
  NSString *playbackRoute;
  uint64_t v16;
  NSArray *playbackDeviceTypeList;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSFAudioDeviceInfo;
  v11 = -[CSFAudioDeviceInfo init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    recordDeviceInfo = v11->_recordDeviceInfo;
    v11->_recordDeviceInfo = (CSFAudioRecordDeviceInfo *)v12;

    v14 = objc_msgSend(v9, "copy");
    playbackRoute = v11->_playbackRoute;
    v11->_playbackRoute = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    playbackDeviceTypeList = v11->_playbackDeviceTypeList;
    v11->_playbackDeviceTypeList = (NSArray *)v16;

  }
  return v11;
}

- (CSFAudioDeviceInfo)initWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  CSFAudioRecordDeviceInfo *v6;
  const char *string;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CSFAudioDeviceInfo *v12;

  v4 = a3;
  xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRecordDeviceInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[CSFAudioRecordDeviceInfo initWithXPCObject:]([CSFAudioRecordDeviceInfo alloc], "initWithXPCObject:", v5);
  else
    v6 = 0;
  string = xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyPlaybackRoute);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  xpc_dictionary_get_array(v4, (const char *)kXPCEncodeKeyPlaybackDeviceType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v10, "_cs_initWithXPCObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[CSFAudioDeviceInfo initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:](self, "initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:", v6, v8, v11);

  return v12;
}

- (id)xpcObject
{
  xpc_object_t v3;
  NSString *playbackRoute;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[3];

  keys[2] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = (char *)kXPCEncodeKeyRecordDeviceInfo;
  keys[1] = (char *)kXPCEncodeKeyPlaybackDeviceType;
  -[CSFAudioRecordDeviceInfo xpcObject](self->_recordDeviceInfo, "xpcObject");
  values[0] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  -[NSArray _cs_xpcObject](self->_playbackDeviceTypeList, "_cs_xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v3 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  playbackRoute = self->_playbackRoute;
  if (playbackRoute)
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyPlaybackRoute, -[NSString UTF8String](playbackRoute, "UTF8String"));
  for (i = 1; i != -1; --i)

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)CSFAudioDeviceInfo;
  -[CSFAudioDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFAudioRecordDeviceInfo description](self->_recordDeviceInfo, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {recordDeviceInfo = %@, playbackRoute = %@, playbackDevices = %@"), v4, v5, self->_playbackRoute, self->_playbackDeviceTypeList);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  CSFAudioRecordDeviceInfo *recordDeviceInfo;
  id v5;

  recordDeviceInfo = self->_recordDeviceInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordDeviceInfo, CFSTR("recordDeviceInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackRoute, CFSTR("playbackRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackDeviceTypeList, CFSTR("playbackDeviceTypeList"));

}

- (CSFAudioDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CSFAudioDeviceInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordDeviceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackDeviceTypeList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CSFAudioDeviceInfo initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:](self, "initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:", v5, v6, v7);
  return v8;
}

- (CSFAudioRecordDeviceInfo)recordDeviceInfo
{
  return self->_recordDeviceInfo;
}

- (NSString)playbackRoute
{
  return self->_playbackRoute;
}

- (NSArray)playbackDeviceTypeList
{
  return self->_playbackDeviceTypeList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackDeviceTypeList, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordDeviceInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
