@implementation AVTCoreModelMulticolorAuxiliaryPicker

- (AVTCoreModelMulticolorAuxiliaryPicker)initWithType:(id)a3 items:(id)a4
{
  id v7;
  id v8;
  AVTCoreModelMulticolorAuxiliaryPicker *v9;
  AVTCoreModelMulticolorAuxiliaryPicker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTCoreModelMulticolorAuxiliaryPicker;
  v9 = -[AVTCoreModelMulticolorAuxiliaryPicker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_items, a4);
  }

  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
