@implementation HMSetupAccessoryPayload

- (HMSetupAccessoryPayload)initWithHAPSetupPayloadURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  HMSetupAccessoryPayload *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HMSetupAccessoryPayload *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  HMSetupAccessoryPayload *v32;
  id v33;
  uint64_t *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  HMSetupAccessoryPayload *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  id v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  int v67;
  int v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  char v79;
  void *v80;
  unint64_t v81;
  void *v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v91;
  HMSetupAccessoryPayload *v92;
  uint64_t *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = v10;
    if (v10 <= 0xC)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v102 = (uint64_t)v14;
        v103 = 2048;
        v104 = v11;
        v105 = 2048;
        v106 = 13;
        v107 = 2112;
        v108 = v6;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload length '%lu' is less than minimum length '%lu' for setupPayloadURL '%@'", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v15 = 0;
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      goto LABEL_94;
    }
    MEMORY[0x1E0C80A78](v10);
    v20 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    objc_msgSend(v9, "getBytes:length:", v20, v11);
    v100 = 0;
    v21 = base36Decode((uint64_t)v20, 9, &v100);
    v23 = v22;
    v96 = v100;
    if (!(v21 | v23))
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      v15 = v96;
      if (v30)
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v102 = (uint64_t)v31;
        v103 = 2112;
        v104 = (uint64_t)v9;
        v105 = 2112;
        v106 = (uint64_t)v15;
        _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload base-36 decode failed for payload %@  error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      if (a4)
      {
        v15 = objc_retainAutorelease(v15);
        v16 = 0;
        *a4 = v15;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_94;
    }
    v95 = v9;
    v24 = self;
    if (((v21 >> 43) & 7) != 0)
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v102 = (uint64_t)v27;
        v103 = 1024;
        LODWORD(v104) = (v21 >> 43) & 7;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: Version in the setup payload is not zero - 0x%x", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v25);
      v15 = v96;
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2004);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v9 = v95;
      goto LABEL_94;
    }
    v32 = self;
    if ((v21 & 0x18000000000) == 0)
    {
      v33 = (id)((v21 >> 39) & 0xF);
      v94 = v33;
      if (v11 >= 0xE)
      {
        v34 = (uint64_t *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v36 = objc_claimAutoreleasedReturnValue();
          v93 = v34;
          v37 = (void *)v36;
          *(_DWORD *)buf = 138543618;
          v102 = v36;
          v103 = 2048;
          v104 = v11;
          _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload length larger than specified format - %tu", buf, 0x16u);

          v34 = v93;
        }

        objc_autoreleasePoolPop(v34);
        v32 = v24;
        v33 = v94;
      }
      if (v33)
      {
        v38 = (uint64_t *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = objc_claimAutoreleasedReturnValue();
          v93 = v38;
          v41 = (void *)v40;
          *(_DWORD *)buf = 138543618;
          v102 = v40;
          v103 = 1024;
          LODWORD(v104) = (_DWORD)v94;
          _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: Reserved bits in the setup payload are not zero - 0x%x", buf, 0x12u);

          v38 = v93;
        }

        objc_autoreleasePoolPop(v38);
        v32 = v24;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%03llu-%02llu-%03llu"), (175921861 * (v21 & 0x7FFFFFF)) >> 44, ((v21 & 0x7FFFFFF) - 100000 * (((175921861 * (v21 & 0x7FFFFFF)) >> 32) >> 12)) / 0x3E8, (v21 & 0x7FFFFFF) - 1000 * (((68719477 * (v21 & 0x7FFFFFF)) >> 32) >> 4));
    v91 = objc_claimAutoreleasedReturnValue();
    v42 = -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](v32, "initWithSetupCode:communicationProtocol:");
    v43 = (void *)-[HMSetupAccessoryPayload mutableCopy](v42, "mutableCopy");
    objc_msgSend(v43, "setSetupPayloadURL:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (v21 >> 31));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCategoryNumber:", v44);

    if ((v21 & 0x8000000) != 0)
    {
      objc_msgSend(v43, "setPaired:", 1);
      if ((v21 & 0x10000000) == 0)
      {
LABEL_34:
        if ((v21 & 0x20000000) == 0)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    else if ((v21 & 0x10000000) == 0)
    {
      goto LABEL_34;
    }
    objc_msgSend(v43, "setSupportsIP:", 1);
    if ((v21 & 0x20000000) == 0)
    {
LABEL_36:
      v92 = v42;
      v93 = &v91;
      if ((v21 & 0x40000000) != 0)
        objc_msgSend(v43, "setSupportsWAC:", 1);
      v94 = v43;
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 4; ++i)
        objc_msgSend(v45, "appendFormat:", CFSTR("%c"), v20[i + 9]);
      v47 = objc_msgSend(v94, "setSetupID:", v45);
      if ((v21 & 0x8000000000) != 0)
      {
        v9 = v95;
        if (v11 <= 0x1E)
        {
          v49 = (void *)MEMORY[0x1A1AC1AAC](v47);
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v102 = (uint64_t)v51;
            v103 = 2112;
            v104 = (uint64_t)v6;
            _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: too short for new style with extra info '%@'", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v49);
          v15 = v96;
          if (a4)
            goto LABEL_58;
          goto LABEL_70;
        }
        v57 = v96;
        v99 = v96;
        v58 = base36Decode((uint64_t)(v20 + 9), 22, &v99);
        v60 = v59;
        v61 = v99;

        if (v61)
        {
          v62 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v102 = (uint64_t)v64;
            v103 = 2112;
            v104 = (uint64_t)v6;
            v105 = 2112;
            v106 = (uint64_t)v61;
            _os_log_impl(&dword_19B1B0000, v63, OS_LOG_TYPE_ERROR, "%{public}@SetupPayload: failed to decode eui64 and product number '%@': %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v62);
          if (a4)
          {
            v15 = objc_retainAutorelease(v61);
            v16 = 0;
            *a4 = v15;
          }
          else
          {
            v16 = 0;
            v15 = v61;
          }
          goto LABEL_83;
        }
        if ((_WORD)v58)
        {
          v72 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v74 = objc_claimAutoreleasedReturnValue();
            v96 = v72;
            v75 = (void *)v74;
            *(_DWORD *)buf = 138543618;
            v102 = v74;
            v103 = 2048;
            v104 = (unsigned __int16)v58;
            _os_log_impl(&dword_19B1B0000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: reserved bits of extended QR code not all 0: %llu", buf, 0x16u);

            v72 = v96;
          }

          objc_autoreleasePoolPop(v72);
        }
        v76 = 0;
        *((_QWORD *)&v77 + 1) = v60;
        *(_QWORD *)&v77 = v58;
        v98 = v77 >> 48;
        v78 = 7;
        do
        {
          v79 = *((_BYTE *)&v98 + v76);
          *((_BYTE *)&v98 + v76) = *((_BYTE *)&v98 + v78);
          *((_BYTE *)&v98 + v78) = v79;
          ++v76;
          --v78;
        }
        while (v76 != 4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v98);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setThreadIdentifier:", v80);

        v81 = v58 >> 16;
        if ((v21 & 0x10000000000) == 0 && (_DWORD)v81)
        {
          v82 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v102 = (uint64_t)v84;
            v103 = 1024;
            LODWORD(v104) = v81;
            _os_log_impl(&dword_19B1B0000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: product number not included, but not all 0: %u", buf, 0x12u);

          }
          objc_autoreleasePoolPop(v82);
          v15 = 0;
          v48 = (void *)v91;
          goto LABEL_92;
        }
        v48 = (void *)v91;
        if ((v21 & 0x10000000000) == 0)
        {
LABEL_91:
          v15 = 0;
          goto LABEL_92;
        }
      }
      else
      {
        v9 = v95;
        if ((v21 & 0x10000000000) == 0)
        {
          v48 = (void *)v91;
          v15 = v96;
LABEL_92:
          v85 = v94;
          v16 = (HMSetupAccessoryPayload *)objc_msgSend(v94, "copy");
          goto LABEL_93;
        }
        if (v11 <= 0x1E)
        {
          v52 = (void *)MEMORY[0x1A1AC1AAC](v47);
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          v15 = v96;
          if (v54)
          {
            HMFGetLogIdentifier();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v102 = (uint64_t)v55;
            v103 = 2112;
            v104 = (uint64_t)v6;
            _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: too short for new style with product number '%@'", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v52);
          if (a4)
          {
LABEL_58:
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
            v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
            v16 = 0;
            *a4 = v56;
LABEL_83:
            v48 = (void *)v91;
            v85 = v94;
LABEL_93:

            self = v92;
LABEL_94:

            goto LABEL_95;
          }
LABEL_70:
          v16 = 0;
          goto LABEL_83;
        }
        v65 = v96;
        v97 = v96;
        v66 = base36Decode((uint64_t)(v20 + 13), 18, &v97);
        v68 = v67;
        v15 = v97;

        if (v15)
        {
          v69 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v102 = (uint64_t)v71;
            v103 = 2112;
            v104 = (uint64_t)v6;
            v105 = 2112;
            v106 = (uint64_t)v15;
            _os_log_impl(&dword_19B1B0000, v70, OS_LOG_TYPE_ERROR, "%{public}@SetupPayload: failed to decode product number '%@': %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v69);
          if (a4)
          {
            v56 = objc_retainAutorelease(v15);
            v15 = v56;
            goto LABEL_59;
          }
          goto LABEL_70;
        }
        if ((v66 & 0xFFFFFFFFFFFFFFLL) != 0)
        {
          v86 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v102 = (uint64_t)v88;
            v103 = 2048;
            v104 = v66 & 0xFFFFFFFFFFFFFFLL;
            _os_log_impl(&dword_19B1B0000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: reserved bits of extended QR code not all 0: %llu", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v86);
        }
        v81 = HIBYTE(v66) | (v68 << 8);
        v48 = (void *)v91;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08x"), v81);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setProductNumber:", v89);

      goto LABEL_91;
    }
LABEL_35:
    objc_msgSend(v43, "setSupportsBTLE:", 1);
    goto LABEL_36;
  }
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v102 = (uint64_t)v19;
    v103 = 2112;
    v104 = (uint64_t)v6;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@SetupPayload: setup payload URL host is nil in setupPayloadURL '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_95:

  return v16;
}

- (HMSetupAccessoryPayload)initWithHAPSetupCode:(id)a3
{
  return -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](self, "initWithSetupCode:communicationProtocol:", a3, 1);
}

- (HMSetupAccessoryPayload)initWithSetupCode:(id)a3 communicationProtocol:(int64_t)a4
{
  id v6;
  void *v7;
  HMSetupAccessoryPayload *v8;
  uint64_t v9;
  NSString *setupCode;
  HMSetupAccessoryPayload *v12;
  SEL v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v12 = (HMSetupAccessoryPayload *)_HMFPreconditionFailure();
    return (HMSetupAccessoryPayload *)-[HMSetupAccessoryPayload category](v12, v13);
  }
  v7 = v6;
  v14.receiver = self;
  v14.super_class = (Class)HMSetupAccessoryPayload;
  v8 = -[HMSetupAccessoryPayload init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    setupCode = v8->_setupCode;
    v8->_setupCode = (NSString *)v9;

    v8->_communicationProtocol = a4;
  }

  return v8;
}

- (HMAccessoryCategory)category
{
  void *v3;
  void *v4;
  void *v5;

  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessoryCategory *)v5;
}

- (BOOL)requiresMatterCustomCommissioningFlow
{
  void *v2;
  char v3;

  -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresCustomFlow");

  return v3;
}

- (HMSetupAccessoryPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HMSetupAccessoryPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMSetupAccessoryPayload *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("communicationProtocol"));
  if (v5)
  {
    v7 = -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](self, "initWithSetupCode:communicationProtocol:", v5, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupPayload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setSetupPayloadURL:](v7, "setSetupPayloadURL:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setSetupID:](v7, "setSetupID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setCategoryNumber:](v7, "setCategoryNumber:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setProductNumber:](v7, "setProductNumber:", v11);

    -[HMSetupAccessoryPayload setSupportsIP:](v7, "setSupportsIP:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsIP")));
    -[HMSetupAccessoryPayload setSupportsWAC:](v7, "setSupportsWAC:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsWAC")));
    -[HMSetupAccessoryPayload setSupportsBTLE:](v7, "setSupportsBTLE:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBTLE")));
    -[HMSetupAccessoryPayload setPaired:](v7, "setPaired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPaired")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setThreadIdentifier:](v7, "setThreadIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chipAccessorySetupPayload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryPayload setChipAccessorySetupPayload:](v7, "setChipAccessorySetupPayload:", v13);

    v14 = v7;
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC](v6);
    v7 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from setupCode: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMSetupAccessoryPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setupCode"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol"), CFSTR("communicationProtocol"));
  -[HMSetupAccessoryPayload setupPayloadURL](self, "setupPayloadURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("setupPayload"));

  -[HMSetupAccessoryPayload setupID](self, "setupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("setupID"));

  -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("categoryNumber"));

  -[HMSetupAccessoryPayload productNumber](self, "productNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("productNumber"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsIP](self, "supportsIP"), CFSTR("supportsIP"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC"), CFSTR("supportsWAC"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE"), CFSTR("supportsBTLE"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMSetupAccessoryPayload isPaired](self, "isPaired"), CFSTR("isPaired"));
  -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("threadIdentifier"));

  -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("chipAccessorySetupPayload"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableSetupAccessoryPayload *v4;
  void *v5;
  HMMutableSetupAccessoryPayload *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = +[HMMutableSetupAccessoryPayload allocWithZone:](HMMutableSetupAccessoryPayload, "allocWithZone:", a3);
  -[HMSetupAccessoryPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](v4, "initWithSetupCode:communicationProtocol:", v5, -[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol"));

  -[HMSetupAccessoryPayload setupPayloadURL](self, "setupPayloadURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setSetupPayloadURL:](v6, "setSetupPayloadURL:", v7);

  -[HMSetupAccessoryPayload setupID](self, "setupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setSetupID:](v6, "setSetupID:", v8);

  -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setCategoryNumber:](v6, "setCategoryNumber:", v9);

  -[HMSetupAccessoryPayload productNumber](self, "productNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setProductNumber:](v6, "setProductNumber:", v10);

  -[HMSetupAccessoryPayload setSupportsIP:](v6, "setSupportsIP:", -[HMSetupAccessoryPayload supportsIP](self, "supportsIP"));
  -[HMSetupAccessoryPayload setSupportsWAC:](v6, "setSupportsWAC:", -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC"));
  -[HMSetupAccessoryPayload setSupportsBTLE:](v6, "setSupportsBTLE:", -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE"));
  -[HMSetupAccessoryPayload setPaired:](v6, "setPaired:", -[HMSetupAccessoryPayload isPaired](self, "isPaired"));
  -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setThreadIdentifier:](v6, "setThreadIdentifier:", v11);

  -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setChipAccessorySetupPayload:](v6, "setChipAccessorySetupPayload:", v12);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMSetupAccessoryPayload *v4;
  HMSetupAccessoryPayload *v5;
  HMSetupAccessoryPayload *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;

  v4 = (HMSetupAccessoryPayload *)a3;
  if (self == v4)
  {
    v31 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMSetupAccessoryPayload setupCode](self, "setupCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload setupCode](v6, "setupCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqualToString:", v8))
        goto LABEL_18;
      v9 = -[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol");
      if (v9 != -[HMSetupAccessoryPayload communicationProtocol](v6, "communicationProtocol"))
        goto LABEL_18;
      -[HMSetupAccessoryPayload setupPayloadURL](self, "setupPayloadURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload setupPayloadURL](v6, "setupPayloadURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

      if (!v12)
        goto LABEL_18;
      -[HMSetupAccessoryPayload setupID](self, "setupID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload setupID](v6, "setupID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

      if (!v15)
        goto LABEL_18;
      -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload categoryNumber](v6, "categoryNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if (!v18)
        goto LABEL_18;
      -[HMSetupAccessoryPayload productNumber](self, "productNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload productNumber](v6, "productNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = HMFEqualObjects();

      if (!v21)
        goto LABEL_18;
      v22 = -[HMSetupAccessoryPayload supportsIP](self, "supportsIP");
      if (v22 != -[HMSetupAccessoryPayload supportsIP](v6, "supportsIP"))
        goto LABEL_18;
      v23 = -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC");
      if (v23 != -[HMSetupAccessoryPayload supportsWAC](v6, "supportsWAC"))
        goto LABEL_18;
      v24 = -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE");
      if (v24 != -[HMSetupAccessoryPayload supportsBTLE](v6, "supportsBTLE"))
        goto LABEL_18;
      v25 = -[HMSetupAccessoryPayload isPaired](self, "isPaired");
      if (v25 != -[HMSetupAccessoryPayload isPaired](v6, "isPaired"))
        goto LABEL_18;
      -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryPayload threadIdentifier](v6, "threadIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = HMFEqualObjects();

      if (v28)
      {
        -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMSetupAccessoryPayload chipAccessorySetupPayload](v6, "chipAccessorySetupPayload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = HMFEqualObjects();

      }
      else
      {
LABEL_18:
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

  }
  return v31;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMSetupAccessoryPayload setupCode](self, "setupCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMSetupAccessoryPayload setupID](self, "setupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  HMStringFromAccessoryCommunicationProtocol(-[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Communication Protocol"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMSetupAccessoryPayload setupCode](self, "setupCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Setup Code"), CFSTR("<not nil>"));
    objc_msgSend(v3, "addObject:", v8);

  }
  -[HMSetupAccessoryPayload setupPayloadURL](self, "setupPayloadURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Setup Payload URL"), CFSTR("<not nil>"));
    objc_msgSend(v3, "addObject:", v10);

  }
  -[HMSetupAccessoryPayload setupID](self, "setupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Setup ID"), CFSTR("<not nil>"));
    objc_msgSend(v3, "addObject:", v12);

  }
  -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Category Number"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  -[HMSetupAccessoryPayload productNumber](self, "productNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload productNumber](self, "productNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Product Number"), v19);
    objc_msgSend(v3, "addObject:", v20);

  }
  if (-[HMSetupAccessoryPayload supportsIP](self, "supportsIP"))
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload supportsIP](self, "supportsIP");
    HMFBooleanToString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Supports IP"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  if (-[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC"))
  {
    v24 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC");
    HMFBooleanToString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Supports WAC"), v25);
    objc_msgSend(v3, "addObject:", v26);

  }
  if (-[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE"))
  {
    v27 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE");
    HMFBooleanToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithName:value:", CFSTR("Supports BTLE"), v28);
    objc_msgSend(v3, "addObject:", v29);

  }
  if (-[HMSetupAccessoryPayload isPaired](self, "isPaired"))
  {
    v30 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload isPaired](self, "isPaired");
    HMFBooleanToString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("Is Paired"), v31);
    objc_msgSend(v3, "addObject:", v32);

  }
  -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithName:value:", CFSTR("Thread Identifier"), v35);
    objc_msgSend(v3, "addObject:", v36);

  }
  -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithName:value:", CFSTR("CHIP Setup Payload"), v39);
    objc_msgSend(v3, "addObject:", v40);

  }
  v41 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v41;
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (NSURL)setupPayloadURL
{
  return self->_setupPayloadURL;
}

- (void)setSetupPayloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)setupID
{
  return self->_setupID;
}

- (void)setSetupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)categoryNumber
{
  return self->_categoryNumber;
}

- (void)setCategoryNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (void)setProductNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)supportsIP
{
  return self->_supportsIP;
}

- (void)setSupportsIP:(BOOL)a3
{
  self->_supportsIP = a3;
}

- (BOOL)supportsWAC
{
  return self->_supportsWAC;
}

- (void)setSupportsWAC:(BOOL)a3
{
  self->_supportsWAC = a3;
}

- (BOOL)supportsBTLE
{
  return self->_supportsBTLE;
}

- (void)setSupportsBTLE:(BOOL)a3
{
  self->_supportsBTLE = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (NSNumber)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HMCHIPAccessorySetupPayload)chipAccessorySetupPayload
{
  return self->_chipAccessorySetupPayload;
}

- (void)setChipAccessorySetupPayload:(id)a3
{
  objc_storeStrong((id *)&self->_chipAccessorySetupPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessorySetupPayload, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_categoryNumber, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_setupPayloadURL, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
