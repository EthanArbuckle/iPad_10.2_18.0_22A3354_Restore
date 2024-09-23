@implementation HUWheelControlPopUpButton

- (id)_createMenu
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  -[HUWheelControlPopUpButton values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__HUWheelControlPopUpButton__createMenu__block_invoke;
  v8[3] = &unk_1E6F57738;
  objc_copyWeak(&v10, &location);
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E6F60E80, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __40__HUWheelControlPopUpButton__createMenu__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(WeakRetained, "valueFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForObjectValue:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __40__HUWheelControlPopUpButton__createMenu__block_invoke_2;
  v18 = &unk_1E6F50FB0;
  v19 = WeakRetained;
  v20 = v5;
  v10 = v5;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, 0, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "values", v15, v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "indexOfObject:", v13);

  objc_msgSend(v11, "setState:", v14 == a3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

void __40__HUWheelControlPopUpButton__createMenu__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_createMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMenu:", v2);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlView:valueDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setValues:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_values, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_values, a3);
    -[HUWheelControlPopUpButton _createMenu](self, "_createMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPopUpButton setMenu:](self, "setMenu:", v5);

  }
}

- (void)setValueFormatter:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSFormatter isEqual:](self->_valueFormatter, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFormatter, a3);
    -[HUWheelControlPopUpButton _createMenu](self, "_createMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWheelControlPopUpButton setMenu:](self, "setMenu:", v5);

  }
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)setValue:(id)a3
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    v10 = v5;
    v6 = objc_msgSend(self->_value, "isEqualToNumber:", v5);
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong(&self->_value, a3);
      -[HUWheelControlPopUpButton valueFormatter](self, "valueFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringForObjectValue:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWheelControlPopUpButton setTitle:forState:](self, "setTitle:forState:", v8, 0);

      -[HUWheelControlPopUpButton _createMenu](self, "_createMenu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWheelControlPopUpButton setMenu:](self, "setMenu:", v9);

      v5 = v10;
    }
  }

}

- (BOOL)isDisabled
{
  return -[HUWheelControlPopUpButton isEnabled](self, "isEnabled") ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
  -[HUWheelControlPopUpButton setEnabled:](self, "setEnabled:", !a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)value
{
  return self->_value;
}

- (NSArray)values
{
  return self->_values;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
