@implementation NSDictionary(HMDCharacteristicResponse)

- (uint64_t)hmd_isValidResponseForWriteRequest:()HMDCharacteristicResponse naturalLightingEnabled:error:
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *context;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v11;
    v59 = 2112;
    v60 = v12;
    v61 = 2112;
    v62 = a1;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Received response for requests %@:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "characteristic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(a1, "hmd_valueOfCharacteristic:error:", v13, &v56);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v56;

  if (v14)
  {
    v16 = v14;
    objc_opt_class();
    v17 = objc_opt_isKindOfClass() & 1;
    if (v17)
      v18 = v16;
    else
      v18 = 0;
    v19 = v18;

    if (v17)
    {
      v54 = v19;
      objc_msgSend(v8, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "isEqual:", v20);

      v22 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Calling completion by ignoring the write response", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        v26 = 1;
        v27 = v15;
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "hmf_hexadecimalRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v36;
          v59 = 2112;
          v60 = v37;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@[Natural Lighting] Decoding value transition control response: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v55 = v15;
        objc_msgSend(MEMORY[0x24BE1BA50], "parsedFromData:error:", v16, &v55);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v55;

        v39 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v38)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v42;
            v59 = 2112;
            v60 = v38;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Transition control response is: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v39);
          objc_msgSend(v8, "characteristic");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "service");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "findCharacteristicWithType:", *MEMORY[0x24BDD57F0]);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend(v38, "isNaturalLightingEnabledForCharacteristic:", v45) ^ a4;
          if (v46 == 1)
          {
            context = (void *)MEMORY[0x227676638]();
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v58 = v52;
              v59 = 2112;
              v60 = v48;
              v61 = 2112;
              v62 = v49;
              _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Write response indicates Natural Lighting was enabled: %@ expected: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(context);
            objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          v26 = v46 ^ 1u;

        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v58 = v50;
            v59 = 2112;
            v60 = v16;
            v61 = 2112;
            v62 = v27;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Failed to parse Transition Control Response %@:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v39);
          v26 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v27);
        }

      }
      v19 = v54;
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = v19;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v58 = v34;
        v59 = 2112;
        v60 = v8;
        v61 = 2112;
        v62 = v16;
        v63 = 2112;
        v64 = v35;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Response value for request %@ is not of expected type %@:%@", buf, 0x2Au);

        v19 = v33;
      }

      objc_autoreleasePoolPop(v31);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
        v26 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      v27 = v15;
    }

    v15 = v27;
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v30;
      v59 = 2112;
      v60 = v8;
      v61 = 2112;
      v62 = v15;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Failed to parse response for request %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    if (a5)
    {
      v15 = objc_retainAutorelease(v15);
      v26 = 0;
      *a5 = v15;
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (id)hmd_valueOfCharacteristic:()HMDCharacteristicResponse error:
{
  id v6;
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *context;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hmf_dictionaryForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmf_dictionaryForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v42 = v11;
      objc_msgSend(v11, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmf_dictionaryForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hmf_dataForKey:", CFSTR("kCharacteristicErrorDataKey"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (a4 && !v18)
        {
          v38 = v8;
          v40 = (void *)v19;
          v21 = (void *)MEMORY[0x24BDD1620];
          v22 = objc_opt_class();
          v44 = 0;
          v23 = v21;
          v20 = v40;
          objc_msgSend(v23, "unarchivedObjectOfClass:fromData:error:", v22, v40, &v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v44;
          if (v24)
          {
            *a4 = objc_retainAutorelease(v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            context = (void *)MEMORY[0x227676638]();
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v46 = v35;
              v47 = 2112;
              v48 = v40;
              v49 = 2112;
              v50 = v39;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode error from data %@:%@", buf, 0x20u);

              v20 = v40;
            }

            objc_autoreleasePoolPop(context);
          }

          v8 = v38;
        }

      }
      else
      {
        v31 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v46 = v33;
          v47 = 2112;
          v48 = v42;
          v49 = 2112;
          v50 = v8;
          v51 = 2112;
          v52 = v10;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for characteristic with iid of service with iid of accessory with uuid %@:%@:%@", buf, 0x2Au);

          v31 = v41;
        }

        objc_autoreleasePoolPop(v31);
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
      }
      v11 = v42;

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = v11;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v30;
        v47 = 2112;
        v48 = v8;
        v49 = 2112;
        v50 = v10;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for service with iid of accessory with uuid %@:%@", buf, 0x20u);

        v11 = v43;
      }

      objc_autoreleasePoolPop(v28);
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v27;
      v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for accessory with uuid in write response %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (id)hmd_responseByRemovingEntriesForCharacteristics:()HMDCharacteristicResponse
{
  id v4;
  uint64_t i;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = (void *)objc_msgSend(a1, "mutableCopy");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v34;
    v27 = a1;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v6, "service", v27);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "instanceID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "accessory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "instanceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "hmf_dictionaryForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v9;
          objc_msgSend(v15, "hmf_dictionaryForKey:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "hmf_dictionaryForKey:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v29 = v20;
              v21 = (void *)objc_msgSend(v19, "mutableCopy");
              objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v14);
              v22 = (void *)objc_msgSend(v16, "mutableCopy");
              if (objc_msgSend(v21, "count"))
              {
                v23 = (void *)objc_msgSend(v21, "copy");
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v17);

              }
              else
              {
                objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v17);
              }
              if (objc_msgSend(v22, "count"))
              {
                v24 = (void *)objc_msgSend(v22, "copy");
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, v12);

              }
              else
              {
                objc_msgSend(v28, "removeObjectForKey:", v12);
              }
              a1 = v27;

              v20 = v29;
            }

          }
          v9 = v17;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v32);
  }

  v25 = (void *)objc_msgSend(v28, "copy");
  return v25;
}

@end
