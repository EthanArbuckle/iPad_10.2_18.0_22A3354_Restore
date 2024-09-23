@implementation NSCFURLSessionDelegateWrapper

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didReceiveData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

void __85____NSCFURLSessionDelegateWrapper_task_didFinishCollectingMetrics_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

void __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_3;
    block[3] = &unk_1E14FDBE0;
    v6 = *(NSObject **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3;
    block[3] = &unk_1E14FDBE0;
    v6 = *(NSObject **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

void __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDA90;
    v4 = *(NSObject **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

void __79____NSCFURLSessionDelegateWrapper_task_didCompleteWithError_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

void __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F6500;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:dataTask:didReceiveResponse:completionHandler:", v3, v4, v5, v6);

}

uint64_t __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14FCEB0;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:didReceiveChallenge:completionHandler:", v3, v4, v5, v6);

}

void __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14FE230;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_willSendRequestForEstablishedConnection:completionHandler:", v3, v4, v5, v6);

}

uint64_t __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __96____NSCFURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_1E14FCEB0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:didReceiveChallenge:completionHandler:", v3, v4, v5);

}

uint64_t __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __84____NSCFURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didBecomeDownloadTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

uint64_t __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F6528;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:dataTask:willCacheResponse:completionHandler:", v3, v4, v5, v6);

}

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_2(uint64_t a1)
{
  if (-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)))
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

void __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14FE070;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:dataTask:_didReceiveData:completionHandler:", v3, v4, v5, v6);

}

void __61____NSCFURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 56);
  if (v3)
    objc_setProperty_atomic(v3, v2, 0, 32);
}

uint64_t __73____NSCFURLSessionDelegateWrapper_didFinishEventsForBackgroundURLSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSessionDidFinishEventsForBackgroundURLSession:", *(_QWORD *)(a1 + 40));
}

void __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F63C0;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_URLSession:task:getAuthHeadersForResponse:completionHandler:", v3, v4, v5, v6);

}

void __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v7 = a3;
  v8 = a4;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_3;
    v10[3] = &unk_1E14FCDC0;
    v9 = *(NSObject **)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = a2;
    v11 = v7;
    v12 = v8;
    dispatch_async(v9, v10);

  }
}

uint64_t __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__openFileAtPath_mode_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_URLSession:openFileAtPath:mode:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F6410;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:willBeginDelayedRequest:completionHandler:", v3, v4, v5, v6);

}

void __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_3;
    block[3] = &unk_1E14FDBE0;
    v6 = *(NSObject **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __64____NSCFURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:taskIsWaitingForConnectivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E14FE230;
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  objc_msgSend(v2, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", v3, v4, v5, v6, v7);

}

void __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_2;
  v5[3] = &unk_1E14F6460;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:task:needNewBodyStream:", v3, v4, v5);

}

void __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F6460;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:task:needNewBodyStreamFromOffset:completionHandler:", v3, v5, v4, v6);

}

void __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  -[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3;
  v7[3] = &unk_1E14FDF00;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14FE230;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_schemeUpgraded:completionHandler:", v3, v4, v5, v6);

}

void __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72____NSCFURLSessionDelegateWrapper_task__conditionalRequirementsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_conditionalRequirementsChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __72____NSCFURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didReceiveInformationalResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14F6928;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_URLSession:task:_willUseEffectiveConfiguration:completionHandler:", v3, v4, v5, v6);

}

void __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if ((-[__NSCFDeallocBomb disarm](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_3;
    v5[3] = &unk_1E14FDF00;
    v4 = *(NSObject **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_isWaitingForConnectionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_taskIsWaitingForConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __64____NSCFURLSessionDelegateWrapper_task__alternatePathAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:_alternatePathAvailable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void __82____NSCFURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didBecomeStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_willRetryBackgroundDataTask:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:_willRetryBackgroundDataTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __92____NSCFURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didFinishDownloadingToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

void __123____NSCFURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
}

uint64_t __85____NSCFURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __68____NSCFURLSessionDelegateWrapper_downloadTask__didReceiveResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_URLSession:downloadTask:didReceiveResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __77____NSCFURLSessionDelegateWrapper_readClosedForStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:readClosedForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
}

void __78____NSCFURLSessionDelegateWrapper_writeClosedForStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:writeClosedForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
}

uint64_t __70____NSCFURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:betterRouteDiscoveredForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __98____NSCFURLSessionDelegateWrapper_streamTask_didBecomeInputStream_outputStream_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:streamTask:didBecomeInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  dispatch_async(*(dispatch_queue_t *)(a1 + 72), *(dispatch_block_t *)(a1 + 80));
}

uint64_t __71____NSCFURLSessionDelegateWrapper__connectionEstablishedForStreamTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_URLSession:connectionEstablishedForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __69____NSCFURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:webSocketTask:didOpenWithProtocol:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __73____NSCFURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:webSocketTask:didCloseWithCode:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

@end
