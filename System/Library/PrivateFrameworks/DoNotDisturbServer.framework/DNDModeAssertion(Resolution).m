@implementation DNDModeAssertion(Resolution)

- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12 || v11 && v12 && objc_msgSend(v11, "isEqual:", v12))
  {
    v13 = a1;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0D1D5F8]);
    objc_msgSend(a1, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "details");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v14, "initWithUUID:startDate:details:source:", v15, v16, v17, v12);

  }
  return v13;
}

@end
