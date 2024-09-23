@implementation HMSoftwareUpdateDocumentation(NSBundle)

- (id)initWithBundle:()NSBundle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  id v53;
  id v54;
  NSObject *v55;
  void *v56;
  HMDAssertionLogEvent *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  const char *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  HMDAssertionLogEvent *v67;
  void *v68;
  id v69;
  void *v70;
  void *contexta;
  void *context;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  id v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    __resourceBundleForBundle(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v31 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v94 = v33;
        v95 = 2112;
        v96 = v5;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid bundle: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v27 = 0;
      goto LABEL_40;
    }
    v8 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v6, "localizations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizationsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
    {

      v10 = &unk_24E971120;
    }
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v94 = v14;
      v95 = 2112;
      v96 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Parsing using preferred localizations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    __htmlDocumentForResource(v7, v10, CFSTR("ReadMeSummary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __htmlDocumentForResource(v7, v10, CFSTR("ReadMe"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __htmlDocumentForResource(v7, v10, CFSTR("License"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v19 = v10;
    v20 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
    if (v20)
    {
      v73 = v17;
      v76 = v16;
      v78 = v15;
      v80 = v12;
      v21 = *(_QWORD *)v84;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v84 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(v18, "URLForResource:withExtension:subdirectory:localization:", CFSTR("ReadMe"), CFSTR("txt"), 0, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i));
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v28 = (void *)v23;
            v82 = 0;
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD78C8]), "initWithURL:error:", v23, &v82);
            v29 = v82;
            if (v20)
            {
              v30 = v20;
              v15 = v78;
              v12 = v80;
            }
            else
            {
              v34 = (void *)MEMORY[0x227676638]();
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              v15 = v78;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                contexta = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "path");
                v70 = v34;
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v87 = 138543874;
                v88 = contexta;
                v89 = 2112;
                v90 = v36;
                v91 = 2112;
                v92 = v29;
                _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", v87, 0x20u);

                v34 = v70;
              }

              objc_autoreleasePoolPop(v34);
              v12 = v80;
            }

            goto LABEL_28;
          }
        }
        v20 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
        if (v20)
          continue;
        break;
      }
      v15 = v78;
      v12 = v80;
LABEL_28:
      v17 = v73;
      v16 = v76;
    }

    v81 = v20;
    if (v16 && v20)
    {
      v37 = v16;
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v12;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v74 = v7;
        v41 = v5;
        v42 = v17;
        v43 = v15;
        v44 = v12;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v45;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Both html and text release notes provided, using text notes", buf, 0xCu);

        v12 = v44;
        v15 = v43;
        v17 = v42;
        v5 = v41;
        v7 = v74;
      }

      objc_autoreleasePoolPop(v38);
      v16 = 0;
      v15 = 0;
      v20 = v81;
    }
    if (!v17)
    {
      v50 = 0;
      goto LABEL_39;
    }
    v46 = v17;
    objc_msgSend(v5, "infoDictionary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hmf_dictionaryForKey:", CFSTR("MobileAssetProperties"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      objc_msgSend(v48, "hmf_numberForKey:", CFSTR("SUSLAVersionRequired"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
LABEL_37:

        v17 = v46;
        v20 = v81;
LABEL_39:
        a1 = (id)objc_msgSend(v12, "initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:", v15, v16, v20, v17, v50);

        v27 = a1;
LABEL_40:

        goto LABEL_41;
      }
      v75 = v7;
      v77 = v16;
      v79 = v15;
      v63 = (void *)MEMORY[0x227676638]();
      v53 = v12;
      v64 = v12;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v66;
        _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing SLA version", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v63);
      v67 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Missing SLA version"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "submitLogEvent:", v67);

      context = (void *)MEMORY[0x227676638]();
      v69 = v64;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
LABEL_51:
        v12 = v53;
        v7 = v75;
        v16 = v77;

        objc_autoreleasePoolPop(context);
        v50 = 0;
        v15 = v79;
        goto LABEL_37;
      }
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v94 = v61;
      v95 = 2112;
      v96 = v49;
      v62 = "%{public}@Missing SLA version from asset properties: %@";
    }
    else
    {
      v75 = v7;
      v77 = v16;
      v79 = v15;
      v52 = (void *)MEMORY[0x227676638]();
      v53 = v12;
      v54 = v12;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v94 = v56;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Missing asset properties", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v52);
      v57 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Missing asset properties"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "submitLogEvent:", v57);

      context = (void *)MEMORY[0x227676638]();
      v59 = v54;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v94 = v61;
      v95 = 2112;
      v96 = v47;
      v62 = "%{public}@Missing asset properites from asset info: %@";
    }
    _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, v62, buf, 0x16u);

    goto LABEL_51;
  }
  v24 = (void *)MEMORY[0x227676638]();
  a1 = a1;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v94 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@The bundle parameter is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  v27 = 0;
LABEL_41:

  return v27;
}

+ (id)localizationsForBundle:()NSBundle
{
  void *v3;
  void *v4;
  void *v5;

  __resourceBundleForBundle(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

@end
