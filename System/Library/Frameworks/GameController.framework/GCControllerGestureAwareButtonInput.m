@implementation GCControllerGestureAwareButtonInput

void __68___GCControllerGestureAwareButtonInput_registerSetValueEvent_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_opt_new();
    +[NSDate date](&off_254DF6DA0, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    *(_QWORD *)(v3 + 8) = v5;

    v6 = *(float *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "deadzone");
    *(_BYTE *)(v3 + 16) = v6 > v7;
    if ((objc_msgSend(*(id *)(a1 + 32), "isDoublePressGestureRecognizerEnabled") & 1) == 0)
      *(_BYTE *)(v3 + 20) = 1;
    if ((objc_msgSend(*(id *)(a1 + 32), "isSinglePressGestureRecognizerEnabled") & 1) == 0)
      *(_BYTE *)(v3 + 21) = 1;
    if ((objc_msgSend(*(id *)(a1 + 32), "isLongPressGestureRecognizerEnabled") & 1) == 0)
      *(_BYTE *)(v3 + 19) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "isDoublePressGestureRecognizerEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeDoublePressRecognizerForEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = *(unsigned __int8 *)(v3 + 16);
          v14 = 67109120;
          v15 = v9;
          _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected double press)", (uint8_t *)&v14, 8u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isSinglePressGestureRecognizerEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeSinglePressRecognizerForEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(unsigned __int8 *)(v3 + 16);
          v14 = 67109120;
          v15 = v11;
          _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", (uint8_t *)&v14, 8u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isLongPressGestureRecognizerEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_executeLongPressRecognizerForEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = *(unsigned __int8 *)(v3 + 16);
          v14 = 67109120;
          v15 = v13;
          _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", (uint8_t *)&v14, 8u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "__onqueue_forwardEvent:queue:", v3, *(_QWORD *)(a1 + 40));
    }

  }
}

void __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  int v4;
  _QWORD block[5];
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 1;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 67109120;
      v7 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected double press)", buf, 8u);
    }

  }
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[17] && v2[18] && v2[19])
  {
    v2[17] = 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 248))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_81;
      block[3] = &unk_24D2B2B20;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:");
  }
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_81(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Double recognizer failed, triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + 16))();
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_82(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Triggering multi press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 16))();
}

void __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 17))
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized after delay", buf, 2u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 232))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_83;
      block[3] = &unk_24D2B2B20;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_83(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Triggering long press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_84(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Triggering long press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_85(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Long press recognizer failed, triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + 16))();
}

uint64_t __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_86(uint64_t a1)
{
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", (uint8_t *)v5, 8u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "Directly triggering single press gesture handler for %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + 16))();
}

uint64_t __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke_87(uint64_t a1)
{
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", (uint8_t *)v5, 8u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "__onqueue_forwardEvent:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

@end
