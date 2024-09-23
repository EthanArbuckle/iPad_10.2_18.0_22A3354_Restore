@implementation HAPTLVBase

- (HAPTLVBase)initWithTLVData:(id)a3
{
  id v5;
  HAPTLVBase *v6;
  HAPTLVBase *v7;
  HAPTLVBase *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPTLVBase;
  v6 = -[HAPTLVBase init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_tlvDatablob, a3), !-[HAPTLVBase _parseFromTLVData](v7, "_parseFromTLVData")))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)_parseFromTLVData
{
  return 0;
}

- (BOOL)_parseFields:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v59;
  void *v60;
  HAPTLVBase *v61;
  id v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = self;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPTLVParser parserWithData:](HAPTLVParser, "parserWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (!v8)
  {
    v10 = 1;
    goto LABEL_56;
  }
  v9 = v8;
  v10 = 1;
  v11 = *(_QWORD *)v66;
  v60 = v6;
  v62 = v7;
  v63 = *(_QWORD *)v66;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v66 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "parseResponseForNumber:", objc_msgSend(v14, "tlvid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_36;
        v16 = MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v14, "tlvid");
          -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v70 = v18;
          v71 = 2112;
          v72 = v19;
          v73 = 2048;
          v74 = v20;
          v75 = 2112;
          v76 = v21;
          _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse number for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

          v7 = v62;
          v6 = v60;
        }
        goto LABEL_27;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "parseResponseForUInt8:", objc_msgSend(v14, "tlvid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_36;
        v16 = MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v14, "tlvid");
        -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        v71 = 2112;
        v72 = v23;
        v73 = 2048;
        v74 = v24;
        v6 = v60;
        v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse uint8 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "parseResponseForUInt16:", objc_msgSend(v14, "tlvid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_36;
        v16 = MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v14, "tlvid");
        -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        v71 = 2112;
        v72 = v23;
        v73 = 2048;
        v74 = v28;
        v6 = v60;
        v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse uint16 for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "parseResponseForString:", objc_msgSend(v14, "tlvid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_36;
        v16 = MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v14, "tlvid");
        -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        v71 = 2112;
        v72 = v23;
        v73 = 2048;
        v74 = v29;
        v6 = v60;
        v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse String for tlv: %@ with ID: %tu (%@)";
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "parseResponseForData:", objc_msgSend(v14, "tlvid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_36;
        v16 = MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v14, "tlvid");
        -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v22;
        v71 = 2112;
        v72 = v23;
        v73 = 2048;
        v74 = v30;
        v6 = v60;
        v75 = 2112;
        v76 = v25;
        v26 = v17;
        v27 = "%{public}@Failed to parse Data for tlv: %@ with ID: %tu (%@)";
LABEL_26:
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x2Au);

        v7 = v62;
LABEL_27:

        v31 = (void *)v16;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v13;
        objc_msgSend(v6, "parseResponseForArray:", objc_msgSend(v32, "tlvid"));
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = (void *)v33;
          objc_msgSend(v32, "objectCreator");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            objc_msgSend(v32, "setField:", v34);

            v7 = v62;
            v11 = v63;
            goto LABEL_38;
          }
          v64 = v34;
          objc_msgSend(v32, "objectCreator");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPTLVBase _parseArray:result:objectCreator:](v61, "_parseArray:result:objectCreator:", v34, &v64, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v64;

          if (v37)
          {
            objc_msgSend(v32, "setField:", v37);
          }
          else
          {
            v51 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v59 = v51;
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "name");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v32, "tlvid");
              -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v70 = v53;
              v71 = 2112;
              v72 = v54;
              v73 = 2048;
              v74 = v55;
              v6 = v60;
              v75 = 2112;
              v76 = v56;
              _os_log_impl(&dword_1CCE01000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

              v51 = v59;
            }

            objc_autoreleasePoolPop(v51);
            v10 = 0;
          }
          v7 = v62;

        }
        else
        {
          v39 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "name");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v32, "tlvid");
            -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v70 = v41;
            v71 = 2112;
            v72 = v42;
            v73 = 2048;
            v74 = v43;
            v6 = v60;
            v75 = 2112;
            v76 = v44;
            _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

            v7 = v62;
          }

          objc_autoreleasePoolPop(v39);
          v10 = 0;
        }
        v11 = v63;
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_39;
      v14 = v13;
      objc_msgSend(v6, "parseResponseForUUID:", objc_msgSend(v14, "tlvid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
LABEL_36:
        objc_msgSend(v14, "setField:", v15);
        goto LABEL_37;
      }
      v45 = MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v14, "tlvid");
        -[HAPTLVBase tlvDatablob](v61, "tlvDatablob");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v47;
        v71 = 2112;
        v72 = v48;
        v73 = 2048;
        v74 = v49;
        v6 = v60;
        v75 = 2112;
        v76 = v50;
        _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse UUID for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

        v7 = v62;
      }

      v31 = (void *)v45;
LABEL_28:
      objc_autoreleasePoolPop(v31);
      v10 = 0;
      v11 = v63;
LABEL_37:

LABEL_38:
LABEL_39:
      ++v12;
    }
    while (v9 != v12);
    v57 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    v9 = v57;
  }
  while (v57);
LABEL_56:

  return v10 & 1;
}

- (BOOL)_parseMandatory:(id)a3 optional:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[HAPTLVBase _parseFields:](self, "_parseFields:", a3);
  -[HAPTLVBase _parseFields:](self, "_parseFields:", v6);

  return (char)a3;
}

- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v9);
      v7[2](v7, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        break;
      v15 = (void *)v14;
      objc_msgSend(v8, "addObject:", v14, (_QWORD)v18);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  return v16;
}

- (NSData)tlvDatablob
{
  return self->_tlvDatablob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvDatablob, 0);
}

@end
