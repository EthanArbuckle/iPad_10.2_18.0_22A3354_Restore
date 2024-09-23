@implementation NSLayoutAnchorRule

- (double)initWithFirstAnchor:(void *)a1 secondAnchor:(void *)a2 relation:(void *)a3 multiplier:(uint64_t)a4 constant:(void *)a5 priority:(double)a6 identifier:(double)a7
{
  double *v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)NSLayoutAnchorRule;
  v13 = (double *)objc_msgSendSuper2(&v15, sel_init);
  if (v13)
  {
    *((_QWORD *)v13 + 1) = objc_msgSend(a2, "copy");
    *((_QWORD *)v13 + 2) = objc_msgSend(a3, "copy");
    *((_QWORD *)v13 + 3) = a4;
    v13[5] = a7;
    v13[6] = a6;
    *((_QWORD *)v13 + 4) = objc_msgSend(a5, "copy");
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSLayoutAnchorRule;
  -[NSLayoutAnchorRule dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return _NSLayoutConstraintComparableHash(1, 1, 0, self->_relation, -[NSLayoutAnchor hash](self->_firstAnchor, "hash"), -[NSLayoutAnchor hash](self->_secondAnchor, "hash"), -[NSString hash](self->_identifier, "hash"), 0, self->_constant, self->_multiplier, self->_priority, 0);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSLayoutAnchor *firstAnchor;
  NSLayoutAnchor *secondAnchor;
  NSString *identifier;

  if (self == a3)
    goto LABEL_15;
  if (!a3)
    goto LABEL_14;
  v5 = objc_msgSend(a3, "isMemberOfClass:", NSLayoutAnchorRule);
  if (!v5)
    return v5;
  if (self->_relation != *((_QWORD *)a3 + 3)
    || self->_constant != *((double *)a3 + 5)
    || self->_multiplier != *((double *)a3 + 6)
    || self->_priority != *((float *)a3 + 14))
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  firstAnchor = self->_firstAnchor;
  if (firstAnchor == *((NSLayoutAnchor **)a3 + 1) || (v5 = -[NSLayoutAnchor isEqual:](firstAnchor, "isEqual:")) != 0)
  {
    secondAnchor = self->_secondAnchor;
    if (secondAnchor == *((NSLayoutAnchor **)a3 + 2)
      || (v5 = -[NSLayoutAnchor isEqual:](secondAnchor, "isEqual:")) != 0)
    {
      identifier = self->_identifier;
      if (identifier != *((NSString **)a3 + 4))
      {
        LOBYTE(v5) = -[NSString isEqual:](identifier, "isEqual:");
        return v5;
      }
LABEL_15:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)makeLayoutConstraint
{
  NSLayoutConstraint *v3;
  NSLayoutConstraint *v4;

  v3 = +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self->_firstAnchor, self->_relation, self->_secondAnchor, self->_multiplier, self->_constant);
  v4 = v3;
  if (self->_identifier)
    -[NSLayoutConstraint setIdentifier:](v3, "setIdentifier:");
  return v4;
}

- (id)makeChildRules
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)description
{
  NSString *identifier;
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v8;

  identifier = self->_identifier;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (identifier)
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, %@ (%@)>"), v6, self, self->_identifier, -[NSLayoutAnchorRule ruleDescription](self, "ruleDescription"));
  else
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v6, self, -[NSLayoutAnchorRule ruleDescription](self, "ruleDescription"), v8);
}

- (NSString)ruleDescription
{
  void *v3;
  id v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  NSLayoutAnchor *secondAnchor;
  double multiplier;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  const __CFString *v15;
  void *v16;
  double v17;
  uint64_t v19;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[NSLayoutAnchor _equationDescriptionInParent](self->_firstAnchor, "_equationDescriptionInParent");
  v5 = &stru_1E4A49B28;
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), &stru_1E4A49B28, v4));
  v6 = self->_relation + 1;
  if (v6 > 2)
    v7 = CFSTR("?=");
  else
    v7 = off_1E4A484F8[v6];
  objc_msgSend(v3, "addObject:", v7);
  secondAnchor = self->_secondAnchor;
  if (secondAnchor)
  {
    multiplier = self->_multiplier;
    if (multiplier < 0.0)
      v5 = CFSTR("-");
    v10 = -[NSLayoutAnchor _equationDescriptionInParent](secondAnchor, "_equationDescriptionInParent");
    v11 = fabs(multiplier);
    if (v11 == 1.0)
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v10, v19);
    else
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%g*%@"), v5, *(_QWORD *)&v11, v10);
    objc_msgSend(v3, "addObject:", v12);
  }
  -[NSLayoutAnchorRule constant](self, "constant");
  if (v13 != 0.0)
  {
    -[NSLayoutAnchorRule constant](self, "constant");
    if (v14 >= 0.0)
      v15 = CFSTR("+");
    else
      v15 = CFSTR("-");
    objc_msgSend(v3, "addObject:", v15);
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[NSLayoutAnchorRule constant](self, "constant");
    objc_msgSend(v3, "addObject:", objc_msgSend(v16, "stringWithFormat:", CFSTR("%g"), fabs(v17)));
  }
  return (NSString *)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
}

- (NSLayoutAnchor)firstAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 8, 1);
}

- (NSLayoutAnchor)secondAnchor
{
  return (NSLayoutAnchor *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)relation
{
  return self->_relation;
}

- (double)constant
{
  return self->_constant;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (float)priority
{
  return self->_priority;
}

- (double)multiplier
{
  return self->_multiplier;
}

@end
