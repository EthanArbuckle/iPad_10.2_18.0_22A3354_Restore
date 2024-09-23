@implementation NEFilterDataProvider

- (NEFilterNewFlowVerdict)handleNewFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterDataVerdict)handleInboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0;
}

- (NEFilterDataVerdict)handleOutboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0;
}

- (NEFilterDataVerdict)handleInboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterDataVerdict)handleOutboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterRemediationVerdict)handleRemediationForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (void)applySettings:(NEFilterSettings *)settings completionHandler:(void *)completionHandler
{
  NEFilterSettings *v6;
  void (**v7)(void *, void *);
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = settings;
  v7 = completionHandler;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NEFilterSettings checkValidityAndCollectErrors:](v6, "checkValidityAndCollectErrors:", v8))
    {
      -[NEProvider context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applySettings:completionHandler:", v6, v7);
    }
    else
    {
      if (objc_msgSend(v8, "count"))
      {
        v15 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 1, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);

    }
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D50];
    NEResourcesCopyLocalizedNSString(CFSTR("FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT"), CFSTR("FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 1, v12);

    v7[2](v7, v9);
  }

}

- (void)resumeFlow:(NEFilterFlow *)flow withVerdict:(NEFilterVerdict *)verdict
{
  NEFilterVerdict *v6;
  NEFilterFlow *v7;
  id v8;

  v6 = verdict;
  v7 = flow;
  -[NEProvider context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeFlow:withVerdict:", v7, v6);

}

- (void)updateFlow:(NEFilterSocketFlow *)flow usingVerdict:(NEFilterDataVerdict *)verdict forDirection:(NETrafficDirection)direction
{
  NEFilterDataVerdict *v8;
  NEFilterSocketFlow *v9;
  id v10;

  v8 = verdict;
  v9 = flow;
  -[NEProvider context](self, "context");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFlow:withVerdict:forDirection:", v9, v8, direction);

}

@end
