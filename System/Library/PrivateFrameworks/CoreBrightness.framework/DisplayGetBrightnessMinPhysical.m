@implementation DisplayGetBrightnessMinPhysical

float ___DisplayGetBrightnessMinPhysical_block_invoke(uint64_t a1)
{
  float result;

  if (getClientOverrideState(*(_QWORD *)(a1 + 40), 1)
    && *(float *)(*(_QWORD *)(a1 + 40) + 968) == *(float *)(*(_QWORD *)(a1 + 40) + 396))
  {
    result = *(float *)(*(_QWORD *)(a1 + 40) + 1532);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    result = *(float *)(*(_QWORD *)(a1 + 40) + 396);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
