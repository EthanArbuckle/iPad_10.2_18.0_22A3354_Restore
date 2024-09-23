@implementation HMFaceCrop(HMI)

- (uint64_t)initWithHMIFaceCrop:()HMI
{
  id v4;
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
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceBoundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = objc_msgSend(a1, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (id)createHMIFaceCrop
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BE4D1D0]);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "faceBoundingBox");
  v6 = (void *)objc_msgSend(v2, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v3, v4, v5);

  return v6;
}

@end
