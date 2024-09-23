@implementation ADSegmentDataManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ADSegmentDataManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_3 != -1)
    dispatch_once(&sharedInstance__onceToken_3, block);
  return (id)sharedInstance__instance_3;
}

void __38__ADSegmentDataManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_3;
  sharedInstance__instance_3 = (uint64_t)v0;

}

- (BOOL)segmentRetrievalInProgress
{
  return self->_pendingJingleRequestToken != 0;
}

- (BOOL)shouldSendSegmentRequest:(id)a3 ignoreTimestamps:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDSIDRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ADSegmentDataManager segmentRetrievalInProgress](self, "segmentRetrievalInProgress"))
  {
    if (objc_msgSend(v8, "isPlaceholderAccount"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping segment retrieval request. DSID %@ is not logged into iTunes."), objc_opt_class(), v6);
      goto LABEL_5;
    }
    objc_msgSend(v8, "DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

    if ((v13 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = objc_opt_class();
      objc_msgSend(v8, "DSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("[%@]: Skipping segment retrieval request. Current active record DSID %@ does not match request DSID %@."), v18, v9, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reconcileOperations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSet:", 1);

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Forcing segment retrieval request for DSID %@ because ADReconcileOp_RetrieveSegments flag is set"), objc_opt_class(), v6);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Forcing segment retrieval request for DSID %@ because 'ignoreTimestamps' was specified."), objc_opt_class(), v6);
    }
    else
    {
      v20 = objc_msgSend(v8, "segmentDataTimestamp");
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "segmentRetrievalInterval") + v20;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 - objc_msgSend(v23, "AD_toServerTime");

      if ((int)v24 >= 1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping segment retrieval request. Segment data for DSID %@ has not expired."), objc_opt_class(), v6);
        goto LABEL_5;
      }
      if (objc_msgSend(v8, "segmentDataTimestamp")
        || (objc_msgSend(v8, "segmentData"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, v25))
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        v27 = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(int)v24);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "AD_doubleDateTimeAsString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@]: Segments for DSID %@ expired %d seconds ago (%@). Asking Jingle for new segments."), v27, v6, v24, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Retrieving segment data for DSID %@ because we don't have any."), objc_opt_class(), v6);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
LABEL_15:
    v10 = 1;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping segment retrieval request. Request for %@ already in-flight."), objc_opt_class(), v6);
LABEL_5:
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();
LABEL_6:
  v10 = 0;
LABEL_7:

  return v10;
}

- (id)checkTokenAndDSID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self->_pendingJingleRequestToken);

  if ((v6 & 1) == 0)
  {
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = objc_opt_class();
    objc_msgSend(v4, "token");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@]: Segment update response has token %@, but was expecting token %@."), v15, v16, self->_pendingJingleRequestToken);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithAdCode:andDescription:", 4, v17);
LABEL_6:

    objc_msgSend(v12, "AD_Log:", CFSTR("iAdIDLogging"));
    goto LABEL_7;
  }
  objc_msgSend(v4, "DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeDSIDRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    v18 = objc_alloc(MEMORY[0x24BDD1540]);
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = objc_opt_class();
    objc_msgSend(v4, "DSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeDSIDRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "DSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("[%@]: Segment update response has DSID %@, but current DSID is %@. Ignoring."), v20, v16, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v18, "initWithAdCode:andDescription:", 5, v23);

    goto LABEL_6;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (void)retrieveSegmentDataIgnoringTimestamps:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5
{
  -[ADSegmentDataManager retrieveSegmentData:forceSegments:ignoreTimestamps:completionHandler:](self, "retrieveSegmentData:forceSegments:ignoreTimestamps:completionHandler:", a3, a4, 1, a5);
}

- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5
{
  -[ADSegmentDataManager retrieveSegmentData:forceSegments:ignoreTimestamps:completionHandler:](self, "retrieveSegmentData:forceSegments:ignoreTimestamps:completionHandler:", a3, a4, 0, a5);
}

- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 ignoreTimestamps:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *pendingJingleRequestToken;
  void *v19;
  unsigned int v20;
  void *v21;
  int v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeDSIDRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "BOOLForKey:", CFSTR("ForceSegmentDataRetrieval")))
  {
    v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("0"));

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: The Force Segment Data Retrieval switch is enabled - overriding forceSegments parameter."), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      _ADLog();

      +[ADJingleRequestManager sharedInstance](ADJingleRequestManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __93__ADSegmentDataManager_retrieveSegmentData_forceSegments_ignoreTimestamps_completionHandler___block_invoke;
      v23[3] = &unk_24D710D40;
      v23[4] = self;
      v24 = v12;
      v25 = v10;
      objc_msgSend(v16, "makeSegmentRequest:forceSegments:withCompletion:", v9, 1, v23);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      pendingJingleRequestToken = self->_pendingJingleRequestToken;
      self->_pendingJingleRequestToken = v17;

      goto LABEL_11;
    }
  }
  else
  {

  }
  if (-[ADSegmentDataManager shouldSendSegmentRequest:ignoreTimestamps:](self, "shouldSendSegmentRequest:ignoreTimestamps:", v9, v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Forcing 'ioflag = 1'."), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v12, "isRestrictedByApple");
  v20 = objc_msgSend(v12, "accountAgeUnknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: The current account is: EDU: %d. Managed: %d. U13: %d. T13: %d. U18: %d. Unknown Age: %d."), objc_opt_class(), objc_msgSend(v19, "educationModeEnabled"), objc_msgSend(v19, "isManagedAppleID"), objc_msgSend(v12, "accountIsU13"), objc_msgSend(v12, "accountIsT13"), objc_msgSend(v12, "accountIsU18"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(v19, "setIdentifierForAdvertisingAllowed:", (v22 | v20) ^ 1);
  if (v10)
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

LABEL_11:
}

uint64_t __93__ADSegmentDataManager_retrieveSegmentData_forceSegments_ignoreTimestamps_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleJingleSegmentResponse:activeRecord:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleJingleSegmentResponse:(id)a3 activeRecord:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, uint64_t))a5;
  v11 = (void *)MEMORY[0x219A08150]();
  if (v8)
  {
    objc_msgSend(v8, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (v10)
      {
        objc_msgSend(v8, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v13, 1);

      }
      -[ADSegmentDataManager setPendingJingleRequestToken:](self, "setPendingJingleRequestToken:", 0);
      v14 = 0;
      goto LABEL_11;
    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = objc_opt_class();
    objc_msgSend(v8, "DSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Received segment update response for DSID %@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADSegmentDataManager checkTokenAndDSID:](self, "checkTokenAndDSID:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[ADSegmentDataManager setPendingJingleRequestToken:](self, "setPendingJingleRequestToken:", 0);
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData] Error making segment request: %@"), objc_opt_class(), v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      if (!v10)
        goto LABEL_11;
LABEL_10:
      v10[2](v10, v14, 1);
      goto LABEL_11;
    }
    objc_msgSend(v8, "responseBody");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v31 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Segment update returned empty response body. Segments not updated."), objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v31, "initWithAdCode:andDescription:", 3, v32);

      objc_msgSend(v14, "AD_Log:", CFSTR("iAdIDLogging"));
      if (!v10)
        goto LABEL_11;
      goto LABEL_10;
    }
    v23 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v8, "responseBody");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v23, "JSONObjectWithData:options:error:", v24, 0, &v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v48;

    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = objc_opt_class();
    if (v14)
    {
      v28 = objc_msgSend(v14, "code");
      objc_msgSend(v14, "localizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Error %ld decoding segment update response: %@"), v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      if (!v10)
      {
LABEL_31:

        goto LABEL_11;
      }
LABEL_15:
      v10[2](v10, v14, 1);
      goto LABEL_31;
    }
    objc_msgSend(v8, "DSID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "AD_jsonString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Successfully decoded segment update response for DSID %@:\n%@"), v27, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (!v9)
    {
      v38 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("activeRecord == nil. Please file a Radar!"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v38, "initWithAdCode:andDescription:", 13, v39);

      v40 = (void *)MEMORY[0x24BDD17C8];
      v41 = objc_opt_class();
      objc_msgSend(v14, "localizedDescription");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: %@"), v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      if (!v10)
        goto LABEL_31;
      goto LABEL_15;
    }
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("status"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "intValue");

    if ((_DWORD)v37 != 1602)
    {
      if ((_DWORD)v37 == 1601)
      {
        if (objc_msgSend(v9, "lastJingleAccountStatus") == 1 && objc_msgSend(v9, "accountAgeUnknown"))
          objc_msgSend(v9, "setAccountAgeUnknown:", 0);
        objc_msgSend(v9, "setLastJingleAccountStatus:", 1);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSegmentDataTimestamp:", objc_msgSend(v44, "AD_toServerTime"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: The Jingle Weak Token for this user has expired. No action is possible by iAd, the user must log into the account."), objc_opt_class());
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        if (v10)
          v10[2](v10, 0, 1);
        goto LABEL_30;
      }
      if ((_DWORD)v37)
      {
        if ((v37 & 0x80000000) != 0)
        {
          v46 = objc_alloc(MEMORY[0x24BDD1540]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Jingle response code %d indicates a malformed request. Please file a Radar!"), objc_opt_class(), v37);
        }
        else
        {
          objc_msgSend(v9, "setLastJingleAccountStatus:", -1);
          v46 = objc_alloc(MEMORY[0x24BDD1540]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Unhandled Jingle response code %d. Please file a Radar!"), objc_opt_class(), v37);
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v46, "initWithAdCode:andDescription:", 3, v47);

        objc_msgSend(v14, "AD_Log:", CFSTR("iAdIDLogging"));
        if (!v10)
          goto LABEL_31;
        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "setLastJingleAccountStatus:", 0);
    -[ADSegmentDataManager handleSuccessfulJingleSegmentResponse:dsidRecord:completionHandler:](self, "handleSuccessfulJingleSegmentResponse:dsidRecord:completionHandler:", v25, v9, v10);
LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  v15 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Segment update returned nil request. An update was not even attempted."), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v15, "initWithAdCode:andDescription:", 11, v16);

  objc_msgSend(v14, "AD_Log:", CFSTR("iAdIDLogging"));
  -[ADSegmentDataManager setPendingJingleRequestToken:](self, "setPendingJingleRequestToken:", 0);
  if (v10)
    v10[2](v10, v14, 0);
LABEL_11:

  objc_autoreleasePoolPop(v11);
}

- (BOOL)verifyGenderInSegmentData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("it"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("14"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("17"));
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("18"));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v6 || v7 || v8)
        {
          if (v6 || !(v7 | v8))
          {
            v11 = (void *)MEMORY[0x24BDD17C8];
            v12 = objc_opt_class();
            if (!v6 || v7 || v9)
            {
              objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]: Both old and new gender data is present in segmentData. This is an error."), v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              _ADLog();

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Demographic data is: %@"), objc_opt_class(), v5);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              _ADLog();
              v10 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]: Only old gender data present."), v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Only new gender data present."), objc_opt_class());
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: No gender data present."), objc_opt_class());
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();
        v10 = 1;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: demographicData returned is not a dictionary!"), objc_opt_class(), v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: %@ key not present in segmentData"), objc_opt_class(), CFSTR("dm"));
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v10 = 1;
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: %@ key not present in segmentData"), objc_opt_class(), CFSTR("it"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();
  v10 = 1;
LABEL_22:

  return v10;
}

- (void)handleSuccessfulJingleSegmentResponse:(id)a3 dsidRecord:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  int v60;
  const __CFString *v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  ADSegmentDataManager *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  int v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *context;
  id v93;
  void *v94;
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[2];
  _QWORD v100[4];

  v100[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v93 = a5;
  context = (void *)MEMORY[0x219A08150]();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("last-served"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer()
    && (objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("adForceConsumerStatus")),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 0;
    v13 = 1;
  }
  else
  {
    v12 = objc_msgSend(v8, "isRestrictedByApple");
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v90 = v9;
  v91 = v7;
  v94 = v14;
  if (v12)
  {
    if ((objc_msgSend(v14, "isManagedAppleID") & 1) == 0)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      v17 = objc_opt_class();
      objc_msgSend(v8, "DSID");
      v18 = v15;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: %@ is a restricted account, ignoring segments from Jingle."), v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v15 = v18;
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSegmentDataTimestamp:", objc_msgSend(v26, "AD_toServerTime"));

    if (objc_msgSend(v15, "isPersonalizedAdsEnabled"))
    {
      objc_msgSend(v8, "setLastSegmentServedTimestamp:", objc_msgSend(v8, "segmentDataTimestamp"));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Segments have changed for opted-in user. Updating lastSegmentServedTimestamp to %d"), objc_opt_class(), objc_msgSend(v8, "lastSegmentServedTimestamp"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Ignoring segment change for opted-out user."), objc_opt_class(), v88);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("payload"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if (-[ADSegmentDataManager verifyGenderInSegmentData:](self, "verifyGenderInSegmentData:", v28))
      {
        v96 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v28, 0, &v96);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v96;
        v31 = (void *)MEMORY[0x24BDD17C8];
        if (v30)
        {
          v32 = objc_opt_class();
          v33 = objc_msgSend(v30, "code");
          objc_msgSend(v30, "localizedDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Error %ld decoding segment dictionary %@: %@"), v32, v33, v28, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog();

          v36 = (void *)MEMORY[0x24BDD17C8];
          v37 = objc_opt_class();
          v38 = objc_msgSend(v30, "code");
          objc_msgSend(v30, "localizedDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v38;
          v7 = v91;
          objc_msgSend(v36, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Error %ld decoding segment dictionary %@: %@"), v37, v89, v28, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          ADSimulateCrash();
        }
        else
        {
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v29, 4);
          objc_msgSend(v8, "setSegmentData:", v40);
        }

      }
      else
      {
        v44 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "DSID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("For DSID: %@ both old and new gender data is present in segmentData: %@. This is an error."), v45, v28);
        v30 = (id)objc_claimAutoreleasedReturnValue();

        ADSimulateCrash();
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      v42 = objc_opt_class();
      objc_msgSend(v8, "DSID");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Jingle did not return segment payload for DSID %@"), v42, v30);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    v15 = v94;
    goto LABEL_23;
  }
  objc_msgSend(v8, "setLastSegmentServedTimestamp:", objc_msgSend(v9, "intValue"));
  v21 = objc_msgSend(v8, "segmentDataTimestamp");
  if (v21 < (int)objc_msgSend(v8, "lastSegmentServedTimestamp"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ retrieveSegmentData]: Overriding unchanged segments - local segment timestamp (%d) is older than last-served timestamp (%d)"), objc_opt_class(), objc_msgSend(v8, "segmentDataTimestamp"), objc_msgSend(v8, "lastSegmentServedTimestamp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v8, "DSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3221225472;
    v97[2] = __91__ADSegmentDataManager_handleSuccessfulJingleSegmentResponse_dsidRecord_completionHandler___block_invoke;
    v97[3] = &unk_24D710D68;
    v24 = v93;
    v98 = v93;
    -[ADSegmentDataManager retrieveSegmentData:forceSegments:completionHandler:](self, "retrieveSegmentData:forceSegments:completionHandler:", v23, 1, v97);

    v25 = v98;
    goto LABEL_39;
  }
LABEL_23:
  if (v13)
  {
    objc_msgSend(v8, "setAccountIsU13:", 0);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("t13flag"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountIsT13:", (int)objc_msgSend(v46, "intValue") > 0);

    objc_msgSend(v8, "setAccountIsU18:", 0);
    objc_msgSend(v8, "setAccountAgeUnknown:", 0);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("u13flag"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountIsU13:", (int)objc_msgSend(v47, "intValue") > 0);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("t13flag"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountIsT13:", (int)objc_msgSend(v48, "intValue") > 0);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("u18flag"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountIsU18:", (int)objc_msgSend(v49, "intValue") > 0);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("no-segment"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountAgeUnknown:", objc_msgSend(v50, "BOOLValue"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: The current account is: EDU: %d. Managed: %d. U13: %d. T13: %d. U18: %d. Unknown Age: %d."), objc_opt_class(), objc_msgSend(v15, "educationModeEnabled"), objc_msgSend(v15, "isManagedAppleID"), objc_msgSend(v8, "accountIsU13"), objc_msgSend(v8, "accountIsT13"), objc_msgSend(v8, "accountIsU18"), objc_msgSend(v8, "accountAgeUnknown"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v52 = 0;
  v24 = v93;
  if ((v12 & 1) == 0)
  {
    if ((objc_msgSend(v8, "accountIsU13", 0) & 1) != 0 || (objc_msgSend(v8, "accountIsU18") & 1) != 0)
      v52 = 0;
    else
      v52 = objc_msgSend(v8, "accountAgeUnknown") ^ 1;
  }
  objc_msgSend(v94, "setIdentifierForAdvertisingAllowed:", v52);
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v25, "component:fromDate:", 4, v53);

  objc_msgSend(v8, "segmentData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADSegmentDataManager parseBirthYearFromSegmentData:](self, "parseBirthYearFromSegmentData:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isPlaceholderAccount") & 1) == 0 && (objc_msgSend(v8, "accountAgeUnknown") & 1) == 0)
  {
    v63 = objc_msgSend(v8, "isRestrictedByApple");
    v57 = 0;
    if (!v56 || (v63 & 1) != 0)
      goto LABEL_34;
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isPersonalizedAdsEnabled");

    if ((v65 & 1) != 0)
    {
      v66 = self;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Personalized Ads is ON. We must use actual birth year."), objc_opt_class());
    }
    else
    {
      if (objc_msgSend(v8, "noiseAppliedVersion") == 1)
      {
        v66 = self;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Personalized Ads is OFF and we have already applied noise before. Checking if basel year is younger than noised."), objc_opt_class());
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        LODWORD(v68) = objc_msgSend(v56, "intValue");
        if ((int)v68 <= (int)objc_msgSend(v8, "effectiveBirthYear"))
          goto LABEL_46;
        goto LABEL_45;
      }
      v69 = objc_msgSend(v8, "noiseAppliedVersion");
      v70 = (void *)MEMORY[0x24BDD17C8];
      v66 = self;
      v71 = objc_opt_class();
      if (v69 != 2)
      {
        objc_msgSend(v70, "stringWithFormat:", CFSTR("[%@]: Personalized Ads is OFF and we have not applied noise before. Running noise calculation now."), v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        if (v54 - objc_msgSend(v56, "integerValue") < 21)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: User INELIGIBLE to be treated with noise."), objc_opt_class());
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog();

          objc_msgSend(v8, "setEffectiveBirthYear:", objc_msgSend(v56, "intValue"));
          objc_msgSend(v8, "setNoiseAppliedVersion:", 2);
        }
        else
        {
          -[ADSegmentDataManager noiseAppliedBirthYearFromActual:](self, "noiseAppliedBirthYearFromActual:", v56);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v56, "isEqualToNumber:", v73);
          v75 = (void *)MEMORY[0x24BDD17C8];
          v76 = objc_opt_class();
          if (v74)
          {
            objc_msgSend(v75, "stringWithFormat:", CFSTR("[%@]: User IS NOT being treated with noise."), v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog();

            v78 = objc_msgSend(v56, "intValue");
            v79 = 2;
          }
          else
          {
            objc_msgSend(v75, "stringWithFormat:", CFSTR("[%@]: User IS being treated with noise."), v76);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog();

            v78 = objc_msgSend(v73, "intValue");
            v79 = 1;
          }
          objc_msgSend(v8, "setEffectiveBirthYear:", v78);
          objc_msgSend(v8, "setNoiseAppliedVersion:", v79);
          objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "iTunesStorefront");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          if (v83 && (unint64_t)objc_msgSend(v83, "length") >= 6)
          {
            objc_msgSend(v83, "substringToIndex:", 6);
            v84 = objc_claimAutoreleasedReturnValue();

            v83 = (void *)v84;
          }
          v85 = objc_msgSend(v8, "effectiveBirthYear");
          v99[0] = CFSTR("EffectiveAge");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v54 + ~v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v99[1] = CFSTR("Storefront");
          v100[0] = v86;
          v100[1] = v83;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          v66 = self;
        }
        goto LABEL_46;
      }
      objc_msgSend(v70, "stringWithFormat:", CFSTR("[%@]: Personalized Ads is OFF and we have already calculated noise before. No noise applied and basel year is honored."), v71);
    }
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_45:
    objc_msgSend(v8, "setEffectiveBirthYear:", objc_msgSend(v56, "intValue"));
LABEL_46:
    v57 = -[ADSegmentDataManager isEligibleForSensitiveContent:](v66, "isEligibleForSensitiveContent:", (int)objc_msgSend(v8, "effectiveBirthYear"));
    goto LABEL_34;
  }
  v57 = 0;
LABEL_34:
  objc_msgSend(v8, "setSensitiveContentEligible:", v57);
  v58 = (void *)MEMORY[0x24BDD17C8];
  v59 = objc_opt_class();
  v60 = objc_msgSend(v8, "sensitiveContentEligible");
  v61 = CFSTR("NOT eligible");
  if (v60)
    v61 = CFSTR("eligible");
  objc_msgSend(v58, "stringWithFormat:", CFSTR("[%@]: This user is %@ for sensitive content."), v59, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (v93)
    (*((void (**)(id, _QWORD, uint64_t))v93 + 2))(v93, 0, 1);

  v9 = v90;
  v7 = v91;
  v15 = v94;
LABEL_39:

  objc_autoreleasePoolPop(context);
}

uint64_t __91__ADSegmentDataManager_handleSuccessfulJingleSegmentResponse_dsidRecord_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)parseBirthYearFromSegmentData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "JSONObjectWithData:options:error:", v4, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("segmentData is not in JSON format. Unable to parse segmentData."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("it"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("13"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "intValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)noiseAppliedBirthYearFromActual:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  ADSegmentDataManager *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v4 = a3;
  v28 = v4;
  v5 = (void *)MEMORY[0x219A08150]();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = (void *)MEMORY[0x24BE7A7B0];
  v8 = objc_opt_class();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __56__ADSegmentDataManager_noiseAppliedBirthYearFromActual___block_invoke;
  v18 = &unk_24D710D90;
  v9 = v4;
  v19 = v9;
  v20 = self;
  v22 = &v23;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v7, "fetchConfigurationForClass:completion:", v8, &v15);
  v11 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v11))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FILE A RADAR] We failed to fetch the noise config in time."), v15, v16, v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_autoreleasePoolPop(v5);
  v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __56__ADSegmentDataManager_noiseAppliedBirthYearFromActual___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  signed int v41;
  uint64_t v42;
  uint64_t v43;
  signed int v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  _BYTE v77[128];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "lowerAgeLimits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FILE A RADAR] There is an issue with the config payload."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(CFSTR("{\"noiseRange\":{\"startAge\":18,\"endAge\":20},\"adolescentNoise\":0,\"noise\":[{\"age\":18,\"percentage\":0.52},{\"age\":19,\"percentage\":0.73},{\"age\":20,\"percentage\":0.96}]}"), "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v76);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("noiseRange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("startAge"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("endAge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v7, "intValue") <= 12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  if ((int)objc_msgSend(v7, "intValue") >= 19)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  if ((int)objc_msgSend(v8, "intValue") <= 19)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  v64 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v7;
  v13 = objc_msgSend(v7, "intValue");
  if ((int)v13 <= (int)objc_msgSend(v8, "intValue"))
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      v15 = (int)v13 < (int)objc_msgSend(v8, "intValue");
      v13 = (v13 + 1);
    }
    while (v15);
  }
  v62 = v8;
  v63 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("noise"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v66 = v17;
  objc_msgSend(v17, "valueForKey:", CFSTR("age"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v12;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v73 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        if ((objc_msgSend(v19, "containsObject:", v24) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is a broken config for age noise where (%d) is missing."), objc_msgSend(v24, "intValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog();

          v80[0] = CFSTR("age");
          v80[1] = CFSTR("percentage");
          v81[0] = v24;
          v81[1] = &unk_24D718F00;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    }
    while (v21);
  }

  v27 = v63;
  objc_msgSend(v63, "objectForKey:", CFSTR("adolescentNoise"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  if (v29 > 0.0)
  {
    v30 = objc_msgSend(v65, "intValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v30 - 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = CFSTR("age");
    v78[1] = CFSTR("percentage");
    v79[0] = v31;
    v79[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v32);

  }
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "component:fromDate:", 4, v34);

  v36 = v64;
  v37 = v35 + ~objc_msgSend(*(id *)(v64 + 32), "integerValue");
  if (v37 <= objc_msgSend(v8, "integerValue"))
  {
    v52 = v37;
  }
  else
  {
    v59 = v35;
    if (MGGetBoolAnswer())
    {
      objc_msgSend(*(id *)(v64 + 40), "_ageDistributionOverrides");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v40 = v38;

        v66 = v40;
      }

    }
    v41 = arc4random_uniform(0x2710u);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v66 = v66;
    v42 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    v60 = v37;
    if (v42)
    {
      v43 = v42;
      v57 = v33;
      v58 = v28;
      v44 = 0;
      v45 = *(_QWORD *)v69;
      while (2)
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v69 != v45)
            objc_enumerationMutation(v66);
          v47 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v47, "objectForKey:", CFSTR("percentage"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", CFSTR("age"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "floatValue");
          v51 = (int)(float)(v50 * 100.0);
          if (v51 <= 50)
            v51 = 50;
          v44 += v51;
          if (v41 < v44)
          {
            v37 = objc_msgSend(v49, "integerValue");

            goto LABEL_40;
          }

        }
        v43 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        if (v43)
          continue;
        break;
      }
LABEL_40:
      v27 = v63;
      v36 = v64;
      v8 = v62;
      v33 = v57;
      v28 = v58;
    }

    v35 = v59;
    v52 = v60;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User with age %ld being treated with effective age of %ld."), v52, v37);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (v52 != v37)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v35 + ~v37);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = *(_QWORD *)(*(_QWORD *)(v36 + 56) + 8);
    v56 = *(void **)(v55 + 40);
    *(_QWORD *)(v55 + 40) = v54;

  }
  dispatch_group_leave(*(dispatch_group_t *)(v36 + 48));

}

- (BOOL)isEligibleForSensitiveContent:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (!a3)
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v4 = (void *)MEMORY[0x219A08150](self, a2);
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = (void *)MEMORY[0x24BE7A7B0];
  v7 = objc_opt_class();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__ADSegmentDataManager_isEligibleForSensitiveContent___block_invoke;
  v13[3] = &unk_24D710DB8;
  v15 = &v17;
  v16 = a3;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v6, "fetchConfigurationForClass:completion:", v7, v13);
  v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FILE A RADAR] We failed to fetch the storefront threshold config in time."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_autoreleasePoolPop(v4);
  v11 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__ADSegmentDataManager_isEligibleForSensitiveContent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "enabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v19, "sensitiveContentEligibilityThreshold");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("default"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "iTunesStorefront");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && (unint64_t)objc_msgSend(v9, "length") >= 6)
      {
        objc_msgSend(v9, "substringToIndex:", 6);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      v11 = v6;
      objc_msgSend(v11, "objectForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "objectForKey:", v9);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "component:fromDate:", 4, v15);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16 + ~*(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The storefront: %@ has a threshold of: %d. The user's age is: %d"), v9, objc_msgSend(v7, "intValue"), objc_msgSend(v17, "intValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      LODWORD(v18) = objc_msgSend(v17, "intValue");
      if ((int)v18 >= (int)objc_msgSend(v7, "intValue"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)_ageDistributionOverrides
{
  id v2;
  void *v3;
  void *v4;
  id v5;
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
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BE02138]);
  objc_msgSend(v3, "objectForKey:", CFSTR("enableAgeDistributionOverrides"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x24BDBD1C0];
  if (objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ageDistribution18"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ageDistribution19"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ageDistribution20"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = CFSTR("age");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = CFSTR("percentage");
    v28[0] = v8;
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v22, "floatValue");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v20);
    v25[0] = CFSTR("age");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = CFSTR("percentage");
    v26[0] = v11;
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v14);
    v23[0] = CFSTR("age");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("percentage");
    v24[0] = v15;
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v21, "floatValue");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v18);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)populateAccountTypeFields:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDSIDRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "iTunesStoreAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v5, "accountAgeUnknown") & 1) != 0 || objc_msgSend(v5, "lastJingleAccountStatus") == 1)
  {
    v7 = 6;
LABEL_6:
    objc_msgSend(v11, "addAccountType:", v7);
    goto LABEL_7;
  }
  v8 = objc_msgSend(v3, "isManagedAppleID");
  if (v8)
    objc_msgSend(v11, "addAccountType:", 2);
  if (objc_msgSend(v5, "accountIsU13"))
  {
    objc_msgSend(v11, "addAccountType:", 3);
    v9 = 0;
  }
  else
  {
    v9 = v8 ^ 1;
  }
  objc_msgSend(v5, "accountIsT13");
  v10 = objc_msgSend(v5, "accountIsU18");
  if (v10)
    v7 = 5;
  else
    v7 = 1;
  if ((v10 & 1) != 0 || v9)
    goto LABEL_6;
LABEL_7:

}

- (BOOL)isSegmentReductionEnabled
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = (void *)MEMORY[0x24BE7A7B0];
  v4 = objc_opt_class();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __49__ADSegmentDataManager_isSegmentReductionEnabled__block_invoke;
  v13 = &unk_24D710DE0;
  v15 = &v16;
  v5 = v2;
  v14 = v5;
  objc_msgSend(v3, "fetchConfigurationForClass:completion:", v4, &v10);
  v6 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v5, v6))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FILE A RADAR] We failed to fetch the segments config in time."), v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v8 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __49__ADSegmentDataManager_isSegmentReductionEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "segmentReductionEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "segmentReductionEnabled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (BOOL)shouldSendSegmentDataToAdPlatforms:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  char v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("EnableCustomPayload"));

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDSIDRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ADSegmentDataManager isSegmentReductionEnabled](self, "isSegmentReductionEnabled"))
    {
      if (objc_msgSend(v7, "isRestrictedByApple"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Account %@ is a restricted account (U13, U18, MAID or EDU)."), objc_opt_class(), v4);
LABEL_14:
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Segment update request should NOT be sent."), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        _ADLog();
LABEL_16:
        v8 = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isPersonalizedAdsEnabled");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. PA is set to OFF"), objc_opt_class(), v45);
        goto LABEL_14;
      }
LABEL_19:
      if (-[ADSegmentDataManager segmentUpdateInProgress](self, "segmentUpdateInProgress"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Segment update for %@ is in-flight."), objc_opt_class(), v4, v46);
LABEL_23:
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (-[ADSegmentDataManager segmentRetrievalInProgress](self, "segmentRetrievalInProgress"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Segment retrieval request to Jingle for %@ is in-flight."), objc_opt_class(), v4, v46);
        goto LABEL_23;
      }
      objc_msgSend(v7, "DSID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v4);

      if ((v19 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isPersonalizedAdsEnabled"))
        {
LABEL_28:

          goto LABEL_29;
        }
        objc_msgSend(v7, "encryptedIDForClientType:", 5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {

          goto LABEL_28;
        }
        v38 = objc_msgSend(v7, "isPlaceholderAccount");

        if ((v38 & 1) != 0)
        {
LABEL_29:
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "AD_toServerTime");
          v24 = v23 - objc_msgSend(v7, "lastSentSegmentDataTimestamp");
          objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "maxSegmentSendInterval");

          if (v24 > v26)
          {
            v27 = objc_msgSend(v7, "lastSentSegmentDataTimestamp");
            v28 = (void *)MEMORY[0x24BDD17C8];
            v29 = objc_opt_class();
            if (v27)
            {
              objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms - maximum update interval of %d seconds exceeded."), v29, objc_msgSend(v16, "maxSegmentSendInterval"));
            }
            else
            {
              objc_msgSend(v7, "DSID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms - we have not sent segments before for DSID %@."), v29, v16);
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog();

            goto LABEL_51;
          }
          objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "reconcileOperations");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v34, "isSet:", 4) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isPersonalizedAdsEnabled");

            if (v36)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms because ADReconcileOp_SendSegmentUpdate is set."), objc_opt_class(), v45, v46);
LABEL_50:
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              _ADLog();
LABEL_51:
              v8 = 1;
              goto LABEL_17;
            }
          }
          else
          {

          }
          v37 = objc_msgSend(v7, "lastSegmentServedTimestamp");
          if (v37 < (int)objc_msgSend(v7, "lastSentSegmentDataTimestamp"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Segment data has not changed (lastSegmentServedTimestamp = %d < lastSentSegmentDataTimestamp %d)."), objc_opt_class(), objc_msgSend(v7, "lastSegmentServedTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp"));
            goto LABEL_23;
          }
          v42 = objc_msgSend(v7, "segmentDataTimestamp");
          if (v42 <= (int)objc_msgSend(v7, "lastSentSegmentDataTimestamp"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms, it was previously sent at %d and hasn't changed since %d."), objc_opt_class(), objc_msgSend(v7, "lastSentSegmentDataTimestamp"), objc_msgSend(v7, "segmentDataTimestamp"));
            goto LABEL_23;
          }
          v43 = objc_msgSend(v7, "lastSegmentServedTimestamp");
          if (v43 <= (int)objc_msgSend(v7, "lastSentSegmentDataTimestamp"))
          {
            v44 = objc_msgSend(v7, "segmentDataTimestamp");
            if (v44 <= (int)objc_msgSend(v7, "lastSentSegmentDataTimestamp"))
              goto LABEL_3;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms because segment data changed (segmentDataTimestamp = %d > lastSentSegmentDataTimestamp %d)."), objc_opt_class(), objc_msgSend(v7, "segmentDataTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp"));
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms because segment data changed (lastSegmentServedTimestamp = %d > lastSentSegmentDataTimestamp %d)."), objc_opt_class(), objc_msgSend(v7, "lastSegmentServedTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp"));
          }
          goto LABEL_50;
        }
        v39 = (void *)MEMORY[0x24BDD17C8];
        v40 = objc_opt_class();
        objc_msgSend(v7, "DSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Device is opted-in but DPID for %@ is NULL."), v40, v16, v46);
      }
      else
      {
        v30 = (void *)MEMORY[0x24BDD17C8];
        v31 = objc_opt_class();
        objc_msgSend(v7, "DSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Current active record DSID %@ does not match request DSID %@."), v31, v16, v4);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      goto LABEL_16;
    }
    if ((objc_msgSend(v7, "accountIsU13") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isManagedAppleID"))
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "educationModeEnabled");

        if (!v14)
          goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Skipping sending segment data to AdPlatforms. Account %@ is a U13 or MAID or EDU account."), objc_opt_class(), v4);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Sending segment data to AdPlatforms because AD_ENABLE_CUSTOM_SEGMENT_PAYLOAD is enabled."), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();
LABEL_3:
  v8 = 1;
LABEL_18:

  return v8;
}

- (void)sendSegmentDataToAdPlatforms:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x219A08150]();
  if (-[ADSegmentDataManager shouldSendSegmentDataToAdPlatforms:](self, "shouldSendSegmentDataToAdPlatforms:", v6))
  {
    self->_segmentUpdateInProgress = 1;
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke;
    v10[3] = &unk_24D7102C0;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v9, "addOperationWithBlock:", v10);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  objc_autoreleasePoolPop(v8);

}

void __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  __CFString *v26;
  int v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v51[5];
  id v52;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE02218]);
  objc_msgSend(v3, "activeDSIDRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdvertisingIdentifier:", v7);

  objc_msgSend(v3, "monthlyResetArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdvertisingIdentifierMonthResetCount:", objc_msgSend(v8, "count"));

  objc_msgSend(v5, "encryptedIDForClientType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIAdID:", v9);

  objc_msgSend(v5, "encryptedIDForClientType:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDPID:", v10);

  v11 = objc_alloc(MEMORY[0x24BDBCF50]);
  v12 = (void *)objc_msgSend(v11, "initWithSuiteName:", *MEMORY[0x24BE02138]);
  objc_msgSend(v12, "objectForKey:", CFSTR("acknowledgedPersonalizedAdsVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)v2;
  v47 = v12;
  v48 = v6;
  if ((objc_msgSend(v5, "isRestrictedByApple") & 1) != 0 || !objc_msgSend(v1, "isPersonalizedAdsEnabled"))
  {
    v14 = 1;
  }
  else
  {
    v14 = objc_msgSend(v5, "isPlaceholderAccount");
    if ((v14 & 1) == 0)
    {
      v15 = a1;
      if (v13)
      {
        if (objc_msgSend(v5, "lastJingleAccountStatus") != 1)
        {
LABEL_24:
          objc_msgSend(v5, "segmentData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setSegmentInfo:", v23);
          goto LABEL_25;
        }
        goto LABEL_21;
      }
    }
  }
  v46 = v14;
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = objc_opt_class();
  if (objc_msgSend(v5, "isRestrictedByApple"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (objc_msgSend(v1, "isPersonalizedAdsEnabled"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (objc_msgSend(v5, "isPlaceholderAccount"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  if (v13)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v15 = a1;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@ sendSegmentDataToAdPlatforms]: NOT including segment data in ADSegmentUpdateRequest because -\nisRestrictedByApple: %@\npersonalizedAdsEnabled: %@\nisPlaceholderAccount: %@\nconsentedToPA: %@"), v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (objc_msgSend(v5, "lastJingleAccountStatus") != 1)
  {
    if (v46)
    {
      objc_msgSend(v4, "setSegmentInfo:", 0);
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_21:
  objc_msgSend(v4, "setSegmentInfo:", CFSTR("{\"t\":6, \"o\":0}"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ sendSegmentDataToAdPlatforms]: Forcing segment data to %@"), objc_opt_class(), CFSTR("{\"t\":6, \"o\":0}"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();
LABEL_25:

LABEL_26:
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("EnableCustomPayload"));

  if (v25)
  {
    objc_msgSend(v1, "customJinglePayload");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v1, "isPersonalizedAdsEnabled");
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = objc_opt_class();
    v30 = CFSTR("nil (LAT Enabled)");
    if (v27)
    {
      v30 = v26;
      v31 = v26;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v28, "stringWithFormat:", CFSTR("[%@] Using Custom Segment Payload from Internal Settings: %@"), v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v4, "setSegmentInfo:", v31);
    objc_msgSend(v5, "setSegmentData:", v26);
    v33 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "segmentData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Active DSID record segments set to: %@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_msgSend(v4, "setIsFirstPartyIdentifier:", 0);
  objc_msgSend(v4, "setITunesRefreshTime:", (double)(int)objc_msgSend(v5, "segmentDataTimestamp"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdateSentTime:", (double)(int)objc_msgSend(v36, "AD_toServerTime"));

  objc_msgSend(v1, "timezone");
  objc_msgSend(v4, "setTimezone:");
  objc_msgSend(v1, "osVersionAndBuild");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOsVersionAndBuild:", v37);

  objc_msgSend(v1, "localeIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocaleIdentifier:", v38);

  objc_msgSend(v4, "addDeviceMode:", objc_msgSend(v1, "educationModeEnabled"));
  objc_msgSend(*(id *)(v15 + 32), "populateAccountTypeFields:", v4);
  objc_msgSend(v1, "iCloudDSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v1, "iCloudDSID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "iTunesAccountDSID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqualToString:", v41);

    if (v42)
      v43 = 1;
    else
      v43 = 2;
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(v4, "addAccountState:", v43);
  objc_msgSend(v1, "defaultServerURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke_2;
  v51[3] = &unk_24D710E08;
  v45 = *(void **)(v15 + 40);
  v51[4] = *(_QWORD *)(v15 + 32);
  v52 = v45;
  objc_msgSend(v49, "handleRequest:serverURL:responseHandler:", v4, v44, v51);

}

void __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE02220];
  v7 = a4;
  v8 = a2;
  v9 = (id)objc_msgSend([v6 alloc], "initWithData:", v8);

  objc_msgSend(*(id *)(a1 + 32), "handleSegmentUpdateResponse:error:completionHandler:", v9, v7, *(_QWORD *)(a1 + 40));
}

- (void)handleSegmentUpdateResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, uint64_t))a5;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeDSIDRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = objc_opt_class();
  if (v8)
  {
    objc_msgSend(v11, "DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ClientTypeToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "code");
    objc_msgSend(v8, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@] Error sending segments to AdPlatforms for %@ %@. Error %ld - %@"), v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_3:
    goto LABEL_4;
  }
  objc_msgSend(v29, "AD_jsonString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@] Received segment update response: %@"), v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastSentSegmentDataTimestamp:", objc_msgSend(v21, "AD_toServerTime"));

  if (objc_msgSend(v29, "hasSegmentRefreshIntervalInSeconds"))
  {
    objc_msgSend(v29, "segmentRefreshIntervalInSeconds");
    if (v22 > 0.0)
    {
      objc_msgSend(v29, "segmentRefreshIntervalInSeconds");
      v24 = (int)v23;
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSegmentRetrievalInterval:", v24);

    }
  }
  if (objc_msgSend(v29, "hasMaxSegmentUpdateIntervalInSeconds"))
  {
    objc_msgSend(v29, "maxSegmentUpdateIntervalInSeconds");
    if (v26 > 0.0)
    {
      objc_msgSend(v29, "maxSegmentUpdateIntervalInSeconds");
      v28 = (int)v27;
      objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaxSegmentSendInterval:", v28);
      goto LABEL_3;
    }
  }
LABEL_4:
  self->_segmentUpdateInProgress = 0;
  if (v9)
    v9[2](v9, v8, 1);

}

- (BOOL)segmentUpdateInProgress
{
  return self->_segmentUpdateInProgress;
}

- (void)setSegmentUpdateInProgress:(BOOL)a3
{
  self->_segmentUpdateInProgress = a3;
}

- (NSNumber)pendingJingleRequestToken
{
  return self->_pendingJingleRequestToken;
}

- (void)setPendingJingleRequestToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingJingleRequestToken, 0);
}

@end
