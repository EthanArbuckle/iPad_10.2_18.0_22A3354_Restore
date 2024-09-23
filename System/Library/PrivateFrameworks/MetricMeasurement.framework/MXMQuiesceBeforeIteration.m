@implementation MXMQuiesceBeforeIteration

void __MXMQuiesceBeforeIteration_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 6;
    objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMInstrumentErrorDomain"), CFSTR("Did not quiesce within time limit to specified cpu idle percentage."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }

}

@end
