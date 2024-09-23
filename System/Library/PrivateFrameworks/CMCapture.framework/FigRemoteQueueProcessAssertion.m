@implementation FigRemoteQueueProcessAssertion

void __FigRemoteQueueProcessAssertion_awakeClientAndRunCallback_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RemoteQueue.%d.isReleasingResourcesProcessAssertion"), *(unsigned int *)(a1 + 40), 0);
  v4 = objc_alloc(MEMORY[0x1E0D87C98]);
  v5 = objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", *(unsigned int *)(a1 + 40));
  v8[0] = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.cameracapture"), CFSTR("HoldingBuffer"));
  v6 = (void *)objc_msgSend(v4, "initWithExplanation:target:attributes:", v3, v5, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
  objc_msgSend(v6, "acquireWithError:", &v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v6, "invalidate");

  objc_autoreleasePoolPop(v2);
}

@end
