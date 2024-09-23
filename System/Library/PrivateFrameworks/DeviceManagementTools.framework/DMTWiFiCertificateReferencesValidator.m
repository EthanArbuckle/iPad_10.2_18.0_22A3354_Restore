@implementation DMTWiFiCertificateReferencesValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v23;
  id *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v5, "payloadsOfType:", CFSTR("com.apple.wifi.managed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v7)
  {
    v8 = v7;
    v24 = a4;
    v25 = v5;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    v26 = v6;
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!v9)
        {
          objc_msgSend(v25, "payloadsByUUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v12, "certificateAnchorUUID", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v9, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                if (v24)
                {
                  v35[0] = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
                  v35[1] = CFSTR("PayloadCertificateAnchorUUID[]");
                  v36[0] = CFSTR("PayloadCertificateAnchorUUID[]");
                  v36[1] = v18;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  DMTErrorWithCodeAndUserInfo(76, v21);
                  *v24 = (id)objc_claimAutoreleasedReturnValue();

                }
                v20 = 0;
                v5 = v25;
                v6 = v26;
                goto LABEL_23;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            if (v15)
              continue;
            break;
          }
        }

        v6 = v26;
        v10 = v23;
      }
      v8 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      v20 = 1;
      v5 = v25;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v20 = 1;
  }
LABEL_23:

  return v20;
}

@end
