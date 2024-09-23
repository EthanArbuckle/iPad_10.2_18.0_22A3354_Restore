@implementation NSCFLocalUploadTask

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2(uint64_t a1)
{
  -[__NSCFLocalUploadTask _private_completionAfterMetrics](*(_BYTE **)(a1 + 32));
}

void __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = v2[88];
    if (!v3)
      v3 = v2[87];
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke_2;
  v5[3] = &unk_1E14FE118;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v3, v2, v4, v5);
}

void __48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke(uint64_t a1)
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

uint64_t __53____NSCFLocalUploadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancelByProducingResumeData:", *(_QWORD *)(a1 + 40));
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56____NSCFLocalUploadTask__private_completionAfterMetrics__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

@end
