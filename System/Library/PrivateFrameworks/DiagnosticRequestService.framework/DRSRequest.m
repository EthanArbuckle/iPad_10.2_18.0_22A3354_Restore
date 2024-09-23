@implementation DRSRequest

- (id)logPath
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[DRSRequest logs](self, "logs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)totalLogSizeBytes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[DRSRequest logs](self, "logs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "size");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)logSizeLimitBytes
{
  void *v2;
  unint64_t v3;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uploadSessionUploadCapBytes");

  return v3;
}

+ (id)requiredSystemResourceName
{
  return 0;
}

- (NSString)decisionServerDecisionString
{
  unsigned int v2;

  v2 = -[DRSRequest decisionServerDecision](self, "decisionServerDecision");
  if (v2 > 2)
    return (NSString *)CFSTR("Unknown");
  else
    return &off_1EA3D0FC0[(char)v2]->isa;
}

- (unsigned)requestOutcome
{
  return DRSRequestOutcomeForState(-[DRSRequest requestState](self, "requestState"));
}

- (BOOL)_markLogsAsPurgeableWithUrgencyWithDeleteFallback:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  int v22;
  int v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  const __CFString *v33;
  int *v34;
  char *v35;
  __int128 v37;
  void *v39;
  unint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  char *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!-[DRSRequest hasUploadableContent](self, "hasUploadableContent"))
    return 1;
  DPLogHandle_LogManagement();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[DRSRequest requestID](self, "requestID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    switch(a3)
    {
      case 0x200uLL:
        v6 = CFSTR("Low");
        break;
      case 0x800uLL:
        v6 = CFSTR("High");
        break;
      case 0x400uLL:
        v6 = CFSTR("Medium");
        break;
      default:
        v6 = CFSTR("Unknown");
        break;
    }
    *(_DWORD *)buf = 138543618;
    v48 = v4;
    v49 = 2114;
    v50 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkingCasePurgeability", "Request %{public}@: Marking files as purgeable with urgency %{public}@", buf, 0x16u);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[DRSRequest logs](self, "logs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v44;
    *(_QWORD *)&v10 = 138543874;
    v37 = v10;
    v39 = v8;
LABEL_14:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v13), "path", v37);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v42);

      if ((v16 & 1) != 0)
      {
        if (v42)
        {
          DPLogHandle_LogManagementError();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v17))
          {
            -[DRSRequest requestID](self, "requestID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v48 = (uint64_t)v18;
            v49 = 2114;
            v50 = v14;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PurgeabilityFailure", "%{public}@: File %{public}@ is a directory", buf, 0x16u);

          }
          DPLogHandle_LogManagementError();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            goto LABEL_36;
          -[DRSRequest requestID](self, "requestID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = (uint64_t)v20;
          v49 = 2114;
          v50 = v14;
          _os_log_fault_impl(&dword_1DBB92000, v19, OS_LOG_TYPE_FAULT, "ERROR: %{public}@: File %{public}@ is a directory", buf, 0x16u);
          goto LABEL_25;
        }
        v21 = objc_retainAutorelease(v14);
        v22 = open((const char *)-[__CFString UTF8String](v21, "UTF8String"), 0);
        if ((v22 & 0x80000000) == 0)
        {
          v23 = v22;
          v41 = a3 | 0x10005;
          v24 = ffsctl(v22, 0xC0084A44uLL, &v41, 0);
          close(v23);
          if (v24)
          {
            DPLogHandle_RequestError();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v31))
            {
              -[DRSRequest requestID](self, "requestID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              switch(a3)
              {
                case 0x200uLL:
                  v33 = CFSTR("Low");
                  break;
                case 0x800uLL:
                  v33 = CFSTR("High");
                  break;
                case 0x400uLL:
                  v33 = CFSTR("Medium");
                  break;
                default:
                  v33 = CFSTR("Unknown");
                  break;
              }
              v34 = __error();
              v35 = strerror(*v34);
              *(_DWORD *)buf = 138544130;
              v48 = (uint64_t)v32;
              v49 = 2114;
              v50 = v21;
              v51 = 2114;
              v52 = v33;
              v53 = 2082;
              v54 = v35;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkingLogFilePurgeabilityFailure", "Request %{public}@: Failed to mark '%{public}@' as purgeable with urgency %{public}@ due to error: %{public}s. Attempting to delete to prevent accumulating files.", buf, 0x2Au);

            }
            -[DRSRequest _deleteLogs](self, "_deleteLogs");

            v7 = 0;
            v8 = v39;
            goto LABEL_56;
          }
          DPLogHandle_Request();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v25))
          {
            -[DRSRequest requestID](self, "requestID");
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v26;
            switch(a3)
            {
              case 0x200uLL:
                v28 = CFSTR("Low");
                break;
              case 0x800uLL:
                v28 = CFSTR("High");
                break;
              case 0x400uLL:
                v28 = CFSTR("Medium");
                break;
              default:
                v28 = CFSTR("Unknown");
                break;
            }
            *(_DWORD *)buf = v37;
            v48 = v26;
            v49 = 2114;
            v50 = v21;
            v51 = 2114;
            v52 = v28;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkedLogFilePurgeability", "Request %{public}@: Marked '%{public}@' as purgeable with urgency %{public}@", buf, 0x20u);

          }
          v8 = v39;
          goto LABEL_37;
        }
        DPLogHandle_RequestError();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v19))
        {
          -[DRSRequest requestID](self, "requestID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = (uint64_t)v29;
          v49 = 2114;
          v50 = v21;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OpenFileFailure", "Request %{public}@: Failed to open file with path %{public}@ to tag it as purgeable", buf, 0x16u);

        }
        v8 = v39;
      }
      else
      {
        DPLogHandle_LogManagementError();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v19))
        {
          -[DRSRequest requestID](self, "requestID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = (uint64_t)v20;
          v49 = 2114;
          v50 = v14;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PurgeabilityFailure", "%{public}@: File %{public}@ does not exist", buf, 0x16u);
LABEL_25:

        }
      }
LABEL_36:

LABEL_37:
      if (v11 == ++v13)
      {
        v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        v11 = v30;
        if (v30)
          goto LABEL_14;
        break;
      }
    }
  }
  v7 = 1;
LABEL_56:

  return v7;
}

- (id)_logsDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[DRSRequest logs](self, "logs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "debugDescription");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if ((v10 & 1) != 0)
            -[__CFString appendString:](v5, "appendString:", v12);
          else
            -[__CFString appendFormat:](v5, "appendFormat:", CFSTR(", %@"), v12);

          v10 = 0;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v10 = 0;
      }
      while (v8);
    }

  }
  else
  {
    v5 = CFSTR("No logs");
  }
  return v5;
}

- (NSString)debugDescription
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v21;
  const __CFString *v22;
  unsigned int v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;

  v32 = (void *)MEMORY[0x1DF0B6DC4](self, a2);
  v3 = -[DRSRequest totalLogSizeBytes](self, "totalLogSizeBytes");
  if (v3)
    v36 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%zuB"), v3);
  else
    v36 = CFSTR("<No cached log size>");
  v28 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSRequest build](self, "build");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest requestID](self, "requestID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest ckRecordID](self, "ckRecordID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[DRSRequest ckRecordID](self, "ckRecordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("CKRecordID: %@"), v21);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = CFSTR("-");
  }
  -[DRSRequest requestStateString](self, "requestStateString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest errorDescription](self, "errorDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  v6 = CFSTR("<No error>");
  if (v5)
    v6 = (const __CFString *)v5;
  v25 = v6;
  -[DRSRequest requestType](self, "requestType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[DRSRequest uploadAttemptCount](self, "uploadAttemptCount");
  v7 = -[DRSRequest hasBeenCountedByTelemetry](self, "hasBeenCountedByTelemetry");
  v8 = &stru_1EA3D37D0;
  if (v7)
    v8 = CFSTR("(Reported to telemetry)");
  v22 = v8;
  -[DRSRequest decisionServerDecisionString](self, "decisionServerDecisionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DRSRequest isExpedited](self, "isExpedited"))
    v10 = CFSTR("ExpeditedUpload");
  else
    v10 = CFSTR("NormalUpload");
  -[DRSRequest teamID](self, "teamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest issueCategory](self, "issueCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest issueDescription](self, "issueDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest _logsDescription](self, "_logsDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest logType](self, "logType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest contextDictionary](self, "contextDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescription");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("-");
  v29 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@ %@ %@ (%@,%@) %@ %u %@ %@ %@ %@/%@ %@ %@(%@, %@) %@"), v35, v34, v33, v26, v25, v24, v23, v22, v9, v10, v11, v12, v13, v14, v15, v36,
                  v19);

  if (v30)
  {

  }
  objc_autoreleasePoolPop(v32);
  return (NSString *)v29;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  _BOOL4 v3;
  DRSRequest *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  DRSRequest *v61;
  id v62;
  void *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[3];
  _QWORD v70[3];
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  uint64_t v74;

  v3 = a3;
  v4 = self;
  v74 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1DF0B6DC4](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[DRSRequest build](v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("build"));

  -[DRSRequest requestDate](v4, "requestDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("date"));

  -[DRSRequest teamID](v4, "teamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("teamID"));

  -[DRSRequest issueCategory](v4, "issueCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("issueCategory"));

  -[DRSRequest issueDescription](v4, "issueDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("issueDescription"));

  -[DRSRequest logType](v4, "logType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("logType"));

  v15 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSRequest isExpedited](v4, "isExpedited"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("isExpedited"));

  -[DRSRequest contextDictionary](v4, "contextDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_4:
    if (!v3)
      goto LABEL_26;
    goto LABEL_9;
  }
  v18 = (void *)MEMORY[0x1E0CB36D8];
  -[DRSRequest contextDictionary](v4, "contextDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "isValidJSONObject:", v19);

  if ((_DWORD)v18)
  {
    -[DRSRequest contextDictionary](v4, "contextDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("contextDictionary"));

    goto LABEL_4;
  }
  DPLogHandle_Request();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    -[DRSRequest debugDescription](v4, "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = v22;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedContextDictionaryJSONSerialization", "Context dictionary for %{public}@ cannot be serialized in JSON", buf, 0xCu);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("<Could not serialize>"), CFSTR("contextDictionary"));
  if (v3)
  {
LABEL_9:
    -[DRSRequest requestID](v4, "requestID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("requestID"));

    -[DRSRequest ckRecordID](v4, "ckRecordID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[DRSRequest ckRecordID](v4, "ckRecordID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("ckRecordID"));

    }
    -[DRSRequest requestStateString](v4, "requestStateString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("requestState"));

    -[DRSRequest errorDescription](v4, "errorDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[DRSRequest errorDescription](v4, "errorDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("errorDescription"));

    }
    -[DRSRequest requestType](v4, "requestType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("requestType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[DRSRequest uploadAttemptCount](v4, "uploadAttemptCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("uploadAttemptCount"));

    -[DRSRequest decisionServerDecisionString](v4, "decisionServerDecisionString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("decisionServerDecision"));

    -[DRSRequest logs](v4, "logs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    -[DRSRequest logs](v4, "logs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34 == 1)
    {
      objc_msgSend(v35, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, CFSTR("logPath"));

      v39 = (void *)MEMORY[0x1E0CB37E8];
      -[DRSRequest logs](v4, "logs");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "numberWithUnsignedLong:", objc_msgSend(v41, "size"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, CFSTR("logSizeBytes"));

      v43 = (void *)MEMORY[0x1E0CB37E8];
      -[DRSRequest logs](v4, "logs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "numberWithBool:", objc_msgSend(v45, "isAvailableOnDisk"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("logAvailableOnDiskPath"));

    }
    else
    {
      v47 = objc_msgSend(v35, "count");

      if (v47)
      {
        v62 = v6;
        v63 = v7;
        v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v61 = v4;
        -[DRSRequest logs](v4, "logs");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v66 != v51)
                objc_enumerationMutation(obj);
              v53 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              v69[0] = CFSTR("logPath");
              objc_msgSend(v53, "path");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v70[0] = v54;
              v69[1] = CFSTR("logAvailableOnDiskPath");
              objc_msgSend(*(id *)(v15 + 2024), "numberWithBool:", objc_msgSend(v53, "isAvailableOnDisk"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v70[1] = v55;
              v69[2] = CFSTR("logSizeBytes");
              v56 = v15;
              objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLong:", objc_msgSend(v53, "size"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v70[2] = v57;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = v56;
              objc_msgSend(v48, "addObject:", v58);

            }
            v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          }
          while (v50);
        }

        v7 = v63;
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v48, CFSTR("logsArray"));

        v4 = v61;
        v6 = v62;
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("<No path>"), CFSTR("logPath"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("logAvailableOnDiskPath"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA3E3980, CFSTR("logSizeBytes"));
      }
    }
    objc_msgSend(*(id *)(v15 + 2024), "numberWithBool:", -[DRSRequest hasBeenCountedByTelemetry](v4, "hasBeenCountedByTelemetry"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, CFSTR("hasBeenCountedByTelemetry"));

  }
LABEL_26:

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSRequestMO");
}

- (void)_addLogMOs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  DRSLogMO *v11;
  void *v12;
  DRSLogMO *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DRSRequest logs](self, "logs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [DRSLogMO alloc];
        objc_msgSend(v4, "managedObjectContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[DRSLogMO initWithContext:](v11, "initWithContext:", v12);

        objc_msgSend(v10, "_configureLogMO:", v13);
        objc_msgSend(v4, "addLogsObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_configureRequestMO:(id)a3
{
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  -[DRSRequest teamID](self, "teamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTeamID:", v4);

  -[DRSRequest issueCategory](self, "issueCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIssueCategory:", v5);

  -[DRSRequest issueDescription](self, "issueDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIssueDescription:", v6);

  -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContextDictionaryData:", v7);

  -[DRSRequest requestDate](self, "requestDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRequestDate:", v8);

  -[DRSRequest requestID](self, "requestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRequestID:", v9);

  objc_msgSend(v18, "setRequestMCT:", -[DRSRequest requestMCT](self, "requestMCT"));
  objc_msgSend(v18, "setRequestState:", -[DRSRequest requestState](self, "requestState"));
  -[DRSRequest errorDescription](self, "errorDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setErrorDescription:", v10);

  -[DRSRequest build](self, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBuild:", v11);

  objc_msgSend(v18, "setUploadAttemptCount:", (__int16)-[DRSRequest uploadAttemptCount](self, "uploadAttemptCount"));
  objc_msgSend(v18, "setDecisionServerDecision:", -[DRSRequest decisionServerDecision](self, "decisionServerDecision"));
  objc_msgSend(v18, "setHasBeenCountedByTelemetry:", -[DRSRequest hasBeenCountedByTelemetry](self, "hasBeenCountedByTelemetry"));
  objc_msgSend(v18, "setIsExpedited:", -[DRSRequest isExpedited](self, "isExpedited"));
  -[DRSRequest ckRecordID](self, "ckRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCkRecordID:", v12);

  objc_msgSend(v18, "logs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  -[DRSRequest logs](self, "logs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v14 != v16)
  {
    objc_msgSend(v18, "logs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeLogs:", v17);

    -[DRSRequest _addLogMOs:](self, "_addLogMOs:", v18);
  }

}

- (NSString)requestStateString
{
  return (NSString *)DRRequestStateWithOutcomeStringForState(-[DRSRequest requestState](self, "requestState"));
}

- (NSString)requestOutcomeString
{
  unsigned int v2;

  v2 = -[DRSRequest requestOutcome](self, "requestOutcome") - 1;
  if (v2 > 2)
    return (NSString *)CFSTR("In-Flight");
  else
    return &off_1EA3D0FD8[(char)v2]->isa;
}

- (id)newRequestMOInContext_ON_MOC_QUEUE:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_moClass")), "initWithContext:", v4);

  -[DRSRequest _configureRequestMO:](self, "_configureRequestMO:", v5);
  return v5;
}

- (void)updateContextWithRequest_ON_MOC_QUEUE:(id)a3
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
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  -[DRSRequest requestID](self, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("requestID == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend((id)objc_opt_class(), "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchLimit:", 1);
  objc_msgSend(v10, "setPredicate:", v7);
  v19 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v10, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (!v11 || !objc_msgSend(v11, "count"))
  {
    if (v12)
    {
      DPLogHandle_CoreDataError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        -[DRSRequest debugDescription](self, "debugDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedDescription");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = CFSTR("Unknown");
        if (v16)
          v18 = (const __CFString *)v16;
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v18;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestMangedObjectFetchFailure", "Failed to fetch a request object for %{public}@ due to error: %{public}@", buf, 0x16u);

        goto LABEL_11;
      }
    }
    else
    {
      DPLogHandle_Request();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        -[DRSRequest requestID](self, "requestID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestMangedObjectFetchMiss", "No cached request with ID %{public}@", buf, 0xCu);
LABEL_11:

      }
    }

    v12 = -[DRSRequest newRequestMOInContext_ON_MOC_QUEUE:](self, "newRequestMOInContext_ON_MOC_QUEUE:", v4);
    goto LABEL_13;
  }
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest _configureRequestMO:](self, "_configureRequestMO:", v13);

LABEL_13:
}

+ (id)requestForMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = xpc_dictionary_get_uint64(v3, "ClientMessageType") - 1;
  if (v4 <= 4 && ((0x1Bu >> v4) & 1) != 0)
    v5 = (void *)objc_msgSend(objc_alloc(*off_1EA3D0FF0[v4]), "initWithXPCDict:", v3);
  else
    v5 = 0;

  return v5;
}

- (void)addAutomatedDeviceGroupContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  objc_class *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automatedDeviceGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DRSRequest contextDictionary](self, "contextDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DRSRequest contextDictionary](self, "contextDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, kDRSRequestADGContextDictKey);
    v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      if (v11)
      {
        DPLogHandle_RequestError();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v12))
        {
          -[NSObject localizedDescription](v11, "localizedDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v13;
          _os_signpost_emit_unreliably_with_name_impl();

        }
        v14 = 0;
      }
      else
      {
        v14 = v10;
      }

    }
    else
    {
      DPLogHandle_RequestError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v20 = 138543362;
        v21 = (id)objc_claimAutoreleasedReturnValue();
        _os_signpost_emit_unreliably_with_name_impl();

      }
      v14 = 0;
    }

    if (v14)
    {
      objc_storeStrong((id *)&self->_contextDictionary, v7);
      objc_storeStrong((id *)&self->_contextDictionaryData, v14);
      DPLogHandle_Request();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        -[DRSRequest requestID](self, "requestID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v4;
        v22 = 2114;
        v23 = v18;
LABEL_22:
        _os_signpost_emit_unreliably_with_name_impl();

      }
    }
    else
    {
      DPLogHandle_RequestError();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        -[DRSRequest requestID](self, "requestID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
  DPLogHandle_Request();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    -[DRSRequest requestID](self, "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v20 = 138543362;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    _os_signpost_emit_unreliably_with_name_impl();

  }
LABEL_24:

}

- (BOOL)isEqual:(id)a3
{
  DRSRequest *v4;
  DRSRequest *v5;
  BOOL v6;

  v4 = (DRSRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[DRSRequest isEqualToRequest:](self, "isEqualToRequest:", v5);

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  DRSRequest *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char IsNil;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  char v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  unint64_t v72;
  int v73;
  int v74;
  _BOOL4 v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  char v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  char v87;
  char v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;

  v4 = (DRSRequest *)a3;
  if (self == v4)
    goto LABEL_40;
  v5 = -[DRSRequest requestMCT](self, "requestMCT");
  if (v5 == -[DRSRequest requestMCT](v4, "requestMCT"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DRSRequest teamID](self, "teamID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSRequest teamID](v4, "teamID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[DRSRequest build](self, "build");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest build](v4, "build");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          -[DRSRequest issueCategory](self, "issueCategory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSRequest issueCategory](v4, "issueCategory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {
            -[DRSRequest issueDescription](self, "issueDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[DRSRequest issueDescription](v4, "issueDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if (v17)
            {
              -[DRSRequest teamID](self, "teamID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[DRSRequest teamID](v4, "teamID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToString:", v19);

              if (v20)
              {
                -[DRSRequest logType](self, "logType");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[DRSRequest logType](v4, "logType");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "isEqualToString:", v22);

                if (v23)
                {
                  -[DRSRequest logPath](self, "logPath");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DRSRequest logPath](v4, "logPath");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  IsNil = _oneIsNil((uint64_t)v24, (uint64_t)v25);

                  if ((IsNil & 1) == 0)
                  {
                    -[DRSRequest logPath](self, "logPath");
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (!v27)
                      goto LABEL_13;
                    v28 = (void *)v27;
                    -[DRSRequest logPath](self, "logPath");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DRSRequest logPath](v4, "logPath");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v29, "isEqualToString:", v30);

                    if (v31)
                    {
LABEL_13:
                      -[DRSRequest contextDictionary](self, "contextDictionary");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DRSRequest contextDictionary](v4, "contextDictionary");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = _oneIsNil((uint64_t)v32, (uint64_t)v33);

                      if ((v34 & 1) == 0)
                      {
                        -[DRSRequest contextDictionary](self, "contextDictionary");
                        v35 = objc_claimAutoreleasedReturnValue();
                        if (!v35)
                          goto LABEL_44;
                        v36 = (void *)v35;
                        -[DRSRequest contextDictionary](self, "contextDictionary");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        -[DRSRequest contextDictionary](v4, "contextDictionary");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v39 = objc_msgSend(v37, "isEqualToDictionary:", v38);

                        if (v39)
                        {
LABEL_44:
                          -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DRSRequest contextDictionaryData](v4, "contextDictionaryData");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          v42 = _oneIsNil((uint64_t)v40, (uint64_t)v41);

                          if ((v42 & 1) == 0)
                          {
                            -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
                            v43 = objc_claimAutoreleasedReturnValue();
                            if (!v43)
                              goto LABEL_45;
                            v44 = (void *)v43;
                            -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DRSRequest contextDictionaryData](v4, "contextDictionaryData");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            v47 = objc_msgSend(v45, "isEqualToData:", v46);

                            if (v47)
                            {
LABEL_45:
                              -[DRSRequest requestDate](self, "requestDate");
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              -[DRSRequest requestDate](v4, "requestDate");
                              v49 = (void *)objc_claimAutoreleasedReturnValue();
                              v50 = _oneIsNil((uint64_t)v48, (uint64_t)v49);

                              if ((v50 & 1) == 0)
                              {
                                -[DRSRequest requestDate](self, "requestDate");
                                v51 = objc_claimAutoreleasedReturnValue();
                                if (!v51)
                                  goto LABEL_46;
                                v52 = (void *)v51;
                                -[DRSRequest requestDate](self, "requestDate");
                                v53 = (void *)objc_claimAutoreleasedReturnValue();
                                -[DRSRequest requestDate](v4, "requestDate");
                                v54 = (void *)objc_claimAutoreleasedReturnValue();
                                v55 = objc_msgSend(v53, "isEqualToDate:", v54);

                                if (v55)
                                {
LABEL_46:
                                  -[DRSRequest requestID](self, "requestID");
                                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[DRSRequest requestID](v4, "requestID");
                                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                                  v58 = _oneIsNil((uint64_t)v56, (uint64_t)v57);

                                  if ((v58 & 1) == 0)
                                  {
                                    -[DRSRequest requestID](self, "requestID");
                                    v59 = objc_claimAutoreleasedReturnValue();
                                    if (!v59)
                                      goto LABEL_47;
                                    v60 = (void *)v59;
                                    -[DRSRequest requestID](self, "requestID");
                                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[DRSRequest requestID](v4, "requestID");
                                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                                    v63 = objc_msgSend(v61, "isEqual:", v62);

                                    if (v63)
                                    {
LABEL_47:
                                      -[DRSRequest ckRecordID](self, "ckRecordID");
                                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[DRSRequest ckRecordID](v4, "ckRecordID");
                                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                                      v66 = _oneIsNil((uint64_t)v64, (uint64_t)v65);

                                      if ((v66 & 1) == 0)
                                      {
                                        -[DRSRequest ckRecordID](self, "ckRecordID");
                                        v67 = objc_claimAutoreleasedReturnValue();
                                        if (!v67)
                                          goto LABEL_48;
                                        v68 = (void *)v67;
                                        -[DRSRequest ckRecordID](self, "ckRecordID");
                                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[DRSRequest ckRecordID](v4, "ckRecordID");
                                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                                        v71 = objc_msgSend(v69, "isEqualToString:", v70);

                                        if (v71)
                                        {
LABEL_48:
                                          v72 = -[DRSRequest requestState](self, "requestState");
                                          if (v72 == -[DRSRequest requestState](v4, "requestState"))
                                          {
                                            v73 = -[DRSRequest uploadAttemptCount](self, "uploadAttemptCount");
                                            if (v73 == -[DRSRequest uploadAttemptCount](v4, "uploadAttemptCount"))
                                            {
                                              v74 = -[DRSRequest decisionServerDecision](self, "decisionServerDecision");
                                              if (v74 == -[DRSRequest decisionServerDecision](v4, "decisionServerDecision"))
                                              {
                                                v75 = -[DRSRequest hasBeenCountedByTelemetry](self, "hasBeenCountedByTelemetry");
                                                if (v75 == -[DRSRequest hasBeenCountedByTelemetry](v4, "hasBeenCountedByTelemetry"))
                                                {
                                                  v76 = -[DRSRequest isExpedited](self, "isExpedited");
                                                  if (v76 == -[DRSRequest isExpedited](v4, "isExpedited"))
                                                  {
                                                    -[DRSRequest errorDescription](self, "errorDescription");
                                                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[DRSRequest errorDescription](v4, "errorDescription");
                                                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v79 = _oneIsNil((uint64_t)v77, (uint64_t)v78);

                                                    if ((v79 & 1) == 0)
                                                    {
                                                      -[DRSRequest errorDescription](self, "errorDescription");
                                                      v80 = objc_claimAutoreleasedReturnValue();
                                                      if (!v80)
                                                        goto LABEL_49;
                                                      v81 = (void *)v80;
                                                      -[DRSRequest errorDescription](self, "errorDescription");
                                                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[DRSRequest errorDescription](v4, "errorDescription");
                                                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v84 = objc_msgSend(v82, "isEqualToString:", v83);

                                                      if (v84)
                                                      {
LABEL_49:
                                                        -[DRSRequest logs](self, "logs");
                                                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[DRSRequest logs](v4, "logs");
                                                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v87 = _oneIsNil((uint64_t)v85, (uint64_t)v86);

                                                        if ((v87 & 1) == 0)
                                                        {
                                                          -[DRSRequest logs](self, "logs");
                                                          v89 = objc_claimAutoreleasedReturnValue();
                                                          if (v89)
                                                          {
                                                            v90 = (void *)v89;
                                                            -[DRSRequest logs](self, "logs");
                                                            v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[DRSRequest logs](v4, "logs");
                                                            v92 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v88 = objc_msgSend(v91, "isEqualToArray:", v92);

                                                            goto LABEL_41;
                                                          }
LABEL_40:
                                                          v88 = 1;
                                                          goto LABEL_41;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v88 = 0;
LABEL_41:

  return v88;
}

+ (BOOL)isExpeditedTeamID:(id)a3 issueCategory:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", kDRSDMRapidTeamID[0])
    && (objc_msgSend(v6, "isEqualToString:", kDRSDMRapidMicroDiagnosticIssueCategory[0]) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "isEqualToString:", kDRSDMPPSTeamID[0]);
  }

  return v7;
}

- (BOOL)isNonPurgeableInFlightUntilUploadAttempt
{
  void *v2;
  char v3;

  -[DRSRequest teamID](self, "teamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", kDRSDMNandTeamID[0]);

  return v3;
}

- (DRSRequest)initWithXPCDict:(id)a3
{
  id v4;
  void *v5;
  uint64_t uint64;
  const char *string;
  NSString *v8;
  NSString *teamID;
  const char *v10;
  NSString *v11;
  NSString *issueCategory;
  const char *v13;
  NSString *v14;
  NSString *issueDescription;
  const char *v16;
  NSString *v17;
  NSString *logType;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *submittedLogInfos;
  NSUUID *v24;
  NSUUID *requestID;
  NSDate *v26;
  NSDate *requestDate;
  void *v28;
  NSString *v29;
  NSString *build;
  const void *data;
  NSData *v32;
  uint64_t v33;
  NSDictionary *v34;
  NSData *contextDictionaryData;
  NSData *v36;
  NSDictionary *contextDictionary;
  void *v38;
  void *v39;
  void *v40;
  DRSRequest *v41;
  size_t v43;
  char v44;
  objc_super v45;

  v4 = a3;
  xpc_dictionary_get_value(v4, "ClientMessageType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_19;
  uint64 = xpc_dictionary_get_uint64(v4, "ClientMessageType");
  if (uint64 != -[DRSRequest expectedType](self, "expectedType"))
    goto LABEL_19;
  v45.receiver = self;
  v45.super_class = (Class)DRSRequest;
  self = -[DRSRequest init](&v45, sel_init);
  if (self)
  {
    string = xpc_dictionary_get_string(v4, "TeamID");
    if (!string)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    teamID = self->_teamID;
    self->_teamID = v8;

    v10 = xpc_dictionary_get_string(v4, "Category");
    if (!v10)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    issueCategory = self->_issueCategory;
    self->_issueCategory = v11;

    v13 = xpc_dictionary_get_string(v4, "Description");
    if (!v13)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    issueDescription = self->_issueDescription;
    self->_issueDescription = v14;

    v16 = xpc_dictionary_get_string(v4, "LogType");
    if (!v16)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    logType = self->_logType;
    self->_logType = v17;

    v44 = 0;
    xpc_dictionary_get_array(v4, "LogArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_array(v4, "SandboxExtensions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_array(v4, "TransferOwnership");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[DRSSubmittedLogInfo submittedLogInfosFromPaths:sandboxExtensions:transferOwnerships:successOut:](DRSSubmittedLogInfo, "submittedLogInfosFromPaths:sandboxExtensions:transferOwnerships:successOut:", v19, v20, v21, &v44);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    submittedLogInfos = self->_submittedLogInfos;
    self->_submittedLogInfos = v22;

    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v24 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      requestID = self->_requestID;
      self->_requestID = v24;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      requestDate = self->_requestDate;
      self->_requestDate = v26;

      self->_requestState = 0;
      +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "build");
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      build = self->_build;
      self->_build = v29;

      self->_uploadAttemptCount = 0;
      self->_decisionServerDecision = 0;
      v43 = 0;
      data = xpc_dictionary_get_data(v4, "ContextDict", &v43);
      if (!data || !v43)
      {
LABEL_13:
        xpc_dictionary_get_value(v4, "RequestMCT");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          self->_requestMCT = xpc_dictionary_get_uint64(v4, "RequestMCT");
          -[DRSRequest teamID](self, "teamID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSRequest issueCategory](self, "issueCategory");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          self->_isExpedited = +[DRSRequest isExpeditedTeamID:issueCategory:](DRSRequest, "isExpeditedTeamID:issueCategory:", v39, v40);

          goto LABEL_15;
        }
LABEL_19:
        v41 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
      v32 = (NSData *)objc_claimAutoreleasedReturnValue();
      DRSDictionaryForData((uint64_t)v32);
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (NSDictionary *)v33;
        contextDictionaryData = self->_contextDictionaryData;
        self->_contextDictionaryData = v32;
        v36 = v32;

        contextDictionary = self->_contextDictionary;
        self->_contextDictionary = v34;

        goto LABEL_13;
      }
    }
    else
    {
      DPLogHandle_ServiceXPCError();
      v32 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(&v32->super))
      {
        LOWORD(v43) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, &v32->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedDictionary", "Failed to extract log infos from XPC dictionary", (uint8_t *)&v43, 2u);
      }
    }

    goto LABEL_19;
  }
LABEL_15:
  self = self;
  v41 = self;
LABEL_20:

  return v41;
}

- (id)replyForMessage:(id)a3
{
  return 0;
}

- (NSString)requestType
{
  return (NSString *)&stru_1EA3D37D0;
}

- (unint64_t)expectedType
{
  return 0;
}

- (id)_processSubmittedLogInfo:(id)a3 workingDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  DRSSandboxExtensionHelper *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  DRSSandboxExtensionHelper *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  DRSSandboxExtensionHelper *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  const char *v53;
  char v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  char v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  const __CFString *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  char v116;
  id v117;
  uint64_t v118;
  void *v119;
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sandboxExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0;
  v10 = -[DRSSandboxExtensionHelper initWithSandboxExtensionToken:logPath:errorOut:]([DRSSandboxExtensionHelper alloc], "initWithSandboxExtensionToken:logPath:errorOut:", v9, v8, &v117);
  v11 = v117;
  if (!v10)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "localizedDescription");
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v24;
    v25 = CFSTR("Unknown");
    if (v24)
      v25 = (const __CFString *)v24;
    v22 = objc_msgSend(v23, "initWithFormat:", CFSTR("Failed to consume sandbox extension for file at '%@' due to error: %@"), v8, v25);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0;
  if ((objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v8, &v116) & 1) == 0)
  {
    DPLogHandle_SubmitLogError();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v26))
    {
      -[DRSRequest requestID](self, "requestID");
      v111 = v12;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSRequest teamID](self, "teamID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSRequest issueCategory](self, "issueCategory");
      v108 = v6;
      v29 = v11;
      v30 = v10;
      v31 = v9;
      v32 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSRequest issueDescription](self, "issueDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v121 = v27;
      v122 = 2114;
      v123 = v8;
      v124 = 2114;
      v125 = v28;
      v126 = 2114;
      v127 = (uint64_t)v33;
      v128 = 2114;
      v129 = (uint64_t)v34;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogMissing", "%{public, name=requestID}@: Log with path %{public}@ submitted by %{public}@/%{public}@/%{public}@ missing", buf, 0x34u);

      v7 = v32;
      v9 = v31;
      v10 = v30;
      v11 = v29;
      v6 = v108;

      v12 = v111;
    }

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Specified file path '%@' missing"), v8, v94);
    goto LABEL_13;
  }
  if (!v116)
  {
    v112 = v12;
    v37 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DRSRequest requestID](self, "requestID");
    v109 = v7;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v37, "initWithFormat:", CFSTR("submitLog%@_%@"), v39, v40);

    v7 = v109;
    v105 = (void *)v41;
    objc_msgSend(v109, "stringByAppendingPathComponent:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v42;
    if (objc_msgSend(v6, "transferOwnership"))
    {
      v115 = 0;
      v43 = objc_msgSend(v112, "moveItemAtPath:toPath:error:", v8, v42, &v115);
      v44 = v115;
      v45 = v44;
      if ((v43 & 1) != 0)
      {
        v102 = v44;
        DPLogHandle_SubmitLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v46))
          goto LABEL_23;
        -[DRSRequest requestID](self, "requestID");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest teamID](self, "teamID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueCategory](self, "issueCategory");
        v48 = objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueDescription](self, "issueDescription");
        v49 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v121 = v98;
        v122 = 2114;
        v123 = v8;
        v124 = 2114;
        v125 = v47;
        v126 = 2114;
        v127 = v48;
        v50 = (void *)v48;
        v128 = 2114;
        v129 = v49;
        v51 = (void *)v49;
        v130 = 2114;
        v131 = v106;
        v52 = "LogMove";
        v53 = "%{public, name=requestID}@: Moved %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@";
        goto LABEL_22;
      }
      DPLogHandle_SubmitLogError();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v66))
      {
        -[DRSRequest requestID](self, "requestID");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest teamID](self, "teamID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueCategory](self, "issueCategory");
        v103 = v45;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueDescription](self, "issueDescription");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "localizedDescription");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v121 = v99;
        v122 = 2114;
        v123 = v8;
        v124 = 2114;
        v125 = v67;
        v126 = 2114;
        v127 = (uint64_t)v68;
        v128 = 2114;
        v129 = (uint64_t)v69;
        v130 = 2114;
        v131 = v106;
        v132 = 2114;
        v133 = v70;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v66, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogMoveFailed", "%{public, name=requestID}@: Attempt to move %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %{public}@", buf, 0x48u);

        v7 = v109;
        v45 = v103;

      }
      v71 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v45, "localizedDescription");
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = v45;
      v62 = (id)v72;
      v74 = CFSTR("Unknown");
      if (v72)
        v74 = (const __CFString *)v72;
      v42 = v106;
      v75 = objc_msgSend(v71, "initWithFormat:", CFSTR("Moving '%@' to '%@' failed due to error: %@"), v8, v106, v74);
    }
    else
    {
      v114 = 0;
      v54 = objc_msgSend(v112, "copyItemAtPath:toPath:error:", v8, v42, &v114);
      v55 = v114;
      v56 = v55;
      if ((v54 & 1) != 0)
      {
        v102 = v55;
        DPLogHandle_SubmitLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v46))
          goto LABEL_23;
        -[DRSRequest requestID](self, "requestID");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest teamID](self, "teamID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueCategory](self, "issueCategory");
        v57 = objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueDescription](self, "issueDescription");
        v58 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v121 = v98;
        v122 = 2114;
        v123 = v8;
        v124 = 2114;
        v125 = v47;
        v126 = 2114;
        v127 = v57;
        v50 = (void *)v57;
        v128 = 2114;
        v129 = v58;
        v51 = (void *)v58;
        v130 = 2114;
        v131 = v106;
        v52 = "LogCopy";
        v53 = "%{public, name=requestID}@: Copied %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@";
LABEL_22:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v46, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v52, v53, buf, 0x3Eu);

        v7 = v109;
        v42 = v106;

LABEL_23:
        v118 = *MEMORY[0x1E0CB2AA8];
        v119 = &unk_1EA3E3998;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = 0;
        v60 = objc_msgSend(v112, "setAttributes:ofItemAtPath:error:", v59, v42, &v113);
        v61 = v113;
        if ((v60 & 1) != 0)
        {

          v62 = -[DRSLog _initWithLogPath:transferOwnership:]([DRSLog alloc], "_initWithLogPath:transferOwnership:", v42, objc_msgSend(v6, "transferOwnership"));
          if (v62)
          {
            -[DRSRequest logs](self, "logs");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
            {
              v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[DRSRequest setLogs:](self, "setLogs:", v64);

            }
            -[DRSRequest logs](self, "logs");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v62);

            v35 = 0;
          }
          else
          {
            DPLogHandle_SubmitLogError();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v92))
            {
              -[DRSRequest requestID](self, "requestID");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v121 = v93;
              v122 = 2114;
              v123 = v42;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v92, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeLookupFailed", "%{public, name=requestID}@: Attempt to lookup log size for %{public}@ failed", buf, 0x16u);

              v7 = v109;
            }

            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Size lookup on '%@' failed"), v42);
          }
          v73 = v102;
        }
        else
        {
          v97 = v59;
          v101 = v61;
          DPLogHandle_SubmitLogError();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v84))
          {
            -[DRSRequest requestID](self, "requestID");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[DRSRequest teamID](self, "teamID");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[DRSRequest issueCategory](self, "issueCategory");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[DRSRequest issueDescription](self, "issueDescription");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "localizedDescription");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v121 = v96;
            v122 = 2114;
            v123 = v8;
            v124 = 2114;
            v125 = v95;
            v126 = 2114;
            v127 = (uint64_t)v85;
            v128 = 2114;
            v129 = (uint64_t)v86;
            v130 = 2114;
            v131 = v106;
            v132 = 2112;
            v133 = v87;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v84, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogPermissionsUpdateFailed", "%{public, name=requestID}@: Attempt to set permissions to '600' on %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %@{public}", buf, 0x48u);

          }
          v88 = objc_alloc(MEMORY[0x1E0CB3940]);
          v73 = v102;
          objc_msgSend(v102, "localizedDescription");
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = (void *)v89;
          v91 = CFSTR("Unknown");
          if (v89)
            v91 = (const __CFString *)v89;
          v42 = v106;
          v35 = (void *)objc_msgSend(v88, "initWithFormat:", CFSTR("Updating permissions on '%@' failed due to error: %@"), v106, v91);

          v7 = v109;
          v62 = v97;
        }
        goto LABEL_48;
      }
      DPLogHandle_SubmitLogError();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v76))
      {
        -[DRSRequest requestID](self, "requestID");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest teamID](self, "teamID");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueCategory](self, "issueCategory");
        v104 = v56;
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSRequest issueDescription](self, "issueDescription");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "localizedDescription");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v121 = v100;
        v122 = 2114;
        v123 = v8;
        v124 = 2114;
        v125 = v77;
        v126 = 2114;
        v127 = (uint64_t)v78;
        v128 = 2114;
        v129 = (uint64_t)v79;
        v130 = 2114;
        v131 = v106;
        v132 = 2112;
        v133 = v80;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v76, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogCopyFailed", "%{public, name=requestID}@: Attempt to copy %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %@{public}", buf, 0x48u);

        v7 = v109;
        v56 = v104;

      }
      v81 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v56, "localizedDescription");
      v82 = objc_claimAutoreleasedReturnValue();
      v73 = v56;
      v62 = (id)v82;
      v83 = CFSTR("Unknown");
      if (v82)
        v83 = (const __CFString *)v82;
      v42 = v106;
      v75 = objc_msgSend(v81, "initWithFormat:", CFSTR("Copying '%@' to '%@' failed due to error: %@"), v8, v106, v83);
    }
    v35 = (void *)v75;
LABEL_48:

    v12 = v112;
    goto LABEL_14;
  }
  DPLogHandle_SubmitLogError();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    -[DRSRequest requestID](self, "requestID");
    v110 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest teamID](self, "teamID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest issueCategory](self, "issueCategory");
    v107 = v6;
    v16 = v11;
    v17 = v10;
    v18 = v9;
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest issueDescription](self, "issueDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v121 = v14;
    v122 = 2114;
    v123 = v8;
    v124 = 2114;
    v125 = v15;
    v126 = 2114;
    v127 = (uint64_t)v20;
    v128 = 2114;
    v129 = (uint64_t)v21;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogIsDirectory", "%{public, name=requestID}@: Log with path %{public}@ submitted by %{public}@/%{public}@/%{public}@ is a directory rather than a file", buf, 0x34u);

    v7 = v19;
    v9 = v18;
    v10 = v17;
    v11 = v16;
    v6 = v107;

    v12 = v110;
  }

  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Specified file path '%@' is a directory not a file"), v8, v94);
LABEL_13:
  v35 = (void *)v22;
LABEL_14:

  return v35;
}

- (BOOL)performOnReceiptWork:(id)a3 dampeningOutcome:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  NSArray *submittedLogInfos;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t k;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLogUploadEnabled");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[DRSRequest submittedLogInfos](self, "submittedLogInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "transferOwnership") & 1) != 0)
        {

          goto LABEL_21;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (a4)
    v14 = 0;
  else
    v14 = v8;
  if ((v14 & 1) != 0)
  {
LABEL_21:
    -[DRSRequest submittedLogInfos](self, "submittedLogInfos");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    submittedLogInfos = self->_submittedLogInfos;
    self->_submittedLogInfos = 0;

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v21);
          -[DRSRequest _processSubmittedLogInfo:workingDirectory:](self, "_processSubmittedLogInfo:workingDirectory:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v20, "count"))
    {
      v39 = v21;
      v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v28 = v20;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v41;
        v32 = 1;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(v28);
            v34 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
            if ((v32 & 1) == 0)
              objc_msgSend(v27, "appendString:", CFSTR(", "));
            objc_msgSend(v27, "appendString:", v34);
            v32 = 0;
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          v32 = 0;
        }
        while (v30);
      }

      -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4352, v27, 0);
      v17 = 0;
      v21 = v39;
    }
    else
    {
      v35 = -[DRSRequest totalLogSizeBytes](self, "totalLogSizeBytes");
      v36 = -[DRSRequest totalLogSizeBytes](self, "totalLogSizeBytes");
      if (v36 <= -[DRSRequest logSizeLimitBytes](self, "logSizeLimitBytes"))
      {
        v17 = -[DRSRequest _performPostClientLogWork:dampeningOutcome:isLogUploadEnabled:](self, "_performPostClientLogWork:dampeningOutcome:isLogUploadEnabled:", v6, a4, v8);
      }
      else
      {
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Log(s) exceed size cap. Submitted size %zuB vs. cap %lluB"), v35, -[DRSRequest logSizeLimitBytes](self, "logSizeLimitBytes"));
        -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4357, v37, 0);

        v17 = 0;
      }
    }

  }
  else
  {
    if (a4 - 1 >= 8)
      v15 = 0;
    else
      v15 = a4 + 4095;
    if (a4)
      v16 = v15;
    else
      v16 = 4103;
    v17 = -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", v16, 0, 0);
  }

  return v17;
}

- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  DRSRequest *v9;
  uint64_t v10;
  const __CFString *v11;
  BOOL v12;

  v5 = a5;
  v8 = a3;
  switch(a4)
  {
    case 0uLL:
      if (v5)
      {
        v9 = self;
        v10 = 1;
        v11 = 0;
      }
      else
      {
        v11 = CFSTR("Log upload is disabled");
        v9 = self;
        v10 = 4103;
      }
      goto LABEL_14;
    case 1uLL:
      v10 = 4096;
      goto LABEL_13;
    case 2uLL:
      v10 = 4097;
      goto LABEL_13;
    case 3uLL:
      v10 = 4098;
      goto LABEL_13;
    case 4uLL:
      v10 = 4099;
      goto LABEL_13;
    case 5uLL:
      v10 = 4100;
      goto LABEL_13;
    case 6uLL:
      v10 = 4101;
      goto LABEL_13;
    case 7uLL:
      v10 = 4102;
      goto LABEL_13;
    case 8uLL:
      v10 = 4103;
      goto LABEL_13;
    default:
      v10 = 0;
LABEL_13:
      v11 = CFSTR("Request denied due to dampening");
      v9 = self;
LABEL_14:
      v12 = -[DRSRequest updateToState:errorDescription:errorOut:](v9, "updateToState:errorDescription:errorOut:", v10, v11, 0);

      return v12;
  }
}

- (BOOL)hasUploadableContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[DRSRequest logs](self, "logs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isAvailableOnDisk"))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_updateLogStateToExpectedState:(unsigned __int8)a3
{
  NSObject *v4;
  void *v5;
  BOOL result;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
      DPLogHandle_RequestError();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v4))
      {
        -[DRSRequest debugDescription](self, "debugDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v5;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidLogStateUpdate", "Tried to update to non-purgeable state: %{public}@", (uint8_t *)&v8, 0xCu);

      }
      goto LABEL_5;
    case 1u:
      v7 = 1024;
      goto LABEL_8;
    case 2u:
      v7 = 512;
LABEL_8:
      result = -[DRSRequest _markLogsAsPurgeableWithUrgencyWithDeleteFallback:](self, "_markLogsAsPurgeableWithUrgencyWithDeleteFallback:", v7);
      break;
    case 3u:
      result = -[DRSRequest _deleteLogs](self, "_deleteLogs");
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)_deleteLogs
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  DPLogHandle_LogManagement();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[DRSRequest requestID](self, "requestID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest logs](self, "logs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v5, "count");
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogDelete", "Request ID %{public}@: Deleting %lu logs", buf, 0x16u);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DRSRequest logs](self, "logs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "_deleteOnDiskLog") ^ 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
    v12 = v9 ^ 1;
  }
  else
  {
    v12 = 1;
  }

  return v12 & 1;
}

- (BOOL)_updateLogFileStateForTransitionFromPreviousState:(unint64_t)a3
{
  int v4;
  uint64_t v5;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  NSString *v11;
  NSString *errorDescription;

  v4 = DRSRequestExpectedLogStateForState(a3, -[DRSRequest isNonPurgeableInFlightUntilUploadAttempt](self, "isNonPurgeableInFlightUntilUploadAttempt"), -[DRSRequest uploadAttemptCount](self, "uploadAttemptCount"));
  v5 = DRSRequestExpectedLogStateForState(-[DRSRequest requestState](self, "requestState"), -[DRSRequest isNonPurgeableInFlightUntilUploadAttempt](self, "isNonPurgeableInFlightUntilUploadAttempt"), -[DRSRequest uploadAttemptCount](self, "uploadAttemptCount"));
  if (v4 == (_DWORD)v5 || -[DRSRequest _updateLogStateToExpectedState:](self, "_updateLogStateToExpectedState:", v5))
    return 1;
  self->_requestState = 4359;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSRequest logPath](self, "logPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("<Missing path>");
  if (v8)
    v10 = (const __CFString *)v8;
  v11 = (NSString *)objc_msgSend(v7, "initWithFormat:", CFSTR("Failed to update log purgeability state or failed to delete file: %@"), v10);
  errorDescription = self->_errorDescription;
  self->_errorDescription = v11;

  return 0;
}

- (BOOL)updateToState:(unint64_t)a3 errorDescription:(id)a4 errorOut:(id *)a5
{
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSString *v28;
  NSString *errorDescription;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = -[DRSRequest requestState](self, "requestState");
  if (!DRSRequestOutcomeForState(-[DRSRequest requestState](self, "requestState")))
  {
    if (a3 != 2 || v10 == 1)
    {
      self->_requestState = a3;
      objc_storeStrong((id *)&self->_errorDescription, a4);
      if (-[DRSRequest requestState](self, "requestState") != 4352)
      {
LABEL_18:
        v19 = -[DRSRequest _updateLogFileStateForTransitionFromPreviousState:](self, "_updateLogFileStateForTransitionFromPreviousState:", v10);
        goto LABEL_19;
      }
      DPLogHandle_RequestError();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[DRSRequest updateToState:errorDescription:errorOut:].cold.1((uint64_t)v9, v26, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      if (a5)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot start upload if not awaiting upload"));
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2D50];
        v38 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DRSRequestStateTransitionError"), 0, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      DPLogHandle_RequestError();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        -[DRSRequest debugDescription](self, "debugDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStateTransitionError", "Cannot start upload if not awaiting upload for request:%{public}@", buf, 0xCu);

      }
      self->_requestState = 4358;
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[DRSRequest requestStateString](self, "requestStateString");
      v26 = objc_claimAutoreleasedReturnValue();
      DRRequestStateWithOutcomeStringForState(2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (NSString *)objc_msgSend(v25, "initWithFormat:", CFSTR("Invalid state transition: %@ (%#llx) -> %@ (%#llx)"), v26, v10, v27, 2);
      errorDescription = self->_errorDescription;
      self->_errorDescription = v28;

    }
    goto LABEL_18;
  }
  if (a5)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DRSRequest requestStateString](self, "requestStateString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("Cannot transition out of terminal state %@ (%#llx)"), v12, -[DRSRequest requestState](self, "requestState"));

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DRSRequestStateTransitionError"), 0, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  DPLogHandle_RequestError();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    -[DRSRequest requestStateString](self, "requestStateString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest debugDescription](self, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v17;
    v41 = 2048;
    v42 = v10;
    v43 = 2114;
    v44 = v18;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStateTransitionError", "Cannot transition out of terminal state %{public}@ (%#llx) for request: %{public}@", buf, 0x20u);

  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (BOOL)uploadStarted
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[DRSRequest uploadID](self, "uploadID"))
  {
    DPLogHandle_RequestError();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      -[DRSRequest requestID](self, "requestID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidUploadID", "Request ID %{public}@: Trying to start an upload when we already have an upload ID", buf, 0xCu);

    }
    LOBYTE(v5) = 0;
  }
  else
  {
    do
      v6 = __ldaxr(&_uniqueSignpostID_nextSerialNumber);
    while (__stlxr(v6 + 1, &_uniqueSignpostID_nextSerialNumber));
    self->_uploadID = v6;
    v15 = 0;
    v5 = -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 2, 0, &v15);
    v3 = v15;
    if (v5)
    {
      DPLogHandle_CKRecordUpload();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[DRSRequest uploadID](self, "uploadID");
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          -[DRSRequest requestID](self, "requestID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSRequest teamID](self, "teamID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSRequest issueCategory](self, "issueCategory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSRequest issueDescription](self, "issueDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v17 = v10;
          v18 = 2114;
          v19 = v11;
          v20 = 2114;
          v21 = v12;
          v22 = 2114;
          v23 = v13;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogUpload", "Began upload of log with request ID %@, %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=issueDescription}@", buf, 0x2Au);

        }
      }

      ++self->_uploadAttemptCount;
    }
  }

  return v5;
}

- (void)uploadFailedDueToReason:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  os_signpost_id_t v7;
  unint64_t v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[DRSRequest uploadAttemptCount](self, "uploadAttemptCount");
  DPLogHandle_CKRecordUpload();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[DRSRequest uploadID](self, "uploadID");
  v8 = v7 - 1;
  if (v5 < 3)
  {
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240450;
      v11 = 0;
      v12 = 2114;
      v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload failed. Will retry. %{public, name=uploadSuccess}u Error: %{public}@", buf, 0x12u);
    }

    -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 1, 0, 0);
  }
  else
  {
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240450;
      v11 = 0;
      v12 = 2114;
      v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload failure. %{public, name=uploadSuccess}u Error: %{public}@", buf, 0x12u);
    }

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Stopped trying to upload after %llu attempts. Upload error: %@"), 3, v4);
    -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4355, v9, 0);

  }
}

- (void)uploadCompleteWithError:(id)a3 ckRecordID:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = CFSTR("Unknown");
    -[DRSRequest uploadFailedDueToReason:](self, "uploadFailedDueToReason:", v10);

  }
  else
  {
    objc_storeStrong((id *)&self->_ckRecordID, a4);
    DPLogHandle_CKRecordUpload();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[DRSRequest uploadID](self, "uploadID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        v14[0] = 67240450;
        v14[1] = 1;
        v15 = 2114;
        v16 = v7;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_INTERVAL_END, v13, "LogUpload", "Upload success. %{public, name=uploadSuccess}u CK Record ID: %{public}@", (uint8_t *)v14, 0x12u);
      }
    }

    -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 0x2000, 0, 0);
  }

}

- (void)makeTerminalDueToMissingLog
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  DPLogHandle_CKRecordUpload();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[DRSRequest uploadID](self, "uploadID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      -[DRSRequest requestID](self, "requestID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, v5, "MakingTerminalDueToLogsMissing", "Moving %{public}@ to terminal state due to missing uploadable content", buf, 0xCu);

    }
  }

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSRequest logPath](self, "logPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("Unknown");
  if (v8)
    v10 = (const __CFString *)v8;
  v11 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Log file is missing (path: %@)"), v10);

  -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4354, v11, 0);
}

- (void)uploadAbortedDueToLogSize
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DPLogHandle_CKRecordUpload();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[DRSRequest uploadID](self, "uploadID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      -[DRSRequest requestID](self, "requestID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_INTERVAL_END, v5, "LogUpload", "Log size for %{public}@ exceeds cap", (uint8_t *)&v7, 0xCu);

    }
  }

  -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4357, CFSTR("Log size is too large or could not be determined"), 0);
}

- (void)uploadDeniedByDecisionServerWithReason:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  DPLogHandle_CKRecordUpload();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[DRSRequest uploadID](self, "uploadID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      if (v4)
        v8 = v4;
      else
        v8 = CFSTR("Unknown");
      v10 = 138543362;
      v11 = v8;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload denied by decision server due to reason %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  if (v4)
    v9 = v4;
  else
    v9 = CFSTR("Unknown");
  -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4353, v9, 0);

}

+ (id)_requestWithRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = -[DRSTailspinRequest _initWithTailspinRequestMO_ON_MOC_QUEUE:]([DRSTailspinRequest alloc], "_initWithTailspinRequestMO_ON_MOC_QUEUE:", v3);
LABEL_9:
    v5 = v4;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = -[DRSSubmitLogRequest _initWithSubmitLogRequestMO_ON_MOC_QUEUE:]([DRSSubmitLogRequest alloc], "_initWithSubmitLogRequestMO_ON_MOC_QUEUE:", v3);
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = -[DRSSubmitLogToCKContainerRequest _initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:]([DRSSubmitLogToCKContainerRequest alloc], "_initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:", v3);
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = -[DRSSubmitRapidLogRequest _initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:]([DRSSubmitRapidLogRequest alloc], "_initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:", v3);
    goto LABEL_9;
  }
  DPLogHandle_CoreDataError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedManagedObjectClass", "Tried to create a DRSRequest instance with an unknown ManagedObject class: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (BOOL)_populateLogsArray_ON_MOC_QUEUE:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  void *logs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSArray *v26;
  NSArray *v27;
  const char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  NSObject *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "logs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "logs", 0);
    logs = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(logs, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(logs);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = -[DRSLog _initWithLogMO_ON_MOC_QUEUE:]([DRSLog alloc], "_initWithLogMO_ON_MOC_QUEUE:", v13);
          if (!v14)
          {
            DPLogHandle_CoreDataError();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v17))
            {
              objc_msgSend(v13, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v13, "size");
              *(_DWORD *)buf = 138412546;
              v36 = v18;
              v37 = 2048;
              v38 = v19;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSLogCreationFailure", "Failed to create a DRSLog from a DRSLogMO: Path: %@ Size: %llu", buf, 0x16u);

            }
            v16 = 0;
            goto LABEL_34;
          }
          v15 = v14;
          -[NSArray addObject:](v7, "addObject:", v14);

        }
        v10 = objc_msgSend(logs, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = v7;
    logs = self->_logs;
    self->_logs = v7;
    v16 = 1;
    goto LABEL_34;
  }
  objc_msgSend(v4, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "persistentStoreCoordinator");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21, "managedObjectModel");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  -[NSArray versionIdentifiers](v7, "versionIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v22, "containsObject:", CFSTR("3"));

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("logPath"));
    logs = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("cachedLogSize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("transferOwnership"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!logs)
    {
      v16 = 1;
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    if (!v23)
      v23 = &unk_1EA3E3980;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = -[DRSLog _initWithLogPath:transferOwnership:size:]([DRSLog alloc], "_initWithLogPath:transferOwnership:size:", logs, objc_msgSend(v24, "BOOLValue"), objc_msgSend(v23, "unsignedLongLongValue"));
          v34 = v25;
          v16 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v27 = self->_logs;
          self->_logs = v26;

LABEL_32:
          goto LABEL_33;
        }
        DPLogHandle_CoreDataError();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          v28 = "Unexpected class for 'transferOwnership'";
          goto LABEL_30;
        }
LABEL_31:
        v16 = 0;
        goto LABEL_32;
      }
      DPLogHandle_CoreDataError();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v25))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v28 = "Unexpected class for 'cachedLogSize'";
    }
    else
    {
      DPLogHandle_CoreDataError();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v25))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v28 = "Unexpected class for 'logPath'";
    }
LABEL_30:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSLogCreationFailure", v28, buf, 2u);
    goto LABEL_31;
  }
  v16 = 1;
LABEL_35:

  return v16;
}

+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "issueCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "issueDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "requestDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          objc_msgSend(v4, "requestID");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          if (v5)
          {
            objc_msgSend(v4, "teamID");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v5) = v6 != 0;

          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (id)_initWithRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  DRSRequest *v5;
  NSString *v6;
  NSString *teamID;
  NSString *v8;
  NSString *issueCategory;
  NSString *v10;
  NSString *issueDescription;
  NSData *v12;
  NSData *contextDictionaryData;
  NSDate *v14;
  NSDate *requestDate;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *contextDictionary;
  void *v23;
  NSUUID *v24;
  NSUUID *requestID;
  NSString *v26;
  NSString *errorDescription;
  NSString *v28;
  NSString *ckRecordID;
  objc_super v31;

  v4 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "_requestMOHasRequiredFields_ON_MOC_QUEUE:", v4))
    goto LABEL_13;
  v31.receiver = self;
  v31.super_class = (Class)DRSRequest;
  v5 = -[DRSRequest init](&v31, sel_init);
  self = v5;
  if (!v5)
  {
LABEL_12:
    self = self;
    v23 = self;
    goto LABEL_14;
  }
  if (!-[DRSRequest _populateLogsArray_ON_MOC_QUEUE:](v5, "_populateLogsArray_ON_MOC_QUEUE:", v4))
  {
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "teamID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  teamID = self->_teamID;
  self->_teamID = v6;

  objc_msgSend(v4, "issueCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  issueCategory = self->_issueCategory;
  self->_issueCategory = v8;

  objc_msgSend(v4, "issueDescription");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  issueDescription = self->_issueDescription;
  self->_issueDescription = v10;

  self->_requestMCT = objc_msgSend(v4, "requestMCT");
  objc_msgSend(v4, "contextDictionaryData");
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  contextDictionaryData = self->_contextDictionaryData;
  self->_contextDictionaryData = v12;

  objc_msgSend(v4, "requestDate");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  requestDate = self->_requestDate;
  self->_requestDate = v14;

  objc_msgSend(v4, "build");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = CFSTR("Unknown");
  objc_storeStrong((id *)&self->_build, v18);

  self->_uploadAttemptCount = objc_msgSend(v4, "uploadAttemptCount");
  self->_hasBeenCountedByTelemetry = objc_msgSend(v4, "hasBeenCountedByTelemetry");
  self->_decisionServerDecision = objc_msgSend(v4, "decisionServerDecision");
  -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_9;
  -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  DRSDictionaryForData((uint64_t)v20);
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  contextDictionary = self->_contextDictionary;
  self->_contextDictionary = v21;

  -[DRSRequest contextDictionary](self, "contextDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
LABEL_9:
    objc_msgSend(v4, "requestID");
    v24 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    requestID = self->_requestID;
    self->_requestID = v24;

    self->_requestState = objc_msgSend(v4, "requestState");
    if (-[DRSRequest requestState](self, "requestState") == 4353)
      self->_decisionServerDecision = 1;
    objc_msgSend(v4, "errorDescription");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorDescription = self->_errorDescription;
    self->_errorDescription = v26;

    self->_isExpedited = objc_msgSend(v4, "isExpedited");
    objc_msgSend(v4, "ckRecordID");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    ckRecordID = self->_ckRecordID;
    self->_ckRecordID = v28;

    goto LABEL_12;
  }
LABEL_14:

  return v23;
}

+ (id)requestsForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__DRSRequest_requestsForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v25[3] = &unk_1EA3D0DE0;
  v31 = a1;
  v16 = v12;
  v26 = v16;
  v17 = v14;
  v27 = v17;
  v32 = a6;
  v18 = v13;
  v28 = v18;
  v30 = &v33;
  v19 = v15;
  v29 = v19;
  objc_msgSend(v18, "performBlockAndWait:", v25);
  if (v34[5])
  {

    DPLogHandle_CoreDataError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      objc_msgSend((id)v34[5], "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestFetchFailure", "Failed to fetch requests due to error: %{public}@", buf, 0xCu);

    }
    v19 = 0;
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v34[5]);
  v22 = v29;
  v23 = v19;

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __85__DRSRequest_requestsForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 72), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setSortDescriptors:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 80))
    objc_msgSend(v4, "setFetchLimit:");
  v5 = *(void **)(a1 + 48);
  v27 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            +[DRSRequest _requestWithRequestMO_ON_MOC_QUEUE:](DRSRequest, "_requestWithRequestMO_ON_MOC_QUEUE:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              v18 = (void *)MEMORY[0x1E0CB35C8];
              v28 = *MEMORY[0x1E0CB2D50];
              v29 = CFSTR("Failed to create request for requestMO");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v19);
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v22 = *(void **)(v21 + 40);
              *(_QWORD *)(v21 + 40) = v20;

              goto LABEL_18;
            }
            v15 = (void *)v14;
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_18:

    }
  }
  else
  {
    if (!v7)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Unknown fetch error");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
  }

}

+ (id)unreportedTerminalRequestsFromContext:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(requestState >= %llu) AND (hasBeenCountedByTelemetry == NO)"), 4096);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSRequest requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:](DRSRequest, "requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v12, v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)uploadedBytesSinceDate:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(requestDate >= %@) AND (requestState == %llu)"), a3, 0x2000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSRequest requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:](DRSRequest, "requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v8, v7, 0, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 0;
  if (!*a5)
  {
    if (objc_msgSend(v9, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v12);
            v15 += objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "totalLogSizeBytes");
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &unk_1EA3E3980;
    }
  }

  return v11;
}

+ (unint64_t)requestCountForFilterPredicate:(id)a3 context:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v10);
  objc_msgSend(v14, "setResultType:", 4);
  if (a5)
    objc_msgSend(v14, "setFetchLimit:", a5);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __73__DRSRequest_requestCountForFilterPredicate_context_fetchLimit_errorOut___block_invoke;
  v26 = &unk_1EA3D0E08;
  v29 = &v37;
  v15 = v11;
  v27 = v15;
  v16 = v14;
  v28 = v16;
  v30 = &v31;
  objc_msgSend(v15, "performBlockAndWait:", &v23);
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  if (v32[5])
  {
    DPLogHandle_CoreDataError();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      objc_msgSend((id)v32[5], "localizedDescription", v23, v24, v25, v26, v27);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("Unknown");
      if (v18)
        v20 = (const __CFString *)v18;
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCountFailure", "Encountered failure when fetching count: %{public}@", buf, 0xCu);

    }
    v21 = 0;
  }
  else
  {
    v21 = v38[3];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __73__DRSRequest_requestCountForFilterPredicate_context_fetchLimit_errorOut___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  obj = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &obj);
  v5 = obj;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
}

+ (id)leastRecentDateFirstSortDescriptor
{
  if (leastRecentDateFirstSortDescriptor_onceToken != -1)
    dispatch_once(&leastRecentDateFirstSortDescriptor_onceToken, &__block_literal_global);
  return (id)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor;
}

void __48__DRSRequest_leastRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("requestDate"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor;
  leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor = v0;

}

+ (id)mostRecentDateFirstSortDescriptor
{
  if (mostRecentDateFirstSortDescriptor_onceToken != -1)
    dispatch_once(&mostRecentDateFirstSortDescriptor_onceToken, &__block_literal_global_327);
  return (id)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor;
}

void __47__DRSRequest_mostRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("requestDate"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor;
  mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor = v0;

}

+ (BOOL)cleanRequestRecordsFromPersistentContainer:(id)a3 removeFiles:(BOOL)a4 removeRecord:(BOOL)a5 matchingPredicate:(id)a6 errorOut:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  if (a4 || v9)
  {
    v15 = (void *)objc_msgSend(v12, "newBackgroundContext");
    v16 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(a1, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchRequestWithEntityName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setPredicate:", v13);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __109__DRSRequest_cleanRequestRecordsFromPersistentContainer_removeFiles_removeRecord_matchingPredicate_errorOut___block_invoke;
    v22[3] = &unk_1EA3D0E90;
    v19 = v15;
    v23 = v19;
    v20 = v18;
    v24 = v20;
    v25 = &v28;
    v26 = a4;
    v27 = v9;
    objc_msgSend(v19, "performBlockAndWait:", v22);
    if (a7)
      *a7 = objc_retainAutorelease((id)v29[5]);
    v14 = v29[5] == 0;

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

void __109__DRSRequest_cleanRequestRecordsFromPersistentContainer_removeFiles_removeRecord_matchingPredicate_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  int v31;
  const __CFString *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v52 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v52);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v52;
  v6 = v5;
  if (v4)
  {
    v40 = v5;
    v41 = v4;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v49 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (*(_BYTE *)(a1 + 56))
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v11, "logs");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v45;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v45 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "path", v40);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  _deleteFileWithPath(v17);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
              }
              while (v14);
            }

          }
          if (*(_BYTE *)(a1 + 57))
            objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      }
      while (v8);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
    {
      v18 = *(void **)(a1 + 32);
      v43 = 0;
      v19 = objc_msgSend(v18, "save:", &v43);
      v20 = v43;
      if ((v19 & 1) == 0)
      {
        DPLogHandle_CoreDataError();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          objc_msgSend(v20, "localizedDescription");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v24 = CFSTR("Unknown");
          if (v22)
            v24 = (const __CFString *)v22;
          *(_DWORD *)buf = 138543362;
          v54 = (uint64_t)v24;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsFailure", "Failed to save deletion of records due to error: %{public}@", buf, 0xCu);

        }
        if (!v20)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v59 = *MEMORY[0x1E0CB2D50];
          v60 = CFSTR("Unknown save error");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v26);
          v20 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    DPLogHandle_CoreData();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v40;
    if (os_signpost_enabled(v27))
    {
      v29 = objc_msgSend(obj, "count");
      v30 = CFSTR("YES");
      v31 = *(unsigned __int8 *)(a1 + 57);
      if (*(_BYTE *)(a1 + 56))
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v54 = v29;
      if (!v31)
        v30 = CFSTR("NO");
      v55 = 2114;
      v56 = v32;
      v57 = 2114;
      v58 = v30;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsSuccess", "Cleaned %lu requests (Remove files: %{public}@, remove records: %{public}@", buf, 0x20u);
    }
    v4 = v41;
  }
  else
  {
    DPLogHandle_CoreDataError();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v33))
    {
      objc_msgSend(v6, "localizedDescription");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      v36 = CFSTR("Unknown");
      if (v34)
        v36 = (const __CFString *)v34;
      *(_DWORD *)buf = 138543362;
      v54 = (uint64_t)v36;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsFailure", "Fetch records due to error: %{public}@", buf, 0xCu);

    }
    if (!v6)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v63 = *MEMORY[0x1E0CB2D50];
      v64[0] = CFSTR("Unknown fetch error");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v38);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = v6;
    v27 = *(NSObject **)(v39 + 40);
    *(_QWORD *)(v39 + 40) = v28;
  }

}

+ (BOOL)cullOldRequestRecordsFromPersistentContainer:(id)a3 currentDate:(id)a4 errorOut:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
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
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99D68];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithTimeInterval:sinceDate:", v9, -259200.0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v9, -864000.0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v9, -2592000.0);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestDate < %@ AND requestState >= %llu"), v11, 0x2000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:](DRSRequest, "cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:", v7, 1, 0, v13, a5);

  v15 = 0;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestState >= %llu AND requestState < %llu"), 4096, 0x2000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hasBeenCountedByTelemetry == YES AND requestDate < %@"), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hasBeenCountedByTelemetry == YES AND requestDate < %@"), v11);
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3528];
    v35[0] = v17;
    v35[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "orPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB3528];
    v34[0] = v16;
    v34[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestState >= %llu AND requestDate < %@"), 0x2000, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3528];
    v33[0] = v25;
    v33[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "orPredicateWithSubpredicates:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v28) = +[DRSRequest cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:](DRSRequest, "cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:", v7, 1, 1, v29, a5);
    if ((_DWORD)v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestState >= %llu AND requestState < %llu"), 4096, 0x2000);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:](DRSRequest, "cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:", v7, 1, 0, v30, a5);

    }
    else
    {
      v15 = 0;
    }
    v10 = v32;
  }

  return v15;
}

+ (id)migrateRequestDataStoreAtPath:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  _BYTE v31[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  DRSRequestPersistentContainerForVersion(2, v6, 0, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_11;
  v9 = (void *)objc_msgSend(v7, "newBackgroundContext");
  v10 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)v31 = 0;
  *(_QWORD *)&v31[8] = v31;
  *(_QWORD *)&v31[16] = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__DRSRequest_migrateRequestDataStoreAtPath_errorOut___block_invoke;
  v23[3] = &unk_1EA3D0EB8;
  v13 = v9;
  v24 = v13;
  v14 = v12;
  v25 = v14;
  v26 = v31;
  objc_msgSend(v13, "performBlockAndWait:", v23);
  v15 = *(void **)(*(_QWORD *)&v31[8] + 40);
  if (v15)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    DPLogHandle_CoreDataError();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v31[8] + 40), "localizedDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("Unknown error");
      if (v17)
        v19 = (const __CFString *)v17;
      *(_DWORD *)buf = 138543618;
      v28 = v6;
      v29 = 2112;
      v30 = v19;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MigrationFailed", "Migration of '%{public}@' failed. Encountered error: %@", buf, 0x16u);

    }
  }

  _Block_object_dispose(v31, 8);
  if (!v15)
  {
    DRSRequestPersistentContainerForVersion(3, v6, 0, 1, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DPLogHandle_CoreData();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)v31 = 138543618;
      *(_QWORD *)&v31[4] = v6;
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 3;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MigrationSucceeded", "Migration of '%{public}@' to version %hu succeeded", v31, 0x12u);
    }

  }
  else
  {
LABEL_11:
    v20 = 0;
  }

  return v20;
}

void __53__DRSRequest_migrateRequestDataStoreAtPath_errorOut___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v28 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;
  v6 = v28;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          +[DRSRequest _requestWithRequestMO_ON_MOC_QUEUE:](DRSRequest, "_requestWithRequestMO_ON_MOC_QUEUE:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v29 = *MEMORY[0x1E0CB2D50];
            v30 = CFSTR("Failed to create request for requestMO");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v19);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(a1[6] + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = v20;

            goto LABEL_12;
          }
          v14 = v13;
          objc_msgSend(v13, "_configureRequestMO:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (v9)
          continue;
        break;
      }
    }

    v15 = (void *)a1[4];
    v23 = v6;
    objc_msgSend(v15, "save:", &v23);
    v16 = v23;

    v17 = *(_QWORD *)(a1[6] + 8);
    v6 = v16;
    v7 = *(id *)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v6;
LABEL_12:

  }
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (unint64_t)requestMCT
{
  return self->_requestMCT;
}

- (NSString)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
  objc_storeStrong((id *)&self->_logType, a3);
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
  objc_storeStrong((id *)&self->_logs, a3);
}

- (unint64_t)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(unint64_t)a3
{
  self->_requestState = a3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (unsigned)uploadAttemptCount
{
  return self->_uploadAttemptCount;
}

- (void)setUploadAttemptCount:(unsigned __int16)a3
{
  self->_uploadAttemptCount = a3;
}

- (BOOL)hasBeenCountedByTelemetry
{
  return self->_hasBeenCountedByTelemetry;
}

- (void)setHasBeenCountedByTelemetry:(BOOL)a3
{
  self->_hasBeenCountedByTelemetry = a3;
}

- (unsigned)decisionServerDecision
{
  return self->_decisionServerDecision;
}

- (void)setDecisionServerDecision:(unsigned __int8)a3
{
  self->_decisionServerDecision = a3;
}

- (NSString)ckRecordID
{
  return self->_ckRecordID;
}

- (BOOL)isExpedited
{
  return self->_isExpedited;
}

- (unint64_t)uploadID
{
  return self->_uploadID;
}

- (NSArray)submittedLogInfos
{
  return self->_submittedLogInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedLogInfos, 0);
  objc_storeStrong((id *)&self->_ckRecordID, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (id)fileURLs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DRSRequest filePaths](self, "filePaths", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)fileNames
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DRSRequest filePaths](self, "filePaths", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)filePaths
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DRSRequest logs](self, "logs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)targetContainerName
{
  return kDRSCloudKitContainerName;
}

- (id)fileAssets
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DRSRequest fileURLs](self, "fileURLs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)recordRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
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
  NSObject *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("DPLog"));
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject buildVariant](v6, "buildVariant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("buildVariant"));

    -[NSObject deviceCategory](v6, "deviceCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("deviceCategory"));

    -[NSObject deviceModel](v6, "deviceModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("deviceModel"));

    -[NSObject platformString](v6, "platformString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("platform"));

    -[DRSRequest build](self, "build");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("build"));

    -[DRSRequest teamID](self, "teamID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("teamID"));

    -[DRSRequest issueCategory](self, "issueCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("issueCategory"));

    -[DRSRequest issueDescription](self, "issueDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("issueDescription"));

    -[DRSRequest logType](self, "logType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("logType"));

    -[DRSRequest requestDate](self, "requestDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("requestDate"));

    -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("contextDictionaryData"));

    }
    -[DRSRequest fileAssets](self, "fileAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("fileAssets"));

    -[DRSRequest fileNames](self, "fileNames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("fileNames"));

    -[DRSRequest requestID](self, "requestID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("requestID"));

    DPLogHandle_CKRecord();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      -[DRSRequest requestID](self, "requestID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSRequest requestType](self, "requestType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v25;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKRecordCreation", "%{public, name=requestID}@ %{public, name=requestType}@", (uint8_t *)&v27, 0x16u);

    }
  }
  else
  {
    DPLogHandle_CKRecordError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFilePaths", "No file paths found", (uint8_t *)&v27, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)protoRequestDescription
{
  DRSProtoRequestDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v3 = objc_alloc_init(DRSProtoRequestDescription);
  -[DRSRequest teamID](self, "teamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRequestDescription setTeamId:](v3, "setTeamId:", v4);

  -[DRSRequest issueCategory](self, "issueCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRequestDescription setIssueCategory:](v3, "setIssueCategory:", v5);

  -[DRSRequest contextDictionaryData](self, "contextDictionaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRequestDescription setContextDictionaryData:](v3, "setContextDictionaryData:", v6);

  -[DRSRequest requestDate](self, "requestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[DRSProtoRequestDescription setRequestTime:](v3, "setRequestTime:", (unint64_t)v8);

  -[DRSRequest build](self, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRequestDescription setBuild:](v3, "setBuild:", v9);

  return v3;
}

- (id)protoFileDescriptions
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DRSRequest logs](self, "logs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138543618;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "fileDescription", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          DPLogHandle_CKRecord();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v12))
          {
            -[DRSRequest requestID](self, "requestID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = v13;
            v23 = 2114;
            v24 = v14;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoFileDescriptionFailure", "%{public, name=requestID}@ Failed to create description for path '%{public}@'", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)uploadRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  DRSProtoDiagnosticUploadRequest *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[DRSRequest requestState](self, "requestState") != 2)
  {
    DPLogHandle_CKInvernessError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v10))
      goto LABEL_12;
    -[DRSRequest debugDescription](self, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    v12 = "Tried to create an upload request for a request that was not in the middle of the upload flow (%{public}@)";
    goto LABEL_11;
  }
  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    DPLogHandle_CKInvernessError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v10))
      goto LABEL_12;
    -[DRSRequest debugDescription](self, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    v12 = "Tried to create an upload request for a request with no file: %{public}@";
    goto LABEL_11;
  }
  if (-[DRSRequest totalLogSizeBytes](self, "totalLogSizeBytes"))
  {
    -[DRSRequest protoRequestDescription](self, "protoRequestDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(DRSProtoDiagnosticUploadRequest);
    -[DRSProtoDiagnosticUploadRequest setRequestDescription:](v6, "setRequestDescription:", v5);
    -[DRSRequest issueDescription](self, "issueDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoDiagnosticUploadRequest setIssueDescription:](v6, "setIssueDescription:", v7);

    -[DRSRequest protoFileDescriptions](self, "protoFileDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSProtoDiagnosticUploadRequest setLogs:](v6, "setLogs:", v8);

    return v6;
  }
  DPLogHandle_CKInvernessError();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    -[DRSRequest debugDescription](self, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    v12 = "Tried to create an upload request for a request with no net file size: %{public}@";
LABEL_11:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadRequestCreationError", v12, (uint8_t *)&v13, 0xCu);

  }
LABEL_12:

  return 0;
}

- (DRSDecisionServerBatchRequest)pbBatchInstance
{
  return (DRSDecisionServerBatchRequest *)objc_alloc_init(DRSProtoDiagnosticUploadRequestBatch);
}

- (Class)pbBatchResponseClass
{
  return (Class)objc_opt_class();
}

- (NSString)functionName
{
  return (NSString *)CFSTR("shouldAllowDiagnosticUploadBatch");
}

- (void)updateToState:(uint64_t)a3 errorDescription:(uint64_t)a4 errorOut:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DBB92000, a2, a3, "On-receipt error encountered: %{public}@", a5, a6, a7, a8, 2u);
}

@end
