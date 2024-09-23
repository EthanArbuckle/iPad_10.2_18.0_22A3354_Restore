@implementation AWDSymptomsDiagnosticRemoteUpload

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSymptomsDiagnosticRemoteUpload;
  -[AWDSymptomsDiagnosticRemoteUpload dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRequestedTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_requestedTimestamp = a3;
}

- (void)setHasRequestedTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRequestedTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScheduledTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_scheduledTimestamp = a3;
}

- (void)setHasScheduledTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasScheduledTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (void)setRadarIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_radarIdentifier = a3;
}

- (void)setHasRadarIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRadarIdentifier
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setApnsMsgIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_apnsMsgIdentifier = a3;
}

- (void)setHasApnsMsgIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApnsMsgIdentifier
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setUrgency:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_urgency = a3;
}

- (void)setHasUrgency:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUrgency
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)preflightStatus
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_preflightStatus;
  else
    return 1;
}

- (void)setPreflightStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_preflightStatus = a3;
}

- (void)setHasPreflightStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPreflightStatus
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)preflightStatusAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1EA3B7288[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreflightStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CaseNotFound")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoRecordedPayloads")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PayloadsAllUnavailable")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PayloadsPartiallyMissing")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PayloadsFullyAvailable")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)consentStatus
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_consentStatus;
  else
    return 1;
}

- (void)setConsentStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_consentStatus = a3;
}

- (void)setHasConsentStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasConsentStatus
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)consentStatusAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1EA3B72B0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConsentStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConsentNotRequired")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConsentRequired")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConsentDenied")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConsentGranted")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)requestStatus
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_requestStatus;
  else
    return 1;
}

- (void)setRequestStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_requestStatus = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRequestStatus
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)requestStatusAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1EA3B72D0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UploadPending")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UploadFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UploadCompleted")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setExpectedFileCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_expectedFileCount = a3;
}

- (void)setHasExpectedFileCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExpectedFileCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)taskFileSizesCount
{
  return self->_taskFileSizes.count;
}

- (int64_t)taskFileSizes
{
  return self->_taskFileSizes.list;
}

- (void)clearTaskFileSizes
{
  PBRepeatedInt64Clear();
}

- (void)addTaskFileSize:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)taskFileSizeAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_taskFileSizes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_taskFileSizes = &self->_taskFileSizes;
  count = self->_taskFileSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_taskFileSizes->list[a3];
}

- (void)setTaskFileSizes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)taskStatusCount
{
  return self->_taskStatus.count;
}

- (int)taskStatus
{
  return self->_taskStatus.list;
}

- (void)clearTaskStatus
{
  PBRepeatedInt32Clear();
}

- (void)addTaskStatus:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)taskStatusAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_taskStatus;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_taskStatus = &self->_taskStatus;
  count = self->_taskStatus.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_taskStatus->list[a3];
}

- (void)setTaskStatus:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)taskStatusAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1EA3B72E8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UploadTaskPending")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UploadTaskCompleted")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UploadTaskError")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (unint64_t)taskRetryCountsCount
{
  return self->_taskRetryCounts.count;
}

- (int)taskRetryCounts
{
  return self->_taskRetryCounts.list;
}

- (void)clearTaskRetryCounts
{
  PBRepeatedInt32Clear();
}

- (void)addTaskRetryCount:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)taskRetryCountAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_taskRetryCounts;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_taskRetryCounts = &self->_taskRetryCounts;
  count = self->_taskRetryCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_taskRetryCounts->list[a3];
}

- (void)setTaskRetryCounts:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)taskHttpStatusCodesCount
{
  return self->_taskHttpStatusCodes.count;
}

- (int)taskHttpStatusCodes
{
  return self->_taskHttpStatusCodes.list;
}

- (void)clearTaskHttpStatusCodes
{
  PBRepeatedInt32Clear();
}

- (void)addTaskHttpStatusCode:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)taskHttpStatusCodeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_taskHttpStatusCodes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_taskHttpStatusCodes = &self->_taskHttpStatusCodes;
  count = self->_taskHttpStatusCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_taskHttpStatusCodes->list[a3];
}

- (void)setTaskHttpStatusCodes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)clearTaskErrorDomains
{
  -[NSMutableArray removeAllObjects](self->_taskErrorDomains, "removeAllObjects");
}

- (void)addTaskErrorDomain:(id)a3
{
  id v4;
  NSMutableArray *taskErrorDomains;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  taskErrorDomains = self->_taskErrorDomains;
  v8 = v4;
  if (!taskErrorDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_taskErrorDomains;
    self->_taskErrorDomains = v6;

    v4 = v8;
    taskErrorDomains = self->_taskErrorDomains;
  }
  -[NSMutableArray addObject:](taskErrorDomains, "addObject:", v4);

}

- (unint64_t)taskErrorDomainsCount
{
  return -[NSMutableArray count](self->_taskErrorDomains, "count");
}

- (id)taskErrorDomainAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_taskErrorDomains, "objectAtIndex:", a3);
}

+ (Class)taskErrorDomainType
{
  return (Class)objc_opt_class();
}

- (unint64_t)taskErrorCodesCount
{
  return self->_taskErrorCodes.count;
}

- (int64_t)taskErrorCodes
{
  return self->_taskErrorCodes.list;
}

- (void)clearTaskErrorCodes
{
  PBRepeatedInt64Clear();
}

- (void)addTaskErrorCode:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)taskErrorCodeAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_taskErrorCodes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_taskErrorCodes = &self->_taskErrorCodes;
  count = self->_taskErrorCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_taskErrorCodes->list[a3];
}

- (void)setTaskErrorCodes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)primaryNetworkObservedOnCompletionsCount
{
  return self->_primaryNetworkObservedOnCompletions.count;
}

- (int)primaryNetworkObservedOnCompletions
{
  return self->_primaryNetworkObservedOnCompletions.list;
}

- (void)clearPrimaryNetworkObservedOnCompletions
{
  PBRepeatedInt32Clear();
}

- (void)addPrimaryNetworkObservedOnCompletion:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)primaryNetworkObservedOnCompletionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_primaryNetworkObservedOnCompletions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  count = self->_primaryNetworkObservedOnCompletions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_primaryNetworkObservedOnCompletions->list[a3];
}

- (void)setPrimaryNetworkObservedOnCompletions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)primaryNetworkObservedOnCompletionsAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 2)
  {
    if (a3 == 3)
      return CFSTR("PrimaryNetworkWiredEthernet");
    if (a3 == 128)
      return CFSTR("PrimaryNetworkNone");
    goto LABEL_10;
  }
  if (a3 == 1)
    return CFSTR("PrimaryNetworkWiFi");
  if (a3 != 2)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("PrimaryNetworkCellular");
  return v3;
}

- (int)StringAsPrimaryNetworkObservedOnCompletions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrimaryNetworkWiFi")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrimaryNetworkCellular")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrimaryNetworkWiredEthernet")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PrimaryNetworkNone")))
  {
    v4 = 128;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsDiagnosticRemoteUpload;
  -[AWDSymptomsDiagnosticRemoteUpload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDSymptomsDiagnosticRemoteUpload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSString *caseIdentifier;
  __int16 v7;
  void *v8;
  void *v9;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_taskStatus;
  void *v11;
  unint64_t v12;
  unsigned int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSMutableArray *taskErrorDomains;
  void *v18;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_primaryNetworkObservedOnCompletions;
  void *v20;
  unint64_t i;
  int v22;
  __CFString *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  __CFString *v31;
  unsigned int v32;
  __CFString *v33;
  unsigned int v34;
  __CFString *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_requestedTimestamp);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("requestedTimestamp"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_scheduledTimestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scheduledTimestamp"));

  }
LABEL_5:
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier)
    objc_msgSend(v3, "setObject:forKey:", caseIdentifier, CFSTR("caseIdentifier"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_radarIdentifier);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("radarIdentifier"));

    v7 = (__int16)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_46;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_apnsMsgIdentifier);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("apnsMsgIdentifier"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_10:
    if ((v7 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_urgency);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("urgency"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_47:
  v30 = self->_preflightStatus - 1;
  if (v30 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_preflightStatus);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_1EA3B7288[v30];
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("preflightStatus"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_51:
  v32 = self->_consentStatus - 1;
  if (v32 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_consentStatus);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = off_1EA3B72B0[v32];
  }
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("consentStatus"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_55:
  v34 = self->_requestStatus - 1;
  if (v34 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestStatus);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_1EA3B72D0[v34];
  }
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("requestStatus"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_expectedFileCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("expectedFileCount"));

  }
LABEL_15:
  PBRepeatedInt64NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("taskFileSize"));

  p_taskStatus = &self->_taskStatus;
  if (self->_taskStatus.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_taskStatus.count)
    {
      v12 = 0;
      do
      {
        v13 = p_taskStatus->list[v12] - 1;
        if (v13 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_taskStatus->list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_1EA3B72E8[v13];
        }
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < self->_taskStatus.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("taskStatus"));

  }
  PBRepeatedInt32NSArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("taskRetryCount"));

  PBRepeatedInt32NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("taskHttpStatusCode"));

  taskErrorDomains = self->_taskErrorDomains;
  if (taskErrorDomains)
    objc_msgSend(v3, "setObject:forKey:", taskErrorDomains, CFSTR("taskErrorDomain"));
  PBRepeatedInt64NSArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("taskErrorCode"));

  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  if (self->_primaryNetworkObservedOnCompletions.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_primaryNetworkObservedOnCompletions->count)
    {
      for (i = 0; i < p_primaryNetworkObservedOnCompletions->count; ++i)
      {
        v22 = p_primaryNetworkObservedOnCompletions->list[i];
        if (v22 > 2)
        {
          if (v22 == 3)
          {
            v23 = CFSTR("PrimaryNetworkWiredEthernet");
            goto LABEL_38;
          }
          if (v22 != 128)
            goto LABEL_35;
          v23 = CFSTR("PrimaryNetworkNone");
        }
        else
        {
          if (v22 == 1)
          {
            v23 = CFSTR("PrimaryNetworkWiFi");
            goto LABEL_38;
          }
          if (v22 != 2)
          {
LABEL_35:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_primaryNetworkObservedOnCompletions->list[i]);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
          v23 = CFSTR("PrimaryNetworkCellular");
        }
LABEL_38:
        objc_msgSend(v20, "addObject:", v23);

      }
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("primaryNetworkObservedOnCompletion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsDiagnosticRemoteUploadReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_primaryNetworkObservedOnCompletions;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_caseIdentifier)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_46;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_taskFileSizes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v7;
    }
    while (v7 < self->_taskFileSizes.count);
  }
  if (self->_taskStatus.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_taskStatus.count);
  }
  if (self->_taskRetryCounts.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_taskRetryCounts.count);
  }
  if (self->_taskHttpStatusCodes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_taskHttpStatusCodes.count);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_taskErrorDomains;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if (self->_taskErrorCodes.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v16;
    }
    while (v16 < self->_taskErrorCodes.count);
  }
  p_primaryNetworkObservedOnCompletions = &self->_primaryNetworkObservedOnCompletions;
  if (p_primaryNetworkObservedOnCompletions->count)
  {
    v18 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v18;
    }
    while (v18 < p_primaryNetworkObservedOnCompletions->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t ii;
  unint64_t v26;
  unint64_t v27;
  uint64_t jj;
  _QWORD *v29;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[22] = self->_timestamp;
    *((_WORD *)v4 + 114) |= 8u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[20] = self->_requestedTimestamp;
  *((_WORD *)v4 + 114) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[21] = self->_scheduledTimestamp;
    *((_WORD *)v4 + 114) |= 4u;
  }
LABEL_5:
  v29 = v4;
  if (self->_caseIdentifier)
  {
    objc_msgSend(v4, "setCaseIdentifier:");
    v4 = v29;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 51) = self->_radarIdentifier;
    *((_WORD *)v4 + 114) |= 0x80u;
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_49;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  v4[19] = self->_apnsMsgIdentifier;
  *((_WORD *)v4 + 114) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 56) = self->_urgency;
  *((_WORD *)v4 + 114) |= 0x200u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 50) = self->_preflightStatus;
  *((_WORD *)v4 + 114) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x100) == 0)
      goto LABEL_13;
LABEL_52:
    *((_DWORD *)v4 + 52) = self->_requestStatus;
    *((_WORD *)v4 + 114) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_51:
  *((_DWORD *)v4 + 48) = self->_consentStatus;
  *((_WORD *)v4 + 114) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
    goto LABEL_52;
LABEL_13:
  if ((v6 & 0x20) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 49) = self->_expectedFileCount;
    *((_WORD *)v4 + 114) |= 0x20u;
  }
LABEL_15:
  if (-[AWDSymptomsDiagnosticRemoteUpload taskFileSizesCount](self, "taskFileSizesCount"))
  {
    objc_msgSend(v29, "clearTaskFileSizes");
    v7 = -[AWDSymptomsDiagnosticRemoteUpload taskFileSizesCount](self, "taskFileSizesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(v29, "addTaskFileSize:", -[AWDSymptomsDiagnosticRemoteUpload taskFileSizeAtIndex:](self, "taskFileSizeAtIndex:", i));
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload taskStatusCount](self, "taskStatusCount"))
  {
    objc_msgSend(v29, "clearTaskStatus");
    v10 = -[AWDSymptomsDiagnosticRemoteUpload taskStatusCount](self, "taskStatusCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v29, "addTaskStatus:", -[AWDSymptomsDiagnosticRemoteUpload taskStatusAtIndex:](self, "taskStatusAtIndex:", j));
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload taskRetryCountsCount](self, "taskRetryCountsCount"))
  {
    objc_msgSend(v29, "clearTaskRetryCounts");
    v13 = -[AWDSymptomsDiagnosticRemoteUpload taskRetryCountsCount](self, "taskRetryCountsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v29, "addTaskRetryCount:", -[AWDSymptomsDiagnosticRemoteUpload taskRetryCountAtIndex:](self, "taskRetryCountAtIndex:", k));
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload taskHttpStatusCodesCount](self, "taskHttpStatusCodesCount"))
  {
    objc_msgSend(v29, "clearTaskHttpStatusCodes");
    v16 = -[AWDSymptomsDiagnosticRemoteUpload taskHttpStatusCodesCount](self, "taskHttpStatusCodesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v29, "addTaskHttpStatusCode:", -[AWDSymptomsDiagnosticRemoteUpload taskHttpStatusCodeAtIndex:](self, "taskHttpStatusCodeAtIndex:", m));
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload taskErrorDomainsCount](self, "taskErrorDomainsCount"))
  {
    objc_msgSend(v29, "clearTaskErrorDomains");
    v19 = -[AWDSymptomsDiagnosticRemoteUpload taskErrorDomainsCount](self, "taskErrorDomainsCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
      {
        -[AWDSymptomsDiagnosticRemoteUpload taskErrorDomainAtIndex:](self, "taskErrorDomainAtIndex:", n);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addTaskErrorDomain:", v22);

      }
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload taskErrorCodesCount](self, "taskErrorCodesCount"))
  {
    objc_msgSend(v29, "clearTaskErrorCodes");
    v23 = -[AWDSymptomsDiagnosticRemoteUpload taskErrorCodesCount](self, "taskErrorCodesCount");
    if (v23)
    {
      v24 = v23;
      for (ii = 0; ii != v24; ++ii)
        objc_msgSend(v29, "addTaskErrorCode:", -[AWDSymptomsDiagnosticRemoteUpload taskErrorCodeAtIndex:](self, "taskErrorCodeAtIndex:", ii));
    }
  }
  if (-[AWDSymptomsDiagnosticRemoteUpload primaryNetworkObservedOnCompletionsCount](self, "primaryNetworkObservedOnCompletionsCount"))
  {
    objc_msgSend(v29, "clearPrimaryNetworkObservedOnCompletions");
    v26 = -[AWDSymptomsDiagnosticRemoteUpload primaryNetworkObservedOnCompletionsCount](self, "primaryNetworkObservedOnCompletionsCount");
    if (v26)
    {
      v27 = v26;
      for (jj = 0; jj != v27; ++jj)
        objc_msgSend(v29, "addPrimaryNetworkObservedOnCompletion:", -[AWDSymptomsDiagnosticRemoteUpload primaryNetworkObservedOnCompletionAtIndex:](self, "primaryNetworkObservedOnCompletionAtIndex:", jj));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 176) = self->_timestamp;
    *(_WORD *)(v5 + 228) |= 8u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 160) = self->_requestedTimestamp;
  *(_WORD *)(v5 + 228) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 168) = self->_scheduledTimestamp;
    *(_WORD *)(v5 + 228) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_caseIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 204) = self->_radarIdentifier;
    *(_WORD *)(v6 + 228) |= 0x80u;
    v10 = (__int16)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_7:
      if ((v10 & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 152) = self->_apnsMsgIdentifier;
  *(_WORD *)(v6 + 228) |= 1u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_8:
    if ((v10 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 224) = self->_urgency;
  *(_WORD *)(v6 + 228) |= 0x200u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_9:
    if ((v10 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 200) = self->_preflightStatus;
  *(_WORD *)(v6 + 228) |= 0x40u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_10:
    if ((v10 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 192) = self->_consentStatus;
  *(_WORD *)(v6 + 228) |= 0x10u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_11:
    if ((v10 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  *(_DWORD *)(v6 + 208) = self->_requestStatus;
  *(_WORD *)(v6 + 228) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 196) = self->_expectedFileCount;
    *(_WORD *)(v6 + 228) |= 0x20u;
  }
LABEL_13:
  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_taskErrorDomains;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v6, "addTaskErrorDomain:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *caseIdentifier;
  __int16 v8;
  NSMutableArray *taskErrorDomains;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 114);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 22))
      goto LABEL_63;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestedTimestamp != *((_QWORD *)v4 + 20))
      goto LABEL_63;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_scheduledTimestamp != *((_QWORD *)v4 + 21))
      goto LABEL_63;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_63;
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:"))
    {
LABEL_63:
      IsEqual = 0;
      goto LABEL_64;
    }
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 114);
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_radarIdentifier != *((_DWORD *)v4 + 51))
      goto LABEL_63;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_apnsMsgIdentifier != *((_QWORD *)v4 + 19))
      goto LABEL_63;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 114) & 0x200) == 0 || self->_urgency != *((_DWORD *)v4 + 56))
      goto LABEL_63;
  }
  else if ((*((_WORD *)v4 + 114) & 0x200) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_preflightStatus != *((_DWORD *)v4 + 50))
      goto LABEL_63;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_consentStatus != *((_DWORD *)v4 + 48))
      goto LABEL_63;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 114) & 0x100) == 0 || self->_requestStatus != *((_DWORD *)v4 + 52))
      goto LABEL_63;
  }
  else if ((*((_WORD *)v4 + 114) & 0x100) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_expectedFileCount != *((_DWORD *)v4 + 49))
      goto LABEL_63;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_63;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_63;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_63;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_63;
  taskErrorDomains = self->_taskErrorDomains;
  if ((unint64_t)taskErrorDomains | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](taskErrorDomains, "isEqual:"))
      goto LABEL_63;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_63;
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_64:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  __int16 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
    v4 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_requestedTimestamp;
  if ((has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_scheduledTimestamp;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSString hash](self->_caseIdentifier, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    v9 = 2654435761 * self->_radarIdentifier;
    if ((v8 & 1) != 0)
    {
LABEL_10:
      v10 = 2654435761u * self->_apnsMsgIdentifier;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else
  {
    v9 = 0;
    if ((v8 & 1) != 0)
      goto LABEL_10;
  }
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v11 = 2654435761 * self->_urgency;
    if ((v8 & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((v8 & 0x40) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_preflightStatus;
    if ((v8 & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  v12 = 0;
  if ((v8 & 0x10) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_consentStatus;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_14;
LABEL_21:
    v14 = 0;
    if ((v8 & 0x20) != 0)
      goto LABEL_15;
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
LABEL_20:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_21;
LABEL_14:
  v14 = 2654435761 * self->_requestStatus;
  if ((v8 & 0x20) == 0)
    goto LABEL_22;
LABEL_15:
  v15 = 2654435761 * self->_expectedFileCount;
LABEL_23:
  v16 = v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ PBRepeatedInt64Hash();
  v17 = v16 ^ PBRepeatedInt32Hash() ^ v7;
  v18 = PBRepeatedInt32Hash();
  v19 = v18 ^ PBRepeatedInt32Hash();
  v20 = v17 ^ v19 ^ -[NSMutableArray hash](self->_taskErrorDomains, "hash");
  v21 = PBRepeatedInt64Hash();
  return v20 ^ v21 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;
  __int16 v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t n;
  uint64_t v25;
  uint64_t v26;
  uint64_t ii;
  uint64_t v28;
  uint64_t v29;
  uint64_t jj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t *)a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 114);
  if ((v6 & 8) != 0)
  {
    self->_timestamp = v4[22];
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 114);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_requestedTimestamp = v4[20];
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 114) & 4) != 0)
  {
LABEL_4:
    self->_scheduledTimestamp = v4[21];
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_5:
  if (v4[23])
    -[AWDSymptomsDiagnosticRemoteUpload setCaseIdentifier:](self, "setCaseIdentifier:");
  v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x80) != 0)
  {
    self->_radarIdentifier = *((_DWORD *)v5 + 51);
    *(_WORD *)&self->_has |= 0x80u;
    v7 = *((_WORD *)v5 + 114);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_46;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_apnsMsgIdentifier = v5[19];
  *(_WORD *)&self->_has |= 1u;
  v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x200) == 0)
  {
LABEL_10:
    if ((v7 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  self->_urgency = *((_DWORD *)v5 + 56);
  *(_WORD *)&self->_has |= 0x200u;
  v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x40) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  self->_preflightStatus = *((_DWORD *)v5 + 50);
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  self->_consentStatus = *((_DWORD *)v5 + 48);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = *((_WORD *)v5 + 114);
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_49:
  self->_requestStatus = *((_DWORD *)v5 + 52);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v5 + 114) & 0x20) != 0)
  {
LABEL_14:
    self->_expectedFileCount = *((_DWORD *)v5 + 49);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_15:
  v8 = objc_msgSend(v5, "taskFileSizesCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskFileSize:](self, "addTaskFileSize:", objc_msgSend(v5, "taskFileSizeAtIndex:", i));
  }
  v11 = objc_msgSend(v5, "taskStatusCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskStatus:](self, "addTaskStatus:", objc_msgSend(v5, "taskStatusAtIndex:", j));
  }
  v14 = objc_msgSend(v5, "taskRetryCountsCount");
  if (v14)
  {
    v15 = v14;
    for (k = 0; k != v15; ++k)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskRetryCount:](self, "addTaskRetryCount:", objc_msgSend(v5, "taskRetryCountAtIndex:", k));
  }
  v17 = objc_msgSend(v5, "taskHttpStatusCodesCount");
  if (v17)
  {
    v18 = v17;
    for (m = 0; m != v18; ++m)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskHttpStatusCode:](self, "addTaskHttpStatusCode:", objc_msgSend(v5, "taskHttpStatusCodeAtIndex:", m));
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = (id)v5[27];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v22; ++n)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        -[AWDSymptomsDiagnosticRemoteUpload addTaskErrorDomain:](self, "addTaskErrorDomain:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * n), (_QWORD)v31);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v22);
  }

  v25 = objc_msgSend(v5, "taskErrorCodesCount");
  if (v25)
  {
    v26 = v25;
    for (ii = 0; ii != v26; ++ii)
      -[AWDSymptomsDiagnosticRemoteUpload addTaskErrorCode:](self, "addTaskErrorCode:", objc_msgSend(v5, "taskErrorCodeAtIndex:", ii, (_QWORD)v31));
  }
  v28 = objc_msgSend(v5, "primaryNetworkObservedOnCompletionsCount", (_QWORD)v31);
  if (v28)
  {
    v29 = v28;
    for (jj = 0; jj != v29; ++jj)
      -[AWDSymptomsDiagnosticRemoteUpload addPrimaryNetworkObservedOnCompletion:](self, "addPrimaryNetworkObservedOnCompletion:", objc_msgSend(v5, "primaryNetworkObservedOnCompletionAtIndex:", jj));
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)requestedTimestamp
{
  return self->_requestedTimestamp;
}

- (unint64_t)scheduledTimestamp
{
  return self->_scheduledTimestamp;
}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_caseIdentifier, a3);
}

- (unsigned)radarIdentifier
{
  return self->_radarIdentifier;
}

- (unint64_t)apnsMsgIdentifier
{
  return self->_apnsMsgIdentifier;
}

- (unsigned)urgency
{
  return self->_urgency;
}

- (int)expectedFileCount
{
  return self->_expectedFileCount;
}

- (NSMutableArray)taskErrorDomains
{
  return self->_taskErrorDomains;
}

- (void)setTaskErrorDomains:(id)a3
{
  objc_storeStrong((id *)&self->_taskErrorDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskErrorDomains, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
}

@end
