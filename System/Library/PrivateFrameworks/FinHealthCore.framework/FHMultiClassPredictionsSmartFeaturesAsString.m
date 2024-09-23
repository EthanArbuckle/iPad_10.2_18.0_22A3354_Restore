@implementation FHMultiClassPredictionsSmartFeaturesAsString

void __FHMultiClassPredictionsSmartFeaturesAsString_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  FHMultiClassPredictionsSmartFeaturesArray();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_msgSend(v0, "appendString:", CFSTR("\"), (_QWORD)v9);
        objc_msgSend(v0, "appendString:", v6);
        objc_msgSend(v0, "appendString:", CFSTR("\","));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  if (objc_msgSend(v0, "length"))
    objc_msgSend(v0, "substringToIndex:", objc_msgSend(v0, "length") - 1);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures;
  FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures = v7;

}

@end
