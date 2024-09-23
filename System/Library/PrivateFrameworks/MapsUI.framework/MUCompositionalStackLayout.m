@implementation MUCompositionalStackLayout

- (MUCompositionalStackLayout)initWithContainer:(id)a3 group:(id)a4
{
  id v6;
  void *v7;
  MUCompositionalStackLayoutInternal *v8;
  void *v9;
  MUCompositionalStackLayoutInternal *v10;
  MUCompositionalStackLayout *v11;
  MUCompositionalStackLayout *v12;
  objc_super v14;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v8 = [MUCompositionalStackLayoutInternal alloc];
  objc_msgSend(v7, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MUCompositionalStackLayoutInternal initWithContainer:group:](v8, "initWithContainer:group:", v6, v9);

  v14.receiver = self;
  v14.super_class = (Class)MUCompositionalStackLayout;
  v11 = -[MUConstraintLayout initWithInternal:](&v14, sel_initWithInternal_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internal, v10);
    objc_storeStrong((id *)&v12->_group, v7);
  }

  return v12;
}

- (MULayoutItem)container
{
  return -[MUCompositionalStackLayoutInternal container](self->_internal, "container");
}

- (void)setContainer:(id)a3
{
  -[MUCompositionalStackLayoutInternal setContainer:](self->_internal, "setContainer:", a3);
}

- (void)setGroup:(id)a3
{
  MUCompositionalStackLayoutGroup *v4;
  MUCompositionalStackLayoutGroup *group;
  id v6;

  if (self->_group != a3)
  {
    v4 = (MUCompositionalStackLayoutGroup *)objc_msgSend(a3, "copy");
    group = self->_group;
    self->_group = v4;

    -[MUCompositionalStackLayoutGroup internal](self->_group, "internal");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MUCompositionalStackLayoutInternal setGroup:](self->_internal, "setGroup:", v6);

  }
}

- (MUCompositionalStackLayoutGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
