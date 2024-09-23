@implementation HKDerivedCacheIndexAndDateComponents

uint64_t ___HKDerivedCacheIndexAndDateComponents_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;

  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v3 = *(void **)(a1 + 40);
  v4 = v3;

  v5 = *(id *)(a1 + 32);
  objc_msgSend(v4, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "hk_translateDateComponentsToCalendar:calendarUnits:", *(_QWORD *)(a1 + 40), 30);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCalendar:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setEra:", objc_msgSend(v5, "era"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setYear:", objc_msgSend(v5, "year"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setMonth:", objc_msgSend(v5, "month"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDay:", objc_msgSend(v5, "day"));
  }
  objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = llround(v13);

  return 1;
}

@end
