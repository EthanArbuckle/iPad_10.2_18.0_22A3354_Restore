@implementation HMDMutableCameraSignificantEventFaceClassification

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCameraSignificantEventFaceClassification *v4;
  void *v5;
  void *v6;
  HMDCameraSignificantEventFaceClassification *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMDCameraSignificantEventFaceClassification allocWithZone:](HMDCameraSignificantEventFaceClassification, "allocWithZone:", a3);
  -[HMDCameraSignificantEventFaceClassification UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification personManagerUUID](self, "personManagerUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:](v4, "initWithUUID:personManagerUUID:", v5, v6);

  -[HMDCameraSignificantEventFaceClassification personUUID](self, "personUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v7, "setPersonUUID:", v8);

  -[HMDCameraSignificantEventFaceClassification personName](self, "personName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setPersonName:](v7, "setPersonName:", v9);

  -[HMDCameraSignificantEventFaceClassification unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v7, "setUnassociatedFaceCropUUID:", v10);

  return v7;
}

@end
