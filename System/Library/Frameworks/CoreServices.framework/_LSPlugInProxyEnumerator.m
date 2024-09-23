@implementation _LSPlugInProxyEnumerator

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  _BOOL4 v6;
  void *v7;
  id v8;
  objc_super v10;
  id v11;

  v10.receiver = self;
  v10.super_class = (Class)_LSPlugInProxyEnumerator;
  v11 = 0;
  v6 = -[_LSApplicationExtensionRecordEnumerator _getObject:atIndex:context:](&v10, sel__getObject_atIndex_context_, &v11, a4, a5);
  if (v6)
  {
    objc_msgSend(v11, "compatibilityObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *a3;
    *a3 = v7;

  }
  return v6;
}

@end
