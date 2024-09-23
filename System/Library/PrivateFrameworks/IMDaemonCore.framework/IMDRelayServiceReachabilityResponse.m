@implementation IMDRelayServiceReachabilityResponse

- (IMDRelayServiceReachabilityResponse)initWithResult:(id)a3
{
  id v5;
  IMDRelayServiceReachabilityResponse *v6;
  IMDRelayServiceReachabilityResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDRelayServiceReachabilityResponse;
  v6 = -[IMDRelayServiceReachabilityResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_result, a3);

  return v7;
}

+ (id)responseFromData:(id)a3 error:(id *)a4
{
  void *v4;
  IMDRelayServiceReachabilityResponse *v5;
  id v6;
  void *v7;
  void *v8;
  IMDRelayServiceReachabilityResponse *v9;

  +[IMBlastdoor sendRelayReachabilityResponse:error:](IMBlastdoor, "sendRelayReachabilityResponse:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [IMDRelayServiceReachabilityResponse alloc];
    v6 = objc_alloc(MEMORY[0x1E0D39A50]);
    objc_msgSend(v4, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithBlastDoorResult:", v7);
    v9 = -[IMDRelayServiceReachabilityResponse initWithResult:](v5, "initWithResult:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("r");
  -[IMDRelayServiceReachabilityResponse result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IMServiceReachabilityResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
