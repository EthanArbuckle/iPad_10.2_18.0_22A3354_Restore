@implementation AXUIMakeTouch

uint64_t ___AXUIMakeTouch_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  double v7;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3E78]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = mach_absolute_time();
  v6 = dword_1EF505BE0;
  if (!dword_1EF505BE0)
  {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo);
    v6 = dword_1EF505BE0;
  }
  v7 = (double)(v5 * MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo / v6) / 1000000000.0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPhase:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTimestamp:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTapCount:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setWindow:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_setLocationInWindow:resetPrevious:", 1, *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_setIsFirstTouchForView:", 1);
}

@end
