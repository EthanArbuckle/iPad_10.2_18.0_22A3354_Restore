@implementation EXConcreteExtensionGetLocalizedInfoDictionaryObjectForPlugInAndKeys

void __EXConcreteExtensionGetLocalizedInfoDictionaryObjectForPlugInAndKeys_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(a3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to resolve bundle URL: %@"), v8, 0);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
