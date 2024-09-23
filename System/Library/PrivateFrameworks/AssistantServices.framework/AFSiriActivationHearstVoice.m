@implementation AFSiriActivationHearstVoice

void __AFSiriActivationHearstVoice_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0);

  }
}

@end
