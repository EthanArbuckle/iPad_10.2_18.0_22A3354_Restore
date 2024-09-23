@implementation AccessorySubController

- (AccessorySubController)init
{
  AccessorySubController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccessorySubController;
  result = -[AccessorySubController init](&v3, sel_init);
  if (result)
    *((_BYTE *)&result->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80578]) = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AccessorySubController;
  -[PSListItemsController dealloc](&v2, sel_dealloc);
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BluetoothDeviceProtocol *v8;
  BluetoothDeviceProtocol **p_currentDevice;
  BluetoothDeviceProtocol *currentDevice;
  BluetoothDeviceProtocol *v11;
  NSObject *v12;
  BluetoothDeviceProtocol *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v30;
  objc_super v31;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v31.receiver = self;
  v31.super_class = (Class)AccessorySubController;
  -[PSListItemsController specifiers](&v31, sel_specifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)*MEMORY[0x1E0D80628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bt-device"));
  v8 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
  p_currentDevice = &self->_currentDevice;
  currentDevice = self->_currentDevice;
  self->_currentDevice = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BluetoothDeviceProtocol classicDevice](*p_currentDevice, "classicDevice");
    v11 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AccessorySubController specifiers].cold.2((uint64_t)&self->_currentDevice, v12);

    if ((objc_opt_respondsToSelector() & 1) == 0)
      -[AccessorySubController specifiers].cold.1();
    v11 = *p_currentDevice;
  }
  v13 = v11;
  v14 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, 0, 0, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  -[BluetoothDeviceProtocol clickHoldMode:rightAction:](v13, "clickHoldMode:rightAction:", (char *)&v30 + 4, &v30);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v18, "isEqualToString:", CFSTR("LEFT_ID"));

  if ((_DWORD)v16)
  {
    if (HIDWORD(v30) == 7)
    {
      -[BluetoothDeviceProtocol setClickHoldMode:rightMode:](v13, "setClickHoldMode:rightMode:", 7, 6);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("FOOTER_VOLUME_UP_RIGHT_BUD");
      goto LABEL_17;
    }
    if (HIDWORD(v30) == 6)
    {
      -[BluetoothDeviceProtocol setClickHoldMode:rightMode:](v13, "setClickHoldMode:rightMode:", 6, 7);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("FOOTER_VOLUME_DOWN_RIGHT_BUD");
LABEL_17:
      objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setProperty:forKey:", v24, *MEMORY[0x1E0D80848]);

    }
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("RIGHT_ID"));

    if (v23)
    {
      if ((_DWORD)v30 == 7)
      {
        -[BluetoothDeviceProtocol setClickHoldMode:rightMode:](v13, "setClickHoldMode:rightMode:", 6, 7);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("FOOTER_VOLUME_UP_LEFT_BUD");
        goto LABEL_17;
      }
      if ((_DWORD)v30 == 6)
      {
        -[BluetoothDeviceProtocol setClickHoldMode:rightMode:](v13, "setClickHoldMode:rightMode:", 7, 6);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("FOOTER_VOLUME_DOWN_LEFT_BUD");
        goto LABEL_17;
      }
    }
  }
  objc_msgSend(v5, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v26 = (int)*MEMORY[0x1E0D80590];
  v27 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v26);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v26) = v25;

  v28 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v26);
  return v28;
}

- (void)listItemSelected:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!objc_msgSend(v4, "section"))
  {
    v5.receiver = self;
    v5.super_class = (Class)AccessorySubController;
    -[PSListItemsController listItemSelected:](&v5, sel_listItemSelected_, v4);
    -[AccessorySubController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

- (void)specifiers
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, " AccessorySubController does not respond to classicDevice, currentDevice is %@", (uint8_t *)&v5, 0xCu);

}

@end
