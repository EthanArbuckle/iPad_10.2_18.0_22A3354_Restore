@implementation HMDCameraSignificantEventBulletinParamsDictionaryTransformer

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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("HMDCSEBP.ck.UUID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("HMDCSEBP.ck.reason"));

    objc_msgSend(v5, "dateOfOccurrence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, CFSTR("HMDCSEBP.ck.date"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "confidenceLevel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("HMDCSEBP.ck.confidenceLevel"));

    objc_msgSend(v5, "cameraProfileUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("HMDCSEBP.ck.cameraProfileUUID"));

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "faceClassifications", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          +[HMDCameraSignificantEventFaceClassificationDictionaryTransformer transformedValue:error:](HMDCameraSignificantEventFaceClassificationDictionaryTransformer, "transformedValue:error:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v6, "setValue:forKey:", v21, CFSTR("HMDCSEBP.ck.faceClassifications"));

    v22 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  HMDCameraSignificantEventBulletinParams *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCSEBP.ck.UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("HMDCSEBP.ck.reason"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "unsignedIntegerValue");
        objc_msgSend(v6, "valueForKey:", CFSTR("HMDCSEBP.ck.date"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v6, "valueForKey:", CFSTR("HMDCSEBP.ck.confidenceLevel"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = objc_msgSend(v12, "unsignedIntegerValue");
            objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("HMDCSEBP.ck.cameraProfileUUID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_msgSend(v6, "valueForKey:", CFSTR("HMDCSEBP.ck.faceClassifications"));
              v16 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v16;
              if (v16)
              {
                v17 = (void *)v16;
                v28 = v14;
                v29 = v15;
                v30 = v10;
                v31 = v13;
                v32 = v9;
                v18 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                v37 = 0u;
                v19 = v17;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v35;
                  do
                  {
                    for (i = 0; i != v21; ++i)
                    {
                      if (*(_QWORD *)v35 != v22)
                        objc_enumerationMutation(v19);
                      +[HMDCameraSignificantEventFaceClassificationDictionaryTransformer reverseTransformedValue:error:](HMDCameraSignificantEventFaceClassificationDictionaryTransformer, "reverseTransformedValue:error:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), a4);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "addObject:", v24);

                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
                  }
                  while (v21);
                }

                v9 = v32;
                v10 = v30;
                v13 = v31;
                v25 = v28;
                v15 = v29;
              }
              else
              {
                v25 = v14;
                v18 = 0;
              }
              v26 = -[HMDCameraSignificantEventBulletinParams initWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfileUUID:]([HMDCameraSignificantEventBulletinParams alloc], "initWithUUID:reason:dateOfOccurrence:confidenceLevel:faceClassifications:cameraProfileUUID:", v7, v10, v11, v25, v18, v15);

            }
            else
            {
              v26 = 0;
            }

          }
          else
          {
            v26 = 0;
          }

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
