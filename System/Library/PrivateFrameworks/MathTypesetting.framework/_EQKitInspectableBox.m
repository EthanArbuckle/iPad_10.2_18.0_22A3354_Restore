@implementation _EQKitInspectableBox

- (_EQKitInspectableBox)initWithBox:(id)a3
{
  _EQKitInspectableBox *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_EQKitInspectableBox;
  result = -[_EQKitInspectableBox init](&v5, sel_init);
  if (result)
    result->_box = (EQKitBox *)a3;
  return result;
}

- (double)inspectableWidth
{
  double result;

  -[EQKitBox width](self->_box, "width");
  return result;
}

- (double)inspectableHeight
{
  double result;

  -[EQKitBox height](self->_box, "height");
  return result;
}

- (double)inspectableDepth
{
  double result;

  -[EQKitBox depth](self->_box, "depth");
  return result;
}

- (NSString)inspectableNameForIcon
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)inspectableName
{
  objc_class *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)objc_msgSend((id)-[EQKitBox attribution](self->_box, "attribution"), "source");
  v4 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v4);
}

- (_NSRange)inspectableNameRange
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend((id)-[EQKitBox attribution](self->_box, "attribution"), "range");
  }
  else
  {
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    v4 = 0;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (EQKitInspectable)inspectableChildren
{
  EQKitInspectable *result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = self->_cachedChildren;
  if (!result)
  {
    if (-[EQKitBox canContainBoxes](self->_box, "canContainBoxes"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = -[EQKitBox containedBoxes](self->_box, "containedBoxes", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(v4, "addObject:", -[_EQKitInspectableBox initWithBox:]([_EQKitInspectableBox alloc], "initWithBox:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++)));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }
      result = (EQKitInspectable *)objc_msgSend(v4, "copy");
      self->_cachedChildren = result;
    }
    else
    {
      return self->_cachedChildren;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[EQKitBox isEqual:](-[_EQKitInspectableBox box](self, "box"), "isEqual:", objc_msgSend(a3, "box"));
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitInspectable)cachedChildren
{
  return self->_cachedChildren;
}

- (void)setCachedChildren:(id)a3
{
  self->_cachedChildren = (EQKitInspectable *)a3;
}

@end
