@implementation HMDCameraMetricsSnapshotLogEvent

- (HMDCameraMetricsSnapshotLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6
{
  HMDCameraMetricsSnapshotLogEvent *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCameraMetricsSnapshotLogEvent;
  result = -[HMDCameraMetricsLogEvent initWithSessionID:cameraAccessory:isLocal:](&v8, sel_initWithSessionID_cameraAccessory_isLocal_, a3, a4, a5);
  if (result)
    result->_snapshotForNotification = a6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimestamp, 0);
}

- (BOOL)snapshotForNotification
{
  return self->_snapshotForNotification;
}

- (NSNumber)referenceTimestamp
{
  return self->_referenceTimestamp;
}

- (void)setReferenceTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_referenceTimestamp, a3);
}

@end
