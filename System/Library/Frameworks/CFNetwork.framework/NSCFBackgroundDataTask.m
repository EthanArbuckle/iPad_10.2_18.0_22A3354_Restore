@implementation NSCFBackgroundDataTask

void __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  CFArrayRef v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  if ((void *)a1[4] == a2)
  {
    v7 = a1[5];
    v6 = *(void **)(v7 + 808);
    if (!v6)
      goto LABEL_13;
    goto LABEL_10;
  }
  if (!a2)
  {
    v5 = objc_msgSend(0, "HTTPBodyStream");
    goto LABEL_8;
  }
  v4 = CFURLRequestCopyHTTPRequestBodyParts(a2);
  v5 = objc_msgSend(a2, "HTTPBodyStream");
  if (!v4)
  {
LABEL_8:
    v6 = (void *)v5;
    goto LABEL_9;
  }
  CFRelease(v4);
  v6 = 0;
LABEL_9:
  v7 = a1[5];
LABEL_10:
  if (v6 != *(void **)(v7 + 800) && !*(_BYTE *)(v7 + 840))
    -[__NSCFBackgroundDataTask _onqueue_captureStream:](v7, v6);
LABEL_13:
  v8 = a1[5];
  if (*(_QWORD *)(v8 + 800) && (v9 = objc_msgSend(*(id *)(v8 + 800), "streamStatus"), v8 = a1[5], v9))
  {
    if (*(_BYTE *)(v8 + 840))
    {
      (*(void (**)(_QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], a2, 0);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2;
      v11[3] = &unk_1E14F9968;
      v10 = a1[6];
      v11[4] = a2;
      v11[5] = v10;
      -[__NSCFBackgroundDataTask _onqueue_needNewBodyStream:withCompletion:]((_QWORD *)v8, 1, (uint64_t)v11);
    }
  }
  else
  {
    -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](v8);
    (*(void (**)(_QWORD, void *, id))(a1[6] + 16))(a1[6], a2, *(id *)(a1[5] + 816));
  }

  *(_QWORD *)(a1[5] + 808) = 0;
}

uint64_t __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke(uint64_t a1, NSObject *a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD block[5];
  _BYTE io_handler[24];
  void *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke_2;
    v16[3] = &unk_1E14FE118;
    v16[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v7, v16);
    return;
  }
  if (v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(*(id *)(a1 + 32), "workQueue"));
    if (*(_QWORD *)(v5 + 824))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(v5 + 832);
        *(_DWORD *)io_handler = 138412546;
        *(_QWORD *)&io_handler[4] = v5;
        *(_WORD *)&io_handler[12] = 2048;
        *(_QWORD *)&io_handler[14] = v15;
        _os_log_debug_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEBUG, "%@ got data from stream (ongoing writes: %zu)", io_handler, 0x16u);
        if (!a2)
          goto LABEL_11;
      }
      else if (!a2)
      {
LABEL_11:
        if (a5)
        {
          v13 = objc_msgSend((id)v5, "workQueue");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke_14;
          block[3] = &unk_1E14FE118;
          block[4] = v5;
          dispatch_async(v13, block);
        }
        if (*(_QWORD *)(v5 + 832) >= 4uLL)
        {
          dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend((id)v5, "workQueue"));
          if (*(_BYTE *)(v5 + 841))
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v14 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v5;
              _os_log_debug_impl(&dword_183ECA000, v14, OS_LOG_TYPE_DEBUG, "%@ suspend reading from stream", buf, 0xCu);
            }
            *(_BYTE *)(v5 + 841) = 0;
            (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 784) + 24))(*(_QWORD *)(v5 + 784));
          }
        }
        return;
      }
      ++*(_QWORD *)(v5 + 832);
      v11 = *(NSObject **)(v5 + 824);
      v12 = objc_msgSend((id)v5, "workQueue");
      *(_QWORD *)io_handler = MEMORY[0x1E0C809B0];
      *(_QWORD *)&io_handler[8] = 3221225472;
      *(_QWORD *)&io_handler[16] = __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke;
      v19 = &unk_1E14F99E0;
      v20 = v5;
      v21 = a5;
      dispatch_io_write(v11, 0, a2, v12, io_handler);
      goto LABEL_11;
    }
  }
}

void __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke_2(uint64_t a1)
{
  -[__NSCFBackgroundDataTask _onqueue_finishStream:](*(_QWORD *)(a1 + 32), 0);
}

void __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke(uint64_t a1, int a2, NSObject *a3, int a4)
{
  NSObject *v7;
  NSObject *v8;
  size_t v9;
  int v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  size_t size;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4 || a2)
  {
    if (a4)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 67109120;
        LODWORD(size) = a4;
        _os_log_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEFAULT, "Background upload error %d writing to pipe", (uint8_t *)&v14, 8u);
      }
    }
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(unsigned __int8 *)(a1 + 40);
      dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend(*(id *)(a1 + 32), "workQueue"));
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v11 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(_QWORD *)(v9 + 832);
        v14 = 138412546;
        size = v9;
        v16 = 2048;
        v17 = v13;
        _os_log_debug_impl(&dword_183ECA000, v11, OS_LOG_TYPE_DEBUG, "%@ sent data from stream (ongoing writes: %zu)", (uint8_t *)&v14, 0x16u);
      }
      v12 = *(_QWORD *)(v9 + 832) - 1;
      *(_QWORD *)(v9 + 832) = v12;
      if (!v10 && v12 <= 2)
        -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](v9);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      size = dispatch_data_get_size(a3);
      _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_INFO, "Background upload not done!! remaining size: %ld", (uint8_t *)&v14, 0xCu);
    }
  }
}

void __55____NSCFBackgroundDataTask__onqueue_streamGotData_eof___block_invoke_14(uint64_t a1)
{
  -[__NSCFBackgroundDataTask _onqueue_finishStream:](*(_QWORD *)(a1 + 32), 0);
}

uint64_t __70____NSCFBackgroundDataTask__onqueue_needNewBodyStream_withCompletion___block_invoke(uint64_t a1, void *a2)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 808) = 0;
  -[__NSCFBackgroundDataTask _onqueue_captureStream:](*(_QWORD *)(a1 + 32), a2);
  if (*(_BYTE *)(a1 + 48))
    -[__NSCFBackgroundDataTask _onqueue_startReadingFromStream](*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(id *)(*(_QWORD *)(a1 + 32) + 816));
}

void __51____NSCFBackgroundDataTask__onqueue_captureStream___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeFile");

}

@end
