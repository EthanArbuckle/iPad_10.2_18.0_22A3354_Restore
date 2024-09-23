@implementation BTTableSharingCell

- (BTTableSharingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  BTTableSharingCell *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BTTableSharingCell;
  v5 = -[BTTableSharingCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    -[BTTableSharingCell setAccessoryView:](v5, "setAccessoryView:", v7);
  }
  return v5;
}

- (BTSDevice)currentDevice
{
  return (BTSDevice *)objc_loadWeakRetained((id *)&self->_currentDevice);
}

- (void)setCurrentDevice:(id)a3
{
  objc_storeWeak((id *)&self->_currentDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentDevice);
}

@end
