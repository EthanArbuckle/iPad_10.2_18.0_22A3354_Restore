@implementation NSEntityDescription

void __66__NSEntityDescription_HomeKitDaemon__hmd_attributesBySettingsPath__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settingsPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __84__NSEntityDescription_HomeKitDaemon__hmd_recursivelyEnumerateSubentitiesUsingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    || (v8 = v6, (*(void (**)(void))(a1[4] + 16))(), v6 = v8, *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v8, "subentities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));

    v6 = v8;
  }

}

@end
