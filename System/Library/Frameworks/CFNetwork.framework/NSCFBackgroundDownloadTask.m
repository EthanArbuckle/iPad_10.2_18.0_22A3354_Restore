@implementation NSCFBackgroundDownloadTask

void __60____NSCFBackgroundDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1)
  {
    v2 = *(_BYTE **)(a1 + 40);
    if (objc_msgSend(*(id *)(a1 + 32), "state") > 2 || v1[772])
    {
      v3 = objc_msgSend(v1, "session");
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
      v9 = &unk_1E14FDEB0;
      v10 = v2;
      -[NSURLSession runDelegateBlock:](v3, &v6);
    }
    else
    {
      v1[772] = 1;
      objc_msgSend(v1, "setState:", 2);
      v4 = (void *)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend(v1, "session"));
      v5 = objc_msgSend(v1, "taskIdentifier");
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke;
      v9 = &unk_1E14F9A08;
      v10 = v1;
      v11 = v2;
      objc_msgSend(v4, "cancelTaskWithIdentifier:byProducingResumeData:", v5, &v6);
    }
  }
}

void __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1, NSData *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  if (a2)
    -[__NSURLBackgroundSession moveFileToTempForBackgroundResumeData:](objc_msgSend(*(id *)(a1 + 32), "session"), a2);
  v4 = objc_msgSend(*(id *)(a1 + 32), "session");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
  v6[3] = &unk_1E14FDF00;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:](v4, v6);
}

uint64_t __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69____NSCFBackgroundDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67____NSCFBackgroundDownloadTask__onqueue_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pathToDownloadTaskFile");
  if (!result)
    return unlink((const char *)objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation"));
  return result;
}

@end
