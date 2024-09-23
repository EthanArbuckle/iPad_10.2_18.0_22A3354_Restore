@implementation ACUISEdgeInsets

- (id)_initWithEdgeInsets:(id)a3
{
  id v5;
  ACUISEdgeInsets *v6;
  ACUISEdgeInsets *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISEdgeInsets;
  v6 = -[ACUISEdgeInsets init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_edgeInsets, a3);

  return v7;
}

- (ACUISEdgeInsets)init
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v3;
  ACUISEdgeInsets *v4;

  v3 = objc_alloc_init(_TtC18ActivityUIServices18ActivityEdgeInsets);
  v4 = -[ACUISEdgeInsets _initWithEdgeInsets:](self, "_initWithEdgeInsets:", v3);

  return v4;
}

- (ACUISEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  ACUISEdgeInsets *v10;
  ACUISEdgeInsets *v11;

  v10 = -[ACUISEdgeInsets init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[ActivityEdgeInsets setTop:](v10->_edgeInsets, "setTop:", a3);
    -[ActivityEdgeInsets setLeading:](v11->_edgeInsets, "setLeading:", a4);
    -[ActivityEdgeInsets setBottom:](v11->_edgeInsets, "setBottom:", a5);
    -[ActivityEdgeInsets setTrailing:](v11->_edgeInsets, "setTrailing:", a6);
  }
  return v11;
}

- (double)top
{
  double result;

  -[ActivityEdgeInsets top](self->_edgeInsets, "top");
  return result;
}

- (void)setTop:(double)a3
{
  -[ActivityEdgeInsets setTop:](self->_edgeInsets, "setTop:", a3);
}

- (double)leading
{
  double result;

  -[ActivityEdgeInsets leading](self->_edgeInsets, "leading");
  return result;
}

- (void)setLeading:(double)a3
{
  -[ActivityEdgeInsets setLeading:](self->_edgeInsets, "setLeading:", a3);
}

- (double)bottom
{
  double result;

  -[ActivityEdgeInsets bottom](self->_edgeInsets, "bottom");
  return result;
}

- (void)setBottom:(double)a3
{
  -[ActivityEdgeInsets setBottom:](self->_edgeInsets, "setBottom:", a3);
}

- (double)trailing
{
  double result;

  -[ActivityEdgeInsets trailing](self->_edgeInsets, "trailing");
  return result;
}

- (void)setTrailing:(double)a3
{
  -[ActivityEdgeInsets setTrailing:](self->_edgeInsets, "setTrailing:", a3);
}

- (BOOL)isEqual:(id)a3
{
  ACUISEdgeInsets *v4;
  BOOL v5;

  v4 = (ACUISEdgeInsets *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ActivityEdgeInsets isEqual:](self->_edgeInsets, "isEqual:", v4->_edgeInsets);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[ActivityEdgeInsets hash](self->_edgeInsets, "hash");
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_edgeInsets, CFSTR("insets"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISEdgeInsets *v4;
  void *v5;
  id v6;

  v4 = [ACUISEdgeInsets alloc];
  v5 = (void *)-[ActivityEdgeInsets copy](self->_edgeInsets, "copy");
  v6 = -[ACUISEdgeInsets _initWithEdgeInsets:](v4, "_initWithEdgeInsets:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISEdgeInsets)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ACUISEdgeInsets *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("insets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ACUISEdgeInsets _initWithEdgeInsets:](self, "_initWithEdgeInsets:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_edgeInsets, CFSTR("insets"));
}

- (id)_edgeInsets
{
  return self->_edgeInsets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeInsets, 0);
}

@end
