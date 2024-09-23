@implementation MKFCKScene

- (id)decodeActionNaturalLight:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _MKFNaturalLightingAction *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  MKFCKScene *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  MKFCKScene *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  MKFCKScene *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  MKFCKScene *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  MKFCKScene *v54;
  NSObject *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  MKFCKScene *v63;
  id v64;
  id v65;
  _BYTE *v66;
  _QWORD v67[4];
  id v68;
  MKFCKScene *v69;
  _BYTE *v70;
  _BYTE v71[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE buf[24];
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v60 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Lm"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Ll"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      v59 = v18;
      if (v18)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Le"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        v58 = v21;
        if (v21)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v76 = __Block_byref_object_copy__31351;
          v77 = __Block_byref_object_dispose__31352;
          v78 = 0;
          objc_msgSend(v9, "home");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "accessories");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = MEMORY[0x24BDAC760];
          v67[0] = MEMORY[0x24BDAC760];
          v67[1] = 3221225472;
          v67[2] = __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke;
          v67[3] = &unk_24E779A58;
          v69 = self;
          v70 = buf;
          v68 = v15;
          objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v67);

          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            *(_QWORD *)v71 = 0;
            *(_QWORD *)&v71[8] = v71;
            *(_QWORD *)&v71[16] = 0x3032000000;
            v72 = __Block_byref_object_copy__31351;
            v73 = __Block_byref_object_dispose__31352;
            v74 = 0;
            objc_msgSend(v9, "actions");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v61[0] = v24;
            v61[1] = 3221225472;
            v61[2] = __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke_8;
            v61[3] = &unk_24E798238;
            v26 = v12;
            v66 = v71;
            v62 = v26;
            v63 = self;
            v64 = v8;
            v27 = v60;
            v65 = v27;
            objc_msgSend(v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v61);

            v28 = *(void **)(*(_QWORD *)&v71[8] + 40);
            if (!v28)
            {
              v29 = -[_MKFNaturalLightingAction initWithContext:]([_MKFNaturalLightingAction alloc], "initWithContext:", v27);
              v30 = *(void **)(*(_QWORD *)&v71[8] + 40);
              *(_QWORD *)(*(_QWORD *)&v71[8] + 40) = v29;

              objc_msgSend(*(id *)(*(_QWORD *)&v71[8] + 40), "setModelID:", v26);
              -[MKFCKScene writerTimestamp](self, "writerTimestamp");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)&v71[8] + 40), "setWriterTimestamp:", v31);

              objc_msgSend(v9, "addActions_Object:", *(_QWORD *)(*(_QWORD *)&v71[8] + 40));
              v28 = *(void **)(*(_QWORD *)&v71[8] + 40);
            }
            objc_msgSend(v28, "lightProfileUUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v59, "isEqual:", v32);

            if ((v33 & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)&v71[8] + 40), "setLightProfileUUID:", v59);
            objc_msgSend(*(id *)(*(_QWORD *)&v71[8] + 40), "naturalLightingEnabledField");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v58, "isEqual:", v34);

            if ((v35 & 1) == 0)
              objc_msgSend(*(id *)(*(_QWORD *)&v71[8] + 40), "setNaturalLightingEnabledField:", v58);
            v36 = *(id *)(*(_QWORD *)&v71[8] + 40);

            _Block_object_dispose(v71, 8);
          }
          else
          {
            v53 = (void *)MEMORY[0x227676638]();
            v54 = self;
            HMFGetOSLogHandle();
            v55 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v71 = 138543618;
              *(_QWORD *)&v71[4] = v56;
              *(_WORD *)&v71[12] = 2112;
              *(_QWORD *)&v71[14] = v8;
              _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory matching action: %@", v71, 0x16u);

            }
            objc_autoreleasePoolPop(v53);
            v36 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v49 = (void *)MEMORY[0x227676638]();
          v50 = self;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v8;
            _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode enable in action: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v49);
          v36 = 0;
        }

      }
      else
      {
        v45 = (void *)MEMORY[0x227676638]();
        v46 = self;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode profileID in action: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v45);
        v36 = 0;
      }

    }
    else
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      v36 = 0;
    }

  }
  else
  {
    v37 = (void *)MEMORY[0x227676638]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    v36 = 0;
  }

  return v36;
}

- (id)encodeActionNaturalLight:(id)a3 accessories:(id)a4 shouldRemoveAction:(BOOL *)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  MKFCKScene *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  MKFCKScene *v32;
  NSObject *v33;
  void *v34;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHomeObject _accessoryWithModelID:context:](self, v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v11, "addObject:", v16);
      v39[0] = CFSTR("NL");
      v38[0] = CFSTR("At");
      v38[1] = CFSTR("Am");
      objc_msgSend(v10, "modelID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v36;
      v39[2] = v15;
      v38[2] = CFSTR("Lm");
      v38[3] = CFSTR("Le");
      objc_msgSend(v10, "naturalLightingEnabledField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      v39[3] = v18;
      v38[4] = CFSTR("Ll");
      objc_msgSend(v10, "lightProfileUUID");
      v19 = v10;
      v20 = v14;
      v21 = v16;
      v22 = v15;
      v23 = v12;
      v24 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v24;
      v12 = v23;
      v15 = v22;
      v16 = v21;
      v14 = v20;
      v10 = v19;

    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = v31;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v34;
        v42 = 2112;
        v43 = v15;
        v44 = 2112;
        v45 = v10;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %@: %@", buf, 0x20u);

        v31 = v37;
      }

      objc_autoreleasePoolPop(v31);
      v26 = 0;
      *a5 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v30;
      v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, no accessory specified: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
    *a5 = 1;
  }

  return v26;
}

void __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v16;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing accessory is not a HAP accessory: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    *a3 = 1;
  }

}

void __78__MKFCKScene_ActionNaturalLight__decodeActionNaturalLight_localModel_context___block_invoke_8(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v8);
    }
    *a3 = 1;
  }

}

- (id)decodeActionCharacteristic:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  _MKFCharacteristicWriteAction *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  void *v46;
  MKFCKScene *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  MKFCKScene *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  MKFCKScene *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  MKFCKScene *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  MKFCKScene *v63;
  NSObject *v64;
  void *v65;
  MKFCKScene *v66;
  void *v67;
  void *v68;
  MKFCKScene *v69;
  NSObject *v70;
  void *v71;
  id v73;
  void *context;
  void *contexta;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  MKFCKScene *v81;
  id v82;
  id v83;
  _BYTE *v84;
  _BYTE buf[24];
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Cm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (!v16)
    {
      v50 = (void *)MEMORY[0x227676638]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v50);
      v45 = 0;
      goto LABEL_64;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Cs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (!v19)
    {
      v54 = (void *)MEMORY[0x227676638]();
      v55 = self;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode serviceID in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v54);
      v45 = 0;
      goto LABEL_63;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Cc"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v78 = v22;
    if (v22)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Ct"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v23;
      if (v23)
      {
        if ((void *)*MEMORY[0x24BDBD430] == v23)
        {

          v77 = 0;
        }
        objc_msgSend(v9, "home");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accessoryWithModelID:context:", v16, v10);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          v25 = v76;
          objc_opt_class();
          v26 = objc_opt_isKindOfClass() & 1;
          if (v26)
            v27 = v25;
          else
            v27 = 0;
          v28 = v27;

          if (v26)
          {

            objc_msgSend(v25, "serviceWithID:context:", v19, v10);
            context = (void *)objc_claimAutoreleasedReturnValue();
            if (context)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v86 = __Block_byref_object_copy__52966;
              v87 = __Block_byref_object_dispose__52967;
              v88 = 0;
              objc_msgSend(v9, "actions");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v79[0] = MEMORY[0x24BDAC760];
              v79[1] = 3221225472;
              v79[2] = __82__MKFCKScene_ActionCharacteristic__decodeActionCharacteristic_localModel_context___block_invoke;
              v79[3] = &unk_24E798238;
              v84 = buf;
              v73 = v13;
              v80 = v73;
              v81 = self;
              v82 = v8;
              v30 = v10;
              v83 = v30;
              objc_msgSend(v29, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v79);

              v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
              if (!v31)
              {
                v32 = -[_MKFCharacteristicWriteAction initWithContext:]([_MKFCharacteristicWriteAction alloc], "initWithContext:", v30);
                v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v32;

                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setModelID:", v73);
                -[MKFCKScene writerTimestamp](self, "writerTimestamp");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWriterTimestamp:", v34);

                objc_msgSend(v9, "addActions_Object:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
              }
              objc_msgSend(v31, "accessory", v73);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = HMFEqualObjects();

              if ((v36 & 1) == 0)
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAccessory:", v25);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "service");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = HMFEqualObjects();

              if ((v38 & 1) == 0)
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setService:", context);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "characteristicID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = HMFEqualObjects();

              if ((v40 & 1) == 0)
              {
                v41 = (void *)objc_msgSend(v78, "copy");
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setCharacteristicID:", v41);

              }
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "targetValue");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = HMFEqualObjects();

              if ((v43 & 1) == 0)
              {
                v44 = (void *)objc_msgSend(v77, "copy");
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTargetValue:", v44);

              }
              v45 = *(id *)(*(_QWORD *)&buf[8] + 40);

              _Block_object_dispose(buf, 8);
            }
            else
            {
              v68 = (void *)MEMORY[0x227676638]();
              v69 = self;
              HMFGetOSLogHandle();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v71;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v8;
                _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Could not find service matching action: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v68);
              v45 = 0;
            }

            goto LABEL_61;
          }
          contexta = (void *)MEMORY[0x227676638]();
          v66 = self;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v86 = (uint64_t (*)(uint64_t, uint64_t))v8;
            _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAP accessory in action: %@", buf, 0x20u);

          }
        }
        else
        {
          contexta = (void *)MEMORY[0x227676638]();
          v63 = self;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v65;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v8;
            _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory matching action: %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(contexta);
        v45 = 0;
LABEL_61:

        goto LABEL_62;
      }
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode targetValue in action: %@", buf, 0x16u);

      }
    }
    else
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode characteristicID in action: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v58);
    v45 = 0;
LABEL_62:

LABEL_63:
LABEL_64:

    goto LABEL_65;
  }
  v46 = (void *)MEMORY[0x227676638]();
  v47 = self;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v46);
  v45 = 0;
LABEL_65:

  return v45;
}

- (id)encodeActionCharacteristic:(id)a3 accessories:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  MKFCKScene *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[6];
  _QWORD v34[6];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKHomeObject _accessoryWithModelID:context:](self, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v9, "addObject:", v13);
    v34[0] = CFSTR("CW");
    v33[0] = CFSTR("At");
    v33[1] = CFSTR("Am");
    objc_msgSend(v8, "modelID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v31;
    v34[2] = v12;
    v33[2] = CFSTR("Cm");
    v33[3] = CFSTR("Cs");
    objc_msgSend(v8, "service");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v14;
    v33[4] = CFSTR("Cc");
    objc_msgSend(v8, "characteristicID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v15;
    v33[5] = CFSTR("Ct");
    objc_msgSend(v8, "targetValue");
    v32 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    v18 = v10;
    v19 = (void *)v17;
    v20 = (void *)*MEMORY[0x24BDBD430];
    if (v17)
      v20 = (void *)v17;
    v21 = v13;
    v22 = v12;
    v23 = v20;
    v34[5] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v22;
    v13 = v21;

    v10 = v18;
    v9 = v32;

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v28;
      v37 = 2160;
      v38 = 1752392040;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v8;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %{mask.hash}@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

void __82__MKFCKScene_ActionCharacteristic__decodeActionCharacteristic_localModel_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v8);
    }
    *a3 = 1;
  }

}

- (id)decodeActionAppleMediaAccessoryPower:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _MKFAppleMediaAccessoryPowerAction *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  MKFCKScene *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  MKFCKScene *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  MKFCKScene *v42;
  NSObject *v43;
  void *v44;
  MKFCKScene *v45;
  NSObject *v46;
  void *v47;
  void *context;
  void *v50;
  _QWORD v51[4];
  id v52;
  MKFCKScene *v53;
  id v54;
  id v55;
  _BYTE *v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("AMAPATVU"));
    v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("AMAPASWS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v9, "home");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accessoryWithModelID:context:", v14, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        v50 = v20;
        if (v20)
        {

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v58 = __Block_byref_object_copy__137148;
          *(_QWORD *)&v59 = __Block_byref_object_dispose__137149;
          *((_QWORD *)&v59 + 1) = 0;
          objc_msgSend(v9, "actions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = MEMORY[0x24BDAC760];
          v51[1] = 3221225472;
          v51[2] = __85__MKFCKScene_ActionAppleTV__decodeActionAppleMediaAccessoryPower_localModel_context___block_invoke;
          v51[3] = &unk_24E798238;
          v22 = v13;
          v56 = buf;
          v52 = v22;
          v53 = self;
          v54 = v8;
          v23 = v10;
          v55 = v23;
          objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v51);

          v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (!v24)
          {
            v25 = -[_MKFAppleMediaAccessoryPowerAction initWithContext:]([_MKFAppleMediaAccessoryPowerAction alloc], "initWithContext:", v23);
            v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v25;

            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setModelID:", v22);
            -[MKFCKScene writerTimestamp](self, "writerTimestamp");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWriterTimestamp:", v27);

            objc_msgSend(v9, "addActions_Object:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
          }
          objc_msgSend(v24, "accessory");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = HMFEqualObjects();

          if ((v29 & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAccessory:", v50);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "targetSleepWakeState");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = HMFEqualObjects();

          if ((v31 & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTargetSleepWakeState:", v15);
          v32 = *(id *)(*(_QWORD *)&buf[8] + 40);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v45 = self;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v47;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v58 = v14;
            LOWORD(v59) = 2112;
            *(_QWORD *)((char *)&v59 + 2) = v8;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory %{mask.hash}@ matching action %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(context);

          v32 = 0;
        }

      }
      else
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode targetSleepWakeState in action: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        v32 = 0;
      }

    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessoryUUID in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      v32 = 0;
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v32 = 0;
  }

  return v32;
}

- (id)encodeActionAppleMediaAccessoryPower:(id)a3 accessories:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MKFCKScene *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKHomeObject _accessoryWithModelID:context:](self, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v23[0] = CFSTR("AMAP");
    objc_msgSend(v8, "modelID", CFSTR("At"), CFSTR("Am"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    v23[2] = v12;
    v22[2] = CFSTR("AMAPATVU");
    v22[3] = CFSTR("AMAPASWS");
    objc_msgSend(v8, "targetSleepWakeState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v20;
      v26 = 2160;
      v27 = 1752392040;
      v28 = 2112;
      v29 = v12;
      v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching appleTV with modelID %{mask.hash}@: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

void __85__MKFCKScene_ActionAppleTV__decodeActionAppleMediaAccessoryPower_localModel_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v8);
    }
    *a3 = 1;
  }

}

- (id)decodeActionShortcut:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _MKFShortcutAction *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  MKFCKScene *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  MKFCKScene *v32;
  NSObject *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  MKFCKScene *v38;
  id v39;
  id v40;
  _BYTE *v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Sd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v43 = __Block_byref_object_copy__188232;
      v44 = __Block_byref_object_dispose__188233;
      v45 = 0;
      objc_msgSend(v9, "actions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __70__MKFCKScene_ActionShortcut__decodeActionShortcut_localModel_context___block_invoke;
      v36[3] = &unk_24E798238;
      v18 = v13;
      v41 = buf;
      v37 = v18;
      v38 = self;
      v39 = v8;
      v19 = v10;
      v40 = v19;
      objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

      v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v20)
      {
        v21 = -[_MKFShortcutAction initWithContext:]([_MKFShortcutAction alloc], "initWithContext:", v19);
        v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v21;

        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setModelID:", v18);
        -[MKFCKScene writerTimestamp](self, "writerTimestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWriterTimestamp:", v23);

        objc_msgSend(v9, "addActions_Object:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      }
      objc_msgSend(v20, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v16, "isEqual:", v24);

      if ((v25 & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setData:", v16);
      v26 = *(id *)(*(_QWORD *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v26 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

- (id)encodeActionShortcut:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("S");
  v11[0] = CFSTR("At");
  v11[1] = CFSTR("Am");
  v4 = a3;
  objc_msgSend(v4, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("Sd");
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  return v9;
}

void __70__MKFCKScene_ActionShortcut__decodeActionShortcut_localModel_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v8);
    }
    *a3 = 1;
  }

}

- (id)decodeActionMediaPlayback:(id)a3 localModel:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  MKFCKScene *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  MKFCKScene *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  MKFCKScene *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  MKFCKScene *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  _MKFMediaPlaybackAction *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  char v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  MKFCKScene *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  MKFCKScene *v78;
  NSObject *v79;
  void *v80;
  id v82;
  id v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  MKFCKScene *v90;
  id v91;
  id v92;
  _BYTE *v93;
  _QWORD v94[5];
  id v95;
  id v96;
  id v97;
  id v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  id v104;
  _BYTE buf[24];
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v86 = a4;
  v87 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Ms"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15
        || ((v17 = v15, objc_opt_class(), (v18 = objc_opt_isKindOfClass() & 1) == 0)
          ? (v19 = 0)
          : (v19 = v17),
            v20 = v19,
            v17,
            v18))
      {

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Mv"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v21;
        v22 = v21;
        if (v21)
        {
          v23 = v21;
          objc_opt_class();
          v24 = objc_opt_isKindOfClass() & 1;
          v25 = v24 ? v23 : 0;
          v26 = v25;

          if (!v24)
          {
            v48 = (void *)MEMORY[0x227676638]();
            v49 = self;
            HMFGetOSLogHandle();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v51;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v8;
              _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode volume in action: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v48);
            v39 = 0;
            goto LABEL_62;
          }
        }

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Ma"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v29 = v27;
          objc_opt_class();
          v30 = objc_opt_isKindOfClass() & 1;
          if (v30)
            v31 = v29;
          else
            v31 = 0;
          v32 = v31;

          if (v30)
          {
            v104 = 0;
            objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, &v104);
            v84 = objc_claimAutoreleasedReturnValue();
            v33 = (uint64_t (*)(uint64_t, uint64_t))v104;
            v34 = v33;
            if (v84)
            {

LABEL_40:
              objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v14, "count"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = 0;
              v101 = &v100;
              v102 = 0x2020000000;
              v53 = MEMORY[0x24BDAC760];
              v103 = 1;
              v94[0] = MEMORY[0x24BDAC760];
              v94[1] = 3221225472;
              v94[2] = __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke;
              v94[3] = &unk_24E798210;
              v94[4] = self;
              v54 = v8;
              v95 = v54;
              v99 = &v100;
              v82 = v86;
              v96 = v82;
              v55 = v87;
              v97 = v55;
              v83 = v52;
              v98 = v83;
              objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v94);
              if (*((_BYTE *)v101 + 24))
              {
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v106 = __Block_byref_object_copy__235351;
                v107 = __Block_byref_object_dispose__235352;
                v108 = 0;
                objc_msgSend(v82, "actions");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v88[0] = v53;
                v88[1] = 3221225472;
                v88[2] = __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke_14;
                v88[3] = &unk_24E798238;
                v57 = v11;
                v93 = buf;
                v89 = v57;
                v90 = self;
                v91 = v54;
                v58 = v55;
                v92 = v58;
                objc_msgSend(v56, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v88);

                v59 = *(void **)(*(_QWORD *)&buf[8] + 40);
                if (!v59)
                {
                  v60 = -[_MKFMediaPlaybackAction initWithContext:]([_MKFMediaPlaybackAction alloc], "initWithContext:", v58);
                  v61 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v60;

                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setModelID:", v57);
                  -[MKFCKScene writerTimestamp](self, "writerTimestamp");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setWriterTimestamp:", v62);

                  objc_msgSend(v82, "addActions_Object:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                  v59 = *(void **)(*(_QWORD *)&buf[8] + 40);
                }
                objc_msgSend(v59, "state", v82);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = HMFEqualObjects();

                if ((v64 & 1) == 0)
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setState:", v16);
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "volume");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = HMFEqualObjects();

                if ((v66 & 1) == 0)
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setVolume:", v85);
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "encodedPlaybackArchive");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = HMFEqualObjects();

                if ((v68 & 1) == 0)
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setEncodedPlaybackArchive:", v84);
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "accessories");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v69, "isEqualToSet:", v83);

                if ((v70 & 1) == 0)
                {
                  v71 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  v72 = (void *)objc_msgSend(v83, "copy");
                  objc_msgSend(v71, "setAccessories_:", v72);

                }
                v39 = *(id *)(*(_QWORD *)&buf[8] + 40);

                _Block_object_dispose(buf, 8);
              }
              else
              {
                v39 = 0;
              }

              _Block_object_dispose(&v100, 8);
              v29 = (id)v84;
              goto LABEL_61;
            }
            v77 = (void *)MEMORY[0x227676638]();
            v78 = self;
            HMFGetOSLogHandle();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v8;
              *(_WORD *)&buf[22] = 2114;
              v106 = v34;
              _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode playback archive in action: %@, %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v77);

          }
          else
          {
            v73 = (void *)MEMORY[0x227676638]();
            v74 = self;
            HMFGetOSLogHandle();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v76;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v8;
              _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encodedArchive in action: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v73);
          }
          v39 = 0;
LABEL_61:

          v23 = v85;
LABEL_62:

          goto LABEL_63;
        }
        v84 = 0;
        goto LABEL_40;
      }
      v44 = (void *)MEMORY[0x227676638]();
      v45 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode state in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);

    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelIDs in action: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }
    v39 = 0;
LABEL_63:

    goto LABEL_64;
  }
  v35 = (void *)MEMORY[0x227676638]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode modelID in action: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
  v39 = 0;
LABEL_64:

  return v39;
}

- (id)encodeActionMediaPlayback:(id)a3 accessories:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  MKFCKScene *v35;
  NSObject *v36;
  void *v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[4];
  _QWORD v55[4];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v40 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  objc_msgSend(v8, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke;
  v45[3] = &unk_24E798260;
  v45[4] = self;
  v39 = v9;
  v46 = v39;
  v15 = v8;
  v47 = v15;
  v49 = &v50;
  v16 = v12;
  v48 = v16;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v45);

  if (*((_BYTE *)v51 + 24))
  {
    objc_msgSend(v15, "encodedPlaybackArchive", v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v15, "encodedPlaybackArchive");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v18, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v44);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v44;

      if (!v20)
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v37;
          v58 = 2114;
          v59 = v21;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode playback archive: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        v22 = 0;
        goto LABEL_15;
      }

    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v16, "count"));
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke_19;
    v41[3] = &unk_24E798288;
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v42 = v23;
    v43 = v40;
    objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
    v24 = (void *)MEMORY[0x24BDBCED8];
    v55[0] = CFSTR("MP");
    v54[0] = CFSTR("At");
    v54[1] = CFSTR("Am");
    objc_msgSend(v15, "modelID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v25;
    v54[2] = CFSTR("Mm");
    objc_msgSend(v23, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v26;
    v54[3] = CFSTR("Ms");
    objc_msgSend(v15, "state");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    v55[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryWithDictionary:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "volume");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v15, "volume");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("Mv"));

    }
    if (v20)
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v20, CFSTR("Ma"));
    v22 = (void *)objc_msgSend(v30, "copy");

    v21 = (id)v20;
LABEL_15:

    goto LABEL_16;
  }
  v22 = 0;
LABEL_16:

  _Block_object_dispose(&v50, 8);
  return v22;
}

void __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHomeObject _accessoryWithModelID:context:](*(void **)(a1 + 32), v6, *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138544130;
      v14 = v11;
      v15 = 2160;
      v16 = 1752392040;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode action, cannot find matching accessory with modelID %{mask.hash}@: %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __81__MKFCKScene_ActionMediaPlayback__encodeActionMediaPlayback_accessories_context___block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

void __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryWithModelID:context:", v8, *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v10);
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v21 = 138543874;
        v22 = v19;
        v23 = 2112;
        v24 = v8;
        v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory %@ matching action: %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      *a4 = 1;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory modelID in action: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

void __80__MKFCKScene_ActionMediaPlayback__decodeActionMediaPlayback_localModel_context___block_invoke_14(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Existing action is an unexpected type: %@, %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v8);
    }
    *a3 = 1;
  }

}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v7 = a3;
  v8 = a5;
  v9 = -[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, v8);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCEF0];
    -[MKFCKScene actions](self, "actions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKScene actions](self, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke;
    v28[3] = &unk_24E79B828;
    v28[4] = self;
    v14 = v7;
    v29 = v14;
    v15 = v8;
    v30 = v15;
    v16 = v12;
    v31 = v16;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

    objc_msgSend(v14, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke_14;
    v25 = &unk_24E79B850;
    v26 = v16;
    v27 = v15;
    v19 = v16;
    objc_msgSend(v18, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v22);

    -[MKFCKScene applicationData](self, "applicationData", v22, v23, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", v20, v14);

  }
  return v9;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;
  void *v40;
  MKFCKScene *v41;
  NSObject *v42;
  void *v43;
  id v45;
  id v46;
  void *context;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _BYTE buf[24];
  void *v62;
  id v63;
  MKFCKScene *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = (void *)MEMORY[0x227676638]();
  v11 = v8;
  v12 = v9;
  v13 = v10;
  if (self
    && -[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v11, v13))
  {
    v14 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v11, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmd_currentChangeSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDBCED8];
    -[MKFCKScene actions](self, "actions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKScene actions](self, "actions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke;
    v58[3] = &unk_24E79B878;
    v45 = v18;
    v59 = v45;
    v24 = v21;
    v60 = v24;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v58);

    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 1;
    objc_msgSend(v11, "actions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v23;
    v48[1] = 3221225472;
    v48[2] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_2;
    v48[3] = &unk_24E79B8A0;
    v48[4] = self;
    v26 = v17;
    v49 = v26;
    v50 = v13;
    v53 = &v54;
    v27 = v24;
    v51 = v27;
    v46 = v16;
    v52 = v46;
    objc_msgSend(v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);

    if (*((_BYTE *)v55 + 24))
    {
      *(_QWORD *)buf = v23;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_26;
      v62 = &unk_24E79B8C8;
      v28 = v46;
      v63 = v28;
      v64 = self;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", buf);
      v29 = (void *)MEMORY[0x24BDBCF20];
      -[MKFCKScene actions](self, "actions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = HMFEqualObjects();

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v28, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKScene setActions:](self, "setActions:", v32);

      }
      -[MKFCKScene accessories](self, "accessories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = HMFEqualObjects();

      if ((v34 & 1) == 0)
      {
        v35 = (void *)objc_msgSend(v26, "copy");
        -[MKFCKScene setAccessories:](self, "setAccessories:", v35);

      }
      +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", v11);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKScene applicationData](self, "applicationData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = HMFEqualObjects();

      if ((v38 & 1) == 0)
        -[MKFCKScene setApplicationData:](self, "setApplicationData:", v36);

    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode all actions, assuming a later export will succeed: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }

    _Block_object_dispose(&v54, 8);
    v39 = 1;
  }
  else
  {
    v39 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v39;
}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Am"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "deletedModelIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);

}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v18 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "encodeActionCharacteristic:accessories:context:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "encodeActionNaturalLight:accessories:shouldRemoveAction:context:", v5, *(_QWORD *)(a1 + 40), &v18, *(_QWORD *)(a1 + 48));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "encodeActionMediaPlayback:accessories:context:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "encodeActionShortcut:context:", v5, *(_QWORD *)(a1 + 48));
          v6 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
          objc_msgSend(*(id *)(a1 + 32), "encodeActionAppleMediaAccessoryPower:accessories:context:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          v6 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v7 = (void *)v6;
  if (!v6)
  {
    if (v18)
      goto LABEL_19;
LABEL_18:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
    goto LABEL_19;
  }
  v8 = *(void **)(a1 + 56);
  objc_msgSend(v5, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKFCKModel mergedDictionaryFromCloud:localModifications:](MKFCKModel, "mergedDictionaryFromCloud:localModifications:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge cloud & local actions: %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
  }
  v16 = *(void **)(a1 + 56);
  objc_msgSend(v5, "modelID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v17);

  objc_msgSend(*(id *)(a1 + 64), "addObject:", v11);
LABEL_19:

}

void __62__MKFCKScene__exportFromLocalModel_updatedProperties_context___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "addObject:", v6));
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("At"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Found new action type [%{public}@] not supported by this software. Adding it back to cloud: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);

}

void __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("At"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CW")))
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeActionCharacteristic:localModel:context:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("NL")))
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeActionNaturalLight:localModel:context:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("MP")))
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeActionMediaPlayback:localModel:context:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("S")))
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeActionShortcut:localModel:context:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("AMAP")))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v3;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unknown encoded action type: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "decodeActionAppleMediaAccessoryPower:localModel:context:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    goto LABEL_19;
  }
LABEL_16:
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode action, ignoring: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_19:

}

void __61__MKFCKScene_importIntoLocalModel_updatedProperties_context___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v6);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKScene"));
}

@end
