@implementation AFRequestInfo

- (AFRequestInfo)init
{
  return -[AFRequestInfo initWithTimestamp:](self, "initWithTimestamp:", mach_absolute_time());
}

- (AFRequestInfo)initWithTimestamp:(unint64_t)a3
{
  AFRequestInfo *v4;
  NSUUID *v5;
  NSUUID *uuid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFRequestInfo;
  v4 = -[AFRequestInfo init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v4->_uuid;
    v4->_uuid = v5;

    v4->_timestamp = a3;
  }
  return v4;
}

- (BOOL)requiresUserInteraction
{
  return self->_handoffRequiresUserInteraction;
}

- (NSString)handoffOriginDeviceName
{
  return self->_handoffOriginDeviceName;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (BOOL)isSpeechRequest
{
  AFSpeechRequestOptions *speechRequestOptions;

  speechRequestOptions = self->_speechRequestOptions;
  if (speechRequestOptions)
    LOBYTE(speechRequestOptions) = -[AFSpeechRequestOptions activationEvent](speechRequestOptions, "activationEvent") != 28;
  return (char)speechRequestOptions;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return (AFSpeechRequestOptions *)(id)-[AFSpeechRequestOptions copy](self->_speechRequestOptions, "copy");
}

- (SAStartLocalRequest)startLocalRequest
{
  return self->_startLocalRequest;
}

- (NSString)legacyDirectActionIdentifier
{
  return self->_legacyDirectActionIdentifier;
}

- (id)description
{
  uint64_t v3;
  NSString *legacyDirectActionIdentifier;
  __CFString *v5;
  unint64_t directActionEvent;
  __CFString *v7;
  SAStartRequest *startRequest;
  NSData *handoffRequestData;
  NSString *handoffURLString;
  _BOOL8 handoffRequiresUserInteraction;
  NSString *handoffNotification;
  NSString *correctedSpeech;
  unint64_t activationEvent;
  NSString *handoffOriginDeviceName;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __CFString *v20;
  NSString *text;
  NSNumber *notifyState;
  unint64_t options;
  NSUUID *turnIdentifier;
  NSUUID *requestIdentifier;
  NSUUID *uuid;
  unint64_t timestamp;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)AFRequestInfo;
  -[AFRequestInfo description](&v29, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  turnIdentifier = self->_turnIdentifier;
  requestIdentifier = self->_requestIdentifier;
  uuid = self->_uuid;
  timestamp = self->_timestamp;
  notifyState = self->_notifyState;
  options = self->_options;
  text = self->_text;
  legacyDirectActionIdentifier = self->_legacyDirectActionIdentifier;
  v5 = (__CFString *)legacyDirectActionIdentifier;
  if (!legacyDirectActionIdentifier)
  {
    directActionEvent = self->_directActionEvent;
    if (directActionEvent > 0x12)
      v7 = CFSTR("Invalid direct action event");
    else
      v7 = off_1E3A34830[directActionEvent];
    v5 = v7;
  }
  v20 = v5;
  v28 = (void *)v3;
  startRequest = self->_startRequest;
  if (!startRequest)
    startRequest = self->_startLocalRequest;
  handoffRequestData = self->_handoffRequestData;
  handoffURLString = self->_handoffURLString;
  handoffRequiresUserInteraction = self->_handoffRequiresUserInteraction;
  handoffNotification = self->_handoffNotification;
  correctedSpeech = self->_correctedSpeech;
  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  activationEvent = self->_activationEvent;
  if (activationEvent > 0xB)
    v16 = CFSTR("Unknown");
  else
    v16 = off_1E3A2DF18[activationEvent];
  v17 = v16;
  objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("uuid: %@, timestamp: %llu, requestId: %@, turnId: %@, options: %lu, notifyState: %@ text: %@ directAction: %@ handoffOriginDeviceName: %@ handOffData: %@ handoffURL: %@ handoffRequiresUserInteraction ? %d handoffNotification %@ correctedSpeech: %@ startRequest: %@ activationEvent: %@ speechRequestOptions: %@ testRequestOptions: %@ requestCompletionOptions: %@ sharedUserID: %@ confidenceScore: %lu nonspeakerConfidenceScores: %@"), uuid, timestamp, requestIdentifier, turnIdentifier, options, notifyState, text, v20, handoffOriginDeviceName, handoffRequestData, handoffURLString, handoffRequiresUserInteraction, handoffNotification, correctedSpeech, startRequest, v17,
    self->_speechRequestOptions,
    self->_testRequestOptions,
    self->_requestCompletionOptions,
    self->_expectedSpeakerSharedUserID,
    self->_expectedSpeakerConfidenceScore,
    self->_nonspeakerConfidenceScores);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!legacyDirectActionIdentifier)
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  uuid = self->_uuid;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", uuid, CFSTR("_uuid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("_timestamp"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("_requestIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_turnIdentifier, CFSTR("_turnIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_options);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_options"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_notifyState, CFSTR("_notifyState"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_text, CFSTR("_text"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_legacyDirectActionIdentifier, CFSTR("_legacyDirectActionIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handoffOriginDeviceName, CFSTR("_handoffOriginDeviceName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handoffRequestData, CFSTR("_handoffRequestData"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handoffURLString, CFSTR("_handoffURLString"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_handoffRequiresUserInteraction, CFSTR("_handoffRequiresUserInteraction"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_handoffNotification, CFSTR("_handoffNotification"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_correctedSpeech, CFSTR("_correctedSpeech"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_correctedSpeechContext, CFSTR("_correctedSpeechContext"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_startRequest, CFSTR("_startRequest"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_startLocalRequest, CFSTR("_startLocalRequest"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_directActionAppId, CFSTR("_directActionAppId"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_directActionEvent, CFSTR("_directActionEvent"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_activationEvent, CFSTR("_activationEvent"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_speechRequestOptions, CFSTR("_speechRequestOptions"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_testRequestOptions, CFSTR("_testRequestOptions"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_combinedRank, CFSTR("_combinedRank"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_combinedScore, CFSTR("_combinedScore"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_interactionId, CFSTR("_interactionId"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_onDeviceUtterancesPresent, CFSTR("_onDeviceUtterancesPresent"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_originalRank, CFSTR("_originalRank"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_originalScore, CFSTR("_originalScore"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_previousUtterance, CFSTR("_previousUtterance"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_sessionId, CFSTR("_sessionId"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_utteranceSource, CFSTR("_utteranceSource"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_requestCompletionOptions, CFSTR("_requestCompletionOptions"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_expectedSpeakerSharedUserID, CFSTR("_expectedSpeakerSharedUserID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_expectedSpeakerConfidenceScore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("_expectedSpeakerConfidenceScore"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_nonspeakerConfidenceScores, CFSTR("_nonspeakerConfidenceScores"));
}

- (AFRequestInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  AFRequestInfo *v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  NSUUID *requestIdentifier;
  uint64_t v12;
  NSUUID *turnIdentifier;
  void *v14;
  uint64_t v15;
  NSNumber *notifyState;
  uint64_t v17;
  NSString *text;
  uint64_t v19;
  NSString *legacyDirectActionIdentifier;
  uint64_t v21;
  NSString *handoffOriginDeviceName;
  uint64_t v23;
  NSData *handoffRequestData;
  uint64_t v25;
  NSString *handoffURLString;
  uint64_t v27;
  NSString *handoffNotification;
  uint64_t v29;
  NSString *correctedSpeech;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSDictionary *correctedSpeechContext;
  uint64_t v36;
  SAStartRequest *startRequest;
  uint64_t v38;
  SAStartLocalRequest *startLocalRequest;
  uint64_t v40;
  NSString *directActionAppId;
  uint64_t v42;
  AFSpeechRequestOptions *speechRequestOptions;
  uint64_t v44;
  AFTestRequestOptions *testRequestOptions;
  uint64_t v46;
  NSNumber *combinedRank;
  uint64_t v48;
  NSNumber *combinedScore;
  uint64_t v50;
  NSString *interactionId;
  uint64_t v52;
  NSNumber *onDeviceUtterancesPresent;
  uint64_t v54;
  NSNumber *originalRank;
  uint64_t v56;
  NSNumber *originalScore;
  uint64_t v58;
  NSString *previousUtterance;
  uint64_t v60;
  NSString *sessionId;
  uint64_t v62;
  NSString *utteranceSource;
  uint64_t v64;
  AFRequestCompletionOptions *requestCompletionOptions;
  uint64_t v66;
  NSString *expectedSpeakerSharedUserID;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSDictionary *nonspeakerConfidenceScores;
  _QWORD v75[3];
  _QWORD v76[4];

  v76[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = -[AFRequestInfo initWithTimestamp:](self, "initWithTimestamp:", v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v7->_requestIdentifier;
    v7->_requestIdentifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_turnIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    turnIdentifier = v7->_turnIdentifier;
    v7->_turnIdentifier = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_options = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notifyState"));
    v15 = objc_claimAutoreleasedReturnValue();
    notifyState = v7->_notifyState;
    v7->_notifyState = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_text"));
    v17 = objc_claimAutoreleasedReturnValue();
    text = v7->_text;
    v7->_text = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_legacyDirectActionIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    legacyDirectActionIdentifier = v7->_legacyDirectActionIdentifier;
    v7->_legacyDirectActionIdentifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handoffOriginDeviceName"));
    v21 = objc_claimAutoreleasedReturnValue();
    handoffOriginDeviceName = v7->_handoffOriginDeviceName;
    v7->_handoffOriginDeviceName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handoffRequestData"));
    v23 = objc_claimAutoreleasedReturnValue();
    handoffRequestData = v7->_handoffRequestData;
    v7->_handoffRequestData = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handoffURLString"));
    v25 = objc_claimAutoreleasedReturnValue();
    handoffURLString = v7->_handoffURLString;
    v7->_handoffURLString = (NSString *)v25;

    v7->_handoffRequiresUserInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_handoffRequiresUserInteraction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handoffNotification"));
    v27 = objc_claimAutoreleasedReturnValue();
    handoffNotification = v7->_handoffNotification;
    v7->_handoffNotification = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_correctedSpeech"));
    v29 = objc_claimAutoreleasedReturnValue();
    correctedSpeech = v7->_correctedSpeech;
    v7->_correctedSpeech = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    v76[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("_correctedSpeechContext"));
    v34 = objc_claimAutoreleasedReturnValue();
    correctedSpeechContext = v7->_correctedSpeechContext;
    v7->_correctedSpeechContext = (NSDictionary *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startRequest"));
    v36 = objc_claimAutoreleasedReturnValue();
    startRequest = v7->_startRequest;
    v7->_startRequest = (SAStartRequest *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startLocalRequest"));
    v38 = objc_claimAutoreleasedReturnValue();
    startLocalRequest = v7->_startLocalRequest;
    v7->_startLocalRequest = (SAStartLocalRequest *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directActionAppId"));
    v40 = objc_claimAutoreleasedReturnValue();
    directActionAppId = v7->_directActionAppId;
    v7->_directActionAppId = (NSString *)v40;

    v7->_directActionEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_directActionEvent"));
    v7->_activationEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_activationEvent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechRequestOptions"));
    v42 = objc_claimAutoreleasedReturnValue();
    speechRequestOptions = v7->_speechRequestOptions;
    v7->_speechRequestOptions = (AFSpeechRequestOptions *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_testRequestOptions"));
    v44 = objc_claimAutoreleasedReturnValue();
    testRequestOptions = v7->_testRequestOptions;
    v7->_testRequestOptions = (AFTestRequestOptions *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_combinedRank"));
    v46 = objc_claimAutoreleasedReturnValue();
    combinedRank = v7->_combinedRank;
    v7->_combinedRank = (NSNumber *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_combinedScore"));
    v48 = objc_claimAutoreleasedReturnValue();
    combinedScore = v7->_combinedScore;
    v7->_combinedScore = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interactionId"));
    v50 = objc_claimAutoreleasedReturnValue();
    interactionId = v7->_interactionId;
    v7->_interactionId = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_onDeviceUtterancesPresent"));
    v52 = objc_claimAutoreleasedReturnValue();
    onDeviceUtterancesPresent = v7->_onDeviceUtterancesPresent;
    v7->_onDeviceUtterancesPresent = (NSNumber *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalRank"));
    v54 = objc_claimAutoreleasedReturnValue();
    originalRank = v7->_originalRank;
    v7->_originalRank = (NSNumber *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalScore"));
    v56 = objc_claimAutoreleasedReturnValue();
    originalScore = v7->_originalScore;
    v7->_originalScore = (NSNumber *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previousUtterance"));
    v58 = objc_claimAutoreleasedReturnValue();
    previousUtterance = v7->_previousUtterance;
    v7->_previousUtterance = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionId"));
    v60 = objc_claimAutoreleasedReturnValue();
    sessionId = v7->_sessionId;
    v7->_sessionId = (NSString *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_utteranceSource"));
    v62 = objc_claimAutoreleasedReturnValue();
    utteranceSource = v7->_utteranceSource;
    v7->_utteranceSource = (NSString *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestCompletionOptions"));
    v64 = objc_claimAutoreleasedReturnValue();
    requestCompletionOptions = v7->_requestCompletionOptions;
    v7->_requestCompletionOptions = (AFRequestCompletionOptions *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expectedSpeakerSharedUserID"));
    v66 = objc_claimAutoreleasedReturnValue();
    expectedSpeakerSharedUserID = v7->_expectedSpeakerSharedUserID;
    v7->_expectedSpeakerSharedUserID = (NSString *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expectedSpeakerConfidenceScore"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_expectedSpeakerConfidenceScore = objc_msgSend(v68, "unsignedIntegerValue");

    v69 = (void *)MEMORY[0x1E0C99E60];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v75[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setWithArray:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("_nonspeakerConfidenceScores"));
    v72 = objc_claimAutoreleasedReturnValue();
    nonspeakerConfidenceScores = v7->_nonspeakerConfidenceScores;
    v7->_nonspeakerConfidenceScores = (NSDictionary *)v72;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AFRequestInfo *v4;
  uint64_t v5;
  NSUUID *uuid;

  v4 = -[AFRequestInfo initWithTimestamp:](+[AFRequestInfo allocWithZone:](AFRequestInfo, "allocWithZone:", a3), "initWithTimestamp:", self->_timestamp);
  v5 = -[NSUUID copy](self->_uuid, "copy");
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v5;

  -[AFRequestInfo setRequestIdentifier:](v4, "setRequestIdentifier:", self->_requestIdentifier);
  -[AFRequestInfo setTurnIdentifier:](v4, "setTurnIdentifier:", self->_turnIdentifier);
  -[AFRequestInfo setOptions:](v4, "setOptions:", self->_options);
  -[AFRequestInfo setNotifyState:](v4, "setNotifyState:", self->_notifyState);
  -[AFRequestInfo setText:](v4, "setText:", self->_text);
  -[AFRequestInfo setLegacyDirectActionIdentifier:](v4, "setLegacyDirectActionIdentifier:", self->_legacyDirectActionIdentifier);
  -[AFRequestInfo setHandoffOriginDeviceName:](v4, "setHandoffOriginDeviceName:", self->_handoffOriginDeviceName);
  -[AFRequestInfo setHandoffRequestData:](v4, "setHandoffRequestData:", self->_handoffRequestData);
  -[AFRequestInfo setHandoffURLString:](v4, "setHandoffURLString:", self->_handoffURLString);
  -[AFRequestInfo setHandoffRequiresUserInteraction:](v4, "setHandoffRequiresUserInteraction:", self->_handoffRequiresUserInteraction);
  -[AFRequestInfo setHandoffNotification:](v4, "setHandoffNotification:", self->_handoffNotification);
  -[AFRequestInfo setCorrectedSpeech:](v4, "setCorrectedSpeech:", self->_correctedSpeech);
  -[AFRequestInfo setCorrectedSpeechContext:](v4, "setCorrectedSpeechContext:", self->_correctedSpeechContext);
  -[AFRequestInfo setStartRequest:](v4, "setStartRequest:", self->_startRequest);
  -[AFRequestInfo setStartLocalRequest:](v4, "setStartLocalRequest:", self->_startLocalRequest);
  -[AFRequestInfo setDirectActionAppId:](v4, "setDirectActionAppId:", self->_directActionAppId);
  -[AFRequestInfo setDirectActionEvent:](v4, "setDirectActionEvent:", self->_directActionEvent);
  -[AFRequestInfo setActivationEvent:](v4, "setActivationEvent:", self->_activationEvent);
  -[AFRequestInfo setSpeechRequestOptions:](v4, "setSpeechRequestOptions:", self->_speechRequestOptions);
  -[AFRequestInfo setTestRequestOptions:](v4, "setTestRequestOptions:", self->_testRequestOptions);
  -[AFRequestInfo setCombinedRank:](v4, "setCombinedRank:", self->_combinedRank);
  -[AFRequestInfo setCombinedScore:](v4, "setCombinedScore:", self->_combinedScore);
  -[AFRequestInfo setInteractionId:](v4, "setInteractionId:", self->_interactionId);
  -[AFRequestInfo setOnDeviceUtterancesPresent:](v4, "setOnDeviceUtterancesPresent:", self->_onDeviceUtterancesPresent);
  -[AFRequestInfo setOriginalRank:](v4, "setOriginalRank:", self->_originalRank);
  -[AFRequestInfo setOriginalScore:](v4, "setOriginalScore:", self->_originalScore);
  -[AFRequestInfo setPreviousUtterance:](v4, "setPreviousUtterance:", self->_previousUtterance);
  -[AFRequestInfo setSessionId:](v4, "setSessionId:", self->_sessionId);
  -[AFRequestInfo setUtteranceSource:](v4, "setUtteranceSource:", self->_utteranceSource);
  -[AFRequestInfo setRequestCompletionOptions:](v4, "setRequestCompletionOptions:", self->_requestCompletionOptions);
  -[AFRequestInfo setExpectedSpeakerSharedUserID:](v4, "setExpectedSpeakerSharedUserID:", self->_expectedSpeakerSharedUserID);
  -[AFRequestInfo setExpectedSpeakerConfidenceScore:](v4, "setExpectedSpeakerConfidenceScore:", self->_expectedSpeakerConfidenceScore);
  -[AFRequestInfo setNonspeakerConfidenceScores:](v4, "setNonspeakerConfidenceScores:", self->_nonspeakerConfidenceScores);
  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHandoffOriginDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (void)setSpeechRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setStartLocalRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLegacyDirectActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (AFRequestCompletionOptions)requestCompletionOptions
{
  return self->_requestCompletionOptions;
}

- (void)setRequestCompletionOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSNumber)notifyState
{
  return self->_notifyState;
}

- (void)setNotifyState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)handoffRequestData
{
  return self->_handoffRequestData;
}

- (void)setHandoffRequestData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)handoffURLString
{
  return self->_handoffURLString;
}

- (void)setHandoffURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)handoffRequiresUserInteraction
{
  return self->_handoffRequiresUserInteraction;
}

- (void)setHandoffRequiresUserInteraction:(BOOL)a3
{
  self->_handoffRequiresUserInteraction = a3;
}

- (BOOL)isATVHandoff
{
  return self->_isATVHandoff;
}

- (void)setIsATVHandoff:(BOOL)a3
{
  self->_isATVHandoff = a3;
}

- (NSString)handoffNotification
{
  return self->_handoffNotification;
}

- (void)setHandoffNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)correctedSpeech
{
  return self->_correctedSpeech;
}

- (void)setCorrectedSpeech:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)correctedSpeechContext
{
  return self->_correctedSpeechContext;
}

- (void)setCorrectedSpeechContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SAStartRequest)startRequest
{
  return self->_startRequest;
}

- (void)setStartRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)directActionAppId
{
  return self->_directActionAppId;
}

- (void)setDirectActionAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (AFTestRequestOptions)testRequestOptions
{
  return self->_testRequestOptions;
}

- (void)setTestRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (void)setCombinedRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)onDeviceUtterancesPresent
{
  return self->_onDeviceUtterancesPresent;
}

- (void)setOnDeviceUtterancesPresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOriginalRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (void)setPreviousUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)utteranceSource
{
  return self->_utteranceSource;
}

- (void)setUtteranceSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)expectedSpeakerSharedUserID
{
  return self->_expectedSpeakerSharedUserID;
}

- (void)setExpectedSpeakerSharedUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (unint64_t)expectedSpeakerConfidenceScore
{
  return self->_expectedSpeakerConfidenceScore;
}

- (void)setExpectedSpeakerConfidenceScore:(unint64_t)a3
{
  self->_expectedSpeakerConfidenceScore = a3;
}

- (NSDictionary)nonspeakerConfidenceScores
{
  return self->_nonspeakerConfidenceScores;
}

- (void)setNonspeakerConfidenceScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isSiriXRequest
{
  return self->_isSiriXRequest;
}

- (void)setIsSiriXRequest:(BOOL)a3
{
  self->_isSiriXRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonspeakerConfidenceScores, 0);
  objc_storeStrong((id *)&self->_expectedSpeakerSharedUserID, 0);
  objc_storeStrong((id *)&self->_utteranceSource, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_onDeviceUtterancesPresent, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
  objc_storeStrong((id *)&self->_testRequestOptions, 0);
  objc_storeStrong((id *)&self->_directActionAppId, 0);
  objc_storeStrong((id *)&self->_startRequest, 0);
  objc_storeStrong((id *)&self->_correctedSpeechContext, 0);
  objc_storeStrong((id *)&self->_correctedSpeech, 0);
  objc_storeStrong((id *)&self->_handoffNotification, 0);
  objc_storeStrong((id *)&self->_handoffURLString, 0);
  objc_storeStrong((id *)&self->_handoffRequestData, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_notifyState, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_requestCompletionOptions, 0);
  objc_storeStrong((id *)&self->_legacyDirectActionIdentifier, 0);
  objc_storeStrong((id *)&self->_startLocalRequest, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_handoffOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)testRequestWithText:(id)a3 speechRequestOptions:(id)a4 testOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  AFRequestInfo *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v10, "setActivationEvent:", 8);
  -[AFRequestInfo setText:](v10, "setText:", v9);

  -[AFRequestInfo setSpeechRequestOptions:](v10, "setSpeechRequestOptions:", v8);
  -[AFRequestInfo setTestRequestOptions:](v10, "setTestRequestOptions:", v7);

  return v10;
}

+ (id)testRequestWithStartLocalRequest:(id)a3
{
  id v3;
  AFRequestInfo *v4;

  v3 = a3;
  v4 = objc_alloc_init(AFRequestInfo);
  -[AFRequestInfo setStartLocalRequest:](v4, "setStartLocalRequest:", v3);

  return v4;
}

@end
