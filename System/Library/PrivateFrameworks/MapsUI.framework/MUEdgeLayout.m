@implementation MUEdgeLayout

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  MUEdgeLayoutInternal *v8;
  MUEdgeLayout *v9;
  MUEdgeLayout *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[MUEdgeLayoutInternal initWithItem:container:]([MUEdgeLayoutInternal alloc], "initWithItem:container:", v7, v6);

  v12.receiver = self;
  v12.super_class = (Class)MUEdgeLayout;
  v9 = -[MUConstraintLayout initWithInternal:](&v12, sel_initWithInternal_, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_internal, v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v11;
  id v12;
  MUEdgeLayoutInternal *v13;
  MUEdgeLayout *v14;
  MUEdgeLayout *v15;
  objc_super v17;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v11 = a4;
  v12 = a3;
  v13 = -[MUEdgeLayoutInternal initWithItem:container:insets:]([MUEdgeLayoutInternal alloc], "initWithItem:container:insets:", v12, v11, top, leading, bottom, trailing);

  v17.receiver = self;
  v17.super_class = (Class)MUEdgeLayout;
  v14 = -[MUConstraintLayout initWithInternal:](&v17, sel_initWithInternal_, v13);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_internal, v13);

  return v15;
}

- (MUEdgeLayout)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v15;
  id v16;
  MUEdgeLayoutInternal *v17;
  double v18;
  MUEdgeLayoutInternal *v19;
  MUEdgeLayout *v20;
  MUEdgeLayout *v21;
  objc_super v23;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v15 = a4;
  v16 = a3;
  v17 = [MUEdgeLayoutInternal alloc];
  *(float *)&v18 = a7;
  v19 = -[MUEdgeLayoutInternal initWithItem:container:insets:edges:priority:](v17, "initWithItem:container:insets:edges:priority:", v16, v15, a6, top, leading, bottom, trailing, v18);

  v23.receiver = self;
  v23.super_class = (Class)MUEdgeLayout;
  v20 = -[MUConstraintLayout initWithInternal:](&v23, sel_initWithInternal_, v19);
  v21 = v20;
  if (v20)
    objc_storeStrong((id *)&v20->_internal, v19);

  return v21;
}

- (MULayoutItem)container
{
  return -[MUEdgeLayoutInternal container](self->_internal, "container");
}

- (void)setContainer:(id)a3
{
  -[MUEdgeLayoutInternal setContainer:](self->_internal, "setContainer:", a3);
}

- (MULayoutItem)item
{
  return -[MUEdgeLayoutInternal item](self->_internal, "item");
}

- (void)setItem:(id)a3
{
  -[MUEdgeLayoutInternal setItem:](self->_internal, "setItem:", a3);
}

- (NSDirectionalEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[MUEdgeLayoutInternal insets](self->_internal, "insets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  -[MUEdgeLayoutInternal setInsets:](self->_internal, "setInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (unint64_t)edges
{
  return -[MUEdgeLayoutInternal edges](self->_internal, "edges");
}

- (void)setEdges:(unint64_t)a3
{
  -[MUEdgeLayoutInternal setEdges:](self->_internal, "setEdges:", a3);
}

- (float)priority
{
  float result;

  -[MUEdgeLayoutInternal priority](self->_internal, "priority");
  return result;
}

- (void)setPriority:(float)a3
{
  -[MUEdgeLayoutInternal setPriority:](self->_internal, "setPriority:");
}

@end
