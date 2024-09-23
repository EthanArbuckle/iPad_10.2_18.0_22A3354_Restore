@implementation _GCNintendoJoyConProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  if (deviceManager_onceToken != -1)
    dispatch_once(&deviceManager_onceToken, &__block_literal_global_10);
  return (_GCPhysicalDeviceManager *)(id)deviceManager_deviceManager;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  int *v15;
  int v17;

  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)objc_msgSend(v3, "service"), CFSTR("JoyConPlayerLights"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("LED"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "count");
      v8 = 4;
      if (v7 < 4)
        v8 = v7;
      if (v8)
      {
        for (i = 0; i < v13; ++i)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", i);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend(v10, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
            {
              v11 = 0;
            }
            else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ON-SOLID")) & 1) != 0
                   || (objc_msgSend(v10, "isEqualToString:", CFSTR("ON")) & 1) != 0)
            {
              v11 = 1;
            }
            else
            {
              if (!objc_msgSend(v10, "isEqualToString:", CFSTR("ON-FLASH")))
                goto LABEL_14;
              v11 = 2;
            }
            *((_BYTE *)&v17 + i) = v11;
          }
LABEL_14:

          v12 = objc_msgSend(v6, "count");
          if (v12 >= 4)
            v13 = 4;
          else
            v13 = v12;
        }
      }
    }

  }
  v14 = 0;
  v15 = &PlayerLightsConfig;
  while (v17 != *v15)
  {
    ++v14;
    ++v15;
    if (v14 == 9)
    {
      v14 = -1;
      break;
    }
  }

  return v14;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  int64_t v4;
  void *v5;
  __IOHIDServiceClient *v6;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a4 + 1;
  if ((unint64_t)(a4 + 1) <= 8)
  {
    objc_msgSend(a3, "serviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__IOHIDServiceClient *)objc_msgSend(v5, "service");
    v7 = PlayerLightsConfig[v4];
    v19 = CFSTR("LED");
    if (v7 >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = off_24D2B4000[(char)v7];
    }
    v18[0] = v8;
    if (BYTE1(v7) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = off_24D2B4000[SBYTE1(v7)];
    }
    v18[1] = v10;
    if (BYTE2(v7) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = off_24D2B4000[SBYTE2(v7)];
    }
    v18[2] = v12;
    if (HIBYTE(v7) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = off_24D2B4000[SHIBYTE(v7)];
    }
    v18[3] = v14;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v18, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDServiceClientSetProperty(v6, CFSTR("JoyConPlayerLights"), v17);
  }
}

+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "batteryServiceServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63___GCNintendoJoyConProfile_physicalDevice_getBatteryWithReply___block_invoke;
  v8[3] = &unk_24D2B3FE0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "readBatteryWithReply:", v8);

}

@end
