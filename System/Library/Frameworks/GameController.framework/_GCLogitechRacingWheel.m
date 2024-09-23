@implementation _GCLogitechRacingWheel

- (_GCLogitechRacingWheel)initWithService:(unsigned int)a3
{
  __IOHIDDevice *v3;
  __IOHIDDevice *v4;
  void *v5;
  void *v6;
  int v7;
  _GCLogitechRacingWheel *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  NSArray *v11;
  NSArray *eventObservers;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  char *v17;
  char *v18;
  char *v19;
  void *v20;
  char *v21;
  char *v22;
  char *v23;
  void *v24;
  char *v25;
  char *v26;
  char *v27;
  void *v28;
  char *v29;
  char *v30;
  char *v31;
  void *v32;
  char *v33;
  char *v34;
  char *v35;
  void *v36;
  char *v37;
  char *v38;
  void *v39;
  char *v40;
  char *v41;
  void *v42;
  char *v43;
  char *v44;
  void *v45;
  char *v46;
  char *v47;
  void *v48;
  char *v49;
  char *v50;
  void *v51;
  char *v52;
  char *v53;
  void *v54;
  char *v55;
  char *v56;
  char *v57;
  void *v58;
  char *v59;
  char *v60;
  char *v61;
  void *v62;
  char *v63;
  char *v64;
  char *v65;
  void *v66;
  char *v67;
  char *v68;
  char *v69;
  void *v70;
  char *v71;
  char *v72;
  void *v73;
  char *v74;
  char *v75;
  void *v76;
  char *v77;
  char *v78;
  void *v79;
  char *v80;
  char *v81;
  void *v82;
  char *v83;
  char *v84;
  _GCDevicePhysicalInputButtonElement *v85;
  _GCDevicePhysicalInputButtonElement *v86;
  _GCDevicePhysicalInputButtonElement *v87;
  GCGearShifterElement *v88;
  GCSteeringWheelElement *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _GCDevicePhysicalInputButtonElement *v95;
  GCGearShifterElement *v96;
  GCSteeringWheelElement *v97;
  void *v98;
  _GCDevicePhysicalInputButtonElement *v99;
  GCSteeringWheelElement *v100;
  _GCDevicePhysicalInputButtonElement *v101;
  _GCDevicePhysicalInput *v102;
  _GCDevicePhysicalInputComponent *v103;
  void *v104;
  _GCLogitechRacingWheel *v105;
  _GCDevicePhysicalInputButtonElement *v107;
  _GCDevicePhysicalInputButtonElement *v108;
  _GCDevicePhysicalInputButtonElement *v109;
  _GCDevicePhysicalInputButtonElement *v110;
  _GCDevicePhysicalInputButtonElement *v111;
  _GCDevicePhysicalInputButtonElement *v112;
  _GCDevicePhysicalInputButtonElement *v113;
  _GCDevicePhysicalInputButtonElement *v114;
  _GCDevicePhysicalInputButtonElement *v115;
  _GCDevicePhysicalInputButtonElement *v116;
  _GCDevicePhysicalInputButtonElement *v117;
  _GCDevicePhysicalInputButtonElement *v118;
  _GCDevicePhysicalInputButtonElement *v119;
  _GCDevicePhysicalInputButtonElement *v120;
  _GCDevicePhysicalInputButtonElement *v121;
  void *v122;
  _GCDevicePhysicalInputDirectionPadElement *v123;
  _GCDevicePhysicalInputButtonElement *v124;
  _GCDevicePhysicalInputButtonElement *v125;
  _GCDevicePhysicalInputButtonElement *v126;
  _GCDevicePhysicalInputButtonElement *v127;
  _GCDevicePhysicalInputButtonElement *v128;
  _GCDevicePhysicalInputButtonElement *v129;
  _GCDevicePhysicalInputButtonElement *v130;
  _GCDevicePhysicalInputDirectionPadElement *v131;
  _GCDevicePhysicalInputButtonElement *v132;
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
  _GCDevicePhysicalInputButtonElement *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  objc_super v158;
  _QWORD v159[4];

  v159[2] = *MEMORY[0x24BDAC8D0];
  v3 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3);
  if (v3)
  {
    v4 = v3;
    IOHIDDeviceGetProperty(v3, CFSTR("VendorID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDDeviceGetProperty(v4, CFSTR("ProductID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "unsignedIntValue") == 1133
      && objc_msgSend(v6, "unsignedIntValue") == 49774)
    {
      v142 = v6;
      v143 = v5;
      v7 = 0;
    }
    else if (objc_msgSend(v5, "unsignedIntValue") == 1133
           && objc_msgSend(v6, "unsignedIntValue") == 49766)
    {
      v142 = v6;
      v143 = v5;
      v7 = 1;
    }
    else if (objc_msgSend(v5, "unsignedIntValue") == 1133
           && objc_msgSend(v6, "unsignedIntValue") == 49762)
    {
      v142 = v6;
      v143 = v5;
      v7 = 2;
    }
    else
    {
      if (objc_msgSend(v5, "unsignedIntValue") != 1133
        || objc_msgSend(v6, "unsignedIntValue") != 49743)
      {
        CFRelease(v4);
        v8 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v142 = v6;
      v143 = v5;
      v7 = 3;
    }
    self->_mode = v7;
    self->_device = (__IOHIDDevice *)CFRetain(v4);
    v9 = (OS_dispatch_queue *)dispatch_queue_create("LogitechRacingWheel", 0);
    queue = self->_queue;
    self->_queue = v9;

    v11 = (NSArray *)objc_opt_new();
    eventObservers = self->_eventObservers;
    self->_eventObservers = v11;

    IOHIDDeviceRegisterInputReportWithTimeStampCallback(v4, &self->_report.g920.reportID, 64, (IOHIDReportWithTimeStampCallback)HandleReport, self);
    IOHIDDeviceSetDispatchQueue(v4, (dispatch_queue_t)self->_queue);
    v13 = (void *)objc_opt_new();
    v14 = v13;
    if (self->_mode >= 2u)
      v15 = CFSTR("Logitech DRIVING FORCE");
    else
      v15 = CFSTR("Logitech TRUEFORCE");
    objc_msgSend(v13, "setProductCategory:", v15);
    v141 = v14;
    objc_msgSend(v14, "setVendorName:", IOHIDDeviceGetProperty(v4, CFSTR("Product")));
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputDirectionPadElementParameters, "parametersWithIdentifier:", CFSTR("dpad"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v16, v17);

    _GCFConvertStringToLocalizedString();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v16, v18);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v16, v19);

    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventUpValueField:]((uint64_t)v16, 0);
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventDownValueField:]((uint64_t)v16, 1);
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventLeftValueField:]((uint64_t)v16, 2);
    v156 = v16;
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventRightValueField:]((uint64_t)v16, 3);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.a"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v20, v21);

    _GCFConvertStringToLocalizedString();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v20, v22);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v20, v23);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v20, 0);
    v155 = v20;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v20, 4);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.b"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
    v25 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v24, v25);

    _GCFConvertStringToLocalizedString();
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v24, v26);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v24, v27);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v24, 0);
    v154 = v24;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v24, 5);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.x"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v28, v29);

    _GCFConvertStringToLocalizedString();
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v28, v30);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v28, v31);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v28, 0);
    v153 = v28;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v28, 6);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.y"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
    v33 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v32, v33);

    _GCFConvertStringToLocalizedString();
    v34 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v32, v34);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v32, v35);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v32, 0);
    v152 = v32;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v32, 7);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.l2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
    v37 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v36, v37);

    _GCFConvertStringToLocalizedString();
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v36, v38);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v36, 0);
    v146 = v36;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v36, 18);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.r2"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
    v40 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v39, v40);

    _GCFConvertStringToLocalizedString();
    v41 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v39, v41);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v39, 0);
    v145 = v39;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v39, 19);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.l3"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
    v43 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v42, v43);

    _GCFConvertStringToLocalizedString();
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v42, v44);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v42, 0);
    v151 = v42;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v42, 20);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.r3"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v45, v46);

    _GCFConvertStringToLocalizedString();
    v47 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v45, v47);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v45, 0);
    v150 = v45;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v45, 21);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("leftPaddle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Paddle"), CFSTR("Left Shoulder"), 0);
    v49 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v48, v49);

    _GCFConvertStringToLocalizedString();
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v48, v50);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v48, 0);
    v149 = v48;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v48, 8);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("rightPaddle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Paddle"), CFSTR("Right Shoulder"), 0);
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v51, v52);

    _GCFConvertStringToLocalizedString();
    v53 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v51, v53);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v51, 0);
    v148 = v51;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v51, 9);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.home"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
    v55 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v54, v55);

    _GCFConvertStringToLocalizedString();
    v56 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v54, v56);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v54, v57);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v54, 0);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v54, 22);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.menu"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
    v59 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v58, v59);

    _GCFConvertStringToLocalizedString();
    v60 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v58, v60);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
    v61 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v58, v61);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v58, 0);
    v144 = v58;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v58, 23);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.options"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
    v63 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v62, v63);

    _GCFConvertStringToLocalizedString();
    v64 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v62, v64);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("ellipsis.circle"));
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v62, v65);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v62, 0);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v62, 24);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("button.share"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
    v67 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v66, v67);

    _GCFConvertStringToLocalizedString();
    v68 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v66, v68);

    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("square.and.arrow.up"));
    v69 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v66, v69);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v66, 0);
    v139 = v66;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v66, 40);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("pedal.accelerator"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Accelerator Pedal"));
    v71 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v70, v71);

    _GCFConvertStringToLocalizedString();
    v72 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v70, v72);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v70, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v70, 25);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("pedal.brake"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Brake Pedal"));
    v74 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v73, v74);

    _GCFConvertStringToLocalizedString();
    v75 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v73, v75);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v73, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v73, 26);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("pedal.clutch"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Clutch Pedal"));
    v77 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v76, v77);

    _GCFConvertStringToLocalizedString();
    v78 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v76, v78);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v76, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v76, 27);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCSteeringWheelElementParameters, "parametersWithIdentifier:", CFSTR("wheel"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Steering Wheel"));
    v80 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v79, v80);

    _GCFConvertStringToLocalizedString();
    v81 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v79, v81);

    -[_GCSteeringWheelElementParameters setMaximumDegreesOfRotation:]((uint64_t)v79, 900.0);
    -[_GCSteeringWheelElementParameters setEventRotationValueField:]((uint64_t)v79, 28);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCGearShifterElementParameters, "parametersWithIdentifier:", CFSTR("shifter"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Shifter"));
    v83 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v82, v83);

    -[_GCGearShifterElementParameters setPatternShifter:]((uint64_t)v82, 1);
    -[_GCGearShifterElementParameters setPositionRange:]((uint64_t)v82, -1, 8);
    _GCFConvertStringToLocalizedString();
    v84 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v82, v84);

    -[_GCGearShifterElementParameters setEventShifterValueField:]((uint64_t)v82, 29);
    v133 = (void *)objc_opt_new();
    v140 = v54;
    v137 = v73;
    v138 = v70;
    v135 = v79;
    v136 = v76;
    v134 = v82;
    if (self->_mode)
    {
      v131 = -[_GCDevicePhysicalInputDirectionPadElement initWithParameters:]([_GCDevicePhysicalInputDirectionPadElement alloc], "initWithParameters:", v156);
      v129 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v155);
      v127 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v154);
      v120 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v153);
      v125 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v152);
      v118 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v146);
      v116 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v145);
      v114 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v151);
      v112 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v150);
      v124 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v149);
      v110 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v148);
      v108 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v54);
      v85 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v70);
      v86 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v73);
      v87 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v76);
      v88 = -[GCGearShifterElement initWithParameters:]([GCGearShifterElement alloc], "initWithParameters:", v82);
      v89 = -[GCSteeringWheelElement initWithParameters:]([GCSteeringWheelElement alloc], "initWithParameters:", v79);
      +[NSMutableSet setWithObjects:](&off_254DEBF30, "setWithObjects:", v131, v129, v127, v120, v125, v118, v116, v114, v112, v124, v110, v108, v85, v86, v87, v88, v89,
        0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_mode == 2)
      {
        v91 = v145;
        v90 = v146;
        v92 = v144;
        v93 = v139;
        v94 = v122;
LABEL_25:
        v102 = -[_GCDevicePhysicalInput initWithFacade:elements:]([_GCDevicePhysicalInput alloc], "initWithFacade:elements:", v133, v94);
        v103 = -[_GCDevicePhysicalInputComponent initWithIdentifier:defaultPhysicalInput:]([_GCDevicePhysicalInputComponent alloc], "initWithIdentifier:defaultPhysicalInput:", &stru_24D2B85A8, v102);
        -[_GCDevicePhysicalInputComponent setGamepadEventSource:](v103, "setGamepadEventSource:", self);

        v159[0] = v141;
        v159[1] = v103;
        +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v159, 2);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v158.receiver = self;
        v158.super_class = (Class)_GCLogitechRacingWheel;
        v105 = -[GCRacingWheel initWithComponents:](&v158, sel_initWithComponents_, v104);

        IOHIDDeviceActivate(v105->_device);
        v8 = v105;

        self = v8;
        v6 = v142;
        v5 = v143;
        goto LABEL_26;
      }
      v101 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v62);
      v94 = v122;
      objc_msgSend(v122, "addObject:", v101);

      v93 = v139;
      v99 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v139);
      objc_msgSend(v122, "addObject:", v99);
      v92 = v144;
      v91 = v145;
    }
    else
    {
      v123 = -[_GCDevicePhysicalInputDirectionPadElement initWithParameters:]([_GCDevicePhysicalInputDirectionPadElement alloc], "initWithParameters:", v156);
      v147 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v155);
      v132 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v154);
      v130 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v153);
      v128 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v152);
      v121 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v151);
      v119 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v150);
      v117 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v149);
      v115 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v148);
      v126 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v54);
      v111 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v144);
      v109 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v62);
      v113 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v70);
      v107 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v73);
      v95 = -[_GCDevicePhysicalInputButtonElement initWithParameters:]([_GCDevicePhysicalInputButtonElement alloc], "initWithParameters:", v76);
      v96 = -[GCGearShifterElement initWithParameters:]([GCGearShifterElement alloc], "initWithParameters:", v82);
      v97 = [GCSteeringWheelElement alloc];
      v98 = v79;
      v99 = (_GCDevicePhysicalInputButtonElement *)v123;
      v100 = -[GCSteeringWheelElement initWithParameters:](v97, "initWithParameters:", v98);
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v123, v147, v132, v130, v128, v121, v119, v117, v115, v126, v111, v109, v113, v107, v95, v96, v100,
        0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v92 = v144;
      v91 = v145;
      v93 = v139;
    }

    v90 = v146;
    goto LABEL_25;
  }
  v8 = 0;
LABEL_27:

  return v8;
}

- (void)dealloc
{
  __IOHIDDevice *device;
  objc_super v4;

  device = self->_device;
  if (device)
  {
    IOHIDDeviceClose(device, 0);
    CFRelease(self->_device);
    self->_device = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_GCLogitechRacingWheel;
  -[_GCLogitechRacingWheel dealloc](&v4, sel_dealloc);
}

- (BOOL)acquireDeviceWithError:(id *)a3
{
  IOReturn v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL result;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __IOHIDDevice *device;
  NSObject *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _BYTE report[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      device = self->_device;
      *(_DWORD *)report = 138412290;
      *(_QWORD *)&report[4] = device;
      _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "Aquire device: %@", report, 0xCu);
    }

  }
  v5 = IOHIDDeviceOpen(self->_device, 0);
  if (v5)
  {
    if (a3)
    {
      v6 = v5;
      v7 = *MEMORY[0x24BDD0FD8];
      v17[0] = *MEMORY[0x24BDD0FC8];
      v17[1] = v7;
      v18[0] = CFSTR("Aquire device failed");
      v18[1] = CFSTR("Failed to open device");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("IOKitErrorDomain"), v6, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  if (self->_mode == 3)
  {
    *(_DWORD *)&report[3] = 0;
    *(_DWORD *)report = 1016;
    if (IOHIDDeviceSetReport(self->_device, kIOHIDReportTypeOutput, 248, report, 7))
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[_GCLogitechRacingWheel acquireDeviceWithError:].cold.1();

        if (!a3)
          return 0;
      }
      else if (!a3)
      {
        return 0;
      }
      v10 = *MEMORY[0x24BDD0FD8];
      v15[0] = *MEMORY[0x24BDD0FC8];
      v15[1] = v10;
      v16[0] = CFSTR("Aquire device failed");
      v16[1] = CFSTR("Failed to switch wheel mode to 900 degrses.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("IOKitErrorDomain"), 0, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  result = 1;
  self->_isOpen = 1;
  return result;
}

- (void)relinquishDevice
{
  IOHIDDeviceClose(self->_device, 0);
  self->_isOpen = 0;
}

- (BOOL)isAcquired
{
  return self->_isOpen;
}

- (id)observeGamepadEvents:(id)a3
{
  const char *v4;
  void *v5;
  id i;
  id v7;
  void *v8;
  char v9;
  const char *v10;
  id Property;
  void *v12;
  void *v13;
  const char *v14;
  _GCObservation *v15;
  id v16;
  _GCObservation *v17;
  _QWORD v19[5];
  id v20;

  v5 = (void *)objc_msgSend(a3, "copy");
  if (!self)
    goto LABEL_9;
LABEL_2:
  for (i = objc_getProperty(self, v4, 144, 1); ; i = 0)
  {
    v7 = i;
    v8 = (void *)MEMORY[0x2199DEBB0](v5);
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if ((v9 & 1) != 0)
      break;
    if (self)
      Property = objc_getProperty(self, v10, 144, 1);
    else
      Property = 0;
    v12 = (void *)objc_msgSend(Property, "mutableCopy");
    v13 = (void *)MEMORY[0x2199DEBB0](v5);
    objc_msgSend(v12, "addObject:", v13);

    if (self)
      objc_setProperty_atomic_copy(self, v14, v12, 144);

    if (self)
      goto LABEL_2;
LABEL_9:
    ;
  }
  v15 = [_GCObservation alloc];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47___GCLogitechRacingWheel_observeGamepadEvents___block_invoke;
  v19[3] = &unk_24D2B2AD0;
  v19[4] = self;
  v20 = v5;
  v16 = v5;
  v17 = -[_GCObservation initWithCleanupHandler:](v15, "initWithCleanupHandler:", v19);

  return v17;
}

- (id)eventObservers
{
  if (result)
    return objc_getProperty(result, a2, 144, 1);
  return result;
}

- (void)setEventObservers:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)acquireDeviceWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_215181000, v0, OS_LOG_TYPE_ERROR, "Error issuing wheel mode switch command: %{mach.errno}d", v1, 8u);
  OUTLINED_FUNCTION_2_2();
}

@end
