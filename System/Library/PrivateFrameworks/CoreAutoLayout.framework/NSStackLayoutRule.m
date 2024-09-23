@implementation NSStackLayoutRule

- (double)initWithOrientation:(void *)a3 stackedRects:(double)a4 spacing:
{
  double *v7;
  double *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)NSStackLayoutRule;
  v7 = (double *)objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    *((_QWORD *)v7 + 3) = a2;
    *((_QWORD *)v7 + 1) = objc_msgSend(a3, "copy");
    v8[2] = a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSStackLayoutRule;
  -[NSStackLayoutRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  int64_t orientation;
  uint64_t v4;

  orientation = self->_orientation;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_spacing), "hash")
     - orientation
     + 32 * orientation;
  return -[NSArray hash](self->_stackedRects, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSArray *stackedRects;

  if (self == a3)
    goto LABEL_8;
  if (!a3)
  {
LABEL_9:
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSStackLayoutRule);
  if (v5)
  {
    if (self->_orientation == *((_QWORD *)a3 + 3) && self->_spacing == *((double *)a3 + 2))
    {
      stackedRects = self->_stackedRects;
      if (stackedRects != *((NSArray **)a3 + 1))
      {
        LOBYTE(v5) = -[NSArray isEqual:](stackedRects, "isEqual:");
        return v5;
      }
LABEL_8:
      LOBYTE(v5) = 1;
      return v5;
    }
    goto LABEL_9;
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 spacing:(double)a5
{
  NSStackLayoutRule *v8;
  _QWORD *v9;
  double *v10;
  objc_super v12;

  v8 = [NSStackLayoutRule alloc];
  if (v8)
  {
    v12.receiver = v8;
    v12.super_class = (Class)NSStackLayoutRule;
    v9 = objc_msgSendSuper2(&v12, sel_init);
    v10 = (double *)v9;
    if (v9)
    {
      v9[3] = a3;
      v9[1] = objc_msgSend(a4, "copy");
      v10[2] = a5;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)horizontalStackWithRects:(id)a3 spacing:(double)a4
{
  return (id)objc_msgSend(a1, "stackWithOrientation:stackedRects:spacing:", 0, a3, a4);
}

+ (id)verticalStackWithRects:(id)a3 spacing:(double)a4
{
  return (id)objc_msgSend(a1, "stackWithOrientation:stackedRects:spacing:", 1, a3, a4);
}

- (id)makeChildRules
{
  NSUInteger v3;
  NSUInteger v4;
  void *v6;
  NSArray *stackedRects;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_stackedRects, "count");
  v4 = v3 - 1;
  if (v3 <= 1)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", v4);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  stackedRects = self->_stackedRects;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(stackedRects);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if (v13)
        {
          if (-[NSStackLayoutRule orientation](self, "orientation"))
          {
            v14 = (void *)objc_msgSend(v10, "topAnchor");
            v15 = objc_msgSend(v13, "bottomAnchor");
          }
          else
          {
            v14 = (void *)objc_msgSend(v10, "leadingAnchor");
            v15 = objc_msgSend(v13, "trailingAnchor");
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(v14, "ruleEqualToAnchor:constant:", v15, self->_spacing));
        }
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSStackLayoutRule ruleDescription](self, "ruleDescription"));
}

- (NSString)ruleDescription
{
  void *v3;
  NSArray *stackedRects;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  NSStackLayoutRule *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = self;
  stackedRects = self->_stackedRects;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(stackedRects);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = objc_opt_respondsToSelector();
        v11 = (void *)MEMORY[0x1E0CB3940];
        if ((v10 & 1) != 0)
          v12 = objc_msgSend(v9, "_equationDescriptionInParent");
        else
          v12 = objc_msgSend(v9, "description");
        objc_msgSend(v3, "addObject:", objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]"), v12));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  if (v15->_orientation)
    v13 = CFSTR("V:");
  else
    v13 = CFSTR("H:");
  return (NSString *)-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", objc_msgSend(v3, "componentsJoinedByString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-(%g)-"), *(_QWORD *)&v15->_spacing)));
}

- (NSArray)stackedRects
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)spacing
{
  return self->_spacing;
}

@end
