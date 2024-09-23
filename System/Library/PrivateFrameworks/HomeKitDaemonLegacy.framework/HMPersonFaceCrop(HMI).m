@implementation HMPersonFaceCrop(HMI)

- (uint64_t)initWithHMIPersonFaceCrop:()HMI
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
  void *v16;
  uint64_t v17;

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
  objc_msgSend(v4, "personUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(a1, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);
  return v17;
}

- (id)createHMIPersonFaceCrop
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v2 = objc_alloc(MEMORY[0x1E0D31A98]);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "faceBoundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "personUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v2, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v3, v4, v5, v14, v7, v9, v11, v13);

  return v15;
}

@end
