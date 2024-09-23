@implementation AVTCoreModelMulticolorAuxilaryPickerItem

- (AVTCoreModelMulticolorAuxilaryPickerItem)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTCoreModelMulticolorAuxilaryPickerItem *v12;
  AVTCoreModelMulticolorAuxilaryPickerItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTCoreModelMulticolorAuxilaryPickerItem;
  v12 = -[AVTCoreModelMulticolorAuxilaryPickerItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_message, a5);
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
