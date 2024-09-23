@implementation FPMakeAsyncCompletionBlock

uint64_t ____FPMakeAsyncCompletionBlock_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void ____FPMakeAsyncCompletionBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1B00850](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTarget:", v4);

  objc_msgSend(v3, "retainArguments");
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____FPMakeAsyncCompletionBlock_block_invoke_2;
  block[3] = &unk_1E444A308;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

@end
