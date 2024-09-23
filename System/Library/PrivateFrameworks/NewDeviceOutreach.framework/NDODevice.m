@implementation NDODevice

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  LOWORD(v15) = 257;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v12, v11, v10, a6, 0, 0, v15);

  return (NDODevice *)v13;
}

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;

  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOWORD(v21) = 257;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v18, v17, v16, a6, v15, v14, v21);

  return (NDODevice *)v19;
}

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  BYTE1(v22) = 1;
  LOBYTE(v22) = a9;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v19, v18, v17, a6, v16, v15, v22);

  return (NDODevice *)v20;
}

- (NDODevice)initWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9 cachingPolicy:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NDODevice *v21;
  NDODevice *v22;
  objc_super v24;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)NDODevice;
  v21 = -[NDODevice init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[NDODevice setName:](v21, "setName:", v16);
    -[NDODevice setSerialNumber:](v22, "setSerialNumber:", v17);
    -[NDODevice setDeviceType:](v22, "setDeviceType:", a6);
    -[NDODevice setActivationDate:](v22, "setActivationDate:", v18);
    -[NDODevice setProductID:](v22, "setProductID:", v19);
    -[NDODevice setProductName:](v22, "setProductName:", v20);
    -[NDODevice setIsVisibleInCC:](v22, "setIsVisibleInCC:", a9);
    -[NDODevice setCachingPolicy:](v22, "setCachingPolicy:", a10);
  }

  return v22;
}

+ (NDODevice)deviceWithDeviceListDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  NDODevice *v12;
  void *v13;
  void *v14;
  NDODevice *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("coverageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("APPLE_ID")) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("PRIMARY")))
  {
    v7 = 0;
  }
  else
  {
    v7 = 3;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cachePolicy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NO_CACHE"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nickName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceDesc"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v12 = [NDODevice alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceDesc"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v30) = v9 ^ 1;
  LOBYTE(v30) = 1;
  v15 = -[NDODevice initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:](v12, "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v10, v13, 0, v7, 0, v14, v30);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferEligible"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcOfferEligible:](v15, "setAcOfferEligible:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferEligibleUntil"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcOfferEligibleUntil:](v15, "setAcOfferEligibleUntil:", v18);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("covered"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setCovered:](v15, "setCovered:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageLocalizedLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setCoverageLocalizedLabel:](v15, "setCoverageLocalizedLabel:", v20);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferStatusLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcLocalizedOfferStatusLabel:](v15, "setAcLocalizedOfferStatusLabel:", v21);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedUnlinkedPlanStatusLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcLocalizedUnlinkedPlanStatusLabel:](v15, "setAcLocalizedUnlinkedPlanStatusLabel:", v22);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceImageUrl"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setDeviceImageUrl:](v15, "setDeviceImageUrl:", v23);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceDesc"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setDeviceDesc:](v15, "setDeviceDesc:", v24);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sgId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setSgId:](v15, "setSgId:", v25);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pfcId"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setPfcId:](v15, "setPfcId:", v26);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pgfId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setPgfId:](v15, "setPgfId:", v27);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parentId"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setParentId:](v15, "setParentId:", v28);

  return v15;
}

+ (NDODevice)deviceWithCBDevice:(id)a3
{
  return +[NDODevice deviceWithCBDevice:isVisibleInCC:](NDODevice, "deviceWithCBDevice:isVisibleInCC:", a3, 1);
}

+ (NDODevice)deviceWithCBDevice:(id)a3 isVisibleInCC:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
LABEL_3:
    v9 = v8;
    goto LABEL_44;
  }
  v10 = objc_msgSend(v5, "productID");
  v11 = v10;
  if ((int)v10 <= 612)
  {
    if ((int)v10 <= 557)
    {
      if ((int)v10 > 521)
      {
        if ((_DWORD)v10 != 522 && (_DWORD)v10 != 556 && (_DWORD)v10 != 557)
          goto LABEL_113;
      }
      else
      {
        if (!(_DWORD)v10)
        {
LABEL_54:
          objc_msgSend(v5, "deviceType", v11);
          CBDeviceTypeToNSLocalizedString();
          v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        if ((_DWORD)v10 != 520 && (_DWORD)v10 != 521)
          goto LABEL_113;
      }
    }
    else if ((int)v10 <= 570)
    {
      if ((_DWORD)v10 != 558 && (_DWORD)v10 != 569 && (_DWORD)v10 != 570)
        goto LABEL_113;
    }
    else if ((int)v10 > 597)
    {
      if ((_DWORD)v10 != 598 && (_DWORD)v10 != 599)
        goto LABEL_113;
    }
    else if ((_DWORD)v10 != 571 && (_DWORD)v10 != 597)
    {
      goto LABEL_113;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("apple_wireless_keyboard");
    goto LABEL_42;
  }
  if ((int)v10 > 776)
  {
    if ((int)v10 <= 8212)
    {
      switch((int)v10)
      {
        case 777:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("apple_wireless_mouse");
          goto LABEL_42;
        case 780:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("apple_mighty_mouse");
          goto LABEL_42;
        case 781:
LABEL_69:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("apple_magic_mouse");
          goto LABEL_42;
        case 782:
LABEL_70:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("apple_magic_trackpad");
          goto LABEL_42;
        default:
          goto LABEL_113;
      }
    }
    if ((_DWORD)v10 == 8220 || (_DWORD)v10 == 8216 || (_DWORD)v10 == 8213)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("apple_airpods_case");
      goto LABEL_42;
    }
  }
  else
  {
    if ((int)v10 <= 665)
    {
      switch((int)v10)
      {
        case 613:
          goto LABEL_70;
        case 615:
          goto LABEL_71;
        case 617:
          goto LABEL_69;
        case 620:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("apple_magic_keyboard_keypad");
          goto LABEL_42;
        default:
          goto LABEL_113;
      }
    }
    switch((_DWORD)v10)
    {
      case 0x29A:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("apple_magic_keyboard_touch");
        goto LABEL_42;
      case 0x29C:
LABEL_71:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("apple_magic_keyboard");
        goto LABEL_42;
      case 0x29F:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("apple_magic_keyboard_touch_keypad");
LABEL_42:
        objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24F81DDD8, CFSTR("CBLocalizable"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
    }
  }
LABEL_113:
  objc_msgSend(MEMORY[0x24BDBB288], "productInfoWithProductID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "productName");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_43:
  v9 = (void *)v15;

  if (!v9)
    goto LABEL_54;
LABEL_44:

  objc_msgSend(v5, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_msgSend(v5, "productID");
  if (v18 > 21759)
  {
    if (v18 <= 28943)
    {
      if (v18 > 28935)
      {
        if (v18 == 28936)
        {
          v19 = "AppleTV6,2";
          goto LABEL_110;
        }
        if (v18 == 28943)
        {
          v19 = "AudioAccessory1,1";
          goto LABEL_110;
        }
      }
      else
      {
        if (v18 == 21760)
        {
          v19 = "Device1,21760";
          goto LABEL_110;
        }
        if (v18 == 28420)
        {
          v19 = "AppleTV5,3";
          goto LABEL_110;
        }
      }
    }
    else if (v18 <= 29714)
    {
      if (v18 == 28944)
      {
        v19 = "AudioAccessory1,2";
        goto LABEL_110;
      }
      if (v18 == 29455)
      {
        v19 = "AppleTV11,2";
        goto LABEL_110;
      }
    }
    else
    {
      switch(v18)
      {
        case 29715:
          v19 = "AudioAccessory5,1";
          goto LABEL_110;
        case 65533:
          v19 = "HeGn";
          goto LABEL_110;
        case 65534:
          v19 = "ApGn";
          goto LABEL_110;
      }
    }
LABEL_109:
    v19 = "?";
    goto LABEL_110;
  }
  if (v18 <= 8193)
  {
    switch(v18)
    {
      case 0:
        v19 = "Invalid";
        goto LABEL_110;
      case 614:
        v19 = "ATVRemote1,1";
        goto LABEL_110;
      case 621:
        v19 = "ATVRemote1,2";
        goto LABEL_110;
    }
    goto LABEL_109;
  }
  switch(v18)
  {
    case 8194:
      v19 = "AirPods1,1";
      break;
    case 8195:
      v19 = "PowerBeats3,1";
      break;
    case 8197:
      v19 = "BeatsX1,1";
      break;
    case 8198:
      v19 = "BeatsSolo3,1";
      break;
    case 8201:
      v19 = "BeatsStudio3,2";
      break;
    case 8202:
      v19 = "Device1,8202";
      break;
    case 8203:
      v19 = "PowerbeatsPro1,1";
      break;
    case 8204:
      v19 = "BeatsSoloPro1,1";
      break;
    case 8205:
      v19 = "Powerbeats4,1";
      break;
    case 8206:
      v19 = "AirPodsPro1,1";
      break;
    case 8207:
      v19 = "AirPods1,3";
      break;
    case 8208:
      v19 = "Device1,8208";
      break;
    case 8209:
      v19 = "BeatsStudioBuds1,1";
      break;
    case 8210:
      v19 = "Device1,8210";
      break;
    case 8211:
      v19 = "Device1,8211";
      break;
    case 8212:
      v19 = "Device1,8212";
      break;
    case 8213:
      v19 = "Device1,8213";
      break;
    case 8214:
      v19 = "BeatsStudioBuds1,2";
      break;
    case 8215:
      v19 = "BeatsStudioPro1,1";
      break;
    case 8216:
      v19 = "Device1,8216";
      break;
    case 8217:
      v19 = "Device1,8217";
      break;
    case 8218:
      v19 = "Device1,8218";
      break;
    case 8219:
      v19 = "Device1,8219";
      break;
    case 8220:
      v19 = "Device1,8220";
      break;
    case 8221:
      v19 = "Device1,8221";
      break;
    case 8222:
      v19 = "Device1,8222";
      break;
    case 8223:
      v19 = "Device1,8223";
      break;
    case 8224:
      v19 = "Device1,8224";
      break;
    case 8228:
      v19 = "Device1,8228";
      break;
    case 8229:
      v19 = "Device1,8229";
      break;
    case 8230:
      v19 = "Device1,8230";
      break;
    default:
      goto LABEL_109;
  }
LABEL_110:
  objc_msgSend(v17, "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a4;
  +[NDODevice deviceWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:](NDODevice, "deviceWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:", v9, v16, 0, 3, v20, v21, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setColorCode:", objc_msgSend(v5, "colorCodeBest"));
  return (NDODevice *)v22;
}

- (NSString)sourceFromDeviceType
{
  unint64_t v2;

  v2 = -[NDODevice deviceType](self, "deviceType");
  if (v2 - 1 > 2)
    return (NSString *)CFSTR("DEFAULT");
  else
    return &off_24F81D968[v2 - 1]->isa;
}

- (id)deviceTypeString
{
  unint64_t v2;

  v2 = -[NDODevice deviceType](self, "deviceType");
  if (v2 - 1 > 2)
    return CFSTR("Default");
  else
    return off_24F81D980[v2 - 1];
}

- (id)productPlaceholderImage
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (-[NDODevice deviceType](self, "deviceType"))
  {
    if (-[NDODevice deviceType](self, "deviceType") != 1)
    {
      -[NDODevice productID](self, "productID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NDODevice productID](self, "productID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CBProductIDFromNSString();

        v11 = v10 - 2;
        if ((v10 - 8194) <= 0x24)
        {
          if (((1 << v11) & 0x180931CE9ALL) != 0)
          {
            v3 = (void *)MEMORY[0x24BEBD640];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = CFSTR("Beats");
            goto LABEL_18;
          }
          if (((1 << v11) & 0x452863001) != 0)
          {
            v3 = (void *)MEMORY[0x24BEBD640];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = CFSTR("airpods");
            goto LABEL_18;
          }
          if (((1 << v11) & 0x20000100) != 0)
          {
            v3 = (void *)MEMORY[0x24BEBD640];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = CFSTR("airpodMax");
            goto LABEL_18;
          }
        }
      }
      v3 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("audio");
      goto LABEL_18;
    }
    v3 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("watch");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
    {
      v3 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("iPad");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      v3 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == 6)
        v5 = CFSTR("visonpro");
      else
        v5 = CFSTR("iPhone");
    }
  }
LABEL_18:
  objc_msgSend(v3, "imageNamed:inBundle:withConfiguration:", v5, v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NDODevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice activationDate](self, "activationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice deviceTypeString](self, "deviceTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice productName](self, "productName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ :: (%@) :: (%@) :: %@ - %@ :: (%@) :: %d"), v4, v5, v6, v7, v8, v9, -[NDODevice isVisibleInCC](self, "isVisibleInCC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)updateWithWarranty:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NDODevice setAcOfferEligible:](self, "setAcOfferEligible:", objc_msgSend(v9, "acOfferEligible"));
  -[NDODevice setCovered:](self, "setCovered:", objc_msgSend(v9, "covered"));
  objc_msgSend(v9, "coverageLocalizedLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setCoverageLocalizedLabel:](self, "setCoverageLocalizedLabel:", v4);

  objc_msgSend(v9, "acLocalizedOfferStatusLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcLocalizedOfferStatusLabel:](self, "setAcLocalizedOfferStatusLabel:", v5);

  objc_msgSend(v9, "acLocalizedUnlinkedPlanStatusLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODevice setAcLocalizedUnlinkedPlanStatusLabel:](self, "setAcLocalizedUnlinkedPlanStatusLabel:", v6);

  -[NDODevice deviceImageUrl](self, "deviceImageUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v9, "deviceImageUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setDeviceImageUrl:](self, "setDeviceImageUrl:", v8);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[NDODevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[NDODevice serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumber"));

  -[NDODevice activationDate](self, "activationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activationDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NDODevice deviceType](self, "deviceType"), CFSTR("deviceType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[NDODevice colorCode](self, "colorCode"), CFSTR("colorCode"));
  -[NDODevice productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productID"));

  -[NDODevice productName](self, "productName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("productName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice isVisibleInCC](self, "isVisibleInCC"), CFSTR("isVisibleInCC"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice acOfferEligible](self, "acOfferEligible"), CFSTR("acOfferEligible"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice covered](self, "covered"), CFSTR("covered"));
  -[NDODevice coverageLocalizedLabel](self, "coverageLocalizedLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("coverageLocalizedLabel"));

  -[NDODevice acLocalizedOfferStatusLabel](self, "acLocalizedOfferStatusLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("acLocalizedOfferStatusLabel"));

  -[NDODevice acLocalizedUnlinkedPlanStatusLabel](self, "acLocalizedUnlinkedPlanStatusLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("acLocalizedUnlinkedPlanStatusLabel"));

  -[NDODevice deviceImageUrl](self, "deviceImageUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("deviceImageUrl"));

  -[NDODevice deviceDesc](self, "deviceDesc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("deviceDesc"));

  -[NDODevice sgId](self, "sgId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("sgId"));

  -[NDODevice pfcId](self, "pfcId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("pfcId"));

  -[NDODevice pgfId](self, "pgfId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("pgfId"));

  -[NDODevice parentId](self, "parentId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("parentId"));

  -[NDODevice acOfferEligibleUntil](self, "acOfferEligibleUntil");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("acOfferEligibleUntil"));

}

- (NDODevice)initWithCoder:(id)a3
{
  id v4;
  NDODevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NDODevice;
  v5 = -[NDODevice init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setSerialNumber:](v5, "setSerialNumber:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setActivationDate:](v5, "setActivationDate:", v8);

    -[NDODevice setDeviceType:](v5, "setDeviceType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType")));
    -[NDODevice setColorCode:](v5, "setColorCode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("colorCode")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setProductID:](v5, "setProductID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setProductName:](v5, "setProductName:", v10);

    -[NDODevice setIsVisibleInCC:](v5, "setIsVisibleInCC:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVisibleInCC")));
    -[NDODevice setAcOfferEligible:](v5, "setAcOfferEligible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("acOfferEligible")));
    -[NDODevice setCovered:](v5, "setCovered:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("covered")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coverageLocalizedLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setCoverageLocalizedLabel:](v5, "setCoverageLocalizedLabel:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acLocalizedOfferStatusLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setAcLocalizedOfferStatusLabel:](v5, "setAcLocalizedOfferStatusLabel:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acLocalizedUnlinkedPlanStatusLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setAcLocalizedUnlinkedPlanStatusLabel:](v5, "setAcLocalizedUnlinkedPlanStatusLabel:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceImageUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setDeviceImageUrl:](v5, "setDeviceImageUrl:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceDesc"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setDeviceDesc:](v5, "setDeviceDesc:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sgId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setSgId:](v5, "setSgId:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pfcId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setPfcId:](v5, "setPfcId:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pgfId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setPgfId:](v5, "setPgfId:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setParentId:](v5, "setParentId:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acOfferEligibleUntil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODevice setAcOfferEligibleUntil:](v5, "setAcOfferEligibleUntil:", v20);

  }
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)activationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActivationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)productID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProductName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)cachingPolicy
{
  return self->_cachingPolicy;
}

- (void)setCachingPolicy:(BOOL)a3
{
  self->_cachingPolicy = a3;
}

- (BOOL)isVisibleInCC
{
  return self->_isVisibleInCC;
}

- (void)setIsVisibleInCC:(BOOL)a3
{
  self->_isVisibleInCC = a3;
}

- (int64_t)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(int64_t)a3
{
  self->_colorCode = a3;
}

- (BOOL)acOfferEligible
{
  return self->_acOfferEligible;
}

- (void)setAcOfferEligible:(BOOL)a3
{
  self->_acOfferEligible = a3;
}

- (NSString)coverageLocalizedLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoverageLocalizedLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)acLocalizedOfferStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAcLocalizedOfferStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)acLocalizedUnlinkedPlanStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (NSString)deviceImageUrl
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceImageUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)deviceDesc
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)sgId
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSgId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)pfcId
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPfcId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)pgfId
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPgfId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)parentId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setParentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)acOfferEligibleUntil
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAcOfferEligibleUntil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acOfferEligibleUntil, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_pgfId, 0);
  objc_storeStrong((id *)&self->_pfcId, 0);
  objc_storeStrong((id *)&self->_sgId, 0);
  objc_storeStrong((id *)&self->_deviceDesc, 0);
  objc_storeStrong((id *)&self->_deviceImageUrl, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferStatusLabel, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
