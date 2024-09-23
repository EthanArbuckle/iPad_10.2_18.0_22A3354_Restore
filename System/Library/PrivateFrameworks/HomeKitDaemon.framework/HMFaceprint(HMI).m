@implementation HMFaceprint(HMI)

- (uint64_t)initWithHMIFaceprint:()HMI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceCropUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "initWithUUID:data:modelUUID:faceCropUUID:", v5, v6, v7, v8);
  return v9;
}

- (id)createHMIFaceprint
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BE4D1D8]);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "faceCropUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithUUID:data:modelUUID:faceCropUUID:", v3, v4, v5, v6);

  return v7;
}

@end
