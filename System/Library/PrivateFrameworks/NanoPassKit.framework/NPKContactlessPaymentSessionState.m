@implementation NPKContactlessPaymentSessionState

+ (id)_timestampDateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)_timestampDateFormatter_timestampDateFormatter;
  if (!_timestampDateFormatter_timestampDateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v4 = (void *)_timestampDateFormatter_timestampDateFormatter;
    _timestampDateFormatter_timestampDateFormatter = (uint64_t)v3;

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_timestampDateFormatter_timestampDateFormatter, "setLocale:", v5);

    objc_msgSend((id)_timestampDateFormatter_timestampDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd' 'HH:mm:ss.SSSSZZZZZ"));
    v2 = (void *)_timestampDateFormatter_timestampDateFormatter;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 40), self->_uniqueID);
  objc_storeStrong((id *)(v4 + 24), self->_timestamp);
  objc_storeStrong((id *)(v4 + 32), self->_currentPass);
  *(_BYTE *)(v4 + 8) = self->_hasSession;
  *(_QWORD *)(v4 + 48) = self->_sessionType;
  *(_BYTE *)(v4 + 9) = self->_sessionStarted;
  *(_BYTE *)(v4 + 10) = self->_sessionWaitingToStart;
  *(_BYTE *)(v4 + 11) = self->_isSwitchingSessionType;
  *(_BYTE *)(v4 + 12) = self->_doublePressReceived;
  objc_storeStrong((id *)(v4 + 56), self->_doublePressTimestamp);
  *(_BYTE *)(v4 + 13) = self->_sessionAuthorized;
  *(_BYTE *)(v4 + 14) = self->_passActivating;
  *(_BYTE *)(v4 + 15) = self->_contactlessInterfaceReady;
  *(_BYTE *)(v4 + 16) = self->_canChangePass;
  *(_BYTE *)(v4 + 17) = self->_inServiceMode;
  objc_storeStrong((id *)(v4 + 64), self->_serviceModeRequestedPass);
  *(_QWORD *)(v4 + 72) = self->_expressTransactionStatus;
  *(_QWORD *)(v4 + 80) = self->_failureType;
  *(_QWORD *)(v4 + 88) = self->_completionReason;
  objc_storeStrong((id *)(v4 + 96), self->_transactionContext);
  return (id)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend((id)objc_opt_class(), "_timestampDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x24BDD17C8];
  v27 = objc_opt_class();
  -[NPKContactlessPaymentSessionState uniqueID](self, "uniqueID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState timestamp](self, "timestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  objc_msgSend(v3, "stringFromDate:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState currentPass](self, "currentPass");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uniqueID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NPKContactlessPaymentSessionState hasSession](self, "hasSession");
  NSStringFromNPKQuickPaymentSessionType(-[NPKContactlessPaymentSessionState sessionType](self, "sessionType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[NPKContactlessPaymentSessionState sessionStarted](self, "sessionStarted");
  v19 = -[NPKContactlessPaymentSessionState sessionWaitingToStart](self, "sessionWaitingToStart");
  v17 = -[NPKContactlessPaymentSessionState isSwitchingSessionType](self, "isSwitchingSessionType");
  v16 = -[NPKContactlessPaymentSessionState doublePressReceived](self, "doublePressReceived");
  -[NPKContactlessPaymentSessionState doublePressTimestamp](self, "doublePressTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NPKContactlessPaymentSessionState sessionAuthorized](self, "sessionAuthorized");
  v14 = -[NPKContactlessPaymentSessionState passActivating](self, "passActivating");
  v5 = -[NPKContactlessPaymentSessionState contactlessInterfaceReady](self, "contactlessInterfaceReady");
  v6 = -[NPKContactlessPaymentSessionState canChangePass](self, "canChangePass");
  -[NPKContactlessPaymentSessionState serviceModeRequestedPass](self, "serviceModeRequestedPass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[NPKContactlessPaymentSessionState inServiceMode](self, "inServiceMode");
  NSStringFromNPKExpressTransactionStatus(-[NPKContactlessPaymentSessionState expressTransactionStatus](self, "expressTransactionStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromNPKContactlessPaymentSessionFailureType(-[NPKContactlessPaymentSessionState failureType](self, "failureType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromNPKQuickPaymentSessionCompletionReason(-[NPKContactlessPaymentSessionState completionReason](self, "completionReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState transactionContext](self, "transactionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p\n\tuniqueID: %@\n\tTimestamp: %@\n\tPass unique ID: %@\n\tHas session: %d\n\tSession type: %@\n\tSession started: %d\n\tSession waiting to start: %d\n\tSwitching session type: %d\n\tDouble-press received: %d\n\tDouble-press timestamp: %@\n\tSession authorized: %d\n\tPass activating: %d\n\tContactless interface ready: %d\n\tCan change pass: %d\n\tService mode requested pass: %@\n\tIn service mode: %d\n\tExpress status: %@\n\tTransient failure type: %@\n\tCompletion reason: %@\n\tTransaction context: %@\n>"), v27, self, v25, v24, v23, v21, v31, v20, v19, v17, v16, v4, v15, v14, v5, v6,
    v13,
    v3,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  NPKContactlessPaymentSessionState *v4;
  NPKContactlessPaymentSessionState *v5;
  BOOL v6;

  v4 = (NPKContactlessPaymentSessionState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NPKContactlessPaymentSessionState _isEqualToSessionState:](self, "_isEqualToSessionState:", v5);

  return v6;
}

- (BOOL)_isEqualToSessionState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    objc_msgSend(v4, "currentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionState currentPass](self, "currentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!PKEqualObjects())
    {
      v23 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v4, "doublePressTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionState doublePressTimestamp](self, "doublePressTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!PKEqualObjects())
    {
      v23 = 0;
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v4, "serviceModeRequestedPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionState serviceModeRequestedPass](self, "serviceModeRequestedPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!PKEqualObjects())
    {
      v23 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v33 = v12;
    objc_msgSend(v4, "transactionContext");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionState transactionContext](self, "transactionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v13;
    if (PKEqualObjects())
    {
      v30 = v11;
      v14 = objc_msgSend(v4, "hasSession");
      v12 = v33;
      if (v14 != -[NPKContactlessPaymentSessionState hasSession](self, "hasSession"))
        goto LABEL_15;
      v15 = objc_msgSend(v4, "sessionStarted");
      if (v15 != -[NPKContactlessPaymentSessionState sessionStarted](self, "sessionStarted")
        || (v16 = objc_msgSend(v4, "sessionWaitingToStart"),
            v16 != -[NPKContactlessPaymentSessionState sessionWaitingToStart](self, "sessionWaitingToStart"))
        || (v17 = objc_msgSend(v4, "isSwitchingSessionType"),
            v17 != -[NPKContactlessPaymentSessionState isSwitchingSessionType](self, "isSwitchingSessionType"))
        || (v18 = objc_msgSend(v4, "doublePressReceived"),
            v18 != -[NPKContactlessPaymentSessionState doublePressReceived](self, "doublePressReceived"))
        || (v19 = objc_msgSend(v4, "sessionAuthorized"),
            v19 != -[NPKContactlessPaymentSessionState sessionAuthorized](self, "sessionAuthorized"))
        || (v20 = objc_msgSend(v4, "passActivating"),
            v20 != -[NPKContactlessPaymentSessionState passActivating](self, "passActivating"))
        || (v21 = objc_msgSend(v4, "contactlessInterfaceReady"),
            v21 != -[NPKContactlessPaymentSessionState contactlessInterfaceReady](self, "contactlessInterfaceReady"))
        || (v22 = objc_msgSend(v4, "canChangePass"),
            v22 != -[NPKContactlessPaymentSessionState canChangePass](self, "canChangePass")))
      {
LABEL_15:
        v23 = 0;
        v11 = v30;
LABEL_22:

        goto LABEL_23;
      }
      v25 = objc_msgSend(v4, "inServiceMode");
      if (v25 == -[NPKContactlessPaymentSessionState inServiceMode](self, "inServiceMode")
        && (v26 = objc_msgSend(v4, "sessionType"),
            v26 == -[NPKContactlessPaymentSessionState sessionType](self, "sessionType"))
        && (v27 = objc_msgSend(v4, "expressTransactionStatus"),
            v27 == -[NPKContactlessPaymentSessionState expressTransactionStatus](self, "expressTransactionStatus"))
        && (v28 = objc_msgSend(v4, "failureType"),
            v28 == -[NPKContactlessPaymentSessionState failureType](self, "failureType")))
      {
        v29 = objc_msgSend(v4, "completionReason");
        v23 = v29 == -[NPKContactlessPaymentSessionState completionReason](self, "completionReason");
      }
      else
      {
        v23 = 0;
      }
      v11 = v30;
    }
    else
    {
      v23 = 0;
    }
    v12 = v33;
    goto LABEL_22;
  }
  v23 = 0;
LABEL_26:

  return v23;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPKContactlessPaymentSessionState timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  -[NPKContactlessPaymentSessionState currentPass](self, "currentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  -[NPKContactlessPaymentSessionState doublePressTimestamp](self, "doublePressTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v6);

  -[NPKContactlessPaymentSessionState serviceModeRequestedPass](self, "serviceModeRequestedPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v7);

  -[NPKContactlessPaymentSessionState transactionContext](self, "transactionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v8);

  PKCombinedHash();
  -[NPKContactlessPaymentSessionState hasSession](self, "hasSession");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState sessionStarted](self, "sessionStarted");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState sessionWaitingToStart](self, "sessionWaitingToStart");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState isSwitchingSessionType](self, "isSwitchingSessionType");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState doublePressReceived](self, "doublePressReceived");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState sessionAuthorized](self, "sessionAuthorized");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState passActivating](self, "passActivating");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState contactlessInterfaceReady](self, "contactlessInterfaceReady");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState canChangePass](self, "canChangePass");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState inServiceMode](self, "inServiceMode");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState sessionType](self, "sessionType");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState expressTransactionStatus](self, "expressTransactionStatus");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState failureType](self, "failureType");
  PKIntegerHash();
  -[NPKContactlessPaymentSessionState completionReason](self, "completionReason");
  v9 = PKIntegerHash();

  return v9;
}

- (id)stateForNonModalDisplay
{
  void *v2;

  v2 = (void *)-[NPKContactlessPaymentSessionState copy](self, "copy");
  objc_msgSend(v2, "setTransactionContext:", 0);
  objc_msgSend(v2, "setFailureType:", 0);
  return v2;
}

- (BOOL)isSessionStateValid
{
  NPKContactlessPaymentSessionState *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = self;
  -[NPKContactlessPaymentSessionState timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = fabs(v4);
  -[NPKContactlessPaymentSessionState validityInterval](v2, "validityInterval");
  LOBYTE(v2) = v5 < v6;

  return (char)v2;
}

- (double)validityInterval
{
  void *v3;
  double result;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  -[NPKContactlessPaymentSessionState transactionContext](self, "transactionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "transactionStatus") == 2)
  {

    return 5.0;
  }
  else
  {
    v5 = -[NPKContactlessPaymentSessionState completionReason](self, "completionReason");

    result = 5.0;
    if (!v5)
    {
      v6 = -[NPKContactlessPaymentSessionState failureType](self, "failureType", 5.0);
      result = 3.0;
      if (!v6)
      {
        -[NPKContactlessPaymentSessionState transactionContext](self, "transactionContext", 3.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "transactionStatus");

        result = 60.0;
        if (v8 != 1)
          return 0.0;
      }
    }
  }
  return result;
}

- (BOOL)userRejectedReleaseData
{
  return -[NPKContactlessPaymentSessionState failureType](self, "failureType") == 7
      && -[NPKContactlessPaymentSessionManagerTransactionContext transactionType](self->_transactionContext, "transactionType") == 5&& -[NPKContactlessPaymentSessionManagerTransactionContext releaseDataStatus](self->_transactionContext, "releaseDataStatus") == 6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setCurrentPass:(id)a3
{
  objc_storeStrong((id *)&self->_currentPass, a3);
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (BOOL)hasSession
{
  return self->_hasSession;
}

- (void)setHasSession:(BOOL)a3
{
  self->_hasSession = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (BOOL)sessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (BOOL)sessionWaitingToStart
{
  return self->_sessionWaitingToStart;
}

- (void)setSessionWaitingToStart:(BOOL)a3
{
  self->_sessionWaitingToStart = a3;
}

- (BOOL)isSwitchingSessionType
{
  return self->_isSwitchingSessionType;
}

- (void)setIsSwitchingSessionType:(BOOL)a3
{
  self->_isSwitchingSessionType = a3;
}

- (BOOL)doublePressReceived
{
  return self->_doublePressReceived;
}

- (void)setDoublePressReceived:(BOOL)a3
{
  self->_doublePressReceived = a3;
}

- (NSDate)doublePressTimestamp
{
  return self->_doublePressTimestamp;
}

- (void)setDoublePressTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_doublePressTimestamp, a3);
}

- (BOOL)sessionAuthorized
{
  return self->_sessionAuthorized;
}

- (void)setSessionAuthorized:(BOOL)a3
{
  self->_sessionAuthorized = a3;
}

- (BOOL)passActivating
{
  return self->_passActivating;
}

- (void)setPassActivating:(BOOL)a3
{
  self->_passActivating = a3;
}

- (BOOL)contactlessInterfaceReady
{
  return self->_contactlessInterfaceReady;
}

- (void)setContactlessInterfaceReady:(BOOL)a3
{
  self->_contactlessInterfaceReady = a3;
}

- (BOOL)canChangePass
{
  return self->_canChangePass;
}

- (void)setCanChangePass:(BOOL)a3
{
  self->_canChangePass = a3;
}

- (PKPass)serviceModeRequestedPass
{
  return self->_serviceModeRequestedPass;
}

- (void)setServiceModeRequestedPass:(id)a3
{
  objc_storeStrong((id *)&self->_serviceModeRequestedPass, a3);
}

- (BOOL)inServiceMode
{
  return self->_inServiceMode;
}

- (void)setInServiceMode:(BOOL)a3
{
  self->_inServiceMode = a3;
}

- (unint64_t)expressTransactionStatus
{
  return self->_expressTransactionStatus;
}

- (void)setExpressTransactionStatus:(unint64_t)a3
{
  self->_expressTransactionStatus = a3;
}

- (unint64_t)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(unint64_t)a3
{
  self->_failureType = a3;
}

- (unint64_t)completionReason
{
  return self->_completionReason;
}

- (void)setCompletionReason:(unint64_t)a3
{
  self->_completionReason = a3;
}

- (NPKContactlessPaymentSessionManagerTransactionContext)transactionContext
{
  return self->_transactionContext;
}

- (void)setTransactionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transactionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionContext, 0);
  objc_storeStrong((id *)&self->_serviceModeRequestedPass, 0);
  objc_storeStrong((id *)&self->_doublePressTimestamp, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
