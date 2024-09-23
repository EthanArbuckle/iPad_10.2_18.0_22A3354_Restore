@implementation DKOrientationMonitor

void __30___DKOrientationMonitor_start__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation") - 1;
  if (v2 > 3)
    v3 = 2;
  else
    v3 = qword_219084A00[v2];
  +[_DKOrientationMonitor _eventWithValue:](_DKOrientationMonitor, "_eventWithValue:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "historicalStateHasChanged:"))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 152);
    +[_DKOrientationMonitor _BMEventWithValue:](_DKOrientationMonitor, "_BMEventWithValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "setCurrentEvent:inferHistoricalState:", v6, 1);

}

void __30___DKOrientationMonitor_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30___DKOrientationMonitor_start__block_invoke_2;
  v12[3] = &unk_24DA66D60;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v14 = v7;
  v8 = v12;
  v9 = v4;
  v10 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_4;
  block[3] = &unk_24DA66E28;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  dispatch_async(v5, block);

}

@end
