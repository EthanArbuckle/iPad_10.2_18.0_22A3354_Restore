@implementation NSUserActivity(INCacheSupport)

- (void)generateCachePayloadWithCompletion:()INCacheSupport
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_intentsPrepareForEncoding");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke;
    v5[3] = &unk_1E2293D30;
    v6 = v4;
    objc_msgSend(a1, "_createUserActivityDataWithOptions:completionHandler:", 0, v5);

  }
}

+ (void)buildFromCachePayload:()INCacheSupport identifier:completion:
{
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;

  v6 = a5;
  if (v6)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("userActivityData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    INCacheableGetSerializationQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke;
      block[3] = &unk_1E2293BE8;
      v9 = &v13;
      v13 = v7;
      v14 = v6;
      dispatch_async(v8, block);

      v8 = v14;
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke_2;
      v10[3] = &unk_1E22900A8;
      v9 = &v11;
      v11 = v6;
      dispatch_async(v8, v10);
    }

  }
}

@end
