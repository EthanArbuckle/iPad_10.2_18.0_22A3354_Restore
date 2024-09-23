@implementation SFSpeechAnalyzerOptions

- (SFSpeechAnalyzerOptions)initWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5
{
  id v7;
  id v8;
  SFSpeechAnalyzerOptions *v9;
  uint64_t v10;
  SFSpeechAnalyzerOptionsLoggingInfo *loggingInfo;
  uint64_t v12;
  SFSpeechAnalyzerOptionsPowerContext *powerContext;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SFSpeechAnalyzerOptions;
  v7 = a5;
  v8 = a4;
  v9 = -[SFSpeechAnalyzerOptions init](&v15, sel_init);
  v9->_highPriority = a3;
  v10 = objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  loggingInfo = v9->_loggingInfo;
  v9->_loggingInfo = (SFSpeechAnalyzerOptionsLoggingInfo *)v10;

  v12 = objc_msgSend(v7, "copy");
  powerContext = v9->_powerContext;
  v9->_powerContext = (SFSpeechAnalyzerOptionsPowerContext *)v12;

  return v9;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (SFSpeechAnalyzerOptionsLoggingInfo)loggingInfo
{
  return self->_loggingInfo;
}

- (SFSpeechAnalyzerOptionsPowerContext)powerContext
{
  return self->_powerContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_loggingInfo, 0);
}

@end
