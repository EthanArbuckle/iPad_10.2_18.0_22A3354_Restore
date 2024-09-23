@implementation NSURLSession(GKAdditions)

+ (void)_gkSendAsynchronousRequest:()GKAdditions completionHandler:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (_gkSendAsynchronousRequest_completionHandler__onceToken != -1)
    dispatch_once(&_gkSendAsynchronousRequest_completionHandler__onceToken, &__block_literal_global_114);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_2;
  v10[3] = &unk_1E75B23E8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

@end
