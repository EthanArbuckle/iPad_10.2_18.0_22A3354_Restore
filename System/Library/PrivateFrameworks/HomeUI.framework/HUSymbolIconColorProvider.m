@implementation HUSymbolIconColorProvider

+ (id)primaryColorForSymbolIconIdentifier:(id)a3
{
  void *v4;
  void *v5;

  HFSymbolIconAccessoryTypeForSymbol();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "primaryColorForSymbolIconAccessoryType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)primaryColorForSymbolIconAccessoryType:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (_MergedGlobals_635 != -1)
    dispatch_once(&_MergedGlobals_635, &__block_literal_global_2_5);
  v4 = (id)qword_1ED580BF8;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __68__HUSymbolIconColorProvider_primaryColorForSymbolIconAccessoryType___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0D30F40];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = *MEMORY[0x1E0D30F30];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = *MEMORY[0x1E0D30F48];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED580BF8;
  qword_1ED580BF8 = v3;

}

@end
