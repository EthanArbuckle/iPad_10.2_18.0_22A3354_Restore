@implementation __HMFMobileGestaltDataSource

- (int64_t)productVariant
{
  return self->_productVariant;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__HMFMobileGestaltDataSource)init
{
  __HMFMobileGestaltDataSource *v2;
  __HMFMobileGestaltDataSource *v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  __HMFMobileGestaltDataSource *v8;
  void *v9;
  void *v10;
  __HMFMobileGestaltDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  void *Value;
  void *v21;
  CFTypeID v22;
  void *v23;
  void *v24;
  void *v25;
  CFTypeID v26;
  void *v27;
  void *v28;
  void *v29;
  CFTypeID v30;
  void *v31;
  void *v32;
  void *v33;
  CFTypeID v34;
  void *v35;
  void *v36;
  void *v37;
  CFTypeID v38;
  void *v39;
  void *v40;
  void *v41;
  CFTypeID v42;
  void *v43;
  void *v44;
  void *v45;
  CFTypeID v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  CFTypeID v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  uint64_t v71;
  void *v72;
  char v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  CFTypeID v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  HMFSoftwareVersion *v84;
  HMFSoftwareVersion *v85;
  void *v86;
  void *v87;
  CFTypeID v88;
  id v89;
  HMFMACAddress *v90;
  HMFMACAddress *WiFiInterfaceMACAddress;
  const __CFBoolean *v92;
  const __CFBoolean *v93;
  CFTypeID v94;
  void *v95;
  void *v96;
  CFTypeID v97;
  void *v98;
  id v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  objc_super v106;
  id location;
  const __CFString *v108;
  uint64_t v109;
  uint64_t v110;
  const __CFString *v111;
  uint64_t v112;
  void (*v113)(uint64_t, const __CFString *);
  const __CFString *v114;
  id v115[6];

  v115[5] = *(id *)MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)__HMFMobileGestaltDataSource;
  v2 = -[__HMFMobileGestaltDataSource init](&v106, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = v3;
    v108 = CFSTR("UserAssignedDeviceName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v8);
    -[__HMFMobileGestaltDataSource queue](v8, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (const __CFString *)MEMORY[0x1E0C809B0];
    v112 = 3221225472;
    v113 = ____registerForUpdates_block_invoke;
    v114 = (const __CFString *)&unk_1E3B38CB0;
    objc_copyWeak(v115, &location);
    v8->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(v115);
    objc_destroyWeak(&location);

    v11 = v8;
    v12 = (void *)MEMORY[0x1E0C99DE8];
    v111 = CFSTR("ProductType");
    v112 = (uint64_t)CFSTR("ModelNumber");
    v113 = (void (*)(uint64_t, const __CFString *))CFSTR("RegionInfo");
    v114 = CFSTR("ProductName");
    v115[0] = CFSTR("DeviceClass");
    v115[1] = CFSTR("ReleaseType");
    v115[2] = CFSTR("BuildVersion");
    v115[3] = CFSTR("bluetooth-le");
    v115[4] = CFSTR("DeviceColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[__HMFMobileGestaltDataSource shouldFetchUserAssignedDeviceName](v11, "shouldFetchUserAssignedDeviceName");
    if (v15)
      objc_msgSend(v14, "addObject:", CFSTR("UserAssignedDeviceName"));
    v16 = -[__HMFMobileGestaltDataSource shouldFetchProtectedKey:](v11, "shouldFetchProtectedKey:", CFSTR("SerialNumber"));
    if (v16)
      objc_msgSend(v14, "addObject:", CFSTR("SerialNumber"));
    v17 = -[__HMFMobileGestaltDataSource shouldFetchProtectedKey:](v11, "shouldFetchProtectedKey:", CFSTR("WifiAddress"));
    if (v17)
      objc_msgSend(v14, "addObject:", CFSTR("WifiAddress"));
    v18 = (const __CFDictionary *)MGCopyMultipleAnswers();
    v19 = v18;
    if (!v18)
      goto LABEL_115;
    if (v15)
    {
      Value = (void *)CFDictionaryGetValue(v18, CFSTR("UserAssignedDeviceName"));
      v21 = Value;
      if (Value)
      {
        v22 = CFGetTypeID(Value);
        if (v22 == CFStringGetTypeID())
          v23 = v21;
        else
          v23 = 0;
      }
      else
      {
        v23 = 0;
      }
      objc_storeStrong((id *)&v11->_name, v23);
    }
    if (v16)
    {
      v24 = (void *)CFDictionaryGetValue(v19, CFSTR("SerialNumber"));
      v25 = v24;
      if (v24)
      {
        v26 = CFGetTypeID(v24);
        if (v26 == CFStringGetTypeID())
          v27 = v25;
        else
          v27 = 0;
      }
      else
      {
        v27 = 0;
      }
      objc_storeStrong((id *)&v11->_serialNumber, v27);
    }
    v28 = (void *)CFDictionaryGetValue(v19, CFSTR("ProductType"));
    v29 = v28;
    if (v28)
    {
      v30 = CFGetTypeID(v28);
      if (v30 == CFStringGetTypeID())
        v31 = v29;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    objc_storeStrong((id *)&v11->_modelIdentifier, v31);
    v32 = (void *)CFDictionaryGetValue(v19, CFSTR("ModelNumber"));
    v33 = v32;
    if (v32)
    {
      v34 = CFGetTypeID(v32);
      if (v34 == CFStringGetTypeID())
        v35 = v33;
      else
        v35 = 0;
    }
    else
    {
      v35 = 0;
    }
    objc_storeStrong((id *)&v11->_model, v35);
    v36 = (void *)CFDictionaryGetValue(v19, CFSTR("RegionInfo"));
    v37 = v36;
    if (v36)
    {
      v38 = CFGetTypeID(v36);
      if (v38 == CFStringGetTypeID())
        v39 = v37;
      else
        v39 = 0;
    }
    else
    {
      v39 = 0;
    }
    objc_storeStrong((id *)&v11->_regionInfo, v39);
    v40 = (void *)CFDictionaryGetValue(v19, CFSTR("ProductName"));
    v41 = v40;
    if (v40)
    {
      v42 = CFGetTypeID(v40);
      if (v42 == CFStringGetTypeID())
        v43 = v41;
      else
        v43 = 0;
    }
    else
    {
      v43 = 0;
    }
    v11->_productPlatform = HMFProductPlatformFromString(v43);
    v44 = (void *)CFDictionaryGetValue(v19, CFSTR("DeviceClass"));
    v45 = v44;
    if (v44)
    {
      v46 = CFGetTypeID(v44);
      if (v46 == CFStringGetTypeID())
        v47 = v45;
      else
        v47 = 0;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v47, "lowercaseString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("iPhone"), "lowercaseString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "containsString:", v49);

    if ((v50 & 1) != 0)
    {
      v51 = 1;
    }
    else
    {
      objc_msgSend(CFSTR("iPod"), "lowercaseString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v48, "containsString:", v52);

      if ((v53 & 1) != 0)
      {
        v51 = 2;
      }
      else
      {
        objc_msgSend(CFSTR("iPad"), "lowercaseString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v48, "containsString:", v54);

        if ((v55 & 1) != 0)
        {
          v51 = 3;
        }
        else
        {
          objc_msgSend(CFSTR("AppleTV"), "lowercaseString");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v48, "containsString:", v56);

          if ((v57 & 1) != 0)
          {
            v51 = 4;
          }
          else
          {
            objc_msgSend(CFSTR("Watch"), "lowercaseString");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v48, "containsString:", v58);

            if ((v59 & 1) != 0)
            {
              v51 = 5;
            }
            else
            {
              objc_msgSend(CFSTR("AudioAccessory"), "lowercaseString");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v48, "containsString:", v60);

              if ((v61 & 1) != 0)
              {
                v51 = 6;
              }
              else
              {
                objc_msgSend(CFSTR("RealityDevice"), "lowercaseString");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v48, "containsString:", v62);

                if (v63)
                  v51 = 11;
                else
                  v51 = 0;
              }
            }
          }
        }
      }
    }

    v11->_productClass = v51;
    v64 = (void *)CFDictionaryGetValue(v19, CFSTR("ReleaseType"));
    v65 = v64;
    if (v64)
    {
      v66 = CFGetTypeID(v64);
      if (v66 == CFStringGetTypeID())
        v67 = v65;
      else
        v67 = 0;
    }
    else
    {
      v67 = 0;
    }
    objc_msgSend(v67, "lowercaseString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Beta"), "lowercaseString");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "containsString:", v69);

    if ((v70 & 1) != 0)
    {
      v71 = 1;
    }
    else
    {
      objc_msgSend(CFSTR("Carrier"), "lowercaseString");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v68, "containsString:", v72);

      if ((v73 & 1) != 0)
      {
        v71 = 2;
      }
      else
      {
        objc_msgSend(CFSTR("Internal"), "lowercaseString");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v68, "containsString:", v74);

        if (v75)
          v71 = 3;
        else
          v71 = 0;
      }
    }

    v11->_productVariant = v71;
    v76 = (void *)CFDictionaryGetValue(v19, CFSTR("BuildVersion"));
    v77 = v76;
    if (v76)
    {
      v78 = CFGetTypeID(v76);
      if (v78 == CFStringGetTypeID())
        v79 = v77;
      else
        v79 = 0;
    }
    else
    {
      v79 = 0;
    }
    v108 = 0;
    v109 = 0;
    v110 = 0;
    v80 = (void *)MEMORY[0x1E0CB3898];
    v81 = v79;
    objc_msgSend(v80, "processInfo");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v82)
    {
      objc_msgSend(v82, "operatingSystemVersion");
    }
    else
    {
      v108 = 0;
      v109 = 0;
      v110 = 0;
    }

    v84 = [HMFSoftwareVersion alloc];
    v85 = -[HMFSoftwareVersion initWithMajorVersion:minorVersion:updateVersion:buildVersion:](v84, "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", v108, v109, v110, v81);

    if (v85)
      objc_storeStrong((id *)&v11->_softwareVersion, v85);

    if (v17)
    {
      v86 = (void *)CFDictionaryGetValue(v19, CFSTR("WifiAddress"));
      v87 = v86;
      if (v86)
      {
        v88 = CFGetTypeID(v86);
        if (v88 == CFStringGetTypeID())
        {
          v89 = v87;
          v90 = -[HMFMACAddress initWithMACAddressString:]([HMFMACAddress alloc], "initWithMACAddressString:", v89);
          WiFiInterfaceMACAddress = v11->_WiFiInterfaceMACAddress;
          v11->_WiFiInterfaceMACAddress = v90;

        }
      }
    }
    v92 = (const __CFBoolean *)CFDictionaryGetValue(v19, CFSTR("bluetooth-le"));
    v93 = v92;
    if (v92)
    {
      v94 = CFGetTypeID(v92);
      if (v94 == CFBooleanGetTypeID())
        v11->_supportsBLE = CFBooleanGetValue(v93) != 0;
    }
    v95 = (void *)CFDictionaryGetValue(v19, CFSTR("DeviceColor"));
    v96 = v95;
    if (v95)
    {
      v97 = CFGetTypeID(v95);
      if (v97 == CFStringGetTypeID())
        v98 = v96;
      else
        v98 = 0;
    }
    else
    {
      v98 = 0;
    }
    v99 = v98;
    v100 = MGGetProductType();
    v101 = v99;
    v102 = v101;
    v103 = 0;
    if (v100 > 3348380075)
    {
      if (v100 == 4240173202)
        goto LABEL_103;
      v104 = 3348380076;
    }
    else
    {
      if (v100 == 1540760353)
        goto LABEL_103;
      v104 = 2702125347;
    }
    if (v100 != v104)
    {
LABEL_114:

      v11->_productColor = v103;
      CFRelease(v19);

LABEL_115:
      return v3;
    }
LABEL_103:
    if ((HMFEqualObjects(v101, CFSTR("1")) & 1) != 0)
    {
      v103 = 1;
    }
    else if ((HMFEqualObjects(v102, CFSTR("2")) & 1) != 0)
    {
      v103 = 2;
    }
    else if ((HMFEqualObjects(v102, CFSTR("7")) & 1) != 0)
    {
      v103 = 3;
    }
    else if ((HMFEqualObjects(v102, CFSTR("8")) & 1) != 0)
    {
      v103 = 4;
    }
    else if (HMFEqualObjects(v102, CFSTR("9")))
    {
      v103 = 5;
    }
    else
    {
      v103 = 0;
    }
    goto LABEL_114;
  }
  return v3;
}

- (BOOL)shouldFetchProtectedKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  v3 = a3;
  +[HMFProcessInfo processInfo](HMFProcessInfo, "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.MobileGestalt.AllowedProtectedKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "containsObject:", v3);
  return v8;
}

- (BOOL)shouldFetchUserAssignedDeviceName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  +[HMFProcessInfo processInfo](HMFProcessInfo, "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.developer.device-information.user-assigned-device-name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (int64_t)productPlatform
{
  return self->_productPlatform;
}

- (int64_t)productColor
{
  return self->_productColor;
}

- (int64_t)productClass
{
  return self->_productClass;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_notificationToken != (MGNotificationTokenStruct *)-1)
    MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)__HMFMobileGestaltDataSource;
  -[__HMFMobileGestaltDataSource dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFSystemInfoNameDataSourceDelegate)delegate
{
  return (HMFSystemInfoNameDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)model
{
  return self->_model;
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (HMFMACAddress)WiFiInterfaceMACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)supportsBLE
{
  return self->_supportsBLE;
}

- (MGNotificationTokenStruct)notificationToken
{
  return self->_notificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_WiFiInterfaceMACAddress, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
