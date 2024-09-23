@implementation NSURLSession

uint64_t __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_semaphore_create(20);
  v1 = (void *)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore;
  _gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue;
  _gkSendAsynchronousRequest_completionHandler__sHandlerQueue = v2;

  objc_msgSend((id)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue, "setName:", CFSTR("com.apple.gamed.networkReplyHandler"));
  return objc_msgSend((id)_gkSendAsynchronousRequest_completionHandler__sHandlerQueue, "setMaxConcurrentOperationCount:", -1);
}

void __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  dispatch_semaphore_wait((dispatch_semaphore_t)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  GKGetRuntimeStrategy();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instrumentedURLSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E75B23C0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dataTaskWithRequest:completionHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

void __74__NSURLSession_GKAdditions___gkSendAsynchronousRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  dispatch_semaphore_signal((dispatch_semaphore_t)_gkSendAsynchronousRequest_completionHandler__sNetworkSemaphore);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v7, v10, v8);

}

@end
