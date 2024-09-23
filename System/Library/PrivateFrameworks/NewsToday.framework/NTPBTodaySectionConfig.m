@implementation NTPBTodaySectionConfig

void __71__NTPBTodaySectionConfig_FCAdditions__sectionConfigWithJSONDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x24BE6C760];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE6C768]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setName:", v11);
    objc_msgSend(v10, "setUrlString:", v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  }
}

@end
