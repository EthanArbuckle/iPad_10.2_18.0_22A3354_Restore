@implementation NSKeyValueChangeDictionary

- (NSKeyValueChangeDictionary)initWithDetailsNoCopy:(id *)a3 originalObservable:(id)a4 isPriorNotification:(BOOL)a5
{
  NSKeyValueChangeDictionary *result;
  id var4;
  __int128 v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueChangeDictionary;
  result = -[NSKeyValueChangeDictionary init](&v11, sel_init);
  if (result)
  {
    var4 = a3->var4;
    v10 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_details.kind = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->_details.newValue = v10;
    result->_details.extraData = var4;
    result->_originalObservable = a4;
    result->_isPriorNotification = a5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_isRetainingObjects)
  {

    self->_isRetainingObjects = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueChangeDictionary;
  -[NSKeyValueChangeDictionary dealloc](&v3, sel_dealloc);
}

- (void)setDetailsNoCopy:(id *)a3 originalObservable:(id)a4
{
  $B9E059DF55EF53DAD5DB5AEA9942AC95 *p_details;
  __int128 v8;
  __int128 v9;

  if (self->_isRetainingObjects)
  {
    p_details = &self->_details;

    self->_isRetainingObjects = 0;
  }
  v8 = *(_OWORD *)&a3->var0;
  v9 = *(_OWORD *)&a3->var2;
  self->_details.extraData = a3->var4;
  *(_OWORD *)&self->_details.kind = v8;
  *(_OWORD *)&self->_details.newValue = v9;
  self->_originalObservable = a4;
}

- (void)retainObjects
{
  $B9E059DF55EF53DAD5DB5AEA9942AC95 *p_details;
  NSObject *v4;
  NSObject *v5;
  NSIndexSet *v6;
  NSObject *v7;

  if (!self->_isRetainingObjects)
  {
    p_details = &self->_details;
    v4 = self->_details.oldValue;
    v5 = p_details->newValue;
    v6 = p_details->indexes;
    v7 = self->_originalObservable;
    self->_isRetainingObjects = 1;
  }
}

- (id)keyEnumerator
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("kind");
  if (self->_details.oldValue)
  {
    v6[1] = CFSTR("old");
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }
  if (self->_details.newValue)
    v6[v2++] = CFSTR("new");
  if (self->_details.indexes)
    v6[v2++] = CFSTR("indexes");
  if (self->_originalObservable)
    v6[v2++] = 0x1E0F61DF0;
  if (self->_isPriorNotification)
    v6[v2++] = CFSTR("notificationIsPrior");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v6, v2);
  v4 = (void *)objc_msgSend(v3, "objectEnumerator");

  return v4;
}

- (id)objectForKey:(id)a3
{
  if (CFSTR("kind") == a3)
    return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_details.kind);
  if (CFSTR("new") == a3)
    return self->_details.newValue;
  if (CFSTR("old") == a3)
    return self->_details.oldValue;
  if (CFSTR("indexes") == a3)
    return self->_details.indexes;
  if (a3 == CFSTR("originalObservable"))
    return self->_originalObservable;
  if (CFSTR("notificationIsPrior") == a3 && self->_isPriorNotification)
    return (id)*MEMORY[0x1E0C9AE50];
  if (objc_msgSend(a3, "isEqualToString:"))
    return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_details.kind);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("new")))
    return self->_details.newValue;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("old")))
    return self->_details.oldValue;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("indexes")))
    return self->_details.indexes;
  if (objc_msgSend(a3, "isEqualToString:", 0x1E0F61DF0))
    return self->_originalObservable;
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("notificationIsPrior")))
    return 0;
  if (self->_isPriorNotification)
    return (id)*MEMORY[0x1E0C9AE50];
  return 0;
}

- (void)setOriginalObservable:(id)a3
{
  NSObject *originalObservable;
  id v5;
  id v6;

  originalObservable = self->_originalObservable;
  if (originalObservable != a3)
  {
    if (self->_isRetainingObjects)
    {
      v6 = a3;

      a3 = v6;
    }
    self->_originalObservable = a3;
    if (self->_isRetainingObjects)
      v5 = a3;
  }
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  v2 = 1;
  if (self->_details.oldValue)
    v2 = 2;
  if (self->_details.newValue)
    ++v2;
  if (self->_details.indexes)
    v3 = v2 + 1;
  else
    v3 = v2;
  if (self->_originalObservable)
    ++v3;
  return v3 + self->_isPriorNotification;
}

@end
