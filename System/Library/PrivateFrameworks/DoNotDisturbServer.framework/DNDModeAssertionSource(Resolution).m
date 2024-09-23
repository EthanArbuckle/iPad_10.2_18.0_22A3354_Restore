@implementation DNDModeAssertionSource(Resolution)

- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  char v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a1;
  objc_msgSend(v11, "deviceIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v15 = v9;
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v12 == v8)
  {
    if (v8 == v10)
      goto LABEL_15;
    goto LABEL_10;
  }
  if (v8)
  {
    v14 = objc_msgSend(v12, "isEqual:", v8);
    if (v13 != v10 && (v14 & 1) != 0)
    {
LABEL_10:
      if (v10)
      {
        v16 = objc_msgSend(v13, "isEqual:", v10);
        v15 = v10;
        if ((v16 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v15 = 0;
      }
LABEL_14:
      v17 = (objc_class *)MEMORY[0x1E0D1D648];
      v18 = v15;
      v19 = [v17 alloc];
      objc_msgSend(v11, "clientIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithClientIdentifier:deviceIdentifier:", v20, v18);

      v11 = (id)v21;
    }
  }
LABEL_15:

  return v11;
}

@end
