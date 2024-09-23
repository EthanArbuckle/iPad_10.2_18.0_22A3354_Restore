@implementation DisplayGetWeakCap

void __DisplayGetWeakCap_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1312);
  if (*(float *)(*(_QWORD *)(a1 + 40) + 524) < *(float *)(*(_QWORD *)(a1 + 40) + 1312))
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _DisplayPerceptualLuminanceToLuminanceInternal(*(_QWORD *)(a1 + 40), *(float *)(*(_QWORD *)(a1 + 40) + 608));
}

@end
