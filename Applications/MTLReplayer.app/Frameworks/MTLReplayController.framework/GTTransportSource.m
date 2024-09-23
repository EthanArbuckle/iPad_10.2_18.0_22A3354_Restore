@implementation GTTransportSource

uint64_t __31__GTTransportSource__dispatch___block_invoke(uint64_t result)
{
  char v1;
  uint64_t v2;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(result + 32) + 56));
  if ((v1 & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if (v2)
      return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 8), *(_QWORD *)(result + 40));
  }
  return result;
}

id __28__GTTransportSource__cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCancellationHandler");
}

id __30__GTTransportSource__register__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callRegistrationHandler");
}

void __44__GTTransportSource_setRegistrationHandler___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v3 + 24))
    {
      v4 = atomic_load((unsigned int *)(v3 + 56));
      v3 = *(_QWORD *)(a1 + 32);
      if ((v4 & 2) != 0)
      {
        v5 = *(NSObject **)(v3 + 40);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __44__GTTransportSource_setRegistrationHandler___block_invoke_2;
        block[3] = &unk_726128;
        block[4] = v3;
        dispatch_async(v5, block);
        v3 = *(_QWORD *)(a1 + 32);
      }
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

id __44__GTTransportSource_setRegistrationHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callRegistrationHandler");
}

void __44__GTTransportSource_setCancellationHandler___block_invoke(uint64_t a1)
{
  char v1;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

void __39__GTTransportSource_setMessageHandler___block_invoke(uint64_t a1)
{
  char v1;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

void __27__GTTransportSource_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancel");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

void __46__GTTransportSource__initWithQueue_transport___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_register");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

@end
