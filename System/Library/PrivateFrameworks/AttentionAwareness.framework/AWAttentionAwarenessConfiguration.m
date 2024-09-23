@implementation AWAttentionAwarenessConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_keyboardDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_digitizerDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allowedHIDEventsForRemoteEvent, 0);
  objc_storeStrong((id *)&self->_attentionLostTimeoutDictionary, 0);
  objc_storeStrong((id *)&self->_attentionLostTimeouts, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)attentionLostTimeoutDictionary
{
  return (NSDictionary *)(id)-[NSDictionary copy](self->_attentionLostTimeoutDictionary, "copy");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_tag)
  {
    +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decrementTagIndexRefCount:", self->_tagIndex);

  }
  v4.receiver = self;
  v4.super_class = (Class)AWAttentionAwarenessConfiguration;
  -[AWAttentionAwarenessConfiguration dealloc](&v4, sel_dealloc);
}

- (void)setAttentionLostTimeout:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWAttentionAwarenessConfiguration setAttentionLostTimeouts:](self, "setAttentionLostTimeouts:", v5);

}

- (void)setAttentionLostTimeouts:(id)a3
{
  NSSet *v4;
  NSSet *attentionLostTimeouts;
  NSDictionary *attentionLostTimeoutDictionary;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  attentionLostTimeouts = self->_attentionLostTimeouts;
  self->_attentionLostTimeouts = v4;

  attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
  self->_attentionLostTimeoutDictionary = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  AWAttentionAwarenessConfiguration *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSCopying *tag;
  uint64_t v10;
  NSSet *attentionLostTimeouts;
  uint64_t v12;
  NSDictionary *attentionLostTimeoutDictionary;
  uint64_t v14;
  NSSet *allowedHIDEventsForRemoteEvent;
  uint64_t v16;
  NSSet *digitizerDisplayUUIDs;
  uint64_t v18;
  NSSet *keyboardDisplayUUIDs;
  uint64_t v20;
  NSSet *buttonDisplayUUIDs;
  void *v22;

  v5 = -[AWAttentionAwarenessConfiguration init](+[AWAttentionAwarenessConfiguration allocWithZone:](AWAttentionAwarenessConfiguration, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSCopying copyWithZone:](self->_tag, "copyWithZone:", a3);
  tag = v5->_tag;
  v5->_tag = (NSCopying *)v8;

  v5->_notificationMask = self->_notificationMask;
  v5->_eventMask = self->_eventMask;
  v5->_attentionLostEventMask = self->_attentionLostEventMask;
  v5->_samplingInterval = self->_samplingInterval;
  v5->_samplingDelay = self->_samplingDelay;
  v5->_sampleWhileAbsent = self->_sampleWhileAbsent;
  v5->_retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
  v5->_pollingFilter = self->_pollingFilter;
  v5->_continuousFaceDetectMode = self->_continuousFaceDetectMode;
  v5->_activateEyeRelief = self->_activateEyeRelief;
  v5->_activateAttentionDetection = self->_activateAttentionDetection;
  v5->_activateMotionDetect = self->_activateMotionDetect;
  v5->_unityStream = self->_unityStream;
  v10 = -[NSSet copyWithZone:](self->_attentionLostTimeouts, "copyWithZone:", a3);
  attentionLostTimeouts = v5->_attentionLostTimeouts;
  v5->_attentionLostTimeouts = (NSSet *)v10;

  v12 = -[NSDictionary copyWithZone:](self->_attentionLostTimeoutDictionary, "copyWithZone:", a3);
  attentionLostTimeoutDictionary = v5->_attentionLostTimeoutDictionary;
  v5->_attentionLostTimeoutDictionary = (NSDictionary *)v12;

  v5->_tagIndex = self->_tagIndex;
  v14 = -[NSSet copyWithZone:](self->_allowedHIDEventsForRemoteEvent, "copyWithZone:", a3);
  allowedHIDEventsForRemoteEvent = v5->_allowedHIDEventsForRemoteEvent;
  v5->_allowedHIDEventsForRemoteEvent = (NSSet *)v14;

  v16 = -[NSSet copyWithZone:](self->_digitizerDisplayUUIDs, "copyWithZone:", a3);
  digitizerDisplayUUIDs = v5->_digitizerDisplayUUIDs;
  v5->_digitizerDisplayUUIDs = (NSSet *)v16;

  v18 = -[NSSet copyWithZone:](self->_keyboardDisplayUUIDs, "copyWithZone:", a3);
  keyboardDisplayUUIDs = v5->_keyboardDisplayUUIDs;
  v5->_keyboardDisplayUUIDs = (NSSet *)v18;

  v20 = -[NSSet copyWithZone:](self->_buttonDisplayUUIDs, "copyWithZone:", a3);
  buttonDisplayUUIDs = v5->_buttonDisplayUUIDs;
  v5->_buttonDisplayUUIDs = (NSSet *)v20;

  v5->_nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
  v5->_nonSampledAttentionLostTimeoutEnable = self->_nonSampledAttentionLostTimeoutEnable;
  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "incrementTagIndexRefCount:", self->_tagIndex);

  return v5;
}

- (AWAttentionAwarenessConfiguration)init
{
  AWAttentionAwarenessConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AWAttentionAwarenessConfiguration;
  v2 = -[AWAttentionAwarenessConfiguration init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    do
      v7 = __ldaxr((unsigned int *)&init_configCount);
    while (__stlxr(v7 + 1, (unsigned int *)&init_configCount));
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%d"), v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v8;

    v2->_activateAttentionDetection = 1;
  }
  return v2;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
  if (!self->_attentionLostEventMaskExplicitlySet)
    self->_attentionLostEventMask = a3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  NSString *identifier;

  v4 = (NSString *)a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("attempt to set null identifier on %@"), v8);

  }
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)validateWithError:(id *)a3
{
  NSSet *v5;
  unint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  const char *v32;
  unint64_t v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (self->_identifier && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      {
        v30 = absTimeNS();
        if (v30 == -1)
          v31 = INFINITY;
        else
          v31 = (double)v30 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v43 = v31;
        v32 = "%13.5f: Invalid Config: identifier must be a valid string";
        goto LABEL_68;
      }
LABEL_11:

    }
  }
  else if (self->_samplingInterval >= 0.0 && self->_samplingDelay >= 0.0)
  {
    if (self->_attentionLostTimeouts)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (currentLogLevel < 3)
          goto LABEL_12;
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v14 = absTimeNS();
        if (v14 == -1)
          v15 = INFINITY;
        else
          v15 = (double)v14 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v43 = v15;
        v32 = "%13.5f: Invalid Config: attention lost timeouts must be a set of non-negative values";
        goto LABEL_68;
      }
    }
    if (self->_unityStream && !self->_continuousFaceDetectMode)
    {
      if (currentLogLevel < 3)
        goto LABEL_12;
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v18 = absTimeNS();
      if (v18 == -1)
        v19 = INFINITY;
      else
        v19 = (double)v18 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v43 = v19;
      v32 = "%13.5f: Invalid Config: Unity stream clients must set the continuousFaceDetectMode flag";
      goto LABEL_68;
    }
    if (self->_activateEyeRelief)
    {
      if (self->_activateMotionDetect)
      {
        if (currentLogLevel < 3)
          goto LABEL_12;
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v43 = v13;
        v32 = "%13.5f: Invalid Config: EyeRelief and motion detection cannot be started at the same time";
        goto LABEL_68;
      }
      if (!self->_continuousFaceDetectMode)
      {
        if (currentLogLevel < 3)
          goto LABEL_12;
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v20 = absTimeNS();
        if (v20 == -1)
          v21 = INFINITY;
        else
          v21 = (double)v20 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v43 = v21;
        v32 = "%13.5f: Invalid Config: EyeRelief can only be run in streaming mode";
        goto LABEL_68;
      }
    }
    else if (self->_continuousFaceDetectMode)
    {
      if (self->_activateMotionDetect)
      {
        if (currentLogLevel < 3)
          goto LABEL_12;
        _AALog();
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v16 = absTimeNS();
        if (v16 == -1)
          v17 = INFINITY;
        else
          v17 = (double)v16 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v43 = v17;
        v32 = "%13.5f: Invalid Config: Motion detection cannot be started in streaming mode";
        goto LABEL_68;
      }
    }
    else if (self->_activateMotionDetect)
    {
      self->_activateAttentionDetection = 0;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = self->_attentionLostTimeouts;
    v22 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      v25 = 0.0;
LABEL_48:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v5);
        v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_11;
        objc_msgSend(v27, "doubleValue", (_QWORD)v35);
        if (v28 < 0.0)
          goto LABEL_11;
        objc_msgSend(v27, "doubleValue");
        if (v25 < v29)
          v25 = v29;
        if (v23 == ++v26)
        {
          v23 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          if (v23)
            goto LABEL_48;
          goto LABEL_59;
        }
      }
    }
    v25 = 0.0;
LABEL_59:

    if (!self->_nonSampledAttentionLostTimeoutEnable || self->_nonSampledAttentionLostTimeout > v25)
      return 1;
    if (currentLogLevel >= 3)
    {
      _AALog();
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v33 = absTimeNS();
      if (v33 == -1)
        v34 = INFINITY;
      else
        v34 = (double)v33 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v43 = v34;
      v32 = "%13.5f: Invalid Config: nonSampledTimeout lower than attentionLostTimeouts";
      goto LABEL_68;
    }
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v43 = v7;
      v32 = "%13.5f: Invalid Config: sampling interval and sampling delay must be non-negative";
LABEL_68:
      _os_log_error_impl(&dword_1AF589000, &v5->super, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2FE0];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR(" Invalid config");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 22, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  identifier = self->_identifier;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_tagIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("tagIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_notificationMask);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("notificationMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_eventMask);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("eventMask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_attentionLostEventMask);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("attentionLostEventMask"));

  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("samplingInterval"), self->_samplingInterval);
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("samplingDelay"), self->_samplingDelay);
  objc_msgSend(v10, "encodeBool:forKey:", self->_sampleWhileAbsent, CFSTR("sampleWhileAbsent"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_retroactiveTimeoutMode, CFSTR("retroactiveTimeoutMode"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_pollingFilter, CFSTR("pollingFilter"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_continuousFaceDetectMode, CFSTR("continuousFaceDetectMode"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_activateEyeRelief, CFSTR("activateEyeRelief"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_activateAttentionDetection, CFSTR("activateAttentionDetection"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_activateMotionDetect, CFSTR("activateMotionDetect"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_unityStream, CFSTR("unityStream"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_attentionLostTimeouts, CFSTR("attentionLostTimeouts"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_allowedHIDEventsForRemoteEvent, CFSTR("allowedHIDEventsForRemoteEvent"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_digitizerDisplayUUIDs, CFSTR("digitizerDisplayUUIDs"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_keyboardDisplayUUIDs, CFSTR("keyboardDisplayUUIDs"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_buttonDisplayUUIDs, CFSTR("buttonDisplayUUIDs"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("nonSampledAttentionLostTimeout"), self->_nonSampledAttentionLostTimeout);
  v9 = 0.0;
  if (self->_nonSampledAttentionLostTimeoutEnable)
    v9 = 1.0;
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("nonSampledAttentionLostTimeoutEnable"), v9);

}

- (AWAttentionAwarenessConfiguration)initWithCoder:(id)a3
{
  id v4;
  AWAttentionAwarenessConfiguration *v5;
  uint64_t v6;
  NSString *identifier;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __objc2_class **p_superclass;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSSet *v20;
  __objc2_class **v21;
  NSObject *v22;
  NSSet *attentionLostTimeouts;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  char isKindOfClass;
  NSSet *v47;
  NSObject *v48;
  NSSet *allowedHIDEventsForRemoteEvent;
  uint64_t v50;
  NSSet *digitizerDisplayUUIDs;
  uint64_t v52;
  NSSet *keyboardDisplayUUIDs;
  uint64_t v54;
  NSSet *buttonDisplayUUIDs;
  NSObject *v56;
  AWAttentionAwarenessConfiguration *v57;
  unint64_t v59;
  double v60;
  unint64_t v61;
  double v62;
  unint64_t v63;
  double v64;
  objc_class *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  double v81;
  __int16 v82;
  const __CFString *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t v88[4];
  double v89;
  __int16 v90;
  void *v91;
  uint8_t v92[32];
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v75 = 0;
  v74.receiver = self;
  v74.super_class = (Class)AWAttentionAwarenessConfiguration;
  v5 = -[AWAttentionAwarenessConfiguration init](&v74, sel_init);
  if (!v5)
    goto LABEL_53;
  decodeString(v4, &v75, CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_tagIndex = decodeUInt64(v4, &v75, CFSTR("tagIndex"));
  v5->_notificationMask = decodeUInt64(v4, &v75, CFSTR("notificationMask"));
  v5->_eventMask = decodeUInt64(v4, &v75, CFSTR("eventMask"));
  v5->_attentionLostEventMask = decodeUInt64(v4, &v75, CFSTR("attentionLostEventMask"));
  v5->_samplingInterval = decodeDouble(v4, &v75, CFSTR("samplingInterval"));
  v5->_samplingDelay = decodeDouble(v4, &v75, CFSTR("samplingDelay"));
  v5->_sampleWhileAbsent = decodeUInt64(v4, &v75, CFSTR("sampleWhileAbsent")) != 0;
  v5->_retroactiveTimeoutMode = decodeUInt64(v4, &v75, CFSTR("retroactiveTimeoutMode")) != 0;
  v5->_pollingFilter = decodeUInt64(v4, &v75, CFSTR("pollingFilter")) != 0;
  v5->_continuousFaceDetectMode = decodeUInt64(v4, &v75, CFSTR("continuousFaceDetectMode")) != 0;
  v5->_activateEyeRelief = decodeUInt64(v4, &v75, CFSTR("activateEyeRelief")) != 0;
  v5->_activateAttentionDetection = decodeUInt64(v4, &v75, CFSTR("activateAttentionDetection")) != 0;
  v5->_activateMotionDetect = decodeUInt64(v4, &v75, CFSTR("activateMotionDetect")) != 0;
  v5->_unityStream = decodeUInt64(v4, &v75, CFSTR("unityStream")) != 0;
  v8 = v4;
  v9 = CFSTR("attentionLostTimeouts");
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v12, CFSTR("attentionLostTimeouts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_superclass = (__objc2_class **)(&OBJC_METACLASS___AWSampleLogger + 8);
  if (!v13)
  {
    if ((objc_msgSend(v8, "containsValueForKey:", CFSTR("attentionLostTimeouts")) & 1) != 0)
    {
      v20 = 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    if (*((int *)p_superclass + 168) >= 3)
    {
      v21 = p_superclass;
      _AALog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v61 = absTimeNS();
        if (v61 == -1)
          v62 = INFINITY;
        else
          v62 = (double)v61 / 1000000000.0;
        *(_DWORD *)v92 = 134218242;
        *(double *)&v92[4] = v62;
        *(_WORD *)&v92[12] = 2112;
        *(_QWORD *)&v92[14] = CFSTR("attentionLostTimeouts");
        _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v92, 0x16u);
      }

      p_superclass = v21;
    }
    v20 = 0;
    v75 = 1;
    goto LABEL_20;
  }
  v73 = v12;
  v86 = 0u;
  v87 = 0u;
  v85 = 0u;
  v84 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v85;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v85 != v18)
          objc_enumerationMutation(v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          p_superclass = &OBJC_METACLASS___AWSampleLogger.superclass;
          v12 = v73;
          goto LABEL_16;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      if (v17)
        continue;
      break;
    }
  }

  v20 = (NSSet *)v15;
  p_superclass = (__objc2_class **)(&OBJC_METACLASS___AWSampleLogger + 8);
  v12 = v73;
LABEL_20:

  attentionLostTimeouts = v5->_attentionLostTimeouts;
  v5->_attentionLostTimeouts = v20;

  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = v8;
  v27 = CFSTR("allowedHIDEventsForRemoteEvent");
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), v24, v25, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "decodeObjectOfClasses:forKey:", v30, CFSTR("allowedHIDEventsForRemoteEvent"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    if ((objc_msgSend(v26, "containsValueForKey:", CFSTR("allowedHIDEventsForRemoteEvent")) & 1) != 0)
    {
      v47 = 0;
      goto LABEL_48;
    }
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_44:
    if (*((int *)p_superclass + 168) >= 3)
    {
      _AALog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v59 = absTimeNS();
        if (v59 == -1)
          v60 = INFINITY;
        else
          v60 = (double)v59 / 1000000000.0;
        *(_DWORD *)buf = 134218242;
        v81 = v60;
        v82 = 2112;
        v83 = CFSTR("allowedHIDEventsForRemoteEvent");
        _os_log_error_impl(&dword_1AF589000, v48, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);
      }

    }
    v47 = 0;
    v75 = 1;
    goto LABEL_48;
  }
  v93 = 0u;
  v94 = 0u;
  memset(v92, 0, sizeof(v92));
  v32 = v31;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v92, v88, 16);
  if (v33)
  {
    v34 = **(_QWORD **)&v92[16];
    v72 = v32;
    v67 = **(_QWORD **)&v92[16];
    while (2)
    {
      v35 = 0;
      v68 = v33;
      do
      {
        if (**(_QWORD **)&v92[16] != v34)
        {
          v36 = v35;
          objc_enumerationMutation(v32);
          v35 = v36;
        }
        v69 = v35;
        v37 = *(void **)(*(_QWORD *)&v92[8] + 8 * v35);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_43:

          goto LABEL_44;
        }
        v38 = v37;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, &v84, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v77;
          v70 = v31;
          v71 = v30;
          while (2)
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v77 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v39, "objectForKeyedSubscript:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                  continue;
              }

              p_superclass = &OBJC_METACLASS___AWSampleLogger.superclass;
              v31 = v70;
              v30 = v71;
              v32 = v72;
              goto LABEL_43;
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, &v84, 16);
            p_superclass = (__objc2_class **)(&OBJC_METACLASS___AWSampleLogger + 8);
            v31 = v70;
            v30 = v71;
            if (v41)
              continue;
            break;
          }
        }

        v35 = v69 + 1;
        v32 = v72;
        v34 = v67;
      }
      while (v69 + 1 != v68);
      v33 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", v92, v88, 16);
      if (v33)
        continue;
      break;
    }
  }

  v47 = (NSSet *)v32;
LABEL_48:

  allowedHIDEventsForRemoteEvent = v5->_allowedHIDEventsForRemoteEvent;
  v5->_allowedHIDEventsForRemoteEvent = v47;

  decodeStringSet(v26, &v75, CFSTR("digitizerDisplayUUIDs"));
  v50 = objc_claimAutoreleasedReturnValue();
  digitizerDisplayUUIDs = v5->_digitizerDisplayUUIDs;
  v5->_digitizerDisplayUUIDs = (NSSet *)v50;

  decodeStringSet(v26, &v75, CFSTR("keyboardDisplayUUIDs"));
  v52 = objc_claimAutoreleasedReturnValue();
  keyboardDisplayUUIDs = v5->_keyboardDisplayUUIDs;
  v5->_keyboardDisplayUUIDs = (NSSet *)v52;

  decodeStringSet(v26, &v75, CFSTR("buttonDisplayUUIDs"));
  v54 = objc_claimAutoreleasedReturnValue();
  buttonDisplayUUIDs = v5->_buttonDisplayUUIDs;
  v5->_buttonDisplayUUIDs = (NSSet *)v54;

  v5->_nonSampledAttentionLostTimeoutEnable = decodeUInt64(v26, &v75, CFSTR("nonSampledAttentionLostTimeoutEnable")) != 0;
  v5->_nonSampledAttentionLostTimeout = decodeDouble(v26, &v75, CFSTR("nonSampledAttentionLostTimeout"));
  if (!v75)
  {
LABEL_53:
    v57 = v5;
    goto LABEL_54;
  }
  if (*((int *)p_superclass + 168) >= 3)
  {
    _AALog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v63 = absTimeNS();
      if (v63 == -1)
        v64 = INFINITY;
      else
        v64 = (double)v63 / 1000000000.0;
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 134218242;
      v89 = v64;
      v90 = 2112;
      v91 = v66;
      _os_log_error_impl(&dword_1AF589000, v56, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v88, 0x16u);

    }
  }
  v57 = 0;
LABEL_54:

  return v57;
}

- (id)description
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  double samplingInterval;
  double samplingDelay;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  double nonSampledAttentionLostTimeout;
  void *v29;
  void *v30;
  void *v31;
  NSSet *buttonDisplayUUIDs;
  NSSet *keyboardDisplayUUIDs;
  NSSet *digitizerDisplayUUIDs;
  void *v35;
  void *v36;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  NSString *identifier;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v3 = self->_attentionLostTimeouts;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v50;
    v8 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if ((v8 & 1) != 0)
        {
          v11 = (void *)MEMORY[0x1E0CB37A0];
          objc_msgSend(v10, "doubleValue");
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%13.5f"), v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v13;
        }
        else
        {
          objc_msgSend(v10, "doubleValue");
          objc_msgSend(v6, "appendFormat:", CFSTR(", %13.5f"), v14);
        }
        v8 = 0;
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v8 = 0;
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v48 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v47 = (void *)v16;
  samplingInterval = self->_samplingInterval;
  samplingDelay = self->_samplingDelay;
  if (self->_sampleWhileAbsent)
    v19 = "true";
  else
    v19 = "false";
  if (self->_retroactiveTimeoutMode)
    v20 = "true";
  else
    v20 = "false";
  v44 = v20;
  v45 = v19;
  if (self->_pollingFilter)
    v21 = "true";
  else
    v21 = "false";
  if (self->_continuousFaceDetectMode)
    v22 = "true";
  else
    v22 = "false";
  v42 = v22;
  v43 = v21;
  if (self->_activateAttentionDetection)
    v23 = "true";
  else
    v23 = "false";
  if (self->_activateEyeRelief)
    v24 = "true";
  else
    v24 = "false";
  v40 = v24;
  v41 = v23;
  if (self->_activateMotionDetect)
    v25 = "true";
  else
    v25 = "false";
  if (self->_unityStream)
    v26 = "true";
  else
    v26 = "false";
  v38 = v26;
  v39 = v25;
  if (self->_nonSampledAttentionLostTimeoutEnable)
    v27 = "true";
  else
    v27 = "false";
  nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
  getNotificationMaskDescription(self->_notificationMask);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  getEventMaskDescription(self->_eventMask);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  getEventMaskDescription(self->_attentionLostEventMask);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  keyboardDisplayUUIDs = self->_keyboardDisplayUUIDs;
  buttonDisplayUUIDs = self->_buttonDisplayUUIDs;
  digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
  tagDescription(self->_tagIndex, self->_tag);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("<%@: %p> (identifier: %@ samplingInterval: %13.5f, samplingDelay: %13.5f, sampleWhileAbsent: %s, retroactiveTimeoutMode: %s, pollingFilter: %s, continuousFaceDetectMode: %s, activateAttentionDetection: %s, activateEyeRelief: %s, activateMotionDetection: %s, unityStream: %s, attentionLostTimeouts: %@ nonSampledAttentionLostTimeoutEnable: %s nonSampledAttentionLostTimeout: %13.5f notificationMask %@ mask %@ attentionLostEventMask %@ digitizerDisplayUUIDs %@ buttonDisplayUUIDs %@ keyboardDisplayUUIDs %@ %@)"), v47, self, identifier, *(_QWORD *)&samplingInterval, *(_QWORD *)&samplingDelay, v45, v44, v43, v42, v41, v40, v39, v38, v6, v27, *(_QWORD *)&nonSampledAttentionLostTimeout,
    v29,
    v30,
    v31,
    digitizerDisplayUUIDs,
    buttonDisplayUUIDs,
    keyboardDisplayUUIDs,
    v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (unint64_t)tagIndex
{
  return self->_tagIndex;
}

- (void)setTag:(id)a3
{
  void *tag;
  void *v5;
  void *v6;
  NSCopying *v7;
  NSCopying *v8;
  unint64_t v9;
  unint64_t v10;

  v10 = (unint64_t)a3;
  tag = (void *)(v10 | (unint64_t)self->_tag);
  if (!tag)
  {
    v6 = 0;
LABEL_8:
    self->_tag = 0;

    v9 = 0;
    goto LABEL_9;
  }
  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_tag)
    objc_msgSend(v5, "decrementTagIndexRefCount:", self->_tagIndex);
  if (!v10)
  {
    tag = self->_tag;
    goto LABEL_8;
  }
  v7 = (NSCopying *)objc_msgSend((id)v10, "copyWithZone:", MEMORY[0x1B5DF8CFC]());
  v8 = self->_tag;
  self->_tag = v7;

  v9 = objc_msgSend(v6, "addTag:", self->_tag);
LABEL_9:
  self->_tagIndex = v9;

}

- (void)setAttentionLostEventMask:(unint64_t)a3
{
  self->_attentionLostEventMask = a3;
  self->_attentionLostEventMaskExplicitlySet = 1;
}

- (void)setSamplingInterval:(double)a3
{
  self->_samplingInterval = a3;
  if (!self->_samplingDelayExplicitlySet)
    self->_samplingDelay = a3;
}

- (void)setSamplingDelay:(double)a3
{
  self->_samplingDelay = a3;
  self->_samplingDelayExplicitlySet = 1;
}

- (NSSet)attentionLostTimeouts
{
  return (NSSet *)(id)-[NSSet copy](self->_attentionLostTimeouts, "copy");
}

- (void)setAttentionLostTimeoutDictionary:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *attentionLostTimeoutDictionary;
  void *v7;
  NSSet *v8;
  NSSet *attentionLostTimeouts;
  id v10;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  attentionLostTimeoutDictionary = self->_attentionLostTimeoutDictionary;
  self->_attentionLostTimeoutDictionary = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "allKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWithArray:", v10);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  attentionLostTimeouts = self->_attentionLostTimeouts;
  self->_attentionLostTimeouts = v8;

}

- (id)allowedHIDEventsForRemoteEvent
{
  return (id)-[NSSet copy](self->_allowedHIDEventsForRemoteEvent, "copy");
}

- (void)setAllowedHIDEventsForRemoteEvent:(id)a3
{
  NSSet *v4;
  NSSet *allowedHIDEventsForRemoteEvent;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
  self->_allowedHIDEventsForRemoteEvent = v4;

}

- (NSCopying)tag
{
  return self->_tag;
}

- (unint64_t)notificationMask
{
  return self->_notificationMask;
}

- (void)setNotificationMask:(unint64_t)a3
{
  self->_notificationMask = a3;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (unint64_t)attentionLostEventMask
{
  return self->_attentionLostEventMask;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (double)samplingDelay
{
  return self->_samplingDelay;
}

- (BOOL)sampleWhileAbsent
{
  return self->_sampleWhileAbsent;
}

- (void)setSampleWhileAbsent:(BOOL)a3
{
  self->_sampleWhileAbsent = a3;
}

- (BOOL)retroactiveTimeoutMode
{
  return self->_retroactiveTimeoutMode;
}

- (void)setRetroactiveTimeoutMode:(BOOL)a3
{
  self->_retroactiveTimeoutMode = a3;
}

- (BOOL)continuousFaceDetectMode
{
  return self->_continuousFaceDetectMode;
}

- (void)setContinuousFaceDetectMode:(BOOL)a3
{
  self->_continuousFaceDetectMode = a3;
}

- (NSSet)digitizerDisplayUUIDs
{
  return self->_digitizerDisplayUUIDs;
}

- (void)setDigitizerDisplayUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSSet)keyboardDisplayUUIDs
{
  return self->_keyboardDisplayUUIDs;
}

- (void)setKeyboardDisplayUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSSet)buttonDisplayUUIDs
{
  return self->_buttonDisplayUUIDs;
}

- (void)setButtonDisplayUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)activateEyeRelief
{
  return self->_activateEyeRelief;
}

- (void)setActivateEyeRelief:(BOOL)a3
{
  self->_activateEyeRelief = a3;
}

- (BOOL)activateAttentionDetection
{
  return self->_activateAttentionDetection;
}

- (void)setActivateAttentionDetection:(BOOL)a3
{
  self->_activateAttentionDetection = a3;
}

- (BOOL)activateMotionDetect
{
  return self->_activateMotionDetect;
}

- (void)setActivateMotionDetect:(BOOL)a3
{
  self->_activateMotionDetect = a3;
}

- (BOOL)unityStream
{
  return self->_unityStream;
}

- (void)setUnityStream:(BOOL)a3
{
  self->_unityStream = a3;
}

- (BOOL)pollingFilter
{
  return self->_pollingFilter;
}

- (void)setPollingFilter:(BOOL)a3
{
  self->_pollingFilter = a3;
}

- (BOOL)nonSampledAttentionLostTimeoutEnable
{
  return self->_nonSampledAttentionLostTimeoutEnable;
}

- (void)setNonSampledAttentionLostTimeoutEnable:(BOOL)a3
{
  self->_nonSampledAttentionLostTimeoutEnable = a3;
}

- (double)nonSampledAttentionLostTimeout
{
  return self->_nonSampledAttentionLostTimeout;
}

- (void)setNonSampledAttentionLostTimeout:(double)a3
{
  self->_nonSampledAttentionLostTimeout = a3;
}

+ (void)initialize
{
  +[AWClientPreferences initializePreferences](AWClientPreferences, "initializePreferences");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)supportedEvents
{
  void *v2;
  unint64_t v3;

  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedEvents");

  return v3;
}

+ (id)supportedEventsString
{
  return getEventMaskDescription(objc_msgSend(a1, "supportedEvents"));
}

+ (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  AWNotification_s *v8;

  v5 = a4;
  v6 = a3;
  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (AWNotification_s *)objc_msgSend(v7, "notifySupportedEventsChangedWithQueue:block:", v6, v5);

  return v8;
}

+ (void)cancelNotification:(AWNotification_s *)a3
{
  id v4;

  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelNotification:", a3);

}

@end
