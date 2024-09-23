@implementation DAStatusReport

- (DAStatusReport)init
{
  DAStatusReport *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DAStatusReport;
  v2 = -[DAStatusReport init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setCreationDate:](v2, "setCreationDate:", v3);

  }
  return v2;
}

- (DAStatusReport)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  DAStatusReport *v5;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DAStatusReport;
  v5 = -[DAStatusReport init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportPersistentUUID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setPersistentUUID:](v5, "setPersistentUUID:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportDisplayName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setDisplayName:](v5, "setDisplayName:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportAccountType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setAccountType:](v5, "setAccountType:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportTimeSpan);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setTimeSpan:](v5, "setTimeSpan:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportTimeInNetworking);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setTimeInNetworking:](v5, "setTimeInNetworking:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportAverageHBI);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setAverageHBI:](v5, "setAverageHBI:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportSuccessfulRequests);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setSuccessfulRequests:](v5, "setSuccessfulRequests:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportFailedNetworkRequests);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setFailedNetworkRequests:](v5, "setFailedNetworkRequests:", v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportFailedProtocolRequests);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setFailedProtocolRequests:](v5, "setFailedProtocolRequests:", v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportDownloadedElements);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setDownloadedElements:](v5, "setDownloadedElements:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportUploadedElements);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setUploadedElements:](v5, "setUploadedElements:", v16);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportFalseMoreAvailableCount);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setFalseMoreAvailableCount:](v5, "setFalseMoreAvailableCount:", v17);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportProtocolVersion);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setProtocolVersion:](v5, "setProtocolVersion:", v18);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportSyncingAllowed);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "BOOLValue");
    else
      v21 = 1;
    -[DAStatusReport setSyncingAllowed:](v5, "setSyncingAllowed:", v21);
    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportLastSuccessDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setLastSuccessDate:](v5, "setLastSuccessDate:", v22);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportLastFailureDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setLastFailureDate:](v5, "setLastFailureDate:", v23);

    objc_msgSend(v4, "objectForKeyedSubscript:", kDAStatusReportIsDelegate);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setIsDelegate:](v5, "setIsDelegate:", v24);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport persistentUUID](self, "persistentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DAStatusReport persistentUUID](self, "persistentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kDAStatusReportPersistentUUID);

  }
  -[DAStatusReport displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DAStatusReport displayName](self, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kDAStatusReportDisplayName);

  }
  -[DAStatusReport accountType](self, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DAStatusReport accountType](self, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kDAStatusReportAccountType);

  }
  -[DAStatusReport timeSpan](self, "timeSpan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DAStatusReport timeSpan](self, "timeSpan");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kDAStatusReportTimeSpan);

  }
  -[DAStatusReport timeInNetworking](self, "timeInNetworking");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DAStatusReport timeInNetworking](self, "timeInNetworking");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kDAStatusReportTimeInNetworking);

  }
  -[DAStatusReport averageHBI](self, "averageHBI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DAStatusReport averageHBI](self, "averageHBI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, kDAStatusReportAverageHBI);

  }
  -[DAStatusReport successfulRequests](self, "successfulRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DAStatusReport successfulRequests](self, "successfulRequests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, kDAStatusReportSuccessfulRequests);

  }
  -[DAStatusReport failedNetworkRequests](self, "failedNetworkRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[DAStatusReport failedNetworkRequests](self, "failedNetworkRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, kDAStatusReportFailedNetworkRequests);

  }
  -[DAStatusReport failedProtocolRequests](self, "failedProtocolRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[DAStatusReport failedProtocolRequests](self, "failedProtocolRequests");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, kDAStatusReportFailedProtocolRequests);

  }
  -[DAStatusReport downloadedElements](self, "downloadedElements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[DAStatusReport downloadedElements](self, "downloadedElements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, kDAStatusReportDownloadedElements);

  }
  -[DAStatusReport uploadedElements](self, "uploadedElements");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[DAStatusReport uploadedElements](self, "uploadedElements");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, kDAStatusReportUploadedElements);

  }
  -[DAStatusReport protocolVersion](self, "protocolVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[DAStatusReport protocolVersion](self, "protocolVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, kDAStatusReportProtocolVersion);

  }
  -[DAStatusReport falseMoreAvailableCount](self, "falseMoreAvailableCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[DAStatusReport falseMoreAvailableCount](self, "falseMoreAvailableCount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, kDAStatusReportFalseMoreAvailableCount);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DAStatusReport syncingAllowed](self, "syncingAllowed"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, kDAStatusReportSyncingAllowed);

  -[DAStatusReport lastSuccessDate](self, "lastSuccessDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[DAStatusReport lastSuccessDate](self, "lastSuccessDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, kDAStatusReportLastSuccessDate);

  }
  -[DAStatusReport lastFailureDate](self, "lastFailureDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[DAStatusReport lastFailureDate](self, "lastFailureDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, kDAStatusReportLastFailureDate);

  }
  -[DAStatusReport isDelegate](self, "isDelegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[DAStatusReport isDelegate](self, "isDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, kDAStatusReportIsDelegate);

  }
  return v3;
}

- (void)mergeStatusReport:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  NSObject *v86;
  DAStatusReport *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  DAStatusReport *v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "persistentUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "persistentUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport persistentUUID](self, "persistentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v106 = 138412546;
        v107 = self;
        v108 = 2112;
        v109 = v4;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Why are we combining status reports for different accounts? %@ vs. %@", (uint8_t *)&v106, 0x16u);
      }

    }
  }
  objc_msgSend(v4, "displayName");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[DAStatusReport displayName](self, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v4, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setDisplayName:](self, "setDisplayName:", v14);

    }
  }
  objc_msgSend(v4, "accountType");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v4, "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport accountType](self, "accountType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      DALoggingwithCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v106 = 138412546;
        v107 = self;
        v108 = 2112;
        v109 = v4;
        _os_log_impl(&dword_1C1D11000, v20, OS_LOG_TYPE_ERROR, "Why are we combining status reports for different accounts? %@ vs. %@", (uint8_t *)&v106, 0x16u);
      }

    }
  }
  objc_msgSend(v4, "timeSpan");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "intValue");
  -[DAStatusReport timeSpan](self, "timeSpan");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");

  if (v22 > v24)
  {
    objc_msgSend(v4, "timeSpan");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setTimeSpan:](self, "setTimeSpan:", v25);

  }
  -[DAStatusReport timeInNetworking](self, "timeInNetworking");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {

LABEL_19:
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[DAStatusReport timeInNetworking](self, "timeInNetworking");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;
    objc_msgSend(v4, "timeInNetworking");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    objc_msgSend(v28, "numberWithDouble:", v31 + v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setTimeInNetworking:](self, "setTimeInNetworking:", v34);

    goto LABEL_20;
  }
  objc_msgSend(v4, "timeInNetworking");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    goto LABEL_19;
LABEL_20:
  objc_msgSend(v4, "averageHBI");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[DAStatusReport averageHBI](self, "averageHBI");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      objc_msgSend(v4, "averageHBI");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setAverageHBI:](self, "setAverageHBI:", v38);

    }
  }
  -[DAStatusReport successfulRequests](self, "successfulRequests");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {

  }
  else
  {
    objc_msgSend(v4, "successfulRequests");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
      goto LABEL_27;
  }
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport successfulRequests](self, "successfulRequests");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "intValue");
  objc_msgSend(v4, "successfulRequests");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithInt:", objc_msgSend(v44, "intValue") + v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setSuccessfulRequests:](self, "setSuccessfulRequests:", v45);

LABEL_27:
  -[DAStatusReport failedNetworkRequests](self, "failedNetworkRequests");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {

  }
  else
  {
    objc_msgSend(v4, "failedNetworkRequests");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
      goto LABEL_31;
  }
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport failedNetworkRequests](self, "failedNetworkRequests");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "intValue");
  objc_msgSend(v4, "failedNetworkRequests");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberWithInt:", objc_msgSend(v51, "intValue") + v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setFailedNetworkRequests:](self, "setFailedNetworkRequests:", v52);

LABEL_31:
  -[DAStatusReport failedProtocolRequests](self, "failedProtocolRequests");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {

  }
  else
  {
    objc_msgSend(v4, "failedProtocolRequests");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
      goto LABEL_35;
  }
  v55 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport failedProtocolRequests](self, "failedProtocolRequests");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "intValue");
  objc_msgSend(v4, "failedProtocolRequests");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithInt:", objc_msgSend(v58, "intValue") + v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setFailedProtocolRequests:](self, "setFailedProtocolRequests:", v59);

LABEL_35:
  -[DAStatusReport downloadedElements](self, "downloadedElements");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {

  }
  else
  {
    objc_msgSend(v4, "downloadedElements");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      goto LABEL_39;
  }
  v62 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport downloadedElements](self, "downloadedElements");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "intValue");
  objc_msgSend(v4, "downloadedElements");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "numberWithInt:", objc_msgSend(v65, "intValue") + v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setDownloadedElements:](self, "setDownloadedElements:", v66);

LABEL_39:
  -[DAStatusReport uploadedElements](self, "uploadedElements");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {

  }
  else
  {
    objc_msgSend(v4, "uploadedElements");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
      goto LABEL_43;
  }
  v69 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport uploadedElements](self, "uploadedElements");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "intValue");
  objc_msgSend(v4, "uploadedElements");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "numberWithInt:", objc_msgSend(v72, "intValue") + v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setUploadedElements:](self, "setUploadedElements:", v73);

LABEL_43:
  -[DAStatusReport falseMoreAvailableCount](self, "falseMoreAvailableCount");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {

LABEL_46:
    v76 = (void *)MEMORY[0x1E0CB37E8];
    -[DAStatusReport falseMoreAvailableCount](self, "falseMoreAvailableCount");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "intValue");
    objc_msgSend(v4, "falseMoreAvailableCount");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "numberWithInt:", objc_msgSend(v79, "intValue") + v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setFalseMoreAvailableCount:](self, "setFalseMoreAvailableCount:", v80);

    goto LABEL_47;
  }
  objc_msgSend(v4, "falseMoreAvailableCount");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
    goto LABEL_46;
LABEL_47:
  objc_msgSend(v4, "protocolVersion");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    objc_msgSend(v4, "protocolVersion");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport protocolVersion](self, "protocolVersion");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqualToString:", v84);

    if ((v85 & 1) == 0)
    {
      DALoggingwithCategory(0);
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "protocolVersion");
        v87 = (DAStatusReport *)objc_claimAutoreleasedReturnValue();
        v106 = 138412290;
        v107 = v87;
        _os_log_impl(&dword_1C1D11000, v86, OS_LOG_TYPE_INFO, "Protocol version is updated to %@", (uint8_t *)&v106, 0xCu);

      }
      objc_msgSend(v4, "protocolVersion");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setProtocolVersion:](self, "setProtocolVersion:", v88);

    }
  }
  if (-[DAStatusReport syncingAllowed](self, "syncingAllowed"))
    v89 = objc_msgSend(v4, "syncingAllowed");
  else
    v89 = 0;
  -[DAStatusReport setSyncingAllowed:](self, "setSyncingAllowed:", v89);
  objc_msgSend(v4, "lastSuccessDate");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    objc_msgSend(v4, "lastSuccessDate");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport lastSuccessDate](self, "lastSuccessDate");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqualToDate:", v93);

    if ((v94 & 1) == 0)
    {
      objc_msgSend(v4, "lastSuccessDate");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setLastSuccessDate:](self, "setLastSuccessDate:", v95);

    }
  }
  objc_msgSend(v4, "lastFailureDate");
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = (void *)v96;
    objc_msgSend(v4, "lastFailureDate");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport lastFailureDate](self, "lastFailureDate");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v98, "isEqualToDate:", v99);

    if ((v100 & 1) == 0)
    {
      objc_msgSend(v4, "lastFailureDate");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setLastFailureDate:](self, "setLastFailureDate:", v101);

    }
  }
  objc_msgSend(v4, "isDelegate");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[DAStatusReport isDelegate](self, "isDelegate");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v104)
    {
      objc_msgSend(v4, "isDelegate");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAStatusReport setIsDelegate:](self, "setIsDelegate:", v105);

    }
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)timeSpan
{
  NSNumber *timeSpan;
  void *v4;
  void *v5;
  void *v6;

  timeSpan = self->_timeSpan;
  if (!timeSpan)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_creationDate);
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setTimeSpan:](self, "setTimeSpan:", v6);

    timeSpan = self->_timeSpan;
  }
  return timeSpan;
}

- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3 numUploadedElements:(int)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setLastSuccessDate:](self, "setLastSuccessDate:", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport successfulRequests](self, "successfulRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setSuccessfulRequests:](self, "setSuccessfulRequests:", v10);

  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[DAStatusReport downloadedElements](self, "downloadedElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue") + a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setDownloadedElements:](self, "setDownloadedElements:", v13);

  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[DAStatusReport uploadedElements](self, "uploadedElements");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "intValue") + a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAStatusReport setUploadedElements:](self, "setUploadedElements:", v15);

  }
}

- (void)noteSuccessfulRequestWithNumDownloadedElements:(int)a3
{
  -[DAStatusReport noteSuccessfulRequestWithNumDownloadedElements:numUploadedElements:](self, "noteSuccessfulRequestWithNumDownloadedElements:numUploadedElements:", *(_QWORD *)&a3, 0);
}

- (void)noteFailedNetworkRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setLastFailureDate:](self, "setLastFailureDate:", v3);

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport failedNetworkRequests](self, "failedNetworkRequests");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setFailedNetworkRequests:](self, "setFailedNetworkRequests:", v5);

}

- (void)noteFailedProtocolRequest
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport failedProtocolRequests](self, "failedProtocolRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setFailedProtocolRequests:](self, "setFailedProtocolRequests:", v4);

}

- (void)noteNewHBIDataPoint:(int)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[DAStatusReport averageHBI](self, "averageHBI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ((double)a3 + v7 * (double)self->_numHBIDataPoints) / (double)(self->_numHBIDataPoints + 1));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setAverageHBI:](self, "setAverageHBI:", v8);

}

- (void)noteTimeSpentInNetworking:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport timeInNetworking](self, "timeInNetworking");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v6 + a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setTimeInNetworking:](self, "setTimeInNetworking:", v7);

}

- (void)noteFalseMoreAvailableResponse
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[DAStatusReport falseMoreAvailableCount](self, "falseMoreAvailableCount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAStatusReport setFalseMoreAvailableCount:](self, "setFalseMoreAvailableCount:", v4);

}

- (NSString)persistentUUID
{
  return self->_persistentUUID;
}

- (void)setPersistentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_persistentUUID, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_accountType, a3);
}

- (void)setTimeSpan:(id)a3
{
  objc_storeStrong((id *)&self->_timeSpan, a3);
}

- (NSNumber)timeInNetworking
{
  return self->_timeInNetworking;
}

- (void)setTimeInNetworking:(id)a3
{
  objc_storeStrong((id *)&self->_timeInNetworking, a3);
}

- (NSNumber)averageHBI
{
  return self->_averageHBI;
}

- (void)setAverageHBI:(id)a3
{
  objc_storeStrong((id *)&self->_averageHBI, a3);
}

- (NSNumber)successfulRequests
{
  return self->_successfulRequests;
}

- (void)setSuccessfulRequests:(id)a3
{
  objc_storeStrong((id *)&self->_successfulRequests, a3);
}

- (NSNumber)failedNetworkRequests
{
  return self->_failedNetworkRequests;
}

- (void)setFailedNetworkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_failedNetworkRequests, a3);
}

- (NSNumber)failedProtocolRequests
{
  return self->_failedProtocolRequests;
}

- (void)setFailedProtocolRequests:(id)a3
{
  objc_storeStrong((id *)&self->_failedProtocolRequests, a3);
}

- (NSNumber)downloadedElements
{
  return self->_downloadedElements;
}

- (void)setDownloadedElements:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedElements, a3);
}

- (NSNumber)uploadedElements
{
  return self->_uploadedElements;
}

- (void)setUploadedElements:(id)a3
{
  objc_storeStrong((id *)&self->_uploadedElements, a3);
}

- (NSNumber)falseMoreAvailableCount
{
  return self->_falseMoreAvailableCount;
}

- (void)setFalseMoreAvailableCount:(id)a3
{
  objc_storeStrong((id *)&self->_falseMoreAvailableCount, a3);
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_protocolVersion, a3);
}

- (BOOL)syncingAllowed
{
  return self->_syncingAllowed;
}

- (void)setSyncingAllowed:(BOOL)a3
{
  self->_syncingAllowed = a3;
}

- (NSDate)lastSuccessDate
{
  return self->_lastSuccessDate;
}

- (void)setLastSuccessDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessDate, a3);
}

- (NSDate)lastFailureDate
{
  return self->_lastFailureDate;
}

- (void)setLastFailureDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFailureDate, a3);
}

- (NSNumber)isDelegate
{
  return self->_isDelegate;
}

- (void)setIsDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_isDelegate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (int)numHBIDataPoints
{
  return self->_numHBIDataPoints;
}

- (void)setNumHBIDataPoints:(int)a3
{
  self->_numHBIDataPoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_isDelegate, 0);
  objc_storeStrong((id *)&self->_lastFailureDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessDate, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_falseMoreAvailableCount, 0);
  objc_storeStrong((id *)&self->_uploadedElements, 0);
  objc_storeStrong((id *)&self->_downloadedElements, 0);
  objc_storeStrong((id *)&self->_failedProtocolRequests, 0);
  objc_storeStrong((id *)&self->_failedNetworkRequests, 0);
  objc_storeStrong((id *)&self->_successfulRequests, 0);
  objc_storeStrong((id *)&self->_averageHBI, 0);
  objc_storeStrong((id *)&self->_timeInNetworking, 0);
  objc_storeStrong((id *)&self->_timeSpan, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_persistentUUID, 0);
}

@end
