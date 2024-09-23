@implementation CMIOExtensionStreamCustomClockConfiguration

+ (CMIOExtensionStreamCustomClockConfiguration)customClockConfigurationWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  CMTime v14;

  v7 = *(_QWORD *)&numberOfAveragesForRateSmoothing;
  v8 = *(_QWORD *)&numberOfEventsForRateSmoothing;
  v12 = objc_alloc((Class)objc_opt_class());
  v14 = *getTimeCallMinimumInterval;
  return (CMIOExtensionStreamCustomClockConfiguration *)(id)objc_msgSend(v12, "initWithClockName:sourceIdentifier:getTimeCallMinimumInterval:numberOfEventsForRateSmoothing:numberOfAveragesForRateSmoothing:", clockName, sourceIdentifier, &v14, v8, v7);
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing
{
  char *v12;
  CMTimeEpoch epoch;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMIOExtensionStreamCustomClockConfiguration;
  v12 = -[CMIOExtensionStreamCustomClockConfiguration init](&v18, sel_init);
  if (v12)
  {
    if (clockName)
    {
      *((_QWORD *)v12 + 1) = -[NSString copy](clockName, "copy");
      if (sourceIdentifier)
      {
        *((_QWORD *)v12 + 2) = -[NSUUID copy](sourceIdentifier, "copy");
        epoch = getTimeCallMinimumInterval->epoch;
        *(_OWORD *)(v12 + 24) = *(_OWORD *)&getTimeCallMinimumInterval->value;
        *((_QWORD *)v12 + 5) = epoch;
        if (numberOfEventsForRateSmoothing)
        {
          *((_DWORD *)v12 + 12) = numberOfEventsForRateSmoothing;
          *((_DWORD *)v12 + 13) = numberOfAveragesForRateSmoothing;
          return (CMIOExtensionStreamCustomClockConfiguration *)v12;
        }
        v14 = (void *)MEMORY[0x24BDBCE88];
        v15 = *MEMORY[0x24BDBCAB8];
        v16 = CFSTR("Invalid number of events for rate smoothing");
      }
      else
      {
        v14 = (void *)MEMORY[0x24BDBCE88];
        v15 = *MEMORY[0x24BDBCAB8];
        v16 = CFSTR("Invalid source identifier");
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB8];
      v16 = CFSTR("Invalid clock name");
    }
    objc_msgSend(v14, "raise:format:", v15, v16);

    return 0;
  }
  return (CMIOExtensionStreamCustomClockConfiguration *)v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionStreamCustomClockConfiguration;
  -[CMIOExtensionStreamCustomClockConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v7;
  unsigned int numberOfEventsForRateSmoothing;
  unsigned int numberOfAveragesForRateSmoothing;
  $95D729B680665BEAEFA1D6FCA8238556 getTimeCallMinimumInterval;
  CMTime time2;
  uint64_t v13;
  uint64_t v14;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v13 = v3;
    v14 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v7 = -[NSString isEqualToString:](self->_clockName, "isEqualToString:", objc_msgSend(a3, "clockName"));
    if (v7)
    {
      v7 = -[NSUUID isEqual:](self->_sourceIdentifier, "isEqual:", objc_msgSend(a3, "sourceIdentifier"));
      if (v7)
      {
        if (a3)
          objc_msgSend(a3, "getTimeCallMinimumInterval");
        else
          memset(&time2, 0, sizeof(time2));
        getTimeCallMinimumInterval = self->_getTimeCallMinimumInterval;
        if (!CMTimeCompare((CMTime *)&getTimeCallMinimumInterval, &time2))
        {
          numberOfEventsForRateSmoothing = self->_numberOfEventsForRateSmoothing;
          if (numberOfEventsForRateSmoothing == objc_msgSend(a3, "numberOfEventsForRateSmoothing"))
          {
            numberOfAveragesForRateSmoothing = self->_numberOfAveragesForRateSmoothing;
            LOBYTE(v7) = numberOfAveragesForRateSmoothing == objc_msgSend(a3, "numberOfAveragesForRateSmoothing");
            return v7;
          }
        }
LABEL_12:
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = -[CMIOExtensionStreamCustomClockConfiguration copyXPCDictionary](self, "copyXPCDictionary");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("streamCustomClockConfiguration"));
    xpc_release(v6);
  }
  else
  {
    v7 = CMIOLog();
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionStreamCustomClockConfiguration encodeWithCoder:].cold.1();
    }
  }
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithCoder:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("streamCustomClockConfiguration"));
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ nil xpc object"), self);
  return -[CMIOExtensionStreamCustomClockConfiguration initWithXPCDictionary:](self, "initWithXPCDictionary:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMIOExtensionStreamCustomClockConfiguration *v4;
  NSString *clockName;
  NSUUID *sourceIdentifier;
  uint64_t numberOfEventsForRateSmoothing;
  uint64_t numberOfAveragesForRateSmoothing;
  $95D729B680665BEAEFA1D6FCA8238556 getTimeCallMinimumInterval;

  v4 = +[CMIOExtensionStreamCustomClockConfiguration allocWithZone:](CMIOExtensionStreamCustomClockConfiguration, "allocWithZone:", a3);
  clockName = self->_clockName;
  sourceIdentifier = self->_sourceIdentifier;
  numberOfEventsForRateSmoothing = self->_numberOfEventsForRateSmoothing;
  numberOfAveragesForRateSmoothing = self->_numberOfAveragesForRateSmoothing;
  getTimeCallMinimumInterval = self->_getTimeCallMinimumInterval;
  return -[CMIOExtensionStreamCustomClockConfiguration initWithClockName:sourceIdentifier:getTimeCallMinimumInterval:numberOfEventsForRateSmoothing:numberOfAveragesForRateSmoothing:](v4, "initWithClockName:sourceIdentifier:getTimeCallMinimumInterval:numberOfEventsForRateSmoothing:numberOfAveragesForRateSmoothing:", clockName, sourceIdentifier, &getTimeCallMinimumInterval, numberOfEventsForRateSmoothing, numberOfAveragesForRateSmoothing);
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "clockName", -[NSString UTF8String](self->_clockName, "UTF8String"));
  xpc_dictionary_set_string(v3, "sourceIdentifier", (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", -[NSUUID UUIDString](self->_sourceIdentifier, "UUIDString")), "UTF8String"));
  xpc_dictionary_set_data(v3, "getTimeCallMinimumInterval", &self->_getTimeCallMinimumInterval, 0x18uLL);
  xpc_dictionary_set_uint64(v3, "numberOfEventsForRateSmoothing", self->_numberOfEventsForRateSmoothing);
  xpc_dictionary_set_uint64(v3, "numberOfAveragesForRateSmoothing", self->_numberOfAveragesForRateSmoothing);
  return v3;
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithXPCDictionary:(id)a3
{
  const char *string;
  const __CFString *v6;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *data;
  uint64_t uint64;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  size_t length;
  __int128 v18;
  uint64_t v19;

  if (a3)
  {
    v18 = *MEMORY[0x24BDC0D40];
    v19 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    string = xpc_dictionary_get_string(a3, "clockName");
    if (string)
      v6 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", string, 4);
    else
      v6 = CFSTR("unknown");
    v8 = xpc_dictionary_get_string(a3, "sourceIdentifier");
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4);
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
    }
    else
    {
      v10 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    }
    v11 = v10;
    length = 24;
    data = xpc_dictionary_get_data(a3, "getTimeCallMinimumInterval", &length);
    if (data)
    {
      v18 = *(_OWORD *)data;
      v19 = data[2];
    }
    uint64 = xpc_dictionary_get_uint64(a3, "numberOfEventsForRateSmoothing");
    v14 = xpc_dictionary_get_uint64(a3, "numberOfAveragesForRateSmoothing");
    v15 = v18;
    v16 = v19;
    return -[CMIOExtensionStreamCustomClockConfiguration initWithClockName:sourceIdentifier:getTimeCallMinimumInterval:numberOfEventsForRateSmoothing:numberOfAveragesForRateSmoothing:](self, "initWithClockName:sourceIdentifier:getTimeCallMinimumInterval:numberOfEventsForRateSmoothing:numberOfAveragesForRateSmoothing:", v6, v11, &v15, uint64, v14);
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
}

- (NSString)clockName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)sourceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (CMTime)getTimeCallMinimumInterval
{
  CMTime *result;

  objc_copyStruct(retstr, &self->_getTimeCallMinimumInterval, 24, 1, 0);
  return result;
}

- (uint32_t)numberOfEventsForRateSmoothing
{
  return self->_numberOfEventsForRateSmoothing;
}

- (uint32_t)numberOfAveragesForRateSmoothing
{
  return self->_numberOfAveragesForRateSmoothing;
}

- (void)encodeWithCoder:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
