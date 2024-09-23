@implementation PKToolPickerWeak

- (PKToolPicker)toolPicker
{
  return (PKToolPicker *)objc_loadWeakRetained((id *)&self->_toolPicker);
}

- (void)setToolPicker:(id)a3
{
  objc_storeWeak((id *)&self->_toolPicker, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toolPicker);
}

@end
