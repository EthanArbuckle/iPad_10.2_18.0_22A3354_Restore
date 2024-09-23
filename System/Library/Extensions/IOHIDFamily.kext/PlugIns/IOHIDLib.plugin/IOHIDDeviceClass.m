@implementation IOHIDDeviceClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  uint64_t v5;
  uint64_t v6;
  CFUUIDRef v8;
  CFUUIDRef v9;
  CFUUIDRef v10;
  uint64_t v11;
  int Interface_outInterface;
  CFUUIDRef v14;
  CFUUIDRef v15;
  CFUUIDRef v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __objc2_class *v25;
  CFUUIDRef v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v5 = *(_QWORD *)&a3.var8;
  v6 = *(_QWORD *)&a3.var0;
  v8 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v8, v9)
    || (v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v8, v10)))
  {
    v11 = 16;
LABEL_4:
    *a4 = (char *)self + v11;
    CFRetain(self);
    Interface_outInterface = 0;
    goto LABEL_5;
  }
  v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v14)
    || (v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xB4u, 0x73u, 0x25u, 0x6Cu, 0x6Au, 0x72u, 0x4Eu, 4u, 0xB6u, 0x94u, 0xC4u, 0, 0x1Du, 0x20u, 0x20u, 0x20u), CFEqual(v8, v15)))
  {
    v11 = 24;
    goto LABEL_4;
  }
  v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Eu, 0xC7u, 0x8Bu, 0xDBu, 0x9Fu, 0x4Eu, 0x11u, 0xDAu, 0xB6u, 0x5Cu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v16))
  {
    objc_msgSend_initPort(self, v17, v18, v19, v20);
    objc_msgSend_initElements(self, v21, v22, v23, v24);
    v25 = IOHIDQueueClass;
LABEL_15:
    v35 = [v25 alloc];
    v39 = (void *)objc_msgSend_initWithDevice_(v35, v36, (uint64_t)self, v37, v38);
    Interface_outInterface = objc_msgSend_queryInterface_outInterface_(v39, v40, v6, v5, (uint64_t)a4);

    goto LABEL_5;
  }
  v26 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v8, v26))
  {
    objc_msgSend_initPort(self, v27, v28, v29, v30);
    objc_msgSend_initElements(self, v31, v32, v33, v34);
    v25 = IOHIDTransactionClass;
    goto LABEL_15;
  }
  Interface_outInterface = -2147483644;
LABEL_5:
  if (v8)
    CFRelease(v8);
  return Interface_outInterface;
}

- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5
{
  if (IOObjectConformsTo(a4, "IOHIDDevice"))
    return 0;
  else
    return -536870201;
}

- (__IOHIDElement)getElement:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __IOHIDElement *v15;

  if (objc_msgSend_count(self->_sortedElements, a2, *(uint64_t *)&a3, v3, v4) <= (unint64_t)a3)
    return 0;
  objc_msgSend_objectAtIndex_(self->_sortedElements, v7, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v15 = (__IOHIDElement *)objc_msgSend_elementRef(v10, v11, v12, v13, v14);
  else
    v15 = 0;

  return v15;
}

- (int)initElements
{
  uint64_t v3;
  NSMutableArray *elements;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int inited;
  kern_return_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  mach_port_t connect;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *outputStruct;
  kern_return_t v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  size_t v27;
  unint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  int v50;
  int v51;
  int v52;
  id v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  id v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  mach_port_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSMutableArray *v86;
  NSMutableArray *reportElements;
  size_t j;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  HIDLibElement *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSMutableArray *v113;
  NSMutableArray *sortedElements;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  void *v129;
  NSMutableArray *v130;
  unsigned int v131;
  const char *v132;
  uint64_t v133;
  NSMutableArray *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t m;
  void *v144;
  NSMutableArray *v145;
  unsigned int v146;
  const char *v147;
  uint64_t v148;
  int v149;
  NSObject *v151;
  uint64_t v152;
  unsigned int v153;
  NSObject *v154;
  int v155;
  int v156;
  unsigned int v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  size_t v170;
  uint64_t input;
  uint32_t outputCnt;
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t output;
  unint64_t v177;
  uint64_t v178;

  v178 = *MEMORY[0x24BDAC8D0];
  output = 0xAAAAAAAAAAAAAAAALL;
  v177 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  v170 = 0xAAAAAAAAAAAAAAAALL;
  input = 0;
  os_unfair_recursive_lock_lock_with_options();
  v3 = 88;
  elements = self->_elements;
  os_unfair_recursive_lock_unlock();
  if (elements)
    return 0;
  inited = objc_msgSend_initConnect(self, v5, v6, v7, v8);
  if (inited)
    return inited;
  v10 = IOConnectCallScalarMethod(self->_connect, 0xEu, 0, 0, &output, &outputCnt);
  if (v10)
  {
    v149 = v10;
    _IOHIDLogCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_2310E1D1C();
  }
  else
  {
    v11 = v177;
    v170 = 96 * output;
    v12 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v16 = (void *)objc_msgSend_initWithLength_(v12, v13, v170, v14, v15);
    connect = self->_connect;
    v18 = objc_retainAutorelease(v16);
    outputStruct = (void *)objc_msgSend_mutableBytes(v18, v19, v20, v21, v22);
    v24 = IOConnectCallMethod(connect, 0xFu, &input, 1u, 0, 0, 0, 0, outputStruct, &v170);
    if (v24)
    {
      v149 = v24;
      _IOHIDLogCategory();
      v151 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
        sub_2310E1CBC();

    }
    else
    {
      v152 = v11;
      os_unfair_recursive_lock_lock_with_options();
      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26 = self->_elements;
      self->_elements = v25;

      if (v170)
      {
        v27 = 0;
        v157 = 0;
        v28 = 0x24FFF9000;
        v154 = v18;
        while (1)
        {
          v29 = objc_retainAutorelease(v18);
          v34 = (int *)(objc_msgSend_mutableBytes(v29, v30, v31, v32, v33) + v27);
          v35 = *v34;
          v36 = v34[1];
          v37 = v157;
          if (v36 > v157)
            v37 = v34[1];
          v157 = v37;
          if (v34[2])
          {
            v153 = v34[1];
            v155 = *v34;
            v168 = 0u;
            v169 = 0u;
            v166 = 0u;
            v167 = 0u;
            v38 = *(id *)((char *)&self->super.super.super.isa + v3);
            v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v166, (uint64_t)v175, 16);
            if (v40)
            {
              v45 = v40;
              v46 = 0;
              v47 = *(_QWORD *)v167;
              do
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(_QWORD *)v167 != v47)
                    objc_enumerationMutation(v38);
                  v49 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
                  v50 = v34[2];
                  if (v50 == objc_msgSend_elementCookie(v49, v41, v42, v43, v44))
                    v46 = objc_msgSend_elementRef(v49, v41, v42, v43, v44);
                }
                v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v166, (uint64_t)v175, 16);
              }
              while (v45);
            }
            else
            {
              v46 = 0;
            }

            v52 = *v34;
            v51 = v34[1];
            v18 = v154;
            v3 = 88;
            v28 = 0x24FFF9000uLL;
            v35 = v155;
            v36 = v153;
          }
          else
          {
            v46 = 0;
            v51 = v34[1];
            v52 = *v34;
          }
          if (v52 == v51)
            break;
          if (v36 + 1 != v35)
          {
            v156 = v27;
            v27 = v3;
            v63 = 0;
            v64 = 0;
            if (v36 + 1 - v35 <= 1)
              v65 = 1;
            else
              v65 = v36 + 1 - v35;
            do
            {
              v66 = objc_alloc(*(Class *)(v28 + 4048));
              v55 = (void *)objc_msgSend_initWithElementStruct_parent_index_(v66, v67, (uint64_t)v34, v46, v63);

              objc_msgSend_elementRef(v55, v68, v69, v70, v71);
              _IOHIDElementSetDeviceInterface();
              objc_msgSend_addObject_(*(void **)((char *)&self->super.super.super.isa + v27), v72, (uint64_t)v55, v73, v74);
              v63 = (v63 + 1);
              v64 = v55;
            }
            while (v65 != (_DWORD)v63);
            goto LABEL_30;
          }
LABEL_31:
          v27 = (v27 + 96);
          if (v27 >= v170)
            goto LABEL_34;
        }
        v156 = v27;
        v53 = objc_alloc(*(Class *)(v28 + 4048));
        v55 = (void *)objc_msgSend_initWithElementStruct_parent_index_(v53, v54, (uint64_t)v34, v46, 0);
        objc_msgSend_elementRef(v55, v56, v57, v58, v59);
        _IOHIDElementSetDeviceInterface();
        objc_msgSend_addObject_(*(void **)((char *)&self->super.super.super.isa + v3), v60, (uint64_t)v55, v61, v62);
        v27 = v3;
LABEL_30:

        v3 = v27;
        v18 = v154;
        LODWORD(v27) = v156;
        goto LABEL_31;
      }
      v157 = 0;
LABEL_34:
      os_unfair_recursive_lock_unlock();
      input = 1;
      v170 = 96 * v152;
      v75 = objc_alloc(MEMORY[0x24BDBCEC8]);
      v79 = (void *)objc_msgSend_initWithLength_(v75, v76, v170, v77, v78);

      v80 = self->_connect;
      v18 = objc_retainAutorelease(v79);
      v85 = (void *)objc_msgSend_mutableBytes(v18, v81, v82, v83, v84);
      LODWORD(v79) = IOConnectCallMethod(v80, 0xFu, &input, 1u, 0, 0, 0, 0, v85, &v170);
      os_unfair_recursive_lock_lock_with_options();
      if (!(_DWORD)v79)
      {
        v86 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        reportElements = self->_reportElements;
        self->_reportElements = v86;

        if (v170)
        {
          for (j = 0; j < v170; j = (j + 96))
          {
            v89 = objc_retainAutorelease(v18);
            v94 = objc_msgSend_mutableBytes(v89, v90, v91, v92, v93) + j;
            v95 = [HIDLibElement alloc];
            v97 = (void *)objc_msgSend_initWithElementStruct_parent_index_(v95, v96, v94, 0, 0);
            objc_msgSend_addObject_(self->_reportElements, v98, (uint64_t)v97, v99, v100);
            if (objc_msgSend_elementCookie(v97, v101, v102, v103, v104) > v157)
              v157 = objc_msgSend_elementCookie(v97, v105, v106, v107, v108);

          }
        }
      }
      v109 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v113 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v109, v110, v157 + 1, v111, v112);
      sortedElements = self->_sortedElements;
      self->_sortedElements = v113;

      if (v157 != -1)
      {
        v117 = 0;
        v118 = MEMORY[0x24BDBD1C0];
        do
          objc_msgSend_setObject_atIndexedSubscript_(self->_sortedElements, v115, v118, v117++, v116);
        while (v157 + 1 != v117);
      }
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v119 = *(id *)((char *)&self->super.super.super.isa + v3);
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v162, (uint64_t)v174, 16);
      if (v121)
      {
        v126 = v121;
        v127 = *(_QWORD *)v163;
        do
        {
          for (k = 0; k != v126; ++k)
          {
            if (*(_QWORD *)v163 != v127)
              objc_enumerationMutation(v119);
            v129 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * k);
            v130 = self->_sortedElements;
            v131 = objc_msgSend_elementCookie(v129, v122, v123, v124, v125);
            objc_msgSend_replaceObjectAtIndex_withObject_(v130, v132, v131, (uint64_t)v129, v133);
          }
          v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v162, (uint64_t)v174, 16);
        }
        while (v126);
      }

      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v134 = self->_reportElements;
      v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v158, (uint64_t)v173, 16);
      if (v136)
      {
        v141 = v136;
        v142 = *(_QWORD *)v159;
        do
        {
          for (m = 0; m != v141; ++m)
          {
            if (*(_QWORD *)v159 != v142)
              objc_enumerationMutation(v134);
            v144 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * m);
            v145 = self->_sortedElements;
            v146 = objc_msgSend_elementCookie(v144, v137, v138, v139, v140);
            objc_msgSend_replaceObjectAtIndex_withObject_(v145, v147, v146, (uint64_t)v144, v148);
          }
          v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v158, (uint64_t)v173, 16);
        }
        while (v141);
      }

      os_unfair_recursive_lock_unlock();
      v149 = 0;
    }
  }

  return v149;
}

- (void)initPort
{
  mach_port_t NotificationPort;
  const __CFAllocator *v4;
  __CFMachPort *v5;
  CFMachPortContext v6;

  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = self;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_port)
  {
    NotificationPort = IODataQueueAllocateNotificationPort();
    self->_port = NotificationPort;
    if (NotificationPort)
    {
      v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v5 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], NotificationPort, (CFMachPortCallBack)sub_2310DDCFC, &v6, 0);
      self->_machPort = v5;
      if (v5)
        self->_runLoopSource = CFMachPortCreateRunLoopSource(v4, v5, 0);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (unsigned)getPort
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_initPort(self, a2, v2, v3, v4);
  return self->_port;
}

- (void)initQueue
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IOHIDQueueClass *v11;
  const char *v12;
  IOHIDQueueClass *v13;
  IOHIDQueueClass *queue;
  const char *v15;
  uint64_t v16;
  IOHIDQueueClass *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  IOHIDQueueClass *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_queue)
  {
    objc_msgSend_initPort(self, v3, v4, v5, v6);
    if (!objc_msgSend_initElements(self, v7, v8, v9, v10))
    {
      v11 = [IOHIDQueueClass alloc];
      v13 = (IOHIDQueueClass *)objc_msgSend_initWithDevice_port_source_(v11, v12, (uint64_t)self, self->_port, (uint64_t)self->_runLoopSource);
      queue = self->_queue;
      self->_queue = v13;

      v17 = self->_queue;
      if (v17)
      {
        objc_msgSend_setValueAvailableCallback_context_(v17, v15, (uint64_t)sub_2310DDF2C, (uint64_t)self, v16);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v18 = self->_reportElements;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
        if (v20)
        {
          v25 = v20;
          v26 = *(_QWORD *)v34;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v34 != v26)
                objc_enumerationMutation(v18);
              v28 = self->_queue;
              v29 = objc_msgSend_elementRef(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v27), v21, v22, v23, v24, (_QWORD)v33);
              objc_msgSend_addElement_(v28, v30, v29, v31, v32);
              ++v27;
            }
            while (v25 != v27);
            v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, (uint64_t)v37, 16);
          }
          while (v25);
        }
      }
      else
      {
        _IOHIDLogCategory();
        v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR))
          sub_2310E1D7C(&v18->super.super);
      }

    }
  }
  os_unfair_recursive_lock_unlock();
}

- (int)initConnect
{
  kern_return_t v3;
  BOOL v4;
  int v5;
  NSObject *v7;
  io_connect_t connect;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_connect)
    goto LABEL_7;
  connect = -1431655766;
  os_unfair_recursive_lock_unlock();
  v3 = IOServiceOpen(self->_service, *MEMORY[0x24BDAEC58], 0x484944u, &connect);
  if (v3)
    v4 = 1;
  else
    v4 = connect == 0;
  if (!v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    self->_connect = connect;
LABEL_7:
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  v5 = v3;
  _IOHIDLogCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_2310E1DB8();

  return v5;
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  kern_return_t v6;
  NSObject *v8;

  v6 = IOObjectRetain(a4);
  if (v6)
  {
    _IOHIDLogCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2310E1E18();

  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    self->_service = a4;
    os_unfair_recursive_lock_unlock();
  }
  return v6;
}

- (int)stop
{
  return 0;
}

- (int)open:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  int inited;
  kern_return_t v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  NSObject *v17;
  uint8_t v18[8];
  uint64_t input;

  input = a3;
  inited = objc_msgSend_initConnect(self, a2, *(uint64_t *)&a3, v3, v4);
  if (inited)
    return inited;
  v7 = IOConnectCallScalarMethod(self->_connect, 1u, &input, 1u, 0, 0);
  v8 = v7;
  if (v7 == -536870203)
  {
    _IOHIDLogCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2310D3000, v9, OS_LOG_TYPE_INFO, "Device is seized, reports will be dropped until the seizing client closes\n", v18, 2u);
    }

    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    os_unfair_recursive_lock_lock_with_options();
    if (v8)
      v14 = v8 == -536870203;
    else
      v14 = 1;
    v15 = v14;
    self->_opened = v15;
    if (self->_inputReportCallback || self->_inputReportTimestampCallback)
      objc_msgSend_start(self->_queue, v10, v11, v12, v13);
    os_unfair_recursive_lock_unlock();
    return v8;
  }
  _IOHIDLogCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_2310E1E78();

  return v8;
}

- (int)close:(unsigned int)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int inited;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened)
  {
    os_unfair_recursive_lock_unlock();
    inited = objc_msgSend_initConnect(self, v4, v5, v6, v7);
    os_unfair_recursive_lock_lock_with_options();
    if (!inited)
    {
      if (self->_inputReportCallback || self->_inputReportTimestampCallback)
        objc_msgSend_stop(self->_queue, v9, v10, v11, v12);
      os_unfair_recursive_lock_unlock();
      inited = IOConnectCallScalarMethod(self->_connect, 2u, 0, 0, 0, 0);
      os_unfair_recursive_lock_lock_with_options();
      self->_opened = 0;
    }
  }
  else
  {
    inited = -536870195;
  }
  os_unfair_recursive_lock_unlock();
  return inited;
}

- (int)getProperty:(id)a3 property:(const void *)a4
{
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *CFProperty;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int isEqualToString;
  io_registry_entry_t service;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t entryID;

  v6 = (__CFString *)a3;
  if (a4)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_msgSend_objectForKeyedSubscript_(self->_properties, v7, (uint64_t)v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_recursive_lock_unlock();
    if (!v10)
    {
      if (objc_msgSend_isEqualToString_(v6, v11, (uint64_t)CFSTR("UniqueID"), v12, v13))
      {
        entryID = 0xAAAAAAAAAAAAAAAALL;
        IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
        CFProperty = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongLongType, &entryID);
      }
      else
      {
        isEqualToString = objc_msgSend_isEqualToString_(v6, v14, (uint64_t)CFSTR("Built-In"), v15, v16);
        service = self->_service;
        if (isEqualToString)
          CFProperty = (void *)IORegistryEntryCreateCFProperty(service, v6, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        else
          CFProperty = (void *)IORegistryEntrySearchCFProperty(service, "IOService", v6, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
      }
      v10 = CFProperty;
      if (CFProperty)
      {
        v25 = (void *)objc_msgSend_mutableCopy(v6, v18, v19, v20, v21);
        os_unfair_recursive_lock_lock_with_options();
        objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v26, (uint64_t)v10, (uint64_t)v25, v27);
        os_unfair_recursive_lock_unlock();
        CFRelease(v10);

      }
    }
    v22 = 0;
    *a4 = v10;
  }
  else
  {
    v22 = -536870206;
  }

  return v22;
}

- (int)setProperty:(id)a3 property:(id)a4
{
  __CFString *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *DeepCopy;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  IOHIDQueueClass *queue;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  kern_return_t v33;
  const char *v34;
  uint64_t v35;

  v6 = (__CFString *)a3;
  v7 = a4;
  v15 = (void *)objc_msgSend_mutableCopy(v6, v8, v9, v10, v11);
  if (v7)
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 2uLL);
  else
    DeepCopy = 0;
  if (objc_msgSend_isEqualToString_(v6, v12, (uint64_t)CFSTR("IOHIDDeviceSuspend"), v13, v14))
  {
    if (self->_queue)
    {
      v25 = objc_msgSend_BOOLValue(v7, v17, v18, v19, v20);
      queue = self->_queue;
      if (v25)
        objc_msgSend_stop(queue, v21, v22, v23, v24);
      else
        objc_msgSend_start(queue, v21, v22, v23, v24);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("MaxReportBufferCount"), v19, v20) & 1) == 0
    && (objc_msgSend_isEqualToString_(v6, v27, (uint64_t)CFSTR("ReportBufferEntrySize"), v28, v29) & 1) == 0
    && !objc_msgSend_isEqualToString_(v6, v30, (uint64_t)CFSTR("IOHIDDeviceForceInterfaceRematch"), v31, v32))
  {
LABEL_13:
    v33 = 0;
    goto LABEL_14;
  }
  v33 = IOConnectSetCFProperty(self->_connect, v6, v7);
LABEL_14:
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend_setObject_forKeyedSubscript_(self->_properties, v34, (uint64_t)DeepCopy, (uint64_t)v15, v35);
  os_unfair_recursive_lock_unlock();

  return v33;
}

- (int)getAsyncEventSource:(const void *)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    return -536870206;
  objc_msgSend_initPort(self, a2, (uint64_t)a3, v3, v4);
  os_unfair_recursive_lock_lock_with_options();
  *a3 = self->_runLoopSource;
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (id)propertyForElementKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = a3;
  objc_msgSend_substringToIndex_(v3, v4, 1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v13, 0, 1, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)copyObsoleteDictionary:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  id obj;
  uint64_t v189;
  id v190;
  uint64_t v191;
  __int128 v192;
  unsigned int v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  unsigned int v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v190 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  obj = v3;
  v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v198, (uint64_t)v202, 16);
  if (v191)
  {
    v189 = *(_QWORD *)v199;
    do
    {
      for (i = 0; i != v191; ++i)
      {
        if (*(_QWORD *)v199 != v189)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * i);
        *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        HIDWORD(v196) = -1431655766;
        v197 = -1431655766;
        v194 = v11;
        v195 = v11;
        DWORD2(v192) = -1431655766;
        v193 = -1431655766;
        if (v10)
        {
          objc_msgSend_elementStruct(v10, v5, v6, v7, v8);
        }
        else
        {
          v196 = 0u;
          v197 = 0;
          v194 = 0u;
          v195 = 0u;
          v192 = 0u;
          v193 = 0;
        }
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v13 = (void *)MEMORY[0x24BDD16E0];
        v18 = objc_msgSend_elementCookie(v10, v14, v15, v16, v17);
        objc_msgSend_numberWithUnsignedInt_(v13, v19, v18, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v22, (uint64_t)CFSTR("ElementCookie"), v24);

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v25, DWORD2(v192), v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v29, (uint64_t)v28, (uint64_t)CFSTR("CollectionCookie"), v30);

        v31 = (void *)MEMORY[0x24BDD16E0];
        v36 = objc_msgSend_type(v10, v32, v33, v34, v35);
        objc_msgSend_numberWithUnsignedInt_(v31, v37, v36, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v41, (uint64_t)v40, (uint64_t)CFSTR("Type"), v42);

        v43 = (void *)MEMORY[0x24BDD16E0];
        v48 = objc_msgSend_usage(v10, v44, v45, v46, v47);
        objc_msgSend_numberWithUnsignedInt_(v43, v49, v48, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v53, (uint64_t)v52, (uint64_t)CFSTR("Usage"), v54);

        v55 = (void *)MEMORY[0x24BDD16E0];
        v60 = objc_msgSend_usagePage(v10, v56, v57, v58, v59);
        objc_msgSend_numberWithUnsignedInt_(v55, v61, v60, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v65, (uint64_t)v64, (uint64_t)CFSTR("UsagePage"), v66);

        v67 = (void *)MEMORY[0x24BDD16E0];
        v72 = objc_msgSend_reportID(v10, v68, v69, v70, v71);
        objc_msgSend_numberWithUnsignedChar_(v67, v73, v72, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v77, (uint64_t)v76, (uint64_t)CFSTR("ReportID"), v78);

        if (HIDWORD(v196))
        {
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v79, v197, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v12, v83, (uint64_t)v82, (uint64_t)CFSTR("DuplicateIndex"), v84);

        }
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v79, DWORD1(v195), v80, v81);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v86, (uint64_t)v85, (uint64_t)CFSTR("Size"), v87);

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v88, DWORD2(v195), v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v92, (uint64_t)v91, (uint64_t)CFSTR("ReportSize"), v93);

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v94, HIDWORD(v195), v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v98, (uint64_t)v97, (uint64_t)CFSTR("ReportCount"), v99);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v100, (v193 >> 6) & 1, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v104, (uint64_t)v103, (uint64_t)CFSTR("HasNullState"), v105);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v106, (v193 >> 5) & 1, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v110, (uint64_t)v109, (uint64_t)CFSTR("HasPreferredState"), v111);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v112, (v193 >> 4) & 1, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v116, (uint64_t)v115, (uint64_t)CFSTR("IsNonLinear"), v117);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v118, (v193 >> 2) & 1, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v122, (uint64_t)v121, (uint64_t)CFSTR("IsRelative"), v123);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v124, (v193 >> 3) & 1, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v128, (uint64_t)v127, (uint64_t)CFSTR("IsWrapping"), v129);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v130, (v193 >> 1) & 1, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v134, (uint64_t)v133, (uint64_t)CFSTR("IsArray"), v135);

        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v136, DWORD2(v194), v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v140, (uint64_t)v139, (uint64_t)CFSTR("Max"), v141);

        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v142, DWORD1(v194), v143, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v146, (uint64_t)v145, (uint64_t)CFSTR("Min"), v147);

        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v148, v195, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v152, (uint64_t)v151, (uint64_t)CFSTR("ScaledMax"), v153);

        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v154, HIDWORD(v194), v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v158, (uint64_t)v157, (uint64_t)CFSTR("ScaledMin"), v159);

        v160 = (void *)MEMORY[0x24BDD16E0];
        v165 = objc_msgSend_unit(v10, v161, v162, v163, v164);
        objc_msgSend_numberWithUnsignedInt_(v160, v166, v165, v167, v168);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v170, (uint64_t)v169, (uint64_t)CFSTR("Unit"), v171);

        v172 = (void *)MEMORY[0x24BDD16E0];
        v177 = objc_msgSend_unitExponent(v10, v173, v174, v175, v176);
        objc_msgSend_numberWithUnsignedChar_(v172, v178, v177, v179, v180);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v12, v182, (uint64_t)v181, (uint64_t)CFSTR("UnitExponent"), v183);

        objc_msgSend_addObject_(v190, v184, (uint64_t)v12, v185, v186);
      }
      v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v198, (uint64_t)v202, 16);
    }
    while (v191);
  }

  return v190;
}

- (int)copyMatchingElements:(id)a3 elements:(const __CFArray *)a4 options:(unsigned int)a5
{
  char v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int inited;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFArray *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (a4)
  {
    inited = objc_msgSend_initElements(self, v8, v9, v10, v11);
    if (!inited)
    {
      os_unfair_recursive_lock_lock_with_options();
      v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v18 = (void *)objc_msgSend_initWithArray_(v14, v15, (uint64_t)self->_elements, v16, v17);
      os_unfair_recursive_lock_unlock();
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = sub_2310DEEFC;
      v51[3] = &unk_24FFFA4D8;
      v51[4] = self;
      v19 = v18;
      v52 = v19;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v20, (uint64_t)v51, v21, v22);
      if (objc_msgSend_count(v19, v23, v24, v25, v26))
      {
        if ((v5 & 1) != 0)
        {
          v30 = (id)objc_msgSend_copyObsoleteDictionary_(self, v27, (uint64_t)v19, v28, v29);
        }
        else
        {
          v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v31 = v19;
          v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v47, (uint64_t)v53, 16);
          if (v33)
          {
            v38 = v33;
            v39 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v48 != v39)
                  objc_enumerationMutation(v31);
                v41 = objc_msgSend_elementRef(*(void **)(*((_QWORD *)&v47 + 1) + 8 * i), v34, v35, v36, v37, (_QWORD)v47);
                objc_msgSend_addObject_(v30, v42, v41, v43, v44);
              }
              v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v47, (uint64_t)v53, 16);
            }
            while (v38);
          }

        }
      }
      else
      {
        v30 = 0;
      }
      v45 = (const __CFArray *)v30;
      *a4 = v45;

      inited = 0;
    }
  }
  else
  {
    inited = -536870206;
  }

  return inited;
}

- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8
{
  kern_return_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  kern_return_t inited;
  HIDLibElement *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  CFIndex Length;
  size_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t entryID;
  uint64_t input;

  v12 = -536870206;
  input = 0;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_opened)
  {
    v30 = 0;
    v25 = 0;
    v12 = -536870195;
    goto LABEL_17;
  }
  inited = objc_msgSend_initElements(self, v13, v14, v15, v16);
  if (inited)
  {
    v30 = 0;
    v25 = 0;
    v12 = inited;
    goto LABEL_17;
  }
  v18 = [HIDLibElement alloc];
  v25 = (void *)objc_msgSend_initWithElementRef_(v18, v19, (uint64_t)a3, v20, v21);
  if (!v25)
  {
    v30 = 0;
    goto LABEL_21;
  }
  v26 = objc_msgSend_indexOfObject_(self->_elements, v22, (uint64_t)v25, v23, v24);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = 0;
    goto LABEL_17;
  }
  objc_msgSend_objectAtIndex_(self->_elements, v27, v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v30, v31, v32, v33, v34) == 129)
  {
    if (!a4)
      goto LABEL_17;
  }
  else
  {
    v39 = objc_msgSend_type(v30, v35, v36, v37, v38);
    if (!a4 || v39 != 257)
      goto LABEL_17;
  }
  if ((a8 & 0x10000) != 0)
  {
    v12 = 0;
    goto LABEL_17;
  }
  Length = IOHIDValueGetLength(a4);
  if (Length < 0)
  {
LABEL_21:
    v12 = -536870212;
    goto LABEL_17;
  }
  v41 = (Length + 8);
  v42 = malloc_type_malloc(v41, 0x38FC185BuLL);
  _IOHIDValueCopyToElementValueHeader();
  v12 = IOConnectCallMethod(self->_connect, 0xBu, &input, 1u, v42, v41, 0, 0, 0, 0);
  free(v42);
  if (v12)
  {
    entryID = 0xAAAAAAAAAAAAAAAALL;
    IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
    _IOHIDLogCategory();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_2310E1F5C((uint64_t *)&entryID, v12, v46);

  }
  else
  {
    objc_msgSend_setValueRef_(v30, v43, (uint64_t)a4, v44, v45);
  }
LABEL_17:
  os_unfair_recursive_lock_unlock();

  return v12;
}

- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 timeout:(unsigned int)a5 callback:(void *)a6 context:(void *)a7 options:(unsigned int)a8
{
  kern_return_t v8;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  kern_return_t inited;
  HIDLibElement *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *outputStruct;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  uint64_t v60;
  int inputStruct;
  uint64_t input[2];
  _BOOL8 v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = -536870206;
  input[0] = 0;
  input[1] = 0;
  v63 = 0;
  if (!a4)
  {
    v30 = 0;
    v25 = 0;
    goto LABEL_26;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_opened)
  {
    v30 = 0;
    v25 = 0;
    v8 = -536870195;
    goto LABEL_32;
  }
  inited = objc_msgSend_initElements(self, v13, v14, v15, v16);
  if (inited)
  {
    v30 = 0;
    v25 = 0;
    v8 = inited;
    goto LABEL_32;
  }
  v18 = [HIDLibElement alloc];
  v25 = (void *)objc_msgSend_initWithElementRef_(v18, v19, (uint64_t)a3, v20, v21);
  if (!v25)
  {
    v30 = 0;
    v8 = -536870212;
    goto LABEL_32;
  }
  v26 = objc_msgSend_indexOfObject_(self->_elements, v22, (uint64_t)v25, v23, v24);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = 0;
    goto LABEL_32;
  }
  objc_msgSend_objectAtIndex_(self->_elements, v27, v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v30, v31, v32, v33, v34) == 513)
  {
LABEL_32:
    os_unfair_recursive_lock_unlock();
    goto LABEL_26;
  }
  if (objc_msgSend_valueRef(v30, v35, v36, v37, v38))
    *a4 = (__IOHIDValue *)objc_msgSend_valueRef(v30, v39, v40, v41, v42);
  if ((a8 & 0x10000) != 0)
  {
    v8 = 0;
    goto LABEL_32;
  }
  if ((a8 & 0x40000) != 0 || objc_msgSend_type(v30, v39, v40, v41, v42) != 257)
    v63 = (a8 & 0x20000) == 0;
  inputStruct = objc_msgSend_elementCookie(v30, v39, v40, v41, v42);
  objc_msgSend_elementRef(v30, v43, v44, v45, v46);
  v60 = _IOHIDElementGetLength() + 24;
  outputStruct = malloc_type_malloc(v60, 0xFEF6E212uLL);
  v8 = IOConnectCallMethod(self->_connect, 0xAu, input, 3u, &inputStruct, 4uLL, 0, 0, outputStruct, (size_t *)&v60);
  if (v8)
  {
    os_unfair_recursive_lock_unlock();
    if (!outputStruct)
      goto LABEL_26;
  }
  else
  {
    v52 = outputStruct[1];
    if (off_255EB4A90 && off_255EB4A90() && off_255EB4A98)
      v52 = off_255EB4A98(v52);
    if (!objc_msgSend_valueRef(v30, v48, v49, v50, v51)
      || objc_msgSend_timestamp(v30, v53, v54, v55, v56) < v52
      || objc_msgSend_type(v30, v53, v54, v55, v56) == 257)
    {
      objc_msgSend_elementRef(v30, v53, v54, v55, v56);
      v57 = _IOHIDValueCreateWithElementValuePtr();
      if (v57)
      {
        v58 = (const void *)v57;
        objc_msgSend_setValueRef_(v30, v53, v57, v55, v56);
        CFRelease(v58);
      }
    }
    *a4 = (__IOHIDValue *)objc_msgSend_valueRef(v30, v53, v54, v55, v56);
    os_unfair_recursive_lock_unlock();
  }
  free(outputStruct);
LABEL_26:

  return v8;
}

- (void)valueAvailableCallback:(int)a3
{
  char *inputReportBuffer;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex Length;
  IOHIDValueRef v13;
  const uint8_t *BytePtr;
  __IOHIDElement *Element;
  uint64_t ReportID;
  uint64_t TimeStamp;
  void *inputReportCallback;
  void *inputReportTimestampCallback;
  void *inputReportContext;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  CFIndex inputReportBufferLength;
  IOHIDValueRef value;

  value = (IOHIDValueRef)0xAAAAAAAAAAAAAAAALL;
  os_unfair_recursive_lock_lock_with_options();
  inputReportBufferLength = self->_inputReportBufferLength;
  inputReportBuffer = self->_inputReportBuffer;
  os_unfair_recursive_lock_unlock();
  if (!objc_msgSend_copyNextValue_(self->_queue, v5, (uint64_t)&value, v6, v7))
  {
    Length = 0;
    do
    {
      if (IOHIDValueGetBytePtr(value) && IOHIDValueGetLength(value))
      {
        Length = inputReportBufferLength;
        if (inputReportBufferLength >= IOHIDValueGetLength(value))
          Length = IOHIDValueGetLength(value);
        v13 = value;
        if (Length < 0)
          goto LABEL_14;
        BytePtr = IOHIDValueGetBytePtr(value);
        memmove(inputReportBuffer, BytePtr, Length);
      }
      Element = IOHIDValueGetElement(value);
      ReportID = IOHIDElementGetReportID(Element);
      TimeStamp = IOHIDValueGetTimeStamp(value);
      os_unfair_recursive_lock_lock_with_options();
      inputReportCallback = self->_inputReportCallback;
      inputReportTimestampCallback = self->_inputReportTimestampCallback;
      inputReportContext = self->_inputReportContext;
      os_unfair_recursive_lock_unlock();
      if (inputReportCallback)
      {
        os_unfair_recursive_lock_lock_with_options();
        ((void (*)(void *, _QWORD, IOHIDDeviceTimeStampedDeviceInterface **, _QWORD, uint64_t, char *, CFIndex))inputReportCallback)(inputReportContext, 0, &self->_device, 0, ReportID, inputReportBuffer, Length);
        os_unfair_recursive_lock_unlock();
      }
      if (inputReportTimestampCallback)
      {
        os_unfair_recursive_lock_lock_with_options();
        ((void (*)(void *, _QWORD, IOHIDDeviceTimeStampedDeviceInterface **, _QWORD, uint64_t, char *, CFIndex, uint64_t))inputReportTimestampCallback)(inputReportContext, 0, &self->_device, 0, ReportID, inputReportBuffer, Length, TimeStamp);
        os_unfair_recursive_lock_unlock();
      }
      v13 = value;
LABEL_14:
      CFRelease(v13);
    }
    while (!objc_msgSend_copyNextValue_(self->_queue, v21, (uint64_t)&value, v22, v23));
  }
  objc_msgSend_signalQueueEmpty(self->_queue, v8, v9, v10, v11, inputReportBufferLength);
}

- (int)setInputReportCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  os_unfair_recursive_lock_lock_with_options();
  os_unfair_recursive_lock_lock_with_options();
  self->_inputReportBuffer = a3;
  self->_inputReportBufferLength = a4;
  self->_inputReportContext = a6;
  self->_inputReportCallback = a5;
  os_unfair_recursive_lock_unlock();
  os_unfair_recursive_lock_unlock();
  objc_msgSend_initQueue(self, v12, v13, v14, v15);
  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened)
    objc_msgSend_start(self->_queue, v16, v17, v18, v19);
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (int)setReport:(int)a3 reportID:(unsigned int)a4 report:(const char *)a5 reportLength:(int64_t)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10
{
  kern_return_t v17;
  _BOOL4 opened;
  __int128 v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t reference[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t input[2];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v17 = -536870212;
  input[0] = a3;
  input[1] = a4;
  v32 = 0;
  os_unfair_recursive_lock_lock_with_options();
  opened = self->_opened;
  os_unfair_recursive_lock_unlock();
  if (!opened)
    return -536870195;
  if (!a8)
    return IOConnectCallMethod(self->_connect, 0xDu, input, 3u, a5, a6, 0, 0, 0, 0);
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = v19;
  v30 = v19;
  *(_OWORD *)reference = v19;
  v28 = v19;
  v32 = a7;
  v20 = malloc_type_malloc(0x38uLL, 0x109004093AC984DuLL);
  if (v20)
  {
    v25 = v20;
    *v20 = a3;
    *((_QWORD *)v20 + 1) = a5;
    v20[4] = a4;
    *((_QWORD *)v20 + 3) = a8;
    *((_QWORD *)v20 + 4) = a9;
    *((_QWORD *)v20 + 5) = self;
    *((_QWORD *)v20 + 6) = &self->_device;
    reference[1] = (uint64_t)sub_2310DFB38;
    *(_QWORD *)&v28 = v20;
    objc_msgSend_initPort(self, v21, v22, v23, v24);
    v17 = IOConnectCallAsyncMethod(self->_connect, 0xDu, self->_port, reference, 3u, input, 3u, a5, a6, 0, 0, 0, 0);
    if (v17)
      free(v25);
  }
  return v17;
}

- (int)getReport:(int)a3 reportID:(unsigned int)a4 report:(char *)a5 reportLength:(int64_t *)a6 timeout:(unsigned int)a7 callback:(void *)a8 context:(void *)a9 options:(unsigned int)a10
{
  kern_return_t v10;
  _BOOL4 opened;
  __int128 v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t reference[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t input[2];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = -536870212;
  v33 = 0;
  v27 = *a6;
  if (v27 < 1)
    return -536870206;
  os_unfair_recursive_lock_lock_with_options();
  opened = self->_opened;
  os_unfair_recursive_lock_unlock();
  if (!opened)
    return -536870195;
  input[0] = a3;
  input[1] = a4;
  if (!a8)
  {
    v10 = IOConnectCallMethod(self->_connect, 0xCu, input, 3u, 0, 0, 0, 0, a5, (size_t *)&v27);
LABEL_9:
    *a6 = v27;
    return v10;
  }
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = v19;
  v31 = v19;
  *(_OWORD *)reference = v19;
  v29 = v19;
  v33 = a7;
  v20 = malloc_type_malloc(0x38uLL, 0x109004093AC984DuLL);
  if (v20)
  {
    v25 = v20;
    *v20 = a3;
    *((_QWORD *)v20 + 1) = a5;
    v20[4] = a4;
    *((_QWORD *)v20 + 3) = a8;
    *((_QWORD *)v20 + 4) = a9;
    *((_QWORD *)v20 + 5) = self;
    *((_QWORD *)v20 + 6) = &self->_device;
    reference[1] = (uint64_t)sub_2310DFB38;
    *(_QWORD *)&v29 = v20;
    objc_msgSend_initPort(self, v21, v22, v23, v24);
    v10 = IOConnectCallAsyncMethod(self->_connect, 0xCu, self->_port, reference, 3u, input, 3u, 0, 0, 0, 0, a5, (size_t *)&v27);
    if (v10)
      free(v25);
    goto LABEL_9;
  }
  return v10;
}

- (int)setInputReportWithTimeStampCallback:(char *)a3 reportLength:(int64_t)a4 callback:(void *)a5 context:(void *)a6 options:(unsigned int)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  os_unfair_recursive_lock_lock_with_options();
  self->_inputReportBuffer = a3;
  self->_inputReportBufferLength = a4;
  self->_inputReportContext = a6;
  self->_inputReportTimestampCallback = a5;
  os_unfair_recursive_lock_unlock();
  objc_msgSend_initQueue(self, v12, v13, v14, v15);
  os_unfair_recursive_lock_lock_with_options();
  if (self->_opened)
    objc_msgSend_start(self->_queue, v16, v17, v18, v19);
  os_unfair_recursive_lock_unlock();
  return 0;
}

- (void)releaseReport:(unint64_t)a3
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a3;
  IOConnectCallScalarMethod(self->_connect, 0x11u, v3, 1u, 0, 0);
}

- (IOHIDDeviceClass)init
{
  IOHIDDeviceClass *v2;
  char *v3;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *properties;
  IOHIDDeviceClass *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IOHIDDeviceClass;
  v2 = -[IOHIDPlugin init](&v11, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_malloc(0x80uLL, 0x800408754F03FuLL);
    v2->_device = (IOHIDDeviceTimeStampedDeviceInterface *)v3;
    vtbl = v2->super.super._vtbl;
    Release = vtbl->Release;
    v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v3 = v2;
    *(_OWORD *)(v3 + 8) = v6;
    *((_QWORD *)v3 + 3) = Release;
    *((_QWORD *)v3 + 4) = sub_2310E0054;
    *((_QWORD *)v3 + 5) = sub_2310E0064;
    *((_QWORD *)v3 + 6) = sub_2310E0074;
    *((_QWORD *)v3 + 7) = sub_2310E0088;
    *((_QWORD *)v3 + 8) = sub_2310E009C;
    *((_QWORD *)v3 + 9) = sub_2310E00AC;
    *((_QWORD *)v3 + 10) = sub_2310E00C4;
    *((_QWORD *)v3 + 11) = sub_2310E00E8;
    *((_QWORD *)v3 + 12) = sub_2310E010C;
    *((_QWORD *)v3 + 13) = sub_2310E012C;
    *((_QWORD *)v3 + 14) = sub_2310E0178;
    *((_QWORD *)v3 + 15) = sub_2310E01C4;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->_properties;
    v2->_properties = v7;

    v2->_deviceLock = 0;
    v2->_callbackLock = 0;
    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __CFRunLoopSource *runLoopSource;
  __CFMachPort *machPort;
  mach_port_name_t port;
  io_connect_t connect;
  io_object_t service;
  objc_super v8;

  free(self->_device);
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
    CFRelease(runLoopSource);
  machPort = self->_machPort;
  if (machPort)
  {
    CFMachPortInvalidate(machPort);
    CFRelease(self->_machPort);
  }
  port = self->_port;
  if (port)
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], port, 1u, -1);
  connect = self->_connect;
  if (connect)
    IOServiceClose(connect);
  service = self->_service;
  if (service)
    IOObjectRelease(service);
  v8.receiver = self;
  v8.super_class = (Class)IOHIDDeviceClass;
  -[IOHIDPlugin dealloc](&v8, sel_dealloc);
}

- (unsigned)port
{
  return self->_port;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (unsigned)connect
{
  return self->_connect;
}

- (unsigned)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedEvent, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_reportElements, 0);
  objc_storeStrong((id *)&self->_sortedElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
