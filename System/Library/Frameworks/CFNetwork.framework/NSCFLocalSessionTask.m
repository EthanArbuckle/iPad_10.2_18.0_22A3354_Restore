@implementation NSCFLocalSessionTask

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    v2 = v1[88];
    if (!v2)
      v2 = v1[87];
  }
  else
  {
    v2 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v2, v1, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke(uint64_t a1, const char *a2)
{
  _BYTE *v3;
  const char *v4;
  id Property;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3)
    goto LABEL_12;
  Property = objc_getProperty(v3, a2, 784, 1);
  v3 = *(_BYTE **)(a1 + 32);
  if (!Property)
  {
    if (v3)
    {
      if ((v3[927] & 1) != 0)
        goto LABEL_14;
      v3[927] = 1;
      v3 = *(_BYTE **)(a1 + 32);
    }
LABEL_12:
    -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(v3, "session"), *(_QWORD **)(a1 + 32), (void *)objc_msgSend(*(id *)(a1 + 32), "error"));
    goto LABEL_14;
  }
  if (v3)
    v3 = objc_getProperty(v3, v4, 784, 1);
  v7 = _Block_copy(v3);
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_setProperty_atomic_copy(v8, v6, 0, 784);
    v8 = *(void **)(a1 + 32);
  }
  if (objc_msgSend(v8, "_callCompletionHandlerInline", MEMORY[0x1E0C809B0], 3221225472, __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2, &unk_1E14FDF00, v8, v7))__49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2((uint64_t)&v10);
  else
    -[NSURLSession runDelegateBlock:](objc_msgSend(*(id *)(a1 + 32), "session"), &v10);
LABEL_14:
  v9 = -[__NSCFLocalSessionTask localSession](*(void **)(a1 + 32));
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)v9, *(_QWORD *)(a1 + 32));
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && *(_QWORD *)(v5 + 912))
  {
    v6 = *(_DWORD *)(v5 + 920);
    if (v6 <= 0)
      __assert_rtn("-[__NSCFLocalSessionTask _onqueue_resumeWorkQueue]", "LocalSessionTask.mm", 1325, "_connectionWorkQueueSuspensionCount > 0");
    v7 = v6 - 1;
    *(_DWORD *)(v5 + 920) = v7;
    if (!v7)
      objc_msgSend(*(id *)(v5 + 912), "setSuspended:", 0);
  }
  v8 = *(_QWORD *)(a1 + 40);
  v11 = *((_QWORD *)a2 + 2);
  v10 = *a2;
  return (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v8 + 16))(v8, &v10, a3);
}

void __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 776);
  *(_QWORD *)(v2 + 776) = 0;
  v4 = 0;
  if (!objc_msgSend(*(id *)(a1 + 32), "error"))
  {
    v4 = (uint64_t)v3;
    if (!v3)
      v4 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
  }
  +[__NSURLSessionStatistics reportMetricsToSymptoms:](__NSURLSessionStatistics, "reportMetricsToSymptoms:", *(_QWORD *)(a1 + 32));
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v4, objc_msgSend(*(id *)(a1 + 32), "response"), objc_msgSend(*(id *)(a1 + 32), "error"));
  if (v3)
    dispatch_release(v3);
  _Block_release(*(const void **)(a1 + 40));
  -[NSURLSessionTask _resetTaskDelegate](*(_QWORD *)(a1 + 32), v5);
}

void __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 864);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 864));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 864) = 0;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void (***)(_QWORD, _QWORD))(v5 + 40);
  if (v6)
  {
    *(_QWORD *)(v5 + 40) = 0;
    v6[2](v6, a2);
    _Block_release(v6);
  }
}

uint64_t __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  -[__NSCFLocalSessionTask _onqueue_suspendWorkQueue](a1[4]);
  v2 = (void *)a1[4];
  v3 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2;
  v6[3] = &unk_1E14FE190;
  v4 = a1[6];
  v6[4] = v2;
  v6[5] = v4;
  return objc_msgSend(v2, "_onqueue_didReceiveResponse:completion:", v3, v6);
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v7[6];

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", a2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2;
  v7[3] = &unk_1E14FDF00;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = a2;
  v7[5] = v5;
  return objc_msgSend(v4, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v7);
}

uint64_t __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (*(_QWORD *)(a1 + 40) != a2)
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_adoptEffectiveConfiguration:", +[NSURLSessionConfiguration immutableEffectiveConfigurationFromConfig:](NSURLSessionConfiguration, "immutableEffectiveConfigurationFromConfig:", a2));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2(uint64_t a1)
{

}

void __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 792);
  if (v3)
  {
    *(_QWORD *)(v2 + 792) = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3;
    v5[3] = &unk_1E14FDE88;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v4;
    objc_msgSend(v4, "_task_onqueue_didReceiveDispatchData:completionHandler:", v3, v5);
    dispatch_release(v3);
  }
  else
  {
    -[__NSCFLocalSessionTask _finishBecomeDownload:](v2, *(void **)(a1 + 40));
  }

}

uint64_t __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "cfConn"), "setTLSMinimumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

uint64_t __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "cfConn"), "setTLSMaximumSupportedProtocolVersion:", *(unsigned __int16 *)(a1 + 40));
}

void __44____NSCFLocalSessionTask_startResourceTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_timeoutIntervalForResource");
    -[__NSCFLocalSessionTask _onqueue_startResourceTimer:](v1, v3);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  -[__NSCFLocalSessionTask _onqueue_startStartTimer](v4);
}

uint64_t __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)(*(_QWORD *)(a1 + 32) + 888), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904) = result;
  return result;
}

id __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 872) = *(id *)(a1 + 40);
  result = *(id *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880) = result;
  return result;
}

uint64_t __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_alternatePathAvailable:", *(unsigned int *)(a1 + 40));
}

uint64_t __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_conditionalRequirementsChanged:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_connectionWaitingWithReason:", *(_QWORD *)(a1 + 40));
}

uint64_t __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke(id *a1)
{
  return objc_msgSend(a1[4], "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:", objc_msgSend(a1[5], "longLongValue"), objc_msgSend(a1[6], "longLongValue"), objc_msgSend(a1[7], "longLongValue"));
}

uint64_t __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didReceiveDispatchData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didReceiveChallenge:request:withCompletion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentRequest"), *(_QWORD *)(a1 + 48));
}

uint64_t __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_needNewBodyStream:fromOffset:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_needNewBodyStream:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didFinishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releasePreventIdleSleepAssertionIfAppropriate");
}

uint64_t __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_willCacheResponse:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(a1 + 40);
    v3 = v1[88];
    if (!v3)
      v3 = v1[87];
    -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:](v3, v1, v2);
  }
}

uint64_t __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_didReceiveResponse:redirectRequest:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  double v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    v2 = *(double *)(a1 + 40);
    v3 = v1[102];
    v1[102] = 0;
    if (v3)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        v5 = 138543618;
        v6 = objc_msgSend(v1, "_loggableDescription");
        v7 = 2048;
        v8 = v2;
        _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_INFO, "%{public}@ timeout changed to %f, should restart timer", (uint8_t *)&v5, 0x16u);
      }
      dispatch_source_cancel(v3);
      dispatch_release(v3);
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)v1, v2);
    }
  }
}

uint64_t __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel_with_error:", -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](*(void **)(a1 + 32), *(unsigned int *)(a1 + 40)));
}

uint64_t __44____NSCFLocalSessionTask_cancel_with_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel_with_error:", *(_QWORD *)(a1 + 40));
}

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v5 = 138543618;
    v6 = v4;
    v7 = 1024;
    v8 = 180;
    _os_log_error_impl(&dword_183ECA000, v2, OS_LOG_TYPE_ERROR, "%{public}@ will be canceled, because client didn't respond to delegate with new request in %d seconds", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_BYTE *__84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishAllow](*(_BYTE **)(a1 + 32));
}

uint64_t __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_3(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeDownload:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  -[__NSURLSessionLocal task:terminatedConnection:](*(_QWORD *)(a1 + 32), a2);
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[__NSURLSessionLocal task:terminatedConnection:](*(_QWORD *)(a1 + 32), a2);
}

void __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 792);
    if (v4)
    {
      *(_QWORD *)(v3 + 792) = 0;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4;
      v5[3] = &unk_1E14FCA28;
      v5[4] = *(_QWORD *)(a1 + 32);
      v6 = *(_OWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 56);
      objc_msgSend((id)v6, "_task_onqueue_didReceiveDispatchData:completionHandler:", v4, v5);
      dispatch_release(v4);
    }
    else
    {
      -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:](v3, *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
  }

}

uint64_t __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return -[__NSCFLocalSessionTask _finishBecomeStream:forConnection:completionHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
