@implementation CDPerfMetricFamily

void __48___CDPerfMetricFamily_perfMetricFamilyWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _CDPerfMetricFamily *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend((id)_CDPerfMetricFamilies, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = -[_CDPerfMetricFamily initWithName:]([_CDPerfMetricFamily alloc], "initWithName:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v8)
      objc_msgSend((id)_CDPerfMetricFamilies, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));
  }
}

void __49___CDPerfMetricFamily_perfMetricWithName_string___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _CDMutablePerfMetric *v5;
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
    v5 = -[_CDMutablePerfMetric initWithName:string:family:]([_CDMutablePerfMetric alloc], "initWithName:string:family:", a1[5], a1[6], a1[4]);
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v8)
      objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v8, a1[5]);
  }
}

void __42___CDPerfMetricFamily_perfMetricWithName___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37___CDPerfMetricFamily_allPerfMetrics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
