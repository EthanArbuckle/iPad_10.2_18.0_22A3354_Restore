@implementation DSIOPSDevice

+ (id)deviceWithAccessory:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", a3));
  v5 = objc_alloc((Class)a1);
  v9 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = objc_msgSend(v5, "initWithDeviceIdentifiers:", v6);

  return v7;
}

+ (id)deviceMatchingAccessories:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", (int)objc_msgSend(v10, "intValue")));
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          v12 = DiagnosticLogHandleForCategory(6);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v10;
            _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithDeviceIdentifiers:", v4);
  return v14;
}

- (DSIOPSDevice)initWithDeviceIdentifiers:(id)a3
{
  DSIOPSDevice *v4;
  int v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex v8;
  _UNKNOWN **v9;
  const void *ValueAtIndex;
  CFDictionaryRef v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _UNKNOWN **v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id *location;
  DSIOPSDevice *v32;
  const __CFArray *v33;
  CFIndex Count;
  id v35;
  CFIndex v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFTypeRef blob;
  objc_super v44;
  _BYTE v45[128];

  v35 = a3;
  v44.receiver = self;
  v44.super_class = (Class)DSIOPSDevice;
  v4 = -[DSIOPSDevice init](&v44, "init");
  if (v4)
  {
    blob = 0;
    v5 = IOPSCopyPowerSourcesByTypePrecise(0, &blob);
    if (v5 || !blob)
    {
      v26 = DiagnosticLogHandleForCategory(6);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[DSIOPSDevice initWithDeviceIdentifiers:].cold.2(v5, v27);

    }
    else
    {
      v6 = IOPSCopyPowerSourcesList(blob);
      if (v6)
      {
        v7 = v6;
        v32 = v4;
        Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          v8 = 0;
          location = (id *)&v4->_info;
          v9 = &AnalyticsSendEvent_ptr;
          v33 = v7;
          do
          {
            v36 = v8;
            ValueAtIndex = CFArrayGetValueAtIndex(v7, v8);
            v11 = IOPSGetPowerSourceDescription(blob, ValueAtIndex);
            v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            obj = v35;
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v40;
              v37 = v12;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v40 != v15)
                    objc_enumerationMutation(obj);
                  v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Vendor ID"), location));
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[73], "numberWithUnsignedInt:", objc_msgSend(v17, "vendorID")));
                  if ((objc_msgSend(v18, "isEqualToNumber:", v19) & 1) != 0)
                  {
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Product ID")));
                    v21 = v14;
                    v22 = v15;
                    v23 = v9;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[73], "numberWithUnsignedInt:", objc_msgSend(v17, "productID")));
                    v25 = objc_msgSend(v20, "isEqualToNumber:", v24);

                    v9 = v23;
                    v15 = v22;
                    v14 = v21;

                    v12 = v37;
                    if (v25)
                    {
                      objc_storeStrong(location, v37);
                      v32->_deviceModel = (unint64_t)objc_msgSend(v17, "accessoryModel");
                      goto LABEL_18;
                    }
                  }
                  else
                  {

                  }
                }
                v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
              }
              while (v14);
            }
LABEL_18:

            v8 = v36 + 1;
            v7 = v33;
          }
          while (v36 + 1 != Count);
        }
        CFRelease(v7);
        v4 = v32;
      }
      else
      {
        v28 = DiagnosticLogHandleForCategory(6);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[DSIOPSDevice initWithDeviceIdentifiers:].cold.1(v29);

      }
      CFRelease(blob);
    }
    if (!v4->_info)
    {

      v4 = 0;
    }
  }

  return v4;
}

- (id)serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Accessory Identifier")));

  return v3;
}

- (id)information
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[7];

  v32[0] = CFSTR("serialNumber");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Accessory Identifier")));
  v4 = (void *)v3;
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = (void *)v3;
  v33[0] = v3;
  v32[1] = CFSTR("fullChargeCapacity");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Max Capacity")));
  v6 = (void *)v5;
  if (!v5)
    v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v30 = v4;
  v22 = (void *)v5;
  v33[1] = v5;
  v32[2] = CFSTR("nominalChargeCapacity");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Nominal Capacity")));
  v8 = (void *)v7;
  if (!v7)
    v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = (void *)v7;
  v33[2] = v7;
  v32[3] = CFSTR("cycleCount");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CycleCount")));
  v10 = (void *)v9;
  if (!v9)
    v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v28 = v6;
  v33[3] = v9;
  v32[4] = CFSTR("temperature");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Temperature")));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33[4] = v12;
  v32[5] = CFSTR("isCharging");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Is Charging")));
  v15 = v14;
  if (!v14)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33[5] = v15;
  v32[6] = CFSTR("powerSourceState");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSIOPSDevice info](self, "info"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Power Source State")));
  v18 = v17;
  if (!v17)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33[6] = v18;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 7));
  if (!v17)

  if (!v14)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v28)
  if (!v30)

  return v24;
}

- (unint64_t)deviceModel
{
  return self->_deviceModel;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)initWithDeviceIdentifiers:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not retrieve power sources list.", v1, 2u);
}

- (void)initWithDeviceIdentifiers:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not retrieve power sources info. Error code: %03X", (uint8_t *)v2, 8u);
}

@end
