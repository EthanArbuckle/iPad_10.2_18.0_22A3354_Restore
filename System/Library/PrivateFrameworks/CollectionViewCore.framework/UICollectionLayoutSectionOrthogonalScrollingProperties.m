@implementation UICollectionLayoutSectionOrthogonalScrollingProperties

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_decelerationRate;
    *((_QWORD *)result + 2) = self->_bounce;
  }
  return result;
}

- (UICollectionLayoutSectionOrthogonalScrollingProperties)init
{
  UICollectionLayoutSectionOrthogonalScrollingProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionLayoutSectionOrthogonalScrollingProperties;
  result = -[UICollectionLayoutSectionOrthogonalScrollingProperties init](&v3, sel_init);
  if (result)
  {
    result->_decelerationRate = -1.0;
    result->_bounce = 0;
  }
  return result;
}

- (void)setDecelerationRate:(UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate
{
  self->_decelerationRate = decelerationRate;
}

- (BOOL)isEqual:(id)a3
{
  UICollectionLayoutSectionOrthogonalScrollingProperties *v4;
  UICollectionLayoutSectionOrthogonalScrollingProperties *v5;
  double decelerationRate;
  double v7;
  BOOL v8;
  int64_t bounce;

  v4 = (UICollectionLayoutSectionOrthogonalScrollingProperties *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      decelerationRate = self->_decelerationRate;
      -[UICollectionLayoutSectionOrthogonalScrollingProperties decelerationRate](v5, "decelerationRate");
      if (decelerationRate == v7)
      {
        bounce = self->_bounce;
        v8 = bounce == -[UICollectionLayoutSectionOrthogonalScrollingProperties bounce](v5, "bounce");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate
{
  return self->_decelerationRate;
}

- (UICollectionLayoutSectionOrthogonalScrollingBounce)bounce
{
  return self->_bounce;
}

- (id)_descriptionProperties
{
  id v3;
  void *v4;
  double decelerationRate;
  const __CFString *v6;
  int64_t bounce;
  const __CFString *v8;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  decelerationRate = self->_decelerationRate;
  if (decelerationRate == -1.0)
  {
    v6 = CFSTR("decelerationRate = automatic");
LABEL_7:
    objc_msgSend(v3, "addObject:", v6);
    goto LABEL_8;
  }
  if (decelerationRate == 0.998)
  {
    v6 = CFSTR("decelerationRate = normal");
    goto LABEL_7;
  }
  if (decelerationRate == 0.99)
  {
    v6 = CFSTR("decelerationRate = fast");
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decelerationRate = %g"), *(_QWORD *)&self->_decelerationRate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

LABEL_8:
  bounce = self->_bounce;
  if (!bounce)
  {
    v8 = CFSTR("bounce = automatic");
    goto LABEL_14;
  }
  if (bounce == 1)
  {
    v8 = CFSTR("bounce = always");
LABEL_14:
    objc_msgSend(v4, "addObject:", v8);
    return v4;
  }
  if (self->_decelerationRate == 2.0)
  {
    v8 = CFSTR("bounce = never");
    goto LABEL_14;
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UICollectionLayoutSectionOrthogonalScrollingProperties _descriptionProperties](self, "_descriptionProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setBounce:(UICollectionLayoutSectionOrthogonalScrollingBounce)bounce
{
  self->_bounce = bounce;
}

@end
