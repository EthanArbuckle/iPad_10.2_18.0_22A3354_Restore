@implementation IOHIDUPSClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  int *v9;
  int v10;
  CFUUIDRef v12;
  CFUUIDRef v13;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v6, v8)))
  {
    v9 = &OBJC_IVAR___IOHIDPlugin__plugin;
  }
  else
  {
    v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x63u, 0xF8u, 0xBFu, 0xC4u, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x88u, 0xB4u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
    if (!CFEqual(v6, v12))
    {
      v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xE6u, 0xEu, 7u, 0x99u, 0x9Au, 0xA6u, 0x49u, 0xDFu, 0xB5u, 0x5Bu, 0xA5u, 0xC9u, 0x4Bu, 0xA0u, 0x7Au, 0x4Au);
      if (!CFEqual(v6, v13))
      {
        v10 = -2147483644;
        if (!v6)
          return v10;
        goto LABEL_5;
      }
    }
    v9 = &OBJC_IVAR___IOHIDUPSClass__ups;
  }
  *a4 = (char *)self + *v9;
  CFRetain(self);
  v10 = 0;
  if (v6)
LABEL_5:
    CFRelease(v6);
  return v10;
}

- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5
{
  if (IOObjectConformsTo(a4, "IOHIDDevice"))
    return 0;
  else
    return -536870201;
}

- (void)parseProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  NSObject *v80;
  NSMutableDictionary *properties;
  int v82;
  NSMutableDictionary *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("Transport"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v9, (uint64_t)v8, (uint64_t)CFSTR("Transport Type"), v10);

  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("Product"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v15, (uint64_t)v14, (uint64_t)CFSTR("Name"), v16);

  objc_msgSend_objectForKeyedSubscript_(self->_properties, v17, (uint64_t)CFSTR("Name"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v21, (uint64_t)CFSTR("Manufacturer"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v25, (uint64_t)v24, (uint64_t)CFSTR("Name"), v26);

  }
  objc_msgSend_objectForKeyedSubscript_(v4, v21, (uint64_t)CFSTR("VendorID"), v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v28, (uint64_t)v27, (uint64_t)CFSTR("Vendor ID"), v29);

  objc_msgSend_objectForKeyedSubscript_(v4, v30, (uint64_t)CFSTR("ProductID"), v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v34, (uint64_t)v33, (uint64_t)CFSTR("Product ID"), v35);

  objc_msgSend_objectForKeyedSubscript_(v4, v36, (uint64_t)CFSTR("SerialNumber"), v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v40, (uint64_t)v39, (uint64_t)CFSTR("Accessory Identifier"), v41);

  objc_msgSend_objectForKey_(v4, v42, (uint64_t)CFSTR("ModelNumber"), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_objectForKey_(v4, v46, (uint64_t)CFSTR("ModelNumber"), v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v50, (uint64_t)v49, (uint64_t)CFSTR("Model Number"), v51);

  }
  objc_msgSend_objectForKeyedSubscript_(v4, v46, (uint64_t)CFSTR("PrimaryUsagePage"), v47, v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_intValue(v52, v53, v54, v55, v56);

  objc_msgSend_objectForKeyedSubscript_(v4, v58, (uint64_t)CFSTR("PrimaryUsage"), v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_intValue(v61, v62, v63, v64, v65);

  objc_msgSend_objectForKeyedSubscript_(v4, v67, (uint64_t)CFSTR("Accessory Category"), v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v71, (uint64_t)CFSTR("Accessory Category"), v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v75, (uint64_t)v74, (uint64_t)CFSTR("Accessory Category"), v76);

  }
  else if (v57 == 1 && v66 == 6)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v71, (uint64_t)CFSTR("Keyboard"), (uint64_t)CFSTR("Accessory Category"), v73);
  }
  else if (v57 == 1 && v66 == 2)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v71, (uint64_t)CFSTR("Mouse"), (uint64_t)CFSTR("Accessory Category"), v73);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v71, (uint64_t)CFSTR("GameControllerType"), v72, v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
      objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v78, (uint64_t)CFSTR("Game Controller"), (uint64_t)CFSTR("Accessory Category"), v79);
  }
  _IOHIDLogCategory();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    properties = self->_properties;
    v82 = 138412290;
    v83 = properties;
    _os_log_impl(&dword_2310D3000, v80, OS_LOG_TYPE_DEFAULT, "properties: %@", (uint8_t *)&v82, 0xCu);
  }

}

- (void)parseElements:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t i;
  uint64_t v10;
  HIDLibElement *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  const __CFString *v38;
  int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  $FBF13BA38225885DFE2D10A75E0B4970 *p_elements;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  IOHIDUPSClass *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSMutableSet *capabilities;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  NSObject *v113;
  id v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  NSTimer *timer;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  NSMutableSet *v134;
  __int128 v135;
  id obj;
  int v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  _QWORD v142[5];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint8_t buf[4];
  _BYTE v152[10];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x24BDAC8D0];
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  obj = a3;
  v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v147, (uint64_t)v154, 16);
  if (v139)
  {
    v138 = *(_QWORD *)v148;
    *(_QWORD *)&v8 = 67109376;
    v135 = v8;
    do
    {
      for (i = 0; i != v139; ++i)
      {
        if (*(_QWORD *)v148 != v138)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i);
        v11 = [HIDLibElement alloc];
        v15 = (void *)objc_msgSend_initWithElementRef_(v11, v12, v10, v13, v14);
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v21 = objc_msgSend_type(v15, v17, v18, v19, v20);
        v26 = objc_msgSend_type(v15, v22, v23, v24, v25);
        v31 = objc_msgSend_usagePage(v15, v27, v28, v29, v30);
        v141 = i;
        if (v31 > 65279)
        {
          if (v31 == 65280)
          {
            if (objc_msgSend_usage(v15, v32, v33, v34, v35) == 33)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Device Color"), v34, v35, v135);
LABEL_107:
              objc_msgSend_setIsConstant_(v15, v40, 1, v41, v42);
            }
          }
          else if (v31 == 65293)
          {
            v37 = objc_msgSend_usage(v15, v32, v33, v34, v35);
            if (v37 <= 4095)
            {
              switch(v37)
              {
                case 1:
                  v38 = CFSTR("AppleRawCurrentCapacity");
                  goto LABEL_113;
                case 2:
                  v38 = CFSTR("Nominal Capacity");
                  goto LABEL_113;
                case 3:
                  v38 = CFSTR("Battery Case Cumulative Current");
                  goto LABEL_113;
                case 4:
                  v38 = CFSTR("FamilyCode");
                  goto LABEL_113;
                case 5:
                  if (v26 == 129)
                    v38 = CFSTR("Set Address");
                  else
                    v38 = CFSTR("Address");
                  goto LABEL_113;
                case 6:
                  v38 = CFSTR("Battery Case Charging Voltage");
                  goto LABEL_113;
                case 7:
                  if (v26 == 129)
                    v38 = CFSTR("Send Average Charging Current");
                  else
                    v38 = CFSTR("Battery Case Average Charging Current");
                  goto LABEL_113;
                case 11:
                  v38 = CFSTR("Incoming Voltage");
                  goto LABEL_113;
                case 12:
                  v38 = CFSTR("Incoming Current");
                  goto LABEL_113;
                case 13:
                  v38 = CFSTR("Cell 0 Voltage");
                  goto LABEL_113;
                case 14:
                  v38 = CFSTR("Cell 1 Voltage");
                  goto LABEL_113;
                case 16:
                  v43 = CFSTR("Lifetime Cell0 Max Voltage");
                  goto LABEL_106;
                case 17:
                  v43 = CFSTR("Lifetime Cell1 Max Voltage");
                  goto LABEL_106;
                case 18:
                  v43 = CFSTR("Lifetime Cell0 Min Voltage");
                  goto LABEL_106;
                case 19:
                  v43 = CFSTR("Lifetime Cell1 Min Voltage");
                  goto LABEL_106;
                case 20:
                  v43 = CFSTR("Lifetime Max Charge Current");
                  goto LABEL_106;
                case 21:
                  v43 = CFSTR("Lifetime Max Discharge Current");
                  goto LABEL_106;
                case 22:
                  v43 = CFSTR("Lifetime Max Temperature");
                  goto LABEL_106;
                case 23:
                  v43 = CFSTR("Lifetime Min Temperature");
                  goto LABEL_106;
                case 24:
                  v43 = CFSTR("Lifetime Firmware Runtime");
                  goto LABEL_106;
                case 25:
                  v43 = CFSTR("Lifetime Time Below Low Temperature");
                  goto LABEL_106;
                case 26:
                  v43 = CFSTR("Lifetime Time Above Low Temperature");
                  goto LABEL_106;
                case 27:
                  v43 = CFSTR("Lifetime Time Above Mid Temperature");
                  goto LABEL_106;
                case 28:
                  v43 = CFSTR("Lifetime Time Above High Temperature");
                  goto LABEL_106;
                case 29:
                  v43 = CFSTR("Kiosk Mode Count");
                  goto LABEL_106;
                case 30:
                  v43 = CFSTR("Attach Count Device Type 0");
                  goto LABEL_106;
                case 31:
                  v43 = CFSTR("Attach Count Device Type 1");
                  goto LABEL_106;
                case 32:
                  v43 = CFSTR("Attach Count AirPods Case");
                  goto LABEL_106;
                case 33:
                  v43 = CFSTR("Attach Count Other");
                  goto LABEL_106;
                case 34:
                  v43 = CFSTR("Attach Count Less Than 5W Adapter");
                  goto LABEL_106;
                case 35:
                  v43 = CFSTR("Attach Count 5W Adapter");
                  goto LABEL_106;
                case 36:
                  v43 = CFSTR("Attach Count 7.5W Adapter");
                  goto LABEL_106;
                case 37:
                  v43 = CFSTR("Attach Count 10.5W Adapter");
                  goto LABEL_106;
                case 38:
                  v43 = CFSTR("Attach Count 12W Adapter");
                  goto LABEL_106;
                case 39:
                  v43 = CFSTR("Attach Count 15W Adapter");
                  goto LABEL_106;
                case 40:
                  v43 = CFSTR("Attach Count 18 - 20W Adapter");
                  goto LABEL_106;
                case 41:
                  v43 = CFSTR("Attach Count Over 20W Adapter");
                  goto LABEL_106;
                case 42:
                  v38 = CFSTR("Host Available Power dW");
                  goto LABEL_113;
                case 43:
                  v38 = CFSTR("Rx Power Limit");
LABEL_113:
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)v38, v34, v35, v135);
                  goto LABEL_114;
                case 44:
                  v43 = CFSTR("Lifetime Cell0 Max Q");
                  goto LABEL_106;
                case 45:
                  v43 = CFSTR("Lifetime Cell1 Max Q");
LABEL_106:
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)v43, v34, v35, v135);
                  goto LABEL_107;
                default:
                  goto LABEL_114;
              }
            }
            switch(v37)
            {
              case 4096:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("PowerStatus"), v34, v35, v135);
                break;
              case 4097:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("ChargingStatus"), v34, v35, v135);
                break;
              case 4098:
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("InductiveStatus"), v34, v35, v135);
                break;
            }
          }
        }
        else if (v31 == 132)
        {
          v39 = objc_msgSend_usage(v15, v32, v33, v34, v35);
          if (v39 > 85)
          {
            if (v39 <= 89)
            {
              if (v39 == 86)
              {
                if (v21 >= 5)
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Startup Delay"), v34, v35, v135);
              }
              else if (v39 == 87 && v21 >= 5)
              {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Delayed Remove Power"), v34, v35, v135);
              }
            }
            else if (v39 == 90)
            {
              if (v21 >= 5)
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Enable Audible Alarm"), v34, v35, v135);
            }
            else if (v39 == 98)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Internal Failure"), v34, v35, v135);
            }
            else if (v39 == 109 && v21 >= 5)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Enable Charging"), v34, v35, v135);
            }
          }
          else if (v39 <= 53)
          {
            if (v39 == 48)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Voltage"), v34, v35, v135);
            }
            else if (v39 == 49)
            {
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Current"), v34, v35, v135);
            }
          }
          else
          {
            switch(v39)
            {
              case '6':
                if (v26 == 129)
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Send Current Temperature"), v34, v35, v135);
                else
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Temperature"), v34, v35, v135);
                break;
              case '@':
                if (v21 >= 5)
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Set Required Voltage"), v34, v35, v135);
                break;
              case 'A':
                if (v21 > 4)
                {
                  if (v26 == 129)
                    objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Set Current Limit"), v34, v35, v135);
                }
                else
                {
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Battery Case Available Current"), v34, v35, v135);
                }
                break;
            }
          }
        }
        else if (v31 == 133)
        {
          v36 = objc_msgSend_usage(v15, v32, v33, v34, v35);
          switch(v36)
          {
            case 'e':
            case 'f':
              if (v26 == 129)
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Send Current State of Charge"), v34, v35, v135);
              else
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Current Capacity"), v34, v35, v135);
              break;
            case 'g':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Max Capacity"), v34, v35, v135);
              break;
            case 'h':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Time to Empty"), v34, v35, v135);
              break;
            case 'i':
              break;
            case 'j':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Time to Full Charge"), v34, v35, v135);
              break;
            case 'k':
              objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("CycleCount"), v34, v35, v135);
              break;
            default:
              if ((v36 - 68) >= 2)
              {
                if (v36 == 208)
                  objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Power Source State"), v34, v35, v135);
              }
              else
              {
                objc_msgSend_setPsKey_(v15, v32, (uint64_t)CFSTR("Is Charging"), v34, v35, v135);
              }
              break;
          }
        }
LABEL_114:
        objc_msgSend_psKey(v15, v32, v33, v34, v35, v135);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          v65 = 0;
          goto LABEL_138;
        }
        v137 = v26;
        v48 = v21;
        p_elements = &self->_elements;
        objc_msgSend_addObjectsFromArray_(v16, v45, (uint64_t)self->_elements.input, v46, v47);
        objc_msgSend_addObjectsFromArray_(v16, v50, (uint64_t)self->_elements.output, v51, v52);
        objc_msgSend_addObjectsFromArray_(v16, v53, (uint64_t)self->_elements.feature, v54, v55);
        objc_msgSend_psKey(v15, v56, v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = self;
        v140 = v16;
        v64 = (void *)objc_msgSend_copyElements_psKey_(self, v62, (uint64_t)v16, (uint64_t)v60, v63);

        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        v65 = v64;
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v143, (uint64_t)v153, 16);
        if (v67)
        {
          v72 = v67;
          v73 = *(_QWORD *)v144;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v144 != v73)
                objc_enumerationMutation(v65);
              v75 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * j);
              v76 = objc_msgSend_usagePage(v75, v68, v69, v70, v71);
              if (v76 == objc_msgSend_usagePage(v15, v77, v78, v79, v80))
              {
                v81 = objc_msgSend_usage(v75, v68, v69, v70, v71);
                if (v81 == objc_msgSend_usage(v15, v82, v83, v84, v85))
                {
                  objc_msgSend_type(v75, v68, v69, v70, v71);
                  objc_msgSend_type(v15, v86, v87, v88, v89);
                }
              }
            }
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v143, (uint64_t)v153, 16);
          }
          while (v72);
        }

        self = v61;
        capabilities = v61->_capabilities;
        objc_msgSend_psKey(v15, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(capabilities, v96, (uint64_t)v95, v97, v98);

        if (v48 <= 4)
        {
          objc_msgSend_addObject_(p_elements->input, v99, (uint64_t)v15, v100, v101);
LABEL_130:
          v16 = v140;
          i = v141;
          goto LABEL_138;
        }
        if (v137 == 129)
        {
          objc_msgSend_addObject_(p_elements->output, v99, (uint64_t)v15, v100, v101);
          goto LABEL_130;
        }
        objc_msgSend_addObject_(p_elements->feature, v99, (uint64_t)v15, v100, v101);
        _IOHIDLogCategory();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          v107 = objc_msgSend_usagePage(v15, v103, v104, v105, v106);
          v112 = objc_msgSend_usage(v15, v108, v109, v110, v111);
          *(_DWORD *)buf = v135;
          *(_DWORD *)v152 = v107;
          *(_WORD *)&v152[4] = 1024;
          *(_DWORD *)&v152[6] = v112;
          _os_log_impl(&dword_2310D3000, v102, OS_LOG_TYPE_DEFAULT, "Feature element (UP : %x, U : %x) added for polling", buf, 0xEu);
        }

        i = v141;
        if (!v61->_timer)
        {
          _IOHIDLogCategory();
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2310D3000, v113, OS_LOG_TYPE_DEFAULT, "Create time for polling feature reports", buf, 2u);
          }

          v114 = objc_alloc(MEMORY[0x24BDBCF40]);
          objc_msgSend_date(MEMORY[0x24BDBCE60], v115, v116, v117, v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v142[0] = MEMORY[0x24BDAC760];
          v142[1] = 3221225472;
          v142[2] = sub_2310DA7B0;
          v142[3] = &unk_24FFFA488;
          v142[4] = v61;
          v121 = objc_msgSend_initWithFireDate_interval_repeats_block_(v114, v120, (uint64_t)v119, 1, (uint64_t)v142, 5.0);
          timer = v61->_timer;
          v61->_timer = (NSTimer *)v121;

        }
        v16 = v140;
LABEL_138:

      }
      v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v123, (uint64_t)&v147, (uint64_t)v154, 16);
    }
    while (v139);
  }
  objc_msgSend_addObjectsFromArray_(self->_commandElements, v5, (uint64_t)self->_elements.output, v6, v7);
  objc_msgSend_addObjectsFromArray_(self->_commandElements, v124, (uint64_t)self->_elements.feature, v125, v126);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v127, (uint64_t)self->_elements.input, v128, v129);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v130, (uint64_t)self->_elements.feature, v131, v132);
  _IOHIDLogCategory();
  v133 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    v134 = self->_capabilities;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v152 = v134;
    _os_log_impl(&dword_2310D3000, v133, OS_LOG_TYPE_DEFAULT, "capabilities: %@", buf, 0xCu);
  }

}

- (id)copyElements:(id)a3 psKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isEqualToString;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v10)
  {
    v15 = v10;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_psKey(v18, v11, v12, v13, v14, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)v6, v21, v22);

        if (isEqualToString)
          objc_msgSend_addObject_(v7, v11, (uint64_t)v18, v13, v14);
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v15);
  }

  return v7;
}

- (id)latestElement:(id)a3 psKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = (id)objc_msgSend_copyElements_psKey_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v12)
  {
    v17 = v12;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v10);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend_timestamp(v22, v13, v14, v15, v16, (_QWORD)v29) > v19)
        {
          v23 = v22;

          v19 = objc_msgSend_timestamp(v23, v24, v25, v26, v27);
          v18 = v23;
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)updateElements:(id)a3
{
  id v4;
  IOHIDDeviceTransactionInterface **transaction;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  IOHIDDeviceTransactionInterface **v19;
  IOReturn (__cdecl *addElement)(void *, IOHIDElementRef, IOOptionBits);
  uint64_t v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  IOHIDDeviceTransactionInterface **v38;
  IOReturn (__cdecl *getValue)(void *, IOHIDElementRef, IOHIDValueRef *, IOOptionBits);
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  int v46;
  NSObject *v47;
  _BOOL4 v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  const char *v60;
  uint32_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  __int128 v87;
  id v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  transaction = self->_transaction;
  if (!transaction)
  {
    _IOHIDLogCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_2310E1828();
    goto LABEL_7;
  }
  if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, _QWORD, _QWORD))(*transaction)->setDirection)(transaction, 0, 0))
  {
    _IOHIDLogCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_2310E18B4();
LABEL_7:

    goto LABEL_8;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v7 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v94, (uint64_t)v105, 16);
  if (v9)
  {
    v14 = v9;
    v88 = v4;
    v15 = 0;
    v16 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v95 != v16)
          objc_enumerationMutation(v7);
        v18 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        if (!objc_msgSend_isConstant(v18, v10, v11, v12, v13)
          || (objc_msgSend_isUpdated(v18, v10, v11, v12, v13) & 1) == 0)
        {
          v19 = self->_transaction;
          addElement = (*v19)->addElement;
          v21 = objc_msgSend_elementRef(v18, v10, v11, v12, v13);
          v22 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, _QWORD))addElement)(v19, v21, 0);
          if (v22)
          {
            v23 = v22;
            _IOHIDLogCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v99 = v23;
              _os_log_impl(&dword_2310D3000, v24, OS_LOG_TYPE_DEFAULT, "Failed to add element to transaction %x", buf, 8u);
            }

          }
          else
          {
            ++v15;
          }
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v94, (uint64_t)v105, 16);
    }
    while (v14);

    v4 = v88;
    if (v15)
    {
      if (((unsigned int (*)(IOHIDDeviceTransactionInterface **, _QWORD, _QWORD, _QWORD, _QWORD))(*self->_transaction)->commit)(self->_transaction, 0, 0, 0, 0))
      {
        ((void (*)(IOHIDDeviceTransactionInterface **, _QWORD))(*self->_transaction)->clear)(self->_transaction, 0);
        _IOHIDLogCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_2310E1854();
        goto LABEL_7;
      }
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v26 = v7;
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v90, (uint64_t)v104, 16);
      if (!v28)
        goto LABEL_56;
      v34 = v28;
      v35 = *(_QWORD *)v91;
      *(_QWORD *)&v33 = 67109632;
      v87 = v33;
LABEL_33:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v91 != v35)
          objc_enumerationMutation(v26);
        v37 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v36);
        v89 = 0;
        if (objc_msgSend_isConstant(v37, v29, v30, v31, v32, v87)
          && (objc_msgSend_isUpdated(v37, v29, v30, v31, v32) & 1) != 0)
        {
          goto LABEL_51;
        }
        v38 = self->_transaction;
        getValue = (*v38)->getValue;
        v40 = objc_msgSend_elementRef(v37, v29, v30, v31, v32);
        v41 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, uint64_t, uint64_t *, _QWORD))getValue)(v38, v40, &v89, 0);
        if (v41)
          v45 = 1;
        else
          v45 = v89 == 0;
        if (v45)
        {
          v46 = v41;
          _IOHIDLogCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
          if (v46)
          {
            if (v48)
            {
              v53 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
              v58 = objc_msgSend_usage(v37, v54, v55, v56, v57);
              *(_DWORD *)buf = v87;
              v99 = v53;
              v100 = 1024;
              v101 = v58;
              v102 = 1024;
              v103 = v46;
              v59 = v47;
              v60 = "Unable to update element UP: %x, U : %x failed(%#x)";
              v61 = 20;
LABEL_54:
              _os_log_error_impl(&dword_2310D3000, v59, OS_LOG_TYPE_ERROR, v60, buf, v61);
            }
          }
          else if (v48)
          {
            v80 = objc_msgSend_usagePage(v37, v49, v50, v51, v52);
            v85 = objc_msgSend_usage(v37, v81, v82, v83, v84);
            *(_DWORD *)buf = 67109376;
            v99 = v80;
            v100 = 1024;
            v101 = v85;
            v59 = v47;
            v60 = "Unable to update element UP: %x, U : %x no value";
            v61 = 14;
            goto LABEL_54;
          }
        }
        else
        {
          objc_msgSend_setValueRef_(v37, v42, v89, v43, v44);
          objc_msgSend_setIsUpdated_(v37, v62, 1, v63, v64);
          if (!objc_msgSend_isConstant(v37, v65, v66, v67, v68))
            goto LABEL_51;
          _IOHIDLogCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v74 = objc_msgSend_usagePage(v37, v70, v71, v72, v73);
            v79 = objc_msgSend_usage(v37, v75, v76, v77, v78);
            *(_DWORD *)buf = 67109376;
            v99 = v74;
            v100 = 1024;
            v101 = v79;
            _os_log_impl(&dword_2310D3000, v47, OS_LOG_TYPE_DEFAULT, "Constant feature element UP : %x , U : %x updated", buf, 0xEu);
          }
        }

LABEL_51:
        if (v34 == ++v36)
        {
          v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v90, (uint64_t)v104, 16);
          v34 = v86;
          if (!v86)
          {
LABEL_56:

            ((void (*)(IOHIDDeviceTransactionInterface **, _QWORD))(*self->_transaction)->clear)(self->_transaction, 0);
            v4 = v88;
            goto LABEL_8;
          }
          goto LABEL_33;
        }
      }
    }
  }
  else
  {

  }
  _IOHIDLogCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2310D3000, v25, OS_LOG_TYPE_DEFAULT, "Nothing to commit skip", buf, 2u);
  }

  ((void (*)(IOHIDDeviceTransactionInterface **, _QWORD))(*self->_transaction)->clear)(self->_transaction, 0);
LABEL_8:

}

- (BOOL)updateEvent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *eventElements;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *upsEvent;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  double v52;
  int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSMutableDictionary *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  char isEqual;
  uint64_t v98;
  int v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  int v121;
  void *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  NSMutableDictionary *debugInformation;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  NSMutableDictionary *v136;
  double v137;
  double v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  __CFString *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  NSObject *v236;
  const char *v237;
  const char *v238;
  const char *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  NSMutableDictionary *upsUpdatedEvent;
  uint64_t v245;
  int v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  void *v252;
  NSMutableArray *obj;
  uint64_t v254;
  uint64_t v255;
  char v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  uint8_t buf[4];
  _BYTE v262[10];
  const char *v263;
  _BYTE v264[10];
  void *v265;
  _BYTE v266[128];
  uint64_t v267;

  v267 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_removeAllObjects(self->_upsUpdatedEvent, a2, v2, v3, v4);
  v259 = 0u;
  v260 = 0u;
  v257 = 0u;
  v258 = 0u;
  obj = self->_eventElements;
  v255 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v257, (uint64_t)v266, 16);
  if (!v255)
  {
    v256 = 0;
    v249 = 0;
    v250 = 0;
    v248 = 0;
    goto LABEL_99;
  }
  v256 = 0;
  v249 = 0;
  v250 = 0;
  v248 = 0;
  v254 = *(_QWORD *)v258;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v258 != v254)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * v11);
      eventElements = self->_eventElements;
      objc_msgSend_psKey(v12, v7, v8, v9, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_latestElement_psKey_(self, v15, (uint64_t)eventElements, (uint64_t)v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17 || (objc_msgSend_isEqual_(v12, v18, (uint64_t)v17, v20, v21) & 1) != 0)
      {
        upsEvent = self->_upsEvent;
        objc_msgSend_psKey(v12, v18, v19, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(upsEvent, v24, (uint64_t)v23, v25, v26);
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_psKey(v12, v28, v29, v30, v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_integerValue(v12, v33, v34, v35, v36);
        LODWORD(upsEvent) = objc_msgSend_unitExponent(v12, v38, v39, v40, v41);
        v46 = objc_msgSend_unitExponent(v12, v42, v43, v44, v45);
        v51 = v46 - 16;
        if (upsEvent < 8)
          v51 = v46;
        v52 = (double)v51;
        v53 = objc_msgSend_usagePage(v12, v47, v48, v49, v50);
        if (v53 != 65293)
        {
          if (v53 == 133)
          {
            v88 = objc_msgSend_usage(v12, v54, v55, v56, v57);
            if (v88 <= 100)
            {
              if (v88 == 68)
              {
                v178 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                v179 = MEMORY[0x24BDBD1C8];
                v180 = (void *)MEMORY[0x24BDBD1C0];
                if (v178)
                  v180 = (void *)MEMORY[0x24BDBD1C8];
                v136 = v180;
                HIDWORD(v250) |= objc_msgSend_integerValue(v12, v181, v182, v183, v184) != 0;
                LODWORD(v249) = objc_msgSend_isEqual_(v27, v185, v179, v186, v187);
              }
              else
              {
                if (v88 != 69)
                  goto LABEL_57;
                v139 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                v140 = &unk_24FFFCDA0;
                if (!v139)
                  v140 = &unk_24FFFCD88;
                v136 = v140;
                LODWORD(v250) = v250 | (objc_msgSend_integerValue(v12, v141, v142, v143, v144) != 0);
                HIDWORD(v248) = objc_msgSend_isEqual_(v27, v145, (uint64_t)&unk_24FFFCD88, v146, v147);
              }
            }
            else
            {
              switch(v88)
              {
                case 'e':
                case 'f':
                  if (objc_msgSend_unit(v12, v54, v59, v56, v57) == 1052673)
                    v37 = (int)((double)(int)v37 / 3.6);
                  if (!objc_msgSend_unit(v12, v89, v90, v91, v92))
                  {
                    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v54, v37, v56, v57);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    isEqual = objc_msgSend_isEqual_(v27, v94, (uint64_t)v93, v95, v96);

                    if ((isEqual & 1) == 0)
                    {
                      v99 = objc_msgSend_integerValue(v12, v54, v98, v56, v57);
                      v102 = (void *)objc_msgSend_copyElements_psKey_(self, v100, (uint64_t)self->_eventElements, (uint64_t)CFSTR("Time to Full Charge"), v101);
                      v107 = v102;
                      if (v102 && objc_msgSend_count(v102, v103, v104, v105, v106))
                      {
                        v246 = v99;
                        objc_msgSend_objectAtIndex_(v107, v103, 0, v108, v106);
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        v245 = objc_msgSend_integerValue(v109, v110, v111, v112, v113);
                        v251 = v109;
                        if ((objc_msgSend_isEqual_(v109, v114, (uint64_t)v27, v115, v116) & 1) == 0)
                        {
                          objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v103, ((int)((double)(100 - v246) / 100.0 * (double)v245) / 60), v117, v106);
                          v118 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v119, (uint64_t)v118, (uint64_t)CFSTR("Time to Full Charge"), v120);

                        }
                      }
                      else
                      {
                        v251 = 0;
                      }
                      v196 = (void *)objc_msgSend_copyElements_psKey_(self, v103, (uint64_t)self->_eventElements, (uint64_t)CFSTR("Time to Empty"), v106);

                      if (v196 && objc_msgSend_count(v196, v197, v198, v199, v200))
                      {
                        objc_msgSend_objectAtIndex_(v196, v201, 0, v202, v203);
                        v247 = (void *)objc_claimAutoreleasedReturnValue();

                        v252 = (void *)MEMORY[0x24BDD16E0];
                        v208 = objc_msgSend_integerValue(v247, v204, v205, v206, v207);
                        objc_msgSend_numberWithInteger_(v252, v209, v208 / 60, v210, v211);
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v213, (uint64_t)v212, (uint64_t)CFSTR("Time to Empty"), v214);

                        v215 = v247;
                      }
                      else
                      {
                        v215 = v251;
                      }

                    }
                  }
                  goto LABEL_57;
                case 'g':
                  goto LABEL_54;
                case 'h':
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v54, ((int)v37 / 60), v56, v57);
                  goto LABEL_58;
                case 'i':
                  goto LABEL_57;
                case 'j':
                  v164 = (void *)objc_msgSend_copyElements_psKey_(self, v54, (uint64_t)self->_eventElements, (uint64_t)CFSTR("Current Capacity"), v57);
                  v169 = v164;
                  if (v164 && objc_msgSend_count(v164, v165, v166, v167, v168))
                  {
                    objc_msgSend_objectAtIndex_(v169, v170, 0, v171, v172);
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = ((int)((double)(100
                                                                    - objc_msgSend_integerValue(v173, v174, v175, v176, v177))/ 100.0* (double)(int)v37)/ 60);

                  }
                  goto LABEL_57;
                default:
                  if (v88 != 208)
                    goto LABEL_57;
                  v155 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  v156 = CFSTR("Battery Power");
                  if (v155)
                    v156 = CFSTR("AC Power");
                  v136 = v156;
                  HIDWORD(v249) |= objc_msgSend_integerValue(v12, v157, v158, v159, v160) != 0;
                  LODWORD(v248) = objc_msgSend_isEqual_(v27, v161, (uint64_t)CFSTR("AC Power"), v162, v163);
                  break;
              }
            }
            goto LABEL_60;
          }
          if (v53 != 132)
            goto LABEL_57;
          v58 = objc_msgSend_usage(v12, v54, v55, v56, v57);
          if (v58 <= 53)
          {
            if (v58 != 48)
            {
              if (v58 != 49)
                goto LABEL_57;
              goto LABEL_44;
            }
LABEL_42:
            v37 = (1000 * v37);
            if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 15782177)
              goto LABEL_57;
            v137 = v52 + -7.0;
LABEL_46:
            v138 = __exp10(v137) * (double)(int)v37;
          }
          else
          {
            if (v58 != 54)
            {
              if (v58 != 65)
              {
                if (v58 == 98)
                {
                  v60 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  v61 = &unk_24FFFCDA0;
                  if (v60)
                    v61 = &unk_24FFFCD88;
                  v62 = v61;
                  goto LABEL_59;
                }
LABEL_57:
                objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v54, v37, v56, v57);
LABEL_58:
                v62 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_59:
                v136 = v62;
LABEL_60:
                v148 = objc_msgSend_isEqual_(v136, v54, (uint64_t)v27, v56, v57);
                if (objc_msgSend_timestamp(v12, v149, v150, v151, v152) && (v148 & 1) == 0)
                  objc_msgSend_setObject_forKeyedSubscript_(self->_upsUpdatedEvent, v153, (uint64_t)v136, (uint64_t)v32, v154);
                v256 |= v148 ^ 1;

                goto LABEL_64;
              }
LABEL_44:
              v37 = (1000 * v37);
              if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 1048577)
                goto LABEL_57;
              v137 = v52;
              goto LABEL_46;
            }
            if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 65537)
              goto LABEL_57;
            v138 = (double)(int)(__exp10(v52) * (double)(int)v37) + -273.15;
          }
LABEL_56:
          v37 = (int)v138;
          goto LABEL_57;
        }
        v121 = objc_msgSend_usage(v12, v54, v55, v56, v57);
        if ((v121 - 16) >= 0x1E)
        {
          if (v121 <= 4095)
          {
            switch(v121)
            {
              case 1:
              case 2:
LABEL_54:
                if (objc_msgSend_unit(v12, v54, v59, v56, v57) != 1052673)
                  goto LABEL_57;
                v138 = (double)(int)v37 / 3.6;
                break;
              case 3:
              case 12:
                goto LABEL_44;
              case 5:
                objc_msgSend_dataValue(v12, v54, v59, v56, v57);
                v136 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              case 6:
              case 11:
              case 13:
              case 14:
                goto LABEL_42;
              case 7:
                v37 = (1000 * v37);
                if (objc_msgSend_unit(v12, v54, v59, v56, v57) == 1048577)
                  v37 = (int)(__exp10(v52) * (double)(int)v37);
                objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v216, v37, v217, v218);
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v219, (uint64_t)v193, (uint64_t)CFSTR("Battery Case Average Charging Current"), v220);
                goto LABEL_94;
              default:
                goto LABEL_57;
            }
            goto LABEL_56;
          }
          switch(v121)
          {
            case 4096:
              v221 = (void *)MEMORY[0x24BDD16E0];
              v222 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v221, v223, v222, v224, v225);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v226, (uint64_t)v193, (uint64_t)CFSTR("PowerStatus"), v227);
              break;
            case 4097:
              v228 = (void *)MEMORY[0x24BDD16E0];
              v229 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v228, v230, v229, v231, v232);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v233, (uint64_t)v193, (uint64_t)CFSTR("ChargingStatus"), v234);
              break;
            case 4098:
              v188 = (void *)MEMORY[0x24BDD16E0];
              v189 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v188, v190, v189, v191, v192);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(self->_debugInformation, v194, (uint64_t)v193, (uint64_t)CFSTR("InductiveStatus"), v195);
              break;
            default:
              goto LABEL_57;
          }
LABEL_94:

          v136 = self->_debugInformation;
        }
        else
        {
          v122 = (void *)MEMORY[0x24BDD16E0];
          v123 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
          objc_msgSend_numberWithInteger_(v122, v124, v123, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          debugInformation = self->_debugInformation;
          objc_msgSend_psKey(v12, v129, v130, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(debugInformation, v134, (uint64_t)v127, (uint64_t)v133, v135);

          v136 = self->_debugInformation;
        }
        v32 = CFSTR("Debug Information");
LABEL_35:
        if (!v136)
          goto LABEL_57;
        goto LABEL_60;
      }
      _IOHIDLogCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_msgSend_usagePage(v12, v63, v64, v65, v66);
        v72 = objc_msgSend_usage(v12, v68, v69, v70, v71);
        v77 = objc_msgSend_type(v12, v73, v74, v75, v76);
        v82 = objc_msgSend_integerValue(v12, v78, v79, v80, v81);
        objc_msgSend_psKey(v12, v83, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v262 = v67;
        *(_WORD *)&v262[4] = 1024;
        *(_DWORD *)&v262[6] = v72;
        LOWORD(v263) = 1024;
        *(_DWORD *)((char *)&v263 + 2) = v77;
        HIWORD(v263) = 2048;
        *(_QWORD *)v264 = v82;
        *(_WORD *)&v264[8] = 2112;
        v265 = v87;
        _os_log_impl(&dword_2310D3000, v27, OS_LOG_TYPE_DEFAULT, "Skipping duplicate element (UP : %x U : %x Type : %u IV: %ld) with key %@\n", buf, 0x28u);

      }
LABEL_64:

      ++v11;
    }
    while (v255 != v11);
    v235 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v257, (uint64_t)v266, 16);
    v255 = v235;
  }
  while (v235);
LABEL_99:

  _IOHIDLogCategory();
  v236 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
  {
    v237 = "No";
    if ((v249 & 0x100000000) != 0)
      v238 = "Yes";
    else
      v238 = "No";
    if ((v250 & 0x100000000) != 0)
      v239 = "Yes";
    else
      v239 = "No";
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v262 = v238;
    *(_WORD *)&v262[8] = 2080;
    v263 = v239;
    if ((v250 & 1) != 0)
      v237 = "Yes";
    *(_WORD *)v264 = 2080;
    *(_QWORD *)&v264[2] = v237;
    _os_log_impl(&dword_2310D3000, v236, OS_LOG_TYPE_DEFAULT, "Power Source status isACSource : %s , isCharging : %s , isDischarging : %s", buf, 0x20u);
  }

  if (((HIDWORD(v249) ^ v248) & 1) != 0
    || ((HIDWORD(v250) ^ v249) & 1) != 0
    || ((v250 ^ HIDWORD(v248)) & 1) != 0)
  {
    upsUpdatedEvent = self->_upsUpdatedEvent;
    if (((v250 | ~BYTE4(v250)) & ~BYTE4(v249) & 1) != 0)
      objc_msgSend_setObject_forKeyedSubscript_(upsUpdatedEvent, v240, (uint64_t)CFSTR("Battery Power"), (uint64_t)CFSTR("Power Source State"), v242);
    else
      objc_msgSend_setObject_forKeyedSubscript_(upsUpdatedEvent, v240, (uint64_t)CFSTR("AC Power"), (uint64_t)CFSTR("Power Source State"), v242);
  }
  objc_msgSend_addEntriesFromDictionary_(self->_upsEvent, v240, (uint64_t)self->_upsUpdatedEvent, v241, v242);
  return v256 & 1;
}

- (void)valueAvailableCallback:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  IOHIDElementRef Element;
  HIDLibElement *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  IOHIDValueRef value;

  if (!a3)
  {
    do
    {
      value = 0;
      v6 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, IOHIDValueRef *, _QWORD, _QWORD))(*self->_queue)->copyNextValue)(self->_queue, &value, 0, 0);
      if (value)
      {
        Element = IOHIDValueGetElement(value);
        v8 = [HIDLibElement alloc];
        v12 = (void *)objc_msgSend_initWithElementRef_(v8, v9, (uint64_t)Element, v10, v11);
        v16 = objc_msgSend_indexOfObject_(self->_elements.input, v13, (uint64_t)v12, v14, v15);
        objc_msgSend_objectAtIndex_(self->_elements.input, v17, v16, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValueRef_(v20, v21, (uint64_t)value, v22, v23);
        CFRelease(value);

      }
    }
    while (!v6);
  }
  objc_msgSend_updateEvent(self, a2, *(uint64_t *)&a3, v3, v4);
  if (self->_eventCallback)
  {
    sub_2310DA974(self->_upsEvent, CFSTR("dispatchEvent"));
    ((void (*)(void *, _QWORD, void *, IOUPSPlugInInterface_v140 **, NSMutableDictionary *))self->_eventCallback)(self->_eventTarget, 0, self->_eventRefcon, &self->_ups, self->_upsUpdatedEvent);
  }
}

- (void)initialEventUpdate
{
  uint64_t v2;
  uint64_t v3;
  $FBF13BA38225885DFE2D10A75E0B4970 *p_elements;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_elements = &self->_elements;
  objc_msgSend_updateElements_(self, a2, (uint64_t)self->_elements.input, v2, v3);
  objc_msgSend_updateElements_(self, v6, (uint64_t)p_elements->feature, v7, v8);
  objc_msgSend_updateEvent(self, v9, v10, v11, v12);
}

- (BOOL)pollEventUpdate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_updateElements_(self, a2, (uint64_t)self->_elements.feature, v2, v3);
  return objc_msgSend_updateEvent(self, v5, v6, v7, v8);
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  kern_return_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFUUID *v10;
  const __CFUUID *v11;
  kern_return_t v12;
  IOCFPlugInInterface **v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v15;
  CFUUIDBytes v16;
  IOHIDDeviceTimeStampedDeviceInterface ***p_device;
  int v18;
  int v19;
  IOHIDDeviceTimeStampedDeviceInterface **v20;
  HRESULT (__cdecl *v21)(void *, REFIID, LPVOID *);
  const __CFUUID *v22;
  CFUUIDBytes v23;
  IOHIDDeviceQueueInterface ***p_queue;
  IOHIDDeviceTimeStampedDeviceInterface **v25;
  HRESULT (__cdecl *v26)(void *, REFIID, LPVOID *);
  const __CFUUID *v27;
  CFUUIDBytes v28;
  IOHIDDeviceTransactionInterface ***p_transaction;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  IOHIDDeviceQueueInterface **v33;
  IOReturn (__cdecl *setDepth)(void *, uint32_t, IOOptionBits);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  IOHIDDeviceQueueInterface **v51;
  IOReturn (__cdecl *addElement)(void *, IOHIDElementRef, IOOptionBits);
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v61;
  NSObject *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  CFMutableDictionaryRef properties;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  properties = 0;
  theInterface = 0;
  theScore = 0;
  v6 = IORegistryEntryCreateCFProperties(a4, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (v6)
  {
    v59 = v6;
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1C5C();
    goto LABEL_61;
  }
  if (!properties)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E1914();
    goto LABEL_64;
  }
  objc_msgSend_parseProperties_(self, v7, (uint64_t)properties, v8, v9);
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x7Du, 0xDEu, 0xECu, 0xA8u, 0xA7u, 0xB4u, 0x11u, 0xDAu, 0x8Au, 0xEu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v12 = IOCreatePlugInInterfaceForService(a4, v10, v11, &theInterface, &theScore);
  if (v12)
  {
    v59 = v12;
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1BFC();
    goto LABEL_61;
  }
  v13 = theInterface;
  if (!theInterface)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E1940();
    goto LABEL_64;
  }
  QueryInterface = (*theInterface)->QueryInterface;
  v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  v16 = CFUUIDGetUUIDBytes(v15);
  p_device = &self->_device;
  if (((unsigned int (*)(IOCFPlugInInterface **, _QWORD, _QWORD, IOHIDDeviceTimeStampedDeviceInterface ***))QueryInterface)(v13, *(_QWORD *)&v16.byte0, *(_QWORD *)&v16.byte8, &self->_device))
  {
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1B9C();
    goto LABEL_60;
  }
  if (!*p_device)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E196C();
    goto LABEL_64;
  }
  v18 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, _QWORD))(**p_device)->open)(*p_device, 0);
  if (v18)
  {
    v59 = v18;
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1B3C();
    goto LABEL_61;
  }
  v19 = ((uint64_t (*)(IOHIDDeviceTimeStampedDeviceInterface **, _QWORD, CFTypeRef *, _QWORD))(**p_device)->copyMatchingElements)(*p_device, 0, &cf, 0);
  if (v19)
  {
    v59 = v19;
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1ADC();
    goto LABEL_61;
  }
  if (!cf)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E1998();
    goto LABEL_64;
  }
  v20 = *p_device;
  v21 = (**p_device)->QueryInterface;
  v22 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Eu, 0xC7u, 0x8Bu, 0xDBu, 0x9Fu, 0x4Eu, 0x11u, 0xDAu, 0xB6u, 0x5Cu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  v23 = CFUUIDGetUUIDBytes(v22);
  p_queue = &self->_queue;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, _QWORD, _QWORD, IOHIDDeviceQueueInterface ***))v21)(v20, *(_QWORD *)&v23.byte0, *(_QWORD *)&v23.byte8, &self->_queue))
  {
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1A7C();
    goto LABEL_60;
  }
  if (!*p_queue)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E19C4();
    goto LABEL_64;
  }
  v25 = *p_device;
  v26 = (**p_device)->QueryInterface;
  v27 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  v28 = CFUUIDGetUUIDBytes(v27);
  p_transaction = &self->_transaction;
  if (((unsigned int (*)(IOHIDDeviceTimeStampedDeviceInterface **, _QWORD, _QWORD, IOHIDDeviceTransactionInterface ***))v26)(v25, *(_QWORD *)&v28.byte0, *(_QWORD *)&v28.byte8, &self->_transaction))
  {
    _IOHIDLogCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_2310E1A1C();
LABEL_60:
    v59 = -536870212;
LABEL_61:

    goto LABEL_28;
  }
  if (!*p_transaction)
  {
    _IOHIDLogCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_2310E19F0();
LABEL_64:

    v59 = -536870911;
    goto LABEL_28;
  }
  ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, _QWORD))(**p_transaction)->setDirection)(*p_transaction, 1, 0);
  objc_msgSend_parseElements_(self, v30, (uint64_t)cf, v31, v32);
  v33 = *p_queue;
  setDepth = (**p_queue)->setDepth;
  v39 = objc_msgSend_count(self->_elements.input, v35, v36, v37, v38);
  ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, _QWORD))setDepth)(v33, v39, 0);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v40 = self->_elements.input;
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v63, (uint64_t)v71, 16);
  if (v42)
  {
    v47 = v42;
    v48 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v64 != v48)
          objc_enumerationMutation(v40);
        v50 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend_type(v50, v43, v44, v45, v46) <= 4)
        {
          v51 = *p_queue;
          addElement = (**p_queue)->addElement;
          v53 = objc_msgSend_elementRef(v50, v43, v44, v45, v46);
          ((void (*)(IOHIDDeviceQueueInterface **, uint64_t, _QWORD))addElement)(v51, v53, 0);
        }
      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v63, (uint64_t)v71, 16);
    }
    while (v47);
  }

  v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, __CFRunLoopSource **))(**p_queue)->getAsyncEventSource)(*p_queue, &self->_runLoopSource);
  if (v54)
    goto LABEL_35;
  if (!self->_runLoopSource)
  {
    v59 = 0;
    goto LABEL_28;
  }
  v54 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), IOHIDUPSClass *))(**p_queue)->setValueAvailableCallback)(*p_queue, sub_2310DC7F4, self);
  if (v54)
  {
LABEL_35:
    v59 = v54;
    goto LABEL_28;
  }
  v59 = ((uint64_t (*)(IOHIDDeviceQueueInterface **, _QWORD))(**p_queue)->start)(*p_queue, 0);
  if (!v59)
    objc_msgSend_initialEventUpdate(self, v55, v56, v57, v58);
LABEL_28:
  if (theInterface)
    ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
  if (cf)
    CFRelease(cf);
  if (properties)
    CFRelease(properties);
  return v59;
}

- (int)stop
{
  IOHIDDeviceQueueInterface **queue;

  queue = self->_queue;
  if (queue)
    ((void (*)(IOHIDDeviceQueueInterface **, _QWORD))(*queue)->stop)(queue, 0);
  ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **, _QWORD))(*self->_device)->close)(self->_device, 0);
  return 0;
}

- (int)getProperties:(const __CFDictionary *)a3
{
  int result;

  if (!a3)
    return -536870206;
  result = 0;
  *a3 = (const __CFDictionary *)self->_properties;
  return result;
}

- (int)getCapabilities:(const __CFSet *)a3
{
  int result;

  if (!a3)
    return -536870206;
  result = 0;
  *a3 = (const __CFSet *)self->_capabilities;
  return result;
}

- (int)getEvent:(const __CFDictionary *)a3
{
  if (!a3)
    return -536870206;
  *a3 = (const __CFDictionary *)self->_upsEvent;
  sub_2310DA974(self->_upsEvent, CFSTR("getEvent"));
  return 0;
}

- (int)setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5
{
  self->_eventCallback = a3;
  self->_eventTarget = a4;
  self->_eventRefcon = a5;
  return 0;
}

- (int)sendCommand:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IOHIDDeviceTransactionInterface **transaction;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IOHIDLogCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_2310D3000, v5, OS_LOG_TYPE_DEFAULT, "sendCommand: %@", buf, 0xCu);
  }
  v6 = -536870206;

  if (v4 && objc_msgSend_count(v4, v7, v8, v9, v10))
  {
    transaction = self->_transaction;
    if (transaction)
    {
      ((void (*)(IOHIDDeviceTransactionInterface **, uint64_t, _QWORD))(*transaction)->setDirection)(transaction, 1, 0);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = sub_2310DCAC0;
      v17[3] = &unk_24FFFA4B0;
      v17[4] = self;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v12, (uint64_t)v17, v13, v14);
      v6 = ((uint64_t (*)(IOHIDDeviceTransactionInterface **, _QWORD, _QWORD, _QWORD, _QWORD))(*self->_transaction)->commit)(self->_transaction, 0, 0, 0, 0);
      ((void (*)(IOHIDDeviceTransactionInterface **, _QWORD))(*self->_transaction)->clear)(self->_transaction, 0);
    }
    else
    {
      _IOHIDLogCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_2310E1828();

      v6 = -536870212;
    }
  }

  return v6;
}

- (int)createAsyncEventSource:(const void *)a3
{
  id v5;
  NSTimer *timer;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CFRunLoopSource *runLoopSource;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  timer = self->_timer;
  if (timer)
  {
    CFRetain(timer);
    objc_msgSend_addObject_(v5, v7, (uint64_t)self->_timer, v8, v9);
  }
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRetain(runLoopSource);
    objc_msgSend_addObject_(v5, v11, (uint64_t)self->_runLoopSource, v12, v13);
  }
  *a3 = v5;
  return 0;
}

- (IOHIDUPSClass)init
{
  IOHIDUPSClass *v2;
  char *v3;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *properties;
  NSMutableSet *v9;
  NSMutableSet *capabilities;
  NSMutableArray *v11;
  NSMutableArray *input;
  NSMutableArray *v13;
  NSMutableArray *output;
  NSMutableArray *v15;
  NSMutableArray *feature;
  NSMutableArray *v17;
  NSMutableArray *commandElements;
  NSMutableArray *v19;
  NSMutableArray *eventElements;
  NSMutableDictionary *v21;
  NSMutableDictionary *upsEvent;
  NSMutableDictionary *v23;
  NSMutableDictionary *upsUpdatedEvent;
  NSMutableDictionary *v25;
  NSMutableDictionary *debugInformation;
  IOHIDUPSClass *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)IOHIDUPSClass;
  v2 = -[IOHIDPlugin init](&v29, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_malloc(0x50uLL, 0x80040A1CEA83AuLL);
    v2->_ups = (IOUPSPlugInInterface_v140 *)v3;
    vtbl = v2->super.super._vtbl;
    Release = vtbl->Release;
    v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((_QWORD *)v3 + 3) = Release;
    *((_QWORD *)v3 + 4) = sub_2310DCF80;
    *((_QWORD *)v3 + 5) = sub_2310DCF90;
    *((_QWORD *)v3 + 6) = sub_2310DCFA0;
    *((_QWORD *)v3 + 7) = sub_2310DCFB0;
    *((_QWORD *)v3 + 8) = sub_2310DCFC8;
    *((_QWORD *)v3 + 9) = sub_2310DCFD8;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->_properties;
    v2->_properties = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    capabilities = v2->_capabilities;
    v2->_capabilities = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    input = v2->_elements.input;
    v2->_elements.input = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    output = v2->_elements.output;
    v2->_elements.output = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    feature = v2->_elements.feature;
    v2->_elements.feature = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    commandElements = v2->_commandElements;
    v2->_commandElements = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventElements = v2->_eventElements;
    v2->_eventElements = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    upsEvent = v2->_upsEvent;
    v2->_upsEvent = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    upsUpdatedEvent = v2->_upsUpdatedEvent;
    v2->_upsUpdatedEvent = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    debugInformation = v2->_debugInformation;
    v2->_debugInformation = v25;

    v27 = v2;
  }

  return v2;
}

- (void)dealloc
{
  IOHIDDeviceQueueInterface **queue;
  IOHIDDeviceTransactionInterface **transaction;
  IOHIDDeviceTimeStampedDeviceInterface **device;
  objc_super v6;

  free(self->_ups);
  queue = self->_queue;
  if (queue)
    ((void (*)(IOHIDDeviceQueueInterface **))(*queue)->Release)(queue);
  transaction = self->_transaction;
  if (transaction)
    ((void (*)(IOHIDDeviceTransactionInterface **))(*transaction)->Release)(transaction);
  device = self->_device;
  if (device)
    ((void (*)(IOHIDDeviceTimeStampedDeviceInterface **))(*device)->Release)(device);
  v6.receiver = self;
  v6.super_class = (Class)IOHIDUPSClass;
  -[IOHIDPlugin dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_eventElements, 0);
  objc_storeStrong((id *)&self->_commandElements, 0);
  sub_2310DD154((id *)&self->_elements.input);
  objc_storeStrong((id *)&self->_debugInformation, 0);
  objc_storeStrong((id *)&self->_upsUpdatedEvent, 0);
  objc_storeStrong((id *)&self->_upsEvent, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
