@implementation DSIODeviceIdentifier

- (DSIODeviceIdentifier)initWithAccessoryModel:(unint64_t)a3 usagePage:(unsigned int)a4 usage:(unsigned int)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7
{
  DSIODeviceIdentifier *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DSIODeviceIdentifier;
  result = -[DSIODeviceIdentifier init](&v13, sel_init);
  if (result)
  {
    result->_accessoryModel = a3;
    result->_usagePage = a4;
    result->_usage = a5;
    result->_vendorID = a6;
    result->_productID = a7;
  }
  return result;
}

+ (id)identifierForAccessoryModel:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  DSIODeviceIdentifier *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DSIODeviceIdentifier *v11;

  switch(a3)
  {
    case 0uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 0;
      v7 = 133;
      v8 = 46;
      v9 = 1452;
      v10 = 5013;
      goto LABEL_24;
    case 1uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 1;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 5016;
      goto LABEL_24;
    case 2uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 2;
      v7 = 133;
      v8 = 46;
      v9 = 1452;
      v10 = 5017;
      goto LABEL_24;
    case 3uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 3;
      v7 = 65280;
      v8 = 11;
      v9 = 76;
      v10 = 546;
      goto LABEL_24;
    case 4uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 4;
      v7 = 65280;
      v8 = 11;
      v9 = 76;
      v10 = 332;
      goto LABEL_24;
    case 5uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 5;
      v7 = 65280;
      v8 = 11;
      v9 = 76;
      v10 = 482;
      goto LABEL_24;
    case 6uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 6;
      v7 = 65280;
      v8 = 11;
      v9 = 76;
      v10 = 1106;
      goto LABEL_24;
    case 7uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 7;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 616;
      goto LABEL_24;
    case 8uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 8;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 618;
      goto LABEL_24;
    case 9uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 9;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 619;
      goto LABEL_24;
    case 0xAuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 10;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 658;
      goto LABEL_24;
    case 0xBuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 11;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 659;
      goto LABEL_24;
    case 0xCuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 12;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 622;
      goto LABEL_24;
    case 0xDuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 13;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 623;
      goto LABEL_24;
    case 0xEuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 14;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 1105;
      goto LABEL_24;
    case 0xFuLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 15;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 1104;
      goto LABEL_24;
    case 0x10uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 16;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 1108;
      goto LABEL_24;
    case 0x11uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 17;
      v7 = 65280;
      v8 = 11;
      v9 = 1452;
      v10 = 1109;
      goto LABEL_24;
    case 0x12uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 18;
      v7 = 65309;
      v8 = 45;
      v9 = 0;
      v10 = 0;
      goto LABEL_24;
    case 0x13uLL:
      v5 = [DSIODeviceIdentifier alloc];
      v6 = 19;
      v7 = 65280;
      v8 = 88;
      v9 = 1452;
      v10 = 30723;
LABEL_24:
      v11 = -[DSIODeviceIdentifier initWithAccessoryModel:usagePage:usage:vendorID:productID:](v5, "initWithAccessoryModel:usagePage:usage:vendorID:productID:", v6, v7, v8, v9, v10, v3, v4);
      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

+ (id)identifierForIOHIDDevice:(__IOHIDDevice *)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  IOHIDDeviceGetProperty(a3, CFSTR("DeviceUsagePairs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDDeviceGetProperty(a3, CFSTR("VendorID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDDeviceGetProperty(a3, CFSTR("ProductID"));
  v21 = v4;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 0uLL;
  do
  {
    v26 = v6;
    v27 = v6;
    v24 = v6;
    v25 = v6;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DeviceUsagePage"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DeviceUsage"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "usagePage");
          if (v16 == objc_msgSend(v13, "unsignedIntValue"))
          {
            v17 = objc_msgSend(v15, "usage");
            if (v17 == objc_msgSend(v14, "unsignedIntValue"))
            {
              v18 = objc_msgSend(v15, "vendorID");
              if (v18 == objc_msgSend(v23, "unsignedIntValue"))
              {
                v19 = objc_msgSend(v15, "productID");
                if (v19 == objc_msgSend(v22, "unsignedIntValue"))
                {

                  goto LABEL_16;
                }
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
          continue;
        break;
      }
    }

    ++v5;
    v4 = v21;
    v6 = 0uLL;
  }
  while (v5 != 20);
  v15 = 0;
LABEL_16:

  return v15;
}

- (unint64_t)accessoryModel
{
  return self->_accessoryModel;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (unsigned)usage
{
  return self->_usage;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

@end
