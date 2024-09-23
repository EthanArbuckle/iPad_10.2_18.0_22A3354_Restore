@implementation CUIThemeSchema

+ (id)defaultSchema
{
  return objc_msgSend(a1, "schemaForPlatform:", CUICurrentPlatform());
}

+ (id)schemaForPlatform:(int64_t)a3
{
  id v6;

  if ((unint64_t)a3 > 5 || (v6 = objc_alloc_init(*off_1E41B6398[a3])) == 0)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUIThemeSchema.m"), 123, CFSTR("[CUIThemeSchema schemaForPlatform:] got an unknown platform %d"), a3);
    v6 = 0;
  }
  return v6;
}

- (int64_t)schemaVersion
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 128, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)elementCategoryAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 133, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)elementCategoryCount
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 138, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)elementDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 143, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)elementDefinitionCount
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 148, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)sortedElementDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 154, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)partDefinitionCountForElementDefinition:(id *)a3
{
  $F3885B3EB9D075780A86CFBF71B132DC *var4;
  unint64_t result;
  char *var0;

  if (!a3)
    return 0;
  var4 = a3->var4;
  result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (unint64_t)dimensionDefinitionCountForPartDefinition:(id *)a3
{
  $3373AEF5FA390884F8D3287DCC5DACD6 *var5;
  unint64_t result;
  char *var0;

  if (!a3)
    return 0;
  var5 = a3->var5;
  result = -1;
  do
  {
    var0 = var5->var0;
    ++var5;
    ++result;
  }
  while (var0);
  return result;
}

- (const)elementDefinitionWithName:(id)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 186, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)partDefinitionWithName:(id)a3 forElementDefinition:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  char *var0;
  const $F3885B3EB9D075780A86CFBF71B132DC *v15;
  int v16;
  const $F3885B3EB9D075780A86CFBF71B132DC *v17;

  v6 = (const char *)objc_msgSend(a3, "UTF8String");
  v13 = v6;
  if (!a4 || !v6)
    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("element or part name is invalid"), 0), "raise");
  var0 = a4->var4[0].var0;
  if (!var0)
    goto LABEL_9;
  v15 = (const $F3885B3EB9D075780A86CFBF71B132DC *)&a4[-1].var4[7].var2[4];
  do
  {
    v16 = strcmp(var0, v13);
    v17 = v15 + 1;
    if (!v16)
      break;
    var0 = v15[2].var0;
    ++v15;
  }
  while (var0);
  if (v16)
  {
LABEL_9:
    _CUILog(1, (uint64_t)"Unable to find partDefinition for Name: %@", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    return 0;
  }
  return v17;
}

- (id)widgetNameForPartDefinition:(id *)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 218, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)partDefinitionForWidgetName:(id)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 223, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (id)schemaRenditionsForPartDefinition:(id *)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 229, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (void)enumerateAvailableThemeAttributesInPartDefinition:(id *)a3 usingBlock:(id)a4
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 234, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
}

- (void)enumerateAvailableValuesForThemeAttribute:(int)a3 inPartDefinition:(id *)a4 usingBlock:(id)a5
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", *(_QWORD *)&a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 239, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
}

- (const)categoryForElementDefinition:(id *)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 245, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)effectDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 250, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)sortedEffectDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 254, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)effectDefinitionWithName:(id)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 259, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)effectDefinitionCount
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 264, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)partDefinitionCountForEffectDefinition:(id *)a3
{
  $F3885B3EB9D075780A86CFBF71B132DC *var4;
  unint64_t result;
  char *var0;

  if (!a3)
    return 0;
  var4 = a3->var4;
  result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (id)schemaEffectRenditionsForPartDefinition:(id *)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 283, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)materialDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 291, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)sortedMaterialDefinitionAtIndex:(unint64_t)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 295, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (const)materialDefinitionWithName:(id)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 300, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)materialDefinitionCount
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 305, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

- (unint64_t)partDefinitionCountForMaterialDefinition:(id *)a3
{
  $F3885B3EB9D075780A86CFBF71B132DC *var4;
  unint64_t result;
  char *var0;

  if (!a3)
    return 0;
  var4 = a3->var4;
  result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (id)schemaMaterialRenditionsForPartDefinition:(id *)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchema.m"), 324, CFSTR("-[CUIThemeSchema %@] is abstract and should not be called"), NSStringFromSelector(a2));
  return 0;
}

@end
