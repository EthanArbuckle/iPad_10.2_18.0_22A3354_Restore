@implementation GEORPProblemOptInRequester

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GEORPProblemOptInRequester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBB7E0 != -1)
    dispatch_once(&qword_1ECDBB7E0, block);
  return (id)qword_1ECDBB7D8;
}

void __44__GEORPProblemOptInRequester_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECDBB7D8;
  qword_1ECDBB7D8 = (uint64_t)v1;

}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[GEORPProblemOptInRequestConfig standardConfig](GEORPProblemOptInRequestConfig, "standardConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__GEORPProblemOptInRequester_startWithRequest_traits_completionHandler___block_invoke;
  v13[3] = &unk_1E1BFFB70;
  v14 = v8;
  v12 = v8;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v10, v9, 0, v11, 0, 0, v13);

}

uint64_t __72__GEORPProblemOptInRequester_startWithRequest_traits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_validateResponse:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(a3, "statusCode");
  if (v3)
  {
    v4 = -7;
    if (v3 == 20)
      v4 = -8;
    if (v3 == 5)
      v5 = -10;
    else
      v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
