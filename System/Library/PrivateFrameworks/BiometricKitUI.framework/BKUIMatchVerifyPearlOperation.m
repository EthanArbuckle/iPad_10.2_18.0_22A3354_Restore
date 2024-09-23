@implementation BKUIMatchVerifyPearlOperation

- (BKUIMatchVerifyPearlOperation)init
{
  BKUIMatchVerifyPearlOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIMatchVerifyPearlOperation;
  result = -[BKUIMatchVerifyPearlOperation init](&v3, sel_init);
  if (result)
  {
    result->_failReason = -314159;
    *(_QWORD *)&result->_substate = 0;
    result->_lastErrorousSubState = 0;
  }
  return result;
}

- (void)retryMatchOperation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BKIdentity *matchedIdentity;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint8_t v13[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "_matchOperation retrying match operation", v13, 2u);
  }

  -[BKUIMatchVerifyPearlOperation matchOperation](self, "matchOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 != 4)
  {
    -[BKUIMatchVerifyPearlOperation matchOperation](self, "matchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

  }
  self->_failReason = -314159;
  self->_lastErrorousSubState = 0;
  self->_substate = 0;
  matchedIdentity = self->_matchedIdentity;
  self->_matchedIdentity = 0;

  -[BKUIMatchVerifyPearlOperation device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIMatchVerifyPearlOperation identity](self, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIMatchVerifyPearlOperation credentialSet](self, "credentialSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BKUIMatchVerifyPearlOperation enrollmentConfiguration](self, "enrollmentConfiguration");
  -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIMatchVerifyPearlOperation startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:](self, "startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:", v8, v9, v10, v11, v12);

}

- (void)startMatchOperationWithDevice:(id)a3 identity:(id)a4 credential:(id)a5 withConfiguration:(unint64_t)a6 matchOperationActionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id matchOperationDidMatch;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BKMatchPearlOperation *v34;
  id v35;
  BKMatchPearlOperation *matchOperation;
  NSObject *v37;
  uint64_t v38;
  BKMatchPearlOperation *v39;
  char v40;
  NSObject *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD);
  BKIdentity **p_identity;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = _Block_copy(a7);
  matchOperationDidMatch = self->_matchOperationDidMatch;
  self->_matchOperationDidMatch = v16;

  objc_storeStrong((id *)&self->_device, a3);
  objc_storeStrong((id *)&self->_credentialSet, a5);
  p_identity = &self->_identity;
  objc_storeStrong((id *)&self->_identity, a4);
  self->_enrollmentConfiguration = a6;
  _BKUILoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v55 = v13;
    v56 = 2112;
    v57 = v14;
    v58 = 2112;
    v59 = v15;
    v60 = 2048;
    v61 = a6;
    _os_log_impl(&dword_1DB281000, v18, OS_LOG_TYPE_DEFAULT, "startMatchOperationWithDevice: device:%@ identity:%@ credentails::%@ config:%lu", buf, 0x2Au);
  }
  v45 = v15;
  v19 = v14;

  v52 = 0;
  v20 = v13;
  objc_msgSend(v13, "identitiesWithError:", &v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v52;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v23);
        v26 += objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "hasPeriocularEnrollment", p_identity);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }

  if (v22)
  {
    _BKUILoggingFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[BKUIMatchVerifyPearlOperation startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:].cold.1((uint64_t)v22, v29, v30);
    v31 = v19;
    v32 = v20;
    v33 = v45;
    goto LABEL_16;
  }
  v32 = v20;
  if (a6 == 4)
  {
    v31 = v19;
    v33 = v45;
    if ((unint64_t)objc_msgSend(v23, "count") >= 2 && v26 == 1)
    {
      objc_msgSend(v23, "firstObject");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "hasPeriocularEnrollment") & 1) == 0)
        goto LABEL_26;
      goto LABEL_40;
    }
  }
  else
  {
    v31 = v19;
    v33 = v45;
    if (a6 == 3 && (unint64_t)objc_msgSend(v23, "count") >= 2 && v26 == 1)
    {
      objc_msgSend(v23, "firstObject");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "hasPeriocularEnrollment") & 1) != 0)
      {
LABEL_26:
        objc_msgSend(v23, "lastObject", p_identity);
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_41:
        v29 = *p_identity;
        *p_identity = (BKIdentity *)v38;
LABEL_16:

        goto LABEL_17;
      }
LABEL_40:
      objc_msgSend(v23, "firstObject", p_identity);
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
  }
LABEL_17:
  v47 = 0;
  objc_msgSend(v32, "createMatchOperationWithError:", &v47, p_identity);
  v34 = (BKMatchPearlOperation *)objc_claimAutoreleasedReturnValue();
  v35 = v47;
  matchOperation = self->_matchOperation;
  self->_matchOperation = v34;

  if (v35)
  {
    _BKUILoggingFacility();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v35;
      _os_log_impl(&dword_1DB281000, v37, OS_LOG_TYPE_DEFAULT, "_matchOperation createMatchOperation Error:%@", buf, 0xCu);
    }

  }
  else
  {
    v39 = self->_matchOperation;
    if (v39)
    {
      -[BKMatchPearlOperation setPreAugmentationCheck:](v39, "setPreAugmentationCheck:", 1);
      -[BKMatchPearlOperation setPreAugmentationCheckIdentity:](self->_matchOperation, "setPreAugmentationCheckIdentity:", self->_identity);
      -[BKMatchPearlOperation setPurpose:](self->_matchOperation, "setPurpose:", 6);
      -[BKMatchPearlOperation setCredentialSet:](self->_matchOperation, "setCredentialSet:", v33);
      -[BKMatchPearlOperation setStopOnSuccess:](self->_matchOperation, "setStopOnSuccess:", 1);
      -[BKMatchPearlOperation setDelegate:](self->_matchOperation, "setDelegate:", self);
      -[BKMatchPearlOperation setShouldAutoRetry:](self->_matchOperation, "setShouldAutoRetry:", 1);
      v39 = self->_matchOperation;
    }
    v46 = 0;
    v40 = -[BKMatchPearlOperation startWithError:](v39, "startWithError:", &v46);
    v35 = v46;
    if ((v40 & 1) != 0)
    {
      -[BKUIMatchVerifyPearlOperation setFailReason:](self, "setFailReason:", -314159);
      goto LABEL_36;
    }
    _BKUILoggingFacility();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v35;
      _os_log_impl(&dword_1DB281000, v41, OS_LOG_TYPE_DEFAULT, "_matchOperation failed to start with Error:%@", buf, 0xCu);
    }

    -[BKMatchPearlOperation setDelegate:](self->_matchOperation, "setDelegate:", 0);
    -[BKUIMatchVerifyPearlOperation setFailReason:](self, "setFailReason:", -9999);
  }
  -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
    v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v43[2](v43, 0);

  }
LABEL_36:

}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int lastErrorousSubState;
  int substate;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "feedback");
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    lastErrorousSubState = self->_lastErrorousSubState;
    substate = self->_substate;
    objc_msgSend(v5, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v5;
    v19 = 1024;
    v20 = lastErrorousSubState;
    v21 = 1024;
    v22 = substate;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "_matchOperation matchedWithResult BKMatchResultInfo:%@ lastSubState:%u converted substate %u identity %@", buf, 0x22u);

  }
  -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "identity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIMatchVerifyPearlOperation setMatchedIdentity:](self, "setMatchedIdentity:", v13);

    }
    else
    {
      -[BKUIMatchVerifyPearlOperation setFailReason:](self, "setFailReason:", 1);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__BKUIMatchVerifyPearlOperation_matchOperation_matchedWithResult___block_invoke;
    block[3] = &unk_1EA280008;
    block[4] = self;
    v16 = v6;
    v15 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __66__BKUIMatchVerifyPearlOperation_matchOperation_matchedWithResult___block_invoke(uint64_t a1)
{
  int v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v2 = objc_msgSend(*(id *)(a1 + 32), "substateForFaceDetectionFeedBack:", *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = v2;
  v3 = *(_DWORD **)(a1 + 32);
  if (!v3[3] && !v3[4])
  {
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(_DWORD **)(a1 + 32);
    if (!v4)
    {
      v3[3] = 11;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 11;
      v3 = *(_DWORD **)(a1 + 32);
    }
  }
  objc_msgSend(v3, "matchOperationDidMatch");
  v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4
{
  id v4;

  v4 = a3;
  __assert_rtn("-[BKUIMatchVerifyPearlOperation matchOperation:presenceDetectedInLockout:]", "BKUIMatchVerifyPearlOperation.m", 139, "0");
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  NSObject *v6;
  int lastErrorousSubState;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  int v10;
  int64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    lastErrorousSubState = self->_lastErrorousSubState;
    v10 = 134218240;
    v11 = a4;
    v12 = 1024;
    v13 = lastErrorousSubState;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "_matchOperation failedWithReason with BKMatchFailReason:%li lastSubState:%i", (uint8_t *)&v10, 0x12u);
  }

  -[BKMatchPearlOperation setDelegate:](self->_matchOperation, "setDelegate:", 0);
  -[BKUIMatchVerifyPearlOperation setFailReason:](self, "setFailReason:", a4);
  -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BKUIMatchVerifyPearlOperation matchOperationDidMatch](self, "matchOperationDidMatch");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0);

  }
}

- (int)substateForFaceDetectionFeedBack:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9)
    return 0;
  else
    return dword_1DB2DF4F0[a3 - 2];
}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__BKUIMatchVerifyPearlOperation_matchOperation_providedFeedback___block_invoke;
  block[3] = &unk_1EA280008;
  v9 = v6;
  v10 = a4;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__BKUIMatchVerifyPearlOperation_matchOperation_providedFeedback___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "failReason") == -314159)
  {
    objc_msgSend(*(id *)(a1 + 32), "matchedIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "substateForFaceDetectionFeedBack:", *(_QWORD *)(a1 + 48));
      _BKUILoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(_QWORD *)(a1 + 48);
        v7 = 138412802;
        v8 = v5;
        v9 = 2048;
        v10 = v6;
        v11 = 1024;
        v12 = v3;
        _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "matchOperation providedFeedback with operation:%@ lastSubState:%li converted substate %u", (uint8_t *)&v7, 0x1Cu);
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = v3;
      if (objc_msgSend(*(id *)(a1 + 32), "substate"))
        objc_msgSend(*(id *)(a1 + 32), "moveEnrollStateToNeedsPositioning:", objc_msgSend(*(id *)(a1 + 32), "substate"));
    }
  }
}

- (void)moveEnrollStateToNeedsPositioning:(int)a3
{
  _QWORD block[5];

  -[BKUIMatchVerifyPearlOperation setCurrentUIDelegateDisplaySubState:](self, "setCurrentUIDelegateDisplaySubState:", *(_QWORD *)&a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "delegateUIAtNeedsPosition");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "operationsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubstate:animated:afterDelay:", objc_msgSend(*(id *)(a1 + 32), "currentUIDelegateDisplaySubState"), 1, 0.0);

    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "refreshEscapeHatchForCurrentState");

  }
  else
  {
    objc_msgSend(v3, "setDelegateUIAtNeedsPosition:", 1);
    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v6 == 6)
    {
      objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setState:animated:", 5, 1);

    }
    v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_2;
    block[3] = &unk_1EA27FB98;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_2(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:animated:", 3, 1);

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_3;
  block[3] = &unk_1EA27FB98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubstate:animated:afterDelay:", objc_msgSend(*(id *)(a1 + 32), "currentUIDelegateDisplaySubState"), 1, 0.1);

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshEscapeHatchForCurrentState");

}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  -[BKUIMatchVerifyPearlOperation setFaceDetected:](self, "setFaceDetected:", objc_msgSend(a4, "faceDetected", a3));
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  if (-[BKUIMatchVerifyPearlOperation failReason](self, "failReason", a3) == -314159)
  {
    -[BKUIMatchVerifyPearlOperation matchedIdentity](self, "matchedIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 5 && !v6 && !-[BKUIMatchVerifyPearlOperation faceDetected](self, "faceDetected"))
    {
      -[BKUIMatchVerifyPearlOperation moveEnrollStateToNeedsPositioning:](self, "moveEnrollStateToNeedsPositioning:", 0);
      -[BKUIMatchVerifyPearlOperation matchOperation](self, "matchOperation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v7, "startNewMatchAttemptWithError:", &v10);
      v8 = v10;

      if (v8)
      {
        _BKUILoggingFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BKUIMatchVerifyPearlOperation operation:stateChanged:].cold.1(v8, v9);

      }
    }
  }
}

- (void)cancelMatchOperation
{
  void *v3;
  id v4;

  -[BKUIMatchVerifyPearlOperation matchOperation](self, "matchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[BKUIMatchVerifyPearlOperation matchOperation](self, "matchOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (id)matchOperationDidMatch
{
  return self->_matchOperationDidMatch;
}

- (void)setMatchOperationDidMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BKMatchPearlOperation)matchOperation
{
  return self->_matchOperation;
}

- (void)setMatchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_matchOperation, a3);
}

- (BKUIFaceIDEnrollOperationsHandler)weakHandler
{
  return (BKUIFaceIDEnrollOperationsHandler *)objc_loadWeakRetained((id *)&self->_weakHandler);
}

- (void)setWeakHandler:(id)a3
{
  objc_storeWeak((id *)&self->_weakHandler, a3);
}

- (BKUIPearlEnrollOperationsDelegate)operationsDelegate
{
  return (BKUIPearlEnrollOperationsDelegate *)objc_loadWeakRetained((id *)&self->_operationsDelegate);
}

- (void)setOperationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_operationsDelegate, a3);
}

- (int)lastErrorousSubState
{
  return self->_lastErrorousSubState;
}

- (void)setLastErrorousSubState:(int)a3
{
  self->_lastErrorousSubState = a3;
}

- (int)substate
{
  return self->_substate;
}

- (void)setSubstate:(int)a3
{
  self->_substate = a3;
}

- (int)currentUIDelegateDisplaySubState
{
  return self->_currentUIDelegateDisplaySubState;
}

- (void)setCurrentUIDelegateDisplaySubState:(int)a3
{
  self->_currentUIDelegateDisplaySubState = a3;
}

- (int64_t)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(int64_t)a3
{
  self->_failReason = a3;
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BKDevicePearl)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BKIdentity)matchedIdentity
{
  return self->_matchedIdentity;
}

- (void)setMatchedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_matchedIdentity, a3);
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
  objc_storeStrong((id *)&self->_credentialSet, a3);
}

- (unint64_t)enrollmentConfiguration
{
  return self->_enrollmentConfiguration;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  self->_enrollmentConfiguration = a3;
}

- (BOOL)delegateUIAtNeedsPosition
{
  return self->_delegateUIAtNeedsPosition;
}

- (void)setDelegateUIAtNeedsPosition:(BOOL)a3
{
  self->_delegateUIAtNeedsPosition = a3;
}

- (BOOL)faceDetected
{
  return self->_faceDetected;
}

- (void)setFaceDetected:(BOOL)a3
{
  self->_faceDetected = a3;
}

- (BOOL)matchFailed
{
  return self->_matchFailed;
}

- (void)setMatchFailed:(BOOL)a3
{
  self->_matchFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_matchedIdentity, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_destroyWeak((id *)&self->_operationsDelegate);
  objc_destroyWeak((id *)&self->_weakHandler);
  objc_storeStrong((id *)&self->_matchOperation, 0);
  objc_storeStrong(&self->_matchOperationDidMatch, 0);
}

- (void)startMatchOperationWithDevice:(uint64_t)a3 identity:credential:withConfiguration:matchOperationActionBlock:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, a2, a3, "unable to fetch identities for user:%@ matching may be unreliable and users may run in to Face ID not available", (uint8_t *)&v3);
}

- (void)operation:(void *)a1 stateChanged:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, a2, v4, "_matchOperation stateChanged == HOLD + !Face ... startNewMatchAttemptWithError errored out :%@", (uint8_t *)&v5);

}

@end
