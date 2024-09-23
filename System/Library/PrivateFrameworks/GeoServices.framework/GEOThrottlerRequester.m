@implementation GEOThrottlerRequester

+ (GEOThrottlerRequester)sharedRequester
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEOThrottlerRequester_sharedRequester__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBCD38 != -1)
    dispatch_once(&qword_1ECDBCD38, block);
  return (GEOThrottlerRequester *)(id)_MergedGlobals_346;
}

- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  char v12;
  id v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v18;

  v10 = a4;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    +[GEODataRequestThrottler sharedThrottler](GEODataRequestThrottler, "sharedThrottler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "allowRequest:forClient:throttlerToken:error:", a3, v10, a5, a6);

  }
  else
  {
    v18 = *a5;
    v13 = v18;
    v14 = -[GEOThrottlerRequester _getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:](self, "_getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:", &v18, a3, 0, 0, a6);
    v15 = v18;

    if (v14)
    {
      v16 = objc_retainAutorelease(v15);
      *a5 = v16;
      v12 = v16 != 0;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

void __40__GEOThrottlerRequester_sharedRequester__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_346;
  _MergedGlobals_346 = (uint64_t)v1;

}

- (BOOL)_getTokenAndInfo:(id *)a3 forRequest:(id)a4 nextSafeRequestTime:(double *)a5 availableRequestCount:(unsigned int *)a6 error:(id *)a7
{
  uint64_t var0;
  GEOThrottlerIsSafeRequest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;

  var0 = a4.var1.var0;
  v13 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOThrottlerIsSafeRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("throttler.isSafe"), 0, 0, 0);
  -[GEOThrottlerIsSafeRequest setRequestKindType:](v13, "setRequestKindType:", a4);
  -[GEOThrottlerIsSafeRequest setRequestKindSubtype:](v13, "setRequestKindSubtype:", var0);
  -[GEOThrottlerIsSafeRequest setNextSafeRequestTime:](v13, "setNextSafeRequestTime:", a5 != 0);
  -[GEOThrottlerIsSafeRequest setAvailableRequestCount:](v13, "setAvailableRequestCount:", a6 != 0);
  -[GEOThrottlerIsSafeRequest setIncludeToken:](v13, "setIncludeToken:", a3 != 0);
  if (a3)
    -[GEOThrottlerIsSafeRequest setThrottlerToken:](v13, "setThrottlerToken:", *a3);
  -[GEOXPCRequest sendSync:error:](v13, "sendSync:error:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a5)
  {
    objc_msgSend(v14, "nextSafeRequestTime");
    *(_QWORD *)a5 = v16;
  }
  if (a6)
    *a6 = objc_msgSend(v15, "availableRequestCount");
  if (a7)
  {
    objc_msgSend(v15, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "error");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (a3)
  {
    objc_msgSend(v15, "throttlerToken");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  return v19;
}

- (id)getTokenOrInfoFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  v6 = -[GEOThrottlerRequester _getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:](self, "_getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:", &v11, a3, a4, a5, a6);
  v7 = v11;
  v8 = v7;
  v9 = 0;
  if (v6)
    v9 = v7;

  return v9;
}

- (BOOL)getThrottleStateFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6
{
  return -[GEOThrottlerRequester _getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:](self, "_getTokenAndInfo:forRequest:nextSafeRequestTime:availableRequestCount:error:", 0, a3, a4, a5, a6);
}

@end
