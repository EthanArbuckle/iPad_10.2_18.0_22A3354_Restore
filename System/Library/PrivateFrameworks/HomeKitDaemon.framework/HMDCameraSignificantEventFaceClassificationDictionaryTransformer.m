@implementation HMDCameraSignificantEventFaceClassificationDictionaryTransformer

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCED8];
    v5 = a3;
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("HMDCSEFC.ck.UUID"));

    objc_msgSend(v5, "personManagerUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("HMDCSEFC.ck.personManagerUUID"));

    objc_msgSend(v5, "personUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("HMDCSEFC.ck.personUUID"));

    objc_msgSend(v5, "personName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("HMDCSEFC.ck.personName"));

    objc_msgSend(v5, "unassociatedFaceCropUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("HMDCSEFC.ck.unassociatedFaceCropUUID"));

    v16 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMutableCameraSignificantEventFaceClassification *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMDCSEFC.ck.UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCSEFC.ck.personManagerUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCSEFC.ck.personUUID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForKey:", CFSTR("HMDCSEFC.ck.personName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCSEFC.ck.unassociatedFaceCropUUID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:]([HMDMutableCameraSignificantEventFaceClassification alloc], "initWithUUID:personManagerUUID:", v6, v7);
        -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v11, "setPersonUUID:", v8);
        -[HMDCameraSignificantEventFaceClassification setPersonName:](v11, "setPersonName:", v9);
        -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v11, "setUnassociatedFaceCropUUID:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
