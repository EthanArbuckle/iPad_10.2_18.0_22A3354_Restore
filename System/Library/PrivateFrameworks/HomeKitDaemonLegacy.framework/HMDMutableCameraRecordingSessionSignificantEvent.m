@implementation HMDMutableCameraRecordingSessionSignificantEvent

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCameraRecordingSessionSignificantEvent *v4;
  void *v5;
  HMDCameraRecordingSessionSignificantEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMDCameraRecordingSessionSignificantEvent allocWithZone:](HMDCameraRecordingSessionSignificantEvent, "allocWithZone:", a3);
  -[HMDCameraRecordingSessionSignificantEvent UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:](v4, "initWithUUID:", v5);

  -[HMDCameraRecordingSessionSignificantEvent setReason:](v6, "setReason:", -[HMDCameraRecordingSessionSignificantEvent reason](self, "reason"));
  -[HMDCameraRecordingSessionSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setDateOfOccurrence:](v6, "setDateOfOccurrence:", v7);

  -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v6, "setConfidenceLevel:", -[HMDCameraRecordingSessionSignificantEvent confidenceLevel](self, "confidenceLevel"));
  -[HMDCameraRecordingSessionSignificantEvent sessionEntityUUID](self, "sessionEntityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setSessionEntityUUID:](v6, "setSessionEntityUUID:", v8);

  -[HMDCameraRecordingSessionSignificantEvent faceClassifications](self, "faceClassifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setFaceClassifications:](v6, "setFaceClassifications:", v9);

  -[HMDCameraRecordingSessionSignificantEvent heroFrameData](self, "heroFrameData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v6, "setHeroFrameData:", v10);

  -[HMDCameraRecordingSessionSignificantEvent faceCropData](self, "faceCropData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setFaceCropData:](v6, "setFaceCropData:", v11);

  -[HMDCameraRecordingSessionSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip");
  -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v6, "setTimeOffsetWithinClip:");
  return v6;
}

@end
