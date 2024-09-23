@implementation HMDCameraRecordingLoadBalancerDecision

- (HMDCameraRecordingLoadBalancerDecision)initWithCameraUUID:(id)a3 numberOfAvailableDevices:(int64_t)a4 totalNumberOfJobSlots:(int64_t)a5 remainingNumberOfJobSlots:(int64_t)a6 analysisNode:(id)a7 decisionDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDCameraRecordingLoadBalancerDecision *v19;
  HMDCameraRecordingLoadBalancerDecision *v20;
  HMDCameraRecordingLoadBalancerDecision *v22;
  SEL v23;
  objc_super v24;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v18 = v17;
  if (!v17)
  {
LABEL_7:
    v22 = (HMDCameraRecordingLoadBalancerDecision *)_HMFPreconditionFailure();
    return (HMDCameraRecordingLoadBalancerDecision *)-[HMDCameraRecordingLoadBalancerDecision deviceUUID](v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraRecordingLoadBalancerDecision;
  v19 = -[HMDCameraRecordingLoadBalancerDecision init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_cameraUUID, a3);
    v20->_numberOfAvailableDevices = a4;
    v20->_totalNumberOfJobSlots = a5;
    v20->_remainingNumberOfJobSlots = a6;
    objc_storeStrong((id *)&v20->_analysisNode, a7);
    objc_storeStrong((id *)&v20->_decisionDate, a8);
  }

  return v20;
}

- (NSUUID)deviceUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDCameraRecordingLoadBalancerDecision analysisNode](self, "analysisNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v5;
}

- (BOOL)isExpired
{
  void *v2;
  double v3;
  BOOL v4;

  -[HMDCameraRecordingLoadBalancerDecision decisionDate](self, "decisionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 < -15.0;

  return v4;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingLoadBalancerDecision cameraUUID](self, "cameraUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Camera UUID"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingLoadBalancerDecision deviceUUID](self, "deviceUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Device UUID"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision numberOfAvailableDevices](self, "numberOfAvailableDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Available Devices Count"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision totalNumberOfJobSlots](self, "totalNumberOfJobSlots"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Total Job Slots Count"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision remainingNumberOfJobSlots](self, "remainingNumberOfJobSlots"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Remaining Job Slots Count"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingLoadBalancerDecision decisionDate](self, "decisionDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Decision Date"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSUUID)cameraUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)numberOfAvailableDevices
{
  return self->_numberOfAvailableDevices;
}

- (int64_t)totalNumberOfJobSlots
{
  return self->_totalNumberOfJobSlots;
}

- (int64_t)remainingNumberOfJobSlots
{
  return self->_remainingNumberOfJobSlots;
}

- (HMDCameraRecordingAnalysisNode)analysisNode
{
  return (HMDCameraRecordingAnalysisNode *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)decisionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisionDate, 0);
  objc_storeStrong((id *)&self->_analysisNode, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
}

@end
