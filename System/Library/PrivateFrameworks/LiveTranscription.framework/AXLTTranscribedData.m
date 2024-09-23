@implementation AXLTTranscribedData

- (AXLTTranscribedData)initWithTranscription:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  AXLTTranscribedData *v20;
  AXLTTranscribedData *v21;
  uint64_t v22;
  NSArray *nonUpdatingSegments;
  NSString *transcribedText;
  void *v25;
  uint64_t v26;
  NSString *v27;
  id v29;
  objc_super v30;

  v17 = a3;
  v18 = a5;
  v19 = a7;
  v29 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AXLTTranscribedData;
  v20 = -[AXLTTranscribedData init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transcription, a3);
    objc_msgSend(v17, "nonUpdatingSegments");
    v22 = objc_claimAutoreleasedReturnValue();
    nonUpdatingSegments = v21->_nonUpdatingSegments;
    v21->_nonUpdatingSegments = (NSArray *)v22;

    v21->_requestType = a4;
    v21->_pid = a6;
    objc_storeStrong((id *)&v21->_timestamp, a5);
    objc_storeStrong((id *)&v21->_appID, a7);
    objc_storeStrong((id *)&v21->_appName, a8);
    v21->_downloadProgress = a9;
    v21->_silence = a10;
    if (!v17)
    {
      transcribedText = v21->_transcribedText;
      v21->_transcribedText = (NSString *)&stru_24F8757C0;

    }
    -[AXLTTranscribedData transcription](v21, "transcription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "formattedString");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v21->_transcribedText;
    v21->_transcribedText = (NSString *)v26;

  }
  return v21;
}

- (AXLTTranscribedData)initWithTranscribedText:(id)a3 requestType:(int64_t)a4 timestamp:(id)a5 pid:(int)a6 appID:(id)a7 appName:(id)a8 downloadProgress:(int64_t)a9 silence:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  AXLTTranscribedData *v20;
  AXLTTranscribedData *v21;
  AXLTTranscription *transcription;
  objc_super v25;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)AXLTTranscribedData;
  v20 = -[AXLTTranscribedData init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    transcription = v20->_transcription;
    v20->_transcription = 0;

    objc_storeStrong((id *)&v21->_transcribedText, a3);
    v21->_requestType = a4;
    v21->_pid = a6;
    objc_storeStrong((id *)&v21->_timestamp, a5);
    objc_storeStrong((id *)&v21->_appID, a7);
    objc_storeStrong((id *)&v21->_appName, a8);
    v21->_downloadProgress = a9;
    v21->_silence = a10;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AXLTTranscribedData transcription](self, "transcription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("AXLTTranscribedDataTranscriptionKey"));

  -[AXLTTranscribedData transcribedText](self, "transcribedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("AXLTTranscribedDataTranscribedTextKey"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[AXLTTranscribedData requestType](self, "requestType"), CFSTR("AXLTTranscribedDataRequestTypeKey"));
  objc_msgSend(v9, "encodeInt:forKey:", -[AXLTTranscribedData pid](self, "pid"), CFSTR("AXLTTranscribedDataPIDKey"));
  -[AXLTTranscribedData timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("AXLTTranscribedDataTimestampKey"));

  -[AXLTTranscribedData appID](self, "appID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("AXLTTranscribedDataAppIDKey"));

  -[AXLTTranscribedData appName](self, "appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("AXLTTranscribedDataAppNameKey"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[AXLTTranscribedData downloadProgress](self, "downloadProgress"), CFSTR("AXLTTranscribedDataDownloadProgressKey"));
  objc_msgSend(v9, "encodeBool:forKey:", -[AXLTTranscribedData isSilence](self, "isSilence"), CFSTR("AXLTTranscribedDataIsSilenceKey"));

}

- (AXLTTranscribedData)initWithCoder:(id)a3
{
  id v4;
  AXLTTranscribedData *v5;
  uint64_t v6;
  AXLTTranscription *transcription;
  uint64_t v8;
  NSString *transcribedText;
  uint64_t v10;
  NSDate *timestamp;
  uint64_t v12;
  NSString *appID;
  uint64_t v14;
  NSString *appName;

  v4 = a3;
  v5 = -[AXLTTranscribedData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXLTTranscribedDataTranscriptionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    transcription = v5->_transcription;
    v5->_transcription = (AXLTTranscription *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXLTTranscribedDataTranscribedTextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    transcribedText = v5->_transcribedText;
    v5->_transcribedText = (NSString *)v8;

    v5->_requestType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AXLTTranscribedDataRequestTypeKey"));
    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("AXLTTranscribedDataPIDKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXLTTranscribedDataTimestampKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXLTTranscribedDataAppIDKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    appID = v5->_appID;
    v5->_appID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXLTTranscribedDataAppNameKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v14;

    v5->_downloadProgress = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AXLTTranscribedDataDownloadProgressKey"));
    v5->_silence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AXLTTranscribedDataIsSilenceKey"));
  }

  return v5;
}

- (AXLTTranscription)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_transcription, a3);
}

- (NSArray)nonUpdatingSegments
{
  return self->_nonUpdatingSegments;
}

- (void)setNonUpdatingSegments:(id)a3
{
  objc_storeStrong((id *)&self->_nonUpdatingSegments, a3);
}

- (NSString)transcribedText
{
  return self->_transcribedText;
}

- (void)setTranscribedText:(id)a3
{
  objc_storeStrong((id *)&self->_transcribedText, a3);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (int64_t)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(int64_t)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)isSilence
{
  return self->_silence;
}

- (void)setSilence:(BOOL)a3
{
  self->_silence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_transcribedText, 0);
  objc_storeStrong((id *)&self->_nonUpdatingSegments, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
}

@end
