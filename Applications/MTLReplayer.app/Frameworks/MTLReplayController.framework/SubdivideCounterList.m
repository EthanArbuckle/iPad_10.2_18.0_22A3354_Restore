@implementation SubdivideCounterList

void __SubdivideCounterList_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  FILE *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "defaultCommandQueue"));
  if (g_runningInCI)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SubdivideCounterList - subdividing counter list")));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#CI-INFO# ")));

    v4 = __stdoutp;
    v5 = objc_retainAutorelease(v3);
    fprintf(v4, "#CI-INFO# %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdivideCounterList:", *(_QWORD *)(a1 + 32)));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  validateSubdividedCounterLists(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

@end
