@implementation NTKComplicationPickerBaseViewConfiguration

- (NTKComplicationPickerBaseViewConfiguration)initWithListProvider:(id)a3
{
  id v5;
  NTKComplicationPickerBaseViewConfiguration *v6;
  NTKComplicationPickerBaseViewConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationPickerBaseViewConfiguration;
  v6 = -[NTKComplicationPickerBaseViewConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listProvider, a3);

  return v7;
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listProvider, 0);
}

@end
