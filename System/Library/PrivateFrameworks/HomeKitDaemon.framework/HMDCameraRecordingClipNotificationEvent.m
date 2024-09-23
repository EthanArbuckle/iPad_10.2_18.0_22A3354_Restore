@implementation HMDCameraRecordingClipNotificationEvent

- (HMDCameraRecordingClipNotificationEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5 recordingEventTriggers:(unint64_t)a6
{
  HMDCameraRecordingClipNotificationEvent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCameraRecordingClipNotificationEvent;
  result = -[HMDCameraRecordingLogEvent initWithSessionID:cameraID:sequenceNumber:](&v8, sel_initWithSessionID_cameraID_sequenceNumber_, a3, a4, a5);
  if (result)
    result->_recordingEventTriggers = a6;
  return result;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingClipNotificationEvent;
  -[HMDCameraRecordingLogEvent attributeDescriptions](&v9, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraRecordingClipNotificationEvent recordingEventTriggers](self, "recordingEventTriggers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("recordingEventTriggers"), v6);
  objc_msgSend(v4, "addObject:", v7);

  return v4;
}

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

@end
