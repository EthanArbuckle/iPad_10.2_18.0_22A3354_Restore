@implementation HPSProductUtils

+ (id)getProductSpecificString:(unsigned int)a3 descriptionKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  switch(a3)
  {
    case 0x200Au:
    case 0x201Fu:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-b515");
      goto LABEL_15;
    case 0x2011u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B507");
      goto LABEL_15;
    case 0x2012u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B494");
      goto LABEL_15;
    case 0x2013u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B688");
      goto LABEL_15;
    case 0x2014u:
    case 0x2024u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B698");
      goto LABEL_15;
    case 0x2016u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B607");
      goto LABEL_15;
    case 0x2017u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B453");
      goto LABEL_15;
    case 0x201Au:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B487");
      goto LABEL_15;
    case 0x201Du:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B498-v2");
      goto LABEL_15;
    case 0x2026u:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DeviceConfig-B463");
LABEL_15:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24F9F3620, v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[HPSProductUtils getProductSpecificString:descriptionKey:].cold.1((uint64_t)v5, a3, v9);

      v10 = &stru_24F9F3620;
      break;
  }
  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = a3;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_22E158000, v11, OS_LOG_TYPE_DEFAULT, "HPSProductUtils: getProductSpecificString called with pid %d and descKey %@ value %@", (uint8_t *)v13, 0x1Cu);
  }

  return v10;
}

+ (BOOL)isAppleHeadphone:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (objc_msgSend(v3, "isAppleAudioDevice") & 1) != 0 || objc_msgSend(v4, "productId") == 8209;
    v15 = objc_msgSend(v4, "productId") == 8214 || v5;
    v14 = v15 != 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[HPSProductUtils isAppleHeadphone:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
  }

  return v14;
}

+ (BOOL)isAirPods:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "productId");
    v6 = ((v5 - 8194) < 0x23) & (0x420063101uLL >> (v5 - 2));
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109376;
      v16[1] = v6;
      v17 = 1024;
      v18 = objc_msgSend(v4, "productId");
      _os_log_impl(&dword_22E158000, v7, OS_LOG_TYPE_DEFAULT, "HPSProductUtils: isAirPods:%i productID:%i", (uint8_t *)v16, 0xEu);
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[HPSProductUtils isAirPods:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isBeatsNonWx:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "productId");
    v6 = objc_msgSend(v4, "productId");
    v7 = objc_msgSend(v4, "productId");
    v10 = v5 == 8209 || v6 == 8214 || v7 == 8230;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[HPSProductUtils isBeatsNonWx:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }

  return v10;
}

+ (BOOL)isFeatureSupported:(int)a3 byDevice:(id)a4
{
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend(a4, "productId");
  if (v4 > 1)
    return 0;
  else
    return objc_msgSend(a1, "isFeatureSupported:byProductId:", v4, v6);
}

+ (BOOL)isFeatureSupported:(int)a3 byProductId:(unsigned int)a4
{
  unint64_t v4;
  unsigned int v5;

  v4 = (0x1C6B37FF01uLL >> (a4 - 2)) & 1;
  if (a4 - 8194 >= 0x25)
    LOBYTE(v4) = 0;
  v5 = (0x14630611u >> (a4 - 10)) & 1;
  if (a4 - 8202 >= 0x1D)
    LOBYTE(v5) = 0;
  if (a3)
    LOBYTE(v5) = 0;
  if (a3 == 1)
    return v4;
  else
    return v5;
}

+ (BOOL)isRealityDevice
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RealityDevice"));

  return v3;
}

+ (void)getProductSpecificString:(os_log_t)log descriptionKey:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22E158000, log, OS_LOG_TYPE_ERROR, "HPSProductUtils: getProductSpecificString called with invalid pid %d and (or) descKey %@", (uint8_t *)v3, 0x12u);
}

+ (void)isAppleHeadphone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E158000, a1, a3, "HPSProductUtils: Cannot check if is Apple Headphone, Null Device pointer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)isAirPods:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E158000, a1, a3, "HPSProductUtils: Cannot check if is AirPods, Null Device pointer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)isBeatsNonWx:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E158000, a1, a3, "HPSProductUtils: Cannot check if is Beats Non Wx, Null Device pointer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
