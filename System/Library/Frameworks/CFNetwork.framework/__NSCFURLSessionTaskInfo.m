@implementation __NSCFURLSessionTaskInfo

- (__NSCFURLSessionTaskInfo)initWithCoder:(id)a3
{
  id v4;
  __NSCFURLSessionTaskInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)__NSCFURLSessionTaskInfo;
  v5 = -[__NSCFURLSessionTaskInfo init](&v53, sel_init);
  if (v5)
  {
    -[__NSCFURLSessionTaskInfo setIdentifier:](v5, "setIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifier")));
    -[__NSCFURLSessionTaskInfo setTaskKind:](v5, "setTaskKind:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskKind")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("creationTime"));
    -[__NSCFURLSessionTaskInfo setCreationTime:](v5, "setCreationTime:");
    -[__NSCFURLSessionTaskInfo setState:](v5, "setState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state")));
    -[__NSCFURLSessionTaskInfo setSuspendCount:](v5, "setSuspendCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suspendCount")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setTaskDescription:](v5, "setTaskDescription:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setOriginalRequest:](v5, "setOriginalRequest:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setCurrentRequest:](v5, "setCurrentRequest:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setResponse:](v5, "setResponse:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestBeginDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setEarliestBeginDate:](v5, "setEarliestBeginDate:", v10);

    -[__NSCFURLSessionTaskInfo setRespondedToWillBeginDelayedRequestCallback:](v5, "setRespondedToWillBeginDelayedRequestCallback:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("respondedToWillBeginDelayedRequestCallback")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setError:](v5, "setError:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retryError"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setRetryError:](v5, "setRetryError:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setFileURL:](v5, "setFileURL:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadFileURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setDownloadFileURL:](v5, "setDownloadFileURL:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setBundleID:](v5, "setBundleID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setSessionID:](v5, "setSessionID:", v16);

    -[__NSCFURLSessionTaskInfo setHasStarted:](v5, "setHasStarted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStarted")));
    -[__NSCFURLSessionTaskInfo setShouldCancelOnDisconnect:](v5, "setShouldCancelOnDisconnect:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCancelOnDisconnect")));
    -[__NSCFURLSessionTaskInfo setBasePriority:](v5, "setBasePriority:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("basePriority")));
    -[__NSCFURLSessionTaskInfo setBasePrioritySetExplicitly:](v5, "setBasePrioritySetExplicitly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("basePrioritySetExplicitly")));
    -[__NSCFURLSessionTaskInfo setDiscretionary:](v5, "setDiscretionary:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("discretionary")));
    -[__NSCFURLSessionTaskInfo setDiscretionaryOverride:](v5, "setDiscretionaryOverride:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("discretionaryOverride")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifierUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setUniqueIdentifier:](v5, "setUniqueIdentifier:", v17);

    -[__NSCFURLSessionTaskInfo uniqueIdentifier](v5, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = (void *)v20;
      -[__NSCFURLSessionTaskInfo setUniqueIdentifier:](v5, "setUniqueIdentifier:", v20);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storagePartitionIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setStoragePartitionIdentifier:](v5, "setStoragePartitionIdentifier:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setURL:](v5, "setURL:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setDestinationURL:](v5, "setDestinationURL:", v24);

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("options"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setOptions:](v5, "setOptions:", v25);

    if ((objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initializedFromToken")) & 1) != 0)
      v26 = 1;
    else
      v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initializedWithAVAsset"));
    -[__NSCFURLSessionTaskInfo setInitializedWithAVAsset:](v5, "setInitializedWithAVAsset:", v26);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temporaryDestinationURL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setTemporaryDestinationURL:](v5, "setTemporaryDestinationURL:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetTitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setAssetTitle:](v5, "setAssetTitle:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetArtworkData"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v5, "setAssetArtworkData:", v29);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVAssetURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setAVAssetURL:](v5, "setAVAssetURL:", v30);

    -[__NSCFURLSessionTaskInfo setAVAssetDownloadToken:](v5, "setAVAssetDownloadToken:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("AVAssetDownloadToken")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVAssetDownloadChildDownloadSessionIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setAvAssetDownloadChildDownloadSessionIdentifier:](v5, "setAvAssetDownloadChildDownloadSessionIdentifier:", v31);

    -[__NSCFURLSessionTaskInfo setEnableSPIDelegateCallbacks:](v5, "setEnableSPIDelegateCallbacks:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableSPIDelegateCallbacks")));
    gotLoadHelper_x21__OBJC_CLASS___AVAssetDownloadConfiguration(v32);
    if (objc_opt_class())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVAssetDownloadConfiguration"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[__NSCFURLSessionTaskInfo setDownloadConfig:](v5, "setDownloadConfig:", v33);

    }
    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToSend:](v5, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesClientExpectsToSend")));
    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToReceive:](v5, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesClientExpectsToReceive")));
    -[__NSCFURLSessionTaskInfo setCountOfBytesReceived:](v5, "setCountOfBytesReceived:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesReceived")));
    -[__NSCFURLSessionTaskInfo setCountOfBytesSent:](v5, "setCountOfBytesSent:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesSent")));
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToSend:](v5, "setCountOfBytesExpectedToSend:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesExpectedToSend")));
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToReceive:](v5, "setCountOfBytesExpectedToReceive:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesExpectedToReceive")));
    -[__NSCFURLSessionTaskInfo setBytesPerSecondLimit:](v5, "setBytesPerSecondLimit:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bytesPerSecondLimit")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setPersonaUniqueString:](v5, "setPersonaUniqueString:", v34);

    -[__NSCFURLSessionTaskInfo setExpectedProgressTarget:](v5, "setExpectedProgressTarget:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("expectedProgressTarget")));
    -[__NSCFURLSessionTaskInfo setMayBeDemotedToDiscretionary:](v5, "setMayBeDemotedToDiscretionary:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mayBeDemotedToDiscretionary")));
    v35 = objc_msgSend(v4, "containsValueForKey:", CFSTR("_TLSMinimumSupportedProtocolVersion"));
    if (v35)
      LOWORD(v35) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_TLSMinimumSupportedProtocolVersion"));
    -[__NSCFURLSessionTaskInfo set_TLSMinimumSupportedProtocolVersion:](v5, "set_TLSMinimumSupportedProtocolVersion:", (unsigned __int16)v35);
    v36 = objc_msgSend(v4, "containsValueForKey:", CFSTR("_TLSMaximumSupportedProtocolVersion"));
    if (v36)
      LOWORD(v36) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_TLSMaximumSupportedProtocolVersion"));
    -[__NSCFURLSessionTaskInfo set_TLSMaximumSupportedProtocolVersion:](v5, "set_TLSMaximumSupportedProtocolVersion:", (unsigned __int16)v36);
    -[__NSCFURLSessionTaskInfo set_hasSZExtractor:](v5, "set_hasSZExtractor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSZExtractor")));
    -[__NSCFURLSessionTaskInfo set_doesSZExtractorConsumeExtractedData:](v5, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("doesSZExtractorConsumeExtractedData")));
    -[__NSCFURLSessionTaskInfo set_updatedStreamingZipModificationDate:](v5, "set_updatedStreamingZipModificationDate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("updatedStreamingZipModificationDate")));
    -[__NSCFURLSessionTaskInfo setStartedUserInitiated:](v5, "setStartedUserInitiated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("startedUserInitiated")));
    v37 = (void *)MEMORY[0x1E0CB3710];
    if (additionalPropertiesClasses(void)::onceToken != -1)
      dispatch_once(&additionalPropertiesClasses(void)::onceToken, &__block_literal_global_12017);
    v38 = (id)additionalPropertiesClasses(void)::additionalPropertiesClasses;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("additionalProperties"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "unarchivedObjectOfClasses:fromData:error:", v38, v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setAdditionalProperties:](v5, "setAdditionalProperties:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathToDownloadTaskFile"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setPathToDownloadTaskFile:](v5, "setPathToDownloadTaskFile:", v41);

    -[__NSCFURLSessionTaskInfo setRetryCount:](v5, "setRetryCount:", 0);
    v42 = objc_msgSend(v4, "containsValueForKey:", CFSTR("loadingPriority"));
    v43 = 0.5;
    if (v42)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("loadingPriority"), 0.5);
    -[__NSCFURLSessionTaskInfo setLoadingPriority:](v5, "setLoadingPriority:", v43);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("qos")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qos"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[__NSCFURLSessionTaskInfo setQos:](v5, "setQos:", objc_msgSend(v44, "unsignedIntValue"));

    }
    else
    {
      -[__NSCFURLSessionTaskInfo setQos:](v5, "setQos:", qos_class_self());
    }
    v45 = (void *)MEMORY[0x1E0CB3710];
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundTrailers"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v46, v47, v48, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo set_backgroundTrailers:](v5, "set_backgroundTrailers:", v49);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskMetrics"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setTaskMetrics:](v5, "setTaskMetrics:", v50);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resumableUploadData"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo setResumableUploadData:](v5, "setResumableUploadData:", v51);

  }
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v5, "_logTaskUUIDMapping");

  return v5;
}

- (void)set_hasSZExtractor:(BOOL)a3
{
  self->__hasSZExtractor = a3;
}

- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3
{
  self->__doesSZExtractorConsumeExtractedData = a3;
}

- (void)setTaskDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)set_updatedStreamingZipModificationDate:(BOOL)a3
{
  self->__updatedStreamingZipModificationDate = a3;
}

- (void)set_backgroundTrailers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  self->__TLSMinimumSupportedProtocolVersion = a3;
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  self->__TLSMaximumSupportedProtocolVersion = a3;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (void)setTemporaryDestinationURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (void)setTaskMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void)setTaskKind:(unint64_t)a3
{
  self->_taskKind = a3;
}

- (void)setSuspendCount:(unint64_t)a3
{
  self->_suspendCount = a3;
}

- (void)setStoragePartitionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (void)setStartedUserInitiated:(BOOL)a3
{
  self->_startedUserInitiated = a3;
}

- (void)setShouldCancelOnDisconnect:(BOOL)a3
{
  self->_shouldCancelOnDisconnect = a3;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void)setRetryError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setResumableUploadData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void)setRespondedToWillBeginDelayedRequestCallback:(BOOL)a3
{
  self->_respondedToWillBeginDelayedRequestCallback = a3;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (void)setPersonaUniqueString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (void)setPathToDownloadTaskFile:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void)setOriginalRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (void)setMayBeDemotedToDiscretionary:(BOOL)a3
{
  self->_mayBeDemotedToDiscretionary = a3;
}

- (void)setLoadingPriority:(double)a3
{
  self->_loadingPriority = a3;
}

- (void)setInitializedWithAVAsset:(BOOL)a3
{
  self->_initializedWithAVAsset = a3;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void)setExpectedProgressTarget:(unint64_t)a3
{
  self->_expectedProgressTarget = a3;
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setEnableSPIDelegateCallbacks:(BOOL)a3
{
  self->_enableSPIDelegateCallbacks = a3;
}

- (void)setEarliestBeginDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setDownloadFileURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)setDownloadConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (void)setDiscretionaryOverride:(int64_t)a3
{
  self->_discretionaryOverride = a3;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  self->_bytesPerSecondLimit = a3;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void)setBasePrioritySetExplicitly:(BOOL)a3
{
  self->_basePrioritySetExplicitly = a3;
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

- (void)setAvAssetDownloadChildDownloadSessionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (void)setAssetTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void)setAssetArtworkData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void)setAdditionalProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (void)setAVAssetURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (void)setAVAssetDownloadToken:(unint64_t)a3
{
  self->_AVAssetDownloadToken = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a3;
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo identifier](self, "identifier"), CFSTR("identifier"));
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo taskKind](self, "taskKind"), CFSTR("taskKind"));
  -[__NSCFURLSessionTaskInfo creationTime](self, "creationTime");
  objc_msgSend(v47, "encodeDouble:forKey:", CFSTR("creationTime"));
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo state](self, "state"), CFSTR("state"));
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo suspendCount](self, "suspendCount"), CFSTR("suspendCount"));
  -[__NSCFURLSessionTaskInfo taskDescription](self, "taskDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v4, CFSTR("taskDescription"));

  -[__NSCFURLSessionTaskInfo originalRequest](self, "originalRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v5, CFSTR("originalRequest"));

  -[__NSCFURLSessionTaskInfo currentRequest](self, "currentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v6, CFSTR("currentRequest"));

  -[__NSCFURLSessionTaskInfo response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v7, CFSTR("response"));

  -[__NSCFURLSessionTaskInfo earliestBeginDate](self, "earliestBeginDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v8, CFSTR("earliestBeginDate"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo respondedToWillBeginDelayedRequestCallback](self, "respondedToWillBeginDelayedRequestCallback"), CFSTR("respondedToWillBeginDelayedRequestCallback"));
  -[__NSCFURLSessionTaskInfo error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB39B8];
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "code");
      objc_msgSend(v9, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
  }
  objc_msgSend(v47, "encodeObject:forKey:", v9, CFSTR("error"));
  -[__NSCFURLSessionTaskInfo retryError](self, "retryError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB39B8];
      objc_msgSend(v15, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "code");
      objc_msgSend(v15, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v20;
    }
  }
  objc_msgSend(v47, "encodeObject:forKey:", v15, CFSTR("retryError"));
  -[__NSCFURLSessionTaskInfo fileURL](self, "fileURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v21, CFSTR("fileURL"));

  -[__NSCFURLSessionTaskInfo downloadFileURL](self, "downloadFileURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v22, CFSTR("downloadFileURL"));

  -[__NSCFURLSessionTaskInfo bundleID](self, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v23, CFSTR("bundleID"));

  -[__NSCFURLSessionTaskInfo sessionID](self, "sessionID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v24, CFSTR("sessionID"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo hasStarted](self, "hasStarted"), CFSTR("hasStarted"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo shouldCancelOnDisconnect](self, "shouldCancelOnDisconnect"), CFSTR("shouldCancelOnDisconnect"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo basePriority](self, "basePriority"), CFSTR("basePriority"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo basePrioritySetExplicitly](self, "basePrioritySetExplicitly"), CFSTR("basePrioritySetExplicitly"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo isDiscretionary](self, "isDiscretionary"), CFSTR("discretionary"));
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo discretionaryOverride](self, "discretionaryOverride"), CFSTR("discretionaryOverride"));
  -[__NSCFURLSessionTaskInfo uniqueIdentifier](self, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v25, CFSTR("uniqueIdentifierUUID"));

  -[__NSCFURLSessionTaskInfo storagePartitionIdentifier](self, "storagePartitionIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v26, CFSTR("storagePartitionIdentifier"));

  -[__NSCFURLSessionTaskInfo URL](self, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v27, CFSTR("URL"));

  -[__NSCFURLSessionTaskInfo destinationURL](self, "destinationURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v28, CFSTR("destinationURL"));

  -[__NSCFURLSessionTaskInfo options](self, "options");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v29, CFSTR("options"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo initializedWithAVAsset](self, "initializedWithAVAsset"), CFSTR("initializedWithAVAsset"));
  -[__NSCFURLSessionTaskInfo temporaryDestinationURL](self, "temporaryDestinationURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v30, CFSTR("temporaryDestinationURL"));

  -[__NSCFURLSessionTaskInfo assetTitle](self, "assetTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v31, CFSTR("assetTitle"));

  -[__NSCFURLSessionTaskInfo assetArtworkData](self, "assetArtworkData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v32, CFSTR("assetArtworkData"));

  -[__NSCFURLSessionTaskInfo AVAssetURL](self, "AVAssetURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v33, CFSTR("AVAssetURL"));

  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo AVAssetDownloadToken](self, "AVAssetDownloadToken"), CFSTR("AVAssetDownloadToken"));
  -[__NSCFURLSessionTaskInfo avAssetDownloadChildDownloadSessionIdentifier](self, "avAssetDownloadChildDownloadSessionIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v34, CFSTR("AVAssetDownloadChildDownloadSessionIdentifier"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo enableSPIDelegateCallbacks](self, "enableSPIDelegateCallbacks"), CFSTR("enableSPIDelegateCallbacks"));
  -[__NSCFURLSessionTaskInfo downloadConfig](self, "downloadConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v35, CFSTR("AVAssetDownloadConfiguration"));

  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend"), CFSTR("countOfBytesClientExpectsToSend"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive"), CFSTR("countOfBytesClientExpectsToReceive"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesReceived](self, "countOfBytesReceived"), CFSTR("countOfBytesReceived"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesSent](self, "countOfBytesSent"), CFSTR("countOfBytesSent"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesExpectedToSend](self, "countOfBytesExpectedToSend"), CFSTR("countOfBytesExpectedToSend"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive"), CFSTR("countOfBytesExpectedToReceive"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo bytesPerSecondLimit](self, "bytesPerSecondLimit"), CFSTR("bytesPerSecondLimit"));
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo expectedProgressTarget](self, "expectedProgressTarget"), CFSTR("expectedProgressTarget"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[__NSCFURLSessionTaskInfo qos](self, "qos"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v36, CFSTR("qos"));

  -[__NSCFURLSessionTaskInfo personaUniqueString](self, "personaUniqueString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v37, CFSTR("personaUniqueString"));

  -[__NSCFURLSessionTaskInfo loadingPriority](self, "loadingPriority");
  objc_msgSend(v47, "encodeDouble:forKey:", CFSTR("loadingPriority"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo mayBeDemotedToDiscretionary](self, "mayBeDemotedToDiscretionary"), CFSTR("mayBeDemotedToDiscretionary"));
  objc_msgSend(v47, "encodeInt32:forKey:", -[__NSCFURLSessionTaskInfo _TLSMinimumSupportedProtocolVersion](self, "_TLSMinimumSupportedProtocolVersion"), CFSTR("_TLSMinimumSupportedProtocolVersion"));
  objc_msgSend(v47, "encodeInt32:forKey:", -[__NSCFURLSessionTaskInfo _TLSMaximumSupportedProtocolVersion](self, "_TLSMaximumSupportedProtocolVersion"), CFSTR("_TLSMaximumSupportedProtocolVersion"));
  v38 = (void *)MEMORY[0x1E0CB36F8];
  -[__NSCFURLSessionTaskInfo additionalProperties](self, "additionalProperties");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v40, CFSTR("additionalProperties"));

  v41 = (void *)MEMORY[0x1E0CB36F8];
  -[__NSCFURLSessionTaskInfo _backgroundTrailers](self, "_backgroundTrailers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "archivedDataWithRootObject:requiringSecureCoding:error:", v42, 1, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v43, CFSTR("backgroundTrailers"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _hasSZExtractor](self, "_hasSZExtractor"), CFSTR("hasSZExtractor"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _doesSZExtractorConsumeExtractedData](self, "_doesSZExtractorConsumeExtractedData"), CFSTR("doesSZExtractorConsumeExtractedData"));
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _updatedStreamingZipModificationDate](self, "_updatedStreamingZipModificationDate"), CFSTR("updatedStreamingZipModificationDate"));
  -[__NSCFURLSessionTaskInfo pathToDownloadTaskFile](self, "pathToDownloadTaskFile");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v44, CFSTR("pathToDownloadTaskFile"));

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo startedUserInitiated](self, "startedUserInitiated"), CFSTR("startedUserInitiated"));
  -[__NSCFURLSessionTaskInfo taskMetrics](self, "taskMetrics");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v45, CFSTR("taskMetrics"));

  -[__NSCFURLSessionTaskInfo resumableUploadData](self, "resumableUploadData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "encodeObject:forKey:", v46, CFSTR("resumableUploadData"));

}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSData)assetArtworkData
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (NSURL)downloadFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)additionalProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSURL)temporaryDestinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 352, 1);
}

- (unint64_t)suspendCount
{
  return self->_suspendCount;
}

- (NSString)storagePartitionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)startedUserInitiated
{
  return self->_startedUserInitiated;
}

- (BOOL)shouldCancelOnDisconnect
{
  return self->_shouldCancelOnDisconnect;
}

- (NSError)retryError
{
  return (NSError *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)resumableUploadData
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)respondedToWillBeginDelayedRequestCallback
{
  return self->_respondedToWillBeginDelayedRequestCallback;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSString)pathToDownloadTaskFile
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (BOOL)mayBeDemotedToDiscretionary
{
  return self->_mayBeDemotedToDiscretionary;
}

- (double)loadingPriority
{
  return self->_loadingPriority;
}

- (BOOL)initializedWithAVAsset
{
  return self->_initializedWithAVAsset;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (unint64_t)expectedProgressTarget
{
  return self->_expectedProgressTarget;
}

- (BOOL)enableSPIDelegateCallbacks
{
  return self->_enableSPIDelegateCallbacks;
}

- (AVAssetDownloadConfiguration)downloadConfig
{
  return (AVAssetDownloadConfiguration *)objc_getProperty(self, a2, 368, 1);
}

- (int64_t)discretionaryOverride
{
  return self->_discretionaryOverride;
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 296, 1);
}

- (double)creationTime
{
  return self->_creationTime;
}

- (int64_t)bytesPerSecondLimit
{
  return self->_bytesPerSecondLimit;
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (BOOL)basePrioritySetExplicitly
{
  return self->_basePrioritySetExplicitly;
}

- (NSString)avAssetDownloadChildDownloadSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (NSString)assetTitle
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (BOOL)_updatedStreamingZipModificationDate
{
  return self->__updatedStreamingZipModificationDate;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return self->__TLSMinimumSupportedProtocolVersion;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return self->__TLSMaximumSupportedProtocolVersion;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 288, 1);
}

- (NSURL)AVAssetURL
{
  return (NSURL *)objc_getProperty(self, a2, 336, 1);
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (unint64_t)taskKind
{
  return self->_taskKind;
}

- (id)_loggableDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[__NSCFURLSessionTaskInfo uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Task <%@>.<%lu>"), v4, -[__NSCFURLSessionTaskInfo identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 216, 1);
}

- (void)_logTaskUUIDMapping
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[__NSCFURLSessionTaskInfo _loggableDescription](self, "_loggableDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo bundleID](self, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFURLSessionTaskInfo sessionID](self, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138544130;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2048;
    v14 = -[__NSCFURLSessionTaskInfo identifier](self, "identifier");
    _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is for <%@>.<%@>.<%lu>", (uint8_t *)&v7, 0x2Au);

  }
}

- (__CFN_TaskMetrics)taskMetrics
{
  return (__CFN_TaskMetrics *)objc_getProperty(self, a2, 432, 1);
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 80, 1);
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 88, 1);
}

- (int64_t)state
{
  return self->_state;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (BOOL)_hasSZExtractor
{
  return self->__hasSZExtractor;
}

- (BOOL)_doesSZExtractorConsumeExtractedData
{
  return self->__doesSZExtractorConsumeExtractedData;
}

- (NSDictionary)_backgroundTrailers
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (id)initWithTask:(void *)a3 uniqueIdentifier:(void *)a4 bundleID:(void *)a5 sessionID:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)__NSCFURLSessionTaskInfo;
    a1 = objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      objc_msgSend(a1, "setIdentifier:", objc_msgSend(v9, "taskIdentifier"));
      objc_msgSend(a1, "setState:", 0);
      objc_msgSend(v9, "taskDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setTaskDescription:", v13);

      objc_msgSend(v9, "originalRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setOriginalRequest:", v14);

      objc_msgSend(v9, "currentRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setCurrentRequest:", v15);

      objc_msgSend(v9, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setResponse:", v16);

      objc_msgSend(v9, "earliestBeginDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setEarliestBeginDate:", v17);

      objc_msgSend(a1, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v9, "countOfBytesClientExpectsToSend"));
      objc_msgSend(a1, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v9, "countOfBytesClientExpectsToReceive"));
      objc_msgSend(a1, "setRespondedToWillBeginDelayedRequestCallback:", 0);
      objc_msgSend(v9, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setError:", v18);

      objc_msgSend(a1, "setBundleID:", v11);
      objc_msgSend(a1, "setSessionID:", v12);
      objc_msgSend(a1, "setState:", objc_msgSend(v9, "state"));
      objc_msgSend(a1, "setHasStarted:", 0);
      objc_msgSend(a1, "setUniqueIdentifier:", v10);
      objc_msgSend(a1, "setRetryCount:", 0);
      objc_msgSend(a1, "setRetryError:", 0);
      objc_msgSend(a1, "setBytesPerSecondLimit:", objc_msgSend(v9, "_bytesPerSecondLimit"));
      objc_msgSend(a1, "setExpectedProgressTarget:", objc_msgSend(v9, "_expectedProgressTarget"));
      objc_msgSend(a1, "setQos:", qos_class_self());
      objc_msgSend(v9, "_loadingPriority");
      objc_msgSend(a1, "setLoadingPriority:");
      objc_msgSend(a1, "setDiscretionaryOverride:", objc_msgSend(v9, "_discretionaryOverride"));
      objc_msgSend(a1, "setStoragePartitionIdentifier:", 0);
      objc_msgSend(a1, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(v9, "_TLSMinimumSupportedProtocolVersion"));
      objc_msgSend(a1, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(v9, "_TLSMaximumSupportedProtocolVersion"));
      objc_msgSend(a1, "set_extractor:", 0);
      objc_msgSend(a1, "set_hasSZExtractor:", 0);
      objc_msgSend(a1, "set_doesSZExtractorConsumeExtractedData:", 0);
      objc_msgSend(a1, "set_updatedStreamingZipModificationDate:", 0);
      objc_msgSend(v9, "_pathToDownloadTaskFile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setPathToDownloadTaskFile:", v19);

      objc_msgSend(a1, "setStartedUserInitiated:", 0);
      objc_msgSend(v9, "resumableUploadState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createResumeDataForTaskInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setResumableUploadData:", v21);

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->__backgroundTrailers, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadChildDownloadSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadConfig, 0);
  objc_storeStrong((id *)&self->_resolvedMediaSelectionPlist, 0);
  objc_storeStrong((id *)&self->_temporaryDestinationURL, 0);
  objc_storeStrong((id *)&self->_assetOptionsPlist, 0);
  objc_storeStrong((id *)&self->_AVAssetURL, 0);
  objc_storeStrong((id *)&self->_AVURLAsset, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetArtworkData, 0);
  objc_storeStrong((id *)&self->_assetTitle, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_resumableUploadData, 0);
  objc_storeStrong((id *)&self->__extractor, 0);
  objc_storeStrong((id *)&self->_pathToDownloadTaskFile, 0);
  objc_storeStrong((id *)&self->_storagePartitionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_downloadFileURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_retryError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (NSDictionary)assetOptionsPlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (void)set_extractor:(id)a3
{
  objc_storeStrong((id *)&self->__extractor, a3);
}

- (BOOL)resumedAndWaitingForEarliestBeginDate
{
  return self->_resumedAndWaitingForEarliestBeginDate;
}

- (__NSCFURLSessionTaskInfo)initWithUploadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __NSCFURLSessionTaskInfo *v14;
  __NSCFURLSessionTaskInfo *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  v15 = v14;
  if (v14)
    -[__NSCFURLSessionTaskInfo setTaskKind:](v14, "setTaskKind:", 1);
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v15, "_logTaskUUIDMapping");

  return v15;
}

- (__NSCFURLSessionTaskInfo)initWithDownloadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __NSCFURLSessionTaskInfo *v14;
  __NSCFURLSessionTaskInfo *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  v15 = v14;
  if (v14)
    -[__NSCFURLSessionTaskInfo setTaskKind:](v14, "setTaskKind:", 0);
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v15, "_logTaskUUIDMapping");

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSCFURLSessionTaskInfo)initWithDataTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __NSCFURLSessionTaskInfo *v14;
  __NSCFURLSessionTaskInfo *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  v15 = v14;
  if (v14)
    -[__NSCFURLSessionTaskInfo setTaskKind:](v14, "setTaskKind:", 2);
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v15, "_logTaskUUIDMapping");

  return v15;
}

- (__NSCFURLSessionTaskInfo)initWithAVAssetDownloadURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 downloadConfig:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __NSCFURLSessionTaskInfo *v25;
  __NSCFURLSessionTaskInfo *v26;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v21, v22, v23);
  v26 = v25;
  if (v25)
  {
    -[__NSCFURLSessionTaskInfo setTaskKind:](v25, "setTaskKind:", 3);
    -[__NSCFURLSessionTaskInfo setURL:](v26, "setURL:", v16);
    -[__NSCFURLSessionTaskInfo setDestinationURL:](v26, "setDestinationURL:", v17);
    -[__NSCFURLSessionTaskInfo setAssetTitle:](v26, "setAssetTitle:", v18);
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v26, "setAssetArtworkData:", v19);
    -[__NSCFURLSessionTaskInfo setOptions:](v26, "setOptions:", v20);
    -[__NSCFURLSessionTaskInfo setIdentifier:](v26, "setIdentifier:", a8);
    -[__NSCFURLSessionTaskInfo setDownloadConfig:](v26, "setDownloadConfig:", v24);
  }
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v26, "_logTaskUUIDMapping", a8);

  return v26;
}

- (__NSCFURLSessionTaskInfo)initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 enableSPIDelegateCallbacks:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __NSCFURLSessionTaskInfo *v25;
  __NSCFURLSessionTaskInfo *v26;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v22, v23, v24);
  v26 = v25;
  if (v25)
  {
    -[__NSCFURLSessionTaskInfo setTaskKind:](v25, "setTaskKind:", 5);
    -[__NSCFURLSessionTaskInfo setURL:](v26, "setURL:", v17);
    -[__NSCFURLSessionTaskInfo setDestinationURL:](v26, "setDestinationURL:", v18);
    -[__NSCFURLSessionTaskInfo setAssetTitle:](v26, "setAssetTitle:", v19);
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v26, "setAssetArtworkData:", v20);
    -[__NSCFURLSessionTaskInfo setOptions:](v26, "setOptions:", v21);
    -[__NSCFURLSessionTaskInfo setIdentifier:](v26, "setIdentifier:", a8);
    -[__NSCFURLSessionTaskInfo setEnableSPIDelegateCallbacks:](v26, "setEnableSPIDelegateCallbacks:", a12);
  }
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v26, "_logTaskUUIDMapping");

  return v26;
}

- (__NSCFURLSessionTaskInfo)initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 taskIdentifier:(unint64_t)a7 uniqueIdentifier:(id)a8 bundleID:(id)a9 sessionID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __NSCFURLSessionTaskInfo *v23;
  __NSCFURLSessionTaskInfo *v24;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    -[__NSCFURLSessionTaskInfo setTaskKind:](v23, "setTaskKind:", 4);
    -[__NSCFURLSessionTaskInfo setAssetTitle:](v24, "setAssetTitle:", v17);
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v24, "setAssetArtworkData:", v18);
    -[__NSCFURLSessionTaskInfo setOptions:](v24, "setOptions:", v19);
    -[__NSCFURLSessionTaskInfo setIdentifier:](v24, "setIdentifier:", a7);
    -[__NSCFURLSessionTaskInfo setAvAssetDownloadChildDownloadSessionIdentifier:](v24, "setAvAssetDownloadChildDownloadSessionIdentifier:", v16);
  }
  -[__NSCFURLSessionTaskInfo _logTaskUUIDMapping](v24, "_logTaskUUIDMapping");

  return v24;
}

- (void)setResumedAndWaitingForEarliestBeginDate:(BOOL)a3
{
  self->_resumedAndWaitingForEarliestBeginDate = a3;
}

- (BOOL)expectingResumeCallback
{
  return self->_expectingResumeCallback;
}

- (void)setExpectingResumeCallback:(BOOL)a3
{
  self->_expectingResumeCallback = a3;
}

- (BOOL)establishedConnection
{
  return self->_establishedConnection;
}

- (void)setEstablishedConnection:(BOOL)a3
{
  self->_establishedConnection = a3;
}

- (unint64_t)lowThroughputTimerRetryCount
{
  return self->_lowThroughputTimerRetryCount;
}

- (void)setLowThroughputTimerRetryCount:(unint64_t)a3
{
  self->_lowThroughputTimerRetryCount = a3;
}

- (BOOL)disablesRetry
{
  return self->_disablesRetry;
}

- (void)setDisablesRetry:(BOOL)a3
{
  self->_disablesRetry = a3;
}

- (STExtractor)_extractor
{
  return self->__extractor;
}

- (AVURLAsset)AVURLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 328, 1);
}

- (void)setAVURLAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (void)setAssetOptionsPlist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSDictionary)resolvedMediaSelectionPlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setResolvedMediaSelectionPlist:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

@end
