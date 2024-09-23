@implementation _GCMFiControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___GCMFiControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_0 != -1)
    dispatch_once(&deviceManager_onceToken_0, block);
  return (_GCPhysicalDeviceManager *)(id)deviceManager_deviceManager_0;
}

+ (id)identifier
{
  return CFSTR("MfiControllerProfile");
}

+ (BOOL)match:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  char *v10;
  char *v11;
  const char *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_getAssociatedObject(v3, "MFiControllerCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (v4 = -[_GCMFiControllerCapabilites initWithServiceInfo:]((char *)[_GCMFiControllerCapabilites alloc], v3)) != 0)
  {
    v5 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v4);
    v6 = -[_GCMFiControllerCapabilites isStandardGamepad]((uint64_t)v4);
    v7 = v6;
    if (v5 || v6)
    {
      objc_msgSend(v3, "numberPropertyForKey:", CFSTR("Authenticated"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (-[NSObject BOOLValue](v9, "BOOLValue") & 1) != 0
        || (isDeviceParentAuthenticated((__IOHIDServiceClient *)objc_msgSend(v3, "service")) & 1) != 0)
      {

        objc_setAssociatedObject(v3, "MFiControllerCapabilities", v4, (void *)0x301);
        if (!gc_isInternalBuild())
        {
          v8 = 1;
          goto LABEL_18;
        }
        getGCLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = " ?";
          if (v7)
            v13 = " standard";
          if (v5)
            v14 = " extended";
          else
            v14 = v13;
          objc_msgSend(v3, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 136316162;
          v21 = " authenticated";
          v22 = 2080;
          v23 = v14;
          v24 = 2112;
          v25 = v3;
          v26 = 2112;
          v27 = v15;
          v28 = 2114;
          v29 = v4;
          _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "Matched%s%s MFi game controller %@ '%@' %{public}@", (uint8_t *)&v20, 0x34u);

        }
        v8 = 1;
      }
      else
      {
        if (GCBypassMFiAuthentication())
        {
          objc_msgSend(v3, "stringPropertyForKey:", CFSTR("Product"));
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = v10;
              if (!v10)
              {
                objc_msgSend(v3, "registryID");
                v19 = (char *)objc_claimAutoreleasedReturnValue();
              }
              v20 = 138412290;
              v21 = v19;
              _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "Service MFi authenticated bypassed for: %@", (uint8_t *)&v20, 0xCu);
              if (!v10)

            }
          }

        }
        objc_msgSend(v3, "stringPropertyForKey:", CFSTR("Product"));
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = v11;
            if (!v11)
            {
              objc_msgSend(v3, "registryID");
              v17 = (char *)objc_claimAutoreleasedReturnValue();
            }
            v20 = 138412290;
            v21 = v17;
            _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "Service is NOT MFi authenticated: %@", (uint8_t *)&v20, 0xCu);
            if (!v11)

          }
        }

        v8 = 0;
      }

      goto LABEL_18;
    }
  }
  v8 = 0;
LABEL_18:

  return v8;
}

+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4
{
  objc_msgSend(a4, "setDelegate:", a1);
}

+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4
{
  objc_msgSend(a4, "setDelegate:", a1);
}

+ (BOOL)physicalDeviceUsesACHomeForMenu:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDServiceInfo mfiControllerCapabilities](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (-[_GCMFiControllerCapabilites home]((uint64_t)v4) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v4) & 1) == 0;

  return v5;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  return -1;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  void *v5;
  const void *v6;

  objc_msgSend(a3, "serviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend(v5, "service");

  if (v6)
    GC_IOHIDSetLEDs(v6, a4);
}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("MFi");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v5;
  id v6;
  GCExtendedGamepad *v7;
  uint64_t i;
  _OWORD v10[100];

  v5 = a3;
  v6 = a4;
  memset(v10, 0, 512);
  GCExtendedGamepadInitInfoMake(v10);
  +[_GCMFiControllerProfile populateInitInfo:forLogicalDevice:](_GCMFiControllerProfile, "populateInitInfo:forLogicalDevice:", v10, v5);
  v7 = -[GCExtendedGamepad initWithIdentifier:info:]([GCExtendedGamepad alloc], "initWithIdentifier:info:", v6, v10);
  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v10 + i));

  return v7;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GCDeviceButtonInputDescription *v14;
  void *v15;
  void *v16;
  GCDeviceButtonInputDescription *v17;
  GCDeviceButtonInputDescription *v18;
  void *v19;
  void *v20;
  GCDeviceButtonInputDescription *v21;
  GCDeviceButtonInputDescription *v22;
  void *v23;
  void *v24;
  GCDeviceButtonInputDescription *v25;
  GCDeviceButtonInputDescription *v26;
  void *v27;
  void *v28;
  GCDeviceButtonInputDescription *v29;
  GCDeviceButtonInputDescription *v30;
  void *v31;
  void *v32;
  GCDeviceButtonInputDescription *v33;
  GCDeviceButtonInputDescription *v34;
  void *v35;
  void *v36;
  GCDeviceButtonInputDescription *v37;
  GCDeviceButtonInputDescription *v38;
  void *v39;
  void *v40;
  GCDeviceButtonInputDescription *v41;
  GCDeviceButtonInputDescription *v42;
  void *v43;
  void *v44;
  GCDeviceButtonInputDescription *v45;
  GCDeviceButtonInputDescription *v46;
  void *v47;
  void *v48;
  GCDeviceButtonInputDescription *v49;
  GCDeviceButtonInputDescription *v50;
  void *v51;
  void *v52;
  GCDeviceButtonInputDescription *v53;
  GCDeviceButtonInputDescription *v54;
  void *v55;
  void *v56;
  GCDeviceButtonInputDescription *v57;
  GCDeviceButtonInputDescription *v58;
  void *v59;
  void *v60;
  GCDeviceButtonInputDescription *v61;
  GCDeviceButtonInputDescription *v62;
  void *v63;
  void *v64;
  GCDeviceButtonInputDescription *v65;
  GCDeviceButtonInputDescription *v66;
  void *v67;
  void *v68;
  GCDeviceButtonInputDescription *v69;
  GCDeviceButtonInputDescription *v70;
  void *v71;
  void *v72;
  GCDeviceButtonInputDescription *v73;
  GCDeviceButtonInputDescription *v74;
  void *v75;
  void *v76;
  GCDeviceButtonInputDescription *v77;
  GCDeviceButtonInputDescription *v78;
  void *v79;
  void *v80;
  GCDeviceButtonInputDescription *v81;
  GCDeviceButtonInputDescription *v82;
  void *v83;
  void *v84;
  GCDeviceButtonInputDescription *v85;
  GCDeviceButtonInputDescription *v86;
  void *v87;
  void *v88;
  GCDeviceButtonInputDescription *v89;
  GCDeviceButtonInputDescription *v90;
  void *v91;
  void *v92;
  GCDeviceButtonInputDescription *v93;
  GCDeviceDirectionPadDescription *v94;
  void *v95;
  void *v96;
  GCDeviceDirectionPadDescription *v97;
  GCDeviceDirectionPadDescription *v98;
  void *v99;
  void *v100;
  GCDeviceDirectionPadDescription *v101;
  GCDeviceDirectionPadDescription *v102;
  void *v103;
  void *v104;
  GCDeviceDirectionPadDescription *v105;
  _BOOL4 v106;
  __objc2_class **v107;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "underlyingDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDServiceInfo mfiControllerCapabilities](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v11))
  {
    v12 = 0;
    goto LABEL_54;
  }
  v13 = (void *)objc_opt_new();
  if ((-[_GCMFiControllerCapabilites a]((uint64_t)v11) & 1) != 0)
  {
    v14 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A330], "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v14, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button A"), v15, 2, v16, CFSTR("a.circle"), (-[_GCMFiControllerCapabilites a]((uint64_t)v11) >> 8) & 1, 4);
    objc_msgSend(v13, "addObject:", v17);

  }
  if ((-[_GCMFiControllerCapabilites b]((uint64_t)v11) & 1) != 0)
  {
    v18 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A338], "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v18, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button B"), v19, 2, v20, CFSTR("b.circle"), (-[_GCMFiControllerCapabilites b]((uint64_t)v11) >> 8) & 1, 5);
    objc_msgSend(v13, "addObject:", v21);

  }
  if ((-[_GCMFiControllerCapabilites x]((uint64_t)v11) & 1) != 0)
  {
    v22 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A3A0], "key");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v22, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button X"), v23, 2, v24, CFSTR("x.circle"), (-[_GCMFiControllerCapabilites x]((uint64_t)v11) >> 8) & 1, 6);
    objc_msgSend(v13, "addObject:", v25);

  }
  if ((-[_GCMFiControllerCapabilites y]((uint64_t)v11) & 1) != 0)
  {
    v26 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A3A8], "key");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v26, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Y"), v27, 2, v28, CFSTR("y.circle"), (-[_GCMFiControllerCapabilites y]((uint64_t)v11) >> 8) & 1, 7);
    objc_msgSend(v13, "addObject:", v29);

  }
  if ((-[_GCMFiControllerCapabilites l1]((uint64_t)v11) & 1) != 0)
  {
    v30 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A478], "key");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v30, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Shoulder"), v31, 2, v32, CFSTR("l1.rectangle.roundedbottom"), (-[_GCMFiControllerCapabilites l1]((uint64_t)v11) >> 8) & 1, 8);
    objc_msgSend(v13, "addObject:", v33);

  }
  if ((-[_GCMFiControllerCapabilites r1]((uint64_t)v11) & 1) != 0)
  {
    v34 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A510], "key");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v34, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Shoulder"), v35, 2, v36, CFSTR("r1.rectangle.roundedbottom"), (-[_GCMFiControllerCapabilites r1]((uint64_t)v11) >> 8) & 1, 9);
    objc_msgSend(v13, "addObject:", v37);

  }
  if ((-[_GCMFiControllerCapabilites l2]((uint64_t)v11) & 1) != 0)
  {
    v38 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A488], "key");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v38, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Trigger"), v39, 2, v40, CFSTR("l2.rectangle.roundedtop"), (-[_GCMFiControllerCapabilites l2]((uint64_t)v11) >> 8) & 1, 18);
    objc_msgSend(v13, "addObject:", v41);

  }
  if ((-[_GCMFiControllerCapabilites r2]((uint64_t)v11) & 1) != 0)
  {
    v42 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A520], "key");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v42, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Trigger"), v43, 2, v44, CFSTR("r2.rectangle.roundedtop"), (-[_GCMFiControllerCapabilites r2]((uint64_t)v11) >> 8) & 1, 19);
    objc_msgSend(v13, "addObject:", v45);

  }
  if ((-[_GCMFiControllerCapabilites l3]((uint64_t)v11) & 1) != 0)
  {
    v46 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A350], "key");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v46, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Thumbstick Button"), v47, 2, v48, CFSTR("l.joystick.press.down"), (-[_GCMFiControllerCapabilites l3]((uint64_t)v11) >> 8) & 1, 20);
    objc_msgSend(v13, "addObject:", v49);

  }
  if ((-[_GCMFiControllerCapabilites r3]((uint64_t)v11) & 1) != 0)
  {
    v50 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A390], "key");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v50, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Thumbstick Button"), v51, 2, v52, CFSTR("r.joystick.press.down"), (-[_GCMFiControllerCapabilites r3]((uint64_t)v11) >> 8) & 1, 21);
    objc_msgSend(v13, "addObject:", v53);

  }
  if ((-[_GCMFiControllerCapabilites l4]((uint64_t)v11) & 1) != 0)
  {
    v54 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A348], "key");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v54, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Bumper"), v55, 2, v56, CFSTR("l4.button.horizontal"), (-[_GCMFiControllerCapabilites l4]((uint64_t)v11) >> 8) & 1, 41);
    objc_msgSend(v13, "addObject:", v57);

  }
  if ((-[_GCMFiControllerCapabilites r4]((uint64_t)v11) & 1) != 0)
  {
    v58 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A388], "key");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v58, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Bumper"), v59, 2, v60, CFSTR("r4.button.horizontal"), (-[_GCMFiControllerCapabilites r4]((uint64_t)v11) >> 8) & 1, 42);
    objc_msgSend(v13, "addObject:", v61);

  }
  if ((-[_GCMFiControllerCapabilites m1]((uint64_t)v11) & 1) != 0)
  {
    v62 = [GCDeviceButtonInputDescription alloc];
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 1"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A358], "key");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v62, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Back Right Button 0"), v63, 2, v64, CFSTR("m1.button.horizontal"), (-[_GCMFiControllerCapabilites m1]((uint64_t)v11) >> 8) & 1, 45);
    objc_msgSend(v13, "addObject:", v65);

  }
  if ((-[_GCMFiControllerCapabilites m2]((uint64_t)v11) & 1) != 0)
  {
    v66 = [GCDeviceButtonInputDescription alloc];
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 3"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A360], "key");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v66, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Back Left Button 0"), v67, 2, v68, CFSTR("m2.button.horizontal"), (-[_GCMFiControllerCapabilites m2]((uint64_t)v11) >> 8) & 1, 43);
    objc_msgSend(v13, "addObject:", v69);

  }
  if ((-[_GCMFiControllerCapabilites m3]((uint64_t)v11) & 1) != 0)
  {
    v70 = [GCDeviceButtonInputDescription alloc];
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 2"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A368], "key");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v70, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Back Right Button 1"), v71, 2, v72, CFSTR("m3.button.horizontal"), (-[_GCMFiControllerCapabilites m3]((uint64_t)v11) >> 8) & 1, 46);
    objc_msgSend(v13, "addObject:", v73);

  }
  if ((-[_GCMFiControllerCapabilites m4]((uint64_t)v11) & 1) != 0)
  {
    v74 = [GCDeviceButtonInputDescription alloc];
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 4"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A370], "key");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v74, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Back Left Button 1"), v75, 2, v76, CFSTR("m4.button.horizontal"), (-[_GCMFiControllerCapabilites m4]((uint64_t)v11) >> 8) & 1, 44);
    objc_msgSend(v13, "addObject:", v77);

  }
  if ((-[_GCMFiControllerCapabilites home]((uint64_t)v11) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v11) & 1) != 0)
  {
    v78 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A340], "key");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v78, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Home"), v79, 49152, v80, CFSTR("house.circle"), (-[_GCMFiControllerCapabilites home]((uint64_t)v11) >> 8) & 1, 22);
    objc_msgSend(v13, "addObject:", v81);

  }
  else if ((-[_GCMFiControllerCapabilites home]((uint64_t)v11) & 1) == 0)
  {
    goto LABEL_41;
  }
  v82 = [GCDeviceButtonInputDescription alloc];
  +[NSSet set](&off_254DEBEC0, "set");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BE3A378], "key");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v82, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Menu"), v83, 0x4000, v84, CFSTR("line.horizontal.3.circle"), (-[_GCMFiControllerCapabilites menu]((uint64_t)v11) >> 8) & 1, 23);
  objc_msgSend(v13, "addObject:", v85);

LABEL_41:
  if ((-[_GCMFiControllerCapabilites options]((uint64_t)v11) & 1) != 0)
  {
    v86 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A380], "key");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v86, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Options"), v87, 49152, v88, CFSTR("ellipsis.circle"), (-[_GCMFiControllerCapabilites options]((uint64_t)v11) >> 8) & 1, 24);
    objc_msgSend(v13, "addObject:", v89);

  }
  if ((-[_GCMFiControllerCapabilites record]((uint64_t)v11) & 1) != 0)
  {
    v90 = [GCDeviceButtonInputDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A398], "key");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v90, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Share"), v91, 49152, v92, CFSTR("square.and.arrow.up"), (-[_GCMFiControllerCapabilites record]((uint64_t)v11) >> 8) & 1, 40);
    objc_msgSend(v13, "addObject:", v93);

  }
  if ((-[_GCMFiControllerCapabilites dpad]((uint64_t)v11) & 1) != 0)
  {
    v94 = [GCDeviceDirectionPadDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A3B0], "key");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v94, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Direction Pad"), v95, 2, v96, CFSTR("dpad"), (-[_GCMFiControllerCapabilites dpad]((uint64_t)v11) >> 8) & 1, 0, 1, 2, 3);
    objc_msgSend(v13, "addObject:", v97);

  }
  if ((-[_GCMFiControllerCapabilites leftThumbstick]((uint64_t)v11) & 1) != 0)
  {
    v98 = [GCDeviceDirectionPadDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A480], "key");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v98, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Left Thumbstick"), v99, 2, v100, CFSTR("l.joystick"), 0, 10, 11, 12, 13);
    objc_msgSend(v13, "addObject:", v101);

  }
  if ((-[_GCMFiControllerCapabilites rightThumbstick]((uint64_t)v11) & 1) != 0)
  {
    v102 = [GCDeviceDirectionPadDescription alloc];
    +[NSSet set](&off_254DEBEC0, "set");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BE3A518], "key");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v102, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Right Thumbstick"), v103, 2, v104, CFSTR("r.joystick"), 0, 14, 15, 16, 17);
    objc_msgSend(v13, "addObject:", v105);

  }
  v106 = -[_GCMFiControllerCapabilites isExtendedGamepad]((uint64_t)v11);
  v107 = &classRef__GCDeviceExtendedGamepadComponentDescription;
  if (!v106)
    v107 = &classRef__GCDeviceGamepadComponentDescription;
  v12 = (void *)objc_msgSend(objc_alloc(*v107), "initWithIdentifier:elements:bindings:", v7, v13, v8);

LABEL_54:
  return v12;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  id v7;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  _GCControllerInputComponentDescription *v152;
  id v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  _QWORD v172[3];

  v172[1] = *MEMORY[0x24BDAC8D0];
  v158 = a5;
  v7 = a4;
  objc_msgSend(a3, "underlyingDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDServiceInfo mfiControllerCapabilities](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  if ((-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 1) != 0
    && (-[_GCMFiControllerCapabilites menu]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAliases:", v15);

    objc_msgSend(v12, "setLocalizedName:", *MEMORY[0x24BE3A340]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSymbol:", v16);

    objc_msgSend(v12, "setAnalog:", (-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v12, "setEventPressedValueField:", 22);
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.menu"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAliases:", v18);

    objc_msgSend(v17, "setLocalizedName:", *MEMORY[0x24BE3A378]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSymbol:", v19);

    objc_msgSend(v17, "setAnalog:", (-[_GCMFiControllerCapabilites menu]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v17, "setEventPressedValueField:", 23);
    objc_msgSend(v11, "addObject:", v17);
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    if ((-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 1) == 0)
      goto LABEL_7;
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.menu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAliases:", v13);

    objc_msgSend(v12, "setLocalizedName:", *MEMORY[0x24BE3A378]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSymbol:", v14);

    objc_msgSend(v12, "setAnalog:", (-[_GCMFiControllerCapabilites home]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v12, "setEventPressedValueField:", 22);
    objc_msgSend(v11, "addObject:", v12);
  }

LABEL_7:
  if ((-[_GCMFiControllerCapabilites options]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.options"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAliases:", v21);

    objc_msgSend(v20, "setLocalizedName:", *MEMORY[0x24BE3A380]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("ellipsis.circle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSymbol:", v22);

    objc_msgSend(v20, "setAnalog:", (-[_GCMFiControllerCapabilites options]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v20, "setEventPressedValueField:", 24);
    objc_msgSend(v11, "addObject:", v20);

  }
  if ((-[_GCMFiControllerCapabilites record]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.share"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAliases:", v24);

    objc_msgSend(v23, "setLocalizedName:", *MEMORY[0x24BE3A398]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("square.and.arrow.up"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSymbol:", v25);

    objc_msgSend(v23, "setEventPressedValueField:", 40);
    objc_msgSend(v11, "addObject:", v23);

  }
  if ((-[_GCMFiControllerCapabilites a]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAliases:", v27);

    objc_msgSend(v26, "setLocalizedName:", *MEMORY[0x24BE3A330]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSymbol:", v28);

    objc_msgSend(v26, "setAnalog:", (-[_GCMFiControllerCapabilites a]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v26, "setEventPressedValueField:", 4);
    objc_msgSend(v11, "addObject:", v26);

  }
  if ((-[_GCMFiControllerCapabilites b]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAliases:", v30);

    objc_msgSend(v29, "setLocalizedName:", *MEMORY[0x24BE3A338]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSymbol:", v31);

    objc_msgSend(v29, "setAnalog:", (-[_GCMFiControllerCapabilites b]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v29, "setEventPressedValueField:", 5);
    objc_msgSend(v11, "addObject:", v29);

  }
  if ((-[_GCMFiControllerCapabilites x]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAliases:", v33);

    objc_msgSend(v32, "setLocalizedName:", *MEMORY[0x24BE3A3A0]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSymbol:", v34);

    objc_msgSend(v32, "setAnalog:", (-[_GCMFiControllerCapabilites x]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v32, "setEventPressedValueField:", 6);
    objc_msgSend(v11, "addObject:", v32);

  }
  if ((-[_GCMFiControllerCapabilites y]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAliases:", v36);

    objc_msgSend(v35, "setLocalizedName:", *MEMORY[0x24BE3A3A8]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSymbol:", v37);

    objc_msgSend(v35, "setAnalog:", (-[_GCMFiControllerCapabilites y]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v35, "setEventPressedValueField:", 7);
    objc_msgSend(v11, "addObject:", v35);

  }
  if ((-[_GCMFiControllerCapabilites l1]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.shoulder"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAliases:", v39);

    objc_msgSend(v38, "setLocalizedName:", *MEMORY[0x24BE3A478]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSymbol:", v40);

    objc_msgSend(v38, "setAnalog:", (-[_GCMFiControllerCapabilites l1]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v38, "setEventPressedValueField:", 8);
    objc_msgSend(v11, "addObject:", v38);

  }
  if ((-[_GCMFiControllerCapabilites r1]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.shoulder"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAliases:", v42);

    objc_msgSend(v41, "setLocalizedName:", *MEMORY[0x24BE3A510]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setSymbol:", v43);

    objc_msgSend(v41, "setAnalog:", (-[_GCMFiControllerCapabilites r1]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v41, "setEventPressedValueField:", 9);
    objc_msgSend(v11, "addObject:", v41);

  }
  if ((-[_GCMFiControllerCapabilites l2]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.trigger"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAliases:", v45);

    objc_msgSend(v44, "setLocalizedName:", *MEMORY[0x24BE3A488]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l2.rectangle.roundedtop"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setSymbol:", v46);

    objc_msgSend(v44, "setAnalog:", (-[_GCMFiControllerCapabilites l2]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v44, "setEventPressedValueField:", 18);
    objc_msgSend(v11, "addObject:", v44);

  }
  if ((-[_GCMFiControllerCapabilites r2]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.trigger"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAliases:", v48);

    objc_msgSend(v47, "setLocalizedName:", *MEMORY[0x24BE3A520]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r2.rectangle.roundedtop"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setSymbol:", v49);

    objc_msgSend(v47, "setAnalog:", (-[_GCMFiControllerCapabilites r2]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v47, "setEventPressedValueField:", 19);
    objc_msgSend(v11, "addObject:", v47);

  }
  if ((-[_GCMFiControllerCapabilites dpad]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAliases:", v51);

    objc_msgSend(v50, "setLocalizedName:", *MEMORY[0x24BE3A3B0]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSymbol:", v52);

    objc_msgSend(v50, "setAnalog:", (-[_GCMFiControllerCapabilites dpad]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v50, "setEventUpValueField:", 0);
    objc_msgSend(v50, "setEventDownValueField:", 1);
    objc_msgSend(v50, "setEventLeftValueField:", 2);
    objc_msgSend(v50, "setEventRightValueField:", 3);
    objc_msgSend(v11, "addObject:", v50);

  }
  if ((-[_GCMFiControllerCapabilites leftThumbstick]((uint64_t)v10) & 1) != 0)
  {
    if ((-[_GCMFiControllerCapabilites l3]((uint64_t)v10) & 1) != 0)
    {
      +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.left"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
      v156 = v8;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAliases:", v56);

      objc_msgSend(v53, "setLocalizedName:", *MEMORY[0x24BE3A480]);
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setSymbol:", v57);

      objc_msgSend(v53, "setAnalog:", 1);
      objc_msgSend(v53, "setEventUpValueField:", 10);
      objc_msgSend(v53, "setEventDownValueField:", 11);
      objc_msgSend(v53, "setEventLeftValueField:", 12);
      objc_msgSend(v53, "setEventRightValueField:", 13);
      objc_msgSend(v53, "setEventPressedValueField:", 20);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v154 = v7;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v58, v59, v60, 10);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v172[0] = v61;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v172, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setXSources:", v62);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v63, v64, v65, 5);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = v66;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v171, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setYSources:", v67);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v68, v69, v70, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v71;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v170, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setUpSources:", v72);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v73, v74, v75, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = v76;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v169, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setRightSources:", v77);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v78, v79, v80, 4);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = v81;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v168, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setDownSources:", v82);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "symbol");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v83, v84, v85, 8);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v86;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v167, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setLeftSources:", v87);

      v8 = v156;
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = *MEMORY[0x24BE3A350];
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick.press.down"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = v91;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v166, 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setPressedSources:", v92);

      v7 = v154;
    }
    else
    {
      +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("stick.left"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAliases:", v54);

      objc_msgSend(v53, "setLocalizedName:", *MEMORY[0x24BE3A480]);
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setSymbol:", v55);

      objc_msgSend(v53, "setAnalog:", 1);
      objc_msgSend(v53, "setEventUpValueField:", 10);
      objc_msgSend(v53, "setEventDownValueField:", 11);
      objc_msgSend(v53, "setEventLeftValueField:", 12);
      objc_msgSend(v53, "setEventRightValueField:", 13);
    }
    objc_msgSend(v11, "addObject:", v53);

  }
  if ((-[_GCMFiControllerCapabilites rightThumbstick]((uint64_t)v10) & 1) != 0)
  {
    if ((-[_GCMFiControllerCapabilites r3]((uint64_t)v10) & 1) != 0)
    {
      +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.right"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setAliases:", v96);

      objc_msgSend(v93, "setLocalizedName:", *MEMORY[0x24BE3A518]);
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setSymbol:", v97);

      objc_msgSend(v93, "setAnalog:", 1);
      objc_msgSend(v93, "setEventUpValueField:", 14);
      objc_msgSend(v93, "setEventDownValueField:", 15);
      objc_msgSend(v93, "setEventLeftValueField:", 16);
      objc_msgSend(v93, "setEventRightValueField:", 17);
      objc_msgSend(v93, "setEventPressedValueField:", 21);
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v157 = v8;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v155 = v7;
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v98, v99, v100, 10);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v101;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v165, 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setXSources:", v102);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v103, v104, v105, 5);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = v106;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v164, 1);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setYSources:", v107);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v108, v109, v110, 1);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v111;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v163, 1);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setUpSources:", v112);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v113, v114, v115, 2);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = v116;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v162, 1);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setRightSources:", v117);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v118, v119, v120, 4);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = v121;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v161, 1);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setDownSources:", v122);

      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "symbol");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v123, v124, v125, 8);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = v126;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v160, 1);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setLeftSources:", v127);

      v8 = v157;
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = *MEMORY[0x24BE3A390];
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick.press.down"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v131;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v159, 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setPressedSources:", v132);

      v7 = v155;
    }
    else
    {
      +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("stick.right"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setAliases:", v94);

      objc_msgSend(v93, "setLocalizedName:", *MEMORY[0x24BE3A518]);
      unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setSymbol:", v95);

      objc_msgSend(v93, "setAnalog:", 1);
      objc_msgSend(v93, "setEventUpValueField:", 14);
      objc_msgSend(v93, "setEventDownValueField:", 15);
      objc_msgSend(v93, "setEventLeftValueField:", 16);
      objc_msgSend(v93, "setEventRightValueField:", 17);
    }
    objc_msgSend(v11, "addObject:", v93);

  }
  if ((-[_GCMFiControllerCapabilites l4]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.bumper"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Bumper"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setAliases:", v134);

    objc_msgSend(v133, "setLocalizedName:", *MEMORY[0x24BE3A348]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l4.button.horizontal"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setSymbol:", v135);

    objc_msgSend(v133, "setAnalog:", (-[_GCMFiControllerCapabilites l4]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v133, "setEventPressedValueField:", 41);
    objc_msgSend(v11, "addObject:", v133);

  }
  if ((-[_GCMFiControllerCapabilites r4]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.bumper"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Bumper"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setAliases:", v137);

    objc_msgSend(v136, "setLocalizedName:", *MEMORY[0x24BE3A388]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r4.button.horizontal"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setSymbol:", v138);

    objc_msgSend(v136, "setAnalog:", (-[_GCMFiControllerCapabilites r4]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v136, "setEventPressedValueField:", 42);
    objc_msgSend(v11, "addObject:", v136);

  }
  if ((-[_GCMFiControllerCapabilites m1]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.bottom.primary"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Back Right Button 0"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setAliases:", v140);

    objc_msgSend(v139, "setLocalizedName:", *MEMORY[0x24BE3A358]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("m1.button.horizontal"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setSymbol:", v141);

    objc_msgSend(v139, "setAnalog:", (-[_GCMFiControllerCapabilites m1]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v139, "setEventPressedValueField:", 45);
    objc_msgSend(v11, "addObject:", v139);

  }
  if ((-[_GCMFiControllerCapabilites m2]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.bottom.primary"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Back Left Button 0"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setAliases:", v143);

    objc_msgSend(v142, "setLocalizedName:", *MEMORY[0x24BE3A360]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("m2.button.horizontal"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setSymbol:", v144);

    objc_msgSend(v142, "setAnalog:", (-[_GCMFiControllerCapabilites m2]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v142, "setEventPressedValueField:", 43);
    objc_msgSend(v11, "addObject:", v142);

  }
  if ((-[_GCMFiControllerCapabilites m3]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.bottom.secondary"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Back Right Button 1"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setAliases:", v146);

    objc_msgSend(v145, "setLocalizedName:", *MEMORY[0x24BE3A368]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("m3.button.horizontal"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setSymbol:", v147);

    objc_msgSend(v145, "setAnalog:", (-[_GCMFiControllerCapabilites m3]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v145, "setEventPressedValueField:", 46);
    objc_msgSend(v11, "addObject:", v145);

  }
  if ((-[_GCMFiControllerCapabilites m4]((uint64_t)v10) & 1) != 0)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.bottom.secondary"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Back Left Button 1"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setAliases:", v149);

    objc_msgSend(v148, "setLocalizedName:", *MEMORY[0x24BE3A370]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("m4.button.horizontal"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setSymbol:", v150);

    objc_msgSend(v148, "setAnalog:", (-[_GCMFiControllerCapabilites m4]((uint64_t)v10) & 0x100) == 0);
    objc_msgSend(v148, "setEventPressedValueField:", 44);
    objc_msgSend(v11, "addObject:", v148);

  }
  v151 = (void *)objc_opt_new();
  objc_msgSend(v151, "setElements:", v11);
  v152 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v7, v151, v158);

  return v152;
}

+ (void)populateInitInfo:(id *)a3 forLogicalDevice:(id)a4
{
  void *v5;
  id v6;

  a3->var0[5].var2 = 0;
  a3->var0[6].var2 = 0;
  a3->var0[9].var2 = 0;
  a3->var0[10].var2 = 0;
  a3->var0[11].var1 = 0;
  a3->var0[12].var1 = 0;
  a3->var0[13].var1 = 0;
  a3->var0[14].var1 = 0;
  a3->var0[15].var1 = 0;
  a3->var0[16].var1 = 0;
  a3->var0[17].var1 = 0;
  a3->var0[18].var1 = 0;
  a3->var0[19].var1 = 0;
  a3->var0[20].var1 = 0;
  a3->var0[21].var1 = 0;
  a3->var0[0].var2 = 1;
  objc_msgSend(a4, "underlyingDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GCMFiControllerProfile determineCapabilitiesWithServiceInfo:initInfo:](_GCMFiControllerProfile, "determineCapabilitiesWithServiceInfo:initInfo:", v5, a3);

}

+ (void)determineCapabilitiesWithServiceInfo:(id)a3 initInfo:(id *)a4
{
  __IOHIDServiceClient *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  _BOOL8 v17;
  BOOL v18;
  BOOL v19;
  $566C818D59AC40600FE51A1241C70774 *v20;
  const __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  uint64_t v31;
  BOOL v32;
  __IOHIDServiceClient *v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = (__IOHIDServiceClient *)objc_msgSend(a3, "service");
  v6 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(v5, CFSTR("GameControllerPointer"));
  if (v6)
  {
    v33 = v5;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)CFDictionaryGetValue(v6, CFSTR("Elements"));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UsagePage"), v33);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intValue");

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Usage"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          v17 = __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(v16, v11);
          v18 = v17;
          if (v13 == 9)
          {
            v20 = &a4->var0[__73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke_2(v17, v15)];
            v20->var2 = v18;
            v20->var1 = 1;
          }
          else if (v13 == 1 && (v15 & 0xFFFFFFFC) == 0x90)
          {
            v19 = a4->var0[0].var2 && v17;
            a4->var0[0].var2 = v19;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v8);
    }

    v5 = v33;
  }
  v21 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(v5, CFSTR("Keyboard"));
  if (v21)
  {
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obja = (id)CFDictionaryGetValue(v21, CFSTR("Elements"));
    v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(obja);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("UsagePage"), v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "intValue");

          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Usage"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "intValue");

          v32 = __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(v31, v26);
          if (v28 == 12)
          {
            if (v30 <= 515)
            {
              if (v30 == 101)
              {
                a4->var2 = 1;
              }
              else if (v30 == 178)
              {
                a4->var1 = 1;
              }
            }
            else
            {
              switch(v30)
              {
                case 516:
                  a4->var0[14].var2 = v32;
                  a4->var0[14].var1 = 1;
                  break;
                case 547:
                  a4->var0[13].var2 = v32;
                  a4->var0[13].var1 = 1;
                  break;
                case 521:
                  a4->var0[15].var2 = v32;
                  a4->var0[15].var1 = 1;
                  break;
              }
            }
          }
        }
        v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v23);
    }

  }
}

@end
