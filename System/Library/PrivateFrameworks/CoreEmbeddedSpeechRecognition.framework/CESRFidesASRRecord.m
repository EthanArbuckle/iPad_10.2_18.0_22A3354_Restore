@implementation CESRFidesASRRecord

- (CESRFidesASRRecord)initWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10
{
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CESRFidesASRRecord *v22;
  NSMutableArray *v23;
  NSMutableArray *audioPackets;
  uint64_t v25;
  NSString *language;
  uint64_t v27;
  NSString *task;
  uint64_t v29;
  NSArray *context;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSString *UUIDString;
  uint64_t v35;
  NSString *interactionIdentifier;
  uint64_t v37;
  NSString *asrSelfComponentIdentifier;
  uint64_t v39;
  NSString *pluginId;
  void *v41;
  double v42;
  objc_super v44;

  v12 = a6;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CESRFidesASRRecord;
  v22 = -[CESRFidesASRRecord init](&v44, sel_init);
  if (v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    audioPackets = v22->_audioPackets;
    v22->_audioPackets = v23;

    v25 = objc_msgSend(v16, "copy");
    language = v22->_language;
    v22->_language = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    task = v22->_task;
    v22->_task = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    context = v22->_context;
    v22->_context = (NSArray *)v29;

    v31 = 16000;
    if (v12)
      v31 = 8000;
    v22->_samplingRate = v31;
    v22->_farField = a7;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = objc_claimAutoreleasedReturnValue();
    UUIDString = v22->_UUIDString;
    v22->_UUIDString = (NSString *)v33;

    v22->_hasRecognizedAnything = 0;
    v35 = objc_msgSend(v19, "copy");
    interactionIdentifier = v22->_interactionIdentifier;
    v22->_interactionIdentifier = (NSString *)v35;

    v37 = objc_msgSend(v20, "copy");
    asrSelfComponentIdentifier = v22->_asrSelfComponentIdentifier;
    v22->_asrSelfComponentIdentifier = (NSString *)v37;

    v39 = objc_msgSend(v21, "copy");
    pluginId = v22->_pluginId;
    v22->_pluginId = (NSString *)v39;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSince1970");
    v22->_timestamp = v42;

    v22->_audioExceededMaxDuration = 0;
  }

  return v22;
}

- (void)addAudioPacket:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  if (!self->_originalAudioFileURL && self->_samplingRate)
  {
    v6 = v4;
    v5 = self->_collectedAudioDurationMS
       + (double)((unint64_t)objc_msgSend(v4, "length") >> 1) / (double)self->_samplingRate * 1000.0;
    if (v5 <= 60000.0)
    {
      self->_collectedAudioDurationMS = v5;
      -[NSMutableArray addObject:](self->_audioPackets, "addObject:", v6);
    }
    else
    {
      self->_audioExceededMaxDuration = 1;
    }
    v4 = v6;
  }

}

- (BOOL)hasData
{
  uint64_t v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_originalAudioFileURL)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = self->_audioPackets;
    v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "length", (_QWORD)v7))
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v2;
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (double)_audioPacketsDuration
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_samplingRate)
    return 0.0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_audioPackets;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "length", (_QWORD)v11);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
    v9 = (double)(v6 >> 1);
  }
  else
  {
    v9 = 0.0;
  }

  return v9 / (double)self->_samplingRate;
}

- (id)concatenatedAudioPackets
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_audioPackets;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendData:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *UUIDString;
  NSArray *context;
  _BOOL8 farField;
  unint64_t samplingRate;
  NSString *task;
  __int128 v12;
  void *v13;
  objc_super v14;

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)CESRFidesASRRecord;
  -[CESRFidesASRRecord description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_pluginId;
  samplingRate = self->_samplingRate;
  task = self->_task;
  farField = self->_farField;
  UUIDString = self->_UUIDString;
  context = self->_context;
  -[CESRFidesASRRecord _audioPacketsDuration](self, "_audioPacketsDuration");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, pluginId=%@, language=%@, task=%@, samplingRate=%ld, farField=%d, context=%@, UUIDString=%@, audioPackets(duration)=%f, hasRecognizedAnything=%d, interactionIdentifier=%@, asrSelfComponentIdentifier=%@, correctedText=%@, correctedTextV2=%@, recognizedText=%@, postITNRecognizedText=%@, recognizedNbest(count)=%lu, personalizedLMUsed=%d, applicationName=%@, date=%@, timestamp=%f, alternatives=%@, profile(length)=%ld, originalAudioFileURL=%@"), v3, v12, task, samplingRate, farField, context, UUIDString, v4, self->_hasRecognizedAnything, self->_interactionIdentifier, self->_asrSelfComponentIdentifier, self->_correctedText, self->_correctedTextV2, self->_recognizedText, self->_postITNRecognizedText, -[NSArray count](self->_recognizedNbest, "count"),
    self->_personalizedLMUsed,
    self->_applicationName,
    self->_date,
    *(_QWORD *)&self->_timestamp,
    self->_alternatives,
    -[NSData length](self->_profile, "length"),
    self->_originalAudioFileURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCorrectedText:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_audioExceededMaxDuration)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctedText, a3);
    v5 = v6;
  }

}

- (void)setCorrectedTextV2:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_audioExceededMaxDuration)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctedTextV2, a3);
    v5 = v6;
  }

}

- (CESRFidesASRRecord)initWithCoder:(id)a3
{
  id v4;
  CESRFidesASRRecord *v5;
  uint64_t v6;
  NSString *pluginId;
  uint64_t v8;
  NSString *language;
  uint64_t v10;
  NSString *task;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *context;
  uint64_t v20;
  NSString *UUIDString;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableArray *audioPackets;
  uint64_t v31;
  NSString *interactionIdentifier;
  uint64_t v33;
  NSString *asrSelfComponentIdentifier;
  uint64_t v35;
  NSString *correctedText;
  uint64_t v37;
  NSString *correctedTextV2;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *recognizedText;
  uint64_t v47;
  NSString *postITNRecognizedText;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSArray *recognizedNbest;
  uint64_t v57;
  NSString *applicationName;
  uint64_t v59;
  NSString *date;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSArray *alternatives;
  uint64_t v70;
  NSData *profile;
  uint64_t v72;
  NSURL *originalAudioFileURL;

  v4 = a3;
  v5 = -[CESRFidesASRRecord init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pluginId"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluginId = v5->_pluginId;
    v5->_pluginId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_language"));
    v8 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_task"));
    v10 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (NSString *)v10;

    v5->_samplingRate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_samplingRate"));
    v5->_farField = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_farField"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_context"));
    v18 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UUIDString"));
    v20 = objc_claimAutoreleasedReturnValue();
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("_audioPackets"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    audioPackets = v5->_audioPackets;
    v5->_audioPackets = (NSMutableArray *)v29;

    v5->_hasRecognizedAnything = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasRecognizedAnything"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interactionIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    interactionIdentifier = v5->_interactionIdentifier;
    v5->_interactionIdentifier = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_asrSelfComponentIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    asrSelfComponentIdentifier = v5->_asrSelfComponentIdentifier;
    v5->_asrSelfComponentIdentifier = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_correctedText"));
    v35 = objc_claimAutoreleasedReturnValue();
    correctedText = v5->_correctedText;
    v5->_correctedText = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_correctedTextV2"));
    v37 = objc_claimAutoreleasedReturnValue();
    correctedTextV2 = v5->_correctedTextV2;
    v5->_correctedTextV2 = (NSString *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("_recognizedText"));
    v45 = objc_claimAutoreleasedReturnValue();
    recognizedText = v5->_recognizedText;
    v5->_recognizedText = (NSArray *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_postITNRecognizedText"));
    v47 = objc_claimAutoreleasedReturnValue();
    postITNRecognizedText = v5->_postITNRecognizedText;
    v5->_postITNRecognizedText = (NSString *)v47;

    v49 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v51, v52, v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("_recognizedNbest"));
    v55 = objc_claimAutoreleasedReturnValue();
    recognizedNbest = v5->_recognizedNbest;
    v5->_recognizedNbest = (NSArray *)v55;

    v5->_personalizedLMUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_personalizedLMUsed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationName"));
    v57 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v59 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSString *)v59;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v5->_timestamp = v61;
    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, v64, v65, v66, objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("_alternatives"));
    v68 = objc_claimAutoreleasedReturnValue();
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSArray *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_profile"));
    v70 = objc_claimAutoreleasedReturnValue();
    profile = v5->_profile;
    v5->_profile = (NSData *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalAudioFileURL"));
    v72 = objc_claimAutoreleasedReturnValue();
    originalAudioFileURL = v5->_originalAudioFileURL;
    v5->_originalAudioFileURL = (NSURL *)v72;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSURL *originalAudioFileURL;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSMutableArray *audioPackets;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_pluginId, CFSTR("_pluginId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_language, CFSTR("_language"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_task, CFSTR("_task"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_samplingRate, CFSTR("_samplingRate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_farField, CFSTR("_farField"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("_context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_UUIDString, CFSTR("_UUIDString"));
  originalAudioFileURL = self->_originalAudioFileURL;
  if (originalAudioFileURL)
  {
    v6 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[CESRFidesASRRecord encodeWithCoder:]";
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Skipping audio bytes and save originalAudioFileURL instead", (uint8_t *)&v10, 0xCu);
      originalAudioFileURL = self->_originalAudioFileURL;
    }
    v7 = CFSTR("_originalAudioFileURL");
    v8 = v4;
    audioPackets = (NSMutableArray *)originalAudioFileURL;
  }
  else
  {
    audioPackets = self->_audioPackets;
    v7 = CFSTR("_audioPackets");
    v8 = v4;
  }
  objc_msgSend(v8, "encodeObject:forKey:", audioPackets, v7);
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasRecognizedAnything, CFSTR("_hasRecognizedAnything"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_interactionIdentifier, CFSTR("_interactionIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_asrSelfComponentIdentifier, CFSTR("_asrSelfComponentIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correctedText, CFSTR("_correctedText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correctedTextV2, CFSTR("_correctedTextV2"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recognizedText, CFSTR("_recognizedText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_postITNRecognizedText, CFSTR("_postITNRecognizedText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recognizedNbest, CFSTR("_recognizedNbest"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_personalizedLMUsed, CFSTR("_personalizedLMUsed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationName, CFSTR("_applicationName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("_date"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternatives, CFSTR("_alternatives"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_profile, CFSTR("_profile"));

}

- (id)_recordInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_language, CFSTR("language"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_task, CFSTR("task"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_samplingRate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("samplingRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_farField);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("farField"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_interactionIdentifier, CFSTR("interactionIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_asrSelfComponentIdentifier, CFSTR("asrSelfComponentIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personalizedLMUsed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("personalizedLMUsed"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_applicationName, CFSTR("applicationName"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CESRFidesASRRecord _audioPacketsDuration](self, "_audioPacketsDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioPacketsDuration"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_date, CFSTR("date"));
  return v3;
}

- (id)_recordData
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
  {
    v4 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[CESRFidesASRRecord _recordData]";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Unable to serialize DES record: %@", buf, 0x16u);
    }
  }

  return v2;
}

- (void)save
{
  void *v3;
  NSString *v4;
  NSString *date;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_hasRecognizedAnything)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", self->_pluginId);
    -[CESRFidesASRRecord todaysDate](self, "todaysDate");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v4;

    -[CESRFidesASRRecord _recordInfo](self, "_recordInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CESRFidesASRRecord _recordData](self, "_recordData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_DEBUG))
    {
      v10 = v8;
      *(_DWORD *)buf = 136315650;
      v13 = "-[CESRFidesASRRecord save]";
      v14 = 2114;
      v15 = v6;
      v16 = 2050;
      v17 = objc_msgSend(v7, "length");
      _os_log_debug_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_DEBUG, "%s Creating DES record (SPI v2): %{public}@, %{public}zu bytes", buf, 0x20u);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__CESRFidesASRRecord_save__block_invoke;
    v11[3] = &unk_1E6734180;
    v11[4] = self;
    objc_msgSend(v3, "saveRecordWithData:recordInfo:completion:", v7, v6, v11);

  }
  else
  {
    v9 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CESRFidesASRRecord save]";
      _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Skip DES record creation because of no recognition", buf, 0xCu);
    }
  }
}

- (id)todaysDate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveOneRecordPerDay
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", self->_pluginId);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke;
  v5[3] = &unk_1E67341D0;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "fetchSavedRecordInfoWithCompletion:", v5);

}

- (NSString)pluginId
{
  return self->_pluginId;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)task
{
  return self->_task;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (BOOL)farField
{
  return self->_farField;
}

- (NSArray)context
{
  return self->_context;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSMutableArray)audioPackets
{
  return self->_audioPackets;
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)asrSelfComponentIdentifier
{
  return self->_asrSelfComponentIdentifier;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (NSString)correctedTextV2
{
  return self->_correctedTextV2;
}

- (NSArray)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)recognizedNbest
{
  return self->_recognizedNbest;
}

- (void)setRecognizedNbest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)postITNRecognizedText
{
  return self->_postITNRecognizedText;
}

- (void)setPostITNRecognizedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)personalizedLMUsed
{
  return self->_personalizedLMUsed;
}

- (void)setPersonalizedLMUsed:(BOOL)a3
{
  self->_personalizedLMUsed = a3;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSData)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (void)setOriginalAudioFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_postITNRecognizedText, 0);
  objc_storeStrong((id *)&self->_recognizedNbest, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_correctedTextV2, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_asrSelfComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_audioPackets, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
}

void __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke";
      _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch records.", buf, 0xCu);
    }
  }
  else
  {
    v19 = a1;
    objc_msgSend(*(id *)(a1 + 32), "todaysDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("date"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "isEqualToString:", v8))
          {
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke_2;
            v20[3] = &unk_1E67341A8;
            v18 = *(_QWORD *)(v19 + 32);
            v17 = *(void **)(v19 + 40);
            v20[4] = v14;
            v20[5] = v18;
            objc_msgSend(v17, "deleteSavedRecordWithIdentfier:completion:", v14, v20);

            goto LABEL_14;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(v19 + 32), "save");
LABEL_14:

    v6 = 0;
  }

}

void __41__CESRFidesASRRecord_saveOneRecordPerDay__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6B0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke_2";
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete record: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315394;
      v8 = "-[CESRFidesASRRecord saveOneRecordPerDay]_block_invoke";
      v9 = 2112;
      v10 = v6;
      _os_log_debug_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_DEBUG, "%s Deleted record(%@)", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "save");
  }

}

void __26__CESRFidesASRRecord_save__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0CFE6B0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = 136315650;
      v11 = "-[CESRFidesASRRecord save]_block_invoke";
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s Could not write DES record for SPI v2 %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v10 = 136315650;
    v11 = "-[CESRFidesASRRecord save]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s DES Record created for SPI v2 %@: %@", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CFE7C8], "logDESRecordingForLanguage:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v6);

}

+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v11 = a7;
  v12 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", v21);
  if ((objc_msgSend(v22, "shouldMakeRecord") & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfComponentIdentifier:pluginId:", v16, v17, v18, v12, v11, v19, v20, v21);
  }
  else
  {
    v24 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CESRFidesASRRecord recordWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfCompon"
            "entIdentifier:pluginId:]";
      _os_log_impl(&dword_1B3E5F000, v24, OS_LOG_TYPE_INFO, "%s Lost the lottery: not creating DES record this time", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)recordWithLanguage:(id)a3 task:(id)a4 context:(id)a5 narrowband:(BOOL)a6 farField:(BOOL)a7 interactionIdentifier:(id)a8 asrSelfComponentIdentifier:(id)a9 pluginId:(id)a10 frequency:(unint64_t)a11
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v26 = a7;
  v12 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", v21);
  if ((objc_msgSend(v22, "shouldMakeRecordWithFrequency:", a11) & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfComponentIdentifier:pluginId:", v16, v17, v18, v12, v26, v19, v20, v21);
  }
  else
  {
    v24 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "+[CESRFidesASRRecord recordWithLanguage:task:context:narrowband:farField:interactionIdentifier:asrSelfCompon"
            "entIdentifier:pluginId:frequency:]";
      _os_log_impl(&dword_1B3E5F000, v24, OS_LOG_TYPE_INFO, "%s Lost the lottery: not creating DES record this time", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)recordFromData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v10 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v10);

  v6 = v10;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");
  if (!v7)
  {
    v8 = *MEMORY[0x1E0CFE6B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[CESRFidesASRRecord recordFromData:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s DES record unarchive error: %@", buf, 0x16u);
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)deleteAllRecordsForPlugin:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CESRFidesASRRecord_deleteAllRecordsForPlugin_completion___block_invoke;
  v10[3] = &unk_1E6734828;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "deleteAllSavedRecordsWithCompletion:", v10);

}

void __59__CESRFidesASRRecord_deleteAllRecordsForPlugin_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6B0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "+[CESRFidesASRRecord deleteAllRecordsForPlugin:completion:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete all records for plugin=%@ with error=%@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6B0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "+[CESRFidesASRRecord deleteAllRecordsForPlugin:completion:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Successfully deleted all records for plugin=%@", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

@end
