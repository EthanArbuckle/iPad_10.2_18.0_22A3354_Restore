@implementation MTLDebugResource

- (MTLDebugResource)initWithBaseObject:(id)a3
{
  MTLDebugResource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResource;
  result = -[MTLDebugResource init](&v5, sel_init);
  if (result)
    result->_baseObject = a3;
  return result;
}

- (BOOL)doesAliasResource:(id)a3
{
  objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "device");
  _MTLMessageContextBegin_();
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap"))
    _MTLMessageContextPush_();
  if (!objc_msgSend(a3, "heap"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasResource:", objc_msgSend(a3, "baseObject"));
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;

  objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0, *MEMORY[0x24BDAC8D0]), "device");
  _MTLMessageContextBegin_();
  if (a4)
  {
    if (a3)
    {
      v7 = 0;
    }
    else
    {
      _MTLMessageContextPush_();
      v7 = 1;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    v7 = a3 == 0;
  }
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap"))
    _MTLMessageContextPush_();
  if (a4)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    v11 = 0;
    do
    {
      if (!objc_msgSend((id)a3[v11], "heap"))
        _MTLMessageContextPush_();
      ++v11;
    }
    while (a4 != v11);
  }
  _MTLMessageContextEnd();
  if (!a4)
    return 0;
  v9 = 0;
  do
  {
    *(_QWORD *)((char *)&v12 + 8 * v9 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0)) = objc_msgSend((id)a3[v9], "baseObject");
    ++v9;
  }
  while (a4 != v9);
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasAllResources:count:", (char *)&v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;

  objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0, *MEMORY[0x24BDAC8D0]), "device");
  _MTLMessageContextBegin_();
  if (a4)
  {
    if (a3)
    {
      v7 = 0;
    }
    else
    {
      _MTLMessageContextPush_();
      v7 = 1;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    v7 = a3 == 0;
  }
  if (!objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "heap"))
    _MTLMessageContextPush_();
  if (a4)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    v11 = 0;
    do
    {
      if (!objc_msgSend((id)a3[v11], "heap"))
        _MTLMessageContextPush_();
      ++v11;
    }
    while (a4 != v11);
  }
  _MTLMessageContextEnd();
  if (!a4)
    return 0;
  v9 = 0;
  do
  {
    *(_QWORD *)((char *)&v12 + 8 * v9 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0)) = objc_msgSend((id)a3[v9], "baseObject");
    ++v9;
  }
  while (a4 != v9);
  return objc_msgSend(-[MTLDebugResource baseObject](self, "baseObject"), "doesAliasAnyResources:count:", (char *)&v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
}

- (id)baseObject
{
  return self->_baseObject;
}

@end
