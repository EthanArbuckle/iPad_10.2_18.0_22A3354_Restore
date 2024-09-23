@implementation CDSizeMetricFamily

void __48___CDSizeMetricFamily_sizeMetricFamilyWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend((id)_CDSizeMetricFamilies, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[_CDSizeMetricFamily initWithName:]([_CDSizeMetricFamily alloc], *(void **)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v8)
      objc_msgSend((id)_CDSizeMetricFamilies, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));
  }
}

void __55___CDSizeMetricFamily_sizeMetricWithName_string_scale___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _CDMutableSizeMetric *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v5 = -[_CDMutableSizeMetric initWithName:string:scale:family:]([_CDMutableSizeMetric alloc], "initWithName:string:scale:family:", a1[5], a1[6], a1[8], a1[4]);
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v8)
      objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v8, a1[5]);
  }
}

@end
