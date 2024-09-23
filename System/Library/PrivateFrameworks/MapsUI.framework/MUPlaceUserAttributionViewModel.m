@implementation MUPlaceUserAttributionViewModel

- (MUPlaceUserAttributionViewModel)initWithAttributionName:(id)a3
{
  id v5;
  MUPlaceUserAttributionViewModel *v6;
  MUPlaceUserAttributionViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceUserAttributionViewModel;
  v6 = -[MUPlaceUserAttributionViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributionName, a3);

  return v7;
}

- (BOOL)showFullAttributionName
{
  return -[NSString length](self->_attributionName, "length") != 0;
}

- (NSString)attributionName
{
  return self->_attributionName;
}

- (void)setAttributionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionName, 0);
}

@end
