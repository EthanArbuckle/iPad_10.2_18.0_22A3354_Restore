@implementation GEOTransitDepartureSequence

void __59___GEOTransitDepartureSequence_firstDepartureValidForDate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
  {
    v10 = v6;
    objc_storeStrong(v8, a2);
    v6 = v10;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = 1;
LABEL_4:

}

uint64_t __55___GEOTransitDepartureSequence_departuresValidForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65___GEOTransitDepartureSequence_operatingHoursForDate_inTimeZone___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_MergedGlobals_285;
  _MergedGlobals_285 = v0;

}

@end
