@implementation HUQuickControlWheelPickerViewItem

- (HUQuickControlWheelPickerViewItem)initWithHFTVInputControlItemValue:(id)a3
{
  id v4;
  HUQuickControlWheelPickerViewItem *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSString *text;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlWheelPickerViewItem;
  v5 = -[HUQuickControlWheelPickerViewItem init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_storeStrong(&v5->_value, v7);
      objc_msgSend(v8, "name");
      v9 = objc_claimAutoreleasedReturnValue();
      text = v5->_text;
      v5->_text = (NSString *)v9;

      v5->_isSelected = objc_msgSend(v8, "isSelected");
    }

  }
  return v5;
}

- (HUQuickControlWheelPickerViewItem)initWithHFMultiStateControlItemValue:(id)a3 text:(id)a4 isSelected:(BOOL)a5
{
  id v9;
  id v10;
  HUQuickControlWheelPickerViewItem *v11;
  id v12;
  void *v13;
  id v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlWheelPickerViewItem;
  v11 = -[HUQuickControlWheelPickerViewItem init](&v16, sel_init);
  if (v11)
  {
    objc_opt_class();
    v12 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      objc_storeStrong(&v11->_value, a3);
      objc_storeStrong((id *)&v11->_text, a4);
      v11->_isSelected = a5;
    }

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlWheelPickerViewItem;
    if (-[HUQuickControlWheelPickerViewItem isEqual:](&v13, sel_isEqual_, v5))
    {
      -[HUQuickControlWheelPickerViewItem value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[HUQuickControlWheelPickerViewItem text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          v10 = -[HUQuickControlWheelPickerViewItem isSelected](self, "isSelected");
          v11 = v10 ^ objc_msgSend(v5, "isSelected") ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }

      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)value
{
  return self->_value;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
