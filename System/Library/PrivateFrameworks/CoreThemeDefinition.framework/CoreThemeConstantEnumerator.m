@implementation CoreThemeConstantEnumerator

- (CoreThemeConstantEnumerator)initWithGlobalListAtAddress:(void *)a3
{
  CoreThemeConstantEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CoreThemeConstantEnumerator;
  result = -[CoreThemeConstantEnumerator init](&v5, sel_init);
  result->_globalListPointer = a3;
  result->_listIndex = -1;
  result->_indexOfLastEntry = -1;
  return result;
}

+ (id)enumeratorForGlobalListAtAddress:(void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithGlobalListAtAddress:", a3);
}

- (void)_moveToIndexOfLastEntry
{
  id v3;
  int64_t v4;

  self->_listIndex = -1;
  do
    v3 = -[CoreThemeConstantEnumerator nextConstantHelper](self, "nextConstantHelper");
  while (v3 && objc_msgSend((id)objc_msgSend(v3, "label"), "length"));
  v4 = self->_listIndex - 1;
  self->_listIndex = v4;
  self->_indexOfLastEntry = v4;
}

- (int64_t)constantCount
{
  int64_t indexOfLastEntry;
  int64_t listIndex;

  indexOfLastEntry = self->_indexOfLastEntry;
  if (indexOfLastEntry < 0)
  {
    listIndex = self->_listIndex;
    -[CoreThemeConstantEnumerator _moveToIndexOfLastEntry](self, "_moveToIndexOfLastEntry");
    self->_listIndex = listIndex;
    indexOfLastEntry = self->_indexOfLastEntry;
  }
  return indexOfLastEntry + 1;
}

- (id)currentConstantHelper
{
  return +[CoreThemeConstantHelper helperForStructAtIndex:inAssociatedGlobalList:](CoreThemeConstantHelper, "helperForStructAtIndex:inAssociatedGlobalList:", self->_listIndex, self->_globalListPointer);
}

- (id)nextConstantHelper
{
  id v2;
  int64_t listIndex;

  if (self->_isPastLastEntry)
    return 0;
  listIndex = self->_listIndex;
  self->_listIndex = listIndex + 1;
  if (__PAIR128__(listIndex, self->_globalListPointer) == __PAIR128__(-1, MEMORY[0x24BE28D38]))
    self->_listIndex = 1;
  v2 = -[CoreThemeConstantEnumerator currentConstantHelper](self, "currentConstantHelper");
  if (!objc_msgSend((id)objc_msgSend(v2, "label"), "length"))
    self->_isPastLastEntry = 1;
  return v2;
}

- (id)previousConstantHelper
{
  int64_t listIndex;

  listIndex = self->_listIndex;
  if (listIndex < 0)
    return 0;
  self->_listIndex = listIndex - 1;
  self->_isPastLastEntry = 0;
  return -[CoreThemeConstantEnumerator currentConstantHelper](self, "currentConstantHelper");
}

- (id)firstConstantHelper
{
  id v3;

  self->_listIndex = 0;
  v3 = -[CoreThemeConstantEnumerator currentConstantHelper](self, "currentConstantHelper");
  if (!objc_msgSend((id)objc_msgSend(v3, "label"), "length"))
    self->_isPastLastEntry = 1;
  return v3;
}

- (id)lastConstantHelper
{
  int64_t indexOfLastEntry;

  indexOfLastEntry = self->_indexOfLastEntry;
  if (indexOfLastEntry < 0)
    -[CoreThemeConstantEnumerator _moveToIndexOfLastEntry](self, "_moveToIndexOfLastEntry");
  else
    self->_listIndex = indexOfLastEntry;
  return -[CoreThemeConstantEnumerator currentConstantHelper](self, "currentConstantHelper");
}

@end
