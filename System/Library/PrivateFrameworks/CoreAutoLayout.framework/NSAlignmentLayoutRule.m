@implementation NSAlignmentLayoutRule

- (_QWORD)initWithAlignedAnchors:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)NSAlignmentLayoutRule;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = objc_msgSend(a2, "copy");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAlignmentLayoutRule;
  -[NSAlignmentLayoutRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_alignedAnchors, "hash");
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSArray *alignedAnchors;

  if (self == a3)
    goto LABEL_6;
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSAlignmentLayoutRule);
  if (v5)
  {
    alignedAnchors = self->_alignedAnchors;
    if (alignedAnchors != *((NSArray **)a3 + 1))
    {
      LOBYTE(v5) = -[NSArray isEqual:](alignedAnchors, "isEqual:");
      return v5;
    }
LABEL_6:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)alignmentWithAnchors:(id)a3
{
  NSAlignmentLayoutRule *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = [NSAlignmentLayoutRule alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NSAlignmentLayoutRule;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5)
      v5[1] = objc_msgSend(a3, "copy");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)makeChildRules
{
  NSUInteger v3;
  NSUInteger v4;
  void *v6;
  NSArray *alignedAnchors;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_alignedAnchors, "count");
  v4 = v3 - 1;
  if (v3 <= 1)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", v4);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  alignedAnchors = self->_alignedAnchors;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](alignedAnchors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(alignedAnchors);
        if (v10)
          objc_msgSend(v6, "addObject:", objc_msgSend(v10, "ruleEqualToAnchor:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)));
        else
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](alignedAnchors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSAlignmentLayoutRule ruleDescription](self, "ruleDescription"));
}

- (NSString)ruleDescription
{
  return (NSString *)objc_msgSend(-[NSArray valueForKey:](self->_alignedAnchors, "valueForKey:", CFSTR("_equationDescriptionInParent")), "componentsJoinedByString:", CFSTR(" == "));
}

- (NSArray)alignedAnchors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end
