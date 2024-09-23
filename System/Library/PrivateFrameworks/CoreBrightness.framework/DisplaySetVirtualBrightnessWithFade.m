@implementation DisplaySetVirtualBrightnessWithFade

void __DisplaySetVirtualBrightnessWithFade_block_invoke(uint64_t a1)
{
  _DisplaySetVirtualBrightnessWithFade(*(_QWORD *)(a1 + 32), 0, *(void (**)(uint64_t))(a1 + 40), *(_QWORD *)(a1 + 48), *(float *)(a1 + 56), *(float *)(a1 + 60));
}

void __DisplaySetVirtualBrightnessWithFade_block_invoke_2(uint64_t a1)
{
  _DisplaySetLogicalBrightnessWithFade(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 60), *(void (**)(uint64_t))(a1 + 40), *(_QWORD *)(a1 + 48), *(float *)(a1 + 56), *(float *)(a1 + 64));
}

@end
