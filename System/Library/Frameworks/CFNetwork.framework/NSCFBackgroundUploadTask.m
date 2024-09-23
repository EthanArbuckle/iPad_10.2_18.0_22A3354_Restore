@implementation NSCFBackgroundUploadTask

void __58____NSCFBackgroundUploadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
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
      v8 = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
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
      v8 = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke;
      v9 = &unk_1E14F9A08;
      v10 = v1;
      v11 = v2;
      objc_msgSend(v4, "cancelTaskWithIdentifier:byProducingResumeData:", v5, &v6);
    }
  }
}

void __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1, void *a2)
{
  __NSCFResumableUploadState *v3;
  const char *v4;
  void *v5;
  id Property;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;

  v3 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, a2);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResumableUploadState:", v3);
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      Property = objc_getProperty(v5, v4, 848, 1);
      v5 = *(void **)(a1 + 32);
    }
    else
    {
      Property = 0;
    }
    objc_msgSend((id)objc_msgSend(v5, "resumableUploadState"), "setUploadFile:", Property);
  }
  v11 = 0;
  v7 = -[__NSCFResumableUploadState createResumeData:]((void *)objc_msgSend(*(id *)(a1 + 32), "resumableUploadState"), &v11);
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  v8 = objc_msgSend(*(id *)(a1 + 32), "session");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
  v10[3] = &unk_1E14FDF00;
  v9 = *(_QWORD *)(a1 + 40);
  v10[4] = v7;
  v10[5] = v9;
  -[NSURLSession runDelegateBlock:](v8, v10);
}

uint64_t __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67____NSCFBackgroundUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
