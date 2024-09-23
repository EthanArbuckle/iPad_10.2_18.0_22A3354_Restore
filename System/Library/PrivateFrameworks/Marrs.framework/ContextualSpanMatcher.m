@implementation ContextualSpanMatcher

- (id)getSpansWithRequest:(id)a3
{
  id v4;
  ContextualSpanMatcher *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  ContextualSpanMatcher.getSpans(request:)(v4);
  v7 = v6;

  return v7;
}

- (id)getContextualSpansWithRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[ContextualSpanMatcher getSpansWithRequest:](self, "getSpansWithRequest:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0D9F9B8]);
  v6 = (void *)MEMORY[0x1E0D9FAC8];
  objc_msgSend(v4, "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extractRequestLinkData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "nlId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultCandidateId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ContextualSpanMatcherSELFLogging emitContextualSpanMatcherEndedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](ContextualSpanMatcherSELFLogging, "emitContextualSpanMatcherEndedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v5, v9, v10, v11, v12, objc_msgSend(v13, "requester"));

  }
  return v5;
}

@end
