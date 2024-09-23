@implementation HMDCameraRecordingLogEvent

- (HMDCameraRecordingLogEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v9;
  id v10;
  HMDCameraRecordingLogEvent *v11;
  HMDCameraRecordingLogEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingLogEvent;
  v11 = -[HMMLogEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionID, a3);
    objc_storeStrong((id *)&v12->_cameraID, a4);
    v12->_sequenceNumber = a5;
  }

  return v12;
}

- (NSUUID)ephemeralCameraID
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingLogEvent cameraID](self, "cameraID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCameraRecordingMetricUUIDUtilities currentEphemeralUUIDWithUUID:rotationScheduleDays:](HMDCameraRecordingMetricUUIDUtilities, "currentEphemeralUUIDWithUUID:rotationScheduleDays:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraRecordingLogEvent cameraID](self, "cameraID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("cameraID"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraRecordingLogEvent sessionID](self, "sessionID", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("sessionID"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraRecordingLogEvent sequenceNumber](self, "sequenceNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("sequenceNumber"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSUUID)cameraID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
