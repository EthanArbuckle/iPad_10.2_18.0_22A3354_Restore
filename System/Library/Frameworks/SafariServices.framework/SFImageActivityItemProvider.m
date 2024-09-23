@implementation SFImageActivityItemProvider

void __42___SFImageActivityItemProvider__imageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(v4, "getCFRunLoop"));
}

@end
