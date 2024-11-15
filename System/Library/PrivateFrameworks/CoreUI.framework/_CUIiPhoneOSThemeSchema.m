@implementation _CUIiPhoneOSThemeSchema

- (int64_t)schemaVersion
{
  return 2;
}

- (const)elementCategoryAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (-[_CUIiPhoneOSThemeSchema elementCategoryCount](self, "elementCategoryCount") + 1 > a3)
    return (const $16FE131E8541C6B0378241B103E89A69 *)((char *)&gElementCategoriesEmbedded + 24 * a3);
  _CUILog(1, (uint64_t)"Error: index out of range for elementCategoryAtIndex:", v4, v5, v6, v7, v8, v9, v11);
  return 0;
}

- (unint64_t)elementCategoryCount
{
  return 2;
}

- (const)elementDefinitionAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (-[_CUIiPhoneOSThemeSchema elementDefinitionCount](self, "elementDefinitionCount") > a3)
    return (const $4B781A93770F0198CF8C8B5CE564F6DF *)&gElementDefinitionsEmbedded[444 * a3];
  _CUILog(1, (uint64_t)"Error: index out of range for elementDefinitionsAtIndex:", v4, v5, v6, v7, v8, v9, v11);
  return 0;
}

- (const)_sortedElementDefinitions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52___CUIiPhoneOSThemeSchema__sortedElementDefinitions__block_invoke;
  block[3] = &unk_1E41B23F8;
  block[4] = self;
  if (_sortedElementDefinitions_sortOnce != -1)
    dispatch_once(&_sortedElementDefinitions_sortOnce, block);
  return (const $4B781A93770F0198CF8C8B5CE564F6DF *)_sortedElementDefinitions__sortedElements;
}

- (const)sortedElementDefinitionAtIndex:(unint64_t)a3
{
  return (const $4B781A93770F0198CF8C8B5CE564F6DF *)((char *)-[_CUIiPhoneOSThemeSchema _sortedElementDefinitions](self, "_sortedElementDefinitions")+ 3552 * a3);
}

- (unint64_t)elementDefinitionCount
{
  return 1;
}

- (const)elementDefinitionWithName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  if (v4 && !strcmp("Named Asset", v4))
    return (const $4B781A93770F0198CF8C8B5CE564F6DF *)gElementDefinitionsEmbedded;
  _CUILog(1, (uint64_t)"Unable to find elementDefinition for Name: %@", v5, v6, v7, v8, v9, v10, (uint64_t)a3);
  return 0;
}

- (const)categoryForElementDefinition:(id *)a3
{
  int64_t var3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const $16FE131E8541C6B0378241B103E89A69 *result;

  if (a3->var3 >= 7)
    var3 = 5;
  else
    var3 = a3->var3;
  if (-[_CUIiPhoneOSThemeSchema elementCategoryCount](self, "elementCategoryCount"))
  {
    v11 = 0;
    while (1)
    {
      result = -[_CUIiPhoneOSThemeSchema elementCategoryAtIndex:](self, "elementCategoryAtIndex:", v11);
      if (result->var0 == var3)
        break;
      if (++v11 >= -[_CUIiPhoneOSThemeSchema elementCategoryCount](self, "elementCategoryCount"))
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    _CUILog(1, (uint64_t)"Unable to find category definition for ID: %ld", v5, v6, v7, v8, v9, v10, var3);
    return 0;
  }
  return result;
}

- (id)widgetNameForPartDefinition:(id *)a3
{
  return CFSTR("kCUIWidgetUnspecified");
}

- (id)schemaRenditionsForPartDefinition:(id *)a3
{
  return +[NSArray array](NSArray, "array", a3);
}

- (unint64_t)materialDefinitionCount
{
  return 0;
}

- (const)effectDefinitionAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (-[_CUIiPhoneOSThemeSchema elementDefinitionCount](self, "elementDefinitionCount") > a3)
    return (const $4B781A93770F0198CF8C8B5CE564F6DF *)&gEffectDefinitionsEmbedded[444 * a3];
  _CUILog(1, (uint64_t)"Error: index out of range for effectDefinitionAtIndex:", v4, v5, v6, v7, v8, v9, v11);
  return 0;
}

- (const)_sortedEffectDefinitions
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51___CUIiPhoneOSThemeSchema__sortedEffectDefinitions__block_invoke;
  block[3] = &unk_1E41B23F8;
  block[4] = self;
  if (_sortedEffectDefinitions_sortOnce != -1)
    dispatch_once(&_sortedEffectDefinitions_sortOnce, block);
  return (const $4B781A93770F0198CF8C8B5CE564F6DF *)_sortedEffectDefinitions__sortedEffects;
}

- (const)sortedEffectDefinitionAtIndex:(unint64_t)a3
{
  return (const $4B781A93770F0198CF8C8B5CE564F6DF *)((char *)-[_CUIiPhoneOSThemeSchema _sortedEffectDefinitions](self, "_sortedEffectDefinitions")+ 3552 * a3);
}

- (unint64_t)effectDefinitionCount
{
  return 1;
}

- (const)effectDefinitionWithName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  if (v4 && !strcmp("Named Effect", v4))
    return (const $4B781A93770F0198CF8C8B5CE564F6DF *)gEffectDefinitionsEmbedded;
  _CUILog(1, (uint64_t)"Unable to find elementDefinition for Name: %@", v5, v6, v7, v8, v9, v10, (uint64_t)a3);
  return 0;
}

- (id)schemaEffectRenditionsForPartDefinition:(id *)a3
{
  return +[NSArray array](NSArray, "array", a3);
}

@end
