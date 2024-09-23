@implementation NSVisualFormatLayoutRule

- (_QWORD)initWithVisualFormat:(uint64_t)a3 options:(void *)a4 metrics:(void *)a5 rects:(void *)a6 containerRect:
{
  _QWORD *v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)NSVisualFormatLayoutRule;
  v11 = objc_msgSendSuper2(&v13, sel_init);
  if (v11)
  {
    v11[1] = objc_msgSend(a2, "copy");
    v11[2] = a3;
    v11[3] = objc_msgSend(a4, "copy");
    v11[4] = objc_msgSend(a5, "copy");
    v11[5] = objc_msgSend(a6, "copy");
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSVisualFormatLayoutRule;
  -[NSVisualFormatLayoutRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t formatOptions;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  formatOptions = self->_formatOptions;
  v4 = -[NSString hash](self->_visualFormatString, "hash") - formatOptions + 32 * formatOptions;
  v5 = -[NSDictionary hash](self->_metricMapping, "hash") - v4 + 32 * v4;
  v6 = -[NSDictionary hash](self->_rectMapping, "hash") - v5 + 32 * v5;
  return -[NSLayoutRect hash](self->_containerRect, "hash") - v6 + 32 * v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSLayoutRect *containerRect;
  NSString *visualFormatString;
  NSDictionary *metricMapping;
  NSDictionary *rectMapping;

  if (self == a3)
    goto LABEL_13;
  if (!a3)
    goto LABEL_14;
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSVisualFormatLayoutRule);
  if (!v5)
    return v5;
  if (self->_formatOptions != *((_QWORD *)a3 + 2))
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  containerRect = self->_containerRect;
  if (containerRect == *((NSLayoutRect **)a3 + 5) || (v5 = -[NSLayoutRect isEqual:](containerRect, "isEqual:")) != 0)
  {
    visualFormatString = self->_visualFormatString;
    if (visualFormatString == *((NSString **)a3 + 1)
      || (v5 = -[NSString isEqual:](visualFormatString, "isEqual:")) != 0)
    {
      metricMapping = self->_metricMapping;
      if (metricMapping == *((NSDictionary **)a3 + 3)
        || (v5 = -[NSDictionary isEqual:](metricMapping, "isEqual:")) != 0)
      {
        rectMapping = self->_rectMapping;
        if (rectMapping != *((NSDictionary **)a3 + 4))
        {
          LOBYTE(v5) = -[NSDictionary isEqual:](rectMapping, "isEqual:");
          return v5;
        }
LABEL_13:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (NSString)identifier
{
  return 0;
}

+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 rects:(id)a6 containerRect:(id)a7
{
  return -[NSVisualFormatLayoutRule initWithVisualFormat:options:metrics:rects:containerRect:]([NSVisualFormatLayoutRule alloc], a3, a4, a5, a6, a7);
}

+ (id)ruleWithVisualFormat:(id)a3 options:(unint64_t)a4 metrics:(id)a5 views:(id)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v11 = objc_msgSend(a6, "allKeys");
  v12 = (void *)objc_msgSend(a6, "objectsForKeys:notFoundMarker:", v11, objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  v13 = objc_msgSend(v12, "valueForKey:", CFSTR("layoutRect"));
  return (id)objc_msgSend(a1, "ruleWithVisualFormat:options:metrics:rects:containerRect:", a3, a4, a5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v13, v11), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "firstObject"), "nsli_superitem"), "nsli_layoutRect"));
}

- (id)makeChildRules
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSLayoutAnchorRule *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", self->_visualFormatString, self->_formatOptions, self->_metricMapping, self->_rectMapping);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v2;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v9 = [NSLayoutAnchorRule alloc];
        v10 = (void *)objc_msgSend(v8, "firstAnchor");
        v11 = (void *)objc_msgSend(v8, "secondAnchor");
        v12 = objc_msgSend(v8, "relation");
        objc_msgSend(v8, "multiplier");
        v14 = v13;
        objc_msgSend(v8, "constant");
        v16 = v15;
        objc_msgSend(v8, "priority");
        v17 = -[NSLayoutAnchorRule initWithFirstAnchor:secondAnchor:relation:multiplier:constant:priority:identifier:](v9, v10, v11, v12, (void *)objc_msgSend(v8, "identifier"), v14, v16);
        objc_msgSend(v3, "addObject:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ (opts: %lu)>"), NSStringFromClass(v4), self, self->_visualFormatString, self->_formatOptions);
}

- (NSString)ruleDescription
{
  return self->_visualFormatString;
}

@end
