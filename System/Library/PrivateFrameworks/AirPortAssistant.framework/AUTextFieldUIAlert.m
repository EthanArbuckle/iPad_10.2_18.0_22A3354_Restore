@implementation AUTextFieldUIAlert

- (void)prepareToShow
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUTextFieldUIAlert;
  -[AUUIAlert prepareToShow](&v5, sel_prepareToShow);
  objc_msgSend_addTextField(self, v3, v4);
}

- (void)addTextField
{
  MEMORY[0x24BEDD108](self->super.alert, sel_addTextFieldWithConfigurationHandler_, &unk_24DD07080);
}

- (id)textField
{
  return (id)MEMORY[0x24BEDD108](self, sel_textFieldAtIndex_, 0);
}

- (id)textFieldAtIndex:(unint64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  v4 = (void *)objc_msgSend_textFields(self->super.alert, a2, a3);
  if (objc_msgSend_count(v4, v5, v6) <= a3)
    return 0;
  else
    return (id)objc_msgSend_objectAtIndexedSubscript_(v4, v7, a3);
}

@end
