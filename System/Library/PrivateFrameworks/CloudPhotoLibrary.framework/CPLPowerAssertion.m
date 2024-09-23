@implementation CPLPowerAssertion

+ (void)_doProtected:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = _doProtected__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_doProtected__onceToken, &__block_literal_global_987);
    v5 = v6;
  }
  dispatch_sync((dispatch_queue_t)_powerAssertionQueue, v5);

}

+ (void)_retainAssertion
{
  IOReturn v2;
  IOReturn v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((_invalidPowerAssertion & 1) == 0 && !_powerAssertionId)
  {
    v2 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("cloudphotod"), 0, CFSTR("Photos syncing iCloud Photos"), 0, 3600.0, CFSTR("TimeoutActionTurnOff"), (IOPMAssertionID *)&_powerAssertionId);
    if (v2)
    {
      if (!_CPLSilentLogging)
      {
        v3 = v2;
        __CPLGenericOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v5 = 134217984;
          v6 = v3;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Failed to create a power assertion: %ld", (uint8_t *)&v5, 0xCu);
        }

      }
      _invalidPowerAssertion = 1;
      _powerAssertionId = 0;
    }
    else
    {
      _invalidPowerAssertion = 0;
    }
    _powerAssertionStartTime = CFAbsoluteTimeGetCurrent();
  }
  ++_powerAssertionAge;
}

+ (void)_releaseAssertion
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[16];

  if ((_invalidPowerAssertion & 1) != 0 || _powerAssertionId)
  {
    v2 = CFAbsoluteTimeGetCurrent() - *(double *)&_powerAssertionStartTime;
    if (v2 >= 10.0)
    {
      _lastPowerAssertionRelease = CFAbsoluteTimeGetCurrent();
      *(double *)&_lastPowerAssertionDuration = *(double *)&_lastPowerAssertionRelease
                                              - *(double *)&_powerAssertionStartTime;
      _powerAssertionStartTime = 0;
      if (_invalidPowerAssertion == 1)
      {
        _invalidPowerAssertion = 0;
      }
      else
      {
        if (!_powerAssertionId)
        {
          if (!_CPLSilentLogging)
          {
            __CPLGenericOSLogDomain();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Power assertion should be present", buf, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void releasePowerAssertion(void)");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 58, CFSTR("Power assertion should be present"));

          abort();
        }
        IOPMAssertionRelease(_powerAssertionId);
        _powerAssertionId = 0;
      }
    }
    else
    {
      v3 = _powerAssertionAge;
      v4 = 10.0 - v2;
      v5 = 1.0e10;
      if (v4 < 10.0)
        v5 = v4 * 1000000000.0;
      v6 = dispatch_walltime(0, (uint64_t)v5);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__CPLPowerAssertion__releaseAssertion__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v3;
      dispatch_after(v6, (dispatch_queue_t)_powerAssertionQueue, block);
    }
  }
}

+ (void)disableSleep
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__CPLPowerAssertion_disableSleep__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "_doProtected:", v2);
}

+ (void)enableSleep
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__CPLPowerAssertion_enableSleep__block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a2;
  v2[5] = a1;
  objc_msgSend(a1, "_doProtected:", v2);
}

+ (BOOL)hasEnoughPower
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__CPLPowerAssertion_hasEnoughPower__block_invoke;
  v4[3] = &unk_1E60D7240;
  v4[4] = &v5;
  objc_msgSend(a1, "_doProtected:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)setHasEnoughPower:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CPLPowerAssertion_setHasEnoughPower___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  v4 = a3;
  v3[4] = a1;
  objc_msgSend(a1, "_doProtected:", v3);
}

+ (id)powerAssertionStatus
{
  id v2;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__957;
  v9 = __Block_byref_object_dispose__958;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__CPLPowerAssertion_powerAssertionStatus__block_invoke;
  v4[3] = &unk_1E60D7948;
  v4[5] = a2;
  v4[6] = a1;
  v4[4] = &v5;
  objc_msgSend(a1, "_doProtected:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__CPLPowerAssertion_powerAssertionStatus__block_invoke(_QWORD *a1)
{
  double v2;
  int v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[16];

  v2 = *(double *)&_powerAssertionStartTime;
  if (*(double *)&_powerAssertionStartTime > 0.0)
  {
    v3 = _invalidPowerAssertion;
    if ((_invalidPowerAssertion & 1) == 0 && !_powerAssertionId)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Power assertion should be present", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1[5];
      v17 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v18, v17, v19, 168, CFSTR("Power assertion should be present"));

      abort();
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = CFAbsoluteTimeGetCurrent() - *(double *)&_powerAssertionStartTime;
    if (v3)
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Power assertion held for %0.1fs - failed to get valid power assertion"), *(_QWORD *)&v5);
    else
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Power assertion held for %0.1fs"), *(_QWORD *)&v5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;
    goto LABEL_11;
  }
  if (*(double *)&_lastPowerAssertionRelease > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&_lastPowerAssertionRelease);
    v20 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = _lastPowerAssertionDuration;
    +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v20, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Last power assertion held for %0.1fs %@"), v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[4] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = (void *)v20;
LABEL_11:

  }
}

uint64_t __39__CPLPowerAssertion_setHasEnoughPower___block_invoke(uint64_t result)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(result + 40);
  if (v1 != _hasPower)
  {
    _hasPower = *(_BYTE *)(result + 40);
    if (_powerAssertionCount)
    {
      v2 = *(void **)(result + 32);
      if (v1)
        return objc_msgSend(v2, "_retainAssertion");
      else
        return objc_msgSend(v2, "_releaseAssertion");
    }
  }
  return result;
}

uint64_t __35__CPLPowerAssertion_hasEnoughPower__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _hasPower;
  return result;
}

uint64_t __32__CPLPowerAssertion_enableSleep__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v1 = result;
  v12 = *MEMORY[0x1E0C80C00];
  if (!_powerAssertionCount)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v1 + 32));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(v1 + 32);
    v7 = *(_QWORD *)(v1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(v1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, v8, 132, CFSTR("%@ has been called too many times"), v9);

    abort();
  }
  if (--_powerAssertionCount)
    v2 = 1;
  else
    v2 = _hasPower == 0;
  if (!v2)
    return objc_msgSend(*(id *)(result + 40), "_releaseAssertion");
  return result;
}

uint64_t __33__CPLPowerAssertion_disableSleep__block_invoke(uint64_t result)
{
  BOOL v2;

  if (_powerAssertionCount++)
    v2 = 1;
  else
    v2 = _hasPower == 0;
  if (!v2)
    return objc_msgSend(*(id *)(result + 32), "_retainAssertion");
  return result;
}

void __38__CPLPowerAssertion__releaseAssertion__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (_powerAssertionAge == *(_QWORD *)(a1 + 32) && ((_invalidPowerAssertion & 1) != 0 || _powerAssertionId))
  {
    _lastPowerAssertionRelease = CFAbsoluteTimeGetCurrent();
    *(double *)&_lastPowerAssertionDuration = *(double *)&_lastPowerAssertionRelease
                                            - *(double *)&_powerAssertionStartTime;
    _powerAssertionStartTime = 0;
    if (_invalidPowerAssertion == 1)
    {
      _invalidPowerAssertion = 0;
    }
    else
    {
      if (!_powerAssertionId)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v1 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v5 = 0;
            _os_log_impl(&dword_1B03C2000, v1, OS_LOG_TYPE_ERROR, "Power assertion should be present", v5, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void releasePowerAssertion(void)");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 58, CFSTR("Power assertion should be present"));

        abort();
      }
      IOPMAssertionRelease(_powerAssertionId);
      _powerAssertionId = 0;
    }
  }
}

void __34__CPLPowerAssertion__doProtected___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  CPLCopyDefaultSerialQueueAttributes();
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.cpl.powerassert", v2);
  v1 = (void *)_powerAssertionQueue;
  _powerAssertionQueue = (uint64_t)v0;

}

@end
