@implementation NSLayoutRect

- (id)nsli_superitem
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "_nearestAncestorLayoutItem"), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect topAnchor](self, "topAnchor"), "_nearestAncestorLayoutItem")), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect widthAnchor](self, "widthAnchor"), "_nearestAncestorLayoutItem")), "nsli_ancestorSharedWithItem:", -[NSLayoutAnchor _nearestAncestorLayoutItem](-[NSLayoutRect heightAnchor](self, "heightAnchor"), "_nearestAncestorLayoutItem")), "nsli_superitem");
}

- (BOOL)nsli_isLegalConstraintItem
{
  return 1;
}

- (id)ruleEqualToLayoutRect:(id)a3
{
  return -[NSLayoutRectRule initWithFirstLayoutRect:secondLayoutRect:]([NSLayoutRectRule alloc], self, a3);
}

- (id)ruleContainingLayoutRect:(id)a3
{
  return -[NSLayoutRectRule initWithFirstLayoutRect:secondLayoutRect:relation:]([NSLayoutRectRule alloc], self, a3, 1);
}

- (NSLayoutRect)initWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6
{
  return (NSLayoutRect *)-[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:name:](self, a3, a4, a5, a6, 0);
}

- (_QWORD)initWithLeadingAnchor:(void *)a3 topAnchor:(void *)a4 widthAnchor:(void *)a5 heightAnchor:(void *)a6 name:
{
  _QWORD *v6;
  id v12;
  objc_super v14;

  v6 = a1;
  if (!a1)
    return v6;
  if (a2)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, a1, CFSTR("NSLayoutGeometry.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leading != nil"));
    if (a3)
    {
LABEL_4:
      if (a4)
        goto LABEL_5;
LABEL_16:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, CFSTR("NSLayoutGeometry.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("width != nil"));
      if (a5)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, CFSTR("NSLayoutGeometry.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("top != nil"));
  if (!a4)
    goto LABEL_16;
LABEL_5:
  if (a5)
    goto LABEL_6;
LABEL_17:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithLeadingAnchor_topAnchor_widthAnchor_heightAnchor_name_, v6, CFSTR("NSLayoutGeometry.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("height != nil"));
LABEL_6:
  v14.receiver = v6;
  v14.super_class = (Class)NSLayoutRect;
  v6 = objc_msgSendSuper2(&v14, sel_init);
  if (v6)
  {
    if (!objc_msgSend(a6, "length"))
      a6 = 0;
    if (a6)
    {
      v6[1] = (id)objc_msgSend(a2, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.leading"), a6));
      v6[2] = (id)objc_msgSend(a3, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.top"), a6));
      v6[4] = (id)objc_msgSend(a4, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.width"), a6));
      v12 = (id)objc_msgSend(a5, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.height"), a6));
    }
    else
    {
      v6[1] = objc_msgSend(a2, "copy");
      v6[2] = objc_msgSend(a3, "copy");
      v6[4] = objc_msgSend(a4, "copy");
      v12 = (id)objc_msgSend(a5, "copy");
    }
    v6[3] = v12;
    v6[5] = objc_msgSend(a6, "copy");
  }
  return v6;
}

- (NSLayoutRect)initWithCoder:(id)a3
{
  NSLayoutRect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSLayoutRect;
  v4 = -[NSLayoutRect init](&v6, sel_init);
  if (v4)
  {
    v4->_leadingAnchor = (NSLayoutXAxisAnchor *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutLeadingAnchor"));
    v4->_topAnchor = (NSLayoutYAxisAnchor *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutTopAnchor"));
    v4->_widthAnchor = (NSLayoutDimension *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutWidthAnchor"));
    v4->_heightAnchor = (NSLayoutDimension *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutHeightAnchor"));
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSLayoutName")), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;

  objc_msgSend(a3, "encodeObject:forKey:", self->_leadingAnchor, CFSTR("NSLayoutLeadingAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_topAnchor, CFSTR("NSLayoutTopAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_widthAnchor, CFSTR("NSLayoutWidthAnchor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_heightAnchor, CFSTR("NSLayoutHeightAnchor"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("NSLayoutName"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutRect;
  -[NSLayoutRect dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSLayoutRect isEqualToRectangle:]((uint64_t)self, a3);
  return 0;
}

- (uint64_t)isEqualToRectangle:(uint64_t)result
{
  id *v3;
  id v4;
  id v5;

  if (result)
  {
    v3 = (id *)result;
    result = objc_msgSend((id)objc_msgSend((id)result, "leadingAnchor"), "isEqual:", objc_msgSend(a2, "leadingAnchor"));
    if ((_DWORD)result)
    {
      result = objc_msgSend((id)objc_msgSend(v3, "topAnchor"), "isEqual:", objc_msgSend(a2, "topAnchor"));
      if ((_DWORD)result)
      {
        result = objc_msgSend((id)objc_msgSend(v3, "widthAnchor"), "isEqual:", objc_msgSend(a2, "widthAnchor"));
        if ((_DWORD)result)
        {
          result = objc_msgSend((id)objc_msgSend(v3, "heightAnchor"), "isEqual:", objc_msgSend(a2, "heightAnchor"));
          if ((_DWORD)result)
          {
            v4 = v3[5];
            v5 = (id)a2[5];
            if (v4 == v5)
            {
              return 1;
            }
            else
            {
              result = 0;
              if (v4)
              {
                if (v5)
                  return objc_msgSend(v3[5], "isEqualToString:");
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  objc_super v6;

  if (self->_name)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p '%@'>"), NSStringFromClass(v4), self, self->_name);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSLayoutRect;
    return -[NSLayoutRect description](&v6, sel_description);
  }
}

- (id)debugDescription
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSLayoutRect description](self, "description"), "stringByAppendingFormat:", CFSTR("\n -Leading: %@"), -[NSLayoutRect leadingAnchor](self, "leadingAnchor")), "stringByAppendingFormat:", CFSTR("\n -Width: %@"), -[NSLayoutRect widthAnchor](self, "widthAnchor")), "stringByAppendingFormat:", CFSTR("\n -Top: %@"), -[NSLayoutRect topAnchor](self, "topAnchor")), "stringByAppendingFormat:", CFSTR("\n -Height: %@"), -[NSLayoutRect heightAnchor](self, "heightAnchor"));
}

- (id)_equationDescriptionInParent
{
  NSString *name;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  name = self->_name;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (name)
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%p'%@'"), v5, self, self->_name);
  else
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%p"), v5, self, v7);
}

- (NSLayoutYAxisAnchor)topAnchor
{
  return self->_topAnchor;
}

- (NSLayoutYAxisAnchor)centerYAnchor
{
  NSLayoutYAxisAnchor *result;

  result = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self->_topAnchor, "anchorByOffsettingWithDimension:multiplier:constant:", self->_heightAnchor, 0.5, 0.0);
  if (self->_name)
    return -[NSLayoutAnchor anchorWithName:](result, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.centerY"), self->_name));
  return result;
}

- (NSLayoutYAxisAnchor)bottomAnchor
{
  NSLayoutYAxisAnchor *result;

  result = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self->_topAnchor, "anchorByOffsettingWithDimension:multiplier:constant:", self->_heightAnchor, 1.0, 0.0);
  if (self->_name)
    return -[NSLayoutAnchor anchorWithName:](result, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bottom"), self->_name));
  return result;
}

- (NSLayoutXAxisAnchor)leadingAnchor
{
  return self->_leadingAnchor;
}

- (NSLayoutXAxisAnchor)centerXAnchor
{
  NSLayoutXAxisAnchor *result;

  result = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self->_leadingAnchor, "anchorByOffsettingWithDimension:multiplier:constant:", self->_widthAnchor, 0.5, 0.0);
  if (self->_name)
    return -[NSLayoutAnchor anchorWithName:](result, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.centerX"), self->_name));
  return result;
}

- (NSLayoutXAxisAnchor)trailingAnchor
{
  NSLayoutXAxisAnchor *result;

  result = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self->_leadingAnchor, "anchorByOffsettingWithDimension:multiplier:constant:", self->_widthAnchor, 1.0, 0.0);
  if (self->_name)
    return -[NSLayoutAnchor anchorWithName:](result, "anchorWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.trailing"), self->_name));
  return result;
}

- (NSLayoutDimension)widthAnchor
{
  return self->_widthAnchor;
}

- (NSLayoutDimension)heightAnchor
{
  return self->_heightAnchor;
}

- (NSLayoutPoint)centerLayoutPoint
{
  return +[NSLayoutPoint layoutPointWithXAxisAnchor:yAxisAnchor:](NSLayoutPoint, "layoutPointWithXAxisAnchor:yAxisAnchor:", -[NSLayoutRect centerXAnchor](self, "centerXAnchor"), -[NSLayoutRect centerYAnchor](self, "centerYAnchor"));
}

+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 widthAnchor:(id)a5 heightAnchor:(id)a6
{
  return -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:]([NSLayoutRect alloc], "initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", a3, a4, a5, a6);
}

+ (NSLayoutRect)layoutRectWithLeadingAnchor:(id)a3 topAnchor:(id)a4 trailingAnchor:(id)a5 bottomAnchor:(id)a6
{
  return -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:]([NSLayoutRect alloc], "initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", a3, a4, objc_msgSend(a3, "anchorWithOffsetToAnchor:", a5), objc_msgSend(a4, "anchorWithOffsetToAnchor:", a6));
}

+ (NSLayoutRect)layoutRectWithCenterXAnchor:(void *)a3 centerYAnchor:(uint64_t)a4 widthAnchor:(uint64_t)a5 heightAnchor:
{
  objc_opt_self();
  return -[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:]([NSLayoutRect alloc], "initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", objc_msgSend(a2, "anchorByOffsettingWithDimension:multiplier:constant:", a4, -0.5, 0.0), objc_msgSend(a3, "anchorByOffsettingWithDimension:multiplier:constant:", a5, -0.5, 0.0), a4, a5);
}

+ (NSLayoutRect)layoutRectWithCenterLayoutPoint:(id)a3 widthAnchor:(id)a4 heightAnchor:(id)a5
{
  return +[NSLayoutRect layoutRectWithCenterXAnchor:centerYAnchor:widthAnchor:heightAnchor:]((uint64_t)NSLayoutRect, (void *)objc_msgSend(a3, "xAxisAnchor"), (void *)objc_msgSend(a3, "yAxisAnchor"), (uint64_t)a4, (uint64_t)a5);
}

- (id)layoutRectByInsettingTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  NSLayoutYAxisAnchor *v11;
  uint64_t v12;
  NSLayoutXAxisAnchor *v13;
  uint64_t v14;
  NSLayoutYAxisAnchor *v15;
  uint64_t v16;
  NSLayoutXAxisAnchor *v17;
  uint64_t v18;

  v11 = -[NSLayoutRect topAnchor](self, "topAnchor");
  v12 = (uint64_t)v11;
  if (a3 != 0.0)
    v12 = -[NSLayoutYAxisAnchor anchorByOffsettingWithConstant:](v11, "anchorByOffsettingWithConstant:", a3);
  v13 = -[NSLayoutRect leadingAnchor](self, "leadingAnchor");
  v14 = (uint64_t)v13;
  if (a4 != 0.0)
    v14 = -[NSLayoutXAxisAnchor anchorByOffsettingWithConstant:](v13, "anchorByOffsettingWithConstant:", a4);
  v15 = -[NSLayoutRect bottomAnchor](self, "bottomAnchor");
  v16 = (uint64_t)v15;
  if (a5 != 0.0)
    v16 = -[NSLayoutYAxisAnchor anchorByOffsettingWithConstant:](v15, "anchorByOffsettingWithConstant:", -a5);
  v17 = -[NSLayoutRect trailingAnchor](self, "trailingAnchor");
  v18 = (uint64_t)v17;
  if (a6 != 0.0)
    v18 = -[NSLayoutXAxisAnchor anchorByOffsettingWithConstant:](v17, "anchorByOffsettingWithConstant:", -a6);
  return (id)objc_msgSend((id)objc_opt_class(), "layoutRectWithLeadingAnchor:topAnchor:trailingAnchor:bottomAnchor:", v14, v12, v18, v16);
}

- (id)layoutRectByInsettingTopWithDimension:(id)a3 leadingWithDimension:(id)a4 bottomWithDimension:(id)a5 trailingWithDimension:(id)a6
{
  NSLayoutYAxisAnchor *v11;
  uint64_t v12;
  NSLayoutXAxisAnchor *v13;
  uint64_t v14;
  NSLayoutYAxisAnchor *v15;
  uint64_t v16;
  NSLayoutXAxisAnchor *v17;
  uint64_t v18;

  v11 = -[NSLayoutRect topAnchor](self, "topAnchor");
  v12 = (uint64_t)v11;
  if (a3)
    v12 = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:](v11, "anchorByOffsettingWithDimension:", a3);
  v13 = -[NSLayoutRect leadingAnchor](self, "leadingAnchor");
  v14 = (uint64_t)v13;
  if (a4)
    v14 = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:](v13, "anchorByOffsettingWithDimension:", a4);
  v15 = -[NSLayoutRect bottomAnchor](self, "bottomAnchor");
  v16 = (uint64_t)v15;
  if (a5)
    v16 = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](v15, "anchorByOffsettingWithDimension:multiplier:constant:", a5, -1.0, 0.0);
  v17 = -[NSLayoutRect trailingAnchor](self, "trailingAnchor");
  v18 = (uint64_t)v17;
  if (a6)
    v18 = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](v17, "anchorByOffsettingWithDimension:multiplier:constant:", a6, -1.0, 0.0);
  return (id)objc_msgSend((id)objc_opt_class(), "layoutRectWithLeadingAnchor:topAnchor:trailingAnchor:bottomAnchor:", v14, v12, v18, v16);
}

- (NSLayoutRect)_rectangleBySlicingWithDimension:(uint64_t)a3 plusConstant:(double)a4 fromEdge:
{
  NSLayoutRect *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSLayoutYAxisAnchor *v11;
  id v12;
  NSLayoutXAxisAnchor *v13;
  id v14;

  if (result)
  {
    v6 = result;
    switch(a3)
    {
      case 0:
        v7 = -[NSLayoutRect leadingAnchor](result, "leadingAnchor");
        v8 = -[NSLayoutRect widthAnchor](v6, "widthAnchor");
        v9 = -[NSLayoutRect topAnchor](v6, "topAnchor");
        if (a2)
          goto LABEL_9;
        goto LABEL_15;
      case 1:
        v9 = -[NSLayoutRect topAnchor](result, "topAnchor");
        v10 = -[NSLayoutRect heightAnchor](v6, "heightAnchor");
        v7 = -[NSLayoutRect leadingAnchor](v6, "leadingAnchor");
        if (!a2)
          goto LABEL_18;
        goto LABEL_12;
      case 2:
        v7 = -[NSLayoutRect leadingAnchor](result, "leadingAnchor");
        v8 = -[NSLayoutRect widthAnchor](v6, "widthAnchor");
        v11 = -[NSLayoutRect bottomAnchor](v6, "bottomAnchor");
        if (a2)
        {
          v9 = -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](v11, "anchorByOffsettingWithDimension:multiplier:constant:", a2, -1.0, -a4);
LABEL_9:
          v12 = a2;
        }
        else
        {
          v9 = -[NSLayoutYAxisAnchor anchorByOffsettingWithConstant:](v11, "anchorByOffsettingWithConstant:", -a4);
LABEL_15:
          v12 = -[NSLayoutDimension anchorByMultiplyingByConstant:](-[NSLayoutRect heightAnchor](v6, "heightAnchor"), "anchorByMultiplyingByConstant:", 0.0);
        }
        v10 = objc_msgSend(v12, "anchorByAddingConstant:", a4);
        goto LABEL_20;
      case 3:
        v9 = -[NSLayoutRect topAnchor](result, "topAnchor");
        v10 = -[NSLayoutRect heightAnchor](v6, "heightAnchor");
        v13 = -[NSLayoutRect trailingAnchor](v6, "trailingAnchor");
        if (a2)
        {
          v7 = -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](v13, "anchorByOffsettingWithDimension:multiplier:constant:", a2, -1.0, -a4);
LABEL_12:
          v14 = a2;
        }
        else
        {
          v7 = -[NSLayoutXAxisAnchor anchorByOffsettingWithConstant:](v13, "anchorByOffsettingWithConstant:", -a4);
LABEL_18:
          v14 = -[NSLayoutDimension anchorByMultiplyingByConstant:](-[NSLayoutRect widthAnchor](v6, "widthAnchor"), "anchorByMultiplyingByConstant:", 0.0);
        }
        v8 = objc_msgSend(v14, "anchorByAddingConstant:", a4);
LABEL_20:
        result = +[NSLayoutRect layoutRectWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:](NSLayoutRect, "layoutRectWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", v7, v9, v8, v10);
        break;
      default:
        v7 = 0;
        v9 = 0;
        v8 = 0;
        v10 = 0;
        goto LABEL_20;
    }
  }
  return result;
}

- (id)layoutRectBySlicingWithDistance:(double)a3 fromEdge:(int64_t)a4
{
  return -[NSLayoutRect _rectangleBySlicingWithDimension:plusConstant:fromEdge:](self, 0, a4, a3);
}

- (id)layoutRectBySlicingWithDimension:(id)a3 fromEdge:(int64_t)a4
{
  return -[NSLayoutRect _rectangleBySlicingWithDimension:plusConstant:fromEdge:](self, a3, a4, 0.0);
}

- (id)layoutRectBySlicingWithProportion:(double)a3 fromEdge:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = v8;
  v15 = v5;
  v16 = v4;
  v12 = self;
  switch(a4)
  {
    case 0:
    case 2:
      v13 = (void *)objc_msgSend(self, "heightAnchor");
      goto LABEL_4;
    case 1:
    case 3:
      v13 = (void *)objc_msgSend(self, "widthAnchor");
LABEL_4:
      self = (id)objc_msgSend(v12, "layoutRectBySlicingWithDimension:fromEdge:", objc_msgSend(v13, "anchorByMultiplyingByConstant:", a3, v9, v14, v15, v16, v6, v7), a4);
      break;
    default:
      return self;
  }
  return self;
}

- (id)constraintsEqualToLayoutRect:(id)a3
{
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "leadingAnchor"));
  v6[1] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect trailingAnchor](self, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "trailingAnchor"));
  v6[2] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect topAnchor](self, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "topAnchor"));
  v6[3] = -[NSLayoutAnchor constraintEqualToAnchor:](-[NSLayoutRect bottomAnchor](self, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "bottomAnchor"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
}

- (id)constraintsContainingWithinLayoutRect:(id)a3
{
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = -[NSLayoutAnchor constraintGreaterThanOrEqualToAnchor:](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "constraintGreaterThanOrEqualToAnchor:", objc_msgSend(a3, "leadingAnchor"));
  v6[1] = -[NSLayoutAnchor constraintLessThanOrEqualToAnchor:](-[NSLayoutRect trailingAnchor](self, "trailingAnchor"), "constraintLessThanOrEqualToAnchor:", objc_msgSend(a3, "trailingAnchor"));
  v6[2] = -[NSLayoutAnchor constraintGreaterThanOrEqualToAnchor:](-[NSLayoutRect topAnchor](self, "topAnchor"), "constraintGreaterThanOrEqualToAnchor:", objc_msgSend(a3, "topAnchor"));
  v6[3] = -[NSLayoutAnchor constraintLessThanOrEqualToAnchor:](-[NSLayoutRect bottomAnchor](self, "bottomAnchor"), "constraintLessThanOrEqualToAnchor:", objc_msgSend(a3, "bottomAnchor"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
}

- (NSLayoutRect)layoutRectWithName:(id)a3
{
  return (NSLayoutRect *)-[NSLayoutRect initWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:name:]([NSLayoutRect alloc], self->_leadingAnchor, self->_topAnchor, self->_widthAnchor, self->_heightAnchor, a3);
}

- (CGRect)valueInItem:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[NSLayoutAnchor valueInItem:](-[NSLayoutRect leadingAnchor](self, "leadingAnchor"), "valueInItem:", a3);
  v6 = v5;
  -[NSLayoutAnchor valueInItem:](-[NSLayoutRect trailingAnchor](self, "trailingAnchor"), "valueInItem:", a3);
  v8 = v7;
  -[NSLayoutAnchor valueInItem:](-[NSLayoutRect topAnchor](self, "topAnchor"), "valueInItem:", a3);
  v10 = v9;
  -[NSLayoutAnchor valueInItem:](-[NSLayoutRect bottomAnchor](self, "bottomAnchor"), "valueInItem:", a3);
  v12 = v11;
  v13 = v8 - v6;
  v14 = v6 - v8;
  if (v6 <= v8)
  {
    v15 = v8 - v6;
  }
  else
  {
    v6 = v8;
    v15 = v14;
  }
  v16 = objc_msgSend(a3, "nsli_isFlipped", v13);
  if (v16)
    v17 = v10;
  else
    v17 = v12;
  if (v16)
    v18 = v12 - v10;
  else
    v18 = v10 - v12;
  v19 = v6;
  v20 = v15;
  result.size.height = v18;
  result.size.width = v20;
  result.origin.y = v17;
  result.origin.x = v19;
  return result;
}

- (id)observableValueInItem:(id)a3
{
  if (!objc_msgSend(a3, "nsli_layoutEngine"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutGeometry.m"), 416, CFSTR("Requires layout item to have layout engine"));
  return +[_NSLayoutRectObservable observableForRect:inItem:](_NSLayoutRectObservable, "observableForRect:inItem:", self, a3);
}

@end
