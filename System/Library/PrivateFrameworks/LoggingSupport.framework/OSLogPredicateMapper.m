@implementation OSLogPredicateMapper

void __38___OSLogPredicateMapper_validKeyPaths__block_invoke()
{
  id v0;
  void *v1;
  objc_property_t *v2;
  unint64_t i;
  objc_property_attribute_t *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int outCount;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)validKeyPaths__validKeyPaths;
  validKeyPaths__validKeyPaths = (uint64_t)v0;

  outCount = 0;
  v2 = protocol_copyPropertyList((Protocol *)&unk_1EE52FA28, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v9 = 0;
      v4 = property_copyAttributeList(v2[i], &v9);
      if (v9)
      {
        v5 = 0;
        v6 = 16 * v9;
        while (strcmp(v4[v5 / 0x10].name, "R"))
        {
          v5 += 16;
          if (v6 == v5)
            goto LABEL_7;
        }
        free(v4);
        v7 = (void *)validKeyPaths__validKeyPaths;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v2[i]));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
      else
      {
LABEL_7:
        free(v4);
      }
    }
  }
  free(v2);
}

void __62___OSLogPredicateMapper_mapLeftExpression_andRightExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapLeftExpression_andRightExpression__keypathMaps;
  mapLeftExpression_andRightExpression__keypathMaps = (uint64_t)&unk_1E4165498;

}

void __51___OSLogPredicateMapper_mapSignpostTypeExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapSignpostTypeExpression__types;
  mapSignpostTypeExpression__types = (uint64_t)&unk_1E4165470;

}

void __52___OSLogPredicateMapper_mapSignpostScopeExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapSignpostScopeExpression__scopes;
  mapSignpostScopeExpression__scopes = (uint64_t)&unk_1E4165448;

}

void __50___OSLogPredicateMapper_mapMessageTypeExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapMessageTypeExpression__messageTypes;
  mapMessageTypeExpression__messageTypes = (uint64_t)&unk_1E4165420;

}

void __48___OSLogPredicateMapper_mapEventTypeExpression___block_invoke()
{
  void *v0;

  v0 = (void *)mapEventTypeExpression__eventTypes;
  mapEventTypeExpression__eventTypes = (uint64_t)&unk_1E41653F8;

}

@end
