@implementation NTKComplicationPickerDetailViewConfiguration

- (NTKComplicationPickerDetailViewConfiguration)initWithDetailListProvider:(id)a3 title:(id)a4
{
  id v6;
  NTKComplicationPickerDetailViewConfiguration *v7;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKComplicationPickerDetailViewConfiguration;
  v7 = -[NTKComplicationPickerBaseViewConfiguration initWithListProvider:](&v11, sel_initWithListProvider_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v8;

  }
  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
