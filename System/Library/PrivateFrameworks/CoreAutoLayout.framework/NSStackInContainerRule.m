@implementation NSStackInContainerRule

- (double)initWithOrientation:(void *)a3 stackedRects:(void *)a4 containingRect:(double)a5 spacing:
{
  double *v9;
  double *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)NSStackInContainerRule;
  v9 = (double *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    *((_QWORD *)v9 + 4) = a2;
    *((_QWORD *)v9 + 1) = objc_msgSend(a3, "copy");
    *((_QWORD *)v10 + 2) = objc_msgSend(a4, "copy");
    v10[3] = a5;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSStackInContainerRule;
  -[NSStackInContainerRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  int64_t orientation;
  uint64_t v4;
  uint64_t v5;

  orientation = self->_orientation;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_spacing), "hash")
     - orientation
     + 32 * orientation;
  v5 = -[NSLayoutRect hash](self->_containingRect, "hash") - v4 + 32 * v4;
  return -[NSArray hash](self->_stackedRects, "hash") - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSLayoutRect *containingRect;
  NSArray *stackedRects;

  if (self == a3)
    goto LABEL_10;
  if (!a3)
    goto LABEL_11;
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSStackInContainerRule);
  if (!v5)
    return v5;
  if (self->_orientation != *((_QWORD *)a3 + 4) || self->_spacing != *((double *)a3 + 3))
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  containingRect = self->_containingRect;
  if (containingRect == *((NSLayoutRect **)a3 + 2) || (v5 = -[NSLayoutRect isEqual:](containingRect, "isEqual:")) != 0)
  {
    stackedRects = self->_stackedRects;
    if (stackedRects != *((NSArray **)a3 + 1))
    {
      LOBYTE(v5) = -[NSArray isEqual:](stackedRects, "isEqual:");
      return v5;
    }
LABEL_10:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)stackWithOrientation:(int64_t)a3 stackedRects:(id)a4 inContainer:(id)a5 spacing:(double)a6
{
  return -[NSStackInContainerRule initWithOrientation:stackedRects:containingRect:spacing:]([NSStackInContainerRule alloc], a3, a4, a5, a6);
}

+ (id)horizontalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5
{
  return (id)objc_msgSend(a1, "stackWithOrientation:stackedRects:inContainer:spacing:", 0, a3, a4, a5);
}

+ (id)verticalStackWithRects:(id)a3 inContainer:(id)a4 spacing:(double)a5
{
  return (id)objc_msgSend(a1, "stackWithOrientation:stackedRects:inContainer:spacing:", 1, a3, a4, a5);
}

- (id)makeChildRules
{
  id v3;
  id v4;
  int64_t v5;
  NSArray *stackedRects;
  double spacing;
  void *v8;
  _QWORD *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (!self->_containingRect
    || !-[NSArray count](-[NSStackInContainerRule stackedRects](self, "stackedRects"), "count"))
  {
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  v3 = -[NSArray firstObject](-[NSStackInContainerRule stackedRects](self, "stackedRects"), "firstObject");
  v4 = -[NSArray lastObject](-[NSStackInContainerRule stackedRects](self, "stackedRects"), "lastObject");
  v5 = -[NSStackInContainerRule orientation](self, "orientation");
  stackedRects = self->_stackedRects;
  spacing = self->_spacing;
  if (v5)
  {
    v11[0] = +[NSStackLayoutRule verticalStackWithRects:spacing:](NSStackLayoutRule, "verticalStackWithRects:spacing:", stackedRects, spacing);
    v11[1] = objc_msgSend((id)objc_msgSend(v3, "topAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect topAnchor](self->_containingRect, "topAnchor"));
    v11[2] = objc_msgSend((id)objc_msgSend(v4, "bottomAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect bottomAnchor](self->_containingRect, "bottomAnchor"));
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v11;
  }
  else
  {
    v12[0] = +[NSStackLayoutRule horizontalStackWithRects:spacing:](NSStackLayoutRule, "horizontalStackWithRects:spacing:", stackedRects, spacing);
    v12[1] = objc_msgSend((id)objc_msgSend(v3, "leadingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect leadingAnchor](self->_containingRect, "leadingAnchor"));
    v12[2] = objc_msgSend((id)objc_msgSend(v4, "trailingAnchor"), "ruleEqualToAnchor:", -[NSLayoutRect trailingAnchor](self->_containingRect, "trailingAnchor"));
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v12;
  }
  return (id)objc_msgSend(v8, "arrayWithObjects:count:", v9, 3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[NSStackInContainerRule ruleDescription](self, "ruleDescription"));
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
  int64_t orientation;
  uint64_t v14;
  void *v15;
  char v16;
  NSLayoutRect *containingRect;
  uint64_t v18;
  __CFString *v19;
  NSStackInContainerRule *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = self;
  stackedRects = self->_stackedRects;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(stackedRects);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = objc_opt_respondsToSelector();
        v11 = (void *)MEMORY[0x1E0CB3940];
        if ((v10 & 1) != 0)
          v12 = objc_msgSend(v9, "_equationDescriptionInParent");
        else
          v12 = objc_msgSend(v9, "description");
        objc_msgSend(v3, "addObject:", objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]"), v12));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](stackedRects, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  orientation = v21->_orientation;
  v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-(%g)-"), *(_QWORD *)&v21->_spacing);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_respondsToSelector();
  containingRect = v21->_containingRect;
  if ((v16 & 1) != 0)
    v18 = -[NSLayoutRect _equationDescriptionInParent](containingRect, "_equationDescriptionInParent");
  else
    v18 = -[NSLayoutRect description](containingRect, "description");
  if (orientation)
    v19 = CFSTR("V:|");
  else
    v19 = CFSTR("H:|");
  return (NSString *)objc_msgSend((id)-[__CFString stringByAppendingString:](v19, "stringByAppendingString:", objc_msgSend(v3, "componentsJoinedByString:", v14)), "stringByAppendingString:", objc_msgSend(v15, "stringWithFormat:", CFSTR("|, '|':%@"), v18));
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

- (NSLayoutRect)containingRect
{
  return (NSLayoutRect *)objc_getProperty(self, a2, 16, 1);
}

@end
