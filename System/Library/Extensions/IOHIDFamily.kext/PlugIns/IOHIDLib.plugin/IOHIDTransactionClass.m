@implementation IOHIDTransactionClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6;
  CFUUIDRef v7;
  int v8;

  v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (!CFEqual(v6, v7))
  {
    v8 = -2147483644;
    if (!v6)
      return v8;
    goto LABEL_3;
  }
  *a4 = &self->_interface;
  CFRetain(self);
  v8 = 0;
  if (v6)
LABEL_3:
    CFRelease(v6);
  return v8;
}

- (int)getAsyncEventSource:(const void *)a3
{
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    return -536870206;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  *a3 = (const void *)objc_msgSend_runLoopSource(WeakRetained, v5, v6, v7, v8);

  return 0;
}

- (int)setDirection:(unsigned int)a3
{
  self->_direction = a3;
  return 0;
}

- (int)getDirection:(unsigned int *)a3
{
  int result;

  if (!a3)
    return -536870206;
  result = 0;
  *a3 = self->_direction;
  return result;
}

- (int)addElement:(__IOHIDElement *)a3
{
  void *v3;
  int v4;
  HIDLibElement *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = -536870212;
  if (a3)
  {
    v6 = [HIDLibElement alloc];
    v3 = (void *)objc_msgSend_initWithElementRef_(v6, v7, (uint64_t)v3, v8, v9);
    if (v3
      && (objc_msgSend_containsObject_(self->_elements, v10, (uint64_t)v3, v11, v12) & 1) == 0
      && (self->_direction != 1
       || objc_msgSend_type(v3, v13, v14, v15, v16) == 129
       || objc_msgSend_type(v3, v13, v17, v15, v16) == 257))
    {
      objc_msgSend_addObject_(self->_elements, v13, (uint64_t)v3, v15, v16);
      v4 = 0;
    }
  }
  else
  {
    v4 = -536870206;
  }

  return v4;
}

- (int)removeElement:(__IOHIDElement *)a3
{
  void *v3;
  int v4;
  HIDLibElement *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v4 = -536870212;
  if (a3)
  {
    v6 = [HIDLibElement alloc];
    v3 = (void *)objc_msgSend_initWithElementRef_(v6, v7, (uint64_t)v3, v8, v9);
    if (v3 && objc_msgSend_containsObject_(self->_elements, v10, (uint64_t)v3, v11, v12))
    {
      objc_msgSend_removeObject_(self->_elements, v13, (uint64_t)v3, v14, v15);
      v4 = 0;
    }
  }
  else
  {
    v4 = -536870206;
  }

  return v4;
}

- (int)containsElement:(__IOHIDElement *)a3 value:(char *)a4
{
  int result;
  HIDLibElement *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  result = -536870206;
  if (a3 && a4)
  {
    v8 = [HIDLibElement alloc];
    v12 = objc_msgSend_initWithElementRef_(v8, v9, (uint64_t)a3, v10, v11);
    if (v12)
    {
      v16 = (void *)v12;
      *a4 = objc_msgSend_containsObject_(self->_elements, v13, v12, v14, v15);

      return 0;
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5
{
  void *v5;
  int v6;
  char v9;
  HIDLibElement *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *elements;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  v5 = 0;
  v6 = -536870206;
  if (!a3 || !a4)
    goto LABEL_10;
  if (self->_direction != 1)
  {
    v5 = 0;
LABEL_12:
    v6 = -536870212;
    goto LABEL_10;
  }
  v9 = a5;
  v11 = [HIDLibElement alloc];
  v5 = (void *)objc_msgSend_initWithElementRef_(v11, v12, (uint64_t)a3, v13, v14);
  if (!v5 || !objc_msgSend_containsObject_(self->_elements, v15, (uint64_t)v5, v16, v17))
    goto LABEL_12;
  if ((v9 & 1) != 0)
    objc_msgSend_setDefaultValueRef_(v5, v18, (uint64_t)a4, v19, v20);
  else
    objc_msgSend_setValueRef_(v5, v18, (uint64_t)a4, v19, v20);
  elements = self->_elements;
  v25 = objc_msgSend_indexOfObject_(elements, v21, (uint64_t)v5, v22, v23);
  objc_msgSend_replaceObjectAtIndex_withObject_(elements, v26, v25, (uint64_t)v5, v27);
  v6 = 0;
LABEL_10:

  return v6;
}

- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5
{
  void *v5;
  int v6;
  void *v8;
  char v9;
  HIDLibElement *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *elements;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __IOHIDValue *v32;

  v5 = 0;
  v6 = -536870206;
  if (a3)
  {
    v8 = 0;
    if (a4)
    {
      v9 = a5;
      v12 = [HIDLibElement alloc];
      v8 = (void *)objc_msgSend_initWithElementRef_(v12, v13, (uint64_t)a3, v14, v15);
      if (v8 && objc_msgSend_containsObject_(self->_elements, v16, (uint64_t)v8, v17, v18))
      {
        elements = self->_elements;
        v23 = objc_msgSend_indexOfObject_(elements, v19, (uint64_t)v8, v20, v21);
        objc_msgSend_objectAtIndex_(elements, v24, v23, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v27;
        if ((v9 & 1) != 0)
          v32 = (__IOHIDValue *)objc_msgSend_defaultValueRef(v27, v28, v29, v30, v31);
        else
          v32 = (__IOHIDValue *)objc_msgSend_valueRef(v27, v28, v29, v30, v31);
        v6 = 0;
        *a4 = v32;
      }
      else
      {
        v5 = 0;
        v6 = -536870212;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v6;
}

- (int)commit:(void *)a3 timeout:(unsigned int)a4 callback:(void *)a5 options:(unsigned int)a6
{
  unsigned int v11;
  __int128 v12;
  int Value_value_timeout_callback_context_options;
  uint64_t v14;
  IOHIDDeviceClass **p_device;
  id WeakRetained;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  io_registry_entry_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  void *v28;
  size_t inputStructCnt;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __IOHIDValue *v49;
  char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  mach_port_t v67;
  mach_port_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  mach_port_t Port;
  size_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  _DWORD *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  _DWORD *v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  mach_port_t v111;
  id v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  mach_port_t v117;
  void *v118;
  NSObject *v119;
  char *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  mach_port_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  size_t v130;
  uint64_t v131;
  NSObject *v132;
  uint64_t v133;
  NSObject *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  unint64_t v140;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  NSObject *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  NSObject *v162;
  NSObject *v163;
  NSObject *v164;
  unsigned int v165;
  size_t v166;
  id obj;
  NSMutableArray *obja;
  _QWORD *v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  CFTypeRef cf;
  size_t v175;
  uint64_t entryID;
  _BYTE v177[128];
  uint64_t reference[2];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t input;
  __int128 v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  v175 = 0;
  entryID = 0xAAAAAAAAAAAAAAAALL;
  input = 0;
  v183 = 0uLL;
  v11 = objc_msgSend_count(self->_elements, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v180 = v12;
  v181 = v12;
  *(_OWORD *)reference = v12;
  v179 = v12;
  Value_value_timeout_callback_context_options = -536870212;
  v14 = v11;
  if (!v11)
    goto LABEL_68;
  v165 = v11;
  p_device = &self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  v21 = objc_msgSend_service(WeakRetained, v17, v18, v19, v20);
  IORegistryEntryGetRegistryEntryID(v21, &entryID);

  *((_QWORD *)&v183 + 1) = a6;
  if (!a5)
  {
    v26 = 0;
    goto LABEL_6;
  }
  input = a4;
  v25 = malloc_type_calloc(1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
  if (!v25)
  {
LABEL_68:
    v31 = 0;
    goto LABEL_60;
  }
  v26 = v25;
  *v25 = a5;
  v25[1] = a3;
  v27 = objc_loadWeakRetained((id *)&self->_device);
  v26[2] = v27;

  v28 = (void *)v26[4];
  v26[3] = &self->_interface;
  v26[4] = 0;

  reference[1] = (uint64_t)sub_2310D6590;
  *(_QWORD *)&v179 = v26;
LABEL_6:
  obj = a5;
  v169 = v26;
  if (self->_direction == 1)
  {
    inputStructCnt = 0;
    v30 = 0;
    v31 = 0;
    do
    {
      v32 = v31;
      objc_msgSend_objectAtIndex_(self->_elements, v22, v30, v23, v24);
      v31 = objc_claimAutoreleasedReturnValue();

      v33 = objc_loadWeakRetained((id *)&self->_device);
      v38 = objc_msgSend_elementRef(v31, v34, v35, v36, v37);
      v43 = objc_msgSend_valueRef(v31, v39, v40, v41, v42);
      Value_value_timeout_callback_context_options = objc_msgSend_setValue_value_timeout_callback_context_options_(v33, v44, v38, v43, 0, 0, 0, 0x10000);

      if (Value_value_timeout_callback_context_options)
      {
        _IOHIDLogCategory();
        v162 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
          sub_2310E1174();

        goto LABEL_57;
      }
      v49 = (__IOHIDValue *)objc_msgSend_valueRef(v31, v45, v46, v47, v48);
      inputStructCnt += IOHIDValueGetLength(v49) + 8;
      v175 = inputStructCnt;
      ++v30;
    }
    while (v14 != v30);
    v50 = (char *)malloc_type_malloc(inputStructCnt, 0x21423F39uLL);
    if (!v50)
    {
      Value_value_timeout_callback_context_options = -536870211;
      goto LABEL_57;
    }
    v54 = v50;
    v55 = 0;
    v56 = 0;
    do
    {
      v57 = v31;
      objc_msgSend_objectAtIndex_(self->_elements, v51, v55, v52, v53);
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_valueRef(v31, v58, v59, v60, v61);
      _IOHIDValueCopyToElementValueHeader();
      v56 += *(unsigned int *)&v54[v56 + 4] + 8;
      ++v55;
    }
    while (v14 != v55);
    v62 = objc_loadWeakRetained((id *)&self->_device);
    v67 = objc_msgSend_connect(v62, v63, v64, v65, v66);
    v68 = v67;
    if (obj)
    {
      v69 = objc_loadWeakRetained((id *)p_device);
      Port = objc_msgSend_getPort(v69, v70, v71, v72, v73);
      Value_value_timeout_callback_context_options = IOConnectCallAsyncMethod(v68, 0xBu, Port, reference, 3u, &input, 1u, v54, inputStructCnt, 0, 0, 0, 0);

    }
    else
    {
      Value_value_timeout_callback_context_options = IOConnectCallMethod(v67, 0xBu, &input, 1u, v54, inputStructCnt, 0, 0, 0, 0);
    }
    v26 = v169;

    if (Value_value_timeout_callback_context_options)
    {
      _IOHIDLogCategory();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        sub_2310E1114();

    }
    goto LABEL_55;
  }
  v75 = 0;
  v76 = 0;
  v31 = 0;
  do
  {
    v77 = v31;
    objc_msgSend_objectAtIndex_(self->_elements, v22, v76, v23, v24);
    v31 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_elementRef(v31, v78, v79, v80, v81);
    v75 += _IOHIDElementGetLength() + 24;
    cf = (CFTypeRef)objc_msgSend_valueRef(v31, v82, v83, v84, v85);
    v175 = v75;
    v86 = objc_loadWeakRetained((id *)&self->_device);
    v91 = objc_msgSend_elementRef(v31, v87, v88, v89, v90);
    Value_value_timeout_callback_context_options = objc_msgSend_getValue_value_timeout_callback_context_options_(v86, v92, v91, (uint64_t)&cf, 0, 0, 0, 0x10000);

    if (Value_value_timeout_callback_context_options)
    {
      _IOHIDLogCategory();
      v163 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
        sub_2310E1314();

      goto LABEL_67;
    }
    ++v76;
  }
  while (v14 != v76);
  v93 = malloc_type_malloc(4 * v165, 0x68658BD9uLL);
  if (!v93)
  {
    Value_value_timeout_callback_context_options = -536870211;
LABEL_67:
    v26 = v169;
    goto LABEL_57;
  }
  v97 = v93;
  v166 = 4 * v165;
  v98 = 0;
  v26 = v169;
  do
  {
    v99 = v31;
    objc_msgSend_objectAtIndex_(self->_elements, v94, v98, v95, v96);
    v31 = objc_claimAutoreleasedReturnValue();

    v97[v98++] = objc_msgSend_elementCookie(v31, v100, v101, v102, v103);
  }
  while (v14 != v98);
  if (obj)
  {
    *(_QWORD *)&v183 = v75;
    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v94, (uint64_t)self->_elements, v95, v96);
    v104 = objc_claimAutoreleasedReturnValue();
    v105 = (void *)v169[4];
    v169[4] = v104;

    Value_value_timeout_callback_context_options = -536870211;
    if (v104)
    {
      v106 = objc_loadWeakRetained((id *)&self->_device);
      v111 = objc_msgSend_connect(v106, v107, v108, v109, v110);
      v112 = objc_loadWeakRetained((id *)p_device);
      v117 = objc_msgSend_getPort(v112, v113, v114, v115, v116);
      Value_value_timeout_callback_context_options = IOConnectCallAsyncMethod(v111, 0xAu, v117, reference, 3u, &input, 3u, v97, v166, 0, 0, 0, 0);

      if (Value_value_timeout_callback_context_options)
      {
        _IOHIDLogCategory();
        v164 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          sub_2310E12B4();

      }
    }
    goto LABEL_24;
  }
  v120 = (char *)malloc_type_calloc(1uLL, v75, 0xD786148FuLL);
  Value_value_timeout_callback_context_options = -536870211;
  if (!v120)
  {
LABEL_24:
    v118 = v97;
    goto LABEL_56;
  }
  v54 = v120;
  v121 = objc_loadWeakRetained((id *)&self->_device);
  v126 = objc_msgSend_connect(v121, v122, v123, v124, v125);
  Value_value_timeout_callback_context_options = IOConnectCallMethod(v126, 0xAu, &input, 3u, v97, v166, 0, 0, v54, &v175);

  if (Value_value_timeout_callback_context_options)
  {
    _IOHIDLogCategory();
    obja = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obja->super.super, OS_LOG_TYPE_ERROR))
      sub_2310E12B4();
    goto LABEL_54;
  }
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  obja = self->_elements;
  v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v127, (uint64_t)&v170, (uint64_t)v177, 16);
  if (!v128)
  {
    v151 = 0;
    goto LABEL_53;
  }
  v129 = v128;
  v130 = 0;
  v131 = *(_QWORD *)v171;
  v132 = v31;
  while (2)
  {
    v133 = 0;
    v134 = v132;
    while (2)
    {
      if (*(_QWORD *)v171 != v131)
        objc_enumerationMutation(obja);
      v132 = *(id *)(*((_QWORD *)&v170 + 1) + 8 * v133);

      v139 = &v54[v130];
      v140 = *(unsigned int *)&v54[v130 + 4];
      v130 += v140 >> 8;
      if (v140 >> 10 < 5 || v130 > v175)
      {
        _IOHIDLogCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_2310E11D4((uint64_t)(v139 + 4), v31, v152, v153, v154, v155, v156, v157);
        goto LABEL_52;
      }
      v142 = *(_DWORD *)v139;
      if (v142 != objc_msgSend_elementCookie(v132, v135, v136, v137, v138))
      {
        _IOHIDLogCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_2310E1244((uint64_t)v139, v132, v31, v158, v159);
LABEL_52:
        v151 = v132;
        goto LABEL_53;
      }
      objc_msgSend_elementRef(v132, v143, v144, v145, v146);
      cf = (CFTypeRef)_IOHIDValueCreateWithElementValuePtr();
      objc_msgSend_setValueRef_(v132, v147, (uint64_t)cf, v148, v149);
      if (cf)
        CFRelease(cf);
      ++v133;
      v134 = v132;
      if (v129 != v133)
        continue;
      break;
    }
    v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v150, (uint64_t)&v170, (uint64_t)v177, 16);
    v151 = 0;
    v31 = v132;
    if (v129)
      continue;
    break;
  }
LABEL_53:

  Value_value_timeout_callback_context_options = 0;
  v31 = v151;
LABEL_54:

  free(v97);
  v26 = v169;
LABEL_55:
  v118 = v54;
LABEL_56:
  free(v118);
LABEL_57:
  if (v26 && Value_value_timeout_callback_context_options)
  {
    v160 = (void *)v26[4];
    v26[4] = 0;

    free(v26);
  }
LABEL_60:

  return Value_value_timeout_callback_context_options;
}

- (int)clear
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeAllObjects(self->_elements, a2, v2, v3, v4);
  return 0;
}

- (IOHIDTransactionClass)initWithDevice:(id)a3
{
  id v4;
  IOHIDTransactionClass *v5;
  IOHIDTransactionClass *v6;
  char *v7;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v10;
  NSMutableArray *v11;
  NSMutableArray *elements;
  IOHIDTransactionClass *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IOHIDTransactionClass;
  v5 = -[IOHIDIUnknown2 init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_device, v4);
    v7 = (char *)malloc_type_malloc(0x70uLL, 0x8004065BD1A13uLL);
    v6->_interface = (IOHIDDeviceTransactionInterface *)v7;
    vtbl = v6->super._vtbl;
    Release = vtbl->Release;
    v10 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v7 = v6;
    *(_OWORD *)(v7 + 8) = v10;
    *((_QWORD *)v7 + 3) = Release;
    *((_QWORD *)v7 + 4) = sub_2310D6964;
    *((_QWORD *)v7 + 5) = sub_2310D6974;
    *((_QWORD *)v7 + 6) = sub_2310D6984;
    *((_QWORD *)v7 + 7) = sub_2310D6994;
    *((_QWORD *)v7 + 8) = sub_2310D69A4;
    *((_QWORD *)v7 + 9) = sub_2310D69B4;
    *((_QWORD *)v7 + 10) = sub_2310D69C8;
    *((_QWORD *)v7 + 11) = sub_2310D69E0;
    *((_QWORD *)v7 + 12) = sub_2310D69F8;
    *((_QWORD *)v7 + 13) = sub_2310D6A14;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    elements = v6->_elements;
    v6->_elements = v11;

    v13 = v6;
  }

  return v6;
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (id)device
{
  return objc_loadWeakRetained((id *)&self->_device);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_interface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDTransactionClass;
  -[IOHIDIUnknown2 dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
