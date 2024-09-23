@implementation HMDCameraRecordingFragmentAnalyzedEvent

- (HMDCameraRecordingFragmentAnalyzedEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraRecordingFragmentAnalyzedEvent;
  return -[HMDCameraRecordingLogEvent initWithSessionID:cameraID:sequenceNumber:](&v6, sel_initWithSessionID_cameraID_sequenceNumber_, a3, a4, a5);
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingFragmentAnalyzedEvent;
  -[HMDCameraRecordingLogEvent attributeDescriptions](&v12, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDCameraRecordingFragmentAnalyzedEvent analysisResultCode](self, "analysisResultCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("analysisResultCode"), v6);
  objc_msgSend(v4, "addObject:", v7);

  v8 = -[HMDCameraRecordingFragmentAnalyzedEvent recordingReason](self, "recordingReason");
  if ((v8 - 1) >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_24E7835D8[(v8 - 1)];
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("recordingReason"), v9);
  objc_msgSend(v4, "addObject:", v10);

  return v4;
}

- (int64_t)analysisResultCode
{
  return self->_analysisResultCode;
}

- (void)setAnalysisResultCode:(int64_t)a3
{
  self->_analysisResultCode = a3;
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClipModelID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int)recordingReason
{
  return self->_recordingReason;
}

- (void)setRecordingReason:(int)a3
{
  self->_recordingReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipModelID, 0);
}

@end
