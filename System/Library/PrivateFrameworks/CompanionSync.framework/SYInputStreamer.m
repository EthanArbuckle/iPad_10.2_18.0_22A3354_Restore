@implementation SYInputStreamer

void __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == 8)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v8 = (void *)qword_253D84AE0;
      if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_ERROR))
        __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_cold_1((uint64_t)v7, v8, v5);
      objc_msgSend(v5, "streamError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_completeAllItemsWithError:", v9);

    }
    else if (a3 == 2)
    {
      objc_msgSend(WeakRetained, "_tryToReadData");
    }
  }

}

void __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_161(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_tryToReadData");
    WeakRetained = v2;
  }

}

uint64_t __48___SYInputStreamer_readDataOfLength_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48___SYInputStreamer_readDataOfLength_completion___block_invoke_162(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc(MEMORY[0x24BDD1540]);
  v3 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v3);

}

uint64_t __48___SYInputStreamer_readDataOfLength_completion___block_invoke_163(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __34___SYInputStreamer__tryToReadData__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, 0);

}

void __47___SYInputStreamer__completeAllItemsWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, 0, *(_QWORD *)(a1 + 40));

}

void __39___SYInputStreamer_stream_handleEvent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "streamError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completeAllItemsWithError:", v2);

}

uint64_t __39___SYInputStreamer_stream_handleEvent___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeAllItemsWithError:", 0);
}

void __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = a2;
  objc_msgSend(a3, "streamError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SYObfuscate(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_4(&dword_211704000, v7, v8, "Input streamer %{public}@: Error from underlying stream: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_12();
}

@end
