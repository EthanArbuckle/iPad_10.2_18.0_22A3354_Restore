@implementation HMDCameraRecordingAnalysisNode

- (HMDCameraRecordingAnalysisNode)initWithResidentDevice:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraRecordingAnalysisNode *v10;
  HMDCameraRecordingAnalysisNode *v11;
  uint64_t v12;
  NSDictionary *metrics;
  HMDCameraRecordingAnalysisNode *v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v15 = (HMDCameraRecordingAnalysisNode *)_HMFPreconditionFailure();
    return (HMDCameraRecordingAnalysisNode *)-[HMDCameraRecordingAnalysisNode residentDevice](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraRecordingAnalysisNode;
  v10 = -[HMDCameraRecordingAnalysisNode init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_residentDevice, a3);
    v12 = objc_msgSend(v9, "copy");
    metrics = v11->_metrics;
    v11->_metrics = (NSDictionary *)v12;

  }
  return v11;
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
}

@end
