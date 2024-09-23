@implementation CSSiriQueueObserver

void __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2 == -2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "timeoutDetected");

  }
}

uint64_t __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", -2);
}

void __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_4;
  block[3] = &unk_1E7C287B8;
  v2 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "cancelIfNotAlreadyCanceled");
}

void __39___CSSiriQueueObserver_startWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "heartBeatFiredWithQueue:", *(_QWORD *)(a1 + 32));

}

@end
