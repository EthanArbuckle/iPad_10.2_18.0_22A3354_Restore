@implementation AFSiriActivationHearstDoubleTap

void __AFSiriActivationHearstDoubleTap_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v7;
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    objc_msgSend(v3, "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(v3, "actionType");

    v7 = v5 == 1 && v8 == 0;
    (*(void (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v7);

  }
}

@end
