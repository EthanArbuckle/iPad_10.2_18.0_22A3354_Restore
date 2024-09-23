@implementation NSCFURLLocalSessionConnection

uint64_t __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  _QWORD v5[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 176) = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184) = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 48), "_didFinishWithError:", objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0));
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 144) = 0;
  result = objc_msgSend(*(id *)(a1 + 40), "expectedContentLength");
  v3 = result;
  v4 = *(unsigned __int8 *)(a1 + 57);
  if (*(_BYTE *)(a1 + 57))
  {
    result = objc_msgSend(*(id *)(a1 + 40), "_inner");
    if (*(_DWORD *)(result + 72) == 2)
    {
      v4 = 0;
    }
    else
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        result = objc_msgSend(*(id *)(a1 + 40), "statusCode");
        v4 = result != 206;
      }
      else
      {
        v4 = 1;
      }
    }
  }
  if (*(_BYTE *)(a1 + 59))
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 144) = v3;
  if (v4)
    result = -[__NSCFURLSessionConnection _setupForCache:expectedLength:response:](*(_QWORD *)(a1 + 48), v3, *(void **)(a1 + 40));
  if (*(_BYTE *)(a1 + 60))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 136) = 4;
    result = *(_QWORD *)(a1 + 48);
    if (result)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
      v5[3] = &unk_1E14F7970;
      v5[4] = result;
      return objc_msgSend((id)result, "withLoaderAsync:", v5);
    }
  }
  return result;
}

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_2(uint64_t a1, __int128 *a2)
{
  _BYTE *v4;
  _QWORD v5[4];
  __int128 v6;
  _BYTE *v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[6];

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[168])
  {
    objc_msgSend(v4, "resume");
    v4 = *(_BYTE **)(a1 + 32);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3;
  v5[3] = &unk_1E14FBE60;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v4;
  v8 = *a2;
  v9 = *((_QWORD *)a2 + 2);
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v10[3] = &unk_1E14FDF00;
    v10[4] = v4;
    v10[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v4, (const char *)v10);
  }
}

void *__51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2(uint64_t a1)
{
  void *result;
  _QWORD v2[5];

  result = *(void **)(a1 + 32);
  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
    v2[3] = &unk_1E14F7970;
    v2[4] = result;
    return (void *)objc_msgSend(result, "withLoaderAsync:", v2);
  }
  return result;
}

uint64_t __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
}

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4;
  v5[3] = &unk_1E14FDF00;
  v3 = *(dispatch_queue_t **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_1E14FDF00;
    v6[4] = v3;
    v6[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v3, (const char *)v6);
  }
}

uint64_t __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishWithError:", objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0));
}

void __71____NSCFURLLocalSessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DB8C8C]();
  -[__NSCFURLLocalSessionConnection _tick](*(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

uint64_t __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke(uint64_t a1)
{
  uint64_t v2;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return -[__NSCFURLLocalSessionConnection _tick](*(_QWORD *)(a1 + 32));
}

uint64_t __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3(uint64_t a1)
{
  const char *v2;
  void *v3;

  if (nw_settings_get_signposts_enabled())
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      objc_getProperty(v3, v2, 8, 1);
    kdebug_trace();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_ackBytes:", *(_QWORD *)(a1 + 48));
}

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3(uint64_t a1)
{
  return -[__NSCFURLSessionConnection _storeCachedResponse:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke(uint64_t a1, void *a2)
{
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    if (nw_settings_get_signposts_enabled())
    {
      v5 = *(void **)(a1 + 32);
      if (v5)
        objc_getProperty(v5, v4, 8, 1);
      kdebug_trace();
    }
    LODWORD(v7) = *(_DWORD *)(a1 + 56);
    objc_msgSend(a2, "connection:didReceiveData:completion:", MEMORY[0x1E0C809B0], 3221225472, __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2, &unk_1E14F79F8, *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48), v7);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      --*(_QWORD *)(v6 + 112);
      -[__NSCFURLLocalSessionConnection _tick](v6);
    }
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2(int8x16_t *a1, const char *a2)
{
  id Property;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  uint64_t v7;
  __int32 v8;
  _QWORD v9[6];

  Property = (id)a1[2].i64[0];
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  objc_msgSend(Property, "_consumePendingBytesReceivedEncoded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3;
  v5[3] = &unk_1E14F79F8;
  v8 = a1[3].i32[2];
  v7 = a1[3].i64[0];
  v4 = a1[2];
  v6 = vextq_s8(v4, v4, 8uLL);
  if (v4.i64[0])
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v9[3] = &unk_1E14FDF00;
    v9[4] = v4.i64[0];
    v9[5] = v5;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v4.i64[0], (const char *)v9);
  }
}

uint64_t __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v5;
  uint64_t v6;
  id v7;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  v6 = objc_msgSend(Property, "_metrics");
  v7 = *(id *)(a1 + 32);
  if (v7)
    v7 = objc_getProperty(v7, v5, 8, 1);
  -[__CFN_TaskMetrics nextTransaction:withNewRequest:](v6, 1025, (void *)objc_msgSend(v7, "currentRequest"));
  return (*(uint64_t (**)(const char *, _QWORD))(*(_QWORD *)a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  __CFError *v6;
  __CFError *v7;
  dispatch_queue_t *v8;
  _QWORD v9[5];

  v4 = *(id *)(a1 + 32);
  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(__CFError **)(v5 + 128);
    if (v6)
    {
      v7 = cfnTranslateCFError(v6, (void *)objc_msgSend(*(id *)(v5 + 8), "currentRequest_URL"));
      v5 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(a2, "connection:didFinishLoadingWithError:", v5, v7);
  }
  v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2;
  v9[3] = &unk_1E14FE118;
  v9[4] = v8;
  -[__NSCFURLSessionConnection withWorkQueueAsync:](v8, (const char *)v9);

}

void __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "connectionWillFinishLoading:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:didReceiveResponse:completion:");
  }
  else if (v2)
  {
    --*(_QWORD *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(result + 32);
  if (a2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = 3221225472;
    v5 = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_2;
    v6 = &unk_1E14F7A70;
    v7 = v2;
    return objc_msgSend(a2, "connection:willCacheResponse:responseCallback:");
  }
  else if (v2)
  {
    --*(_QWORD *)(v2 + 112);
    return -[__NSCFURLLocalSessionConnection _tick](v2);
  }
  return result;
}

void __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t *v2;
  _QWORD v3[6];
  _QWORD v4[6];

  v2 = *(dispatch_queue_t **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3;
  v3[3] = &unk_1E14FDE88;
  v3[4] = v2;
  v3[5] = a2;
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v4[3] = &unk_1E14FDF00;
    v4[4] = v2;
    v4[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v2, (const char *)v4);
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:challenged:authCallback:");
  }
  else if (v2)
  {
    --*(_QWORD *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  dispatch_queue_t *v8;
  _QWORD v9[4];
  int8x16_t v10;
  dispatch_queue_t *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE buf[32];
  dispatch_queue_t *v15;
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_loggableDescription");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = a3;
    _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", buf, 0x1Cu);
  }
  if (a2 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "previousFailureCount") < 1)
      a2 = 1;
    else
      a2 = 3;
  }
  v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_64;
  v9[3] = &unk_1E14F7C50;
  v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v12 = a3;
  v13 = a2;
  v11 = v8;
  if (v8)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E14FDF00;
    v15 = v8;
    v16 = v9;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v8, buf);
  }
}

void __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    v4 = a1[4];
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[5]);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
    objc_msgSend(a2, "connection:sentBodyBytes:totalBytes:expectedBytes:", v4, v5, v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[7]));
  }
  v7 = a1[4];
  if (v7)
  {
    --*(_QWORD *)(v7 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v7);
  }
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke(_QWORD *a1, void *a2)
{
  dispatch_queue_t *v2;
  _QWORD v3[5];
  _QWORD v4[6];

  v2 = (dispatch_queue_t *)a1[6];
  if (a2)
  {
    objc_msgSend(a2, "connection:wasRedirected:newRequest:responseCallback:", MEMORY[0x1E0C809B0], 3221225472, __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3, &unk_1E14F7BB0, v2, a2, a1[4], a1[5], a1[7]);
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2;
    v3[3] = &unk_1E14FDEB0;
    v3[4] = a1[7];
    if (v2)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
      v4[3] = &unk_1E14FDF00;
      v4[4] = v2;
      v4[5] = v3;
      -[__NSCFURLSessionConnection withWorkQueueAsync:](v2, (const char *)v4);
    }
  }
}

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = objc_msgSend(*(id *)(v3 + 8), "currentRequest");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3;
    v6[3] = &unk_1E14F8860;
    v7 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "connection:_willSendRequestForEstablishedConnection:completion:", v3, v5, v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2;
    v8[3] = &unk_1E14FDEB0;
    v8[4] = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
      v9[3] = &unk_1E14FDF00;
      v9[4] = v3;
      v9[5] = v8;
      -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v3, (const char *)v9);
    }
  }
}

uint64_t __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 152))(a2, *(_QWORD *)(result + 32));
  return result;
}

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject **v13;
  std::__shared_weak_count *v14;
  _QWORD v15[5];
  NSObject **v16;
  std::__shared_weak_count *v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2;
  v15[3] = &unk_1E14FE118;
  v15[4] = v2;
  std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>(&v16, v3, v15);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v13 = v16;
  v14 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, NSObject ***))(*(_QWORD *)v4 + 16))(v4, &v13);
  v7 = v14;
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke(uint64_t a1, uint64_t a2)
{
  CFNumberRef v3;

  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, (const void *)(a1 + 32));
  (*(void (**)(uint64_t, CFNumberRef))(*(_QWORD *)a2 + 104))(a2, v3);
  if (v3)
    CFRelease(v3);
}

uint64_t __41____NSCFURLLocalSessionConnection_resume__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 96) - 1;
  *(_QWORD *)(v2 + 96) = v3;
  if (!v3)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  return result;
}

uint64_t __42____NSCFURLLocalSessionConnection_suspend__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 96);
  *(_QWORD *)(v2 + 96) = v3 + 1;
  if (!v3)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 32))(a2);
  return result;
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t *v6;
  dispatch_queue_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[6];

  if (!a2)
    goto LABEL_9;
  objc_opt_class();
  v4 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", objc_msgSend(a2, "URL"), 0);
    if ((objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x1EDD00BF8) & 1) != 0)
    {
      v6 = &kCFURLSchemeHTTPS;
LABEL_7:
      objc_msgSend(v5, "setScheme:", *v6);
      v4 = (id)objc_msgSend(a2, "mutableCopy");
      objc_msgSend(v4, "setURL:", objc_msgSend(v5, "URL"));
      goto LABEL_8;
    }
    v4 = a2;
    if (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x1EDD00BC0))
    {
      v6 = &kCFURLSchemeHTTP;
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateCurrentRequest:", v4);
LABEL_9:
  v7 = *(dispatch_queue_t **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_4;
  v10[3] = &unk_1E14FDE58;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v13 = a2;
  v14 = v9;
  v12 = v8;
  if (v7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v15[3] = &unk_1E14FDF00;
    v15[4] = v7;
    v15[5] = v10;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](v7, (const char *)v15);
  }
}

void __41____NSCFURLLocalSessionConnection_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject **v13;
  std::__shared_weak_count *v14;
  _QWORD v15[5];
  NSObject **v16;
  std::__shared_weak_count *v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(int *)(v2 + 136) <= 1)
  {
    v4 = *(NSObject **)(v2 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2;
    v15[3] = &unk_1E14FE118;
    v15[4] = v2;
    std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>(&v16, v4, v15);
    v13 = v16;
    v14 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t, NSObject ***))(*(_QWORD *)a2 + 24))(a2, &v13);
    v7 = v14;
    if (v14)
    {
      v8 = (unint64_t *)&v14->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v10 = v17;
    if (v17)
    {
      v11 = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
}

uint64_t __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, float))(*(_QWORD *)a2 + 112))(a2, *(unsigned __int8 *)(a1 + 36), *(float *)(a1 + 32));
}

uint64_t __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 120))(a2, *(_QWORD *)(a1 + 32));
}

uint64_t __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 48))(a2, *(unsigned __int8 *)(a1 + 32));
}

void __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  if (a2)
  {
    v3 = a1[4];
    v4 = (std::__shared_weak_count *)a1[7];
    v11 = a1[6];
    v12 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    objc_msgSend(a2, "connection:didReceiveTCPConnection:extraBytes:", v3, &v11, a1[5]);
    v7 = v12;
    if (v12)
    {
      v8 = (unint64_t *)&v12->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    (*(void (**)(_QWORD))(*(_QWORD *)a1[6] + 152))(a1[6]);
  }
  v10 = a1[4];
  if (v10)
  {
    --*(_QWORD *)(v10 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v10);
  }
}

void __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    objc_msgSend(a2, "connection:didReceiveSocketInputStream:outputStream:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "close");
    objc_msgSend(*(id *)(a1 + 48), "close");
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = objc_msgSend(*(id *)(v2 + 8), "currentRequest");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2;
    v7[3] = &unk_1E14F7CA0;
    v6 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v7[5] = a2;
    objc_msgSend(a2, "connection:request:needsNewBodyStreamFromOffset:callback:", v2, v5, v6, v7);
  }
  else if (v2)
  {
    --*(_QWORD *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;
  _QWORD v6[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3;
  v3[3] = &unk_1E14FE1E0;
  v2 = *(_OWORD *)(a1 + 32);
  v4 = v2;
  v5 = a2;
  if ((_QWORD)v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_1E14FDF00;
    v6[4] = v2;
    v6[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v2, (const char *)v6);
  }
}

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4;
  v3[3] = &unk_1E14F7C00;
  v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 56))(a2, *(_QWORD *)(a1 + 40));
}

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD v6[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = objc_msgSend(*(id *)(v2 + 8), "currentRequest");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2;
    v6[3] = &unk_1E14F7CA0;
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = a2;
    objc_msgSend(a2, "connection:request:needsNewBodyStreamCallback:", v2, v5, v6);
  }
  else if (v2)
  {
    --*(_QWORD *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;
  _QWORD v6[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3;
  v3[3] = &unk_1E14FE1E0;
  v2 = *(_OWORD *)(a1 + 32);
  v4 = v2;
  v5 = a2;
  if ((_QWORD)v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v6[3] = &unk_1E14FDF00;
    v6[4] = v2;
    v6[5] = v3;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v2, (const char *)v6);
  }
}

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4;
  v3[3] = &unk_1E14F7C00;
  v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 56))(a2, *(_QWORD *)(a1 + 40));
}

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2;
  v3[3] = &unk_1E14F7C00;
  v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_64(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v3[5];
  int8x16_t v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_65;
  v3[3] = &unk_1E14F7C28;
  v3[4] = a1[2].i64[1];
  v5 = a1[4].i64[0];
  v1 = a1[3];
  v4 = vextq_s8(v1, v1, 8uLL);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1.i64[0], (uint64_t)v3);
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_65(uint64_t a1, uint64_t a2)
{
  const char *v4;
  const void *v5;
  id Property;

  v5 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_createCFAuthChallenge");
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, const void *))(*(_QWORD *)a2 + 80))(a2, objc_msgSend(*(id *)(a1 + 40), "_CFURLCredential"), v5);
      if (v5)
        goto LABEL_9;
      return;
    case 1:
      (*(void (**)(uint64_t, const void *))(*(_QWORD *)a2 + 72))(a2, v5);
      goto LABEL_11;
    case 2:
      Property = *(id *)(a1 + 48);
      if (Property)
        Property = objc_getProperty(Property, v4, 8, 1);
      objc_msgSend(Property, "cancel");
      goto LABEL_8;
    case 3:
      (*(void (**)(uint64_t, const void *))(*(_QWORD *)a2 + 88))(a2, v5);
LABEL_11:
      if (!v5)
        return;
      goto LABEL_9;
    default:
LABEL_8:
      if (v5)
LABEL_9:
        CFRelease(v5);
      return;
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *v4;

  v4 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_createCFAuthChallenge");
  (*(void (**)(uint64_t, uint64_t, const void *))(*(_QWORD *)a2 + 80))(a2, objc_msgSend(*(id *)(a1 + 40), "_CFURLCredential"), v4);
  if (v4)
    CFRelease(v4);
}

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a2)
    objc_msgSend(a2, "connection:alternatePathAvailable:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a2)
    objc_msgSend(a2, "connection:_conditionalRequirementsChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a2)
    objc_msgSend(a2, "connection:waitingWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a5;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return 1;
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

void __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "connection:didReceiveInformationalResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    --*(_QWORD *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

uint64_t __64____NSCFURLLocalSessionConnection_expectedProgressTargetChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 128))(a2);
}

@end
