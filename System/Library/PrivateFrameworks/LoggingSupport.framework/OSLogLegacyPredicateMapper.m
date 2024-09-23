@implementation OSLogLegacyPredicateMapper

void __68___OSLogLegacyPredicateMapper_mapLeftExpression_andRightExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapLeftExpression_andRightExpression__keypathMaps_349;
  mapLeftExpression_andRightExpression__keypathMaps_349 = (uint64_t)&unk_1E41654C0;

}

void __44___OSLogLegacyPredicateMapper_validKeyPaths__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  objc_property_t *v3;
  objc_property_t *v4;
  unint64_t i;
  void *v6;
  void *v7;
  unsigned int outCount;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)validKeyPaths__legacyValidKeyPaths;
  validKeyPaths__legacyValidKeyPaths = (uint64_t)v0;

  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  v9[5] = objc_opt_class();
  v9[6] = objc_opt_class();
  v9[7] = objc_opt_class();
  v9[8] = objc_opt_class();
  v9[9] = objc_opt_class();
  v2 = 0;
  v9[10] = objc_opt_class();
  do
  {
    outCount = 0;
    v3 = class_copyPropertyList((Class)v9[v2], &outCount);
    if (v3)
    {
      v4 = v3;
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          v6 = (void *)validKeyPaths__legacyValidKeyPaths;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v4[i]));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v7);

        }
      }
      free(v4);
    }
    ++v2;
  }
  while (v2 != 11);
}

@end
