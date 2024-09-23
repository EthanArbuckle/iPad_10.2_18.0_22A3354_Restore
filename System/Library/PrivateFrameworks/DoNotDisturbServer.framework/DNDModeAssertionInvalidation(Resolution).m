@implementation DNDModeAssertionInvalidation(Resolution)

- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "assertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(v11, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 == (void *)v12)
  {
    v14 = 0;
  }
  else
  {
    v14 = 1;
    if (v11 && v12)
      v14 = objc_msgSend(v11, "isEqual:", v12) ^ 1;
  }
  objc_msgSend(a1, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v30, v9, v10);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 == (void *)v16)
  {
    v18 = 0;
  }
  else
  {
    if (!v15 || !v16)
      goto LABEL_12;
    v18 = objc_msgSend(v15, "isEqual:", v16) ^ 1;
  }
  if (((v14 | v18) & 1) == 0)
  {
    v27 = a1;
    goto LABEL_14;
  }
LABEL_12:
  v29 = v10;
  v19 = objc_alloc(MEMORY[0x1E0D1D628]);
  objc_msgSend(a1, "invalidationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "details");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  v23 = objc_msgSend(a1, "reason");
  v24 = objc_msgSend(a1, "reasonOverride");
  v25 = v19;
  v10 = v29;
  v26 = v23;
  v9 = v22;
  v27 = (id)objc_msgSend(v25, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v13, v20, v21, v17, v26, v24);

LABEL_14:
  return v27;
}

@end
