@implementation SAUIAddViews

void __76__SAUIAddViews_ClientFeedbackPresented___af_enumerateClientFeedbackDetails___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v4;
  _BYTE v5[40];

  if (!a2[2])
    objc_storeStrong(a2 + 2, *(id *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v5, (uint64_t)a2);
  (*(void (**)(uint64_t, _BYTE *))(v4 + 16))(v4, v5);
  __destructor_8_s0_s8_s16_s24(a2);
}

@end
