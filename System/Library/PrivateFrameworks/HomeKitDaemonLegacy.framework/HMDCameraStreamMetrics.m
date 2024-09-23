@implementation HMDCameraStreamMetrics

- (HMDCameraStreamMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HMDCameraStreamMetrics *v10;
  HMDCameraMetricsStreamLogEvent *v11;
  HMDCameraMetricsStreamLogEvent *cameraStreamMetricsLogEvent;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraStreamMetrics;
  v10 = -[HMDCameraStreamMetrics init](&v14, sel_init);
  if (v10)
  {
    v11 = -[HMDCameraMetricsStreamLogEvent initWithSessionID:cameraAccessory:isLocal:]([HMDCameraMetricsStreamLogEvent alloc], "initWithSessionID:cameraAccessory:isLocal:", v8, v9, v5);
    cameraStreamMetricsLogEvent = v10->_cameraStreamMetricsLogEvent;
    v10->_cameraStreamMetricsLogEvent = v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamMetrics cameraStreamMetricsLogEvent](self, "cameraStreamMetricsLogEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamMetrics error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:error:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraStreamMetrics;
  -[HMDCameraStreamMetrics dealloc](&v6, sel_dealloc);
}

- (void)setError:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_error)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    v5 = v6;
  }

}

- (HMDCameraMetricsStreamLogEvent)cameraStreamMetricsLogEvent
{
  return self->_cameraStreamMetricsLogEvent;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cameraStreamMetricsLogEvent, 0);
}

@end
