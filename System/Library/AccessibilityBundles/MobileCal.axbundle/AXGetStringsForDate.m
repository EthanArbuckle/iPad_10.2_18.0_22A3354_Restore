@implementation AXGetStringsForDate

void ___AXGetStringsForDate_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[6];
  v3 = a1[4];
  MEMORY[0x2349148AC]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayShortStringForDate:inCalendar:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
