@implementation BMStoreEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBodyData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_eventBody, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *eventBodyData;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  eventBodyData = self->_eventBodyData;
  v13 = v4;
  if (eventBodyData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", eventBodyData, CFSTR("eventBody"));
  }
  else
  {
    -[BMStoreData serialize](self->_eventBody, "serialize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("eventBody"));

  }
  NSStringFromClass(self->_dataType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("classString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_eventBodyDataVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("eventDataVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_error);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("storeError"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventCategory);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("eventCategory"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_segmentName, CFSTR("segmentName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_frameOffset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("frameOffset"));

}

- (NSData)eventBodyData
{
  return self->_eventBodyData;
}

- (BMStoreData)eventBody
{
  return (BMStoreData *)-[BMStoreEvent eventBodyKeepingBackingData:](self, "eventBodyKeepingBackingData:", 0);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)eventBodyKeepingBackingData:(BOOL)a3
{
  BMStoreData *eventBody;
  BMStoreData *v5;
  void *v8;
  uint64_t *p_dataType;
  BMFrame *frame;
  NSData *eventBodyData;
  BMStoreData *v12;
  BMStoreData *v13;
  BMStoreData *v14;
  NSData *v15;
  BMStoreData *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  BMStoreData *v45;
  BMStoreData *v46;
  NSData *v47;
  NSString *segmentName;
  unint64_t v49;
  NSUInteger v50;
  Class dataType;
  unsigned int eventBodyDataVersion;
  uint8_t buf[4];
  __CFString *v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  NSUInteger v58;
  __int16 v59;
  Class v60;
  __int16 v61;
  unsigned int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  eventBody = self->_eventBody;
  if (!eventBody)
  {
    v8 = (void *)MEMORY[0x1AF4163D4]();
    p_dataType = (uint64_t *)&self->_dataType;
    if (self->_dataType)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        frame = self->_frame;
        if (frame && -[BMFrame state](frame, "state") != 1)
        {
          __biome_log_for_category();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = -[BMFrame state](self->_frame, "state");
            if (v35 >= 6)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), v35);
              v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v36 = off_1E5565DC8[v35];
            }
            *(_DWORD *)buf = 138543362;
            v54 = v36;
            _os_log_impl(&dword_1A95BD000, v34, OS_LOG_TYPE_INFO, "Frame is in state %{public}@, unable to decode", buf, 0xCu);

          }
          goto LABEL_26;
        }
        eventBodyData = self->_eventBodyData;
        if (eventBodyData)
        {
          -[objc_class eventWithData:dataVersion:](self->_dataType, "eventWithData:dataVersion:", eventBodyData, self->_eventBodyDataVersion);
          v12 = (BMStoreData *)objc_claimAutoreleasedReturnValue();
          v13 = self->_eventBody;
          self->_eventBody = v12;

          v14 = self->_eventBody;
          if (v14)
          {
            if (!a3)
            {
              v15 = self->_eventBodyData;
              self->_eventBodyData = 0;

              v14 = self->_eventBody;
            }
            v16 = v14;
            goto LABEL_27;
          }
          __biome_log_for_category();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            segmentName = self->_segmentName;
            v49 = -[BMFrame offset](self->_frame, "offset");
            v50 = -[NSData length](self->_eventBodyData, "length");
            dataType = self->_dataType;
            eventBodyDataVersion = self->_eventBodyDataVersion;
            *(_DWORD *)buf = 138544386;
            v54 = (__CFString *)segmentName;
            v55 = 2048;
            v56 = v49;
            v57 = 2048;
            v58 = v50;
            v59 = 2114;
            v60 = dataType;
            v61 = 1024;
            v62 = eventBodyDataVersion;
            _os_log_error_impl(&dword_1A95BD000, v44, OS_LOG_TYPE_ERROR, "Failed to deserialize event segment '%{public}@' offset '%lu' length '%lu' class '%{public}@' version '%u'", buf, 0x30u);
          }

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v45 = (BMStoreData *)objc_claimAutoreleasedReturnValue();
          v46 = self->_eventBody;
          self->_eventBody = v45;

          v47 = self->_eventBodyData;
          self->_eventBodyData = 0;

LABEL_26:
          v16 = 0;
LABEL_27:
          objc_autoreleasePoolPop(v8);
          return v16;
        }
        __biome_log_for_category();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[BMStoreEvent eventBodyKeepingBackingData:].cold.2(v25, v37, v38, v39, v40, v41, v42, v43);
      }
      else
      {
        __biome_log_for_category();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[BMStoreEvent eventBodyKeepingBackingData:].cold.3(p_dataType, v25, v33);
      }
    }
    else
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[BMStoreEvent eventBodyKeepingBackingData:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
  v5 = (BMStoreData *)objc_claimAutoreleasedReturnValue();

  if (eventBody != v5)
    return self->_eventBody;
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[BMStoreEvent eventBodyKeepingBackingData:].cold.4(v17, v18, v19, v20, v21, v22, v23, v24);

  return 0;
}

- (Class)dataType
{
  return self->_dataType;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (unsigned)error
{
  return self->_error;
}

- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 error:(unsigned __int8)a5 eventCategory:(unint64_t)a6 metadata:(id)a7 dataType:(Class)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BMStoreEvent *v20;
  uint64_t v22;

  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = objc_msgSend(v16, "offset");
  objc_msgSend(v16, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "dataVersion");
  objc_msgSend(v16, "creationTimestamp");
  LOBYTE(v22) = a5;
  v20 = -[BMStoreEvent initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:](self, "initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:", v16, v15, v17, v18, v19, a8, a6, v14, v22);

  return v20;
}

- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 frameOffset:(unint64_t)a5 eventBodyData:(id)a6 eventBodyDataVersion:(unsigned int)a7 dataType:(Class)a8 eventCategory:(unint64_t)a9 timestamp:(double)a10 metadata:(id)a11 error:(unsigned __int8)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  BMStoreEvent *v24;
  BMStoreEvent *v25;
  uint64_t v26;
  NSString *segmentName;
  uint64_t v28;
  NSData *eventBodyData;
  objc_super v31;

  v20 = a3;
  v21 = a4;
  v22 = a6;
  v23 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMStoreEvent;
  v24 = -[BMStoreEvent init](&v31, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_frame, a3);
    v26 = objc_msgSend(v21, "copy");
    segmentName = v25->_segmentName;
    v25->_segmentName = (NSString *)v26;

    v25->_frameOffset = a5;
    if (v22)
    {
      v28 = objc_msgSend(v22, "copy");
    }
    else
    {
      objc_msgSend(v20, "data");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    eventBodyData = v25->_eventBodyData;
    v25->_eventBodyData = (NSData *)v28;

    v25->_eventBodyDataVersion = a7;
    v25->_eventCategory = a9;
    if (!a8)
      a8 = (Class)objc_msgSend(v23, "eventDataClass");
    v25->_dataType = a8;
    v25->_timestamp = a10;
    objc_storeStrong((id *)&v25->_metadata, a11);
    v25->_error = a12;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMStoreEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  BMStoreEvent *v9;
  Class v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD block[5];
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segmentName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classString"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = (Class)objc_msgSend(v7, "eventDataClass");
    goto LABEL_5;
  }
  if (!-[BMStoreEvent checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v8, CFSTR("classString"), v4, CFSTR("com.apple.Biome.BMStoreEvent"), -1))
  {
    v10 = NSClassFromString(v8);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__BMStoreEvent_initWithCoder___block_invoke;
      block[3] = &unk_1E5565DA8;
      block[4] = buf;
      if (initWithCoder__onceToken != -1)
        dispatch_once(&initWithCoder__onceToken, block);
      v19 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1A95BD000, v18, v19, "Class \"%@\" doesn't conform to BMStoreData", buf, 0xCu);
      }

      goto LABEL_21;
    }
    objc_msgSend(v4, "allowedClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v10);

    if ((v14 & 1) == 0)
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 16;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __30__BMStoreEvent_initWithCoder___block_invoke_31;
      v34[3] = &unk_1E5565DA8;
      v34[4] = buf;
      if (initWithCoder__onceToken_30 != -1)
        dispatch_once(&initWithCoder__onceToken_30, v34);
      v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v15, v16))
      {
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1A95BD000, v15, v16, "Event class '%@' missing from %@ allowedClasses", buf, 0x16u);
      }

    }
LABEL_5:
    if (v10)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventBody"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (!-[BMStoreEvent checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v11, CFSTR("eventBody"), v4, CFSTR("com.apple.Biome.BMStoreEvent"), -1))
      {
        v33 = v5;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDataVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[BMStoreEvent checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v12, CFSTR("eventDataVersion"), v4, CFSTR("com.apple.Biome.BMStoreEvent"), -1))
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventCategory"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
          v32 = v12;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeError"));
          v31 = v6;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v31, "unsignedIntValue");
          v29 = objc_msgSend(v32, "unsignedIntValue");
          v24 = objc_msgSend(v21, "unsignedIntValue");
          objc_msgSend(v22, "doubleValue");
          v26 = v25;
          LOBYTE(v28) = objc_msgSend(v23, "unsignedIntValue");
          self = -[BMStoreEvent initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:](self, "initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:", 0, v33, v30, v11, v29, v10, v26, v24, v7, v28);

          v6 = v31;
          v12 = v32;

          v9 = self;
        }

        v5 = v33;
        goto LABEL_26;
      }
LABEL_23:
      v9 = 0;
LABEL_26:

      goto LABEL_27;
    }
LABEL_21:
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMStoreEvent initWithCoder:].cold.1((uint64_t)v8, v11, v20);
    goto LABEL_23;
  }
  v9 = 0;
LABEL_27:

  return v9;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (id)bookmark
{
  void *v3;
  void *v4;
  NSString *segmentName;
  BMStoreBookmark *v6;
  void *v7;
  BMStoreBookmark *v8;

  -[BMStoreEvent metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    segmentName = self->_segmentName;

    if (!segmentName)
    {
      v8 = 0;
      return v8;
    }
    v6 = [BMStoreBookmark alloc];
    -[BMStoreEvent metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streamId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:](v6, "initWithStream:segment:iterationStartTime:offset:", v7, self->_segmentName, self->_frameOffset, CFAbsoluteTimeGetCurrent());

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4
{
  return -[BMStoreEvent initWithFrame:segmentName:error:eventCategory:metadata:dataType:](self, "initWithFrame:segmentName:error:eventCategory:metadata:dataType:", a3, 0, a4, 0, 0, 0);
}

- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4 metadata:(id)a5
{
  return -[BMStoreEvent initWithFrame:segmentName:error:eventCategory:metadata:dataType:](self, "initWithFrame:segmentName:error:eventCategory:metadata:dataType:", a3, 0, a4, 0, a5, 0);
}

uint64_t __30__BMStoreEvent_initWithCoder___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __30__BMStoreEvent_initWithCoder___block_invoke_31(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (id)eventWithEventType:(Class)a3 eventData:(id)a4 dataVersion:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  NSObject *v9;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class eventWithData:dataVersion:](a3, "eventWithData:dataVersion:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMStoreEvent eventWithEventType:eventData:dataVersion:].cold.1(a3, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSString *segmentName;
  char v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_26;
  }
  v7 = v6;
  -[BMStoreEvent eventBody](self, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "eventBody");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[BMStoreEvent eventBody](self, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqual:", v9);

  if (!v8)
    goto LABEL_8;
LABEL_9:

  -[BMStoreEvent metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v7, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v15 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[BMStoreEvent metadata](self, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (!v12)
    goto LABEL_14;
LABEL_15:

  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | v7[3])
    v17 = -[NSString isEqualToString:](segmentName, "isEqualToString:");
  else
    v17 = 1;
  if ((v10 & v15) == 1
    && (-[BMStoreEvent timestamp](self, "timestamp"), v19 = v18, objc_msgSend(v7, "timestamp"), v19 == v20)
    && (v21 = -[BMStoreEvent eventCategory](self, "eventCategory"), v21 == objc_msgSend(v7, "eventCategory")))
  {
    if (self->_frameOffset == v7[4])
      v11 = v17;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }

LABEL_26:
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;

  -[BMStoreEvent eventBody](self, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMStoreEvent timestamp](self, "timestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[BMStoreEvent metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ v4 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMStoreEvent eventCategory](self, "eventCategory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_frameOffset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  v14 = v13 ^ -[NSString hash](self->_segmentName, "hash");

  return v14;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (BMFrame)frame
{
  return self->_frame;
}

- (BMStreamMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)eventBodyDataVersion
{
  return self->_eventBodyDataVersion;
}

- (BMStoreEvent)initWithEventBody:(id)a3 timestamp:(double)a4
{
  id v7;
  void *v8;
  BMStoreEvent *v9;
  BMStoreEvent *v10;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[BMStoreEvent initWithFrame:error:](self, "initWithFrame:error:", v8, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventBody, a3);
    v10->_timestamp = a4;
    v10->_dataType = (Class)objc_opt_class();
  }

  return v10;
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A95BD000, a1, a3, "Event class is missing. We can't deserialize", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A95BD000, a1, a3, "Event data is missing. We can't deserialize", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.3(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, a3, "Event class - %{public}@ doesn't conform to BMStoreData protocol", (uint8_t *)&v4);
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A95BD000, a1, a3, "Returning nil for eventBody that previously failed decoding", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, a3, "Unable to determine event class from string, verify that the following class definition is available at runtime - %@", (uint8_t *)&v3);
}

+ (void)eventWithEventType:(objc_class *)a1 eventData:(NSObject *)a2 dataVersion:.cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, v4, "Event class - %@ doesn't - conform to BMStoreData protocol or Maybe the framework containing the event class isn't linked. We can't deserialize", (uint8_t *)&v5);

}

@end
