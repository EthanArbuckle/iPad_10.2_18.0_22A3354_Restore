@implementation CMIOExtensionStream

+ (id)internalProperties
{
  if (internalProperties_onceToken != -1)
    dispatch_once(&internalProperties_onceToken, &__block_literal_global);
  return (id)internalProperties_gInternalStreamProperties;
}

uint64_t __41__CMIOExtensionStream_internalProperties__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", 0x250459618, 0x250459638, 0x250459658, 0x250459678, 0x250459698, 0x2504596B8, 0);
  internalProperties_gInternalStreamProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  return 0;
}

+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source
{
  return (CMIOExtensionStream *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalizedName:streamID:direction:clockType:source:", localizedName, streamID, direction, clockType, source);
}

+ (CMIOExtensionStream)streamWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source
{
  return (CMIOExtensionStream *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalizedName:streamID:direction:customClockConfiguration:source:", localizedName, streamID, direction, customClockConfiguration, source);
}

- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction clockType:(CMIOExtensionStreamClockType)clockType source:(id)source
{
  return (CMIOExtensionStream *)-[CMIOExtensionStream _initWithLocalizedName:streamID:direction:clockType:customClockConfiguration:source:](self, "_initWithLocalizedName:streamID:direction:clockType:customClockConfiguration:source:", localizedName, streamID, direction, clockType, 0, source);
}

- (CMIOExtensionStream)initWithLocalizedName:(NSString *)localizedName streamID:(NSUUID *)streamID direction:(CMIOExtensionStreamDirection)direction customClockConfiguration:(CMIOExtensionStreamCustomClockConfiguration *)customClockConfiguration source:(id)source
{
  return (CMIOExtensionStream *)-[CMIOExtensionStream _initWithLocalizedName:streamID:direction:clockType:customClockConfiguration:source:](self, "_initWithLocalizedName:streamID:direction:clockType:customClockConfiguration:source:", localizedName, streamID, direction, 2, customClockConfiguration, source);
}

- (id)_initWithLocalizedName:(id)a3 streamID:(id)a4 direction:(int64_t)a5 clockType:(int64_t)a6 customClockConfiguration:(id)a7 source:(id)a8
{
  char *v14;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;

  if (a3 && a4 && a8 && (a6 != 2 || a7))
  {
    v24.receiver = self;
    v24.super_class = (Class)CMIOExtensionStream;
    v14 = -[CMIOExtensionStream init](&v24, sel_init);
    if (v14)
    {
      *((_QWORD *)v14 + 21) = objc_msgSend(a3, "copy");
      *((_QWORD *)v14 + 22) = objc_msgSend(a4, "copy");
      *((_QWORD *)v14 + 23) = a5;
      *((_QWORD *)v14 + 24) = a6;
      *((_QWORD *)v14 + 25) = objc_msgSend(a7, "copy");
      objc_storeWeak((id *)v14 + 19, a8);
      *((_DWORD *)v14 + 2) = 0;
      *((_QWORD *)v14 + 2) = objc_opt_new();
      *((_QWORD *)v14 + 3) = -1;
      *((_QWORD *)v14 + 4) = -1;
      *((_QWORD *)v14 + 15) = objc_opt_new();
      *((_DWORD *)v14 + 32) = 0;
      *((_QWORD *)v14 + 17) = objc_opt_new();
      *((_QWORD *)v14 + 20) = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionStream: name %@, ID %@>"), *((_QWORD *)v14 + 21), *((_QWORD *)v14 + 22));
      v16 = MEMORY[0x24BDC0D40];
      *(_OWORD *)(v14 + 40) = *MEMORY[0x24BDC0D40];
      *((_QWORD *)v14 + 7) = *(_QWORD *)(v16 + 16);
      v17 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
      v18 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v17);
      *((_QWORD *)v14 + 14) = v18;
      v19 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v18, v19, 0x3B9ACA00uLL, 0);
      objc_initWeak(&location, v14);
      v20 = *((_QWORD *)v14 + 14);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __107__CMIOExtensionStream__initWithLocalizedName_streamID_direction_clockType_customClockConfiguration_source___block_invoke;
      handler[3] = &unk_250457660;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v20, handler);
      dispatch_source_set_cancel_handler(*((dispatch_source_t *)v14 + 14), &__block_literal_global_114);
      dispatch_resume(*((dispatch_object_t *)v14 + 14));
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return v14;
}

void __107__CMIOExtensionStream__initWithLocalizedName_streamID_direction_clockType_customClockConfiguration_source___block_invoke(uint64_t a1)
{
  unsigned int *WeakRetained;
  unsigned int *v2;
  void *v3;
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  double Seconds;
  unint64_t v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  unsigned int *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE time[28];
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = (void *)objc_msgSend(WeakRetained, "_clientQueue_streamingClientsMap");
    if (objc_msgSend(v3, "count"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      v5 = v2[16];
      v23 = v2;
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stats for %@ streaming type %c%c%c%c subtype %c%c%c%c %dx%d "), v2, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v2[17]), BYTE2(v2[17]), BYTE1(v2[17]), v2[17], v2[26], v2[27]));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = (void *)objc_msgSend(v3, "allValues");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v25;
        v10 = 1;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v6);
            v12 = (void *)MEMORY[0x24BDD17C8];
            v13 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "pid");
            if ((v10 & 1) != 0)
              v14 = CFSTR("clients [%d");
            else
              v14 = CFSTR(", %d");
            objc_msgSend(v4, "appendString:", objc_msgSend(v12, "stringWithFormat:", v14, v13));
            v10 = 0;
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          v10 = 0;
        }
        while (v8);
      }
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("] ")));
      v2 = v23;
      *(_OWORD *)time = *(_OWORD *)(v23 + 18);
      *(_QWORD *)&time[16] = *((_QWORD *)v23 + 11);
      Seconds = CMTimeGetSeconds((CMTime *)time);
      v16 = *((_QWORD *)v23 + 12);
      v17 = 0.0;
      if (v16 && Seconds > 0.0)
      {
        v18 = (double)v16;
        *(_OWORD *)time = *(_OWORD *)(v23 + 18);
        *(_QWORD *)&time[16] = *((_QWORD *)v23 + 11);
        Seconds = CMTimeGetSeconds((CMTime *)time);
        v16 = *((_QWORD *)v23 + 12);
        v17 = v18 / Seconds;
      }
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("received %lld fps %f "), Seconds, v16, *(_QWORD *)&v17));
      v19 = CMIOLog();
      if (v19)
      {
        v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)time = 136315907;
          *(_QWORD *)&time[4] = v21;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 924;
          *(_WORD *)&time[18] = 2080;
          *(_QWORD *)&time[20] = "-[CMIOExtensionStream _initWithLocalizedName:streamID:direction:clockType:customClockCo"
                                 "nfiguration:source:]_block_invoke";
          v29 = 2113;
          v30 = v4;
          _os_log_impl(&dword_2330C2000, v20, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", time, 0x26u);
        }
      }

    }
    v22 = MEMORY[0x24BDC0D88];
    *(_OWORD *)(v2 + 18) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v2 + 11) = *(_QWORD *)(v22 + 16);
    *((_QWORD *)v2 + 12) = 0;

  }
}

- (void)dealloc
{
  NSObject *statsTimer;
  objc_super v4;

  statsTimer = self->_statsTimer;
  if (statsTimer)
  {
    dispatch_source_cancel(statsTimer);

  }
  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionStream;
  -[CMIOExtensionStream dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (NSArray)streamingClients
{
  os_unfair_lock_s *p_streamingClientsLock;
  NSArray *v4;

  p_streamingClientsLock = &self->_streamingClientsLock;
  os_unfair_lock_lock(&self->_streamingClientsLock);
  v4 = self->_streamingClients;
  os_unfair_lock_unlock(p_streamingClientsLock);
  return v4;
}

- (void)setStreamingClients:(id)a3
{
  os_unfair_lock_s *p_streamingClientsLock;
  NSArray *streamingClients;

  p_streamingClientsLock = &self->_streamingClientsLock;
  os_unfair_lock_lock(&self->_streamingClientsLock);
  streamingClients = self->_streamingClients;
  self->_streamingClients = (NSArray *)a3;
  os_unfair_lock_unlock(p_streamingClientsLock);
  -[CMIOExtensionStream clientQueue_updateMutableStreamPropertiesByPolicy](self, "clientQueue_updateMutableStreamPropertiesByPolicy");

}

- (void)clientQueue_updateMutableStreamPropertiesByPolicy
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  void *v5;
  CMIOExtensionPropertyState *v6;
  CMIOExtensionPropertyState *v7;
  CMIOExtensionPropertyState *v8;
  CMIOExtensionPropertyState *v9;
  CMIOExtensionPropertyState *v10;
  CMIOExtensionPropertyState *v11;
  CMIOExtensionPropertyState *v12;
  CMIOExtensionPropertyState *v13;
  CMIOExtensionStreamSource **p_source;
  CMIOExtensionPropertyAttributes *v15;
  uint64_t v16;
  CMIOExtensionPropertyState *v17;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (a3)
  {
    if (objc_msgSend(a3, "containsObject:", 0x250459618))
    {
      v6 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_localizedName, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
      objc_msgSend(v5, "setObject:forKey:", v6, 0x250459618);

    }
    if ((objc_msgSend(a3, "containsObject:", 0x250459638) & 1) == 0)
    {
LABEL_8:
      if (!objc_msgSend(a3, "containsObject:", 0x250459658))
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    v7 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_localizedName, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v7, 0x250459618);

  }
  v8 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", -[NSUUID UUIDString](self->_streamID, "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  objc_msgSend(v5, "setObject:forKey:", v8, 0x250459638);

  if (a3)
    goto LABEL_8;
LABEL_9:
  v9 = [CMIOExtensionPropertyState alloc];
  v10 = -[CMIOExtensionPropertyState initWithValue:attributes:](v9, "initWithValue:attributes:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_direction), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  objc_msgSend(v5, "setObject:forKey:", v10, 0x250459658);

  if (!a3)
    goto LABEL_11;
LABEL_10:
  if (objc_msgSend(a3, "containsObject:", 0x250459678))
  {
LABEL_11:
    v11 = [CMIOExtensionPropertyState alloc];
    v12 = -[CMIOExtensionPropertyState initWithValue:attributes:](v11, "initWithValue:attributes:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_clockType), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v12, 0x250459678);

    if (!a3)
      goto LABEL_13;
  }
  if (!objc_msgSend(a3, "containsObject:", 0x250459698))
    goto LABEL_17;
LABEL_13:
  if (self->_clockType == 2 && self->_customClockConfiguration)
  {
    v13 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_customClockConfiguration, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v13, 0x250459698);

  }
  if (a3)
  {
LABEL_17:
    if (!objc_msgSend(a3, "containsObject:", 0x2504596B8))
      goto LABEL_22;
  }
  p_source = &self->_source;
  v15 = -[CMIOExtensionPropertyAttributes initWithMinValue:maxValue:validValues:readOnly:]([CMIOExtensionPropertyAttributes alloc], "initWithMinValue:maxValue:validValues:readOnly:", 0, 0, objc_msgSend(objc_loadWeak((id *)&self->_source), "formats"), 1);
  if (objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_source), "formats"), "count"))
    v16 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_source), "formats"), "objectAtIndexedSubscript:", 0);
  else
    v16 = 0;
  v17 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", v16, v15);

  objc_msgSend(v5, "setObject:forKey:", v17, 0x2504596B8);
LABEL_22:
  if (objc_msgSend(v5, "count"))
    return v5;
  else
    return 0;
}

- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5
{
  id v5;
  id v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v7 = +[CMIOExtensionStream internalWritableProperties](CMIOExtensionStream, "internalWritableProperties", a3, a4, a5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101__CMIOExtensionStream__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke;
  v10[3] = &unk_2504576A8;
  v10[4] = v7;
  v10[5] = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (!*((_BYTE *)v12 + 24))
  {
    v5 = (id)objc_msgSend(v5, "mutableCopy");
    v8 = (void *)objc_opt_new();
    -[CMIOExtensionStream notifyPropertiesChanged:](self, "notifyPropertiesChanged:", v8);

  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __101__CMIOExtensionStream__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  os_unfair_lock_s *p_changedPropertiesLock;
  NSObject *v6;
  _QWORD block[5];

  p_changedPropertiesLock = &self->_changedPropertiesLock;
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_changedProperties, "addEntriesFromDictionary:", propertyStates);
  os_unfair_lock_unlock(p_changedPropertiesLock);
  v6 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CMIOExtensionStream_notifyPropertiesChanged___block_invoke;
  block[3] = &unk_2504576D0;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__CMIOExtensionStream_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (objc_msgSend(v2, "count"))
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_notifyStreamPropertiesChangedWithStreamID:propertyStates:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), v2);

}

- (void)sendSampleBuffer:(CMSampleBufferRef)sampleBuffer discontinuity:(CMIOExtensionStreamDiscontinuityFlags)discontinuity hostTimeInNanoseconds:(uint64_t)hostTimeInNanoseconds
{
  const opaqueCMFormatDescription *FormatDescription;
  const opaqueCMFormatDescription *v10;
  unint64_t v11;
  const __CFAllocator *v12;
  CFNumberRef v13;
  CFNumberRef v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID TypeID;
  int Value;
  int v19;
  CFNumberRef v20;
  OpaqueCMClock *HostTimeClock;
  CFDictionaryRef v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  Float64 Seconds;
  Float64 v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  Float64 v32;
  Float64 v33;
  CMIOExtensionSample *v34;
  CMIOExtensionSample *v35;
  const opaqueCMFormatDescription *v36;
  CMMediaType MediaType;
  FourCharCode MediaSubType;
  CMVideoDimensions Dimensions;
  NSObject *v40;
  _QWORD block[6];
  CMTime v42;
  __int128 v43;
  uint64_t v44;
  CMMediaType v45;
  FourCharCode v46;
  CMVideoDimensions v47;
  CMTime rhs;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMIOExtensionStreamDiscontinuityFlags v52;
  unint64_t valuePtr;
  uint64_t v54;
  _BYTE time[28];
  __int16 v56;
  Float64 v57;
  __int16 v58;
  Float64 v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v54 = hostTimeInNanoseconds;
  if (self->_direction == 1)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ You can't send sample from a sink stream."), self);
  if (sampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
    v10 = FormatDescription;
    if (FormatDescription && CMFormatDescriptionGetMediaType(FormatDescription) == 1936684398)
    {
      v11 = self->_audioSequenceNumber + 1;
      self->_audioSequenceNumber = v11;
    }
    else
    {
      v11 = self->_sequenceNumber + 1;
      self->_sequenceNumber = v11;
    }
    valuePtr = v11;
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
    CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_SequenceNumber, v13, 1u);
    CFRelease(v13);
    if (hostTimeInNanoseconds)
    {
      v14 = CFNumberCreate(v12, kCFNumberSInt64Type, &v54);
      CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_HostTime, v14, 1u);
      CFRelease(v14);
    }
    v52 = discontinuity;
    v15 = (const __CFNumber *)CMGetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
    if (v15)
    {
      v16 = v15;
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v16))
      {
        *(_DWORD *)time = 0;
        Value = CFNumberGetValue(v16, kCFNumberSInt32Type, time);
        v19 = *(_DWORD *)time;
        if (!Value)
          v19 = 0;
        v52 = v19 | discontinuity;
      }
    }
    v20 = CFNumberCreate(v12, kCFNumberSInt32Type, &v52);
    CMSetAttachment(sampleBuffer, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v20, 1u);
    CFRelease(v20);
    memset(&v51, 0, sizeof(v51));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v51, HostTimeClock);
    *(CMTime *)time = v51;
    v22 = CMTimeCopyAsDictionary((CMTime *)time, v12);
    CMSetAttachment(sampleBuffer, CFSTR("com.apple.cmio.buffer_attachment.deliver_time"), v22, 1u);
    CFRelease(v22);
    v23 = CMIOLogLevel(2);
    if (v10)
    {
      if (v23)
      {
        memset(&v50, 0, sizeof(v50));
        CMSampleBufferGetPresentationTimeStamp(&v50, sampleBuffer);
        memset(&v49, 0, sizeof(v49));
        *(CMTime *)time = v51;
        rhs = v50;
        CMTimeSubtract(&v49, (CMTime *)time, &rhs);
        if (CMFormatDescriptionGetMediaType(v10) == 1986618469)
        {
          v24 = CMIOLogLevel(2);
          if (!v24)
            goto LABEL_26;
          v25 = v24;
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            goto LABEL_26;
          v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(CMTime *)time = v50;
          Seconds = CMTimeGetSeconds((CMTime *)time);
          *(CMTime *)time = v49;
          v28 = CMTimeGetSeconds((CMTime *)time);
          *(_DWORD *)time = 136316418;
          *(_QWORD *)&time[4] = v26;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 1203;
          *(_WORD *)&time[18] = 2080;
          *(_QWORD *)&time[20] = "-[CMIOExtensionStream sendSampleBuffer:discontinuity:hostTimeInNanoseconds:]";
          v56 = 2048;
          v57 = Seconds;
          v58 = 2048;
          v59 = v28;
          v60 = 2048;
          v61 = valuePtr;
          v29 = "%s:%d:%s video [time %.3f diff %.3f] %lld";
        }
        else
        {
          if (CMFormatDescriptionGetMediaType(v10) != 1936684398)
            goto LABEL_26;
          v30 = CMIOLogLevel(2);
          if (!v30)
            goto LABEL_26;
          v25 = v30;
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            goto LABEL_26;
          v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(CMTime *)time = v50;
          v32 = CMTimeGetSeconds((CMTime *)time);
          *(CMTime *)time = v49;
          v33 = CMTimeGetSeconds((CMTime *)time);
          *(_DWORD *)time = 136316418;
          *(_QWORD *)&time[4] = v31;
          *(_WORD *)&time[12] = 1024;
          *(_DWORD *)&time[14] = 1206;
          *(_WORD *)&time[18] = 2080;
          *(_QWORD *)&time[20] = "-[CMIOExtensionStream sendSampleBuffer:discontinuity:hostTimeInNanoseconds:]";
          v56 = 2048;
          v57 = v32;
          v58 = 2048;
          v59 = v33;
          v60 = 2048;
          v61 = valuePtr;
          v29 = "%s:%d:%s audio [time %.3f diff %.3f] %lld";
        }
        _os_log_impl(&dword_2330C2000, v25, OS_LOG_TYPE_DEFAULT, v29, time, 0x3Au);
      }
    }
  }
LABEL_26:
  v34 = -[CMIOExtensionSample initWithCMSampleBuffer:]([CMIOExtensionSample alloc], "initWithCMSampleBuffer:", sampleBuffer);
  if (v34)
  {
    v35 = v34;
    memset(time, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)time, sampleBuffer);
    memset(&v51, 0, sizeof(v51));
    CMSampleBufferGetDuration(&v51, sampleBuffer);
    v36 = CMSampleBufferGetFormatDescription(sampleBuffer);
    MediaType = CMFormatDescriptionGetMediaType(v36);
    MediaSubType = CMFormatDescriptionGetMediaSubType(v36);
    Dimensions = CMVideoFormatDescriptionGetDimensions(v36);
    v40 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__CMIOExtensionStream_sendSampleBuffer_discontinuity_hostTimeInNanoseconds___block_invoke;
    block[3] = &unk_2504576F8;
    v42 = v51;
    v43 = *(_OWORD *)time;
    v44 = *(_QWORD *)&time[16];
    v45 = MediaType;
    v46 = MediaSubType;
    v47 = Dimensions;
    block[4] = self;
    block[5] = v35;
    dispatch_async(v40, block);
  }
}

void __76__CMIOExtensionStream_sendSampleBuffer_discontinuity_hostTimeInNanoseconds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CMTime *v4;
  __int128 v5;
  uint64_t v6;
  CMTime *v7;
  CMTime v8;
  CMTime rhs;
  CMTime time2;
  CMTime time1;

  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    v7 = *(CMTime **)(a1 + 32);
    time2 = v7[3];
    rhs = *(CMTime *)(a1 + 48);
    CMTimeAdd(&time1, &time2, &rhs);
    v7[3] = time1;
    v2 = *(_QWORD *)(a1 + 32);
    goto LABEL_6;
  }
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 52) & 1) == 0)
  {
LABEL_6:
    v5 = *(_OWORD *)(a1 + 72);
    v6 = *(_QWORD *)(a1 + 88);
    goto LABEL_7;
  }
  ++*(_QWORD *)(v2 + 96);
  time1 = *(CMTime *)(*(_QWORD *)(a1 + 32) + 40);
  time2 = *(CMTime *)(a1 + 72);
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    memset(&time1, 0, sizeof(time1));
    v3 = *(_QWORD *)(a1 + 32);
    time2 = *(CMTime *)(a1 + 72);
    rhs = *(CMTime *)(v3 + 40);
    CMTimeSubtract(&time1, &time2, &rhs);
    v4 = *(CMTime **)(a1 + 32);
    rhs = v4[3];
    v8 = time1;
    CMTimeAdd(&time2, &rhs, &v8);
    v4[3] = time2;
    v2 = *(_QWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 72);
    v6 = *(_QWORD *)(a1 + 88);
LABEL_7:
    *(_QWORD *)(v2 + 56) = v6;
    *(_OWORD *)(v2 + 40) = v5;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_DWORD *)(a1 + 96);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 68) = *(_DWORD *)(a1 + 100);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a1 + 104);
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_sendSampleForStream:sample:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)consumeSampleBufferFromClient:(CMIOExtensionClient *)client completionHandler:(void *)completionHandler
{
  if (self->_direction != 1)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ You can't consume sample if the steam is not sink."), self);
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "consumeSampleBufferForStream:client:reply:", self, client, completionHandler);
}

- (void)notifyScheduledOutputChanged:(CMIOExtensionScheduledOutput *)scheduledOutput
{
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "notifyScheduledOutputChangedForStream:scheduledOutput:", self, scheduledOutput);
}

- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4
{
  NSObject *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLog();
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionStream enqueueReactionEffect:completionHandler:].cold.1();
  FigCopyBacktrace();
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 4294967293);
}

- (id)_clientQueue_streamingClientsMap
{
  return self->_streamingClientsMap;
}

- (void)_clientQueue_addStreamingClient:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  CMIOExtensionStream *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary setObject:forKey:](self->_streamingClientsMap, "setObject:forKey:", a3, objc_msgSend(a3, "clientID"));
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136316163;
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v9 = 1024;
      v10 = 1288;
      v11 = 2080;
      v12 = "-[CMIOExtensionStream _clientQueue_addStreamingClient:]";
      v13 = 2114;
      v14 = self;
      v15 = 1025;
      v16 = objc_msgSend(a3, "pid");
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, adding streaming client with %{private}d pid", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[CMIOExtensionStream setStreamingClients:](self, "setStreamingClients:", -[NSMutableDictionary allValues](self->_streamingClientsMap, "allValues"));
}

- (void)_clientQueue_removeStreamingClient:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionStream *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary removeObjectForKey:](self->_streamingClientsMap, "removeObjectForKey:", objc_msgSend(a3, "clientID"));
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 136316163;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 1297;
      v13 = 2080;
      v14 = "-[CMIOExtensionStream _clientQueue_removeStreamingClient:]";
      v15 = 2114;
      v16 = self;
      v17 = 1025;
      v18 = objc_msgSend(a3, "pid");
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, removing streaming client with %{private}d pid", (uint8_t *)&v9, 0x2Cu);
    }
  }
  if (!-[NSMutableDictionary count](self->_streamingClientsMap, "count"))
  {
    v7 = MEMORY[0x24BDC0D40];
    *(_OWORD *)&self->_statsLastSampleTime.value = *MEMORY[0x24BDC0D40];
    self->_statsLastSampleTime.epoch = *(_QWORD *)(v7 + 16);
    *(_QWORD *)&self->_statsMediaType = 0;
    v8 = MEMORY[0x24BDC0D88];
    self->_statsDimensions = 0;
    *(_OWORD *)&self->_statsTotalDuration.value = *(_OWORD *)v8;
    self->_statsTotalDuration.epoch = *(_QWORD *)(v8 + 16);
    self->_statsTotalSampleCount = 0;
  }
  -[CMIOExtensionStream setStreamingClients:](self, "setStreamingClients:", -[NSMutableDictionary allValues](self->_streamingClientsMap, "allValues"));
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSUUID)streamID
{
  return (NSUUID *)objc_getProperty(self, a2, 176, 1);
}

- (CMIOExtensionStreamDirection)direction
{
  return self->_direction;
}

- (CMIOExtensionStreamClockType)clockType
{
  return self->_clockType;
}

- (CMIOExtensionStreamCustomClockConfiguration)customClockConfiguration
{
  return (CMIOExtensionStreamCustomClockConfiguration *)objc_getProperty(self, a2, 200, 1);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (CMIOExtensionDevice)parent
{
  return (CMIOExtensionDevice *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)enqueueReactionEffect:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s %{public}@ Called base class stub of enqueueReactionEffect, this should not happen", v2);
  OUTLINED_FUNCTION_2();
}

@end
