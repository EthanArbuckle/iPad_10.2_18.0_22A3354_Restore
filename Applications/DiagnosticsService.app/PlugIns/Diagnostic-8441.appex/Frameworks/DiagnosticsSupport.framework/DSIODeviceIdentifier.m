@implementation DSIODeviceIdentifier

- (DSIODeviceIdentifier)initWithAccessoryModel:(unint64_t)a3 usagePage:(unsigned int)a4 usage:(unsigned int)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7
{
  DSIODeviceIdentifier *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DSIODeviceIdentifier;
  result = -[DSIODeviceIdentifier init](&v13, "init");
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
  CFTypeRef Property;
  void *v5;
  CFTypeRef v6;
  CFTypeRef v7;
  uint64_t v8;
  __int128 v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  Property = IOHIDDeviceGetProperty(a3, CFSTR("DeviceUsagePairs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(Property);
  v6 = IOHIDDeviceGetProperty(a3, CFSTR("VendorID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v7 = IOHIDDeviceGetProperty(a3, CFSTR("ProductID"));
  v24 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v8 = 0;
  v9 = 0uLL;
  do
  {
    v29 = v9;
    v30 = v9;
    v27 = v9;
    v28 = v9;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceUsagePage")));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceUsage")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", v8));
          v19 = objc_msgSend(v18, "usagePage");
          if (v19 == objc_msgSend(v16, "unsignedIntValue"))
          {
            v20 = objc_msgSend(v18, "usage");
            if (v20 == objc_msgSend(v17, "unsignedIntValue"))
            {
              v21 = objc_msgSend(v18, "vendorID");
              if (v21 == objc_msgSend(v26, "unsignedIntValue"))
              {
                v22 = objc_msgSend(v18, "productID");
                if (v22 == objc_msgSend(v25, "unsignedIntValue"))
                {

                  goto LABEL_16;
                }
              }
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          continue;
        break;
      }
    }

    ++v8;
    v5 = v24;
    v9 = 0uLL;
  }
  while (v8 != 20);
  v18 = 0;
LABEL_16:

  return v18;
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
