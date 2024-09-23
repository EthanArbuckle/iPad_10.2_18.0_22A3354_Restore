@implementation NSCFURLLocalStreamTask

void __48____NSCFURLLocalStreamTask_stopSecureConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __57____NSCFURLLocalStreamTask__onqueue_stopSecureConnection__block_invoke;
    v2[3] = &unk_1E14FE118;
    v2[4] = v1;
    objc_msgSend(*(id *)(v1 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v2, (uint64_t)"stopSecure"));
    -[__NSCFURLLocalStreamTask _onqueue_ioTick](v1);
  }
}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke_46(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

uint64_t __49____NSCFURLLocalStreamTask__onqueue_closeWriteOp__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

uint64_t __48____NSCFURLLocalStreamTask__onqueue_closeReadOp__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

BOOL __55____NSCFURLLocalStreamTask__onqueue_shufflePendingFor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = objc_opt_class();
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

void __49____NSCFURLLocalStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_startSecureConnection](*(_QWORD *)(a1 + 32));
}

uint64_t __58____NSCFURLLocalStreamTask__onqueue_startSecureConnection__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_startSecureConnection](*(_QWORD *)(a1 + 32));
}

void __37____NSCFURLLocalStreamTask_closeRead__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37____NSCFURLLocalStreamTask_closeRead__block_invoke_2;
  v4[3] = &unk_1E14FE118;
  v4[4] = v1;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"closeRead"));
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](v3);
}

void __37____NSCFURLLocalStreamTask_closeRead__block_invoke_2(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp](*(_QWORD **)(a1 + 32));
}

void __38____NSCFURLLocalStreamTask_closeWrite__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38____NSCFURLLocalStreamTask_closeWrite__block_invoke_2;
  v4[3] = &unk_1E14FE118;
  v4[4] = v1;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"closeWrite"));
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](v3);
}

void __38____NSCFURLLocalStreamTask_closeWrite__block_invoke_2(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp](*(_QWORD **)(a1 + 32));
}

void __42____NSCFURLLocalStreamTask_captureStreams__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  __CFWriteStream *v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 704);
    if (!v4)
      v4 = *(_QWORD *)(v3 + 696);
  }
  else
  {
    v4 = 0;
  }
  if ((-[__NSCFURLSessionDelegateWrapper didBecomeInputOutputStream](v4, a2) & 1) != 0)
  {
    v5 = *(__CFWriteStream **)(a1 + 32);
    if (*((_QWORD *)v5 + 99) && *((_QWORD *)v5 + 100))
    {
      -[__NSCFURLLocalStreamTask _onqueue_captureStreams](v5);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42____NSCFURLLocalStreamTask_captureStreams__block_invoke_31;
      v10[3] = &unk_1E14FE118;
      v10[4] = v5;
      v7 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v10, (uint64_t)"captureStreams");
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 904);
      if (!v8)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 904);
      }
      objc_msgSend(v8, "addObject:", v7);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v6 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "session"), "delegate");
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_183ECA000, v6, OS_LOG_TYPE_ERROR, "NSURLSession delegate does not support -[NSURLSessionStreamTask captureStreams]; delegate = %@",
        buf,
        0xCu);
    }
    -[__NSCFURLLocalStreamTask _onqueue_cancel](*(_QWORD *)(a1 + 32));
  }
}

void __42____NSCFURLLocalStreamTask_captureStreams__block_invoke_31(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_captureStreams](*(__CFWriteStream **)(a1 + 32));
}

uint64_t __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_captureStreams](*(_QWORD *)(a1 + 32));
}

void __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke_2(id *a1)
{
  uint64_t v2;

  objc_msgSend(a1[4], "_onSessionQueue_disavow");
  objc_msgSend(a1[4], "_onSessionQueue_cleanupAndBreakCycles");
  v2 = *((_QWORD *)a1[4] + 95);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);

}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_cancel__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "resume");
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](*(void **)(a1 + 32));
  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp](*(_QWORD **)(a1 + 32));
  -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp](*(_QWORD **)(a1 + 32));
  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  __NSCFURLLocalStreamTaskWorkWrite *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD aBlock[5];
  id v12;
  id location;
  _QWORD v14[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(int **)(a1 + 32);
  if (v2 <= 1 && v3[194] < 3)
  {
    v6 = [__NSCFURLLocalStreamTaskWorkWrite alloc];
    if (v6)
    {
      v7 = -[__NSCFURLLocalStreamTaskWorkWrite init](v6, "init");
      v8 = (_QWORD *)v7;
      if (v7)
        *(_QWORD *)(v7 + 8) = "writeData";
    }
    else
    {
      v8 = 0;
    }
    v8[7] = objc_msgSend(*(id *)(a1 + 40), "length");
    v8[2] = *(_QWORD *)(a1 + 56);
    v8[3] = 0;
    objc_initWeak(&location, (id)objc_msgSend(*(id *)(a1 + 32), "session"));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E14FCE38;
    objc_copyWeak(&v12, &location);
    aBlock[4] = *(_QWORD *)(a1 + 48);
    v8[8] = _Block_copy(aBlock);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "addObject:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 856);
    if (v9)
    {
      v10 = (id)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v10, "appendData:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v10 = *(id *)(a1 + 40);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856) = v10;
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 1)
      -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v4 = objc_msgSend(v3, "session");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v14[3] = &unk_1E14FDF00;
    v5 = *(_QWORD *)(a1 + 48);
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = v5;
    -[NSURLSession runDelegateBlock:](v4, v14);
  }
}

uint64_t __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = *(_QWORD **)(a1 + 32);
  if (v3 < 2)
    v5 = -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](v4);
  else
    v5 = (void *)v4[117];
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak;
  uint64_t v5;
  _QWORD v6[6];

  Weak = objc_loadWeak((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  v6[3] = &unk_1E14FDF00;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

uint64_t __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __84____NSCFURLLocalStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __NSCFURLLocalStreamTaskWorkRead *v7;
  uint64_t v8;
  uint64_t v9;
  id location;
  uint64_t aBlock;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v1 = a1[4];
  if (v1)
  {
    v3 = a1[6];
    v2 = a1[7];
    v4 = a1[8];
    v5 = (void *)a1[5];
    if (objc_msgSend((id)a1[4], "state") <= 1 && *(int *)(v1 + 776) < 3)
    {
      v7 = [__NSCFURLLocalStreamTaskWorkRead alloc];
      if (v7)
      {
        v8 = -[__NSCFURLLocalStreamTaskWorkRead init](v7, "init");
        v9 = v8;
        if (v8)
          *(_QWORD *)(v8 + 8) = "readData";
      }
      else
      {
        v9 = 0;
      }
      *(_DWORD *)(v9 + 44) = v3;
      *(_DWORD *)(v9 + 48) = v2;
      *(_QWORD *)(v9 + 16) = v4;
      *(_QWORD *)(v9 + 24) = 0;
      objc_initWeak(&location, (id)objc_msgSend((id)v1, "session"));
      aBlock = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
      v14 = &unk_1E14FCDE8;
      objc_copyWeak(&v16, &location);
      v15 = (uint64_t)v5;
      *(_QWORD *)(v9 + 56) = _Block_copy(&aBlock);
      objc_msgSend(*(id *)(v1 + 808), "addObject:", v9);

      -[__NSCFURLLocalStreamTask _onqueue_ioTick](v1);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v6 = objc_msgSend((id)v1, "session");
      aBlock = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
      v14 = &unk_1E14FDF00;
      v15 = v1;
      v16 = v5;
      -[NSURLSession runDelegateBlock:](v6, &aBlock);
    }
  }
}

uint64_t __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;

  v4 = a1 + 32;
  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = v2[833];
  v6 = objc_msgSend(v2, "state");
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 < 2)
    v8 = -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](v7);
  else
    v8 = (void *)v7[117];
  return (*(uint64_t (**)(uint64_t, _QWORD, BOOL, void *))(v3 + 16))(v3, 0, v5 != 0, v8);
}

void __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  id Weak;
  uint64_t v9;
  _QWORD v10[7];
  char v11;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
  v10[3] = &unk_1E14FCDC0;
  v9 = *(_QWORD *)(a1 + 32);
  v10[5] = a4;
  v10[6] = v9;
  v11 = a3;
  v10[4] = a2;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v10);
}

uint64_t __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __34____NSCFURLLocalStreamTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    return -[__NSCFURLLocalStreamTask _onqueue_cancel](*(_QWORD *)(a1 + 32));
  }
  return result;
}

void __43____NSCFURLLocalStreamTask__onqueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(int *)(v2 + 776) < 2)
  {
    if (*(_QWORD *)(v2 + 760))
    {
      -[__NSURLSessionLocal addConnectionlessTask:](objc_msgSend((id)v2, "session"), *(_QWORD *)(a1 + 32));
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 776) = 1;
      (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 760) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 760));
    }
    else
    {
      *(_DWORD *)(v2 + 776) = 4;
      -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](*(__CFWriteStream **)(a1 + 32));
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v3 + 792))
      {
        CFReadStreamSetProperty(*(CFReadStreamRef *)(v3 + 792), (CFStreamPropertyKey)&unk_1EDCFA1A8, 0);
        CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 792));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 792) = 0;
        v3 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v3 + 800))
      {
        CFRelease(*(CFTypeRef *)(v3 + 800));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 800) = 0;
        v3 = *(_QWORD *)(a1 + 32);
      }
      -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v3);
    }
  }
  else
  {
    -[__NSCFURLLocalStreamTask _onqueue_scheduleStreams]((_QWORD *)v2);
    -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
  }
}

uint64_t __34____NSCFURLLocalStreamTask_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resume");
}

void __34____NSCFURLLocalStreamTask_resume__block_invoke_2(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

uint64_t __35____NSCFURLLocalStreamTask_suspend__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD v4[5];

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (!result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke_2;
    v4[3] = &unk_1E14FE118;
    v4[4] = v3;
    if (v3)
      return objc_msgSend(*(id *)(v3 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"suspend"));
  }
  return result;
}

void __35____NSCFURLLocalStreamTask_suspend__block_invoke_3(uint64_t a1)
{
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

__CFWriteStream *__35____NSCFURLLocalStreamTask_suspend__block_invoke_2(uint64_t a1)
{
  __CFWriteStream *result;

  result = (__CFWriteStream *)objc_msgSend(*(id *)(a1 + 32), "state");
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    return -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](*(__CFWriteStream **)(a1 + 32));
  }
  return result;
}

void __55____NSCFURLLocalStreamTask__copySocketStreamProperties__block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

void __51____NSCFURLLocalStreamTask__init_setupTimeoutTimer__block_invoke(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  -[__NSCFURLLocalStreamTask _onqueue_ioTick]((uint64_t)Weak);
}

void __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke_2;
  block[3] = &unk_1E14FE118;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);
}

void __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1120) = 1;
  -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(_QWORD *)(a1 + 32));
}

void __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2;
  block[3] = &unk_1E14FCE88;
  v9 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v7;
  v12 = a2;
  dispatch_async(v6, block);
}

void __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  __CFArray *Mutable;
  const __CFArray *v11;
  const __CFArray *v12;
  unint64_t Count;
  CFRange v14;
  const void **v15;
  CFIndex v16;
  CFTypeRef v17;
  CFIndex range;
  const void **v19;
  _BYTE v20[248];
  CFIndex v21;

  v1 = a1[4];
  if (v1)
  {
    v3 = a1[7];
    v2 = a1[8];
    if ((unint64_t)(v2 - 2) < 2)
    {
      (*(void (**)(_QWORD, _QWORD))(v3 + 16))(a1[7], 0);
      -[__NSCFURLLocalStreamTask _onqueue_cancel](v1);
      return;
    }
    if (v2 == 1)
      goto LABEL_17;
    if (v2)
      return;
    v4 = (void *)a1[6];
    if (!v4)
      goto LABEL_17;
    v5 = objc_msgSend(v4, "_CFURLCredential");
    if (!v5)
      goto LABEL_17;
    v6 = v5;
    if (URLCredential::Class(void)::sOnce_URLCredential != -1)
      dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
    if (*(_DWORD *)(v6 + 48) != 3
      || (v7 = v6 + 16, (v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 16) + 120))(v6 + 16)) == 0))
    {
LABEL_17:
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      return;
    }
    v9 = (const void *)v8;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    CFArrayAppendValue(Mutable, v9);
    v11 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 112))(v7);
    if (!v11)
      goto LABEL_26;
    v12 = v11;
    if (CFArrayGetCount(v11) < 1)
      goto LABEL_26;
    v17 = CFRetain(v12);
    Count = CFArrayGetCount(v12);
    v14.length = Count;
    range = Count;
    if (Count - 1 > 0x1FFFFFFFFFFFFFFDLL)
    {
      v19 = 0;
      goto LABEL_22;
    }
    if (Count > 0x1E)
    {
      v15 = (const void **)malloc_type_malloc(8 * Count, 0x89ED541CuLL);
      v19 = v15;
      if (!v15)
        goto LABEL_22;
      v14.length = range;
    }
    else
    {
      v15 = (const void **)v20;
      v19 = (const void **)v20;
    }
    v14.location = 0;
    CFArrayGetValues(v12, v14, v15);
LABEL_22:
    v21 = 0;
    while (1)
    {
      v16 = v21;
      if (v21 >= range)
        break;
      ++v21;
      CFArrayAppendValue(Mutable, v19[v16]);
    }
    CFContainerEnumeratorBase::~CFContainerEnumeratorBase((CFContainerEnumeratorBase *)&v17);
LABEL_26:
    (*(void (**)(uint64_t, __CFArray *))(v3 + 16))(v3, Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
}

void __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2;
  block[3] = &unk_1E14FCE88;
  v9 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v7;
  v12 = a2;
  dispatch_async(v6, block);
}

uint64_t __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = result;
    result = *(_QWORD *)(result + 56);
    v3 = *(_QWORD *)(v2 + 64);
    if ((unint64_t)(v3 - 2) < 2)
    {
      (*(void (**)(uint64_t, uint64_t))(result + 16))(result, 2);
      return -[__NSCFURLLocalStreamTask _onqueue_cancel](v1);
    }
    else
    {
      if (v3 == 1)
      {
        v4 = *(uint64_t (**)(void))(result + 16);
      }
      else
      {
        if (v3)
          return result;
        v4 = *(uint64_t (**)(void))(result + 16);
      }
      return v4();
    }
  }
  return result;
}

@end
