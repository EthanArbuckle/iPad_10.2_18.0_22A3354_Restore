@implementation SFSpeechAnalyzerOptionsLoggingInfo

- (SFSpeechAnalyzerOptionsLoggingInfo)initWithAsrID:(id)a3 requestID:(id)a4 dictationUIInteractionID:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFSpeechAnalyzerOptionsLoggingInfo *v10;
  uint64_t v11;
  NSUUID *asrID;
  uint64_t v13;
  NSUUID *requestID;
  uint64_t v15;
  NSString *dictationUIInteractionID;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFSpeechAnalyzerOptionsLoggingInfo;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SFSpeechAnalyzerOptionsLoggingInfo init](&v18, sel_init);
  v11 = objc_msgSend(v9, "copy", v18.receiver, v18.super_class);

  asrID = v10->_asrID;
  v10->_asrID = (NSUUID *)v11;

  v13 = objc_msgSend(v8, "copy");
  requestID = v10->_requestID;
  v10->_requestID = (NSUUID *)v13;

  v15 = objc_msgSend(v7, "copy");
  dictationUIInteractionID = v10->_dictationUIInteractionID;
  v10->_dictationUIInteractionID = (NSString *)v15;

  return v10;
}

- (NSUUID)asrID
{
  return self->_asrID;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSString)dictationUIInteractionID
{
  return self->_dictationUIInteractionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationUIInteractionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_asrID, 0);
}

@end
