@implementation GCExtendedGamepad

- (GCExtendedGamepad)initWithController:(id)a3 initInfo:(id *)a4
{
  id v6;
  GCExtendedGamepad *v7;
  GCExtendedGamepad *v8;

  v6 = a3;
  v7 = -[GCExtendedGamepad initWithInfo:](self, "initWithInfo:", a4);
  v8 = v7;
  if (v7)
    -[GCPhysicalInputProfile setController:](v7, "setController:", v6);

  return v8;
}

- (GCExtendedGamepad)initWithController:(id)a3
{
  id v4;
  GCExtendedGamepad *v5;
  uint64_t i;
  _OWORD v8[100];

  v4 = a3;
  memset(v8, 0, 512);
  GCExtendedGamepadInitInfoMake(v8);
  v5 = -[GCExtendedGamepad initWithController:initInfo:](self, "initWithController:initInfo:", v4, v8);
  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v8 + i));

  return v5;
}

- (id)productCategory
{
  return CFSTR("MFi");
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  void *v4;
  int Type;
  GCExtendedGamepad *v6;
  uint64_t IntegerValue;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GCExtendedGamepad *v21;
  _QWORD *DataValue;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t i;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  GCControllerDirectionPad *v76;
  id v77;
  id v78;
  void *v79;
  double v80;
  char v81;
  void *v82;
  double v83;
  int v84;
  float v85;
  float v86;
  GCControllerDirectionPad *v87;
  id v88;
  id v89;
  void *v90;
  double v91;
  char v92;
  void *v93;
  double v94;
  int v95;
  float v96;
  GCControllerDirectionPad *v97;
  id v98;
  void *v99;
  double v100;
  char v101;
  void *v102;
  double v103;
  int v104;
  float v105;
  GCControllerButtonInput *v106;
  id v107;
  double v108;
  float v109;
  GCControllerButtonInput *v110;
  id v111;
  double v112;
  float v113;
  GCControllerButtonInput *v114;
  id v115;
  double v116;
  float v117;
  GCControllerButtonInput *v118;
  id v119;
  double v120;
  float v121;
  GCControllerButtonInput *v122;
  id v123;
  double v124;
  float v125;
  GCControllerButtonInput *v126;
  id v127;
  double v128;
  float v129;
  GCControllerButtonInput *v130;
  id v131;
  double v132;
  GCControllerButtonInput *v133;
  id v134;
  double v135;
  GCControllerButtonInput *leftThumbstickButton;
  GCControllerButtonInput *v137;
  id v138;
  double v139;
  GCControllerButtonInput *rightThumbstickButton;
  GCControllerButtonInput *v141;
  id v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t m;
  uint64_t v149;
  uint64_t v150;
  float v151;
  void *v152;
  void *v153;
  double v154;
  int v155;
  void *v156;
  NSObject *v157;
  float v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  float v169;
  void *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _QWORD v175[4];
  GCExtendedGamepad *v176;
  uint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  __int128 block;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _QWORD v191[4];
  GCExtendedGamepad *v192;
  id v193;
  uint64_t v194;

  v194 = *MEMORY[0x24BDAC8D0];
  +[NSDate date](&off_254DF6DA0, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  -[GCPhysicalInputProfile setLastEventTimestamp:](self, "setLastEventTimestamp:");

  Type = IOHIDEventGetType();
  if (Type != 35)
  {
    if (Type != 3)
      return;
    v6 = self;
    if (IOHIDEventGetIntegerValue() != 12)
      goto LABEL_97;
    IntegerValue = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == v6->_buttonMenuUsage)
    {
      -[GCExtendedGamepad buttonMenu](v6, "buttonMenu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == 1 && (objc_msgSend(v9, "isPressed") & 1) == 0)
      {
        -[GCPhysicalInputProfile controller](v6, "controller");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handlerQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&block = MEMORY[0x24BDAC760];
        *((_QWORD *)&block + 1) = 3221225472;
        *(_QWORD *)&v188 = __handleAncillaryButtonEvent_block_invoke;
        *((_QWORD *)&v188 + 1) = &unk_24D2B2B20;
        *(_QWORD *)&v189 = v6;
        dispatch_async(v12, &block);

      }
    }
    else
    {
      if (IntegerValue == v6->_buttonHomeUsage)
      {
        -[GCExtendedGamepad buttonHome](v6, "buttonHome");
        v150 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (IntegerValue != v6->_buttonOptionsUsage)
        {
          v10 = 0;
LABEL_96:

LABEL_97:
          return;
        }
        -[GCExtendedGamepad buttonOptions](v6, "buttonOptions");
        v150 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (id)v150;
    }
    if (v10)
    {
      v151 = (float)v8;
      -[GCPhysicalInputProfile controller](v6, "controller");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "handlerQueue");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v154 = v151;
      v155 = objc_msgSend(v10, "_setValue:queue:", v153, v154);

      if (v155)
      {
        -[GCPhysicalInputProfile controller](v6, "controller");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "handlerQueue");
        v157 = objc_claimAutoreleasedReturnValue();
        v191[0] = MEMORY[0x24BDAC760];
        v191[1] = 3221225472;
        v191[2] = __handleAncillaryButtonEvent_block_invoke_70;
        v191[3] = &unk_24D2B2B48;
        v192 = v6;
        v10 = v10;
        v193 = v10;
        dispatch_async(v157, v191);

      }
    }
    goto LABEL_96;
  }
  IOHIDEventGetChildren();
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
  v170 = v13;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v172;
LABEL_10:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v172 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * v17);
      v19 = IOHIDEventGetIntegerValue();
      v20 = IOHIDEventGetIntegerValue();
      if (v19 == 65280 && v20 == 67)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v171, v186, 16);
        if (v15)
          goto LABEL_10;
        goto LABEL_17;
      }
    }

    if (!v18)
      goto LABEL_42;
    v21 = self;
    DataValue = (_QWORD *)IOHIDEventGetDataValue();
    +[NSMutableSet set](&off_254DEBF30, "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](v21, "controller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handlerQueue");
    v25 = objc_claimAutoreleasedReturnValue();

    for (i = 0; i != 47; ++i)
    {
      if (((*DataValue >> i) & 1) != 0)
      {
        -[GCPhysicalInputProfile remappedElementForIndex:](v21, "remappedElementForIndex:", i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        if (v27)
        {
          LODWORD(v28) = *((_DWORD *)DataValue + i + 2);
          objc_msgSend(v27, "_setPendingValue:", v28);
          objc_msgSend(v29, "collection");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v29, "collection");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v31);

          }
          else
          {
            objc_msgSend(v23, "addObject:", v29);
          }
        }

      }
    }
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v32 = v23;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v182, v191, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v183;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v183 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * j), "_commitPendingValueOnQueue:", v25);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v182, v191, 16);
      }
      while (v34);
    }

    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v37 = v32;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v178, &block, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v179;
      v41 = MEMORY[0x24BDAC760];
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v179 != v40)
            objc_enumerationMutation(v37);
          v43 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * k);
          v175[0] = v41;
          v175[1] = 3221225472;
          v175[2] = __handleGameControllerExtendedEvent_block_invoke;
          v175[3] = &unk_24D2B2B48;
          v176 = v21;
          v177 = v43;
          dispatch_async(v25, v175);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v178, &block, 16);
      }
      while (v39);
    }
  }
  else
  {
LABEL_17:

LABEL_42:
    v21 = self;
    +[NSMutableArray array](&off_254DEBB20, "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](v21, "controller");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handlerQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDEventGetFloatValue();
    v48 = v47;
    IOHIDEventGetFloatValue();
    v50 = v49;
    IOHIDEventGetFloatValue();
    v52 = v51;
    IOHIDEventGetFloatValue();
    v54 = v53;
    IOHIDEventGetFloatValue();
    v56 = v55;
    IOHIDEventGetFloatValue();
    v58 = v57;
    IOHIDEventGetFloatValue();
    v160 = v59;
    IOHIDEventGetFloatValue();
    v159 = v60;
    IOHIDEventGetFloatValue();
    v161 = v61;
    IOHIDEventGetFloatValue();
    v162 = v62;
    IOHIDEventGetFloatValue();
    v163 = v63;
    IOHIDEventGetFloatValue();
    v164 = v64;
    IOHIDEventGetFloatValue();
    v165 = v65;
    IOHIDEventGetFloatValue();
    v166 = v66;
    IOHIDEventGetFloatValue();
    v167 = v67;
    IOHIDEventGetFloatValue();
    v168 = v68;
    v69 = 0.0;
    v169 = 0.0;
    if (v21->_leftThumbstickButton)
      v69 = (float)IOHIDEventGetIntegerValue();
    v158 = v69;
    v71 = v50;
    v73 = v54;
    if (v21->_rightThumbstickButton)
      v169 = (float)IOHIDEventGetIntegerValue();
    v76 = v21->_dpad;
    v77 = v46;
    v78 = v44;
    -[GCControllerDirectionPad xAxis](v76, "xAxis");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v52;
    *(float *)&v80 = v73 - v72;
    v81 = objc_msgSend(v79, "_setValue:queue:", v77, v80);

    -[GCControllerDirectionPad yAxis](v76, "yAxis");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v48;
    *(float *)&v83 = v70 - v71;
    v84 = objc_msgSend(v82, "_setValue:queue:", v77, v83);

    if ((v81 & 1) != 0 || v84)
      objc_msgSend(v78, "addObject:", v76);

    v87 = v21->_leftThumbstick;
    v88 = v77;
    v89 = v78;
    -[GCControllerDirectionPad xAxis](v87, "xAxis");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v56;
    *(float *)&v91 = v74;
    v92 = objc_msgSend(v90, "_setValue:queue:", v88, v91);

    -[GCControllerDirectionPad yAxis](v87, "yAxis");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v58;
    *(float *)&v94 = v75;
    v95 = objc_msgSend(v93, "_setValue:queue:", v88, v94);

    if ((v92 & 1) != 0 || v95)
      objc_msgSend(v89, "addObject:", v87);

    v97 = v21->_rightThumbstick;
    v25 = v88;
    v98 = v89;
    -[GCControllerDirectionPad xAxis](v97, "xAxis");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v160;
    *(float *)&v100 = v85;
    v101 = objc_msgSend(v99, "_setValue:queue:", v25, v100);

    -[GCControllerDirectionPad yAxis](v97, "yAxis");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v159;
    *(float *)&v103 = v86;
    v104 = objc_msgSend(v102, "_setValue:queue:", v25, v103);

    if ((v101 & 1) != 0 || v104)
      objc_msgSend(v98, "addObject:", v97);

    v106 = v21->_button0;
    v107 = v98;
    v96 = v161;
    *(float *)&v108 = v96;
    if (-[GCControllerButtonInput _setValue:queue:](v106, "_setValue:queue:", v25, v108))
      objc_msgSend(v107, "addObject:", v106);

    v110 = v21->_button1;
    v111 = v107;
    v105 = v162;
    *(float *)&v112 = v105;
    if (-[GCControllerButtonInput _setValue:queue:](v110, "_setValue:queue:", v25, v112))
      objc_msgSend(v111, "addObject:", v110);

    v114 = v21->_button2;
    v115 = v111;
    v109 = v163;
    *(float *)&v116 = v109;
    if (-[GCControllerButtonInput _setValue:queue:](v114, "_setValue:queue:", v25, v116))
      objc_msgSend(v115, "addObject:", v114);

    v118 = v21->_button3;
    v119 = v115;
    v113 = v164;
    *(float *)&v120 = v113;
    if (-[GCControllerButtonInput _setValue:queue:](v118, "_setValue:queue:", v25, v120))
      objc_msgSend(v119, "addObject:", v118);

    v122 = v21->_leftShoulder;
    v123 = v119;
    v117 = v165;
    *(float *)&v124 = v117;
    if (-[GCControllerButtonInput _setValue:queue:](v122, "_setValue:queue:", v25, v124))
      objc_msgSend(v123, "addObject:", v122);

    v126 = v21->_rightShoulder;
    v127 = v123;
    v121 = v166;
    *(float *)&v128 = v121;
    if (-[GCControllerButtonInput _setValue:queue:](v126, "_setValue:queue:", v25, v128))
      objc_msgSend(v127, "addObject:", v126);

    v130 = v21->_leftTrigger;
    v131 = v127;
    v125 = v167;
    *(float *)&v132 = v125;
    if (-[GCControllerButtonInput _setValue:queue:](v130, "_setValue:queue:", v25, v132))
      objc_msgSend(v131, "addObject:", v130);

    v133 = v21->_rightTrigger;
    v134 = v131;
    v129 = v168;
    *(float *)&v135 = v129;
    if (-[GCControllerButtonInput _setValue:queue:](v133, "_setValue:queue:", v25, v135))
      objc_msgSend(v134, "addObject:", v133);

    leftThumbstickButton = v21->_leftThumbstickButton;
    if (leftThumbstickButton)
    {
      v137 = leftThumbstickButton;
      v138 = v134;
      *(float *)&v139 = v158;
      if (-[GCControllerButtonInput _setValue:queue:](v137, "_setValue:queue:", v25, v139))
        objc_msgSend(v138, "addObject:", v137);

    }
    rightThumbstickButton = v21->_rightThumbstickButton;
    if (rightThumbstickButton)
    {
      v141 = rightThumbstickButton;
      v142 = v134;
      *(float *)&v143 = v169;
      if (-[GCControllerButtonInput _setValue:queue:](v141, "_setValue:queue:", v25, v143))
        objc_msgSend(v142, "addObject:", v141);

    }
    v189 = 0u;
    v190 = 0u;
    block = 0u;
    v188 = 0u;
    v37 = v134;
    v144 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &block, v191, 16);
    if (v144)
    {
      v145 = v144;
      v146 = *(_QWORD *)v188;
      v147 = MEMORY[0x24BDAC760];
      do
      {
        for (m = 0; m != v145; ++m)
        {
          if (*(_QWORD *)v188 != v146)
            objc_enumerationMutation(v37);
          v149 = *(_QWORD *)(*((_QWORD *)&block + 1) + 8 * m);
          *(_QWORD *)&v182 = v147;
          *((_QWORD *)&v182 + 1) = 3221225472;
          *(_QWORD *)&v183 = __handleGameControllerEvent_block_invoke;
          *((_QWORD *)&v183 + 1) = &unk_24D2B2B48;
          *(_QWORD *)&v184 = v21;
          *((_QWORD *)&v184 + 1) = v149;
          dispatch_async(v25, &v182);

        }
        v145 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &block, v191, 16);
      }
      while (v145);
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCExtendedGamepad)initWithIdentifier:(id)a3
{
  id v4;
  uint64_t i;
  GCExtendedGamepad *v6;
  uint64_t j;
  _OWORD v9[100];

  v4 = a3;
  memset(v9, 0, 512);
  GCExtendedGamepadInitInfoMake(v9);
  for (i = 8; i != 1592; i += 72)
    *((_BYTE *)v9 + i) = 1;
  v6 = -[GCExtendedGamepad initWithIdentifier:info:](self, "initWithIdentifier:info:", v4, v9);
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v9 + j));

  return v6;
}

- (GCExtendedGamepad)initWithInfo:(id *)a3
{
  void *v5;
  GCExtendedGamepad *v6;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCExtendedGamepad initWithIdentifier:info:](self, "initWithIdentifier:info:", v5, a3);

  return v6;
}

- (GCExtendedGamepad)initWithIdentifier:(id)a3 info:(id *)a4
{
  GCExtendedGamepad *v5;
  uint64_t v6;
  GCControllerDirectionPad *dpad;
  uint64_t v8;
  GCControllerDirectionPad *leftThumbstick;
  uint64_t v10;
  GCControllerDirectionPad *rightThumbstick;
  uint64_t v12;
  GCControllerButtonInput *button0;
  uint64_t v14;
  GCControllerButtonInput *button1;
  uint64_t v16;
  GCControllerButtonInput *button2;
  uint64_t v18;
  GCControllerButtonInput *button3;
  uint64_t v20;
  GCControllerButtonInput *leftShoulder;
  uint64_t v22;
  GCControllerButtonInput *rightShoulder;
  uint64_t v24;
  GCControllerButtonInput *leftTrigger;
  uint64_t v26;
  GCControllerButtonInput *rightTrigger;
  uint64_t v28;
  GCControllerButtonInput *leftThumbstickButton;
  uint64_t v30;
  GCControllerButtonInput *rightThumbstickButton;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE v39[72];
  _BYTE v40[72];
  _BYTE v41[72];
  _BYTE v42[72];
  _BYTE v43[72];
  _BYTE v44[72];
  _BYTE v45[72];
  _BYTE v46[72];
  _BYTE v47[72];
  _BYTE v48[72];
  _BYTE v49[72];
  _BYTE v50[72];
  _BYTE v51[72];
  _BYTE v52[72];
  _BYTE v53[72];
  _BYTE v54[72];
  _BYTE v55[72];
  _BYTE v56[72];
  _BYTE v57[72];
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)GCExtendedGamepad;
  v5 = -[GCPhysicalInputProfile initWithIdentifier:](&v58, sel_initWithIdentifier_, a3);
  if (v5)
  {
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v57, (uint64_t)a4);
    -[GCPhysicalInputProfile _directionPadWithInfo:](v5, "_directionPadWithInfo:", v57);
    v6 = objc_claimAutoreleasedReturnValue();
    dpad = v5->_dpad;
    v5->_dpad = (GCControllerDirectionPad *)v6;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v56, (uint64_t)&a4->var0[5]);
    -[GCPhysicalInputProfile _directionPadWithInfo:](v5, "_directionPadWithInfo:", v56);
    v8 = objc_claimAutoreleasedReturnValue();
    leftThumbstick = v5->_leftThumbstick;
    v5->_leftThumbstick = (GCControllerDirectionPad *)v8;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v55, (uint64_t)&a4->var0[6]);
    -[GCPhysicalInputProfile _directionPadWithInfo:](v5, "_directionPadWithInfo:", v55);
    v10 = objc_claimAutoreleasedReturnValue();
    rightThumbstick = v5->_rightThumbstick;
    v5->_rightThumbstick = (GCControllerDirectionPad *)v10;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v54, (uint64_t)&a4->var0[1]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v54);
    v12 = objc_claimAutoreleasedReturnValue();
    button0 = v5->_button0;
    v5->_button0 = (GCControllerButtonInput *)v12;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v53, (uint64_t)&a4->var0[2]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v53);
    v14 = objc_claimAutoreleasedReturnValue();
    button1 = v5->_button1;
    v5->_button1 = (GCControllerButtonInput *)v14;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v52, (uint64_t)&a4->var0[3]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v52);
    v16 = objc_claimAutoreleasedReturnValue();
    button2 = v5->_button2;
    v5->_button2 = (GCControllerButtonInput *)v16;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v51, (uint64_t)&a4->var0[4]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v51);
    v18 = objc_claimAutoreleasedReturnValue();
    button3 = v5->_button3;
    v5->_button3 = (GCControllerButtonInput *)v18;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v50, (uint64_t)&a4->var0[7]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v50);
    v20 = objc_claimAutoreleasedReturnValue();
    leftShoulder = v5->_leftShoulder;
    v5->_leftShoulder = (GCControllerButtonInput *)v20;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v49, (uint64_t)&a4->var0[8]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v49);
    v22 = objc_claimAutoreleasedReturnValue();
    rightShoulder = v5->_rightShoulder;
    v5->_rightShoulder = (GCControllerButtonInput *)v22;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v48, (uint64_t)&a4->var0[9]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v48);
    v24 = objc_claimAutoreleasedReturnValue();
    leftTrigger = v5->_leftTrigger;
    v5->_leftTrigger = (GCControllerButtonInput *)v24;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v47, (uint64_t)&a4->var0[10]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v47);
    v26 = objc_claimAutoreleasedReturnValue();
    rightTrigger = v5->_rightTrigger;
    v5->_rightTrigger = (GCControllerButtonInput *)v26;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v46, (uint64_t)&a4->var0[11]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v46);
    v28 = objc_claimAutoreleasedReturnValue();
    leftThumbstickButton = v5->_leftThumbstickButton;
    v5->_leftThumbstickButton = (GCControllerButtonInput *)v28;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v45, (uint64_t)&a4->var0[12]);
    -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v45);
    v30 = objc_claimAutoreleasedReturnValue();
    rightThumbstickButton = v5->_rightThumbstickButton;
    v5->_rightThumbstickButton = (GCControllerButtonInput *)v30;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v44, (uint64_t)&a4->var0[16]);
    v32 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v44);
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v43, (uint64_t)&a4->var0[17]);
    v33 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v43);
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v42, (uint64_t)&a4->var0[18]);
    v34 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v42);
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v41, (uint64_t)&a4->var0[19]);
    v35 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v41);
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v40, (uint64_t)&a4->var0[20]);
    v36 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v40);
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v39, (uint64_t)&a4->var0[21]);
    v37 = -[GCPhysicalInputProfile _buttonWithInfo:](v5, "_buttonWithInfo:", v39);
    -[GCExtendedGamepad initAuxiliaryButtonsWithInitInfo:](v5, "initAuxiliaryButtonsWithInitInfo:", a4);
    -[GCExtendedGamepad initShareFunctionalityWithInitInfo:](v5, "initShareFunctionalityWithInitInfo:", a4);
  }
  return v5;
}

- (GCExtendedGamepad)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t i;
  _QWORD *v11;
  GCExtendedGamepad *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;

  v5 = a3;
  GCIPCObjectIdentifier_Classes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v8 = objc_retainAutorelease(v5);
  v9 = (_QWORD *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("initInfo"), &v19);
  if (v19 != 1592)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCExtendedGamepad.m"), 314, CFSTR("Serialization bug."));

  }
  for (i = 0; i != 198; i += 9)
  {
    v11 = &v9[i];
    *v11 = 0;
    v11[6] = 0;
    v11[7] = 0;
  }
  GCExtendedGamepadInitInfoPopulateNames((uint64_t)v9);
  v12 = -[GCExtendedGamepad initWithIdentifier:info:](self, "initWithIdentifier:info:", v7, v9);
  v13 = (void *)v9[170];
  v9[170] = 0;

  v14 = (void *)v9[179];
  v9[179] = 0;

  v15 = (void *)v9[188];
  v9[188] = 0;

  v16 = (void *)v9[197];
  v9[197] = 0;

  -[GCPhysicalInputProfile setGlyphFlags:](v12, "setGlyphFlags:", objc_msgSend(v8, "decodeInt64ForKey:", CFSTR("glyphFlags")));
  -[GCExtendedGamepad applyGlyphFlags](v12, "applyGlyphFlags");

  return v12;
}

- (void)applyGlyphFlags
{
  void *v3;
  void *v4;
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
  void *v19;
  const __CFString *v20;
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
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;

  if ((-[GCPhysicalInputProfile glyphFlags](self, "glyphFlags") & 1) != 0)
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Button A"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_A"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Button B"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_B"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Button X"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_X"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Button Y"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_Y"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Button A"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setUnmappedSfSymbolsName:", CFSTR("xmark.circle"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Button B"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setUnmappedSfSymbolsName:", CFSTR("circle.circle"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Button X"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setUnmappedSfSymbolsName:", CFSTR("square.circle"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Button Y"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("triangle.circle");
  }
  else
  {
    if ((-[GCPhysicalInputProfile glyphFlags](self, "glyphFlags") & 4) == 0)
      goto LABEL_6;
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Left Trigger"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_LEFT_TRIGGER"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Right Trigger"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_RIGHT_TRIGGER"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Left Shoulder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_LEFT_SHOULDER"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Right Shoulder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_RIGHT_SHOULDER"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Left Trigger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnmappedSfSymbolsName:", CFSTR("lt.rectangle.roundedtop"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Right Trigger"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUnmappedSfSymbolsName:", CFSTR("rt.rectangle.roundedtop"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Left Shoulder"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUnmappedSfSymbolsName:", CFSTR("lb.rectangle.roundedbottom"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Right Shoulder"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("rb.rectangle.roundedbottom");
  }
  objc_msgSend(v18, "setUnmappedSfSymbolsName:", v20);

LABEL_6:
  if ((-[GCPhysicalInputProfile glyphFlags](self, "glyphFlags") & 2) != 0)
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Button Home"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_HOME"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Button Home"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = CFSTR("logo.playstation");
LABEL_11:
    objc_msgSend(v37, "setUnmappedSfSymbolsName:", v39);

    return;
  }
  if ((-[GCPhysicalInputProfile glyphFlags](self, "glyphFlags") & 8) != 0)
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("Button Home"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_HOME"));

    -[GCPhysicalInputProfile buttons](self, "buttons");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Button Home"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = CFSTR("logo.xbox");
    goto LABEL_11;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t i;
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
  uint64_t j;
  uint64_t v32;
  _BYTE v33[1600];

  v4 = a3;
  bzero(v33, 0x638uLL);
  v32 = +[GCExtendedGamepad version](GCExtendedGamepad, "version");
  for (i = 8; i != 1592; i += 72)
    v33[i] = 1;
  v33[800] = self->_leftThumbstickButton != 0;
  v33[872] = self->_rightThumbstickButton != 0;
  -[GCPhysicalInputProfile elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1160] = v7 != 0;

  -[GCPhysicalInputProfile elements](self, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1232] = v9 != 0;

  -[GCPhysicalInputProfile elements](self, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1304] = v11 != 0;

  -[GCPhysicalInputProfile elements](self, "elements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1376] = v13 != 0;

  -[GCPhysicalInputProfile elements](self, "elements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1448] = v15 != 0;

  -[GCPhysicalInputProfile elements](self, "elements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1520] = v17 != 0;

  v33[944] = self->_buttonHome != 0;
  v33[1088] = self->_buttonOptions != 0;
  v33[9] = -[GCControllerDirectionPad nonAnalog](self->_dpad, "nonAnalog");
  v33[369] = -[GCControllerDirectionPad nonAnalog](self->_leftThumbstick, "nonAnalog");
  v33[441] = -[GCControllerDirectionPad nonAnalog](self->_rightThumbstick, "nonAnalog");
  v33[81] = -[GCControllerButtonInput nonAnalog](self->_button0, "nonAnalog");
  v33[153] = -[GCControllerButtonInput nonAnalog](self->_button1, "nonAnalog");
  v33[225] = -[GCControllerButtonInput nonAnalog](self->_button2, "nonAnalog");
  v33[297] = -[GCControllerButtonInput nonAnalog](self->_button3, "nonAnalog");
  -[GCPhysicalInputProfile buttons](self, "buttons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1161] = objc_msgSend(v19, "nonAnalog");

  -[GCPhysicalInputProfile buttons](self, "buttons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1233] = objc_msgSend(v21, "nonAnalog");

  -[GCPhysicalInputProfile buttons](self, "buttons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1305] = objc_msgSend(v23, "nonAnalog");

  -[GCPhysicalInputProfile buttons](self, "buttons");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1377] = objc_msgSend(v25, "nonAnalog");

  -[GCPhysicalInputProfile buttons](self, "buttons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1449] = objc_msgSend(v27, "nonAnalog");

  -[GCPhysicalInputProfile buttons](self, "buttons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1521] = objc_msgSend(v29, "nonAnalog");

  v33[513] = -[GCControllerButtonInput nonAnalog](self->_leftShoulder, "nonAnalog");
  v33[585] = -[GCControllerButtonInput nonAnalog](self->_rightShoulder, "nonAnalog");
  v33[657] = -[GCControllerButtonInput nonAnalog](self->_leftTrigger, "nonAnalog");
  v33[729] = -[GCControllerButtonInput nonAnalog](self->_rightTrigger, "nonAnalog");
  v33[801] = -[GCControllerButtonInput nonAnalog](self->_leftThumbstickButton, "nonAnalog");
  v33[873] = -[GCControllerButtonInput nonAnalog](self->_rightThumbstickButton, "nonAnalog");
  v33[1017] = -[GCControllerButtonInput nonAnalog](self->_buttonMenu, "nonAnalog");
  v33[945] = -[GCControllerButtonInput nonAnalog](self->_buttonHome, "nonAnalog");
  v33[1089] = -[GCControllerButtonInput nonAnalog](self->_buttonOptions, "nonAnalog");
  v33[1585] = self->_snapshotUsagePresent;
  v33[1584] = self->_recordUsagePresent;
  -[GCExtendedGamepad populateEncodedInitInfo:](self, "populateEncodedInitInfo:", v33);
  objc_msgSend(v4, "encodeBytes:length:forKey:", v33, 1592, CFSTR("initInfo"));
  -[GCPhysicalInputProfile identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", v32, CFSTR("version"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[GCPhysicalInputProfile glyphFlags](self, "glyphFlags"), CFSTR("glyphFlags"));
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)&v33[j]);

}

- (void)initAuxiliaryButtonsWithInitInfo:(id *)a3
{
  _BOOL4 var1;
  _BOOL4 v5;
  BOOL v6;
  BOOL v7;
  GCControllerButtonInput *v8;
  GCControllerButtonInput *buttonOptions;
  GCControllerButtonInput *v10;
  GCControllerButtonInput *buttonHome;
  GCControllerButtonInput *v12;
  GCControllerButtonInput *buttonMenu;
  _BOOL4 v14;
  _BOOL4 var2;
  _BYTE v16[72];
  _BYTE v17[72];
  _BYTE v18[72];
  __CFString *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;

  var1 = a3->var0[13].var1;
  v5 = a3->var0[15].var1;
  v14 = a3->var0[14].var1;
  var2 = a3->var0[13].var2;
  v6 = a3->var0[14].var2;
  v7 = a3->var0[15].var2;
  self->_buttonHomeUsage = -1;
  self->_buttonMenuUsage = -1;
  self->_buttonOptionsUsage = -1;
  v27 = 1;
  v26 = CFSTR("Button Menu");
  BYTE1(v27) = v6;
  v29 = 0;
  v30 = 0;
  v28 = 23;
  v31 = 0x1000000000001;
  v32 = CFSTR("line.horizontal.3.circle");
  _GCFConvertStringToLocalizedString();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = 0;
  self->_buttonMenuUsage = 516;
  if (v5)
  {
    *(_QWORD *)&v20 = 1;
    v19 = CFSTR("Button Options");
    BYTE1(v20) = v7;
    v21 = 0uLL;
    *((_QWORD *)&v20 + 1) = 24;
    v22 = 0x1010000000001;
    v23 = CFSTR("ellipsis.circle");
    _GCFConvertStringToLocalizedString();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v18, (uint64_t)&v19);
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", v18);
    v8 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    buttonOptions = self->_buttonOptions;
    self->_buttonOptions = v8;

    self->_buttonOptionsUsage = 521;
    __destructor_8_s0_s48_s56_s64((id *)&v19);
  }
  if (var1)
  {
    if (v14)
    {
      v22 = 0;
      v21 = 0u;
      v20 = 0u;
      v19 = CFSTR("Button Home");
      LOBYTE(v20) = 1;
      BYTE1(v20) = var2;
      v21 = 0uLL;
      *((_QWORD *)&v20 + 1) = 22;
      LODWORD(v22) = 1;
      WORD2(v22) = 256;
      BYTE6(v22) = 1;
      v23 = CFSTR("house.circle");
      _GCFConvertStringToLocalizedString();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = 0;
      __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v17, (uint64_t)&v19);
      -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", v17);
      v10 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
      buttonHome = self->_buttonHome;
      self->_buttonHome = v10;

      self->_buttonHomeUsage = 547;
      __destructor_8_s0_s48_s56_s64((id *)&v19);
    }
    else
    {
      -[GCControllerButtonInput setNonAnalog:](self->_buttonMenu, "setNonAnalog:", var2);
      self->_buttonMenuUsage = 547;
    }
  }
  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v16, (uint64_t)&v26);
  -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", v16);
  v12 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
  buttonMenu = self->_buttonMenu;
  self->_buttonMenu = v12;

  __destructor_8_s0_s48_s56_s64((id *)&v26);
}

- (void)initShareFunctionalityWithInitInfo:(id *)a3
{
  _BOOL4 var1;
  GCControllerButtonInput *v5;
  GCControllerButtonInput *buttonShare;
  __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  __int16 v13;
  char v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;

  self->_snapshotUsagePresent = a3->var2;
  var1 = a3->var1;
  self->_recordUsagePresent = var1;
  if (var1)
  {
    v7 = CFSTR("Button Share");
    v8 = 257;
    v10 = 0;
    v11 = 0;
    v9 = 40;
    v12 = 1;
    v13 = 256;
    v14 = 1;
    v15 = CFSTR("square.and.arrow.up");
    _GCFConvertStringToLocalizedString();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v7);
    v5 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    buttonShare = self->__buttonShare;
    self->__buttonShare = v5;

  }
}

- (GCExtendedGamepadSnapshot)saveSnapshot
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  GCExtendedGamepadSnapshot *v43;
  void *v44;
  GCExtendedGamepadSnapshot *v45;
  GCExtendedGamepadSnapshotData v47;

  v47.supportsClickableThumbsticks = 0;
  v47.version = 257;
  v47.size = 63;
  -[GCExtendedGamepad dpad](self, "dpad", *(_QWORD *)&v47.version);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v47.dpadX = v5;

  -[GCExtendedGamepad dpad](self, "dpad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v47.dpadY = v8;

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v47.buttonA = v10;

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v47.buttonB = v12;

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v47.buttonX = v14;

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v47.buttonY = v16;

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "xAxis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v47.leftThumbstickX = v19;

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "yAxis");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v47.leftThumbstickY = v22;

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "xAxis");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "value");
  v47.rightThumbstickX = v25;

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "yAxis");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v47.rightThumbstickY = v28;

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "value");
  v47.leftShoulder = v30;

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v47.rightShoulder = v32;

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "value");
  v47.leftTrigger = v34;

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "value");
  v47.rightTrigger = v36;

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47.rightThumbstickButton = objc_msgSend(v37, "isPressed");

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47.leftThumbstickButton = objc_msgSend(v38, "isPressed");

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 != 0;

  }
  else
  {
    v41 = 0;
  }
  v47.supportsClickableThumbsticks = v41;

  NSDataFromGCExtendedGamepadSnapshotData(&v47);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = [GCExtendedGamepadSnapshot alloc];
  -[GCPhysicalInputProfile controller](self, "controller");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[GCExtendedGamepadSnapshot initWithController:snapshotData:](v43, "initWithController:snapshotData:", v44, v42);

  return v45;
}

- (id)name
{
  return CFSTR("ExtendedGamepad");
}

- (id)setElementValuesFromExtendedGamepad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GCControllerDirectionPad *dpad;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  GCControllerDirectionPad *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  int v24;
  GCControllerDirectionPad *leftThumbstick;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  GCControllerDirectionPad *v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  char v39;
  void *v40;
  double v41;
  int v42;
  GCControllerDirectionPad *rightThumbstick;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  GCControllerDirectionPad *v52;
  id v53;
  id v54;
  void *v55;
  double v56;
  char v57;
  void *v58;
  double v59;
  int v60;
  GCExtendedGamepad *v61;
  GCControllerButtonInput *buttonMenu;
  void *v63;
  int v64;
  int v65;
  GCControllerButtonInput *v66;
  id v67;
  double v68;
  GCControllerButtonInput *buttonHome;
  void *v70;
  int v71;
  int v72;
  GCControllerButtonInput *v73;
  id v74;
  double v75;
  GCControllerButtonInput *button0;
  void *v77;
  int v78;
  int v79;
  GCControllerButtonInput *v80;
  id v81;
  double v82;
  GCControllerButtonInput *button1;
  void *v84;
  int v85;
  int v86;
  GCControllerButtonInput *v87;
  id v88;
  double v89;
  GCControllerButtonInput *button2;
  void *v91;
  int v92;
  int v93;
  GCControllerButtonInput *v94;
  id v95;
  double v96;
  GCControllerButtonInput *button3;
  void *v98;
  int v99;
  int v100;
  GCControllerButtonInput *v101;
  id v102;
  double v103;
  GCControllerButtonInput *leftShoulder;
  void *v105;
  int v106;
  int v107;
  GCControllerButtonInput *v108;
  id v109;
  double v110;
  GCControllerButtonInput *rightShoulder;
  void *v112;
  int v113;
  int v114;
  GCControllerButtonInput *v115;
  id v116;
  double v117;
  GCControllerButtonInput *leftTrigger;
  void *v119;
  int v120;
  int v121;
  GCControllerButtonInput *v122;
  id v123;
  double v124;
  GCControllerButtonInput *rightTrigger;
  void *v126;
  int v127;
  int v128;
  GCControllerButtonInput *v129;
  id v130;
  double v131;
  void *v132;
  GCControllerButtonInput *leftThumbstickButton;
  void *v134;
  int v135;
  int v136;
  GCControllerButtonInput *v137;
  id v138;
  double v139;
  void *v140;
  GCControllerButtonInput *rightThumbstickButton;
  void *v142;
  int v143;
  int v144;
  GCControllerButtonInput *v145;
  id v146;
  double v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  int v156;
  id v157;
  id v158;
  double v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  int v169;
  id v170;
  id v171;
  double v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  int v180;
  int v181;
  id v182;
  id v183;
  double v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  int v194;
  id v195;
  id v196;
  double v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  int v207;
  id v208;
  id v209;
  double v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  int v218;
  int v219;
  id v220;
  id v221;
  double v222;
  void *v223;
  GCControllerButtonInput *buttonOptions;
  void *v225;
  int v226;
  int v227;
  GCControllerButtonInput *v228;
  id v229;
  double v230;
  void *v232;
  GCExtendedGamepad *v233;

  v4 = a3;
  +[NSMutableArray array](&off_254DEBB20, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handlerQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v233 = self;
  dpad = self->_dpad;
  objc_msgSend(v4, "dpad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xAxis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = v11;
  v232 = v4;
  objc_msgSend(v4, "dpad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "yAxis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v16 = v15;
  v17 = dpad;
  v18 = v7;
  v19 = v5;
  -[GCControllerDirectionPad xAxis](v17, "xAxis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v12;
  LOBYTE(dpad) = objc_msgSend(v20, "_setValue:queue:", v18, v21);

  -[GCControllerDirectionPad yAxis](v17, "yAxis");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = v16;
  v24 = objc_msgSend(v22, "_setValue:queue:", v18, v23);

  if ((dpad & 1) != 0 || v24)
    objc_msgSend(v19, "addObject:", v17);

  leftThumbstick = v233->_leftThumbstick;
  objc_msgSend(v232, "leftThumbstick");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "xAxis");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v29 = v28;
  objc_msgSend(v232, "leftThumbstick");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "yAxis");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v33 = v32;
  v34 = leftThumbstick;
  v35 = v18;
  v36 = v19;
  -[GCControllerDirectionPad xAxis](v34, "xAxis");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = v29;
  v39 = objc_msgSend(v37, "_setValue:queue:", v35, v38);

  -[GCControllerDirectionPad yAxis](v34, "yAxis");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = v33;
  v42 = objc_msgSend(v40, "_setValue:queue:", v35, v41);

  if ((v39 & 1) != 0 || v42)
    objc_msgSend(v36, "addObject:", v34);

  rightThumbstick = v233->_rightThumbstick;
  objc_msgSend(v232, "rightThumbstick");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "xAxis");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "value");
  v47 = v46;
  objc_msgSend(v232, "rightThumbstick");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "yAxis");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "value");
  v51 = v50;
  v52 = rightThumbstick;
  v53 = v35;
  v54 = v36;
  -[GCControllerDirectionPad xAxis](v52, "xAxis");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = v47;
  v57 = objc_msgSend(v55, "_setValue:queue:", v53, v56);

  -[GCControllerDirectionPad yAxis](v52, "yAxis");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = v51;
  v60 = objc_msgSend(v58, "_setValue:queue:", v53, v59);

  if ((v57 & 1) != 0 || v60)
    objc_msgSend(v54, "addObject:", v52);

  v61 = v233;
  buttonMenu = v233->_buttonMenu;
  objc_msgSend(v232, "buttonMenu");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "value");
  v65 = v64;
  v66 = buttonMenu;
  v67 = v54;
  LODWORD(v68) = v65;
  if (-[GCControllerButtonInput _setValue:queue:](v66, "_setValue:queue:", v53, v68))
    objc_msgSend(v67, "addObject:", v66);

  buttonHome = v233->_buttonHome;
  objc_msgSend(v232, "buttonHome");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "value");
  v72 = v71;
  v73 = buttonHome;
  v74 = v67;
  LODWORD(v75) = v72;
  if (-[GCControllerButtonInput _setValue:queue:](v73, "_setValue:queue:", v53, v75))
    objc_msgSend(v74, "addObject:", v73);

  button0 = v233->_button0;
  objc_msgSend(v232, "buttonA");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "value");
  v79 = v78;
  v80 = button0;
  v81 = v74;
  LODWORD(v82) = v79;
  if (-[GCControllerButtonInput _setValue:queue:](v80, "_setValue:queue:", v53, v82))
    objc_msgSend(v81, "addObject:", v80);

  button1 = v233->_button1;
  objc_msgSend(v232, "buttonB");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "value");
  v86 = v85;
  v87 = button1;
  v88 = v81;
  LODWORD(v89) = v86;
  if (-[GCControllerButtonInput _setValue:queue:](v87, "_setValue:queue:", v53, v89))
    objc_msgSend(v88, "addObject:", v87);

  button2 = v233->_button2;
  objc_msgSend(v232, "buttonX");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "value");
  v93 = v92;
  v94 = button2;
  v95 = v88;
  LODWORD(v96) = v93;
  if (-[GCControllerButtonInput _setValue:queue:](v94, "_setValue:queue:", v53, v96))
    objc_msgSend(v95, "addObject:", v94);

  button3 = v233->_button3;
  objc_msgSend(v232, "buttonY");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "value");
  v100 = v99;
  v101 = button3;
  v102 = v95;
  LODWORD(v103) = v100;
  if (-[GCControllerButtonInput _setValue:queue:](v101, "_setValue:queue:", v53, v103))
    objc_msgSend(v102, "addObject:", v101);

  leftShoulder = v233->_leftShoulder;
  objc_msgSend(v232, "leftShoulder");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "value");
  v107 = v106;
  v108 = leftShoulder;
  v109 = v102;
  LODWORD(v110) = v107;
  if (-[GCControllerButtonInput _setValue:queue:](v108, "_setValue:queue:", v53, v110))
    objc_msgSend(v109, "addObject:", v108);

  rightShoulder = v233->_rightShoulder;
  objc_msgSend(v232, "rightShoulder");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "value");
  v114 = v113;
  v115 = rightShoulder;
  v116 = v109;
  LODWORD(v117) = v114;
  if (-[GCControllerButtonInput _setValue:queue:](v115, "_setValue:queue:", v53, v117))
    objc_msgSend(v116, "addObject:", v115);

  leftTrigger = v233->_leftTrigger;
  objc_msgSend(v232, "leftTrigger");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "value");
  v121 = v120;
  v122 = leftTrigger;
  v123 = v116;
  LODWORD(v124) = v121;
  if (-[GCControllerButtonInput _setValue:queue:](v122, "_setValue:queue:", v53, v124))
    objc_msgSend(v123, "addObject:", v122);

  rightTrigger = v233->_rightTrigger;
  objc_msgSend(v232, "rightTrigger");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "value");
  v128 = v127;
  v129 = rightTrigger;
  v130 = v123;
  LODWORD(v131) = v128;
  if (-[GCControllerButtonInput _setValue:queue:](v129, "_setValue:queue:", v53, v131))
    objc_msgSend(v130, "addObject:", v129);

  if (v233->_leftThumbstickButton)
  {
    objc_msgSend(v232, "leftThumbstickButton");
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    if (v132)
    {
      leftThumbstickButton = v233->_leftThumbstickButton;
      objc_msgSend(v232, "leftThumbstickButton");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "value");
      v136 = v135;
      v137 = leftThumbstickButton;
      v138 = v130;
      LODWORD(v139) = v136;
      if (-[GCControllerButtonInput _setValue:queue:](v137, "_setValue:queue:", v53, v139))
        objc_msgSend(v138, "addObject:", v137);

    }
  }
  if (v233->_rightThumbstickButton)
  {
    objc_msgSend(v232, "rightThumbstickButton");
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    if (v140)
    {
      rightThumbstickButton = v233->_rightThumbstickButton;
      objc_msgSend(v232, "rightThumbstickButton");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "value");
      v144 = v143;
      v145 = rightThumbstickButton;
      v146 = v130;
      LODWORD(v147) = v144;
      if (-[GCControllerButtonInput _setValue:queue:](v145, "_setValue:queue:", v53, v147))
        objc_msgSend(v146, "addObject:", v145);

    }
  }
  -[GCPhysicalInputProfile buttons](v233, "buttons");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
  v149 = objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    v150 = (void *)v149;
    objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v151)
      goto LABEL_46;
    -[GCPhysicalInputProfile buttons](v233, "buttons");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("Left Bumper"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "value");
    v156 = v155;
    v157 = v152;
    v158 = v130;
    LODWORD(v159) = v156;
    if (objc_msgSend(v157, "_setValue:queue:", v53, v159))
      objc_msgSend(v158, "addObject:", v157);

    v61 = v233;
  }

LABEL_46:
  -[GCPhysicalInputProfile buttons](v61, "buttons");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
  v161 = objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    v162 = (void *)v161;
    objc_msgSend(v232, "buttons");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v164)
      goto LABEL_52;
    -[GCPhysicalInputProfile buttons](v61, "buttons");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "objectForKeyedSubscript:", CFSTR("Right Bumper"));
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "value");
    v169 = v168;
    v170 = v165;
    v171 = v130;
    LODWORD(v172) = v169;
    if (objc_msgSend(v170, "_setValue:queue:", v53, v172))
      objc_msgSend(v171, "addObject:", v170);

    v61 = v233;
  }

LABEL_52:
  -[GCPhysicalInputProfile buttons](v61, "buttons");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
  v174 = objc_claimAutoreleasedReturnValue();
  if (v174)
  {
    v175 = (void *)v174;
    objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v176)
      goto LABEL_58;
    -[GCPhysicalInputProfile buttons](v61, "buttons");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "objectForKeyedSubscript:", CFSTR("Back Left Button 0"));
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "value");
    v181 = v180;
    v182 = v177;
    v183 = v130;
    LODWORD(v184) = v181;
    if (objc_msgSend(v182, "_setValue:queue:", v53, v184))
      objc_msgSend(v183, "addObject:", v182);

    v61 = v233;
  }

LABEL_58:
  -[GCPhysicalInputProfile buttons](v61, "buttons");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
  v186 = objc_claimAutoreleasedReturnValue();
  if (v186)
  {
    v187 = (void *)v186;
    objc_msgSend(v232, "buttons");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v189)
      goto LABEL_64;
    -[GCPhysicalInputProfile buttons](v61, "buttons");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "objectForKeyedSubscript:", CFSTR("Back Left Button 1"));
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "value");
    v194 = v193;
    v195 = v190;
    v196 = v130;
    LODWORD(v197) = v194;
    if (objc_msgSend(v195, "_setValue:queue:", v53, v197))
      objc_msgSend(v196, "addObject:", v195);

    v61 = v233;
  }

LABEL_64:
  -[GCPhysicalInputProfile buttons](v61, "buttons");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
  v199 = objc_claimAutoreleasedReturnValue();
  if (v199)
  {
    v200 = (void *)v199;
    objc_msgSend(v232, "buttons");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
    v202 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v202)
      goto LABEL_70;
    -[GCPhysicalInputProfile buttons](v61, "buttons");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "objectForKeyedSubscript:", CFSTR("Back Right Button 0"));
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "value");
    v207 = v206;
    v208 = v203;
    v209 = v130;
    LODWORD(v210) = v207;
    if (objc_msgSend(v208, "_setValue:queue:", v53, v210))
      objc_msgSend(v209, "addObject:", v208);

    v61 = v233;
  }

LABEL_70:
  -[GCPhysicalInputProfile buttons](v61, "buttons");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
  v212 = objc_claimAutoreleasedReturnValue();
  if (!v212)
  {
LABEL_75:

    goto LABEL_76;
  }
  v213 = (void *)v212;
  objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  if (v214)
  {
    -[GCPhysicalInputProfile buttons](v61, "buttons");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "buttons");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "objectForKeyedSubscript:", CFSTR("Back Right Button 1"));
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "value");
    v219 = v218;
    v220 = v215;
    v221 = v130;
    LODWORD(v222) = v219;
    if (objc_msgSend(v220, "_setValue:queue:", v53, v222))
      objc_msgSend(v221, "addObject:", v220);

    v61 = v233;
    goto LABEL_75;
  }
LABEL_76:
  if (v61->_buttonOptions)
  {
    objc_msgSend(v232, "buttonOptions");
    v223 = (void *)objc_claimAutoreleasedReturnValue();

    if (v223)
    {
      buttonOptions = v61->_buttonOptions;
      objc_msgSend(v232, "buttonOptions");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "value");
      v227 = v226;
      v228 = buttonOptions;
      v229 = v130;
      LODWORD(v230) = v227;
      if (-[GCControllerButtonInput _setValue:queue:](v228, "_setValue:queue:", v53, v230))
        objc_msgSend(v229, "addObject:", v228);

    }
  }

  return v130;
}

- (void)setStateFromExtendedGamepad:(GCExtendedGamepad *)extendedGamepad
{
  GCExtendedGamepad *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id obj;
  _QWORD block[5];
  GCExtendedGamepad *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = extendedGamepad;
  -[GCPhysicalInputProfile controller](self, "controller");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[GCPhysicalInputProfile controller](self, "controller"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isSnapshot"),
        v7,
        v6,
        v8))
  {
    -[GCExtendedGamepad setElementValuesFromExtendedGamepad:](self, "setElementValuesFromExtendedGamepad:", v4);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          -[GCPhysicalInputProfile controller](self, "controller");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handlerQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __49__GCExtendedGamepad_setStateFromExtendedGamepad___block_invoke;
          block[3] = &unk_24D2B3D70;
          block[4] = self;
          v18 = v4;
          v19 = v13;
          dispatch_async(v15, block);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
}

void __49__GCExtendedGamepad_setStateFromExtendedGamepad___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "set %@ StateFromExtendedGamepad %@: %@", (uint8_t *)&v11, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[GCPhysicalInputProfile controller](self, "controller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "debugName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);

    }
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__GCExtendedGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  v12[3] = &unk_24D2B2B48;
  v12[4] = self;
  v13 = v6;
  v8 = v6;
  dispatch_async(v7, v12);

}

void __65__GCExtendedGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v5 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (BOOL)reportsAbsoluteDpadValues
{
  return 1;
}

- (BOOL)allowsRotation
{
  return 0;
}

+ (id)_current
{
  void *v2;
  void *v3;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentExtendedGamepad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GCControllerButtonInput)buttonA
{
  return self->_button0;
}

- (GCControllerButtonInput)buttonB
{
  return self->_button1;
}

- (GCControllerButtonInput)buttonX
{
  return self->_button2;
}

- (GCControllerButtonInput)buttonY
{
  return self->_button3;
}

- (GCControllerButtonInput)_buttonShare
{
  return self->__buttonShare;
}

- (BOOL)snapshotUsagePresent
{
  return self->_snapshotUsagePresent;
}

- (BOOL)recordUsagePresent
{
  return self->_recordUsagePresent;
}

- (GCExtendedGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCExtendedGamepadValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 680);
}

- (GCControllerDirectionPad)dpad
{
  return self->_dpad;
}

- (GCControllerButtonInput)buttonMenu
{
  return self->_buttonMenu;
}

- (GCControllerButtonInput)buttonOptions
{
  return self->_buttonOptions;
}

- (GCControllerButtonInput)buttonHome
{
  return self->_buttonHome;
}

- (GCControllerDirectionPad)leftThumbstick
{
  return self->_leftThumbstick;
}

- (GCControllerDirectionPad)rightThumbstick
{
  return self->_rightThumbstick;
}

- (GCControllerButtonInput)leftShoulder
{
  return self->_leftShoulder;
}

- (GCControllerButtonInput)rightShoulder
{
  return self->_rightShoulder;
}

- (GCControllerButtonInput)leftTrigger
{
  return self->_leftTrigger;
}

- (GCControllerButtonInput)rightTrigger
{
  return self->_rightTrigger;
}

- (GCControllerButtonInput)leftThumbstickButton
{
  return self->_leftThumbstickButton;
}

- (GCControllerButtonInput)rightThumbstickButton
{
  return self->_rightThumbstickButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHome, 0);
  objc_storeStrong((id *)&self->_buttonOptions, 0);
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->__buttonShare, 0);
  objc_storeStrong((id *)&self->_webKitUserIntentRecognizer, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);
  objc_storeStrong((id *)&self->_rightThumbstickButton, 0);
  objc_storeStrong((id *)&self->_leftThumbstickButton, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
  objc_storeStrong((id *)&self->_rightShoulder, 0);
  objc_storeStrong((id *)&self->_leftShoulder, 0);
  objc_storeStrong((id *)&self->_rightThumbstick, 0);
  objc_storeStrong((id *)&self->_leftThumbstick, 0);
  objc_storeStrong((id *)&self->_button3, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);
  objc_storeStrong((id *)&self->_dpad, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

- (void)_handleGamepadEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  int *v19;
  float v20;
  id v21;
  double v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void (**v43)(_QWORD);
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  NSObject *log;
  os_signpost_id_t spid;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t v59;
  _QWORD v60[7];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  _QWORD *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD block[4];
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "timestamp");
    getGCSignpostLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    getGCSignpostLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134217984;
      v76 = v5;
      _os_signpost_emit_with_name_impl(&dword_215181000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Handle Extended Gamepad Event", "timestamp=%llu", buf, 0xCu);
    }

    objc_msgSend((id)a1, "_receivedEventWithTimestamp:", v5);
    objc_msgSend((id)a1, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_64;
    spid = v7;
    v52 = v7 - 1;
    v55 = v5;
    +[NSMutableSet set](&off_254DEBF30, "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handlerQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 47; ++i)
    {
      if ((i & 0x7FFFFFFE) != 0x16 && objc_msgSend(v4, "hasValidValueForElement:", i))
      {
        objc_msgSend((id)a1, "remappedElementForIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v4, "floatValueForElement:", i);
          objc_msgSend(v14, "_setPendingValue:");
          objc_msgSend(v14, "collection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "collection");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v11, "addObject:", v14);
          }
        }

      }
    }
    if (*(_QWORD *)(a1 + 664) == 547 && objc_msgSend(v4, "hasValidValueForElement:", 22))
    {
      objc_msgSend(v4, "floatValueForElement:", 22);
      v18 = v17;
      v19 = &OBJC_IVAR____GCDevicePhysicalInputGroup__isSnapshot;
    }
    else
    {
      if (*(_QWORD *)(a1 + 840) && objc_msgSend(v4, "hasValidValueForElement:", 22))
      {
        objc_msgSend(v4, "floatValueForElement:", 22);
        objc_msgSend(*(id *)(a1 + 840), "_setPendingValue:");
        objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 840));
      }
      v19 = &OBJC_IVAR____GCDevicePhysicalInputGroup__isSnapshot;
      if (!*(_QWORD *)(a1 + 824) || !objc_msgSend(v4, "hasValidValueForElement:", 23))
      {
        v21 = 0;
LABEL_28:
        v53 = v4;

        +[NSMutableSet set](&off_254DEBF30, "set");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v25 = v11;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v70 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              if (objc_msgSend(v30, "_commitPendingValueOnQueue:", v12))
                objc_msgSend(v24, "addObject:", v30);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
          }
          while (v27);
        }

        if (objc_msgSend(v24, "count"))
        {
          v31 = (id)a1;
          objc_msgSend(v31, "valueDidChangeHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v65[0] = MEMORY[0x24BDAC760];
            v65[1] = 3221225472;
            v65[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_289;
            v65[3] = &unk_24D2B5008;
            v66 = v24;
            v67 = v31;
            v68 = v32;
            dispatch_async(v12, v65);

          }
          v33 = (void *)v31[100];
          if (v33)
            objc_msgSend(v33, "processChangedElements:atTimestamp:", v24, v55);

        }
        v54 = v10;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v34 = v24;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v62;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v62 != v37)
                objc_enumerationMutation(v34);
              v39 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v38);
              if (gc_isInternalBuild())
              {
                getGCLogger();
                log = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v54, "debugName");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v76 = (uint64_t)v49;
                  v77 = 2112;
                  v78 = v39;
                  _os_log_impl(&dword_215181000, log, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);

                }
              }
              v60[0] = MEMORY[0x24BDAC760];
              v60[1] = 3221225472;
              v60[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_290;
              v60[3] = &unk_24D2B3D70;
              v60[4] = a1;
              v60[5] = a1;
              v60[6] = v39;
              v40 = (id)a1;
              dispatch_async(v12, v60);

              ++v38;
            }
            while (v36 != v38);
            v41 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
            v36 = v41;
          }
          while (v41);
        }

        objc_msgSend((id)a1, "syntheticDeviceElementValueChangedHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v53;
        v10 = v54;
        if (v42)
        {
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_2;
          v56[3] = &unk_24D2B53D0;
          v57 = v34;
          v58 = v42;
          v59 = v55;
          v43 = (void (**)(_QWORD))MEMORY[0x2199DEBB0](v56);
          objc_msgSend((id)a1, "syntheticDeviceHandlerQueue");
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v44)
            dispatch_async(v44, v43);
          else
            v43[2](v43);

        }
        getGCSignpostLogger();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          objc_msgSend((id)a1, "lastEventTimestamp");
          *(_DWORD *)buf = 134218240;
          v76 = v55;
          v77 = 2048;
          v78 = v48;
          _os_signpost_emit_with_name_impl(&dword_215181000, v47, OS_SIGNPOST_INTERVAL_END, spid, "Handle Extended Gamepad Event", "timestamp=%llu, receiveTimestamp=%f", buf, 0x16u);
        }

LABEL_64:
        goto LABEL_65;
      }
      objc_msgSend(v4, "floatValueForElement:", 23);
      v18 = v20;
    }
    v21 = *(id *)(a1 + v19[471]);
    *(float *)&v22 = v18;
    objc_msgSend(*(id *)(a1 + v19[471]), "_setPendingValue:", v22);
    objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + v19[471]));
    if (v18 > 0.0 && (objc_msgSend(v21, "isPressed") & 1) == 0)
    {
      objc_msgSend(v10, "handlerQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke;
      block[3] = &unk_24D2B2B20;
      v74 = v10;
      dispatch_async(v23, block);

    }
    goto LABEL_28;
  }
LABEL_65:

}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "%@ pause event", (uint8_t *)&v6, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_289(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

_QWORD *__49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_290(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[4] + 680);
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(result[4] + 680), result[5], result[6]);
  return result;
}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)handleGamepadEvent:(id)a3
{
  -[GCExtendedGamepad _handleGamepadEvent:]((uint64_t)self, a3);
}

- (void)setGamepadEventSource:(id)a3
{
  id gamepadEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  gamepadEventObservation = self->_gamepadEventObservation;
  self->_gamepadEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__GCExtendedGamepad_PubSub__setGamepadEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeGamepadEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_gamepadEventObservation;
  self->_gamepadEventObservation = v6;

}

void __51__GCExtendedGamepad_PubSub__setGamepadEventSource___block_invoke(uint64_t a1, void *a2)
{
  -[GCExtendedGamepad _handleGamepadEvent:](*(_QWORD *)(a1 + 32), a2);
}

- (void)setThumbstickUserIntentHandler:(id)a3
{
  _GCWebKitUserIntentRecognizer *webKitUserIntentRecognizer;
  _GCWebKitUserIntentRecognizer *v5;
  _GCWebKitUserIntentRecognizer *v6;
  id v7;

  v7 = a3;
  webKitUserIntentRecognizer = self->_webKitUserIntentRecognizer;
  self->_webKitUserIntentRecognizer = 0;

  if (v7)
  {
    v5 = -[_GCWebKitUserIntentRecognizer initWithPhysicalInputProfile:thumbstickUserIntentHandler:]([_GCWebKitUserIntentRecognizer alloc], "initWithPhysicalInputProfile:thumbstickUserIntentHandler:", self, v7);
    v6 = self->_webKitUserIntentRecognizer;
    self->_webKitUserIntentRecognizer = v5;

  }
}

- (id)thumbstickUserIntentHandler
{
  return -[_GCWebKitUserIntentRecognizer thumbstickUserIntentHandler](self->_webKitUserIntentRecognizer, "thumbstickUserIntentHandler");
}

- (void)setThumbstickUserIntentHandler:(id)a3 slidingWindowTotalDuration:(double)a4 slidingWindowSegmentDuration:(double)a5 deadzone:(double)a6 sensitivity:(int)a7
{
  uint64_t v7;
  _GCWebKitUserIntentRecognizer *webKitUserIntentRecognizer;
  _GCWebKitUserIntentRecognizer *v13;
  _GCWebKitUserIntentRecognizer *v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  v15 = a3;
  webKitUserIntentRecognizer = self->_webKitUserIntentRecognizer;
  self->_webKitUserIntentRecognizer = 0;

  if (v15)
  {
    v13 = -[_GCWebKitUserIntentRecognizer initWithPhysicalInputProfile:thumbstickUserIntentHandler:slidingWindowTotalDuration:slidingWindowSegmentDuration:deadzone:sensitivity:]([_GCWebKitUserIntentRecognizer alloc], "initWithPhysicalInputProfile:thumbstickUserIntentHandler:slidingWindowTotalDuration:slidingWindowSegmentDuration:deadzone:sensitivity:", self, v15, v7, a4, a5, a6);
    v14 = self->_webKitUserIntentRecognizer;
    self->_webKitUserIntentRecognizer = v13;

  }
}

@end
