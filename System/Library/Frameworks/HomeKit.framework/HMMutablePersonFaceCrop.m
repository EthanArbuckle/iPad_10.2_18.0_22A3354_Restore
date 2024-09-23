@implementation HMMutablePersonFaceCrop

- (id)copyWithZone:(_NSZone *)a3
{
  HMPersonFaceCrop *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  HMPersonFaceCrop *v17;
  void *v18;

  v4 = +[HMPersonFaceCrop allocWithZone:](HMPersonFaceCrop, "allocWithZone:", a3);
  -[HMFaceCrop UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop dataRepresentation](self, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop faceBoundingBox](self, "faceBoundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[HMPersonFaceCrop personUUID](self, "personUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);

  -[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonFaceCrop setUnassociatedFaceCropUUID:](v17, "setUnassociatedFaceCropUUID:", v18);

  -[HMPersonFaceCrop setSource:](v17, "setSource:", -[HMPersonFaceCrop source](self, "source"));
  return v17;
}

@end
