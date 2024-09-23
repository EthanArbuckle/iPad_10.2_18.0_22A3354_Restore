@implementation NSURLSessionStatistics

void __57____NSURLSessionStatistics_createCFNetworkTaskMetrics_s___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3
    && (v5 = CFEqual((CFTypeRef)objc_msgSend(*(id *)(v3 + 112), "disposition"), &unk_1EDD00610), v4, v5))
  {
    v6 = objc_msgSend(v13, "copy");
  }
  else
  {
    v7 = objc_msgSend(v13, "count");
    do
    {
      v8 = v7--;
      if (v7 < 0)
        break;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v10 = v9 ? v9[26] : 0;

    }
    while (v10 != 1025);
    objc_msgSend(v13, "subarrayWithRange:", v8, objc_msgSend(v13, "count") - v8);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

@end
