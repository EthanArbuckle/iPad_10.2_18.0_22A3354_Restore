@implementation HMDCameraSnapshotMetrics

- (HMDCameraSnapshotMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  HMDCameraSnapshotMetrics *v12;
  HMDCameraMetricsSnapshotLogEvent *v13;
  HMDCameraMetricsSnapshotLogEvent *cameraSnapshotMetricsLogEvent;
  objc_super v16;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraSnapshotMetrics;
  v12 = -[HMDCameraSnapshotMetrics init](&v16, sel_init);
  if (v12)
  {
    v13 = -[HMDCameraMetricsSnapshotLogEvent initWithSessionID:cameraAccessory:isLocal:snapshotForNotification:]([HMDCameraMetricsSnapshotLogEvent alloc], "initWithSessionID:cameraAccessory:isLocal:snapshotForNotification:", v10, v11, v7, v6);
    cameraSnapshotMetricsLogEvent = v12->_cameraSnapshotMetricsLogEvent;
    v12->_cameraSnapshotMetricsLogEvent = v13;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotMetrics cameraSnapshotMetricsLogEvent](self, "cameraSnapshotMetricsLogEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotMetrics error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:error:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraSnapshotMetrics;
  -[HMDCameraSnapshotMetrics dealloc](&v6, sel_dealloc);
}

- (HMDCameraMetricsSnapshotLogEvent)cameraSnapshotMetricsLogEvent
{
  return self->_cameraSnapshotMetricsLogEvent;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cameraSnapshotMetricsLogEvent, 0);
}

@end
