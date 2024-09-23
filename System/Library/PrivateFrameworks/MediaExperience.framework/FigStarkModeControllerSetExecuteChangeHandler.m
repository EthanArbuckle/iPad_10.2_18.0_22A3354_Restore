@implementation FigStarkModeControllerSetExecuteChangeHandler

void __FigStarkModeControllerSetExecuteChangeHandler_block_invoke(uint64_t a1)
{
  _QWORD *v2;

  _Block_release(*(const void **)(*(_QWORD *)(a1 + 40) + 112));
  v2 = *(_QWORD **)(a1 + 40);
  v2[14] = *(_QWORD *)(a1 + 32);
  CFRelease(v2);
}

@end
