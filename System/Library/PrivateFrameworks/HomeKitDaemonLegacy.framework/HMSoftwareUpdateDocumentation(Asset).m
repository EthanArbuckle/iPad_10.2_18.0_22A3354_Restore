@implementation HMSoftwareUpdateDocumentation(Asset)

- (id)initWithAsset:()Asset
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  char v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v74 = 0;
    objc_msgSend(v4, "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v8, &v74);

    if ((v9 & 1) != 0)
    {
      if (v74 || !objc_msgSend(v4, "extractionEnteredPassThrough"))
      {
        v19 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundleURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v13;
          v77 = 2112;
          v78 = v14;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Unarchiving the non-streamable asset: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(v4, "fileManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        v18 = objc_msgSend(v15, "unzipItemAtURL:toURL:error:", v16, v17, &v73);
        v19 = v73;

        if ((v18 & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          a1 = v11;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "bundleURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v76 = v22;
            v77 = 2112;
            v78 = v23;
            v79 = 2112;
            v80 = v19;
            _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive contents of asset: %@ with error: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v20);

          goto LABEL_17;
        }
      }
      objc_msgSend(v4, "fileManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v19;
      objc_msgSend(v30, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v31, MEMORY[0x1E0C9AA60], 4, &v72);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v72;

      if (!objc_msgSend(v32, "count"))
      {
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        a1 = a1;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v45;
          v77 = 2112;
          v78 = v33;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@No release notes found. Error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        v29 = 0;
        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.lastPathComponent MATCHES %@"), CFSTR("(^[a-z]{2}(-|_)[A-Za-z0-9]+).txt"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "filteredArrayUsingPredicate:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v35, "count"))
      {
        v46 = (void *)MEMORY[0x1D17BA0A0]();
        a1 = a1;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v76 = v48;
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@No valid release notes found.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v46);
        v29 = 0;
        goto LABEL_45;
      }
      v64 = v34;
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "languageCode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localeIdentifier");
      v39 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "languageIdentifier");
      v41 = objc_claimAutoreleasedReturnValue();

      v62 = (void *)v39;
      if (v39 | v41)
      {
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke;
        v69[3] = &unk_1E89B44A0;
        v70 = (id)v41;
        v71 = (id)v39;
        objc_msgSend(v35, "na_firstObjectPassingTest:", v69);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v42 = 0;
      }
      if (!v42 && v37)
      {
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __54__HMSoftwareUpdateDocumentation_Asset__initWithAsset___block_invoke_2;
        v67[3] = &unk_1E89B44C8;
        v68 = v37;
        objc_msgSend(v35, "na_firstObjectPassingTest:", v67);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v63 = v37;
      if (v42
        || (objc_msgSend(v35, "na_firstObjectPassingTest:", &__block_literal_global_116792),
            (v42 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v4, "testDocumentData");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = objc_alloc(MEMORY[0x1E0CBA770]);
        if (v49)
        {
          objc_msgSend(v4, "testDocumentData");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v33;
          v52 = &v66;
          v53 = objc_msgSend(v50, "initWithData:error:", v51, &v66);
        }
        else
        {
          objc_msgSend(v4, "fileManager");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v33;
          v52 = &v65;
          v53 = objc_msgSend(v50, "initWithURL:fileManager:error:", v42, v51, &v65);
        }
        v54 = (void *)v53;
        v55 = *v52;

        if (v54)
        {
          a1 = (id)objc_msgSend(a1, "initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:", 0, 0, v54, 0, 0);

          v33 = v55;
          v29 = a1;
LABEL_44:

          v34 = v64;
LABEL_45:

LABEL_46:
          goto LABEL_47;
        }
        v33 = v55;
      }
      v56 = (void *)MEMORY[0x1D17BA0A0]();
      v57 = v4;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = v56;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v59;
        v77 = 2112;
        v78 = v42;
        v79 = 2112;
        v80 = v33;
        _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_ERROR, "%{public}@Unable to load release note document, %@, with error: %@", buf, 0x20u);

        v56 = v61;
      }

      objc_autoreleasePoolPop(v56);
      v29 = 0;
      goto LABEL_44;
    }
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    a1 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v26;
      v77 = 2112;
      v78 = v28;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@No asset in path: %@", buf, 0x16u);

      goto LABEL_15;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    a1 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@The asset url is required", buf, 0xCu);
LABEL_15:

    }
  }

  objc_autoreleasePoolPop(v24);
LABEL_17:
  v29 = 0;
LABEL_47:

  return v29;
}

@end
