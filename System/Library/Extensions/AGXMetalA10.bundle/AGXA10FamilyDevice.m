@implementation AGXA10FamilyDevice

- (id)newLateEvalEvent
{
  unsigned __int8 v3;

  if ((v3 & 1) == 0
  {
  }
  return -[_IOGPUMetalMTLLateEvalEvent initWithDevice:]([AGXA10FamilyLateEvalEvent alloc], "initWithDevice:", self);
}

- (unint64_t)bufferRobustnessSupport
{
  if (-[AGXA10FamilyDevice supportsBufferBoundsChecking](self, "supportsBufferBoundsChecking"))
    return 3;
  else
    return 2;
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  return -[AGXA10FamilyDeadlineProfile initWithDevice:executionSize:]([AGXA10FamilyDeadlineProfile alloc], "initWithDevice:executionSize:", -[IOGPUMetalDevice deviceRef](self, "deviceRef"), a3);
}

- (id)allocResidencySet
{
  return [AGXA10FamilyResidencySet alloc];
}

- (AGXA10FamilyDevice)initWithAcceleratorPort:(unsigned int)a3 simultaneousInstances:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_queue_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_queue_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const __CFAllocator *v36;
  const __CFString *v37;
  const __CFString *v38;
  int AppIntegerValue;
  int v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  int AppBooleanValue;
  BOOL v45;
  char v46;
  const __CFString *v47;
  const __CFString *v48;
  int v49;
  int v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  int v54;
  BOOL v55;
  char v56;
  const __CFString *v57;
  const __CFString *v58;
  int v59;
  BOOL v60;
  char v61;
  const __CFString *v62;
  const __CFString *v63;
  int v64;
  BOOL v65;
  char v66;
  IONotificationPort *v67;
  uint64_t v68;
  NSObject *global_queue;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int program_sdk_version;
  int v82;
  BOOL v83;
  void *v84;
  mach_port_t Connect;
  int v86;
  mach_port_t v87;
  mach_error_t v88;
  size_t v89;
  size_t v90;
  _BYTE *v91;
  NSObject *v92;
  const char *v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  void *v99;
  _BYTE *v100;
  _BYTE *v101;
  _BYTE *v102;
  void *v103;
  _DWORD *v104;
  mach_port_t v106;
  mach_port_t MachPort;
  mach_error_t v108;
  mach_error_t v109;
  FILE *v110;
  char *v111;
  char *v112;
  mach_port_t v113;
  mach_error_t v114;
  mach_error_t v115;
  FILE *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  unsigned int v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  uint8x8_t v129;
  __int32 v130;
  uint8x8_t v131;
  unsigned int v132;
  uint64_t v133;
  char v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  size_t v139;
  int8x8_t v140;
  uint8x8_t v141;
  __int32 v142;
  uint8x8_t v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  unsigned int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  unsigned __int8 v173;
  unsigned __int8 v174;
  unsigned __int8 v175;
  NSObject *v176;
  NSObject *v177;
  double v178;
  dispatch_time_t v179;
  NSObject *v180;
  uint64_t v181;
  uint64_t v182;
  char *v184;
  char *v185;
  mach_error_t v186;
  FILE *v187;
  char *v188;
  char *v189;
  char *v190;
  uint64_t v191;
  void *v192;
  objc_super v194;
  size_t v195;
  size_t outputStructCnt;
  uint64_t v197;
  Boolean keyExistsAndHasValidFormat[48];
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  char v210[224];
  uint64_t v211;
  _BYTE buf[28];
  __int16 v213;
  int v214;
  __int16 v215;
  _BYTE v216[14];
  __int16 v217;
  char *v218;
  uint64_t v219;

  v4 = *(_QWORD *)&a3;
  v219 = *MEMORY[0x24BDAC8D0];
  gatherDeviceOptions(AGX::G9::Device *,NSString **,NSString **)::deviceOptions = 0;
  if (gatherDeviceOptions(AGX::G9::Device *,NSString **,NSString **)::once != -1)
    dispatch_once(&gatherDeviceOptions(AGX::G9::Device *,NSString **,NSString **)::once, &__block_literal_global_1560);
  v6 = gatherDeviceOptions(AGX::G9::Device *,NSString **,NSString **)::deviceOptions;
  v194.receiver = self;
  v194.super_class = (Class)AGXA10FamilyDevice;
  v7 = -[IOGPUMetalDevice initWithAcceleratorPort:options:](&v194, sel_initWithAcceleratorPort_options_, v4, (unsigned __int16)gatherDeviceOptions(AGX::G9::Device *,NSString **,NSString **)::kernelOptions);
  if (v7)
  {
    v8 = operator new();
    *(_DWORD *)(v8 + 72) = 0;
    bzero((void *)(v8 + 80), 0x1100uLL);
    *(_QWORD *)(v8 + 4440) = 0;
    *(_QWORD *)(v8 + 4488) = objc_msgSend(v7, "deviceRef");
    *(_QWORD *)(v8 + 4496) = v7;
    *(_DWORD *)(v8 + 4504) = 0;
    *(_QWORD *)keyExistsAndHasValidFormat = MEMORY[0x24BDAC760];
    *(_QWORD *)&keyExistsAndHasValidFormat[8] = 3221225472;
    *(_QWORD *)&keyExistsAndHasValidFormat[16] = ___ZN3AGX20DevicePDSStateLoaderINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE11heapConfigsEP13AtomicVersion_block_invoke;
    *(_QWORD *)&keyExistsAndHasValidFormat[24] = &__block_descriptor_40_e5_v8__0l;
    *(_QWORD *)&keyExistsAndHasValidFormat[32] = v8 + 4504;
    if (AGX::DevicePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::heapConfigs(AtomicVersion *)::once != -1)
      dispatch_once(&AGX::DevicePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::heapConfigs(AtomicVersion *)::once, keyExistsAndHasValidFormat);
    *(_QWORD *)(v8 + 4824) = 32;
    *(_QWORD *)(v8 + 4992) = 32;
    *(_QWORD *)(v8 + 5160) = 32;
    v9 = (const char *)AGX::DevicePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::heap_configs;
    v200 = unk_254235840;
    v201 = unk_254235850;
    *(_QWORD *)&v202 = qword_254235860;
    *(_OWORD *)keyExistsAndHasValidFormat = unk_254235800;
    *(_OWORD *)&keyExistsAndHasValidFormat[16] = unk_254235810;
    *(_OWORD *)&keyExistsAndHasValidFormat[32] = unk_254235820;
    v199 = unk_254235830;
    v10 = qword_254235870;
    v11 = unk_254235878;
    *(_QWORD *)(v8 + 4648) = (unk_254235868 + 63) & 0xFFFFFFFFFFFFFFC0;
    if (!v10)
      v10 = 32;
    *(_QWORD *)(v8 + 4656) = v10;
    *(_QWORD *)(v8 + 4672) = v11;
    v12 = dispatch_queue_create(v9, 0);
    v13 = *(_OWORD *)&keyExistsAndHasValidFormat[32];
    *(_OWORD *)(v8 + 4592) = v199;
    v14 = v201;
    *(_OWORD *)(v8 + 4608) = v200;
    *(_OWORD *)(v8 + 4624) = v14;
    v15 = *(_OWORD *)&keyExistsAndHasValidFormat[16];
    *(_OWORD *)(v8 + 4544) = *(_OWORD *)keyExistsAndHasValidFormat;
    *(_QWORD *)(v8 + 4528) = v12;
    *(_QWORD *)(v8 + 4536) = v7;
    *(_QWORD *)(v8 + 4640) = v202;
    *(_OWORD *)(v8 + 4560) = v15;
    *(_OWORD *)(v8 + 4576) = v13;
    *(_QWORD *)(v8 + 4512) = 0;
    *(_QWORD *)(v8 + 4520) = v8 + 4512;
    v16 = (const char *)qword_254235880;
    v200 = xmmword_2542358C8;
    v201 = unk_2542358D8;
    *(_QWORD *)&v202 = qword_2542358E8;
    *(_OWORD *)keyExistsAndHasValidFormat = xmmword_254235888;
    *(_OWORD *)&keyExistsAndHasValidFormat[16] = unk_254235898;
    *(_OWORD *)&keyExistsAndHasValidFormat[32] = xmmword_2542358A8;
    v199 = unk_2542358B8;
    v17 = qword_2542358F8;
    v18 = qword_254235900;
    *(_QWORD *)(v8 + 4816) = (unk_2542358F0 + 63) & 0xFFFFFFFFFFFFFFC0;
    if (!v17)
      v17 = 32;
    *(_QWORD *)(v8 + 4824) = v17;
    *(_QWORD *)(v8 + 4840) = v18;
    *(_QWORD *)(v8 + 4696) = dispatch_queue_create(v16, 0);
    *(_QWORD *)(v8 + 4704) = v7;
    v19 = *(_OWORD *)&keyExistsAndHasValidFormat[32];
    *(_OWORD *)(v8 + 4760) = v199;
    v20 = v201;
    *(_OWORD *)(v8 + 4776) = v200;
    *(_OWORD *)(v8 + 4792) = v20;
    *(_QWORD *)(v8 + 4808) = v202;
    v21 = *(_OWORD *)&keyExistsAndHasValidFormat[16];
    *(_OWORD *)(v8 + 4712) = *(_OWORD *)keyExistsAndHasValidFormat;
    *(_OWORD *)(v8 + 4728) = v21;
    *(_OWORD *)(v8 + 4744) = v19;
    *(_QWORD *)(v8 + 4680) = 0;
    *(_QWORD *)(v8 + 4688) = v8 + 4680;
    v22 = (const char *)qword_254235908;
    v200 = unk_254235950;
    v201 = unk_254235960;
    *(_QWORD *)&v202 = qword_254235970;
    *(_OWORD *)keyExistsAndHasValidFormat = unk_254235910;
    *(_OWORD *)&keyExistsAndHasValidFormat[16] = unk_254235920;
    *(_OWORD *)&keyExistsAndHasValidFormat[32] = unk_254235930;
    v199 = unk_254235940;
    v23 = qword_254235980;
    v24 = unk_254235988;
    *(_QWORD *)(v8 + 4984) = (unk_254235978 + 63) & 0xFFFFFFFFFFFFFFC0;
    if (!v23)
      v23 = 32;
    *(_QWORD *)(v8 + 4992) = v23;
    *(_QWORD *)(v8 + 5008) = v24;
    v25 = dispatch_queue_create(v22, 0);
    v26 = *(_OWORD *)&keyExistsAndHasValidFormat[32];
    *(_OWORD *)(v8 + 4928) = v199;
    v27 = v201;
    *(_OWORD *)(v8 + 4944) = v200;
    *(_OWORD *)(v8 + 4960) = v27;
    v28 = *(_OWORD *)&keyExistsAndHasValidFormat[16];
    *(_OWORD *)(v8 + 4880) = *(_OWORD *)keyExistsAndHasValidFormat;
    *(_QWORD *)(v8 + 4864) = v25;
    *(_QWORD *)(v8 + 4872) = v7;
    *(_QWORD *)(v8 + 4976) = v202;
    *(_OWORD *)(v8 + 4896) = v28;
    *(_OWORD *)(v8 + 4912) = v26;
    *(_QWORD *)(v8 + 4848) = 0;
    *(_QWORD *)(v8 + 4856) = v8 + 4848;
    v29 = (const char *)qword_254235990;
    v200 = xmmword_2542359D8;
    v201 = unk_2542359E8;
    *(_QWORD *)&v202 = qword_2542359F8;
    *(_OWORD *)keyExistsAndHasValidFormat = xmmword_254235998;
    *(_OWORD *)&keyExistsAndHasValidFormat[16] = unk_2542359A8;
    *(_OWORD *)&keyExistsAndHasValidFormat[32] = xmmword_2542359B8;
    v199 = unk_2542359C8;
    v30 = *((_QWORD *)&xmmword_254235A00 + 1);
    v31 = qword_254235A10;
    *(_QWORD *)(v8 + 5152) = (xmmword_254235A00 + 63) & 0xFFFFFFFFFFFFFFC0;
    if (v30)
      v32 = v30;
    else
      v32 = 32;
    *(_QWORD *)(v8 + 5160) = v32;
    *(_QWORD *)(v8 + 5176) = v31;
    *(_QWORD *)(v8 + 5032) = dispatch_queue_create(v29, 0);
    *(_QWORD *)(v8 + 5040) = v7;
    v33 = v201;
    *(_OWORD *)(v8 + 5112) = v200;
    *(_OWORD *)(v8 + 5128) = v33;
    *(_QWORD *)(v8 + 5144) = v202;
    v34 = *(_OWORD *)&keyExistsAndHasValidFormat[16];
    *(_OWORD *)(v8 + 5048) = *(_OWORD *)keyExistsAndHasValidFormat;
    *(_OWORD *)(v8 + 5064) = v34;
    v35 = v199;
    *(_OWORD *)(v8 + 5080) = *(_OWORD *)&keyExistsAndHasValidFormat[32];
    *(_OWORD *)(v8 + 5096) = v35;
    *(_QWORD *)(v8 + 5016) = 0;
    *(_QWORD *)(v8 + 5024) = v8 + 5016;
    *(_OWORD *)(v8 + 5212) = 0u;
    *(_OWORD *)(v8 + 5200) = 0u;
    *(_OWORD *)(v8 + 5184) = 0u;
    *(_QWORD *)&v35 = 0x100000001;
    *((_QWORD *)&v35 + 1) = 0x100000001;
    *(_OWORD *)(v8 + 5228) = v35;
    *(_QWORD *)(v8 + 5244) = 0x100000001;
    *(_OWORD *)(v8 + 5252) = 0u;
    *(_OWORD *)(v8 + 5268) = 0u;
    *(_OWORD *)(v8 + 5284) = 0u;
    *(_OWORD *)(v8 + 5293) = 0u;
    *(_BYTE *)(v8 + 5309) = 1;
    *(_QWORD *)(v8 + 5310) = 0x100000000;
    *(_OWORD *)(v8 + 5328) = 0u;
    *(_OWORD *)(v8 + 5344) = 0u;
    *(_OWORD *)(v8 + 5360) = 0u;
    *(_OWORD *)(v8 + 5376) = 0u;
    *(_QWORD *)(v8 + 5392) = 0;
    *(_DWORD *)(v8 + 5520) = 0;
    *(_OWORD *)(v8 + 5504) = 0u;
    *(_OWORD *)(v8 + 5488) = 0u;
    *(_OWORD *)(v8 + 5472) = 0u;
    *(_OWORD *)(v8 + 5456) = 0u;
    *(_OWORD *)(v8 + 5440) = 0u;
    *(_DWORD *)(v8 + 5544) = 0;
    *(_OWORD *)(v8 + 5528) = 0u;
    *(_QWORD *)(v8 + 5552) = v8 + 5528;
    *(_DWORD *)(v8 + 5576) = 0;
    *(_OWORD *)(v8 + 5560) = 0u;
    LOBYTE(v35) = 0;
    BYTE4(v35) = 0;
    BYTE8(v35) = 0;
    BYTE12(v35) = 0;
    *(_QWORD *)(v8 + 5584) = v8 + 5520;
    *(_QWORD *)(v8 + 5600) = v8 + 5594;
    *(_QWORD *)(v8 + 5624) = 0;
    *(_OWORD *)(v8 + 5608) = v35;
    *(_QWORD *)(v8 + 5632) = 104;
    *(_QWORD *)(v8 + 5640) = v35;
    *(_QWORD *)(v8 + 5712) = 21416;
    *(_QWORD *)(v8 + 5720) = v35;
    *(_QWORD *)(v8 + 5792) = 3248;
    *(_QWORD *)(v8 + 5800) = v35;
    *(_QWORD *)(v8 + 5936) = 3880;
    *(_QWORD *)(v8 + 5944) = v35;
    *(_QWORD *)(v8 + 6024) = 24;
    *(_QWORD *)(v8 + 6032) = v35;
    *(_QWORD *)(v8 + 6104) = 1;
    *(_QWORD *)(v8 + 6112) = v35;
    *(_QWORD *)(v8 + 6184) = 0;
    *(_QWORD *)(v8 + 6208) = dispatch_queue_create("com.apple.AGXMetal.FenceGroupPool", 0);
    *(_OWORD *)(v8 + 6192) = 0u;
    *(_QWORD *)(v8 + 6224) = v6;
    *(_QWORD *)(v8 + 6232) = 0x2000000020;
    *(_QWORD *)(v8 + 6240) = 0;
    *(_DWORD *)(v8 + 6416) = 0;
    *(_OWORD *)(v8 + 6432) = 0u;
    *(_OWORD *)(v8 + 6312) = 0u;
    *(_OWORD *)(v8 + 6328) = 0u;
    *(_OWORD *)(v8 + 6337) = 0u;
    *(_QWORD *)(v8 + 6424) = v8 + 6432;
    *(_DWORD *)(v8 + 6448) = 0;
    *(_OWORD *)(v8 + 6464) = 0u;
    *(_QWORD *)(v8 + 6456) = v8 + 6464;
    *(_OWORD *)(v8 + 6520) = 0u;
    *(_OWORD *)(v8 + 6480) = 0u;
    *(_DWORD *)(v8 + 6504) = 0;
    *(_QWORD *)(v8 + 6496) = 0;
    *(_QWORD *)(v8 + 6512) = v8 + 6520;
    *(_OWORD *)(v8 + 6552) = 0u;
    *(_OWORD *)(v8 + 6536) = 0u;
    *(_QWORD *)(v8 + 6568) = 0;
    *(_QWORD *)(v8 + 6544) = v8 + 6552;
    *(_OWORD *)(v8 + 6576) = 0u;
    *(_OWORD *)(v8 + 6592) = 0u;
    *(_OWORD *)(v8 + 6608) = 0u;
    *(_QWORD *)(v8 + 6584) = v8 + 6592;
    *(_WORD *)(v8 + 6724) = 0;
    *(_DWORD *)(v8 + 6728) = 0;
    *(_BYTE *)(v8 + 6732) = 0;
    *(_OWORD *)(v8 + 6632) = 0u;
    *(_OWORD *)(v8 + 6648) = 0u;
    *(_OWORD *)(v8 + 6664) = 0u;
    *(_QWORD *)(v8 + 6744) = 1;
    *(_OWORD *)(v8 + 6880) = 0u;
    *(_OWORD *)(v8 + 6896) = 0u;
    *(_QWORD *)(v8 + 6752) = 0;
    *(_QWORD *)(v8 + 6832) = 0;
    *(_OWORD *)(v8 + 6816) = 0u;
    *(_OWORD *)(v8 + 6800) = 0u;
    *(_OWORD *)(v8 + 6848) = 0u;
    *(_DWORD *)(v8 + 6872) = 0;
    *(_QWORD *)(v8 + 6864) = 0;
    *(_DWORD *)(v8 + 6912) = 1065353216;
    *(_QWORD *)(v8 + 6928) = 0;
    *(_QWORD *)(v8 + 6936) = 20;
    *(_OWORD *)(v8 + 6952) = 0u;
    *(_DWORD *)(v8 + 6944) = 0;
    *(_QWORD *)(v8 + 6968) = 0;
    *(_DWORD *)(v8 + 6976) = 0;
    *(_OWORD *)(v8 + 6984) = 0u;
    *(_QWORD *)(v8 + 7000) = objc_msgSend(v7, "globalTraceObjectID");
    keyExistsAndHasValidFormat[0] = 0;
    v36 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v37 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "VertexInstanceBoundsCheckMode", 0x8000100u);
    if (v37)
    {
      v38 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
      if (v38)
      {
        AppIntegerValue = CFPreferencesGetAppIntegerValue(v37, v38, keyExistsAndHasValidFormat);
        CFRelease(v37);
        CFRelease(v38);
        if (keyExistsAndHasValidFormat[0])
          v40 = AppIntegerValue;
        else
          v40 = 0;
LABEL_22:
        v41 = v40 & ~(v40 >> 31);
        if (v41 >= 2)
          v41 = 2;
        *(_DWORD *)(v8 + 6728) = v41;
        keyExistsAndHasValidFormat[0] = 0;
        v42 = CFStringCreateWithCString(v36, "DisableDriverSuballocation", 0x8000100u);
        if (v42)
        {
          v43 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
          if (v43)
          {
            AppBooleanValue = CFPreferencesGetAppBooleanValue(v42, v43, keyExistsAndHasValidFormat);
            CFRelease(v42);
            CFRelease(v43);
            if (keyExistsAndHasValidFormat[0])
              v45 = AppBooleanValue == 0;
            else
              v45 = 1;
            v46 = !v45;
LABEL_34:
            *(_BYTE *)(v8 + 6725) = v46;
            keyExistsAndHasValidFormat[0] = 0;
            v47 = CFStringCreateWithCString(v36, "CPUMappingForPrivateTexturesMode", 0x8000100u);
            if (v47)
            {
              v48 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
              if (v48)
              {
                v49 = CFPreferencesGetAppIntegerValue(v47, v48, keyExistsAndHasValidFormat);
                CFRelease(v47);
                CFRelease(v48);
                if (keyExistsAndHasValidFormat[0])
                  v50 = v49;
                else
                  v50 = 0;
LABEL_41:
                v51 = v50 & ~(v50 >> 31);
                if (v51 >= 2)
                  v51 = 2;
                *(_DWORD *)(v8 + 6720) = v51;
                keyExistsAndHasValidFormat[0] = 0;
                v52 = CFStringCreateWithCString(v36, "IOSurfaceCompressedWriteValidation", 0x8000100u);
                if (v52)
                {
                  v53 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
                  if (v53)
                  {
                    v54 = CFPreferencesGetAppBooleanValue(v52, v53, keyExistsAndHasValidFormat);
                    CFRelease(v52);
                    CFRelease(v53);
                    if (keyExistsAndHasValidFormat[0])
                      v55 = v54 == 0;
                    else
                      v55 = 1;
                    v56 = !v55;
LABEL_53:
                    *(_BYTE *)(v8 + 6732) = v56;
                    keyExistsAndHasValidFormat[0] = 0;
                    v57 = CFStringCreateWithCString(v36, "CommandQueueLifetimeTracing", 0x8000100u);
                    if (v57)
                    {
                      v58 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
                      if (v58)
                      {
                        v59 = CFPreferencesGetAppBooleanValue(v57, v58, keyExistsAndHasValidFormat);
                        CFRelease(v57);
                        CFRelease(v58);
                        if (keyExistsAndHasValidFormat[0])
                          v60 = v59 == 0;
                        else
                          v60 = 1;
                        v61 = !v60;
LABEL_63:
                        *(_BYTE *)(v8 + 6733) = v61;
                        keyExistsAndHasValidFormat[0] = 0;
                        v62 = CFStringCreateWithCString(v36, "UMACalcTracing", 0x8000100u);
                        if (v62)
                        {
                          v63 = CFStringCreateWithCString(v36, "com.apple.Metal", 0x8000100u);
                          if (v63)
                          {
                            v64 = CFPreferencesGetAppBooleanValue(v62, v63, keyExistsAndHasValidFormat);
                            CFRelease(v62);
                            CFRelease(v63);
                            if (keyExistsAndHasValidFormat[0])
                              v65 = v64 == 0;
                            else
                              v65 = 1;
                            v66 = !v65;
LABEL_73:
                            *(_BYTE *)(v8 + 6734) = v66;
                            *(_QWORD *)&v200 = 0;
                            *(_WORD *)keyExistsAndHasValidFormat = 0;
                            *(_QWORD *)&keyExistsAndHasValidFormat[8] = 0x7F7FFFFF00000000;
                            memset(&keyExistsAndHasValidFormat[16], 0, 20);
                            *(_DWORD *)&keyExistsAndHasValidFormat[4] = 1;
                            *(_QWORD *)&keyExistsAndHasValidFormat[40] = 0;
                            v199 = 0uLL;
                            AGX::SamplerStateEncoderGen2<kAGXRevG9>::SamplerStateFields::SamplerStateFields((unint64_t *)buf, (float *)keyExistsAndHasValidFormat);
                            *(_QWORD *)(v8 + 6216) = *(_QWORD *)buf;
                            v67 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
                            v68 = v8 + 4465;
                            *(_QWORD *)(v8 + 6624) = v67;
                            if (v67)
                            {
                              global_queue = dispatch_get_global_queue(21, 0);
                              IONotificationPortSetDispatchQueue(v67, global_queue);
                              v70 = (_QWORD *)operator new();
                              bzero(v70, 0x480uLL);
                              *((_DWORD *)v70 + 2) = 13;
                              v70[3] = 0;
                              v70[4] = 0;
                              v70[2] = 0;
                              *v70 = off_2504019E0;
                              *(_OWORD *)(v70 + 5) = 0u;
                              *(_OWORD *)(v70 + 7) = 0u;
                              *(_OWORD *)(v70 + 9) = 0u;
                              *((_DWORD *)v70 + 24) = 13;
                              v70[14] = 0;
                              v70[15] = 0;
                              v70[13] = 0;
                              v70[11] = off_2504019E0;
                              *((_OWORD *)v70 + 8) = 0u;
                              *((_OWORD *)v70 + 9) = 0u;
                              *((_OWORD *)v70 + 10) = 0u;
                              *((_DWORD *)v70 + 46) = 13;
                              v70[25] = 0;
                              v70[26] = 0;
                              v70[24] = 0;
                              v70[22] = off_2504019E0;
                              *(_OWORD *)(v70 + 31) = 0u;
                              *(_OWORD *)(v70 + 29) = 0u;
                              *(_OWORD *)(v70 + 27) = 0u;
                              *((_DWORD *)v70 + 68) = 13;
                              v70[35] = 0;
                              v70[36] = 0;
                              v70[37] = 0;
                              v70[33] = off_2504019E0;
                              *(_OWORD *)((char *)v70 + 426) = 0u;
                              *((_OWORD *)v70 + 25) = 0u;
                              *((_OWORD *)v70 + 26) = 0u;
                              *((_OWORD *)v70 + 28) = 0u;
                              *((_OWORD *)v70 + 29) = 0u;
                              *(_OWORD *)((char *)v70 + 474) = 0u;
                              *((_OWORD *)v70 + 31) = 0u;
                              *((_OWORD *)v70 + 32) = 0u;
                              *(_OWORD *)((char *)v70 + 522) = 0u;
                              *(_OWORD *)((char *)v70 + 378) = 0u;
                              *((_OWORD *)v70 + 22) = 0u;
                              *((_OWORD *)v70 + 23) = 0u;
                              *((_OWORD *)v70 + 20) = 0u;
                              *((_OWORD *)v70 + 21) = 0u;
                              *((_OWORD *)v70 + 19) = 0u;
                              v70[69] = v70;
                              *(_OWORD *)((char *)v70 + 594) = 0u;
                              *(_OWORD *)(v70 + 71) = 0u;
                              *(_OWORD *)(v70 + 73) = 0u;
                              *(_OWORD *)(v70 + 101) = 0u;
                              *(_OWORD *)(v70 + 103) = 0u;
                              *(_OWORD *)(v70 + 97) = 0u;
                              *(_OWORD *)(v70 + 99) = 0u;
                              *(_OWORD *)(v70 + 93) = 0u;
                              *(_OWORD *)(v70 + 95) = 0u;
                              *(_OWORD *)(v70 + 89) = 0u;
                              *(_OWORD *)(v70 + 91) = 0u;
                              *(_OWORD *)(v70 + 85) = 0u;
                              *(_OWORD *)(v70 + 87) = 0u;
                              *(_OWORD *)(v70 + 81) = 0u;
                              *(_OWORD *)(v70 + 83) = 0u;
                              *(_OWORD *)(v70 + 77) = 0u;
                              *(_OWORD *)(v70 + 79) = 0u;
                              v70[106] = v70 + 77;
                              v70[109] = 0;
                              v70[108] = 0;
                              *((_DWORD *)v70 + 222) = 0;
                              v70[110] = 0;
                              *(_OWORD *)((char *)v70 + 1129) = 0u;
                              *((_OWORD *)v70 + 70) = 0u;
                              *((_OWORD *)v70 + 69) = 0u;
                              *((_OWORD *)v70 + 68) = 0u;
                              *((_OWORD *)v70 + 67) = 0u;
                              *((_OWORD *)v70 + 66) = 0u;
                              *((_OWORD *)v70 + 65) = 0u;
                              *((_OWORD *)v70 + 63) = 0u;
                              *((_OWORD *)v70 + 64) = 0u;
                              *((_OWORD *)v70 + 61) = 0u;
                              *((_OWORD *)v70 + 62) = 0u;
                              *((_OWORD *)v70 + 59) = 0u;
                              *((_OWORD *)v70 + 60) = 0u;
                              *((_OWORD *)v70 + 57) = 0u;
                              *((_OWORD *)v70 + 58) = 0u;
                              *((_OWORD *)v70 + 56) = 0u;
                              *(_QWORD *)v8 = v70;
                              v71 = (_QWORD *)operator new();
                              bzero(v71, 0x520uLL);
                              *((_DWORD *)v71 + 2) = 19;
                              v71[3] = 0;
                              v71[4] = 0;
                              v71[2] = 0;
                              *v71 = off_250401A60;
                              *(_OWORD *)(v71 + 5) = 0u;
                              *(_OWORD *)(v71 + 7) = 0u;
                              *(_OWORD *)(v71 + 9) = 0u;
                              *(_OWORD *)(v71 + 11) = 0u;
                              *(_OWORD *)(v71 + 13) = 0u;
                              *(_QWORD *)((char *)v71 + 118) = 0;
                              *((_DWORD *)v71 + 34) = 19;
                              v71[19] = 0;
                              v71[20] = 0;
                              v71[18] = 0;
                              v71[16] = off_250401A60;
                              *(_OWORD *)(v71 + 21) = 0u;
                              *(_OWORD *)(v71 + 23) = 0u;
                              *(_OWORD *)(v71 + 25) = 0u;
                              *(_OWORD *)(v71 + 27) = 0u;
                              *(_OWORD *)(v71 + 29) = 0u;
                              *(_QWORD *)((char *)v71 + 246) = 0;
                              *((_DWORD *)v71 + 66) = 19;
                              v71[34] = 0;
                              v71[35] = 0;
                              v71[36] = 0;
                              v71[32] = off_250401A60;
                              *(_QWORD *)((char *)v71 + 374) = 0;
                              *(_OWORD *)(v71 + 45) = 0u;
                              *(_OWORD *)(v71 + 43) = 0u;
                              *(_OWORD *)(v71 + 41) = 0u;
                              *(_OWORD *)(v71 + 39) = 0u;
                              *(_OWORD *)(v71 + 37) = 0u;
                              *((_DWORD *)v71 + 98) = 19;
                              v71[50] = 0;
                              v71[51] = 0;
                              v71[52] = 0;
                              v71[48] = off_250401A60;
                              *(_QWORD *)((char *)v71 + 502) = 0;
                              *(_OWORD *)(v71 + 61) = 0u;
                              *(_OWORD *)(v71 + 59) = 0u;
                              *(_OWORD *)(v71 + 57) = 0u;
                              *(_OWORD *)(v71 + 55) = 0u;
                              *(_OWORD *)(v71 + 53) = 0u;
                              *(_OWORD *)((char *)v71 + 538) = 0u;
                              *((_OWORD *)v71 + 32) = 0u;
                              *((_OWORD *)v71 + 33) = 0u;
                              *(_OWORD *)((char *)v71 + 586) = 0u;
                              *((_OWORD *)v71 + 35) = 0u;
                              *((_OWORD *)v71 + 36) = 0u;
                              *(_OWORD *)((char *)v71 + 634) = 0u;
                              *((_OWORD *)v71 + 38) = 0u;
                              *((_OWORD *)v71 + 39) = 0u;
                              *(_OWORD *)((char *)v71 + 682) = 0u;
                              *((_OWORD *)v71 + 41) = 0u;
                              *((_OWORD *)v71 + 42) = 0u;
                              v71[89] = v71;
                              *(_OWORD *)((char *)v71 + 754) = 0u;
                              *(_OWORD *)(v71 + 91) = 0u;
                              *(_OWORD *)(v71 + 93) = 0u;
                              *(_OWORD *)(v71 + 121) = 0u;
                              *(_OWORD *)(v71 + 123) = 0u;
                              *(_OWORD *)(v71 + 117) = 0u;
                              *(_OWORD *)(v71 + 119) = 0u;
                              *(_OWORD *)(v71 + 113) = 0u;
                              *(_OWORD *)(v71 + 115) = 0u;
                              *(_OWORD *)(v71 + 109) = 0u;
                              *(_OWORD *)(v71 + 111) = 0u;
                              *(_OWORD *)(v71 + 105) = 0u;
                              *(_OWORD *)(v71 + 107) = 0u;
                              *(_OWORD *)(v71 + 101) = 0u;
                              *(_OWORD *)(v71 + 103) = 0u;
                              *(_OWORD *)(v71 + 97) = 0u;
                              *(_OWORD *)(v71 + 99) = 0u;
                              v71[126] = v71 + 97;
                              v71[129] = 0;
                              v71[128] = 0;
                              *((_DWORD *)v71 + 262) = 0;
                              v71[130] = 0;
                              *(_OWORD *)((char *)v71 + 1289) = 0u;
                              *((_OWORD *)v71 + 80) = 0u;
                              *((_OWORD *)v71 + 79) = 0u;
                              *((_OWORD *)v71 + 78) = 0u;
                              *((_OWORD *)v71 + 77) = 0u;
                              *((_OWORD *)v71 + 76) = 0u;
                              *((_OWORD *)v71 + 75) = 0u;
                              *((_OWORD *)v71 + 74) = 0u;
                              *((_OWORD *)v71 + 73) = 0u;
                              *((_OWORD *)v71 + 72) = 0u;
                              *((_OWORD *)v71 + 71) = 0u;
                              *((_OWORD *)v71 + 70) = 0u;
                              *((_OWORD *)v71 + 69) = 0u;
                              *((_OWORD *)v71 + 68) = 0u;
                              *((_OWORD *)v71 + 67) = 0u;
                              *((_OWORD *)v71 + 66) = 0u;
                              *(_QWORD *)(v8 + 8) = v71;
                              v72 = (_QWORD *)operator new();
                              bzero(v72, 0x520uLL);
                              *((_DWORD *)v72 + 2) = 19;
                              v72[3] = 0;
                              v72[4] = 0;
                              v72[2] = 0;
                              *v72 = off_250401A60;
                              *(_OWORD *)(v72 + 5) = 0u;
                              *(_OWORD *)(v72 + 7) = 0u;
                              *(_OWORD *)(v72 + 9) = 0u;
                              *(_OWORD *)(v72 + 11) = 0u;
                              *(_OWORD *)(v72 + 13) = 0u;
                              *(_QWORD *)((char *)v72 + 118) = 0;
                              *((_DWORD *)v72 + 34) = 19;
                              v72[19] = 0;
                              v72[20] = 0;
                              v72[18] = 0;
                              v72[16] = off_250401A60;
                              *(_OWORD *)(v72 + 21) = 0u;
                              *(_OWORD *)(v72 + 23) = 0u;
                              *(_OWORD *)(v72 + 25) = 0u;
                              *(_OWORD *)(v72 + 27) = 0u;
                              *(_OWORD *)(v72 + 29) = 0u;
                              *(_QWORD *)((char *)v72 + 246) = 0;
                              *((_DWORD *)v72 + 66) = 19;
                              v72[34] = 0;
                              v72[35] = 0;
                              v72[36] = 0;
                              v72[32] = off_250401A60;
                              *(_QWORD *)((char *)v72 + 374) = 0;
                              *(_OWORD *)(v72 + 45) = 0u;
                              *(_OWORD *)(v72 + 43) = 0u;
                              *(_OWORD *)(v72 + 41) = 0u;
                              *(_OWORD *)(v72 + 39) = 0u;
                              *(_OWORD *)(v72 + 37) = 0u;
                              *((_DWORD *)v72 + 98) = 19;
                              v72[50] = 0;
                              v72[51] = 0;
                              v72[52] = 0;
                              v72[48] = off_250401A60;
                              *(_QWORD *)((char *)v72 + 502) = 0;
                              *(_OWORD *)(v72 + 61) = 0u;
                              *(_OWORD *)(v72 + 59) = 0u;
                              *(_OWORD *)(v72 + 57) = 0u;
                              *(_OWORD *)(v72 + 55) = 0u;
                              *(_OWORD *)(v72 + 53) = 0u;
                              *(_OWORD *)((char *)v72 + 538) = 0u;
                              *((_OWORD *)v72 + 32) = 0u;
                              *((_OWORD *)v72 + 33) = 0u;
                              *(_OWORD *)((char *)v72 + 586) = 0u;
                              *((_OWORD *)v72 + 35) = 0u;
                              *((_OWORD *)v72 + 36) = 0u;
                              *(_OWORD *)((char *)v72 + 634) = 0u;
                              *((_OWORD *)v72 + 38) = 0u;
                              *((_OWORD *)v72 + 39) = 0u;
                              *(_OWORD *)((char *)v72 + 682) = 0u;
                              *((_OWORD *)v72 + 41) = 0u;
                              *((_OWORD *)v72 + 42) = 0u;
                              v72[89] = v72;
                              *(_OWORD *)((char *)v72 + 754) = 0u;
                              *(_OWORD *)(v72 + 91) = 0u;
                              *(_OWORD *)(v72 + 93) = 0u;
                              *(_OWORD *)(v72 + 121) = 0u;
                              *(_OWORD *)(v72 + 123) = 0u;
                              *(_OWORD *)(v72 + 117) = 0u;
                              *(_OWORD *)(v72 + 119) = 0u;
                              *(_OWORD *)(v72 + 113) = 0u;
                              *(_OWORD *)(v72 + 115) = 0u;
                              *(_OWORD *)(v72 + 109) = 0u;
                              *(_OWORD *)(v72 + 111) = 0u;
                              *(_OWORD *)(v72 + 105) = 0u;
                              *(_OWORD *)(v72 + 107) = 0u;
                              *(_OWORD *)(v72 + 101) = 0u;
                              *(_OWORD *)(v72 + 103) = 0u;
                              *(_OWORD *)(v72 + 97) = 0u;
                              *(_OWORD *)(v72 + 99) = 0u;
                              v72[126] = v72 + 97;
                              v72[129] = 0;
                              v72[128] = 0;
                              *((_DWORD *)v72 + 262) = 0;
                              v72[130] = 0;
                              *(_OWORD *)((char *)v72 + 1289) = 0u;
                              *((_OWORD *)v72 + 80) = 0u;
                              *((_OWORD *)v72 + 79) = 0u;
                              *((_OWORD *)v72 + 78) = 0u;
                              *((_OWORD *)v72 + 77) = 0u;
                              *((_OWORD *)v72 + 76) = 0u;
                              *((_OWORD *)v72 + 75) = 0u;
                              *((_OWORD *)v72 + 74) = 0u;
                              *((_OWORD *)v72 + 73) = 0u;
                              *((_OWORD *)v72 + 72) = 0u;
                              *((_OWORD *)v72 + 71) = 0u;
                              *((_OWORD *)v72 + 70) = 0u;
                              *((_OWORD *)v72 + 69) = 0u;
                              *((_OWORD *)v72 + 68) = 0u;
                              *((_OWORD *)v72 + 67) = 0u;
                              *((_OWORD *)v72 + 66) = 0u;
                              *(_QWORD *)(v8 + 64) = v72;
                              v73 = (_QWORD *)operator new();
                              bzero(v73, 0x480uLL);
                              *((_DWORD *)v73 + 2) = 14;
                              v73[3] = 0;
                              v73[4] = 0;
                              v73[2] = 0;
                              *v73 = off_250400578;
                              *(_OWORD *)(v73 + 5) = 0u;
                              *(_OWORD *)(v73 + 7) = 0u;
                              *(_OWORD *)((char *)v73 + 68) = 0u;
                              *((_DWORD *)v73 + 24) = 14;
                              v73[14] = 0;
                              v73[15] = 0;
                              v73[13] = 0;
                              v73[11] = off_250400578;
                              *((_OWORD *)v73 + 8) = 0u;
                              *((_OWORD *)v73 + 9) = 0u;
                              *(_OWORD *)((char *)v73 + 156) = 0u;
                              *((_DWORD *)v73 + 46) = 14;
                              v73[25] = 0;
                              v73[26] = 0;
                              v73[24] = 0;
                              v73[22] = off_250400578;
                              *(_OWORD *)((char *)v73 + 244) = 0u;
                              *(_OWORD *)(v73 + 29) = 0u;
                              *(_OWORD *)(v73 + 27) = 0u;
                              *((_DWORD *)v73 + 68) = 14;
                              v73[35] = 0;
                              v73[36] = 0;
                              v73[37] = 0;
                              v73[33] = off_250400578;
                              *(_OWORD *)((char *)v73 + 332) = 0u;
                              *((_OWORD *)v73 + 19) = 0u;
                              *((_OWORD *)v73 + 20) = 0u;
                              *((_OWORD *)v73 + 22) = 0u;
                              *((_OWORD *)v73 + 23) = 0u;
                              *(_OWORD *)((char *)v73 + 378) = 0u;
                              *((_OWORD *)v73 + 25) = 0u;
                              *((_OWORD *)v73 + 26) = 0u;
                              *(_OWORD *)((char *)v73 + 426) = 0u;
                              *(_OWORD *)((char *)v73 + 474) = 0u;
                              *((_OWORD *)v73 + 28) = 0u;
                              *((_OWORD *)v73 + 29) = 0u;
                              *(_OWORD *)((char *)v73 + 522) = 0u;
                              *((_OWORD *)v73 + 31) = 0u;
                              *((_OWORD *)v73 + 32) = 0u;
                              v73[69] = v73;
                              *(_OWORD *)((char *)v73 + 594) = 0u;
                              *(_OWORD *)(v73 + 71) = 0u;
                              *(_OWORD *)(v73 + 73) = 0u;
                              *(_OWORD *)(v73 + 101) = 0u;
                              *(_OWORD *)(v73 + 103) = 0u;
                              *(_OWORD *)(v73 + 97) = 0u;
                              *(_OWORD *)(v73 + 99) = 0u;
                              *(_OWORD *)(v73 + 93) = 0u;
                              *(_OWORD *)(v73 + 95) = 0u;
                              *(_OWORD *)(v73 + 89) = 0u;
                              *(_OWORD *)(v73 + 91) = 0u;
                              *(_OWORD *)(v73 + 85) = 0u;
                              *(_OWORD *)(v73 + 87) = 0u;
                              *(_OWORD *)(v73 + 81) = 0u;
                              *(_OWORD *)(v73 + 83) = 0u;
                              *(_OWORD *)(v73 + 77) = 0u;
                              *(_OWORD *)(v73 + 79) = 0u;
                              v73[106] = v73 + 77;
                              v73[109] = 0;
                              v73[108] = 0;
                              *((_DWORD *)v73 + 222) = 0;
                              v73[110] = 0;
                              *(_OWORD *)((char *)v73 + 1129) = 0u;
                              *((_OWORD *)v73 + 70) = 0u;
                              *((_OWORD *)v73 + 69) = 0u;
                              *((_OWORD *)v73 + 68) = 0u;
                              *((_OWORD *)v73 + 67) = 0u;
                              *((_OWORD *)v73 + 66) = 0u;
                              *((_OWORD *)v73 + 65) = 0u;
                              *((_OWORD *)v73 + 63) = 0u;
                              *((_OWORD *)v73 + 64) = 0u;
                              *((_OWORD *)v73 + 61) = 0u;
                              *((_OWORD *)v73 + 62) = 0u;
                              *((_OWORD *)v73 + 59) = 0u;
                              *((_OWORD *)v73 + 60) = 0u;
                              *((_OWORD *)v73 + 57) = 0u;
                              *((_OWORD *)v73 + 58) = 0u;
                              *((_OWORD *)v73 + 56) = 0u;
                              *(_QWORD *)(v8 + 16) = v73;
                              v74 = (_QWORD *)operator new();
                              bzero(v74, 0x3E0uLL);
                              *((_DWORD *)v74 + 2) = 15;
                              v74[3] = 0;
                              v74[4] = 0;
                              v74[2] = 0;
                              *v74 = off_2504005F8;
                              *((_DWORD *)v74 + 14) = 15;
                              v74[9] = 0;
                              v74[10] = 0;
                              v74[8] = 0;
                              v74[6] = off_2504005F8;
                              *((_DWORD *)v74 + 26) = 15;
                              v74[15] = 0;
                              v74[16] = 0;
                              v74[14] = 0;
                              v74[12] = off_2504005F8;
                              *((_DWORD *)v74 + 38) = 15;
                              v74[21] = 0;
                              v74[22] = 0;
                              v74[20] = 0;
                              v74[18] = off_2504005F8;
                              *(_OWORD *)((char *)v74 + 218) = 0u;
                              *((_OWORD *)v74 + 13) = 0u;
                              *((_OWORD *)v74 + 12) = 0u;
                              *((_OWORD *)v74 + 15) = 0u;
                              *((_OWORD *)v74 + 16) = 0u;
                              *(_OWORD *)((char *)v74 + 266) = 0u;
                              *((_OWORD *)v74 + 18) = 0u;
                              *((_OWORD *)v74 + 19) = 0u;
                              *(_OWORD *)((char *)v74 + 314) = 0u;
                              *((_OWORD *)v74 + 21) = 0u;
                              *((_OWORD *)v74 + 22) = 0u;
                              *(_OWORD *)((char *)v74 + 362) = 0u;
                              v74[49] = v74;
                              *(_OWORD *)((char *)v74 + 434) = 0u;
                              *(_OWORD *)(v74 + 51) = 0u;
                              *(_OWORD *)(v74 + 53) = 0u;
                              *(_OWORD *)(v74 + 57) = 0u;
                              *(_OWORD *)(v74 + 59) = 0u;
                              *(_OWORD *)(v74 + 61) = 0u;
                              *(_OWORD *)(v74 + 63) = 0u;
                              *(_OWORD *)(v74 + 65) = 0u;
                              *(_OWORD *)(v74 + 67) = 0u;
                              *(_OWORD *)(v74 + 69) = 0u;
                              *(_OWORD *)(v74 + 71) = 0u;
                              *(_OWORD *)(v74 + 73) = 0u;
                              *(_OWORD *)(v74 + 75) = 0u;
                              *(_OWORD *)(v74 + 77) = 0u;
                              *(_OWORD *)(v74 + 79) = 0u;
                              *(_OWORD *)(v74 + 81) = 0u;
                              *(_OWORD *)(v74 + 83) = 0u;
                              v74[86] = v74 + 57;
                              v74[89] = 0;
                              v74[88] = 0;
                              *((_DWORD *)v74 + 182) = 0;
                              v74[90] = 0;
                              *(_OWORD *)((char *)v74 + 969) = 0u;
                              *((_OWORD *)v74 + 59) = 0u;
                              *((_OWORD *)v74 + 60) = 0u;
                              *((_OWORD *)v74 + 57) = 0u;
                              *((_OWORD *)v74 + 58) = 0u;
                              *((_OWORD *)v74 + 55) = 0u;
                              *((_OWORD *)v74 + 56) = 0u;
                              *((_OWORD *)v74 + 53) = 0u;
                              *((_OWORD *)v74 + 54) = 0u;
                              *((_OWORD *)v74 + 51) = 0u;
                              *((_OWORD *)v74 + 52) = 0u;
                              *((_OWORD *)v74 + 49) = 0u;
                              *((_OWORD *)v74 + 50) = 0u;
                              *((_OWORD *)v74 + 47) = 0u;
                              *((_OWORD *)v74 + 48) = 0u;
                              *((_OWORD *)v74 + 46) = 0u;
                              *(_QWORD *)(v8 + 24) = v74;
                              v75 = (_QWORD *)operator new();
                              bzero(v75, 0x480uLL);
                              *((_DWORD *)v75 + 2) = 16;
                              v75[3] = 0;
                              v75[4] = 0;
                              v75[2] = 0;
                              *v75 = off_250400678;
                              *(_OWORD *)(v75 + 5) = 0u;
                              *(_OWORD *)(v75 + 7) = 0u;
                              *(_OWORD *)((char *)v75 + 68) = 0u;
                              *((_DWORD *)v75 + 24) = 16;
                              v75[14] = 0;
                              v75[15] = 0;
                              v75[13] = 0;
                              v75[11] = off_250400678;
                              *((_OWORD *)v75 + 8) = 0u;
                              *((_OWORD *)v75 + 9) = 0u;
                              *(_OWORD *)((char *)v75 + 156) = 0u;
                              *((_DWORD *)v75 + 46) = 16;
                              v75[25] = 0;
                              v75[26] = 0;
                              v75[24] = 0;
                              v75[22] = off_250400678;
                              *(_OWORD *)((char *)v75 + 244) = 0u;
                              *(_OWORD *)(v75 + 29) = 0u;
                              *(_OWORD *)(v75 + 27) = 0u;
                              *((_DWORD *)v75 + 68) = 16;
                              v75[35] = 0;
                              v75[36] = 0;
                              v75[37] = 0;
                              v75[33] = off_250400678;
                              *(_OWORD *)((char *)v75 + 332) = 0u;
                              *((_OWORD *)v75 + 19) = 0u;
                              *((_OWORD *)v75 + 20) = 0u;
                              *((_OWORD *)v75 + 22) = 0u;
                              *((_OWORD *)v75 + 23) = 0u;
                              *(_OWORD *)((char *)v75 + 378) = 0u;
                              *((_OWORD *)v75 + 25) = 0u;
                              *((_OWORD *)v75 + 26) = 0u;
                              *(_OWORD *)((char *)v75 + 426) = 0u;
                              *(_OWORD *)((char *)v75 + 474) = 0u;
                              *((_OWORD *)v75 + 28) = 0u;
                              *((_OWORD *)v75 + 29) = 0u;
                              *(_OWORD *)((char *)v75 + 522) = 0u;
                              *((_OWORD *)v75 + 31) = 0u;
                              *((_OWORD *)v75 + 32) = 0u;
                              v75[69] = v75;
                              *(_OWORD *)((char *)v75 + 594) = 0u;
                              *(_OWORD *)(v75 + 71) = 0u;
                              *(_OWORD *)(v75 + 73) = 0u;
                              *(_OWORD *)(v75 + 101) = 0u;
                              *(_OWORD *)(v75 + 103) = 0u;
                              *(_OWORD *)(v75 + 97) = 0u;
                              *(_OWORD *)(v75 + 99) = 0u;
                              *(_OWORD *)(v75 + 93) = 0u;
                              *(_OWORD *)(v75 + 95) = 0u;
                              *(_OWORD *)(v75 + 89) = 0u;
                              *(_OWORD *)(v75 + 91) = 0u;
                              *(_OWORD *)(v75 + 85) = 0u;
                              *(_OWORD *)(v75 + 87) = 0u;
                              *(_OWORD *)(v75 + 81) = 0u;
                              *(_OWORD *)(v75 + 83) = 0u;
                              *(_OWORD *)(v75 + 77) = 0u;
                              *(_OWORD *)(v75 + 79) = 0u;
                              v75[106] = v75 + 77;
                              v75[109] = 0;
                              v75[108] = 0;
                              *((_DWORD *)v75 + 222) = 0;
                              v75[110] = 0;
                              *(_OWORD *)((char *)v75 + 1129) = 0u;
                              *((_OWORD *)v75 + 70) = 0u;
                              *((_OWORD *)v75 + 69) = 0u;
                              *((_OWORD *)v75 + 68) = 0u;
                              *((_OWORD *)v75 + 67) = 0u;
                              *((_OWORD *)v75 + 66) = 0u;
                              *((_OWORD *)v75 + 65) = 0u;
                              *((_OWORD *)v75 + 63) = 0u;
                              *((_OWORD *)v75 + 64) = 0u;
                              *((_OWORD *)v75 + 61) = 0u;
                              *((_OWORD *)v75 + 62) = 0u;
                              *((_OWORD *)v75 + 59) = 0u;
                              *((_OWORD *)v75 + 60) = 0u;
                              *((_OWORD *)v75 + 57) = 0u;
                              *((_OWORD *)v75 + 58) = 0u;
                              *((_OWORD *)v75 + 56) = 0u;
                              *(_QWORD *)(v8 + 32) = v75;
                              v76 = (_QWORD *)operator new();
                              bzero(v76, 0x3E0uLL);
                              *((_DWORD *)v76 + 2) = 17;
                              v76[3] = 0;
                              v76[4] = 0;
                              v76[2] = 0;
                              *v76 = off_2504006F8;
                              *((_DWORD *)v76 + 14) = 17;
                              v76[9] = 0;
                              v76[10] = 0;
                              v76[8] = 0;
                              v76[6] = off_2504006F8;
                              *((_DWORD *)v76 + 26) = 17;
                              v76[15] = 0;
                              v76[16] = 0;
                              v76[14] = 0;
                              v76[12] = off_2504006F8;
                              *((_DWORD *)v76 + 38) = 17;
                              v76[21] = 0;
                              v76[22] = 0;
                              v76[20] = 0;
                              v76[18] = off_2504006F8;
                              *(_OWORD *)((char *)v76 + 218) = 0u;
                              *((_OWORD *)v76 + 13) = 0u;
                              *((_OWORD *)v76 + 12) = 0u;
                              *((_OWORD *)v76 + 15) = 0u;
                              *((_OWORD *)v76 + 16) = 0u;
                              *(_OWORD *)((char *)v76 + 266) = 0u;
                              *((_OWORD *)v76 + 18) = 0u;
                              *((_OWORD *)v76 + 19) = 0u;
                              *(_OWORD *)((char *)v76 + 314) = 0u;
                              *((_OWORD *)v76 + 21) = 0u;
                              *((_OWORD *)v76 + 22) = 0u;
                              *(_OWORD *)((char *)v76 + 362) = 0u;
                              v76[49] = v76;
                              *(_OWORD *)((char *)v76 + 434) = 0u;
                              *(_OWORD *)(v76 + 51) = 0u;
                              *(_OWORD *)(v76 + 53) = 0u;
                              *(_OWORD *)(v76 + 57) = 0u;
                              *(_OWORD *)(v76 + 59) = 0u;
                              *(_OWORD *)(v76 + 61) = 0u;
                              *(_OWORD *)(v76 + 63) = 0u;
                              *(_OWORD *)(v76 + 65) = 0u;
                              *(_OWORD *)(v76 + 67) = 0u;
                              *(_OWORD *)(v76 + 69) = 0u;
                              *(_OWORD *)(v76 + 71) = 0u;
                              *(_OWORD *)(v76 + 73) = 0u;
                              *(_OWORD *)(v76 + 75) = 0u;
                              *(_OWORD *)(v76 + 77) = 0u;
                              *(_OWORD *)(v76 + 79) = 0u;
                              *(_OWORD *)(v76 + 81) = 0u;
                              *(_OWORD *)(v76 + 83) = 0u;
                              v76[86] = v76 + 57;
                              v76[89] = 0;
                              v76[88] = 0;
                              *((_DWORD *)v76 + 182) = 0;
                              v76[90] = 0;
                              *(_OWORD *)((char *)v76 + 969) = 0u;
                              *((_OWORD *)v76 + 59) = 0u;
                              *((_OWORD *)v76 + 60) = 0u;
                              *((_OWORD *)v76 + 57) = 0u;
                              *((_OWORD *)v76 + 58) = 0u;
                              *((_OWORD *)v76 + 55) = 0u;
                              *((_OWORD *)v76 + 56) = 0u;
                              *((_OWORD *)v76 + 53) = 0u;
                              *((_OWORD *)v76 + 54) = 0u;
                              *((_OWORD *)v76 + 51) = 0u;
                              *((_OWORD *)v76 + 52) = 0u;
                              *((_OWORD *)v76 + 49) = 0u;
                              *((_OWORD *)v76 + 50) = 0u;
                              *((_OWORD *)v76 + 47) = 0u;
                              *((_OWORD *)v76 + 48) = 0u;
                              *((_OWORD *)v76 + 46) = 0u;
                              *(_QWORD *)(v8 + 40) = v76;
                              v77 = (_QWORD *)operator new();
                              bzero(v77, 0x3E0uLL);
                              *((_DWORD *)v77 + 2) = 18;
                              v77[3] = 0;
                              v77[4] = 0;
                              v77[2] = 0;
                              *v77 = off_250400738;
                              *((_DWORD *)v77 + 14) = 18;
                              v77[9] = 0;
                              v77[10] = 0;
                              v77[8] = 0;
                              v77[6] = off_250400738;
                              *((_DWORD *)v77 + 26) = 18;
                              v77[15] = 0;
                              v77[16] = 0;
                              v77[14] = 0;
                              v77[12] = off_250400738;
                              *((_DWORD *)v77 + 38) = 18;
                              v77[21] = 0;
                              v77[22] = 0;
                              v77[20] = 0;
                              v77[18] = off_250400738;
                              *(_OWORD *)((char *)v77 + 218) = 0u;
                              *((_OWORD *)v77 + 13) = 0u;
                              *((_OWORD *)v77 + 12) = 0u;
                              *((_OWORD *)v77 + 15) = 0u;
                              *((_OWORD *)v77 + 16) = 0u;
                              *(_OWORD *)((char *)v77 + 266) = 0u;
                              *((_OWORD *)v77 + 18) = 0u;
                              *((_OWORD *)v77 + 19) = 0u;
                              *(_OWORD *)((char *)v77 + 314) = 0u;
                              *((_OWORD *)v77 + 21) = 0u;
                              *((_OWORD *)v77 + 22) = 0u;
                              *(_OWORD *)((char *)v77 + 362) = 0u;
                              v77[49] = v77;
                              *(_OWORD *)((char *)v77 + 434) = 0u;
                              *(_OWORD *)(v77 + 51) = 0u;
                              *(_OWORD *)(v77 + 53) = 0u;
                              *(_OWORD *)(v77 + 57) = 0u;
                              *(_OWORD *)(v77 + 59) = 0u;
                              *(_OWORD *)(v77 + 61) = 0u;
                              *(_OWORD *)(v77 + 63) = 0u;
                              *(_OWORD *)(v77 + 65) = 0u;
                              *(_OWORD *)(v77 + 67) = 0u;
                              *(_OWORD *)(v77 + 69) = 0u;
                              *(_OWORD *)(v77 + 71) = 0u;
                              *(_OWORD *)(v77 + 73) = 0u;
                              *(_OWORD *)(v77 + 75) = 0u;
                              *(_OWORD *)(v77 + 77) = 0u;
                              *(_OWORD *)(v77 + 79) = 0u;
                              *(_OWORD *)(v77 + 81) = 0u;
                              *(_OWORD *)(v77 + 83) = 0u;
                              v77[86] = v77 + 57;
                              v77[89] = 0;
                              v77[88] = 0;
                              *((_DWORD *)v77 + 182) = 0;
                              v77[90] = 0;
                              *(_OWORD *)((char *)v77 + 969) = 0u;
                              *((_OWORD *)v77 + 59) = 0u;
                              *((_OWORD *)v77 + 60) = 0u;
                              *((_OWORD *)v77 + 57) = 0u;
                              *((_OWORD *)v77 + 58) = 0u;
                              *((_OWORD *)v77 + 55) = 0u;
                              *((_OWORD *)v77 + 56) = 0u;
                              *((_OWORD *)v77 + 53) = 0u;
                              *((_OWORD *)v77 + 54) = 0u;
                              *((_OWORD *)v77 + 51) = 0u;
                              *((_OWORD *)v77 + 52) = 0u;
                              *((_OWORD *)v77 + 49) = 0u;
                              *((_OWORD *)v77 + 50) = 0u;
                              *((_OWORD *)v77 + 47) = 0u;
                              *((_OWORD *)v77 + 48) = 0u;
                              *((_OWORD *)v77 + 46) = 0u;
                              *(_QWORD *)(v8 + 48) = v77;
                              v78 = (_QWORD *)operator new();
                              bzero(v78, 0x3E0uLL);
                              *((_DWORD *)v78 + 2) = 95;
                              v78[3] = 0;
                              v78[4] = 0;
                              v78[2] = 0;
                              *v78 = off_250400778;
                              *((_DWORD *)v78 + 14) = 95;
                              v78[9] = 0;
                              v78[10] = 0;
                              v78[8] = 0;
                              v78[6] = off_250400778;
                              *((_DWORD *)v78 + 26) = 95;
                              v78[15] = 0;
                              v78[16] = 0;
                              v78[14] = 0;
                              v78[12] = off_250400778;
                              *((_DWORD *)v78 + 38) = 95;
                              v78[21] = 0;
                              v78[22] = 0;
                              v78[20] = 0;
                              v78[18] = off_250400778;
                              *(_OWORD *)((char *)v78 + 218) = 0u;
                              *((_OWORD *)v78 + 13) = 0u;
                              *((_OWORD *)v78 + 12) = 0u;
                              *((_OWORD *)v78 + 15) = 0u;
                              *((_OWORD *)v78 + 16) = 0u;
                              *(_OWORD *)((char *)v78 + 266) = 0u;
                              *((_OWORD *)v78 + 18) = 0u;
                              *((_OWORD *)v78 + 19) = 0u;
                              *(_OWORD *)((char *)v78 + 314) = 0u;
                              *((_OWORD *)v78 + 21) = 0u;
                              *((_OWORD *)v78 + 22) = 0u;
                              *(_OWORD *)((char *)v78 + 362) = 0u;
                              v78[49] = v78;
                              *(_OWORD *)((char *)v78 + 434) = 0u;
                              *(_OWORD *)(v78 + 51) = 0u;
                              *(_OWORD *)(v78 + 53) = 0u;
                              *(_OWORD *)(v78 + 57) = 0u;
                              *(_OWORD *)(v78 + 59) = 0u;
                              *(_OWORD *)(v78 + 61) = 0u;
                              *(_OWORD *)(v78 + 63) = 0u;
                              *(_OWORD *)(v78 + 65) = 0u;
                              *(_OWORD *)(v78 + 67) = 0u;
                              *(_OWORD *)(v78 + 69) = 0u;
                              *(_OWORD *)(v78 + 71) = 0u;
                              *(_OWORD *)(v78 + 73) = 0u;
                              *(_OWORD *)(v78 + 75) = 0u;
                              *(_OWORD *)(v78 + 77) = 0u;
                              *(_OWORD *)(v78 + 79) = 0u;
                              *(_OWORD *)(v78 + 81) = 0u;
                              *(_OWORD *)(v78 + 83) = 0u;
                              v78[86] = v78 + 57;
                              v78[89] = 0;
                              v78[88] = 0;
                              *((_DWORD *)v78 + 182) = 0;
                              v78[90] = 0;
                              *(_OWORD *)((char *)v78 + 969) = 0u;
                              *((_OWORD *)v78 + 59) = 0u;
                              *((_OWORD *)v78 + 60) = 0u;
                              *((_OWORD *)v78 + 57) = 0u;
                              *((_OWORD *)v78 + 58) = 0u;
                              *((_OWORD *)v78 + 55) = 0u;
                              *((_OWORD *)v78 + 56) = 0u;
                              *((_OWORD *)v78 + 53) = 0u;
                              *((_OWORD *)v78 + 54) = 0u;
                              *((_OWORD *)v78 + 51) = 0u;
                              *((_OWORD *)v78 + 52) = 0u;
                              *((_OWORD *)v78 + 49) = 0u;
                              *((_OWORD *)v78 + 50) = 0u;
                              *((_OWORD *)v78 + 47) = 0u;
                              *((_OWORD *)v78 + 48) = 0u;
                              *((_OWORD *)v78 + 46) = 0u;
                              *(_QWORD *)(v8 + 56) = v78;
                              v79 = operator new();
                              *(_DWORD *)(v79 + 8) = 42;
                              *(_QWORD *)(v79 + 24) = 0;
                              *(_QWORD *)(v79 + 32) = 0;
                              *(_QWORD *)(v79 + 16) = 0;
                              *(_QWORD *)v79 = off_250400978;
                              *(_DWORD *)(v79 + 40) = 0;
                              *(_DWORD *)(v79 + 56) = 42;
                              *(_QWORD *)(v79 + 72) = 0;
                              *(_QWORD *)(v79 + 80) = 0;
                              *(_QWORD *)(v79 + 64) = 0;
                              *(_QWORD *)(v79 + 48) = off_250400978;
                              *(_DWORD *)(v79 + 88) = 0;
                              *(_DWORD *)(v79 + 104) = 42;
                              *(_QWORD *)(v79 + 120) = 0;
                              *(_QWORD *)(v79 + 128) = 0;
                              *(_QWORD *)(v79 + 112) = 0;
                              *(_QWORD *)(v79 + 96) = off_250400978;
                              *(_DWORD *)(v79 + 136) = 0;
                              *(_DWORD *)(v79 + 152) = 42;
                              *(_QWORD *)(v79 + 160) = 0;
                              *(_QWORD *)(v79 + 168) = 0;
                              *(_QWORD *)(v79 + 176) = 0;
                              *(_QWORD *)(v79 + 144) = off_250400978;
                              *(_DWORD *)(v79 + 184) = 0;
                              *(_OWORD *)(v79 + 218) = 0u;
                              *(_OWORD *)(v79 + 208) = 0u;
                              *(_OWORD *)(v79 + 192) = 0u;
                              *(_OWORD *)(v79 + 240) = 0u;
                              *(_OWORD *)(v79 + 256) = 0u;
                              *(_OWORD *)(v79 + 266) = 0u;
                              *(_OWORD *)(v79 + 288) = 0u;
                              *(_OWORD *)(v79 + 304) = 0u;
                              *(_OWORD *)(v79 + 314) = 0u;
                              *(_OWORD *)(v79 + 336) = 0u;
                              *(_OWORD *)(v79 + 352) = 0u;
                              *(_OWORD *)(v79 + 362) = 0u;
                              *(_DWORD *)(v79 + 400) = 0;
                              *(_OWORD *)(v79 + 434) = 0u;
                              *(_OWORD *)(v79 + 408) = 0u;
                              *(_OWORD *)(v79 + 424) = 0u;
                              *(_QWORD *)(v79 + 384) = 0;
                              *(_QWORD *)(v79 + 392) = v79;
                              *(_OWORD *)(v79 + 648) = 0u;
                              *(_OWORD *)(v79 + 664) = 0u;
                              *(_OWORD *)(v79 + 616) = 0u;
                              *(_OWORD *)(v79 + 632) = 0u;
                              *(_OWORD *)(v79 + 584) = 0u;
                              *(_OWORD *)(v79 + 600) = 0u;
                              *(_OWORD *)(v79 + 552) = 0u;
                              *(_OWORD *)(v79 + 568) = 0u;
                              *(_OWORD *)(v79 + 520) = 0u;
                              *(_OWORD *)(v79 + 536) = 0u;
                              *(_OWORD *)(v79 + 488) = 0u;
                              *(_OWORD *)(v79 + 504) = 0u;
                              *(_OWORD *)(v79 + 456) = 0u;
                              *(_OWORD *)(v79 + 472) = 0u;
                              *(_QWORD *)(v79 + 688) = v79 + 456;
                              *(_DWORD *)(v79 + 696) = 0;
                              *(_QWORD *)(v79 + 680) = 0;
                              *(_QWORD *)(v79 + 712) = 0;
                              *(_QWORD *)(v79 + 704) = 0;
                              *(_DWORD *)(v79 + 728) = 0;
                              *(_QWORD *)(v79 + 720) = 0;
                              *(_OWORD *)(v79 + 969) = 0u;
                              *(_OWORD *)(v79 + 944) = 0u;
                              *(_OWORD *)(v79 + 960) = 0u;
                              *(_OWORD *)(v79 + 912) = 0u;
                              *(_OWORD *)(v79 + 928) = 0u;
                              *(_OWORD *)(v79 + 880) = 0u;
                              *(_OWORD *)(v79 + 896) = 0u;
                              *(_OWORD *)(v79 + 848) = 0u;
                              *(_OWORD *)(v79 + 864) = 0u;
                              *(_OWORD *)(v79 + 816) = 0u;
                              *(_OWORD *)(v79 + 832) = 0u;
                              *(_OWORD *)(v79 + 784) = 0u;
                              *(_OWORD *)(v79 + 800) = 0u;
                              *(_OWORD *)(v79 + 752) = 0u;
                              *(_OWORD *)(v79 + 768) = 0u;
                              *(_OWORD *)(v79 + 736) = 0u;
                              *(_QWORD *)(v8 + 4432) = v79;
                              v80 = operator new();
                              *(_DWORD *)(v80 + 8) = 25;
                              *(_QWORD *)(v80 + 24) = 0;
                              *(_QWORD *)(v80 + 32) = 0;
                              *(_QWORD *)(v80 + 16) = 0;
                              *(_QWORD *)v80 = off_2504009F8;
                              *(_DWORD *)(v80 + 40) = 0;
                              *(_DWORD *)(v80 + 56) = 25;
                              *(_QWORD *)(v80 + 72) = 0;
                              *(_QWORD *)(v80 + 80) = 0;
                              *(_QWORD *)(v80 + 64) = 0;
                              *(_QWORD *)(v80 + 48) = off_2504009F8;
                              *(_DWORD *)(v80 + 88) = 0;
                              *(_DWORD *)(v80 + 104) = 25;
                              *(_QWORD *)(v80 + 120) = 0;
                              *(_QWORD *)(v80 + 128) = 0;
                              *(_QWORD *)(v80 + 112) = 0;
                              *(_QWORD *)(v80 + 96) = off_2504009F8;
                              *(_DWORD *)(v80 + 136) = 0;
                              *(_DWORD *)(v80 + 152) = 25;
                              *(_QWORD *)(v80 + 160) = 0;
                              *(_QWORD *)(v80 + 168) = 0;
                              *(_QWORD *)(v80 + 176) = 0;
                              *(_QWORD *)(v80 + 144) = off_2504009F8;
                              *(_DWORD *)(v80 + 184) = 0;
                              *(_OWORD *)(v80 + 218) = 0u;
                              *(_OWORD *)(v80 + 208) = 0u;
                              *(_OWORD *)(v80 + 192) = 0u;
                              *(_OWORD *)(v80 + 240) = 0u;
                              *(_OWORD *)(v80 + 256) = 0u;
                              *(_OWORD *)(v80 + 266) = 0u;
                              *(_OWORD *)(v80 + 288) = 0u;
                              *(_OWORD *)(v80 + 304) = 0u;
                              *(_OWORD *)(v80 + 314) = 0u;
                              *(_OWORD *)(v80 + 336) = 0u;
                              *(_OWORD *)(v80 + 352) = 0u;
                              *(_OWORD *)(v80 + 362) = 0u;
                              *(_DWORD *)(v80 + 400) = 0;
                              *(_OWORD *)(v80 + 434) = 0u;
                              *(_OWORD *)(v80 + 408) = 0u;
                              *(_OWORD *)(v80 + 424) = 0u;
                              *(_QWORD *)(v80 + 384) = 0;
                              *(_QWORD *)(v80 + 392) = v80;
                              *(_OWORD *)(v80 + 456) = 0u;
                              *(_OWORD *)(v80 + 472) = 0u;
                              *(_OWORD *)(v80 + 488) = 0u;
                              *(_OWORD *)(v80 + 504) = 0u;
                              *(_OWORD *)(v80 + 520) = 0u;
                              *(_OWORD *)(v80 + 536) = 0u;
                              *(_OWORD *)(v80 + 552) = 0u;
                              *(_OWORD *)(v80 + 568) = 0u;
                              *(_OWORD *)(v80 + 584) = 0u;
                              *(_OWORD *)(v80 + 600) = 0u;
                              *(_OWORD *)(v80 + 616) = 0u;
                              *(_OWORD *)(v80 + 632) = 0u;
                              *(_OWORD *)(v80 + 648) = 0u;
                              *(_OWORD *)(v80 + 664) = 0u;
                              *(_QWORD *)(v80 + 688) = v80 + 456;
                              *(_DWORD *)(v80 + 696) = 0;
                              *(_QWORD *)(v80 + 680) = 0;
                              *(_QWORD *)(v80 + 712) = 0;
                              *(_QWORD *)(v80 + 704) = 0;
                              *(_DWORD *)(v80 + 728) = 0;
                              *(_QWORD *)(v80 + 720) = 0;
                              *(_OWORD *)(v80 + 969) = 0u;
                              *(_OWORD *)(v80 + 944) = 0u;
                              *(_OWORD *)(v80 + 960) = 0u;
                              *(_OWORD *)(v80 + 912) = 0u;
                              *(_OWORD *)(v80 + 928) = 0u;
                              *(_OWORD *)(v80 + 880) = 0u;
                              *(_OWORD *)(v80 + 896) = 0u;
                              *(_OWORD *)(v80 + 848) = 0u;
                              *(_OWORD *)(v80 + 864) = 0u;
                              *(_OWORD *)(v80 + 816) = 0u;
                              *(_OWORD *)(v80 + 832) = 0u;
                              *(_OWORD *)(v80 + 784) = 0u;
                              *(_OWORD *)(v80 + 800) = 0u;
                              *(_OWORD *)(v80 + 752) = 0u;
                              *(_OWORD *)(v80 + 768) = 0u;
                              *(_OWORD *)(v80 + 736) = 0u;
                              *(_QWORD *)(v8 + 4440) = v80;
                              *(_BYTE *)(v8 + 6360) = 0;
                              *(_BYTE *)(v8 + 6376) = 0;
                              *(_QWORD *)(v8 + 6368) = 0;
                              *(_DWORD *)(v8 + 6380) = 0;
                              *(_BYTE *)(v8 + 6408) = 0;
                              *(_DWORD *)(v8 + 6412) = 0;
                              *(_BYTE *)(v8 + 6680) = dyld_get_active_platform() == 2;
                              *(_BYTE *)(v8 + 6681) = MGGetBoolAnswer();
                              program_sdk_version = dyld_get_program_sdk_version();
                              *(_DWORD *)(v8 + 6684) = program_sdk_version;
                              v82 = *(_DWORD *)(v8 + 6720);
                              v83 = v82 == 2 || v82 != 1 && program_sdk_version >> 17 > 6;
                              *(_BYTE *)(v8 + 6724) = v83;
                              *(_WORD *)v68 = 0;
                              if (AGX::agxaSignpostInitialize(void)::onceToken[0] != -1)
                                dispatch_once(AGX::agxaSignpostInitialize(void)::onceToken, &__block_literal_global_5662);
                              *(_QWORD *)keyExistsAndHasValidFormat = MEMORY[0x24BDAC760];
                              *(_QWORD *)&keyExistsAndHasValidFormat[8] = 3221225472;
                              *(_QWORD *)&keyExistsAndHasValidFormat[16] = ___ZN3AGX6DeviceINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEEC2EPU23objcproto12MTLDeviceSPI16IOGPUMetalDevicePNS5_13DeviceOptionsE_block_invoke;
                              *(_QWORD *)&keyExistsAndHasValidFormat[24] = &__block_descriptor_40_e8_v12__0B8l;
                              *(_QWORD *)&keyExistsAndHasValidFormat[32] = v8;
                              v84 = _Block_copy(keyExistsAndHasValidFormat);
                              *(_QWORD *)(v8 + 6920) = v84;
                              AGX::agxaSignpostRegisterForEnablement((uint64_t)v84);
                              *(_QWORD *)(v8 + 6792) = 1;
                              *(_DWORD *)(v8 + 6948) = 0;
                              if (_os_feature_enabled_impl())
                                *(_BYTE *)(v8 + 6734) = 1;
                              *(_BYTE *)(v8 + 6735) = 0;
                              if (_os_feature_enabled_impl())
                                *(_BYTE *)(v8 + 6735) = 1;
                              *(_DWORD *)(v8 + 6736) = 0;
                              *(_QWORD *)buf = 0;
                              if (os_parse_boot_arg_int() && *(uint64_t *)buf >= 1)
                                *(_DWORD *)(v8 + 6736) = *(_DWORD *)buf;
                            }
                            *((_QWORD *)v7 + 101) = v8;
                            Connect = IOGPUDeviceGetConnect();
                            if (AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupImmediate(AGXA10FamilyDevice *,unsigned int)::sDeviceConnectionSanityChecked)
                            {
                              v86 = 1;
LABEL_132:
                              *(_QWORD *)keyExistsAndHasValidFormat = 0;
                              *(_OWORD *)&keyExistsAndHasValidFormat[32] = 0u;
                              v199 = 0u;
                              *(_QWORD *)&keyExistsAndHasValidFormat[8] = AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::deviceNotificationCallback;
                              *(_OWORD *)&keyExistsAndHasValidFormat[16] = (unint64_t)v8;
                              v106 = IOGPUDeviceGetConnect();
                              MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(v8 + 6624));
                              v108 = IOConnectCallAsyncScalarMethod(v106, 0x107u, MachPort, (uint64_t *)keyExistsAndHasValidFormat, 3u, 0, 0, 0, 0);
                              v109 = v108;
                              if (v108)
                              {
                                v110 = (FILE *)*MEMORY[0x24BDAC8D8];
                                v111 = mach_error_string(v108);
                                fprintf(v110, "AGX: %s:%d:%s: *** IOKit IOConnectCallAsyncScalarMethod call with selector %u failed. %u: %s\n", "agxa_device_template.hpp", 656, "setupImmediate", 263, v109, v111);
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  v184 = mach_error_string(v109);
                                  *(_DWORD *)buf = 136316418;
                                  *(_QWORD *)&buf[4] = "agxa_device_template.hpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 656;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "setupImmediate";
                                  v213 = 1024;
                                  v214 = 263;
                                  v215 = 1024;
                                  *(_DWORD *)v216 = v109;
                                  *(_WORD *)&v216[4] = 2080;
                                  *(_QWORD *)&v216[6] = v184;
                                  _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** IOKit IOConnectCallAsyncScalarMethod call with selector %u failed. %u: %s\n", buf, 0x32u);
                                }
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                {
                                  v112 = mach_error_string(v109);
                                  *(_DWORD *)buf = 136316418;
                                  *(_QWORD *)&buf[4] = "agxa_device_template.hpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 656;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "setupImmediate";
                                  v213 = 1024;
                                  v214 = 263;
                                  v215 = 1024;
                                  *(_DWORD *)v216 = v109;
                                  *(_WORD *)&v216[4] = 2080;
                                  *(_QWORD *)&v216[6] = v112;
                                  _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** IOKit IOConnectCallAsyncScalarMethod call with selector %u failed. %u: %s\n", buf, 0x32u);
                                }
                                IONotificationPortDestroy(*(IONotificationPortRef *)(v8 + 6624));
                                v86 = 0;
                                *(_QWORD *)(v8 + 6624) = 0;
                              }
                              v195 = 128;
                              v113 = IOGPUDeviceGetConnect();
                              v114 = IOConnectCallStructMethod(v113, 0x100u, 0, 0, (void *)(v8 + 5192), &v195);
                              v115 = v114;
                              if (v114)
                              {
                                v116 = (FILE *)*MEMORY[0x24BDAC8D8];
                                v117 = mach_error_string(v114);
                                fprintf(v116, "AGX: %s:%d:%s: *** IOKit IOConnectCallStructMethod with selector %u failed. %u: %s\n", "agxa_device_template.hpp", 677, "setupImmediate", 256, v115, v117);
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  v185 = mach_error_string(v115);
                                  *(_DWORD *)buf = 136316418;
                                  *(_QWORD *)&buf[4] = "agxa_device_template.hpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 677;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "setupImmediate";
                                  v213 = 1024;
                                  v214 = 256;
                                  v215 = 1024;
                                  *(_DWORD *)v216 = v115;
                                  *(_WORD *)&v216[4] = 2080;
                                  *(_QWORD *)&v216[6] = v185;
                                  _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** IOKit IOConnectCallStructMethod with selector %u failed. %u: %s\n", buf, 0x32u);
                                }
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                {
                                  v118 = mach_error_string(v115);
                                  *(_DWORD *)buf = 136316418;
                                  *(_QWORD *)&buf[4] = "agxa_device_template.hpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 677;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "setupImmediate";
                                  v213 = 1024;
                                  v214 = 256;
                                  v215 = 1024;
                                  *(_DWORD *)v216 = v115;
                                  *(_WORD *)&v216[4] = 2080;
                                  *(_QWORD *)&v216[6] = v118;
                                  _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** IOKit IOConnectCallStructMethod with selector %u failed. %u: %s\n", buf, 0x32u);
                                }
                                v86 = 0;
                              }
                              v119 = 0;
                              v120 = 0;
                              outputStructCnt = 0;
                              v197 = 0;
                              v121 = *(_DWORD *)(v8 + 5260);
                              v122 = v121;
                              if (v121 >= 0x40)
                              {
                                v123 = (v121 - 64) >> 6;
                                memset(&outputStructCnt, 255, 8 * v123 + 8);
                                v122 = v121 & 0x3F;
                                v120 = v123 + 1;
                                v119 = *(&outputStructCnt + v123 + 1);
                              }
                              *(&outputStructCnt + v120) = v119 | ~(-1 << v122);
                              v124 = 5264;
                              v125 = v8 + 5264;
                              if (*(_OWORD *)(v8 + 5264) == 0)
                              {
                                v124 = 5280;
                                v125 = v8 + 5280;
                              }
                              v126 = *(_DWORD *)(v8 + 5240);
                              if (v126)
                              {
                                v127 = 0;
                                v128 = 0;
                                while (1)
                                {
                                  *(_OWORD *)buf = *(_OWORD *)v125;
                                  v133 = v127 >> 6;
                                  v134 = v127 & 0x3F;
                                  if ((v127 & 0x3F) != 0)
                                    break;
                                  if (v127 > 0x7F)
                                  {
                                    v136 = 0;
LABEL_164:
                                    v138 = 0;
                                    goto LABEL_165;
                                  }
                                  v136 = *(_QWORD *)&buf[8 * v133];
                                  if (v127 > 0x3F)
                                    goto LABEL_164;
                                  v138 = *(_QWORD *)&buf[8 * v133 + 8];
LABEL_165:
                                  v139 = outputStructCnt & v136;
                                  v140 = (int8x8_t)(v197 & v138);
                                  if (v139 == outputStructCnt && *(_QWORD *)&v140 == v197)
                                  {
                                    v128 = v121;
                                    goto LABEL_169;
                                  }
                                  v129 = (uint8x8_t)vcnt_s8(v140);
                                  v129.i16[0] = vaddlv_u8(v129);
                                  v130 = v129.i32[0];
                                  v131 = (uint8x8_t)vcnt_s8((int8x8_t)v139);
                                  v131.i16[0] = vaddlv_u8(v131);
                                  v132 = v130 + v131.i32[0];
                                  if (v128 <= v132)
                                    v128 = v132;
                                  v127 += v121;
                                  if (!--v126)
                                    goto LABEL_169;
                                }
                                if (v127 >= 0x80)
                                {
                                  v135 = 0;
                                }
                                else
                                {
                                  v135 = *(_QWORD *)&buf[8 * v133];
                                  if (v127 < 0x40)
                                  {
                                    v136 = (*(_QWORD *)&buf[8] << (64 - v134)) | (v135 >> v134);
                                    v137 = *(_QWORD *)&buf[8 * v133 + 8];
LABEL_162:
                                    v138 = v137 >> v134;
                                    goto LABEL_165;
                                  }
                                }
                                v137 = 0;
                                v136 = v135 >> v134;
                                goto LABEL_162;
                              }
                              v128 = 0;
LABEL_169:
                              *(_DWORD *)(v8 + 5320) = v128;
                              v141 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v125 + 8));
                              v141.i16[0] = vaddlv_u8(v141);
                              v142 = v141.i32[0];
                              v143 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(v8 + v124));
                              v143.i16[0] = vaddlv_u8(v143);
                              *(_DWORD *)(v8 + 5324) = v143.i32[0] + v142;
                              if (AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupDataBufferParams(AGXGPUCoreConfig const&)::databuffer_once != -1)
                                dispatch_once(&AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupDataBufferParams(AGXGPUCoreConfig const&)::databuffer_once, &__block_literal_global_1311);
                              *(_QWORD *)(v8 + 5528) = v7;
                              if (v86)
                              {
                                v144 = operator new();
                                v145 = *(_QWORD *)(v8 + 4488);
                                v146 = *(_DWORD *)(v8 + 5204);
                                *(_QWORD *)v144 = v7;
                                *(_QWORD *)(v144 + 8) = 0;
                                *(_QWORD *)(v144 + 16) = v145;
                                *(_DWORD *)(v144 + 72) = 0;
                                *(_DWORD *)(v144 + 76) = a4;
                                *(_QWORD *)(v144 + 80) = v146;
                                *(_OWORD *)(v144 + 24) = 0u;
                                *(_OWORD *)(v144 + 40) = 0u;
                                *(_OWORD *)(v144 + 56) = 0u;
                                *(_QWORD *)(v8 + 5488) = v144;
                                v147 = operator new();
                                v148 = *(_QWORD *)(v8 + 4488);
                                v149 = *(_DWORD *)(v8 + 5204);
                                *(_QWORD *)v147 = v7;
                                *(_QWORD *)(v147 + 8) = 0;
                                *(_QWORD *)(v147 + 16) = v148;
                                *(_DWORD *)(v147 + 72) = 0;
                                *(_DWORD *)(v147 + 76) = a4;
                                *(_QWORD *)(v147 + 80) = v149;
                                *(_OWORD *)(v147 + 24) = 0u;
                                *(_OWORD *)(v147 + 40) = 0u;
                                *(_OWORD *)(v147 + 56) = 0u;
                                *(_QWORD *)(v8 + 5496) = v147;
                                v150 = operator new();
                                v151 = *(_QWORD *)(v8 + 4488);
                                v152 = *(_DWORD *)(v8 + 5204);
                                *(_QWORD *)v150 = v7;
                                *(_QWORD *)(v150 + 8) = 0;
                                *(_QWORD *)(v150 + 16) = v151;
                                *(_DWORD *)(v150 + 72) = 0;
                                *(_DWORD *)(v150 + 76) = a4;
                                *(_QWORD *)(v150 + 80) = v152;
                                *(_OWORD *)(v150 + 24) = 0u;
                                *(_OWORD *)(v150 + 40) = 0u;
                                *(_OWORD *)(v150 + 56) = 0u;
                                *(_QWORD *)(v8 + 5504) = v150;
                                v153 = operator new();
                                v154 = *(_QWORD *)(v8 + 5488);
                                *(_QWORD *)(v153 + 8) = *((_QWORD *)v7 + 101);
                                *(_QWORD *)(v153 + 16) = v154;
                                *(_DWORD *)v153 = 0;
                                *(_BYTE *)(v153 + 24) = 0;
                                *(_QWORD *)(v8 + 6312) = v153;
                                v155 = operator new();
                                v156 = *(_QWORD *)(v8 + 5496);
                                *(_QWORD *)(v155 + 8) = *((_QWORD *)v7 + 101);
                                *(_QWORD *)(v155 + 16) = v156;
                                *(_DWORD *)v155 = 0;
                                *(_BYTE *)(v155 + 24) = 0;
                                *(_QWORD *)(v8 + 6320) = v155;
                                v157 = operator new();
                                v158 = *(_QWORD *)(v8 + 5504);
                                *(_QWORD *)(v157 + 8) = *((_QWORD *)v7 + 101);
                                *(_QWORD *)(v157 + 16) = v158;
                                *(_DWORD *)v157 = 0;
                                *(_BYTE *)(v157 + 24) = 0;
                                *(_QWORD *)(v8 + 6328) = v157;
                                if (*(_BYTE *)v68)
                                {
                                  v159 = operator new();
                                  v160 = *(_QWORD *)(v8 + 4488);
                                  *(_QWORD *)v159 = v7;
                                  *(_QWORD *)(v159 + 8) = 0;
                                  *(_QWORD *)(v159 + 16) = v160;
                                  *(_OWORD *)(v159 + 24) = 0u;
                                  *(_OWORD *)(v159 + 40) = 0u;
                                  *(_QWORD *)(v159 + 56) = 0;
                                  *(_QWORD *)(v8 + 6568) = v159;
                                }
                                if (*(_BYTE *)(v68 + 1))
                                {
                                  v161 = operator new();
                                  v162 = *(_QWORD *)(v8 + 4488);
                                  *(_QWORD *)v161 = v7;
                                  *(_QWORD *)(v161 + 8) = 0;
                                  *(_QWORD *)(v161 + 16) = v162;
                                  v163 = 0uLL;
                                  *(_OWORD *)(v161 + 24) = 0u;
                                  *(_OWORD *)(v161 + 40) = 0u;
                                  *(_QWORD *)(v161 + 56) = 0;
                                  *(_QWORD *)(v8 + 6608) = v161;
                                  *(_DWORD *)(v8 + 6616) = 0;
                                }
                                else
                                {
                                  v163 = 0uLL;
                                }
                                *(_OWORD *)(v8 + 4472) = v163;
                              }
                              else
                              {
                                if (*(_BYTE *)(v68 + 1))
                                  *(_DWORD *)(v8 + 6616) = 0;
                                *(_OWORD *)(v8 + 4472) = 0u;
                                v164 = *(_QWORD *)(v8 + 5512);
                                if (v164)
                                {

                                  *(_QWORD *)(v164 + 8) = 0;
                                  MEMORY[0x234927ECC](v164, 0x10A0C4023802154);
                                }
                                *(_QWORD *)(v8 + 5512) = 0;
                                v165 = *(_QWORD *)(v8 + 6328);
                                if (v165)
                                  MEMORY[0x234927ECC](v165, 0x1020C40A8BAD216);
                                *(_QWORD *)(v8 + 6328) = 0;
                                v166 = *(_QWORD *)(v8 + 6320);
                                if (v166)
                                  MEMORY[0x234927ECC](v166, 0x1020C40A8BAD216);
                                *(_QWORD *)(v8 + 6320) = 0;
                                v167 = *(_QWORD *)(v8 + 6312);
                                if (v167)
                                  MEMORY[0x234927ECC](v167, 0x1020C40A8BAD216);
                                *(_QWORD *)(v8 + 6312) = 0;
                                v168 = *(_QWORD *)(v8 + 6336);
                                if (v168)
                                  MEMORY[0x234927ECC](v168, 0x1020C40A8BAD216);
                                *(_QWORD *)(v8 + 6336) = 0;
                                v169 = *(_QWORD *)(v8 + 5504);
                                if (v169)
                                {

                                  *(_QWORD *)(v169 + 8) = 0;
                                  MEMORY[0x234927ECC](v169, 0x10A0C40EB7D2DA3);
                                }
                                *(_QWORD *)(v8 + 5504) = 0;
                                v170 = *(_QWORD *)(v8 + 5496);
                                if (v170)
                                {

                                  *(_QWORD *)(v170 + 8) = 0;
                                  MEMORY[0x234927ECC](v170, 0x10A0C40EB7D2DA3);
                                }
                                *(_QWORD *)(v8 + 5496) = 0;
                                v171 = *(_QWORD *)(v8 + 5488);
                                if (v171)
                                {

                                  *(_QWORD *)(v171 + 8) = 0;
                                  MEMORY[0x234927ECC](v171, 0x10A0C40EB7D2DA3);
                                }
                                *(_QWORD *)(v8 + 5488) = 0;
                              }
                              v172 = objc_msgSend(v7, "deviceRef");
                              *((_QWORD *)v7 + 112) = (id)objc_msgSend(v7, "familyName");
                              *((_QWORD *)v7 + 113) = v172;
                              *((_QWORD *)v7 + 107) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("com.apple.ReserveIdxForDirectUsage"), CFSTR("com.apple.QuartzCore-WebKit"), CFSTR("com.apple.QuartzCore-HDRProcessing"), CFSTR("com.apple.QuartzCore-CARenderer"), CFSTR("com.apple.QuartzCore-CA"), CFSTR("com.apple.QuartzCore"), CFSTR("com.apple.CoreMedia"), CFSTR("com.apple.CoreImage-Internal"), CFSTR("com.apple.CoreImage"), CFSTR("com.apple.MapKit"), CFSTR("com.apple.SpriteKit"), CFSTR("com.apple.SceneKit"), CFSTR("com.apple.VideoToolbox.VTMetalTransferSession"), CFSTR("com.apple.WebKit"), 0);
                              if ((v173 & 1) == 0
                              {
                                AGXATelemetry::setup(NSString *,__IOGPUDevice *)::telemetryEnabledWithEV = 0;
                              }
                              if (AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken[0] != -1)
                                dispatch_once(AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken, &__block_literal_global_5209);
                              if (AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture | AGXATelemetry::setup(NSString *,__IOGPUDevice *)::telemetryEnabledWithEV)
                              {
                                v7[936] = 1;
                                if ((v174 & 1) == 0
                                {
                                  AGXATelemetry::setup(NSString *,__IOGPUDevice *)::telemetryTimerEnabled = 1;
                                }
                                if (AGXATelemetry::setup(NSString *,__IOGPUDevice *)::telemetryTimerEnabled)
                                {
                                  if ((v175 & 1) == 0
                                  {
                                    AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds = 0x404E000000000000;
                                  }
                                  v176 = dispatch_queue_create("com.apple.Metal.telemetryQ", 0);
                                  *((_QWORD *)v7 + 109) = v176;
                                  v177 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v176);
                                  *((_QWORD *)v7 + 110) = v177;
                                  v178 = *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds
                                       * 1000000000.0;
                                  v179 = dispatch_time(0, (uint64_t)(*(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds* 1000000000.0));
                                  dispatch_source_set_timer(v177, v179, (unint64_t)v178, 0x5F5E100uLL);
                                  *((_QWORD *)v7 + 115) = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
                                  *((_QWORD *)v7 + 116) = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 64);
                                  v180 = *((_QWORD *)v7 + 110);
                                  *(_QWORD *)keyExistsAndHasValidFormat = MEMORY[0x24BDAC760];
                                  *(_QWORD *)&keyExistsAndHasValidFormat[8] = 3221225472;
                                  *(_QWORD *)&keyExistsAndHasValidFormat[16] = ___ZN13AGXATelemetry5setupEP8NSStringP13__IOGPUDevice_block_invoke;
                                  *(_QWORD *)&keyExistsAndHasValidFormat[24] = &__block_descriptor_40_e5_v8__0l;
                                  *(_QWORD *)&keyExistsAndHasValidFormat[32] = v7 + 816;
                                  dispatch_source_set_event_handler(v180, keyExistsAndHasValidFormat);
                                  dispatch_resume(*((dispatch_object_t *)v7 + 110));
                                }
                              }
                              *(_QWORD *)buf = 0;
                              outputStructCnt = 8;
                              if (!sysctlbyname("hw.memsize", buf, &outputStructCnt, 0, 0))
                              {
                                *(_QWORD *)&v7[*MEMORY[0x24BE51628]] = *(_QWORD *)buf;
                                *((_QWORD *)v7 + 227) = 0;
                                *((_QWORD *)v7 + 222) = objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 5);
                                *((_DWORD *)v7 + 446) = 0;
                                objc_msgSend(v7, "_registerForSignpostEnablement");
                                v7[1833] = 0;
                                v7[1834] = 0;
                                v7[1835] = 0;
                                if ((v86 & 1) == 0)
                                {

                                  *((_QWORD *)v7 + 222) = 0;
                                  v181 = *((_QWORD *)v7 + 101);
                                  if (v181)
                                  {
                                    v182 = AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~Device(v181);
                                    MEMORY[0x234927ECC](v182, 0x10F0C4083933968);
                                  }
                                  *((_QWORD *)v7 + 101) = 0;

                                  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Device creation failed\n", "agxa_device_objc.mm", 641, "-[AGXA10FamilyDevice initWithAcceleratorPort:simultaneousInstances:]");
                                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)keyExistsAndHasValidFormat = 136315650;
                                    *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxa_device_objc.mm";
                                    *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                                    *(_DWORD *)&keyExistsAndHasValidFormat[14] = 641;
                                    *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                                    *(_QWORD *)&keyExistsAndHasValidFormat[20] = "-[AGXA10FamilyDevice initWithAccelerato"
                                                                                 "rPort:simultaneousInstances:]";
                                    _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Device creation failed\n", keyExistsAndHasValidFormat, 0x1Cu);
                                  }
                                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)keyExistsAndHasValidFormat = 136315650;
                                    *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxa_device_objc.mm";
                                    *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                                    *(_DWORD *)&keyExistsAndHasValidFormat[14] = 641;
                                    *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                                    *(_QWORD *)&keyExistsAndHasValidFormat[20] = "-[AGXA10FamilyDevice initWithAccelerato"
                                                                                 "rPort:simultaneousInstances:]";
                                    _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Device creation failed\n", keyExistsAndHasValidFormat, 0x1Cu);
                                  }
                                  return 0;
                                }
                                return (AGXA10FamilyDevice *)v7;
                              }
                              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: !!! Verification failed: %s\n", "agxs_util.cpp", 495, "size_t getSystemMemorySize()", "status == 0");
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)keyExistsAndHasValidFormat = 136315906;
                                *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxs_util.cpp";
                                *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                                *(_DWORD *)&keyExistsAndHasValidFormat[14] = 495;
                                *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                                *(_QWORD *)&keyExistsAndHasValidFormat[20] = "size_t getSystemMemorySize()";
                                *(_WORD *)&keyExistsAndHasValidFormat[28] = 2080;
                                *(_QWORD *)&keyExistsAndHasValidFormat[30] = "status == 0";
                                _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: !!! Verification failed: %s\n", keyExistsAndHasValidFormat, 0x26u);
                              }
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)keyExistsAndHasValidFormat = 136315906;
                                *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxs_util.cpp";
                                *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                                *(_DWORD *)&keyExistsAndHasValidFormat[14] = 495;
                                *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                                *(_QWORD *)&keyExistsAndHasValidFormat[20] = "size_t getSystemMemorySize()";
                                *(_WORD *)&keyExistsAndHasValidFormat[28] = 2080;
                                *(_QWORD *)&keyExistsAndHasValidFormat[30] = "status == 0";
                                _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: !!! Verification failed: %s\n", keyExistsAndHasValidFormat, 0x26u);
                              }
LABEL_219:
                              abort();
                            }
                            v87 = Connect;
                            os_unfair_lock_lock(&stru_254235C6C);
                            if (AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupImmediate(AGXA10FamilyDevice *,unsigned int)::sDeviceConnectionSanityChecked)
                            {
                              v86 = 1;
LABEL_131:
                              os_unfair_lock_unlock(&stru_254235C6C);
                              goto LABEL_132;
                            }
                            if (v87)
                            {
                              v211 = 0;
                              memset(v210, 0, sizeof(v210));
                              v208 = 0u;
                              v209 = 0u;
                              v206 = 0u;
                              v207 = 0u;
                              v204 = 0u;
                              v205 = 0u;
                              v202 = 0u;
                              v203 = 0u;
                              v200 = 0u;
                              v201 = 0u;
                              v199 = 0u;
                              memset(keyExistsAndHasValidFormat, 0, sizeof(keyExistsAndHasValidFormat));
                              outputStructCnt = 456;
                              v88 = IOConnectCallStructMethod(v87, 0x102u, 0, 0, keyExistsAndHasValidFormat, &outputStructCnt);
                              if (v88)
                              {
                                v186 = v88;
                                v191 = v8 + 4465;
                                v187 = (FILE *)*MEMORY[0x24BDAC8D8];
                                v188 = mach_error_string(v88);
                                fprintf(v187, "AGX: %s:%d:%s: *** IOConnectCallStructMethod method:%u for:%s failed (0x%x - %s)\n", "agxs_driver_connection.h", 280, "callO", 258, "getDriverInfo", v186, v188);
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  v190 = mach_error_string(v186);
                                  *(_DWORD *)buf = 136316674;
                                  *(_QWORD *)&buf[4] = "agxs_driver_connection.h";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 280;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "callO";
                                  v213 = 1024;
                                  v214 = 258;
                                  v215 = 2080;
                                  *(_QWORD *)v216 = "getDriverInfo";
                                  *(_WORD *)&v216[8] = 1024;
                                  *(_DWORD *)&v216[10] = v186;
                                  v217 = 2080;
                                  v218 = v190;
                                  _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** IOConnectCallStructMethod method:%u for:%s failed (0x%x - %s)\n", buf, 0x3Cu);
                                }
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                {
                                  v189 = mach_error_string(v186);
                                  *(_DWORD *)buf = 136316674;
                                  *(_QWORD *)&buf[4] = "agxs_driver_connection.h";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 280;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "callO";
                                  v213 = 1024;
                                  v214 = 258;
                                  v215 = 2080;
                                  *(_QWORD *)v216 = "getDriverInfo";
                                  *(_WORD *)&v216[8] = 1024;
                                  *(_DWORD *)&v216[10] = v186;
                                  v217 = 2080;
                                  v218 = v189;
                                  _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** IOConnectCallStructMethod method:%u for:%s failed (0x%x - %s)\n", buf, 0x3Cu);
                                }
                                fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Could not query driver information from the KMD - This probably indicates a build, setup, or consistency issue\n", "agxs_driver_connection.cpp", 121, "checkDeviceConnectionSanity");
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 136315650;
                                  *(_QWORD *)&buf[4] = "agxs_driver_connection.cpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 121;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "checkDeviceConnectionSanity";
                                  _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Could not query driver information from the KMD - This probably indicates a build, setup, or consistency issue\n", buf, 0x1Cu);
                                }
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                {
                                  *(_DWORD *)buf = 136315650;
                                  *(_QWORD *)&buf[4] = "agxs_driver_connection.cpp";
                                  *(_WORD *)&buf[12] = 1024;
                                  *(_DWORD *)&buf[14] = 121;
                                  *(_WORD *)&buf[18] = 2080;
                                  *(_QWORD *)&buf[20] = "checkDeviceConnectionSanity";
                                  _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Could not query driver information from the KMD - This probably indicates a build, setup, or consistency issue\n", buf, 0x1Cu);
                                }
                                v86 = 0;
LABEL_129:
                                v68 = v191;
                                goto LABEL_130;
                              }
                              if (v210[8])
                              {
                                v89 = strlen(&v210[8]);
                                if (v89 >= 0x7FFFFFFFFFFFFFF8)
                                  goto LABEL_219;
                                v90 = v89;
                                v191 = v8 + 4465;
                                if (v89 >= 0x17)
                                {
                                  v95 = (v89 & 0xFFFFFFFFFFFFFFF8) + 8;
                                  if ((v89 | 7) != 0x17)
                                    v95 = v89 | 7;
                                  v96 = v95 + 1;
                                  v91 = operator new(v95 + 1);
                                  *(_QWORD *)&buf[8] = v90;
                                  *(_QWORD *)&buf[16] = v96 | 0x8000000000000000;
                                  *(_QWORD *)buf = v91;
                                }
                                else
                                {
                                  buf[23] = v89;
                                  v91 = buf;
                                  if (!v89)
                                    goto LABEL_109;
                                }
                                memcpy(v91, &v210[8], v90);
LABEL_109:
                                v91[v90] = 0;
                                v97 = buf[23];
                                v98 = buf[23];
                                v99 = *(void **)buf;
                                if (buf[23] >= 0)
                                {
                                  v100 = buf;
                                }
                                else
                                {
                                  v97 = *(_QWORD *)&buf[8];
                                  v100 = *(_BYTE **)buf;
                                }
                                v101 = &v100[v97];
                                if (v97 >= 7)
                                {
                                  v192 = *(void **)buf;
                                  v103 = v100;
                                  do
                                  {
                                    v104 = memchr(v103, 114, v97 - 6);
                                    if (!v104)
                                      break;
                                    v102 = v104;
                                    if (*v104 == 1701602674 && *(_DWORD *)((char *)v104 + 3) == 1702060389)
                                      goto LABEL_122;
                                    v103 = (char *)v104 + 1;
                                    v97 = v101 - (v102 + 1);
                                  }
                                  while (v97 > 6);
                                  v102 = v101;
LABEL_122:
                                  v99 = v192;
                                }
                                else
                                {
                                  v102 = &v100[v97];
                                }
                                if (v98 < 0)
                                  operator delete(v99);
                                if (v102 == v101 || v102 - v100 == -1)
                                {
                                  v86 = 1;
                                  fwrite("AGX: NOTE: UMD was built in RELEASE mode, but KMD was not; is this what you intended?\n",
                                    0x56uLL,
                                    1uLL,
                                    (FILE *)*MEMORY[0x24BDAC8D8]);
                                }
                                else
                                {
                                  v86 = 1;
                                }
                                goto LABEL_129;
                              }
                              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** The KMD features string is empty - This probably indicates a build, setup, or consistency issue\n", "agxs_driver_connection.cpp", 75, "checkDeviceConnectionSanity");
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 136315650;
                                *(_QWORD *)&buf[4] = "agxs_driver_connection.cpp";
                                *(_WORD *)&buf[12] = 1024;
                                *(_DWORD *)&buf[14] = 75;
                                *(_WORD *)&buf[18] = 2080;
                                *(_QWORD *)&buf[20] = "checkDeviceConnectionSanity";
                                _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** The KMD features string is empty - This probably indicates a build, setup, or consistency issue\n", buf, 0x1Cu);
                              }
                              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                              {
LABEL_104:
                                v86 = 0;
LABEL_130:
                                AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupImmediate(AGXA10FamilyDevice *,unsigned int)::sDeviceConnectionSanityChecked |= v86;
                                goto LABEL_131;
                              }
                              *(_DWORD *)buf = 136315650;
                              *(_QWORD *)&buf[4] = "agxs_driver_connection.cpp";
                              *(_WORD *)&buf[12] = 1024;
                              *(_DWORD *)&buf[14] = 75;
                              *(_WORD *)&buf[18] = 2080;
                              *(_QWORD *)&buf[20] = "checkDeviceConnectionSanity";
                              v92 = MEMORY[0x24BDACB70];
                              v93 = "AGX: AGX: %s:%d:%s: *** The KMD features string is empty - This probably indicates a"
                                    " build, setup, or consistency issue\n";
                              v94 = buf;
                            }
                            else
                            {
                              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Not connected to kernel mode device.\n", "agxs_driver_connection.cpp", 39, "checkDeviceConnectionSanity");
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)keyExistsAndHasValidFormat = 136315650;
                                *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxs_driver_connection.cpp";
                                *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                                *(_DWORD *)&keyExistsAndHasValidFormat[14] = 39;
                                *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                                *(_QWORD *)&keyExistsAndHasValidFormat[20] = "checkDeviceConnectionSanity";
                                _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Not connected to kernel mode device.\n", keyExistsAndHasValidFormat, 0x1Cu);
                              }
                              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
                                goto LABEL_104;
                              *(_DWORD *)keyExistsAndHasValidFormat = 136315650;
                              *(_QWORD *)&keyExistsAndHasValidFormat[4] = "agxs_driver_connection.cpp";
                              *(_WORD *)&keyExistsAndHasValidFormat[12] = 1024;
                              *(_DWORD *)&keyExistsAndHasValidFormat[14] = 39;
                              *(_WORD *)&keyExistsAndHasValidFormat[18] = 2080;
                              *(_QWORD *)&keyExistsAndHasValidFormat[20] = "checkDeviceConnectionSanity";
                              v92 = MEMORY[0x24BDACB70];
                              v93 = "AGX: AGX: %s:%d:%s: *** Not connected to kernel mode device.\n";
                              v94 = keyExistsAndHasValidFormat;
                            }
                            _os_log_impl(&dword_232C19000, v92, OS_LOG_TYPE_INFO, v93, v94, 0x1Cu);
                            goto LABEL_104;
                          }
                          CFRelease(v62);
                        }
                        v66 = 0;
                        goto LABEL_73;
                      }
                      CFRelease(v57);
                    }
                    v61 = 0;
                    goto LABEL_63;
                  }
                  CFRelease(v52);
                }
                v56 = 0;
                goto LABEL_53;
              }
              CFRelease(v47);
            }
            v50 = 0;
            goto LABEL_41;
          }
          CFRelease(v42);
        }
        v46 = 0;
        goto LABEL_34;
      }
      CFRelease(v37);
    }
    v40 = 0;
    goto LABEL_22;
  }
  return (AGXA10FamilyDevice *)v7;
}

- (void)_registerForSignpostEnablement
{
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__AGXA10FamilyDevice__registerForSignpostEnablement__block_invoke;
  aBlock[3] = &unk_250400498;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  self->_signpostEnablementCallback = v3;
  AGX::agxaSignpostRegisterForEnablement((uint64_t)v3);
}

- (void)_deregisterForSignpostEnablement
{
  id signpostEnablementCallback;
  _QWORD v4[6];

  {
    signpostEnablementCallback = self->_signpostEnablementCallback;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___ZN3AGX35agxaSignpostDeregisterForEnablementEU13block_pointerFvbE_block_invoke;
    v4[3] = &unk_250403208;
    v4[4] = signpostEnablementCallback;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: signpost enablement notifications queue is uninitialized", (uint8_t *)v4, 2u);
  }
  _Block_release(self->_signpostEnablementCallback);
}

- (void)_incrementCommandQueueCount
{
  atomic<unsigned short> *p_commandQsInFlight;
  unsigned __int16 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyDevice;
  -[_MTLDevice _incrementCommandQueueCount](&v5, sel__incrementCommandQueueCount);
  p_commandQsInFlight = &self->_telemetry.commandQsInFlight;
  do
    v4 = __ldaxr(&p_commandQsInFlight->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_commandQsInFlight->__a_.__a_value));
}

- (void)_decrementCommandQueueCount
{
  atomic<unsigned short> *p_commandQsInFlight;
  unsigned __int16 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyDevice;
  -[_MTLDevice _decrementCommandQueueCount](&v5, sel__decrementCommandQueueCount);
  p_commandQsInFlight = &self->_telemetry.commandQsInFlight;
  do
    v4 = __ldaxr(&p_commandQsInFlight->__a_.__a_value);
  while (__stlxr(v4 - 1, &p_commandQsInFlight->__a_.__a_value));
}

- (void)_purgeDevice
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::purgeDevice((uint64_t)impl, 1.0);
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyDevice;
  -[IOGPUMetalDevice _purgeDevice](&v4, sel__purgeDevice);
}

- (void)shrinkHeaps
{
  _QWORD *impl;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t block;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _QWORD *v12;

  impl = self->_impl;
  if (impl)
  {
    v3 = MEMORY[0x24BDAC760];
    v4 = impl[566];
    block = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    v12 = impl + 564;
    dispatch_sync(v4, &block);
    v5 = impl[587];
    block = v3;
    v9 = 3221225472;
    v10 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    v12 = impl + 585;
    dispatch_sync(v5, &block);
    v6 = impl[608];
    block = v3;
    v9 = 3221225472;
    v10 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    v12 = impl + 606;
    dispatch_sync(v6, &block);
    v7 = impl[629];
    block = v3;
    v9 = 3221225472;
    v10 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    v11 = &__block_descriptor_40_e5_v8__0l;
    v12 = impl + 627;
    dispatch_sync(v7, &block);
  }
}

- (void)dealloc
{
  void *impl;
  uint64_t v4;
  EncoderComputeServiceCDMSubstreamProcessor *cdmSubstreamProcessor;
  objc_super v6;

  impl = self->_impl;
  if (impl)
  {
    v4 = AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~Device((uint64_t)impl);
    MEMORY[0x234927ECC](v4, 0x10F0C4083933968);
  }
  cdmSubstreamProcessor = self->cdmSubstreamProcessor;
  if (cdmSubstreamProcessor)
    MEMORY[0x234927ECC](cdmSubstreamProcessor, 0xC400A2AC0F1);
  -[AGXA10FamilyDevice _deregisterForSignpostEnablement](self, "_deregisterForSignpostEnablement");

  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyDevice;
  -[IOGPUMetalDevice dealloc](&v6, sel_dealloc);
}

- (id)vendorName
{
  return CFSTR("Apple");
}

- (id)familyName
{
  return CFSTR("A10");
}

- (id)productName
{
  return &stru_2504033A8;
}

- (unsigned)gpuCoreCount
{
  _DWORD *impl;
  uint64_t v3;
  int32x2_t v4;

  impl = self->_impl;
  if (!impl)
    return 0;
  if (!*((_BYTE *)impl + 5307))
    return impl[1301];
  v3 = 1316;
  if (*((_OWORD *)impl + 329) == 0)
    v3 = 1320;
  v4 = vmovn_s64((int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)&impl[v3])))));
  return vadd_s32(vdup_lane_s32(v4, 1), v4).u32[0];
}

- (id)gpuRevisionName
{
  unsigned int *impl;

  impl = (unsigned int *)self->_impl;
  if (impl)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kAGXGPURevName[impl[1299]]);
  else
    return 0;
}

- (unsigned)cmdBufArgsSize
{
  return 56;
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return a3 < 7;
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return 1;
}

- (BOOL)supportsMemorylessRenderTargets
{
  return 1;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return 0;
}

- (BOOL)supports32bpcMSAATextures
{
  return 0;
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return 0;
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return 0;
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return 0;
}

- (BOOL)supportsCustomBorderColor
{
  return 0;
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return 0;
}

- (BOOL)supportsBCTextureCompression
{
  return 0;
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return 0;
}

- (BOOL)supportsQueryTextureLOD
{
  return 0;
}

- (BOOL)supportsBufferBoundsChecking
{
  return 0;
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return 0;
}

- (BOOL)supportsMemoryOrderAtomics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice supportsMemoryOrderAtomics](&v3, sel_supportsMemoryOrderAtomics);
}

- (BOOL)isFloat32FilteringSupported
{
  return 0;
}

- (BOOL)isMsaa32bSupported
{
  return 0;
}

- (BOOL)isRGB10A2GammaSupported
{
  return 0;
}

- (BOOL)isASTCPixelFormatsSupported
{
  return 1;
}

- (BOOL)isMagicMipmapSupported
{
  return 0;
}

- (BOOL)supportsShaderMinLODClamp
{
  return 0;
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return 1;
}

- (BOOL)isTileSizeIndependentVaryingsSupported
{
  return 0;
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return 0;
}

- (BOOL)supportsAtomicFloat
{
  return 0;
}

- (BOOL)supportsDeadlineProfile
{
  return 1;
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return 0;
}

- (unint64_t)maxVertexTextures
{
  return 31;
}

- (unint64_t)maxFragmentTextures
{
  return 31;
}

- (unint64_t)maxComputeTextures
{
  return 31;
}

- (unint64_t)maxIndirectTextures
{
  return 31;
}

- (unint64_t)maxIndirectBuffers
{
  return 31;
}

- (unint64_t)maxVisibilityQueryOffset
{
  return 65528;
}

- (BOOL)supportsVertexAmplification
{
  return 0;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFE) == 0;
}

- (BOOL)supportsPerPlaneCompression
{
  return 0;
}

- (BOOL)isAnisoSampleFixSupported
{
  return 0;
}

- (BOOL)supportsDynamicLibraries
{
  return 0;
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return 0;
}

- (BOOL)supportsTLS
{
  return 0;
}

- (BOOL)supportsLateEvalEvent
{
  return 1;
}

- (BOOL)supportsStreamingCodecSignaling
{
  return 0;
}

- (BOOL)supportsGlobalVariableRelocation
{
  return 0;
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return 0;
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  return *((_QWORD *)self->_impl + 849);
}

- (BOOL)supportsMeshShaders
{
  return 0;
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return 0;
}

- (BOOL)supportsBGR10A2
{
  return 0;
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return 0;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice maxAccelerationStructureTraversalDepth](&v3, sel_maxAccelerationStructureTraversalDepth);
}

- (BOOL)supportsVirtualSubstreams
{
  return 0;
}

- (BOOL)supportsIntersectionFunctionBuffers
{
  return 0;
}

- (BOOL)supportsBufferWithAddressRanges
{
  return 1;
}

- (BOOL)supportsHeapWithAddressRanges
{
  return 1;
}

- (id)compiler
{
  return (id)**((_QWORD **)self->_impl + 683);
}

- (unint64_t)halfFPConfig
{
  return *((_QWORD *)self->_impl + 867);
}

- (unint64_t)singleFPConfig
{
  return 84;
}

- (unint64_t)doubleFPConfig
{
  return 0;
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return 16;
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return 16;
}

- (unint64_t)featureProfile
{
  return 4;
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)((char *)self->_impl + 6760);
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  void *v3;
  unsigned int *impl;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setCpuType:", 16777235);
  impl = (unsigned int *)self->_impl;
  objc_msgSend(v3, "setSubType:", impl[1690]);
  objc_msgSend(v3, "setDriverVersion:", impl[1692]);
  objc_msgSend(v3, "setVersion:", *((unsigned int *)self->_impl + 1696));
  return (MTLTargetDeviceArchitecture *)v3;
}

- (MTLArchitecture)architecture
{
  return (MTLArchitecture *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4B8]), "initWithCPUType:cpuSubtype:revision:", 16777235, *((unsigned int *)self->_impl + 1690), -[AGXA10FamilyDevice gpuRevisionName](self, "gpuRevisionName"));
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  unint64_t v13;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v15 = 0;
    v8 = *(_QWORD *)v17;
    v9 = 0xFFFFFFFFLL;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "cpuType") == 16777235)
        {
          v12 = objc_msgSend(v11, "cpuSubtype");
          if (v12 <= 289)
          {
            if (v12 <= 209)
            {
              switch(v12)
              {
                case 'A':
                case 'Q':
                case 'a':
                  v13 = 4;
                  break;
                case 'B':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'H':
                case 'I':
                case 'J':
                case 'K':
                case 'L':
                case 'M':
                case 'N':
                case 'O':
                case 'P':
                case 'T':
                case 'U':
                case 'V':
                case 'W':
                case 'X':
                case 'Y':
                case 'Z':
                case '[':
                case '\\':
                case ']':
                case '^':
                case '_':
                case 'b':
                case 'c':
                case 'd':
                case 'e':
                case 'f':
                case 'g':
                case 'h':
                case 'i':
                case 'j':
                case 'k':
                case 'l':
                case 'm':
                case 'n':
                case 'o':
                case 'p':
                case 'q':
                  goto LABEL_48;
                case 'C':
                case 'S':
                  goto LABEL_34;
                case 'R':
                case 'r':
                  v13 = 6;
                  break;
                default:
                  if (v12 != 34)
                    goto LABEL_48;
                  v13 = 5;
                  break;
              }
              goto LABEL_44;
            }
            if (v12 <= 242)
            {
              if (v12 != 210)
              {
                if (v12 != 227)
                  goto LABEL_48;
                goto LABEL_34;
              }
              v13 = 7;
LABEL_44:
              if (v13 <= -[AGXA10FamilyDevice featureProfile](self, "featureProfile") && (v9 == 0xFFFFFFFF || v13 > v9))
              {
                v15 = objc_msgSend(v11, "cpuType");
                v7 = objc_msgSend(v11, "cpuSubtype");
                v9 = v13;
              }
              continue;
            }
            if (v12 == 243)
              goto LABEL_34;
            if (v12 != 259)
            {
              if (v12 != 275)
                goto LABEL_48;
LABEL_34:
              v13 = 10;
              goto LABEL_44;
            }
LABEL_31:
            v13 = 11;
            goto LABEL_44;
          }
          if (v12 <= 497)
          {
            if (v12 > 369)
            {
              switch(v12)
              {
                case 402:
                case 434:
                  goto LABEL_43;
                case 403:
                  goto LABEL_31;
                case 404:
                case 405:
                case 406:
                case 407:
                case 408:
                case 409:
                case 410:
                case 411:
                case 412:
                case 413:
                case 414:
                case 415:
                case 416:
                case 417:
                case 418:
                case 419:
                case 420:
                case 421:
                case 422:
                case 423:
                case 424:
                case 425:
                case 426:
                case 427:
                case 428:
                case 429:
                case 430:
                case 431:
                case 432:
                case 433:
                  goto LABEL_48;
                case 435:
                  goto LABEL_34;
                default:
                  if (v12 == 370)
                    goto LABEL_43;
                  goto LABEL_48;
              }
            }
            if (v12 != 290 && v12 != 322)
            {
              if (v12 != 323)
                goto LABEL_48;
              goto LABEL_31;
            }
LABEL_37:
            v13 = 8;
            goto LABEL_44;
          }
          if (v12 <= 561)
          {
            if (v12 != 498)
            {
              if (v12 != 530)
                goto LABEL_48;
              goto LABEL_37;
            }
          }
          else
          {
            if (v12 == 562 || v12 == 594)
              goto LABEL_37;
            if (v12 != 610)
            {
LABEL_48:
              v13 = 0xFFFFFFFFLL;
              goto LABEL_44;
            }
          }
LABEL_43:
          v13 = 9;
          goto LABEL_44;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v6)
        return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4B8]), "initWithCPUType:cpuSubtype:", v15, v7);
    }
  }
  v7 = 0;
  v15 = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4B8]), "initWithCPUType:cpuSubtype:", v15, v7);
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;

  LODWORD(v6) = a3 | (BYTE2(a3) << 8) | (a3 >> 4) & 0xFF0;
  if (a4 == 1)
    v7 = a3 | (BYTE2(a3) << 8) | (a3 >> 4) & 0xFF0;
  else
    v7 = 0;
  if ((a4 & 0xFFFFFFFE) == 2)
    v8 = (_DWORD)v6 << 16;
  else
    v8 = 0;
  v9 = v8 | v7;
  if (a4 == 4)
    v6 = v6;
  else
    v6 = 0;
  v10 = v9 | (v6 << 32);
  v11 = 0xFFFFLL;
  if (!(_WORD)v9)
    v11 = 0;
  v12 = v9 >= 0x10000;
  v13 = 4294901760;
  if (!v12)
    v13 = 0;
  v14 = (_DWORD)v6 == 0;
  v15 = 0xFFFF00000000;
  if (v14)
    v15 = 0;
  v16 = v13 | v15 | v11;
  return (v16 & (unint64_t)v10) >= (v16 & 0xB0012000F00uLL) || (v16 & 0xB0012000F00) == 0;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  os_unfair_lock_s *impl;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  __int16 v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  __int16 v35;
  BOOL v36;
  int v37;
  int v38;
  __int16 v39;
  os_unfair_lock_s *v40;
  char *v41;
  char v42;
  void *v43;
  void **v44;
  os_unfair_lock_s *v45;
  void *v46;
  int v47;
  size_t v48;
  const void *v49;
  size_t v50;
  int v51;
  BOOL v52;
  void *v53;
  AGXA10FamilyDepthStencilState *v54;
  int v55;
  int64_t v56;
  int8x8_t v57;
  unsigned int v58;
  int8x16_t v59;
  int v60;
  char *v61;
  os_unfair_lock_s *v62;
  std::string::size_type size;
  std::string *v64;
  unint64_t v65;
  int v66;
  size_t v67;
  os_unfair_lock_s *v68;
  size_t v69;
  int v70;
  _BOOL4 v71;
  int v72;
  _BOOL4 v73;
  char *v74;
  uint64_t v75;
  os_unfair_lock_s *v76;
  AGXA10FamilyDepthStencilState *v77;
  int os_unfair_lock_opaque_high;
  size_t v80;
  os_unfair_lock_s *v81;
  size_t v82;
  int v83;
  _BOOL4 v84;
  os_unfair_lock_s *v85;
  AGXA10FamilyDevice *v86;
  os_unfair_lock_t lock;
  void *v88;
  std::string v89;
  int v90;
  AGXA10FamilyDepthStencilState *v91;
  void *__p[4];
  uint64_t v93;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 1604);
  v93 = 0;
  memset(__p, 0, sizeof(__p));
  lock = impl + 1604;
  v6 = (void *)objc_msgSend(a3, "frontFaceStencil");
  v7 = (void *)objc_msgSend(a3, "backFaceStencil");
  LODWORD(__p[0]) = objc_msgSend(v6, "stencilCompareFunction") & 7;
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFFFC7 | (8 * (objc_msgSend(v6, "stencilFailureOperation") & 7));
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFFE3F | ((objc_msgSend(v6, "depthFailureOperation") & 7) << 6);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFF1FF | ((objc_msgSend(v6, "depthStencilPassOperation") & 7) << 9);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFF1FFF | ((objc_msgSend(v7, "stencilCompareFunction") & 7) << 13);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFF8FFFF | ((objc_msgSend(v7, "stencilFailureOperation") & 7) << 16);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFC7FFFF | ((objc_msgSend(v7, "depthFailureOperation") & 7) << 19);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFE3FFFFF | ((objc_msgSend(v7, "depthStencilPassOperation") & 7) << 22);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xE3FFFFFF | ((objc_msgSend(a3, "depthCompareFunction") & 7) << 26);
  if (objc_msgSend(a3, "isDepthWriteEnabled"))
    v8 = 0x20000000;
  else
    v8 = 0;
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xDFFFFFFF | v8;
  BYTE4(__p[0]) = objc_msgSend(v6, "readMask");
  BYTE5(__p[0]) = objc_msgSend(v6, "writeMask");
  BYTE6(__p[0]) = objc_msgSend(v7, "readMask");
  HIBYTE(__p[0]) = objc_msgSend(v7, "writeMask");
  v9 = (void *)objc_msgSend(a3, "label");
  if (v9)
  {
    MEMORY[0x234927D28](&__p[1], objc_msgSend(v9, "UTF8String"));
  }
  else
  {
    if (SHIBYTE(__p[3]) < 0)
      operator delete(__p[1]);
    memset(&__p[1], 0, 24);
  }
  v10 = (int)__p[0];
  v11 = LOWORD(__p[0]) >> 13;
  if (BYTE6(__p[0]))
    v12 = LOWORD(__p[0]) >> 13 != 0;
  else
    v12 = 0;
  v19 = v11 == 7;
  v13 = v11 != 7;
  v14 = !v19 && v12;
  v15 = ((LODWORD(__p[0]) >> 26) & 7) != 0 && ((LODWORD(__p[0]) >> 26) & 7) != 7;
  v16 = (uint64_t)__p[0] & 7;
  if (BYTE4(__p[0]))
    v17 = ((uint64_t)__p[0] & 7) != 0;
  else
    v17 = 0;
  v19 = v16 == 7;
  v18 = v16 != 7;
  if (v19)
    v17 = 0;
  v19 = ((uint64_t)__p[0] & 0xFF8) == 0 || BYTE5(__p[0]) == 0;
  v20 = !v19;
  if (!v19)
    v18 = 1;
  v21 = ((uint64_t)__p[0] & 0x1FF0000) == 0 || HIBYTE(__p[0]) == 0;
  v22 = !v21;
  if (!v21)
    v13 = 1;
  if (v13)
    v23 = 0x2000000;
  else
    v23 = 0;
  v24 = v18 & v20;
  if ((v18 & v20) != 0)
    v17 = v20;
  v25 = v18 && v17;
  v26 = (uint64_t)__p[0] & 0x20000000;
  v27 = v13 & v22;
  if ((v13 & v22) != 0)
    v14 = v22;
  v28 = v13 & v14;
  if (v24 | v27)
    v29 = 8;
  else
    v29 = 0;
  v30 = v24 | v27 | v25 | v28;
  v31 = v15 | (v26 >> 29);
  if (v18)
    v32 = 4096;
  else
    v32 = 0;
  v33 = v32 | (uint64_t)__p[0] & 0xFDFFEFFF | v23;
  LODWORD(__p[0]) = v33;
  v34 = v31 | (v26 >> 28);
  if (v30)
    v35 = 4;
  else
    v35 = 0;
  LOWORD(v93) = v29 | v34 | v35;
  if ((v10 & 0x1DFF0FF8) == 0x14000000)
  {
    BYTE5(__p[0]) = 0;
    HIBYTE(__p[0]) = 0;
    v33 = v10 & 0xFDF8EFC7 | 0x2021010;
    LODWORD(__p[0]) = v33;
  }
  v86 = self;
  if ((v33 & 0x1000) != 0 && (v33 & 0x1F8) != 0)
    goto LABEL_62;
  if ((v33 & 0x2000000) == 0)
  {
    v36 = 1;
    goto LABEL_63;
  }
  if ((v33 & 0x70000) != 0)
LABEL_62:
    v36 = 0;
  else
    v36 = (v33 & 0x380000) == 0;
LABEL_63:
  v37 = v33 & 0x1C000000;
  v38 = (v26 >> 29) ^ 1;
  if (v37 == 469762048)
    LOWORD(v38) = 1;
  if (v37 == 335544320 && v36)
    v39 = 2;
  else
    v39 = 0;
  WORD1(v93) |= v39 | (unsigned __int16)v38;
  v40 = impl + 1608;
  v85 = impl;
  v41 = *(char **)&impl[1608]._os_unfair_lock_opaque;
  if (v41)
  {
    v42 = HIBYTE(__p[3]);
    v43 = SHIBYTE(__p[3]) >= 0 ? (void *)HIBYTE(__p[3]) : __p[2];
    v44 = SHIBYTE(__p[3]) >= 0 ? &__p[1] : (void **)__p[1];
    v45 = impl + 1608;
    do
    {
      v46 = (void *)*((_QWORD *)v41 + 4);
      if (v46 < __p[0])
      {
        v41 += 8;
      }
      else if (__p[0] >= v46)
      {
        v47 = v41[63];
        if (v47 >= 0)
          v48 = v41[63];
        else
          v48 = *((_QWORD *)v41 + 6);
        if (v47 >= 0)
          v49 = v41 + 40;
        else
          v49 = (const void *)*((_QWORD *)v41 + 5);
        if ((unint64_t)v43 >= v48)
          v50 = v48;
        else
          v50 = (size_t)v43;
        v51 = memcmp(v49, v44, v50);
        v52 = v48 < (unint64_t)v43;
        if (v51)
          v52 = v51 < 0;
        if (v52)
          v41 += 8;
        else
          v45 = (os_unfair_lock_s *)v41;
      }
      else
      {
        v45 = (os_unfair_lock_s *)v41;
      }
      v41 = *(char **)v41;
    }
    while (v41);
    if (v45 != v40)
    {
      v53 = *(void **)&v45[8]._os_unfair_lock_opaque;
      if (__p[0] >= v53)
      {
        if (v53 < __p[0])
          goto LABEL_155;
        os_unfair_lock_opaque_high = SHIBYTE(v45[15]._os_unfair_lock_opaque);
        if (os_unfair_lock_opaque_high >= 0)
          v80 = HIBYTE(v45[15]._os_unfair_lock_opaque);
        else
          v80 = *(_QWORD *)&v45[12]._os_unfair_lock_opaque;
        if (os_unfair_lock_opaque_high >= 0)
          v81 = v45 + 10;
        else
          v81 = *(os_unfair_lock_s **)&v45[10]._os_unfair_lock_opaque;
        if (v80 >= (unint64_t)v43)
          v82 = (size_t)v43;
        else
          v82 = v80;
        v83 = memcmp(v44, v81, v82);
        v84 = (unint64_t)v43 < v80;
        if (v83)
          v84 = v83 < 0;
        if (!v84)
        {
LABEL_155:
          v54 = *(AGXA10FamilyDepthStencilState **)&v45[18]._os_unfair_lock_opaque;
          v76 = lock;
          if ((v42 & 0x80) == 0)
            goto LABEL_141;
          goto LABEL_140;
        }
      }
    }
  }
  v54 = -[_MTLDepthStencilState initWithDevice:depthStencilDescriptor:]([AGXA10FamilyDepthStencilState alloc], "initWithDevice:depthStencilDescriptor:", v86, a3);
  v54->_impl.desc.var0.dword = (unint64_t)__p[0];
  std::string::operator=((std::string *)&v54->_impl.desc.label, (const std::string *)&__p[1]);
  v54->_impl.desc.label.__r_.var0 = v93;
  if (((uint64_t)__p[0] & 0x2001000) != 0)
    v55 = 786432;
  else
    v55 = 0;
  LODWORD(v56) = v55;
  HIDWORD(v56) = ((LODWORD(__p[0]) >> 8) & 0x200000 | (LODWORD(__p[0]) >> 9) & 0xE0000) ^ 0x200000;
  v54->_impl.desc.label.var0 = v56;
  LODWORD(v54[1].super.super.isa) = HIDWORD(v56);
  if (((uint64_t)__p[0] & 0x1000) != 0)
  {
    v59 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(__p[0]), (uint32x4_t)xmmword_232D73500), (int8x16_t)xmmword_232D73510);
    v57 = vorr_s8(*(int8x8_t *)v59.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v59, v59, 8uLL));
    v57.i32[0] |= v57.i32[1] | (BYTE4(__p[0]) << 8) | BYTE5(__p[0]);
    if (((uint64_t)__p[0] & 0x2000000) != 0)
      goto LABEL_102;
  }
  else
  {
    v57.i32[0] = 234881024;
    if (((uint64_t)__p[0] & 0x2000000) != 0)
    {
LABEL_102:
      v58 = (LODWORD(__p[0]) >> 6) & 0x70000 | (uint64_t)__p[0] & 0x380000 | ((HIWORD(LODWORD(__p[0])) & 7) << 22) & 0xF1FFFFFF | (LOWORD(__p[0]) >> 13 << 25) | (BYTE6(__p[0]) << 8) | HIBYTE(__p[0]);
      goto LABEL_105;
    }
  }
  v58 = 234881024;
LABEL_105:
  v57.i32[1] = v58;
  *(int8x8_t *)((char *)&v54[1].super.super.isa + 4) = v57;
  v88 = __p[0];
  if (SHIBYTE(__p[3]) < 0)
    std::string::__init_copy_ctor_external(&v89, (const std::string::value_type *)__p[1], (std::string::size_type)__p[2]);
  else
    v89 = *(std::string *)&__p[1];
  v60 = v93;
  v90 = v93;
  v91 = v54;
  v61 = *(char **)&v40->_os_unfair_lock_opaque;
  v62 = v40;
  if (*(_QWORD *)&v40->_os_unfair_lock_opaque)
  {
    if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v89.__r_.__value_.__r.__words[2]);
    else
      size = v89.__r_.__value_.__l.__size_;
    if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v64 = &v89;
    else
      v64 = (std::string *)v89.__r_.__value_.__r.__words[0];
    while (1)
    {
      v40 = (os_unfair_lock_s *)v61;
      v65 = *((_QWORD *)v61 + 4);
      if ((unint64_t)v88 < v65)
        goto LABEL_115;
      if (v65 < (unint64_t)v88)
        goto LABEL_133;
      v66 = SHIBYTE(v40[15]._os_unfair_lock_opaque);
      if (v66 >= 0)
        v67 = HIBYTE(v40[15]._os_unfair_lock_opaque);
      else
        v67 = *(_QWORD *)&v40[12]._os_unfair_lock_opaque;
      if (v66 >= 0)
        v68 = v40 + 10;
      else
        v68 = *(os_unfair_lock_s **)&v40[10]._os_unfair_lock_opaque;
      if (v67 >= size)
        v69 = size;
      else
        v69 = v67;
      v70 = memcmp(v64, v68, v69);
      v71 = size < v67;
      if (v70)
        v71 = v70 < 0;
      if (v71)
      {
LABEL_115:
        v61 = *(char **)&v40->_os_unfair_lock_opaque;
        v62 = v40;
        if (!*(_QWORD *)&v40->_os_unfair_lock_opaque)
          break;
      }
      else
      {
        v72 = memcmp(v68, v64, v69);
        v73 = v67 < size;
        if (v72)
          v73 = v72 < 0;
        if (!v73)
          goto LABEL_137;
LABEL_133:
        v62 = v40 + 2;
        v61 = *(char **)&v40[2]._os_unfair_lock_opaque;
        if (!v61)
          break;
      }
    }
  }
  v74 = (char *)operator new(0x50uLL);
  *((_QWORD *)v74 + 4) = v88;
  *(std::string *)(v74 + 40) = v89;
  memset(&v89, 0, sizeof(v89));
  *((_DWORD *)v74 + 16) = v60;
  *((_QWORD *)v74 + 9) = v54;
  *(_QWORD *)v74 = 0;
  *((_QWORD *)v74 + 1) = 0;
  *((_QWORD *)v74 + 2) = v40;
  *(_QWORD *)&v62->_os_unfair_lock_opaque = v74;
  v75 = **(_QWORD **)&v85[1606]._os_unfair_lock_opaque;
  if (v75)
  {
    *(_QWORD *)&v85[1606]._os_unfair_lock_opaque = v75;
    v74 = *(char **)&v62->_os_unfair_lock_opaque;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v85[1608]._os_unfair_lock_opaque, (uint64_t *)v74);
  ++*(_QWORD *)&v85[1610]._os_unfair_lock_opaque;
LABEL_137:
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v89.__r_.__value_.__l.__data_);
  v76 = lock;
  if ((HIBYTE(__p[3]) & 0x80) != 0)
LABEL_140:
    operator delete(__p[1]);
LABEL_141:
  os_unfair_lock_unlock(v76);
  v77 = v54;
  return v54;
}

- (Class)blitContextClass
{
  return (Class)objc_opt_class();
}

- (Class)renderContextClass
{
  return (Class)objc_opt_class();
}

- (Class)computeContextClass
{
  return (Class)objc_opt_class();
}

- (Class)threadedRenderPassClass
{
  return (Class)objc_opt_class();
}

- (void)setupDeferred
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__AGXA10FamilyDevice_setupDeferred__block_invoke;
  block[3] = &unk_2504028D8;
  block[4] = self;
  if (-[AGXA10FamilyDevice setupDeferred]::once != -1)
    dispatch_once(&-[AGXA10FamilyDevice setupDeferred]::once, block);
}

- (id)newCommandQueue
{
  AGXA10FamilyCommandQueue *v3;
  NSObject *v5;
  uint8_t v6[16];

  if (*((_BYTE *)self->_impl + 6733))
  {
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_232C19000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is allocated!", v6, 2u);
    }
  }
  v3 = -[_MTLCommandQueue initWithDevice:]([AGXA10FamilyCommandQueue alloc], "initWithDevice:", self);
  -[AGXA10FamilyDevice setupDeferred](self, "setupDeferred");
  return v3;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  AGXA10FamilyCommandQueue *v5;
  NSObject *v7;
  uint8_t v8[16];

  if (*((_BYTE *)self->_impl + 6733))
  {
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_232C19000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is allocated!", v8, 2u);
    }
  }
  v5 = -[AGXA10FamilyCommandQueue initWithDevice:descriptor:]([AGXA10FamilyCommandQueue alloc], "initWithDevice:descriptor:", self, a3);
  -[AGXA10FamilyDevice setupDeferred](self, "setupDeferred");
  return v5;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  AGXATelemetry *p_telemetry;
  uint64_t v5;
  unint64_t v6;
  atomic<unsigned long long> *v7;
  unint64_t v8;
  atomic<unsigned long long> *v9;
  unint64_t v10;

  p_telemetry = &self->_telemetry;
  v5 = 0x100000000000000;
  if ((a4 & 0x100) == 0)
    v5 = 1;
  do
    v6 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v6 | v5, (unint64_t *)p_telemetry));
  if (a4 >> 4 == 2)
  {
    v7 = &self->_telemetry.genericCounts.count[8];
  }
  else
  {
    if (a4 >> 4)
      goto LABEL_9;
    v7 = &self->_telemetry.genericCounts.count[7];
  }
  do
    v8 = __ldaxr(&v7->__a_.__a_value);
  while (__stlxr(v8 + 1, &v7->__a_.__a_value));
LABEL_9:
  v9 = &self->_telemetry.genericCounts.count[6];
  do
    v10 = __ldaxr(&v9->__a_.__a_value);
  while (__stlxr(v10 + 1, &v9->__a_.__a_value));
  return -[AGXBuffer initWithDevice:length:alignment:options:isSuballocDisabled:pinnedGPULocation:]([AGXA10FamilyBuffer alloc], "initWithDevice:length:alignment:options:isSuballocDisabled:pinnedGPULocation:", self, a3, 1, a4, *((unsigned __int8 *)self->_impl + 6725), 0);
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  __int16 v5;
  AGXA10FamilyBuffer *v9;
  AGXA10FamilyBuffer *v10;
  AGXATelemetry *p_telemetry;
  uint64_t v12;
  unint64_t v13;
  atomic<unsigned long long> *v14;
  unint64_t v15;
  atomic<unsigned long long> *v16;
  unint64_t v17;

  v5 = a5;
  v9 = -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:]([AGXA10FamilyBuffer alloc], "initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:", self, a4, a5, *((unsigned __int8 *)self->_impl + 6725), 0);
  v10 = v9;
  if (v9)
  {
    memcpy(-[IOGPUMetalBuffer contents](v9, "contents"), a3, a4);
    p_telemetry = &self->_telemetry;
    v12 = 0x100000000000000;
    if ((v5 & 0x100) == 0)
      v12 = 1;
    do
      v13 = __ldaxr((unint64_t *)p_telemetry);
    while (__stlxr(v13 | v12, (unint64_t *)p_telemetry));
    if (v5 >> 4 == 2)
    {
      v14 = &self->_telemetry.genericCounts.count[8];
    }
    else
    {
      if (v5 >> 4)
      {
LABEL_10:
        v16 = &self->_telemetry.genericCounts.count[6];
        do
          v17 = __ldaxr(&v16->__a_.__a_value);
        while (__stlxr(v17 + 1, &v16->__a_.__a_value));
        return v10;
      }
      v14 = &self->_telemetry.genericCounts.count[7];
    }
    do
      v15 = __ldaxr(&v14->__a_.__a_value);
    while (__stlxr(v15 + 1, &v14->__a_.__a_value));
    goto LABEL_10;
  }
  return v10;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  AGXATelemetry *p_telemetry;
  uint64_t v7;
  unint64_t v8;
  atomic<unsigned long long> *v9;
  unint64_t v10;
  atomic<unsigned long long> *v11;
  unint64_t v12;

  p_telemetry = &self->_telemetry;
  v7 = 0x100000000000000;
  if ((a5 & 0x100) == 0)
    v7 = 1;
  do
    v8 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v8 | v7, (unint64_t *)p_telemetry));
  if (a5 >> 4 == 2)
  {
    v9 = &self->_telemetry.genericCounts.count[8];
  }
  else
  {
    if (a5 >> 4)
      goto LABEL_9;
    v9 = &self->_telemetry.genericCounts.count[7];
  }
  do
    v10 = __ldaxr(&v9->__a_.__a_value);
  while (__stlxr(v10 + 1, &v9->__a_.__a_value));
LABEL_9:
  v11 = &self->_telemetry.genericCounts.count[5];
  do
    v12 = __ldaxr(&v11->__a_.__a_value);
  while (__stlxr(v12 + 1, &v11->__a_.__a_value));
  return -[AGXBuffer initWithDevice:bytes:length:options:deallocator:pinnedGPUAddress:]([AGXA10FamilyBuffer alloc], "initWithDevice:bytes:length:options:deallocator:pinnedGPUAddress:", self, a3, a4, a5, a6, 0);
}

- (id)newBufferWithDescriptor:(id)a3
{
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AGXA10FamilyBuffer *v11;
  AGXA10FamilyBuffer *v12;
  AGXATelemetry *p_telemetry;
  uint64_t v14;
  unint64_t v15;
  atomic<unsigned long long> *v16;
  unint64_t v18;
  atomic<unsigned long long> *v19;
  unint64_t v20;
  AGXA10FamilyBuffer *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[3];

  v5 = objc_msgSend(a3, "length");
  v6 = objc_msgSend(a3, "resourceOptions");
  v7 = (16 * (objc_msgSend(a3, "storageMode") & 0xF)) | v6;
  v8 = objc_msgSend(a3, "alignment");
  v9 = objc_msgSend(a3, "pointerTag");
  if (objc_msgSend(a3, "addressRanges"))
  {
    v10 = (void *)objc_msgSend(a3, "addressRanges");
    v11 = -[AGXBuffer initWithDevice:addressRanges:addressRangeCount:length:alignment:options:pinnedGPUAddress:]([AGXA10FamilyBuffer alloc], "initWithDevice:addressRanges:addressRangeCount:length:alignment:options:pinnedGPUAddress:", self, objc_msgSend(v10, "ranges"), objc_msgSend(v10, "count"), v5, v8, v7, objc_msgSend(a3, "pinnedGPUAddress"));
LABEL_3:
    v12 = v11;
    goto LABEL_4;
  }
  if (objc_msgSend(a3, "iosurface"))
    return -[AGXBuffer initWithDevice:iosurface:pinnedGPUAddress:]([AGXA10FamilyBuffer alloc], "initWithDevice:iosurface:pinnedGPUAddress:", self, objc_msgSend(a3, "iosurface"), objc_msgSend(a3, "pinnedGPUAddress"));
  if ((objc_msgSend(a3, "noCopy") & 1) != 0)
  {
    v11 = -[AGXBuffer initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:]([AGXA10FamilyBuffer alloc], "initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:", self, objc_msgSend(a3, "contents"), v5, v8, v9, v7, objc_msgSend(a3, "deallocator"), objc_msgSend(a3, "pinnedGPUAddress"));
    goto LABEL_3;
  }
  v25[0] = objc_msgSend(a3, "pinnedGPUAddress");
  v25[1] = objc_msgSend(a3, "parentGPUAddress");
  v25[2] = objc_msgSend(a3, "parentGPUSize");
  v21 = [AGXA10FamilyBuffer alloc];
  v22 = *((unsigned __int8 *)self->_impl + 6725);
  v23 = objc_msgSend(a3, "pinnedGPUAddress");
  v24 = v25;
  if (!v23)
    v24 = 0;
  v12 = -[AGXBuffer initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:pinnedGPULocation:](v21, "initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:pinnedGPULocation:", self, v5, v8, v9, v7, v22, v24);
  if (v12 && objc_msgSend(a3, "contents"))
    memcpy(-[IOGPUMetalBuffer contents](v12, "contents"), (const void *)objc_msgSend(a3, "contents"), v5);
LABEL_4:
  if (v12)
  {
    p_telemetry = &self->_telemetry;
    v14 = 0x100000000000000;
    if ((v6 & 0x100) == 0)
      v14 = 1;
    do
      v15 = __ldaxr((unint64_t *)p_telemetry);
    while (__stlxr(v15 | v14, (unint64_t *)p_telemetry));
    if (v7 >> 4 == 2)
    {
      v16 = &self->_telemetry.genericCounts.count[8];
    }
    else
    {
      if (v7 >> 4)
      {
LABEL_15:
        v19 = &self->_telemetry.genericCounts.count[6];
        do
          v20 = __ldaxr(&v19->__a_.__a_value);
        while (__stlxr(v20 + 1, &v19->__a_.__a_value));
        return v12;
      }
      v16 = &self->_telemetry.genericCounts.count[7];
    }
    do
      v18 = __ldaxr(&v16->__a_.__a_value);
    while (__stlxr(v18 + 1, &v16->__a_.__a_value));
    goto LABEL_15;
  }
  return v12;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  return -[AGXTexture initWithDevice:bytes:length:desc:deallocator:]([AGXA10FamilyTexture alloc], "initWithDevice:bytes:length:desc:deallocator:", self, a3, a4, a5, a6);
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  return -[AGXBuffer initWithDevice:iosurface:pinnedGPUAddress:]([AGXA10FamilyBuffer alloc], "initWithDevice:iosurface:pinnedGPUAddress:", self, a3, 0);
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  -[AGXA10FamilyDevice setupDeferred](self, "setupDeferred");
  return -[AGXA10FamilyIndirectCommandBuffer initWithDevice:descriptor:count:options:isSuballocDisabled:]([AGXA10FamilyIndirectCommandBuffer alloc], "initWithDevice:descriptor:count:options:isSuballocDisabled:", self, a3, a4, a5, *((unsigned __int8 *)self->_impl + 6725));
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  -[AGXA10FamilyDevice setupDeferred](self, "setupDeferred");
  return -[AGXA10FamilyIndirectRenderCommandEncoder initWithBuffer:]([AGXA10FamilyIndirectRenderCommandEncoder alloc], "initWithBuffer:", a3);
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  return 0;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  atomic<unsigned long long> *v4;
  unint64_t v5;
  objc_super v7;

  v4 = &self->_telemetry.usage[1];
  do
    v5 = __ldaxr(&v4->__a_.__a_value);
  while (__stlxr(v5 | 0x1000, &v4->__a_.__a_value));
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyDevice;
  return -[IOGPUMetalDevice newIOCommandQueueWithDescriptor:error:](&v7, sel_newIOCommandQueueWithDescriptor_error_, a3, a4);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  if (self)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:](self, "tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:", 101, a4, a5, a6);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  if (self)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:](self, "tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:", a7, a4, a5, a6);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (id)newTextureWithDescriptor:(id)a3
{
  return -[AGXTexture initWithDevice:desc:isSuballocDisabled:]([AGXA10FamilyTexture alloc], "initWithDevice:desc:isSuballocDisabled:", self, a3, *((unsigned __int8 *)self->_impl + 6725));
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  void *v9;
  void *v10;
  uint64_t v11;

  v9 = (void *)IOSurfaceCopyValue(a4, (CFStringRef)*MEMORY[0x24BDD8E90]);
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kAGXCompressionMode")))
    {
      v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kAGXCompressionMode")), "unsignedIntegerValue");

      return -[AGXTexture initWithSharedTextureHandle:device:desc:compressionMode:]([AGXA10FamilyTexture alloc], "initWithSharedTextureHandle:device:desc:compressionMode:", a4, self, a3, v11);
    }

  }
  return -[AGXTexture initWithDevice:desc:iosurface:plane:slice:]([AGXA10FamilyTexture alloc], "initWithDevice:desc:iosurface:plane:slice:", self, a3, a4, a5, 0);
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  void *v11;
  void *v12;
  uint64_t v13;

  v11 = (void *)IOSurfaceCopyValue(a4, (CFStringRef)*MEMORY[0x24BDD8E90]);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kAGXCompressionMode")))
    {
      v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kAGXCompressionMode")), "unsignedIntegerValue");

      return -[AGXTexture initWithSharedTextureHandle:device:desc:compressionMode:]([AGXA10FamilyTexture alloc], "initWithSharedTextureHandle:device:desc:compressionMode:", a4, self, a3, v13);
    }

  }
  return -[AGXTexture initWithDevice:desc:iosurface:plane:slice:]([AGXA10FamilyTexture alloc], "initWithDevice:desc:iosurface:plane:slice:", self, a3, a4, a5, a6);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  uint64_t v5;
  MTLPixelFormat v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  AGX::G9::TextureFormatTable *v13;
  unint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32x2_t v24;
  unint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  char v29;
  int v30;
  _BOOL4 v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *impl;
  uint64_t v40;
  id v41;
  _QWORD v42[2];
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  if (!objc_msgSend(a3, "validateWithDevice:", self))
  {
    v33 = 0;
    v25 = 0;
    goto LABEL_48;
  }
  v5 = objc_msgSend(a3, "descriptorPrivate");
  v7 = v5;
  v8 = *(_QWORD *)(v5 + 96);
  v41 = a3;
  if (v8 == 2)
    goto LABEL_10;
  if (v8 == 1)
    LODWORD(v8) = 9;
  else
    LODWORD(v8) = 0;
  v9 = *(_QWORD *)(v5 + 152);
  if (v9 == 3)
  {
    v10 = 768;
    goto LABEL_13;
  }
  if (v9 == 2)
  {
    v10 = 512;
    goto LABEL_13;
  }
  if (v9 != 1)
LABEL_10:
    v10 = 0;
  else
    v10 = 256;
LABEL_13:
  v11 = v8 & 0xFFFFFFFB;
  if (*(_BYTE *)(v5 + 128))
    v12 = v11;
  else
    v12 = 2;
  v13 = *(AGX::G9::TextureFormatTable **)(v5 + 8);
  v40 = v10 | v12 | ((*((_DWORD *)AGX::G9::TextureFormatTable::chooseTextureFormatOBJC(v13, v6) + 15) & 0xC) != 0);
  v38 = *(_QWORD *)v7;
  impl = self->_impl;
  v36 = *(_QWORD *)(v7 + 192);
  v37 = *(_QWORD *)(v7 + 104);
  v14 = *(_QWORD *)(v7 + 168) - 1;
  if (v14 > 9)
    v35 = 0;
  else
    v35 = dword_232D77F80[v14];
  if ((unint64_t)(*(_QWORD *)(v7 + 72) - 1) < 4)
    v15 = *(_DWORD *)(v7 + 72);
  else
    v15 = 0;
  v16 = *(_DWORD *)(v7 + 84);
  v17 = *(_QWORD *)(v7 + 16);
  v18 = *(_QWORD *)(v7 + 24);
  v19 = *(_QWORD *)(v7 + 32);
  v20 = *(_DWORD *)(v7 + 40);
  v22 = *(_QWORD *)(v7 + 48);
  v21 = *(_QWORD *)(v7 + 56);
  v23 = *(_QWORD *)(v7 + 112) & 0xFLL;
  objc_msgSend(v41, "resourceIndex");
  LODWORD(v34) = 0;
  AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)v42, (MTLPixelFormat)impl, v38, v13, v37, v36, v40, v35, v15, v16, v24, v17, v18, v19, v20, __SPAIR64__(v21, v22), 0, v34, v23,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v25 = 0;
  v42[0] = off_250402690;
  if (!v43)
  {
    if (v44)
    {
      v25 = v46;
    }
    else
    {
      v25 = v45;
      if (!v45)
      {
        v26 = v48;
        v27 = BYTE1(v48);
        v28 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>((uint64_t)v42, v45);
        if (v27 == 1)
          v29 = BYTE2(v48) & 1;
        else
          v29 = 0;
        v30 = 1;
        if ((v27 - 3) >= 2 && (v29 & 1) == 0)
        {
          if (v27 == 2)
            v30 = (v48 >> 16) & 1;
          else
            v30 = 0;
        }
        if (v26)
        {
          v32 = (v28 & 0xFFFFFFFFFFFFC000) != 0 && v26 == 1;
          if ((v32 & v30) != 0)
            v25 = 0x4000;
          else
            v25 = 64;
        }
        else
        {
          v25 = 16;
        }
      }
    }
  }
  v33 = v47;
LABEL_48:
  result.var1 = v25;
  result.var0 = v33;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = 256;
  result.var1 = v5;
  result.var0 = a3;
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  atomic<unsigned long long> *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __objc2_class **v10;

  v5 = &self->_telemetry.usage[1];
  do
    v6 = __ldaxr(&v5->__a_.__a_value);
  while (__stlxr(v6 | 8, &v5->__a_.__a_value));
  if (objc_msgSend(a3, "hazardTrackingMode") == 2)
  {
    do
      v7 = __ldaxr(&v5->__a_.__a_value);
    while (__stlxr(v7 | 0x10, &v5->__a_.__a_value));
  }
  if (objc_msgSend(a3, "type") == 1)
  {
    do
      v8 = __ldaxr(&v5->__a_.__a_value);
    while (__stlxr(v8 | 0x20, &v5->__a_.__a_value));
  }
  v9 = objc_msgSend(a3, "type");
  v10 = &off_2503FF340;
  if (v9 != 2)
    v10 = off_2503FF328;
  return (id)objc_msgSend(objc_alloc(*v10), "initWithDevice:descriptor:", self, a3);
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  int v5;
  char *impl;
  _BYTE *v8;
  BOOL result;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v5 = a5;
  v24[2] = *MEMORY[0x24BDAC8D0];
  impl = (char *)self->_impl;
  -[IOGPUMetalDevice deviceRef](self, "deviceRef", a3, a4);
  v8 = impl + 6376;
  if (a3 || v5)
  {
    *v8 = 0;
    v10 = (void *)GRCCopyAllCounterSourceGroup();
    if (!objc_msgSend(v10, "count"))
      goto LABEL_22;
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count"))
      goto LABEL_22;
    v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") != 1);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") == 1
      && !objc_msgSend((id)objc_msgSend(v11, "name"), "hasPrefix:", CFSTR("Firmware")))
    {
      goto LABEL_22;
    }
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") != 1
      && (objc_msgSend((id)objc_msgSend(v11, "name"), "hasPrefix:", CFSTR("RDE")) & 1) == 0
      || !v11
      || objc_msgSend(v11, "ringBufferNum") != 1)
    {
      goto LABEL_22;
    }
    v12 = MEMORY[0x24BDBD1C8];
    v23[0] = CFSTR("DisableOverlap");
    v23[1] = CFSTR("DisableMCH");
    v24[0] = MEMORY[0x24BDBD1C8];
    v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "features"), "objectForKeyedSubscript:", CFSTR("SupportOption_DisableMCH")), "BOOLValue");
    v14 = MEMORY[0x24BDBD1C0];
    if (v13)
      v14 = v12;
    v24[1] = v14;
    objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "setOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    v15 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v22[0] = objc_msgSend(MEMORY[0x24BE38F68], "selectWithName:options:", CFSTR("KickBoundary"), 0);
    v22[1] = objc_msgSend(MEMORY[0x24BE38F68], "selectWithName:options:", CFSTR("TimerFixed"), &unk_25041E1D0);
    v16 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x24BE38F60], "selectWithName:options:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "GRC_TIMESTAMP"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x24BE38F60], "selectWithName:options:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "GRC_GPU_CYCLES"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x24BE38F60], "selectWithName:options:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "GRC_SAMPLE_TYPE"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x24BE38F60], "selectWithName:options:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "GRC_ENCODER_ID"), 0));
    v19 = 0;
    if ((objc_msgSend(v11, "requestTriggers:firstErrorIndex:", v16, &v19) & 1) == 0
      || (objc_msgSend(v11, "requestCounters:firstErrorIndex:", v15, &v19) & 1) == 0)
    {
      goto LABEL_22;
    }
    v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count");
    v20[0] = CFSTR("ShaderProfiler");
    v20[1] = CFSTR("BufferSizeInKB");
    v21[0] = MEMORY[0x24BDBD1C8];
    v18 = v17 == 1 ? 4 : 6;
    v21[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (((unint64_t)((v18 * v5) >> 2) + 2 * *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]) >> 10);
    objc_msgSend(v11, "setOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    if ((objc_msgSend(v11, "setEnabled:", 1) & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "startSampling") & 1) != 0)
    {
      *((_QWORD *)impl + 796) = a3;
      *((_DWORD *)impl + 1600) = v5;
      *((_DWORD *)impl + 1595) = 0;
      *((_QWORD *)impl + 798) = v10;
      result = 1;
      *((_QWORD *)impl + 799) = v11;
    }
    else
    {
LABEL_22:

      GRCReleaseAllCounterSourceGroup();
      return 0;
    }
  }
  else
  {
    result = 1;
    *v8 = 1;
  }
  return result;
}

- (void)unmapShaderSampleBuffer
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  char v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  char *v24;
  unint64_t v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  size_t v34;
  int32x4_t v35;
  unint64_t v36;
  unint64_t v37;
  int32x4_t *v38;
  float *v39;
  int8x16_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int8x16_t v45;
  unsigned __int128 v46;
  float *v47;
  float *v48;
  unint64_t v49;
  unint64_t v50;
  _DWORD *v51;
  char *v52;
  uint64_t v53;
  size_t v55;
  char *v56;
  size_t v57;
  uint8_t *v58;
  unint64_t v59;
  unint64_t v60;
  int *v61;
  uint64_t v62;
  unsigned int v63;
  char *v64;
  size_t v65;
  int v66;
  unint64_t v67;
  unsigned int v68;
  unint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  const char *v79;
  uint64_t v80;
  float32x4x3_t v81;

  v2 = (_QWORD *)MEMORY[0x24BDAC7A8](self);
  v80 = *MEMORY[0x24BDAC8D0];
  v3 = v2[101];
  objc_msgSend(v2, "deviceRef");
  if (*(_BYTE *)(v3 + 6376))
  {
    *(_BYTE *)(v3 + 6376) = 0;
    return;
  }
  v4 = *(void **)(v3 + 6384);
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = *(void **)(v3 + 6392);
    v7 = objc_msgSend(v5, "sampleMarker");
    objc_msgSend(v5, "stopSampling");
    if (objc_msgSend(v6, "ringBufferNum") == 1)
    {
      v72 = 0;
      v73 = 0;
      v71 = 0;
      if (!objc_msgSend(v6, "ringBufferInfoAtIndex:base:size:dataOffset:dataSize:", 0, &v73, (char *)&v72 + 4, &v72, &v71))goto LABEL_75;
      LODWORD(v72) = ((unint64_t)v71 + 8) % HIDWORD(v72);
      objc_msgSend(v6, "resetRawDataPostProcessor");
      v8 = (char *)operator new(0x40000uLL);
      bzero(v8, 0x40000uLL);
      v9 = *(char **)(v3 + 6368);
      v63 = *(_DWORD *)(v3 + 6400);
      v10 = (unsigned int *)(v3 + 6380);
      while (1)
      {
        v11 = *v10;
        if (*v10 == -2)
          v12 = 0;
        else
          v12 = v11 + 1;
        while (1)
        {
          v13 = __ldaxr(v10);
          if (v13 != v11)
            break;
          if (!__stlxr(v12, v10))
          {
            v64 = v9;
            v65 = 0;
            v66 = -1;
            v67 = -1;
            v68 = -1;
            while (1)
            {
              v69 = 0;
              v70 = v72;
              LOBYTE(v62) = 1;
              v14 = objc_msgSend(v6, "postProcessRawDataWithRingBufferIndex:source:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:", 0, v73, HIDWORD(v72), &v70, v71, v8, 0x40000, 0, &v69, v62);
              LODWORD(v72) = v70;
              if (!v69)
              {
LABEL_69:
                if (v68 == -1 && v66 != -1)
                {
                  v60 = v67 / 0xC + 1;
                  v61 = (int *)&v64[12 * (v67 / 0xC)];
                  do
                  {
                    if (*v61 != -1)
                      break;
                    *v61 = v66;
                    v61 -= 3;
                    --v60;
                  }
                  while (v60);
                }
                operator delete(v8);
                goto LABEL_75;
              }
              v15 = v14;
              LODWORD(v16) = 0;
              v17 = (v69 + 7) & 0xFFFFFFFFFFFFFFF8;
              v69 = v17;
              while (1)
              {
                v18 = v16;
                if (v17 <= v16)
                  break;
                v19 = v16 + 8;
                v20 = -8 - v16;
                while (1)
                {
                  v21 = *(_QWORD *)&v8[v18];
                  v18 = v19;
                  if (v21 == v7)
                    break;
                  v19 += 8;
                  v20 -= 8;
                  if (v17 <= v18)
                    goto LABEL_18;
                }
                LODWORD(v16) = v19;
                if (v17 > v19)
                {
                  v16 = v19;
                  v22 = v19;
                  while (*(_QWORD *)&v8[v16] != v7)
                  {
                    v22 += 8;
                    v16 = v22;
                    if (v17 <= v22)
                      goto LABEL_32;
                  }
                  LODWORD(v16) = v22;
                }
LABEL_32:
                v23 = v16 - v19;
                if (v16 - v19 >= 0x20)
                {
                  v24 = &v8[v19];
                  v25 = *((_QWORD *)v24 + 2);
                  if (v25 > 5)
                  {
                    v26 = 0;
LABEL_42:
                    v28 = v68;
                    goto LABEL_43;
                  }
                  if (((1 << v25) & 0x15) == 0)
                  {
                    v29 = *((_DWORD *)v24 + 6);
                    v26 = v11 > v29;
                    v30 = v66;
                    if (v11 > v29)
                      v30 = v29;
                    v66 = v30;
                    goto LABEL_42;
                  }
                  v26 = 0;
                  v27 = *((_DWORD *)v24 + 6);
                  v28 = v68;
                  if (v11 > v27)
                    v28 = v27;
LABEL_43:
                  v68 = v28;
                  if (v23 < 0x21)
                  {
                    v34 = v65;
                    goto LABEL_66;
                  }
                  HIDWORD(v62) = v26;
                  bzero(buf, 0x1200uLL);
                  LODWORD(v31) = (v23 >> 3) - 4;
                  if (v31 >= 0x180)
                    v31 = 384;
                  else
                    v31 = v31;
                  if ((_DWORD)v31)
                  {
                    if (v31 < 8)
                    {
                      v32 = 0;
                      v33 = v68;
                      goto LABEL_57;
                    }
                    v32 = v31 & 0x1F8;
                    v35 = vdupq_n_s32(v68);
                    v36 = ((v16 + v20) >> 3) - 4;
                    if (v36 >= 0x180)
                      LOWORD(v36) = 384;
                    v37 = v36 & 0x1F8;
                    v38 = (int32x4_t *)&v8[v19 + 64];
                    v39 = (float *)buf;
                    v40.i64[0] = 0xF0000000FLL;
                    v40.i64[1] = 0xF0000000FLL;
                    do
                    {
                      v42 = v38[-2];
                      v41 = v38[-1];
                      v44 = *v38;
                      v43 = v38[1];
                      v38 += 4;
                      v81.val[1] = (float32x4_t)vandq_s8((int8x16_t)vuzp2q_s32(v42, v41), v40);
                      v45 = vandq_s8((int8x16_t)vuzp2q_s32(v44, v43), v40);
                      v81.val[2] = (float32x4_t)(*(_OWORD *)&vuzp1q_s32(v42, v41) & __PAIR128__(0xFFFFFFFEFFFFFFFELL, 0xFFFFFFFEFFFFFFFELL));
                      v46 = *(_OWORD *)&vuzp1q_s32(v44, v43) & __PAIR128__(0xFFFFFFFEFFFFFFFELL, 0xFFFFFFFEFFFFFFFELL);
                      v81.val[0] = (float32x4_t)v35;
                      v47 = v39 + 24;
                      vst3q_f32(v39, v81);
                      v48 = v39 + 12;
                      vst3q_f32(v48, *(float32x4x3_t *)v35.i8);
                      v39 = v47;
                      v37 -= 8;
                    }
                    while (v37);
                    v33 = v68;
                    if (v32 != v31)
                    {
LABEL_57:
                      v49 = ((v16 + v20) >> 3) - 4;
                      if (v49 >= 0x180)
                        v49 = 384;
                      v50 = v32 - v49;
                      v51 = (_DWORD *)&v75 + 3 * v32 + 1;
                      v52 = &v8[8 * v32 + 32 + v19];
                      do
                      {
                        v53 = *(_QWORD *)v52;
                        v52 += 8;
                        *(v51 - 2) = v33;
                        *(v51 - 1) = BYTE4(v53) & 0xF;
                        *v51 = v53 & 0xFFFFFFFE;
                        v51 += 3;
                      }
                      while (!__CFADD__(v50++, 1));
                    }
                    v55 = (12 * v31);
                    v34 = (v55 + v65);
                    v56 = &v64[v65];
                    if (v34 <= v63)
                    {
                      memcpy(v56, buf, v55);
                    }
                    else
                    {
                      v57 = 12 * ((v63 - v65) / 0xC);
                      memcpy(v56, buf, v57);
                      v58 = &buf[v57];
                      v34 = (v55 - v57);
                      memcpy(v64, v58, v34);
                    }
                    goto LABEL_65;
                  }
                  v34 = v65;
LABEL_65:
                  v26 = HIDWORD(v62);
LABEL_66:
                  v65 = v34;
                  v59 = v67;
                  if (v26)
                    v59 = v34;
                  v67 = v59;
                  v17 = v69;
                }
              }
LABEL_18:
              if ((v15 & 1) == 0)
                goto LABEL_69;
            }
          }
        }
        __clrex();
      }
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", "agxa_device_template.hpp", 2861, "unmapShaderSampleBuffer");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v75 = "agxa_device_template.hpp";
      v76 = 1024;
      v77 = 2861;
      v78 = 2080;
      v79 = "unmapShaderSampleBuffer";
      _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v75 = "agxa_device_template.hpp";
      v76 = 1024;
      v77 = 2861;
      v78 = 2080;
      v79 = "unmapShaderSampleBuffer";
      _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", buf, 0x1Cu);
    }
LABEL_75:
    *(_QWORD *)(v3 + 6368) = 0;

    *(_QWORD *)(v3 + 6384) = 0;
    *(_QWORD *)(v3 + 6392) = 0;
    GRCReleaseAllCounterSourceGroup();
  }
}

- (BOOL)isShaderSampleBufferMapped
{
  return *((_QWORD *)self->_impl + 796) != 0;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  $07DD8FAB54C96B0119288D702EF79B66 *p_performance_state_assertion;
  AGXA_UnfairLock *p_lock;
  AGXA10FamilyPerformanceStateAssertion *existingAssertion;
  AGXA10FamilyPerformanceStateAssertion *v10;
  uint64_t v11;
  mach_port_t Connect;
  kern_return_t v13;
  FILE **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  size_t outputStructCnt;
  _BYTE outputStruct[8];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 < 3)
  {
    p_performance_state_assertion = &self->performance_state_assertion;
    p_lock = &self->performance_state_assertion.lock;
    os_unfair_lock_lock(&self->performance_state_assertion.lock.lock);
    existingAssertion = p_performance_state_assertion->existingAssertion;
    if (p_performance_state_assertion->existingAssertion)
    {
      if (existingAssertion->_requestedLevel == (_DWORD)a3)
      {
        v10 = existingAssertion;
      }
      else
      {
        v22 = *MEMORY[0x24BDD0FC8];
        v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Requested MTLDevicePerformanceState (%ld) is incompatible with the performance state currently set on the system."), a3);
        v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MTLPerformanceStateAssertionDomain"), 2, v17);
        fwrite("AGX: PerformanceState: Incompatible PerformanceStateAssertion already exists\n\n", 0x4EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        v10 = 0;
      }
      goto LABEL_16;
    }
    outputStructCnt = 8;
    Connect = IOGPUDeviceGetConnect();
    outputStruct[0] = 1;
    outputStruct[1] = a3;
    v13 = IOConnectCallStructMethod(Connect, 0x10Du, outputStruct, 8uLL, outputStruct, &outputStructCnt);
    if (!v13)
    {
      v10 = -[AGXA10FamilyPerformanceStateAssertion initWithDevice:level:]([AGXA10FamilyPerformanceStateAssertion alloc], "initWithDevice:level:", self, a3);
      p_performance_state_assertion->existingAssertion = v10;
LABEL_16:
      os_unfair_lock_unlock(&p_lock->lock);
      return v10;
    }
    v14 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: PerformanceState: Could not acquire perf state from kernel. Error: 0x%x\n", v13);
    if (v13 == -536870207)
    {
      v28 = *MEMORY[0x24BDD0FC8];
      v29 = CFSTR("This process does not have permission to request performance state changes");
      v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      fwrite("AGX: PerformanceState: No entitlement to acquire performance states\n\n", 0x45uLL, 1uLL, *v14);
    }
    else
    {
      if (v13 == -536870203)
      {
        v26 = *MEMORY[0x24BDD0FC8];
        v27 = CFSTR("This process is attempting to acquire a Performance State Assertion in an incompatible state.");
        v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        fwrite("AGX: PerformanceState: Incompatible performance state requested\n\n", 0x41uLL, 1uLL, *v14);
        v16 = 2;
LABEL_15:
        v18 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MTLPerformanceStateAssertionDomain"), v16, v15);
        v10 = 0;
        *a4 = v18;
        goto LABEL_16;
      }
      v24 = *MEMORY[0x24BDD0FC8];
      v25 = CFSTR("Failed to acquire performance state.");
      v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      fprintf(*v14, "AGX: PerformanceState: Failed to acquire performance state with code 0x%x\n\n", v13);
    }
    v16 = 3;
    goto LABEL_15;
  }
  v30 = *MEMORY[0x24BDD0FC8];
  v31[0] = CFSTR("The provided performanceState is invalid");
  v11 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MTLPerformanceStateAssertionDomain"), 2, v11);
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: PerformanceState: Provided performance state %d is unknown or invalid\n\n", 4);
  return 0;
}

- (void)removePerformanceStateAssertion:(id)a3
{
  $07DD8FAB54C96B0119288D702EF79B66 *p_performance_state_assertion;
  AGXA_UnfairLock *p_lock;
  mach_port_t Connect;
  kern_return_t v6;
  FILE **v7;
  size_t outputStructCnt;
  int outputStruct;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_performance_state_assertion = &self->performance_state_assertion;
  p_lock = &self->performance_state_assertion.lock;
  os_unfair_lock_lock(&self->performance_state_assertion.lock.lock);
  outputStructCnt = 8;
  Connect = IOGPUDeviceGetConnect();
  LOWORD(outputStruct) = 1025;
  v6 = IOConnectCallStructMethod(Connect, 0x10Du, &outputStruct, 8uLL, &outputStruct, &outputStructCnt);
  if (v6)
  {
    v7 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: Could not release perf state in kernel. Error: 0x%x\n\n", v6);
    fprintf(*v7, "AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", "agxa_device_objc.mm", 1700, "-[AGXA10FamilyDevice removePerformanceStateAssertion:]");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      outputStruct = 136315650;
      v10 = "agxa_device_objc.mm";
      v11 = 1024;
      v12 = 1700;
      v13 = 2080;
      v14 = "-[AGXA10FamilyDevice removePerformanceStateAssertion:]";
      _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", (uint8_t *)&outputStruct, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      outputStruct = 136315650;
      v10 = "agxa_device_objc.mm";
      v11 = 1024;
      v12 = 1700;
      v13 = 2080;
      v14 = "-[AGXA10FamilyDevice removePerformanceStateAssertion:]";
      _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", (uint8_t *)&outputStruct, 0x1Cu);
    }
  }
  else
  {
    p_performance_state_assertion->existingAssertion = 0;
  }
  os_unfair_lock_unlock(&p_lock->lock);
}

- (int64_t)currentPerformanceState
{
  mach_port_t Connect;
  kern_return_t v3;
  int64_t v4;
  _BYTE outputStruct[4];
  unsigned __int8 v7;
  size_t outputStructCnt;
  uint64_t inputStruct;

  -[IOGPUMetalDevice deviceRef](self, "deviceRef");
  inputStruct = 2;
  outputStructCnt = 8;
  Connect = IOGPUDeviceGetConnect();
  v3 = IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, outputStruct, &outputStructCnt);
  if (v7 >= 3u)
    v4 = 255;
  else
    v4 = v7;
  if (v3)
    return 0;
  else
    return v4;
}

- (BOOL)enableConsistentPerfState:(int)a3
{
  char v3;
  char *impl;
  mach_port_t Connect;
  _BYTE *v6;
  os_unfair_lock_s *v7;
  BOOL v8;
  mach_port_t v9;
  size_t inputStructCnt;
  __int16 outputStruct;
  size_t outputStructCnt;
  uint64_t inputStruct;

  v3 = a3;
  impl = (char *)self->_impl;
  -[IOGPUMetalDevice deviceRef](self, "deviceRef");
  inputStructCnt = 8;
  Connect = IOGPUDeviceGetConnect();
  v6 = impl + 6408;
  v7 = (os_unfair_lock_s *)(impl + 6412);
  os_unfair_lock_lock(v7);
  if (!*v6)
  {
    outputStruct = 256;
    if (IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, 8uLL, &outputStruct, &inputStructCnt))
    {
LABEL_6:
      os_unfair_lock_unlock(v7);
      return 0;
    }
    *v6 = 1;
  }
  os_unfair_lock_unlock(v7);
  v8 = 1;
  LOBYTE(outputStruct) = 1;
  HIBYTE(outputStruct) = v3;
  if (IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, inputStructCnt, &outputStruct, &inputStructCnt))
  {
    os_unfair_lock_lock(v7);
    if (*v6)
    {
      outputStructCnt = 8;
      inputStruct = 0;
      v9 = IOGPUDeviceGetConnect();
      IOConnectCallStructMethod(v9, 0x109u, &inputStruct, 8uLL, &inputStruct, &outputStructCnt);
      *v6 = 0;
    }
    goto LABEL_6;
  }
  return v8;
}

- (BOOL)disableConsistentPerfState
{
  char *impl;
  _BYTE *v3;
  os_unfair_lock_s *v4;
  mach_port_t Connect;
  size_t v7;
  uint64_t outputStruct;

  impl = (char *)self->_impl;
  -[IOGPUMetalDevice deviceRef](self, "deviceRef");
  v3 = impl + 6408;
  v4 = (os_unfair_lock_s *)(impl + 6412);
  os_unfair_lock_lock(v4);
  if (*v3)
  {
    v7 = 8;
    outputStruct = 0;
    Connect = IOGPUDeviceGetConnect();
    IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, 8uLL, &outputStruct, &v7);
    *v3 = 0;
  }
  os_unfair_lock_unlock(v4);
  return 1;
}

- (id)getConsistentPerfStateInfoAndReset:(BOOL)a3
{
  mach_port_t Connect;
  _BYTE v6[8];
  size_t outputStructCnt;
  uint64_t inputStruct;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  -[IOGPUMetalDevice deviceRef](self, "deviceRef");
  inputStruct = 2;
  BYTE1(inputStruct) = a3;
  outputStructCnt = 8;
  Connect = IOGPUDeviceGetConnect();
  if (IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, v6, &outputStructCnt))
    return 0;
  v9[0] = CFSTR("is_enabled");
  v10[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6[2]);
  v9[1] = CFSTR("was_consistent");
  v10[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6[3]);
  v9[2] = CFSTR("level");
  v10[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6[4]);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
}

- (id)getConsistentPerfStateMappingTable
{
  mach_port_t Connect;
  _BYTE v4[8];
  size_t outputStructCnt;
  uint64_t inputStruct;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  -[IOGPUMetalDevice deviceRef](self, "deviceRef");
  inputStruct = 3;
  outputStructCnt = 8;
  Connect = IOGPUDeviceGetConnect();
  if (IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, v4, &outputStructCnt))
    return 0;
  v7[0] = CFSTR("min_pstate");
  v8[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4[1]);
  v7[1] = CFSTR("mid_pstate");
  v8[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4[2]);
  v7[2] = CFSTR("max_pstate");
  v8[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4[3]);
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  *((_BYTE *)self->_impl + 6360) = a3;
}

- (BOOL)shaderDebugInfoCaching
{
  return *((_BYTE *)self->_impl + 6360);
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  id v3;
  AGXATelemetry *p_telemetry;
  uint64_t v6;
  float v7;
  char v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *p_a_value;
  unint64_t v26;
  char *impl;
  unint64_t v28;
  __int16 v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  uint64_t **v39;
  char *v40;
  uint64_t **v41;
  _BOOL4 v42;
  char **v43;
  AGXA10FamilySampler *WeakRetained;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  uint64_t *v54;
  uint64_t **v55;
  unsigned __int16 *v56;
  char *v57;
  id *v58;
  __int128 v59;
  uint64_t v60;
  uint64_t *v61;
  __int128 v63;
  _BYTE v64[32];
  __int128 __p;
  uint64_t v66;

  v3 = a3;
  p_telemetry = &self->_telemetry;
  if (self->_telemetry.isEnabled)
  {
    if (objc_msgSend(a3, "lodAverage"))
      v6 = 2048;
    else
      v6 = 1;
    objc_msgSend(v3, "lodMinClamp");
    if (v7 == 0.0)
    {
      objc_msgSend(v3, "lodMaxClamp");
      v8 = 12;
      if (v9 == 3.4028e38)
        v8 = 0;
    }
    else
    {
      v8 = 12;
    }
    v10 = (1 << v8) | v6;
    if (objc_msgSend(v3, "maxAnisotropy") == 1)
      v11 = 1;
    else
      v11 = 256;
    v12 = objc_msgSend(v3, "normalizedCoordinates");
    v13 = 1024;
    if (v12)
      v13 = 512;
    v14 = v10 | v11 | v13;
    v15 = objc_msgSend(v3, "sAddressMode");
    if (v15 > 4)
      LOBYTE(v16) = 0;
    else
      v16 = qword_232D76230[v15];
    v17 = v14 | (1 << v16);
    v18 = objc_msgSend(v3, "tAddressMode");
    if (v18 > 4)
      LOBYTE(v19) = 0;
    else
      v19 = qword_232D76230[v18];
    v20 = v17 | (1 << v19);
    v21 = objc_msgSend(v3, "rAddressMode");
    if (v21 > 4)
      LOBYTE(v22) = 0;
    else
      v22 = qword_232D76230[v21];
    v23 = v20 | (1 << v22);
    do
      v24 = __ldaxr((unint64_t *)p_telemetry);
    while (__stlxr(v24 | v23, (unint64_t *)p_telemetry));
    p_a_value = &p_telemetry->usage[1].__a_.__a_value;
    do
      v26 = __ldaxr(p_a_value);
    while (__stlxr(v26, p_a_value));
  }
  impl = (char *)self->_impl;
  __p = 0uLL;
  v66 = 0;
  LOWORD(v63) = 32 * (objc_msgSend(v3, "mipFilter") != 0);
  LOWORD(v63) = v63 & 0xFFBF | ((objc_msgSend(v3, "mipFilter") == 2) << 6);
  LOWORD(v63) = v63 & 0xFF7F | ((objc_msgSend(v3, "minFilter") == 1) << 7);
  LOWORD(v63) = v63 & 0xFEFF | ((objc_msgSend(v3, "magFilter") == 1) << 8);
  v28 = objc_msgSend(v3, "compareFunction");
  if (v28 > 7)
    v29 = 0;
  else
    v29 = word_232D73DF0[v28];
  LOWORD(v63) = v63 & 0xFFF0 | v29;
  DWORD1(v63) = (float)((float)(unint64_t)objc_msgSend(v3, "maxAnisotropy") + 0.5) & 0x1F;
  DWORD1(v63) = DWORD1(v63) & 0xFFFFFF1F | (32 * (objc_msgSend(v3, "sAddressMode") & 7));
  DWORD1(v63) = DWORD1(v63) & 0xFFFFF8FF | ((objc_msgSend(v3, "tAddressMode") & 7) << 8);
  DWORD1(v63) = DWORD1(v63) & 0xFFFFC7FF | ((objc_msgSend(v3, "rAddressMode") & 7) << 11);
  if (objc_msgSend(v3, "normalizedCoordinates"))
    v30 = 0x4000;
  else
    v30 = 0;
  DWORD1(v63) = DWORD1(v63) & 0xFFFFBFFF | v30;
  if (objc_msgSend(v3, "lodAverage"))
    v31 = 0x8000;
  else
    v31 = 0;
  DWORD1(v63) = DWORD1(v63) & 0xFFFC7FFF | v31 & 0xFFFCFFFF | ((objc_msgSend(v3, "minFilter") & 3) << 16);
  DWORD1(v63) = DWORD1(v63) & 0xFFF3FFFF | ((objc_msgSend(v3, "magFilter") & 3) << 18);
  if (objc_msgSend(v3, "supportArgumentBuffers"))
    v32 = 0x100000;
  else
    v32 = 0;
  DWORD1(v63) = DWORD1(v63) & 0xFFEFFFFF | v32;
  if (objc_msgSend(v3, "forceSeamsOnCubemapFiltering"))
    v33 = 0x1000000;
  else
    v33 = 0;
  DWORD1(v63) = DWORD1(v63) & 0xFEFFFFFF | v33;
  v34 = objc_msgSend(v3, "borderColor");
  DWORD1(v63) = DWORD1(v63) & 0xFF9FFFFF | ((v34 & 3) << 21);
  if ((~v34 & 3) != 0)
  {
    *(_QWORD *)&v64[24] = 0;
    *(_OWORD *)&v64[4] = 0uLL;
  }
  else
  {
    *(_DWORD *)&v64[4] = objc_msgSend(v3, "customBorderColorValue");
    *(_DWORD *)&v64[8] = objc_msgSend(v3, "customBorderColorValue");
    *(_DWORD *)&v64[12] = objc_msgSend(v3, "customBorderColorValue");
    *(_DWORD *)&v64[16] = objc_msgSend(v3, "customBorderColorValue");
    *(_QWORD *)&v64[24] = objc_msgSend(v3, "pixelFormat");
  }
  objc_msgSend(v3, "lodMinClamp");
  DWORD2(v63) = v35;
  objc_msgSend(v3, "lodMaxClamp");
  HIDWORD(v63) = v36;
  objc_msgSend(v3, "lodBias");
  *(_DWORD *)v64 = v37;
  v38 = (void *)objc_msgSend(v3, "label");
  if (v38)
    MEMORY[0x234927D28](&__p, objc_msgSend(v38, "UTF8String"));
  os_unfair_lock_lock((os_unfair_lock_t)impl + 1612);
  v39 = (uint64_t **)(impl + 6464);
  v40 = (char *)*((_QWORD *)impl + 808);
  if (!v40)
    goto LABEL_55;
  v41 = (uint64_t **)(impl + 6464);
  do
  {
    v42 = AGX::SamplerDescriptor::operator<((unsigned __int16 *)v40 + 16, (unsigned __int16 *)&v63);
    v43 = (char **)(v40 + 8);
    if (!v42)
    {
      v43 = (char **)v40;
      v41 = (uint64_t **)v40;
    }
    v40 = *v43;
  }
  while (*v43);
  if (v41 == v39
    || AGX::SamplerDescriptor::operator<((unsigned __int16 *)&v63, (unsigned __int16 *)v41 + 16)
    || (WeakRetained = (AGXA10FamilySampler *)objc_loadWeakRetained((id *)v41 + 13)) == 0)
  {
LABEL_55:
    if (v3)
    {
      v45 = 0;
    }
    else
    {
      v46 = objc_alloc_init(MEMORY[0x24BDDD6F0]);
      v3 = v46;
      v47 = 1;
      if ((v63 & 0x40) != 0)
        v47 = 2;
      if ((v63 & 0x20) != 0)
        v48 = v47;
      else
        v48 = 0;
      objc_msgSend(v46, "setMipFilter:", v48);
      v49 = (v63 & 0xF) - 2;
      if (v49 > 6)
        v50 = 0;
      else
        v50 = qword_232D7C778[v49];
      objc_msgSend(v3, "setCompareFunction:", v50);
      objc_msgSend(v3, "setMaxAnisotropy:", BYTE4(v63) & 0x1F);
      objc_msgSend(v3, "setSAddressMode:", BYTE4(v63) >> 5);
      objc_msgSend(v3, "setTAddressMode:", ((unint64_t)DWORD1(v63) >> 8) & 7);
      objc_msgSend(v3, "setRAddressMode:", ((unint64_t)DWORD1(v63) >> 11) & 7);
      objc_msgSend(v3, "setNormalizedCoordinates:", (DWORD1(v63) >> 14) & 1);
      objc_msgSend(v3, "setLodAverage:", (DWORD1(v63) >> 15) & 1);
      objc_msgSend(v3, "setMinFilter:", BYTE6(v63) & 3);
      objc_msgSend(v3, "setMagFilter:", ((unint64_t)DWORD1(v63) >> 18) & 3);
      objc_msgSend(v3, "setSupportArgumentBuffers:", (DWORD1(v63) >> 20) & 1);
      objc_msgSend(v3, "setForceSeamsOnCubemapFiltering:", HIBYTE(DWORD1(v63)) & 1);
      objc_msgSend(v3, "setBorderColor:", ((unint64_t)DWORD1(v63) >> 21) & 3);
      objc_msgSend(v3, "setCustomBorderColorValue_0:", *(unsigned int *)&v64[4]);
      objc_msgSend(v3, "setCustomBorderColorValue_1:", *(unsigned int *)&v64[8]);
      objc_msgSend(v3, "setCustomBorderColorValue_2:", *(unsigned int *)&v64[12]);
      objc_msgSend(v3, "setCustomBorderColorValue_3:", *(unsigned int *)&v64[16]);
      objc_msgSend(v3, "setPixelFormat:", *(_QWORD *)&v64[24]);
      LODWORD(v51) = DWORD2(v63);
      objc_msgSend(v3, "setLodMinClamp:", v51);
      LODWORD(v52) = HIDWORD(v63);
      objc_msgSend(v3, "setLodMaxClamp:", v52);
      LODWORD(v53) = *(_DWORD *)v64;
      objc_msgSend(v3, "setLodBias:", v53);
      v45 = v3;
    }
    WeakRetained = -[AGXA10FamilySampler initWithDevice:samplerDescriptor:driverDescriptor:initialQOSOverride:]([AGXA10FamilySampler alloc], "initWithDevice:samplerDescriptor:driverDescriptor:initialQOSOverride:", self, v3, &v63, *((unsigned int *)impl + 1626));
    v54 = *v39;
    v55 = (uint64_t **)(impl + 6464);
    if (*v39)
    {
      while (1)
      {
        while (1)
        {
          v55 = (uint64_t **)v54;
          v56 = (unsigned __int16 *)(v54 + 4);
          if (!AGX::SamplerDescriptor::operator<((unsigned __int16 *)&v63, (unsigned __int16 *)v54 + 16))
            break;
          v54 = *v55;
          v39 = v55;
          if (!*v55)
            goto LABEL_72;
        }
        if (!AGX::SamplerDescriptor::operator<(v56, (unsigned __int16 *)&v63))
          break;
        v39 = v55 + 1;
        v54 = v55[1];
        if (!v54)
          goto LABEL_72;
      }
      v58 = (id *)v55;
    }
    else
    {
LABEL_72:
      v57 = (char *)operator new(0x70uLL);
      v58 = (id *)v57;
      v59 = *(_OWORD *)v64;
      *((_OWORD *)v57 + 2) = v63;
      *((_OWORD *)v57 + 3) = v59;
      *((_OWORD *)v57 + 4) = *(_OWORD *)&v64[16];
      if (SHIBYTE(v66) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v57 + 80), (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
      }
      else
      {
        *((_OWORD *)v57 + 5) = __p;
        *((_QWORD *)v57 + 12) = v66;
      }
      objc_initWeak(v58 + 13, 0);
      *v58 = 0;
      v58[1] = 0;
      v58[2] = v55;
      *v39 = (uint64_t *)v58;
      v60 = **((_QWORD **)impl + 807);
      v61 = (uint64_t *)v58;
      if (v60)
      {
        *((_QWORD *)impl + 807) = v60;
        v61 = *v39;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)impl + 808), v61);
      ++*((_QWORD *)impl + 809);
    }
    objc_storeWeak(v58 + 13, WeakRetained);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)impl + 1612);
  if (SHIBYTE(v66) < 0)
    operator delete((void *)__p);
  return WeakRetained;
}

- (void)_storeRenderPipelineState:(id)a3
{
  if (*((_BYTE *)self->_impl + 6681)
    && objc_msgSend(a3, "label")
    && objc_msgSend((id)objc_msgSend(a3, "label"), "length"))
  {
    os_unfair_lock_lock(&self->_pipelineStatesLock);
    if ((-[NSPointerArray count](self->_pipelineStates, "count") & 0x1FFFFFFFFFFF8000) == 0)
      -[NSPointerArray addPointer:](self->_pipelineStates, "addPointer:", a3);
    os_unfair_lock_unlock(&self->_pipelineStatesLock);
  }
}

- (void)_storeComputePipelineState:(id)a3
{
  if (*((_BYTE *)self->_impl + 6681)
    && objc_msgSend(a3, "label")
    && objc_msgSend((id)objc_msgSend(a3, "label"), "length"))
  {
    os_unfair_lock_lock(&self->_pipelineStatesLock);
    if ((-[NSPointerArray count](self->_pipelineStates, "count") & 0x1FFFFFFFFFFF8000) == 0)
      -[NSPointerArray addPointer:](self->_pipelineStates, "addPointer:", a3);
    os_unfair_lock_unlock(&self->_pipelineStatesLock);
  }
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  void *Render;

  Render = (void *)AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(*((void ****)self->_impl + 684), a3, self, 0, 0, a4, 0);
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", Render);
  return Render;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *Render;

  Render = (void *)AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(*((void ****)self->_impl + 684), a3, self, a4, (uint64_t)a5, a6, 0);
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", Render);
  return Render;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  void ***v6;
  _QWORD v7[6];

  v6 = (void ***)*((_QWORD *)self->_impl + 684);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__AGXA10FamilyDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_2504004F8;
  v7[4] = self;
  v7[5] = a4;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(v6, a3, self, 0, 0, 0, (uint64_t)v7);
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void ***v7;
  _QWORD v8[6];

  v7 = (void ***)*((_QWORD *)self->_impl + 684);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__AGXA10FamilyDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v8[3] = &unk_2504004F8;
  v8[4] = self;
  v8[5] = a5;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(v7, a3, self, a4, 0, 0, (uint64_t)v8);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  void *Render;

  Render = (void *)AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(*((void ****)self->_impl + 684), (MTLRenderPipelineDescriptor *)a3, self, 0, 0, a4, 0);
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", Render);
  return Render;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  void ***v6;
  _QWORD v7[6];

  v6 = (void ***)*((_QWORD *)self->_impl + 684);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__AGXA10FamilyDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_2504004F8;
  v7[4] = self;
  v7[5] = a4;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(v6, (MTLRenderPipelineDescriptor *)a3, self, 0, 0, 0, (unint64_t)v7);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *Render;

  Render = (void *)AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(*((void ****)self->_impl + 684), (MTLRenderPipelineDescriptor *)a3, self, a4, (uint64_t)a5, a6, 0);
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", Render);
  return Render;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void ***v7;
  _QWORD v8[6];

  v7 = (void ***)*((_QWORD *)self->_impl + 684);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__AGXA10FamilyDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v8[3] = &unk_2504004F8;
  v8[4] = self;
  v8[5] = a5;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(v7, (MTLRenderPipelineDescriptor *)a3, self, a4, 0, 0, (unint64_t)v8);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id ComputePipeline;

  ComputePipeline = AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createComputePipeline(*((_QWORD *)self->_impl + 684), a3, self, 0, 0, a4, 0);
  -[AGXA10FamilyDevice _storeComputePipelineState:](self, "_storeComputePipelineState:", ComputePipeline);
  return ComputePipeline;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  _QWORD v7[6];

  v6 = *((_QWORD *)self->_impl + 684);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__AGXA10FamilyDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_250400520;
  v7[4] = self;
  v7[5] = a4;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createComputePipeline(v6, a3, self, 0, 0, 0, v7);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id ComputePipeline;

  ComputePipeline = AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createComputePipeline(*((_QWORD *)self->_impl + 684), a3, self, a4, (uint64_t)a5, a6, 0);
  -[AGXA10FamilyDevice _storeComputePipelineState:](self, "_storeComputePipelineState:", ComputePipeline);
  return ComputePipeline;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v7;
  _QWORD v8[6];

  v7 = *((_QWORD *)self->_impl + 684);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__AGXA10FamilyDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v8[3] = &unk_250400520;
  v8[4] = self;
  v8[5] = a5;
  AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createComputePipeline(v7, a3, self, a4, 0, 0, v8);
}

- (void)alertCommandBufferActivityStart
{
  os_unfair_lock_s *impl;
  uint32_t os_unfair_lock_opaque;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 1737);
  os_unfair_lock_opaque = impl[1736]._os_unfair_lock_opaque;
  impl[1736]._os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
  if (os_unfair_lock_opaque == 0x7FFFFFFF)
    AGX::Compiler::compileProgram<AGX::ComputeProgramKey,AGCDeserializedReply>(AGX::ComputeProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCDeserializedReply const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
  LOBYTE(impl[1588]._os_unfair_lock_opaque) = 0;
  os_unfair_lock_unlock(impl + 1737);
}

- (void)alertCommandBufferActivityComplete
{
  os_unfair_lock_s *impl;
  uint32_t os_unfair_lock_opaque;

  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 1737);
  os_unfair_lock_opaque = impl[1736]._os_unfair_lock_opaque;
  impl[1736]._os_unfair_lock_opaque = os_unfair_lock_opaque - 1;
  if ((os_unfair_lock_opaque & 0x80000000) != 0)
    AGX::Compiler::compileProgram<AGX::ComputeProgramKey,AGCDeserializedReply>(AGX::ComputeProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCDeserializedReply const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
  if (os_unfair_lock_opaque == 1)
    *(std::chrono::system_clock::time_point *)&impl[1586]._os_unfair_lock_opaque = std::chrono::system_clock::now();
  os_unfair_lock_unlock(impl + 1737);
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", 0, a4);
  return 0;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  -[AGXA10FamilyDevice _storeRenderPipelineState:](self, "_storeRenderPipelineState:", 0, a4, a5, a6);
  return 0;
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id **v9;
  _QWORD v10[10];

  if (objc_msgSend(a3, "functionType") != 6
    || -[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v9 = (id **)*((_QWORD *)self->_impl + 684);
    if (a5)
      *a5 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE31createDynamicLibraryForFunctionEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXA10FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    v10[3] = &unk_250401238;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = a3;
    v10[7] = 0;
    v10[8] = v9;
    v10[9] = a5;
    AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::compileVisibleFunction(v9, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, 0, 0, (uint64_t)v10);
  }
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 completionHandler:(id)a5
{
  id **v9;
  _QWORD v10[10];

  if (objc_msgSend(a3, "functionType") != 6
    || -[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v9 = (id **)*((_QWORD *)self->_impl + 684);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE31createDynamicLibraryForFunctionEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXA10FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    v10[3] = &unk_250401238;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = a3;
    v10[7] = a5;
    v10[8] = v9;
    v10[9] = 0;
    AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::compileVisibleFunction(v9, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, 0, a5 != 0, (uint64_t)v10);
  }
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6
{
  id **v11;
  _QWORD v12[7];
  _QWORD v13[3];
  char v14;

  if (objc_msgSend(a3, "functionType") != 6
    || -[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v11 = (id **)*((_QWORD *)self->_impl + 684);
    if (a6)
      *a6 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 1;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE27addVisibleFunctionToArchiveEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXA10FamilyDeviceP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke;
    v12[3] = &unk_2504012C8;
    v12[5] = v11;
    v12[6] = a6;
    v12[4] = v13;
    AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::compileVisibleFunction(v11, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, (uint64_t)a5, 0, (uint64_t)v12);
    _Block_object_dispose(v13, 8);
  }
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  -[_MTLDevice validateDynamicLibraryDescriptor:error:](self, "validateDynamicLibraryDescriptor:error:", a3, a4);
  return 0;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  -[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 0, a4);
  return 0;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  -[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 0, a5);
  return 0;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  -[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:", a3, a4);
  return 0;
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:", a3, a5);
  return 0;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  return -[_MTLBinaryArchive initWithDevice:descriptor:error:]([AGXA10FamilyBinaryArchive alloc], "initWithDevice:descriptor:error:", self, a3, a4);
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  return -[AGXTextureLayout initWithDevice:descriptor:isHeapOrBufferBacked:]([AGXTextureLayout alloc], "initWithDevice:descriptor:isHeapOrBufferBacked:", self, a3, a4);
}

- (id)newDefaultLibrary
{
  AGXATelemetry *p_telemetry;
  unint64_t v3;
  objc_super v5;

  p_telemetry = &self->_telemetry;
  do
    v3 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v3 | 0x1000000000, (unint64_t *)p_telemetry));
  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice newDefaultLibrary](&v5, sel_newDefaultLibrary);
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  AGXATelemetry *p_telemetry;
  unint64_t v5;
  objc_super v7;

  p_telemetry = &self->_telemetry;
  do
    v5 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v5 | 0x2000000000, (unint64_t *)p_telemetry));
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice newLibraryWithFile:error:](&v7, sel_newLibraryWithFile_error_, a3, a4);
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  AGXATelemetry *p_telemetry;
  unint64_t v6;
  objc_super v8;

  p_telemetry = &self->_telemetry;
  do
    v6 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v6 | 0x2000000000, (unint64_t *)p_telemetry));
  v8.receiver = self;
  v8.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice newLibraryWithSource:options:error:](&v8, sel_newLibraryWithSource_options_error_, a3, a4, a5);
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  AGXATelemetry *p_telemetry;
  unint64_t v6;
  objc_super v7;

  p_telemetry = &self->_telemetry;
  do
    v6 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v6 | 0x2000000000, (unint64_t *)p_telemetry));
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyDevice;
  -[_MTLDevice newLibraryWithSource:options:completionHandler:](&v7, sel_newLibraryWithSource_options_completionHandler_, a3, a4, a5);
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  AGXATelemetry *p_telemetry;
  unint64_t v5;
  objc_super v7;

  p_telemetry = &self->_telemetry;
  do
    v5 = __ldaxr((unint64_t *)p_telemetry);
  while (__stlxr(v5 | 0x1000000000, (unint64_t *)p_telemetry));
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice newLibraryWithData:error:](&v7, sel_newLibraryWithData_error_, a3, a4);
}

- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4
{
  dispatch_data_t v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *buffer_ptr;

  v12 = 0;
  buffer_ptr = 0;
  v5 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &v12);
  if (v5)
  {
    v6 = v5;
    v7 = buffer_ptr;
    v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)buffer_ptr);
    objc_msgSend(a4, "setObject:forKey:", v8, *MEMORY[0x24BDDD180]);
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7[1]);
    objc_msgSend(a4, "setObject:forKey:", v9, *MEMORY[0x24BDDD178]);
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7[2]);
    objc_msgSend(a4, "setObject:forKey:", v10, *MEMORY[0x24BDDD1B8]);
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7[3]);
    objc_msgSend(a4, "setObject:forKey:", v11, *MEMORY[0x24BDDD168]);
    dispatch_release(v6);
  }
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  return (a3 & (a3 - 1)) == 0 && a3 != 0 && a3 < 5;
}

- (int)llvmVersion
{
  return 32023;
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x200uLL);
  retstr->var2 = 512;
  return self;
}

- (unint64_t)maxThreadgroupMemoryLength
{
  return 0x4000;
}

- (BOOL)setupCompiler:(int)a3
{
  AGXA10FamilyDevice *v4;
  char *impl;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  std::string::value_type *v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  std::ios_base *v35;
  uint64_t i;
  uint64_t *v37;
  void *v38;
  unsigned __int8 v39;
  NSObject *v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  char *v47;
  const std::string::value_type *v48;
  unsigned __int8 v49;
  NSObject *v50;
  pid_t v51;
  int v52;
  uint64_t v53;
  _BYTE *v54;
  unsigned int v55;
  int v56;
  std::string *p_p;
  std::string::size_type size;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  unsigned __int8 v64;
  NSObject *v65;
  std::string *v66;
  std::string::size_type v67;
  std::string *v68;
  CC_LONG v69;
  std::string *v70;
  std::string::size_type v71;
  NSObject *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  AGXA10FamilyDevice *v93;
  AGXA10FamilyDevice *v94;
  void *v95;
  void *v96;
  id *v97;
  std::string::value_type *v98;
  uint64_t *v99;
  uint64_t v100;
  std::string v101;
  std::string v102;
  std::string v103;
  std::string __p;
  std::string v105;
  CC_SHA256_CTX c;
  _OWORD md[2];
  _QWORD buffer[6];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  _QWORD v115[23];

  v4 = self;
  v115[20] = *MEMORY[0x24BDAC8D0];
  impl = (char *)self->_impl;
  v6 = (void *)MEMORY[0x234928298]();
  *((_DWORD *)impl + 1697) = a3;
  if ((unsigned __int16)(a3 - 4) < 0x18u && ((0xEBF5FDu >> (a3 - 4)) & 1) != 0)
  {
    v7 = qword_232D76068[(unsigned __int16)(a3 - 4)] | qword_232D75FA8[(unsigned __int16)(a3 - 4)];
LABEL_9:
    v11 = HIDWORD(v7);
    if (a3 <= 196615)
    {
      v15 = HIDWORD(v7);
      v14 = HIDWORD(v7);
      v13 = HIDWORD(v7);
      switch(a3)
      {
        case 65542:
          v12 = "g9p";
          break;
        case 65543:
          v12 = "g9g";
          break;
        case 65545:
          v12 = "g11p_a0";
          break;
        case 65546:
          v12 = "g11m_a0";
          break;
        case 65547:
        case 65559:
LABEL_18:
          v12 = "g11p";
          break;
        case 65550:
          v12 = "g13p_a0";
          break;
        case 65552:
          v12 = "g13g_a0";
          break;
        case 65553:
          v12 = "g14p_a0";
          break;
        case 65554:
          v12 = "g14g_a0";
          break;
        case 65555:
          v12 = "g14s_a0";
          break;
        case 65556:
          v12 = "g14c_a0";
          break;
        case 65557:
          v12 = "g14d_a0";
          break;
        case 65560:
          goto LABEL_7;
        case 65561:
        case 65562:
          v12 = "g13s_a0";
          break;
        case 65563:
          v12 = "g13d_a0";
          break;
        case 65567:
          goto LABEL_21;
        case 65568:
          goto LABEL_19;
        case 65570:
          goto LABEL_20;
        default:
          goto LABEL_156;
      }
    }
    else if (a3 > 262174)
    {
      switch(a3)
      {
        case 262175:
LABEL_26:
          v12 = "g16p";
          break;
        case 327684:
          v12 = "g5p";
          break;
        case 327704:
LABEL_16:
          v12 = "g15g";
          break;
        default:
LABEL_156:
          v12 = 0;
          break;
      }
    }
    else
    {
      v10 = HIDWORD(v7);
      v9 = HIDWORD(v7);
      v8 = HIDWORD(v7);
      switch(a3)
      {
        case 196616:
          v12 = "g10p";
          break;
        case 196617:
          goto LABEL_18;
        case 196618:
          v12 = "g11m";
          break;
        case 196620:
          v12 = "g12p";
          break;
        case 196622:
          v12 = "g13p";
          break;
        case 196624:
          v12 = "g13g";
          break;
        case 196625:
          v12 = "g14p";
          break;
        case 196626:
          v12 = "g14g";
          break;
        case 196627:
        case 196628:
          v12 = "g14s";
          break;
        case 196629:
          v12 = "g14d";
          break;
        case 196630:
          goto LABEL_5;
        case 196632:
          goto LABEL_24;
        case 196633:
        case 196634:
          v12 = "g13s";
          break;
        case 196635:
          v12 = "g13d";
          break;
        case 196639:
          goto LABEL_22;
        case 196640:
          goto LABEL_23;
        default:
          goto LABEL_156;
      }
    }
  }
  else
  {
    v7 = 0;
    if (a3 > 196629)
    {
      v8 = 403;
      v9 = 243;
      v10 = 83;
      v11 = 610;
      switch(a3)
      {
        case 196630:
LABEL_5:
          v12 = "g15p";
          goto LABEL_27;
        case 196631:
        case 196633:
        case 196634:
        case 196635:
        case 196636:
        case 196637:
        case 196638:
          goto LABEL_9;
        case 196632:
LABEL_24:
          v12 = "g15g_b0";
          v11 = v10;
          goto LABEL_27;
        case 196639:
LABEL_22:
          v12 = "g16p_b0";
          v11 = v9;
          goto LABEL_27;
        case 196640:
LABEL_23:
          v12 = "g16g";
          v11 = v8;
          goto LABEL_27;
        default:
          if (a3 == 262175)
          {
            v11 = 435;
            goto LABEL_26;
          }
          if (a3 != 327704)
            goto LABEL_9;
          v11 = 275;
          break;
      }
      goto LABEL_16;
    }
    v13 = 323;
    v14 = 259;
    v15 = 227;
    v11 = 67;
    switch(a3)
    {
      case 65560:
LABEL_7:
        v12 = "g15g_a0";
        break;
      case 65567:
LABEL_21:
        v12 = "g16p_a0";
        v11 = v15;
        break;
      case 65568:
LABEL_19:
        v12 = "g16g_a0";
        v11 = v14;
        break;
      case 65570:
LABEL_20:
        v12 = "g17p";
        v11 = v13;
        break;
      default:
        goto LABEL_9;
    }
  }
LABEL_27:
  *((_QWORD *)impl + 845) = v11;
  *((_DWORD *)impl + 1692) = 2;
  *((_QWORD *)impl + 847) = v12;
  *((_WORD *)impl + 3392) = 2;
  *((_WORD *)impl + 3393) = 0;
  if (AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getBundle(void)::pred != -1)
    dispatch_once(&AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getBundle(void)::pred, &__block_literal_global_87);
  v16 = (void *)AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getBundle(void)::bundle;
  v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ds");
  v18 = objc_msgSend(v16, "pathForResource:ofType:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)impl + 847)));
  if (v18)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDDD7D8]), "initWithFilePath:readOnly:deviceInfo:", v18, 1, impl + 6760);
    if (v19)
    {
      v20 = (void *)v19;
      v21 = (std::string::value_type *)operator new[]();
      *(_DWORD *)v21 = 512;
      v22 = (unsigned int *)(v21 + 8);
      v23 = 64;
      v24 = 960;
      do
      {
        v25 = 32 * (((int)v24 + 2337) / (v23 - 32));
        v26 = 32 * (((int)v24 + 2305) / v23);
        if (v25 >= 0x300)
          v27 = 768;
        else
          v27 = 32 * (((int)v24 + 2337) / (v23 - 32));
        if (v26 >= 0x300)
          v28 = 768;
        else
          v28 = 32 * (((int)v24 + 2305) / v23);
        if (v25 >= 0x200)
          v25 = 512;
        if (v26 >= 0x200)
          v26 = 512;
        if (v27 >= 0x200)
          v25 = 512;
        if (v28 >= 0x200)
          v26 = 512;
        *(v22 - 1) = v25;
        *v22 = v26;
        v23 += 64;
        v22 += 2;
        v24 -= 64;
      }
      while (v24);
      v98 = v21;
      v29 = operator new();
      *(_QWORD *)(v29 + 8) = 0;
      v97 = (id *)(v29 + 8);
      *(_QWORD *)(v29 + 16) = 0;
      v99 = (uint64_t *)v29;
      *((_QWORD *)impl + 683) = v29;
      if (!AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::once)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_254235CB4);
        if (!AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::once)
        {
          v93 = v4;
          v95 = v6;
          v30 = MEMORY[0x24BEDB838];
          v31 = MEMORY[0x24BEDB838] + 64;
          v32 = (_QWORD *)MEMORY[0x24BEDB7E0];
          v33 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
          v34 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
          v115[0] = MEMORY[0x24BEDB838] + 64;
          buffer[0] = v33;
          *(_QWORD *)((char *)buffer + *(_QWORD *)(v33 - 24)) = v34;
          buffer[1] = 0;
          v35 = (std::ios_base *)((char *)buffer + *(_QWORD *)(buffer[0] - 24));
          std::ios_base::init(v35, &buffer[2]);
          v35[1].__vftable = 0;
          v35[1].__fmtflags_ = -1;
          buffer[0] = v30 + 24;
          v115[0] = v31;
          MEMORY[0x234927D64](&buffer[2]);
          if (!std::filebuf::open())
            std::ios_base::clear((std::ios_base *)((char *)buffer + *(_QWORD *)(buffer[0] - 24)), *(_DWORD *)((char *)&buffer[4] + *(_QWORD *)(buffer[0] - 24)) | 4);
          if (v114)
          {
            for (i = 0; i != 32; ++i)
            {
              LOWORD(c.count[0]) = 0;
              *(_DWORD *)((char *)&buffer[1] + *(_QWORD *)(buffer[0] - 24)) = *(_DWORD *)((_BYTE *)&buffer[1]
                                                                                          + *(_QWORD *)(buffer[0] - 24)) & 0xFFFFFFB5 | 8;
              MEMORY[0x234927D88](buffer, &c);
              *((_BYTE *)&AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::compiler_uuid
              + i) = c.count[0];
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Could not open: %s\n", "agxa_compiler.mm", 114, "initialize_block_invoke", "/System/Library/PrivateFrameworks/AGXCompilerCore.framework/agxa_compiler_hash");
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              c.count[0] = 136315906;
              *(_QWORD *)&c.count[1] = "agxa_compiler.mm";
              LOWORD(c.hash[1]) = 1024;
              *(CC_LONG *)((char *)&c.hash[1] + 2) = 114;
              HIWORD(c.hash[2]) = 2080;
              *(_QWORD *)&c.hash[3] = "initialize_block_invoke";
              LOWORD(c.hash[5]) = 2080;
              *(_QWORD *)((char *)&c.hash[5] + 2) = "/System/Library/PrivateFrameworks/AGXCompilerCore.framework/agxa_compiler_hash";
              _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Could not open: %s\n", (uint8_t *)&c, 0x26u);
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              c.count[0] = 136315906;
              *(_QWORD *)&c.count[1] = "agxa_compiler.mm";
              LOWORD(c.hash[1]) = 1024;
              *(CC_LONG *)((char *)&c.hash[1] + 2) = 114;
              HIWORD(c.hash[2]) = 2080;
              *(_QWORD *)&c.hash[3] = "initialize_block_invoke";
              LOWORD(c.hash[5]) = 2080;
              *(_QWORD *)((char *)&c.hash[5] + 2) = "/System/Library/PrivateFrameworks/AGXCompilerCore.framework/agxa_compiler_hash";
              _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Could not open: %s\n", (uint8_t *)&c, 0x26u);
            }
            AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::compiler_uuid = mach_absolute_time();
          }
          buffer[0] = *v32;
          *(_QWORD *)((char *)buffer + *(_QWORD *)(buffer[0] - 24)) = v32[3];
          MEMORY[0x234927D70](&buffer[2]);
          std::istream::~istream();
          MEMORY[0x234927E9C](v115);
          AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::once = 1;
          v4 = v93;
          v6 = v95;
          v21 = v98;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_254235CB4);
      }
      memset(md, 0, sizeof(md));
      CC_SHA256_Init(&c);
      v37 = v99;
      CC_SHA256_Update(&c, &AGX::Compiler::initialize(_MTLDevice *,AGCTargetArch,NSBundle *,objc_object  {objcproto16MTLPipelineCache}*,unsigned int *,unsigned int)::compiler_uuid, 0x20u);
      v38 = (void *)objc_msgSend(v16, "resourcePath");
      if (!objc_msgSend(v16, "pathForResource:ofType:", CFSTR("metal_rt"), CFSTR("metallib")))
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** FATAL: metal runtime couldn't be found!!!\n\n", "agxa_compiler.mm", 158, "initialize");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buffer[0]) = 136315650;
          *(_QWORD *)((char *)buffer + 4) = "agxa_compiler.mm";
          WORD2(buffer[1]) = 1024;
          *(_DWORD *)((char *)&buffer[1] + 6) = 158;
          WORD1(buffer[2]) = 2080;
          *(_QWORD *)((char *)&buffer[2] + 4) = "initialize";
          _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** FATAL: metal runtime couldn't be found!!!\n\n", (uint8_t *)buffer, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          LODWORD(buffer[0]) = 136315650;
          *(_QWORD *)((char *)buffer + 4) = "agxa_compiler.mm";
          WORD2(buffer[1]) = 1024;
          *(_DWORD *)((char *)&buffer[1] + 6) = 158;
          WORD1(buffer[2]) = 2080;
          *(_QWORD *)((char *)&buffer[2] + 4) = "initialize";
          _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** FATAL: metal runtime couldn't be found!!!\n\n", (uint8_t *)buffer, 0x1Cu);
        }
        v63 = 0;
        goto LABEL_131;
      }
      *((_BYTE *)&v102.__r_.__value_.__s + 23) = 12;
      v102.__r_.__value_.__r.__words[0] = a3 | 0x7C00000000;
      LODWORD(v102.__r_.__value_.__r.__words[1]) = objc_msgSend(v38, "length");
      v102.__r_.__value_.__s.__data_[12] = 0;
      std::string::append(&v102, v21, 0x7CuLL);
      std::string::append(&v102, (const std::string::value_type *)objc_msgSend(v38, "UTF8String"), objc_msgSend(v38, "length"));
      memset(&v101, 0, sizeof(v101));
      if (MGGetBoolAnswer())
      {
        {
          AGCEnv::getOSLog(void)::log = (uint64_t)os_log_create("com.apple.agx", "AGCEnv");
        }
        v40 = AGCEnv::getOSLog(void)::log;
        if (os_log_type_enabled((os_log_t)AGCEnv::getOSLog(void)::log, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buffer[0]) = 136315138;
          *(_QWORD *)((char *)buffer + 4) = "serialize";
          _os_log_debug_impl(&dword_232C19000, v40, OS_LOG_TYPE_DEBUG, "%s(){\n", (uint8_t *)buffer, 0xCu);
        }
        v94 = v4;
        v96 = v6;
        {
          AGCEnv::getStatusVariables(void)::status_vars = (uint64_t)operator new(0x128uLL);
          v92 = AGCEnv::getStatusVariables(void)::status_vars + 296;
          qword_254235CD0 = AGCEnv::getStatusVariables(void)::status_vars + 296;
          memcpy((void *)AGCEnv::getStatusVariables(void)::status_vars, off_2503FFCB8, 0x128uLL);
          qword_254235CC8 = v92;
          __cxa_atexit((void (*)(void *))std::vector<char const*>::~vector[abi:nn180100], &AGCEnv::getStatusVariables(void)::status_vars, &dword_232C19000);
        }
        strcpy((char *)&v105, "AGC_ENABLE_STATUS_FILE");
        *((_BYTE *)&v105.__r_.__value_.__s + 23) = 22;
        v42 = AGCEnv::getStatusVariables(void)::status_vars;
        v43 = qword_254235CC8;
        if (qword_254235CC8 != AGCEnv::getStatusVariables(void)::status_vars)
        {
          v44 = 0;
          v45 = 0;
          v46 = MEMORY[0x24BDAC740];
          while (1)
          {
            v47 = getenv(*(const char **)(v42 + 8 * v44));
            if (v47)
              break;
LABEL_64:
            v44 = ++v45;
            if (v45 >= (unint64_t)((v43 - v42) >> 3))
              goto LABEL_105;
          }
          v48 = v47;
          {
            AGCEnv::getOSLog(void)::log = (uint64_t)os_log_create("com.apple.agx", "AGCEnv");
          }
          v50 = AGCEnv::getOSLog(void)::log;
          if (os_log_type_enabled((os_log_t)AGCEnv::getOSLog(void)::log, OS_LOG_TYPE_DEBUG))
          {
            v59 = *(_QWORD *)(AGCEnv::getStatusVariables(void)::status_vars + 8 * v44);
            LODWORD(buffer[0]) = 136315394;
            *(_QWORD *)((char *)buffer + 4) = v59;
            WORD2(buffer[1]) = 2080;
            *(_QWORD *)((char *)&buffer[1] + 6) = v48;
            _os_log_debug_impl(&dword_232C19000, v50, OS_LOG_TYPE_DEBUG, "%s = %s\n", (uint8_t *)buffer, 0x16u);
          }
          if (std::string::compare(&v105, *(const std::string::value_type **)(AGCEnv::getStatusVariables(void)::status_vars + 8 * v44)))
          {
LABEL_87:
            std::string::append(&v101, *(const std::string::value_type **)(AGCEnv::getStatusVariables(void)::status_vars + 8 * v44));
            std::string::push_back(&v101, 10);
            std::string::append(&v101, v48);
            std::string::push_back(&v101, 10);
            v42 = AGCEnv::getStatusVariables(void)::status_vars;
            v43 = qword_254235CC8;
            goto LABEL_64;
          }
          std::string::append(&v101, "AGC_CLIENT_PROCESS_NAME");
          std::string::push_back(&v101, 10);
          *((_BYTE *)&v103.__r_.__value_.__s + 23) = 11;
          strcpy((char *)&v103, "agc_status_");
          v51 = getpid();
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          v109 = 0u;
          memset(buffer, 0, sizeof(buffer));
          v52 = proc_name(v51, buffer, 0x80u);
          if (v52)
          {
            v53 = v52;
            v54 = buffer;
            do
            {
              v55 = (char)*v54;
              if ((v55 & 0x80000000) != 0)
                v56 = __maskrune(v55, 0x500uLL);
              else
                v56 = *(_DWORD *)(v46 + 4 * v55 + 60) & 0x500;
              if (!v56)
                *v54 = 95;
              ++v54;
              --v53;
            }
            while (v53);
          }
          std::string::append(&v103, (const std::string::value_type *)buffer);
          __p = v103;
          memset(&v103, 0, sizeof(v103));
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            size = __p.__r_.__value_.__l.__size_;
          std::string::append(&v101, (const std::string::value_type *)p_p, size);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v103.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_86;
          }
          else if ((SHIBYTE(v103.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_86:
            std::string::push_back(&v101, 10);
            goto LABEL_87;
          }
          operator delete(v103.__r_.__value_.__l.__data_);
          goto LABEL_86;
        }
LABEL_105:
        {
          AGCEnv::getOSLog(void)::log = (uint64_t)os_log_create("com.apple.agx", "AGCEnv");
        }
        v65 = AGCEnv::getOSLog(void)::log;
        v4 = v94;
        v6 = v96;
        v21 = v98;
        v37 = v99;
        if (!os_log_type_enabled((os_log_t)AGCEnv::getOSLog(void)::log, OS_LOG_TYPE_DEBUG))
        {
          if ((SHIBYTE(v105.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_109;
          goto LABEL_108;
        }
        LOWORD(buffer[0]) = 0;
        _os_log_debug_impl(&dword_232C19000, v65, OS_LOG_TYPE_DEBUG, "}\n", (uint8_t *)buffer, 2u);
        if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
LABEL_108:
          operator delete(v105.__r_.__value_.__l.__data_);
      }
LABEL_109:
      if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v66 = &v101;
      else
        v66 = (std::string *)v101.__r_.__value_.__r.__words[0];
      if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v67 = HIBYTE(v101.__r_.__value_.__r.__words[2]);
      else
        v67 = v101.__r_.__value_.__l.__size_;
      std::string::append(&v102, (const std::string::value_type *)v66, v67);
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v101.__r_.__value_.__l.__data_);
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v68 = &v102;
      else
        v68 = (std::string *)v102.__r_.__value_.__r.__words[0];
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v69 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
      else
        v69 = v102.__r_.__value_.__r.__words[1];
      CC_SHA256_Update(&c, v68, v69);
      CC_SHA256_Final((unsigned __int8 *)md, &c);
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v70 = &v102;
      else
        v70 = (std::string *)v102.__r_.__value_.__r.__words[0];
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v71 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
      else
        v71 = v102.__r_.__value_.__l.__size_;
      v72 = dispatch_data_create(v70, v71, 0, 0);
      v73 = objc_msgSend(objc_alloc(MEMORY[0x24BDDD538]), "initWithTargetData:cacheUUID:pluginPath:device:compilerFlags:", v72, md, CFSTR("/System/Library/PrivateFrameworks/AGXCompilerCore.framework/AGXCompilerCore"), v4, 540);
      *v37 = v73;
      v63 = v73 != 0;
      dispatch_release(v72);
      *v97 = v20;
      if (v73)
      {
        if ((SHIBYTE(v102.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_131:

          if (v63)
          {
            v74 = (_QWORD *)operator new();
            v75 = *((_QWORD *)impl + 875);
            *v74 = *((_QWORD *)impl + 683);
            v74[1] = v75;
            v74[2] = dispatch_queue_create("com.apple.Metal.PipelineFunctionObjects", 0);
            *((_QWORD *)impl + 684) = v74;
            *((_QWORD *)impl + 685) = operator new();
            v100 = *((_QWORD *)impl + 561);
            v76 = operator new();
            *(_QWORD *)(v76 + 448) = v4;
            v77 = (_QWORD *)operator new();
            bzero(v77, 0x3E0uLL);
            *((_DWORD *)v77 + 2) = 43;
            v77[3] = 0;
            v77[4] = 0;
            v77[2] = 0;
            *((_DWORD *)v77 + 10) = 0;
            *v77 = off_250400B38;
            *((_DWORD *)v77 + 14) = 43;
            v77[9] = 0;
            v77[10] = 0;
            v77[8] = 0;
            *((_DWORD *)v77 + 22) = 0;
            v77[6] = off_250400B38;
            *((_DWORD *)v77 + 26) = 43;
            v77[15] = 0;
            v77[16] = 0;
            v77[14] = 0;
            *((_DWORD *)v77 + 34) = 0;
            v77[12] = off_250400B38;
            *((_DWORD *)v77 + 38) = 43;
            v77[20] = 0;
            v77[21] = 0;
            *((_DWORD *)v77 + 46) = 0;
            v77[22] = 0;
            v77[18] = off_250400B38;
            *(_OWORD *)((char *)v77 + 218) = 0u;
            *((_OWORD *)v77 + 13) = 0u;
            *((_OWORD *)v77 + 12) = 0u;
            *((_OWORD *)v77 + 15) = 0u;
            *((_OWORD *)v77 + 16) = 0u;
            *(_OWORD *)((char *)v77 + 266) = 0u;
            *((_OWORD *)v77 + 18) = 0u;
            *((_OWORD *)v77 + 19) = 0u;
            *(_OWORD *)((char *)v77 + 314) = 0u;
            *((_OWORD *)v77 + 21) = 0u;
            *((_OWORD *)v77 + 22) = 0u;
            *(_OWORD *)((char *)v77 + 362) = 0u;
            v77[49] = v77;
            *(_OWORD *)((char *)v77 + 434) = 0u;
            *(_OWORD *)(v77 + 51) = 0u;
            *(_OWORD *)(v77 + 53) = 0u;
            *(_OWORD *)(v77 + 81) = 0u;
            *(_OWORD *)(v77 + 83) = 0u;
            *(_OWORD *)(v77 + 77) = 0u;
            *(_OWORD *)(v77 + 79) = 0u;
            *(_OWORD *)(v77 + 73) = 0u;
            *(_OWORD *)(v77 + 75) = 0u;
            *(_OWORD *)(v77 + 69) = 0u;
            *(_OWORD *)(v77 + 71) = 0u;
            *(_OWORD *)(v77 + 65) = 0u;
            *(_OWORD *)(v77 + 67) = 0u;
            *(_OWORD *)(v77 + 61) = 0u;
            *(_OWORD *)(v77 + 63) = 0u;
            *(_OWORD *)(v77 + 57) = 0u;
            *(_OWORD *)(v77 + 59) = 0u;
            v77[86] = v77 + 57;
            v77[89] = 0;
            v77[88] = 0;
            *((_DWORD *)v77 + 182) = 0;
            v77[90] = 0;
            *(_OWORD *)((char *)v77 + 969) = 0u;
            *((_OWORD *)v77 + 59) = 0u;
            *((_OWORD *)v77 + 60) = 0u;
            *((_OWORD *)v77 + 57) = 0u;
            *((_OWORD *)v77 + 58) = 0u;
            *((_OWORD *)v77 + 55) = 0u;
            *((_OWORD *)v77 + 56) = 0u;
            *((_OWORD *)v77 + 53) = 0u;
            *((_OWORD *)v77 + 54) = 0u;
            *((_OWORD *)v77 + 51) = 0u;
            *((_OWORD *)v77 + 52) = 0u;
            *((_OWORD *)v77 + 49) = 0u;
            *((_OWORD *)v77 + 50) = 0u;
            *((_OWORD *)v77 + 47) = 0u;
            *((_OWORD *)v77 + 48) = 0u;
            *((_OWORD *)v77 + 46) = 0u;
            *(_QWORD *)v76 = v77;
            v78 = (_QWORD *)operator new();
            bzero(v78, 0x3E0uLL);
            *((_DWORD *)v78 + 2) = 46;
            v78[3] = 0;
            v78[4] = 0;
            v78[2] = 0;
            *((_DWORD *)v78 + 10) = 0;
            *v78 = off_250400B78;
            *((_DWORD *)v78 + 14) = 46;
            v78[9] = 0;
            v78[10] = 0;
            v78[8] = 0;
            *((_DWORD *)v78 + 22) = 0;
            v78[6] = off_250400B78;
            *((_DWORD *)v78 + 26) = 46;
            v78[15] = 0;
            v78[16] = 0;
            v78[14] = 0;
            *((_DWORD *)v78 + 34) = 0;
            v78[12] = off_250400B78;
            *((_DWORD *)v78 + 38) = 46;
            v78[20] = 0;
            v78[21] = 0;
            *((_DWORD *)v78 + 46) = 0;
            v78[22] = 0;
            v78[18] = off_250400B78;
            *(_OWORD *)((char *)v78 + 218) = 0u;
            *((_OWORD *)v78 + 13) = 0u;
            *((_OWORD *)v78 + 12) = 0u;
            *((_OWORD *)v78 + 15) = 0u;
            *((_OWORD *)v78 + 16) = 0u;
            *(_OWORD *)((char *)v78 + 266) = 0u;
            *((_OWORD *)v78 + 18) = 0u;
            *((_OWORD *)v78 + 19) = 0u;
            *(_OWORD *)((char *)v78 + 314) = 0u;
            *((_OWORD *)v78 + 21) = 0u;
            *((_OWORD *)v78 + 22) = 0u;
            *(_OWORD *)((char *)v78 + 362) = 0u;
            v78[49] = v78;
            *(_OWORD *)((char *)v78 + 434) = 0u;
            *(_OWORD *)(v78 + 51) = 0u;
            *(_OWORD *)(v78 + 53) = 0u;
            *(_OWORD *)(v78 + 81) = 0u;
            *(_OWORD *)(v78 + 83) = 0u;
            *(_OWORD *)(v78 + 77) = 0u;
            *(_OWORD *)(v78 + 79) = 0u;
            *(_OWORD *)(v78 + 73) = 0u;
            *(_OWORD *)(v78 + 75) = 0u;
            *(_OWORD *)(v78 + 69) = 0u;
            *(_OWORD *)(v78 + 71) = 0u;
            *(_OWORD *)(v78 + 65) = 0u;
            *(_OWORD *)(v78 + 67) = 0u;
            *(_OWORD *)(v78 + 61) = 0u;
            *(_OWORD *)(v78 + 63) = 0u;
            *(_OWORD *)(v78 + 57) = 0u;
            *(_OWORD *)(v78 + 59) = 0u;
            v78[86] = v78 + 57;
            v78[89] = 0;
            v78[88] = 0;
            *((_DWORD *)v78 + 182) = 0;
            v78[90] = 0;
            *(_OWORD *)((char *)v78 + 969) = 0u;
            *((_OWORD *)v78 + 59) = 0u;
            *((_OWORD *)v78 + 60) = 0u;
            *((_OWORD *)v78 + 57) = 0u;
            *((_OWORD *)v78 + 58) = 0u;
            *((_OWORD *)v78 + 55) = 0u;
            *((_OWORD *)v78 + 56) = 0u;
            *((_OWORD *)v78 + 53) = 0u;
            *((_OWORD *)v78 + 54) = 0u;
            *((_OWORD *)v78 + 51) = 0u;
            *((_OWORD *)v78 + 52) = 0u;
            *((_OWORD *)v78 + 49) = 0u;
            *((_OWORD *)v78 + 50) = 0u;
            *((_OWORD *)v78 + 47) = 0u;
            *((_OWORD *)v78 + 48) = 0u;
            *((_OWORD *)v78 + 46) = 0u;
            *(_QWORD *)(v76 + 16) = v78;
            v79 = (_QWORD *)operator new();
            bzero(v79, 0x3E0uLL);
            *((_DWORD *)v79 + 2) = 44;
            v79[3] = 0;
            v79[4] = 0;
            v79[2] = 0;
            *((_DWORD *)v79 + 10) = 0;
            *v79 = off_250400BB8;
            *((_DWORD *)v79 + 14) = 44;
            v79[9] = 0;
            v79[10] = 0;
            v79[8] = 0;
            *((_DWORD *)v79 + 22) = 0;
            v79[6] = off_250400BB8;
            *((_DWORD *)v79 + 26) = 44;
            v79[15] = 0;
            v79[16] = 0;
            v79[14] = 0;
            *((_DWORD *)v79 + 34) = 0;
            v79[12] = off_250400BB8;
            *((_DWORD *)v79 + 38) = 44;
            v79[20] = 0;
            v79[21] = 0;
            *((_DWORD *)v79 + 46) = 0;
            v79[22] = 0;
            v79[18] = off_250400BB8;
            *(_OWORD *)((char *)v79 + 218) = 0u;
            *((_OWORD *)v79 + 13) = 0u;
            *((_OWORD *)v79 + 12) = 0u;
            *((_OWORD *)v79 + 15) = 0u;
            *((_OWORD *)v79 + 16) = 0u;
            *(_OWORD *)((char *)v79 + 266) = 0u;
            *((_OWORD *)v79 + 18) = 0u;
            *((_OWORD *)v79 + 19) = 0u;
            *(_OWORD *)((char *)v79 + 314) = 0u;
            *((_OWORD *)v79 + 21) = 0u;
            *((_OWORD *)v79 + 22) = 0u;
            *(_OWORD *)((char *)v79 + 362) = 0u;
            v79[49] = v79;
            *(_OWORD *)((char *)v79 + 434) = 0u;
            *(_OWORD *)(v79 + 51) = 0u;
            *(_OWORD *)(v79 + 53) = 0u;
            *(_OWORD *)(v79 + 81) = 0u;
            *(_OWORD *)(v79 + 83) = 0u;
            *(_OWORD *)(v79 + 77) = 0u;
            *(_OWORD *)(v79 + 79) = 0u;
            *(_OWORD *)(v79 + 73) = 0u;
            *(_OWORD *)(v79 + 75) = 0u;
            *(_OWORD *)(v79 + 69) = 0u;
            *(_OWORD *)(v79 + 71) = 0u;
            *(_OWORD *)(v79 + 65) = 0u;
            *(_OWORD *)(v79 + 67) = 0u;
            *(_OWORD *)(v79 + 61) = 0u;
            *(_OWORD *)(v79 + 63) = 0u;
            *(_OWORD *)(v79 + 57) = 0u;
            *(_OWORD *)(v79 + 59) = 0u;
            v79[86] = v79 + 57;
            v79[89] = 0;
            v79[88] = 0;
            *((_DWORD *)v79 + 182) = 0;
            v79[90] = 0;
            *(_OWORD *)((char *)v79 + 969) = 0u;
            *((_OWORD *)v79 + 59) = 0u;
            *((_OWORD *)v79 + 60) = 0u;
            *((_OWORD *)v79 + 57) = 0u;
            *((_OWORD *)v79 + 58) = 0u;
            *((_OWORD *)v79 + 55) = 0u;
            *((_OWORD *)v79 + 56) = 0u;
            *((_OWORD *)v79 + 53) = 0u;
            *((_OWORD *)v79 + 54) = 0u;
            *((_OWORD *)v79 + 51) = 0u;
            *((_OWORD *)v79 + 52) = 0u;
            *((_OWORD *)v79 + 49) = 0u;
            *((_OWORD *)v79 + 50) = 0u;
            *((_OWORD *)v79 + 47) = 0u;
            *((_OWORD *)v79 + 48) = 0u;
            *((_OWORD *)v79 + 46) = 0u;
            *(_QWORD *)(v76 + 8) = v79;
            v80 = operator new();
            bzero((void *)v80, 0x8B0uLL);
            *(_QWORD *)(v80 + 792) = 0x3F80000000000001;
            *(_QWORD *)(v80 + 800) = 0x1FFFFFFFFLL;
            *(_OWORD *)(v80 + 812) = xmmword_232D73520;
            *(_DWORD *)(v80 + 852) = 0;
            *(_QWORD *)(v80 + 828) = 0;
            *(_DWORD *)(v80 + 835) = 0;
            *(_OWORD *)(v80 + 856) = xmmword_232D73530;
            *(_QWORD *)(v80 + 872) = 3840;
            *(_QWORD *)(v80 + 880) = 0x1E3CE50800210000;
            *(_DWORD *)(v80 + 888) = 1184;
            *(_OWORD *)(v80 + 1000) = 0u;
            *(_OWORD *)(v80 + 1016) = 0u;
            *(_OWORD *)(v80 + 1032) = 0u;
            *(_QWORD *)(v80 + 1144) = 0;
            *(_QWORD *)(v80 + 1136) = 0;
            *(_BYTE *)(v80 + 1152) = 0;
            *(_OWORD *)(v80 + 1160) = 0u;
            *(_OWORD *)(v80 + 1176) = 0u;
            *(_OWORD *)(v80 + 1192) = 0u;
            *(_OWORD *)(v80 + 1205) = 0u;
            *(_QWORD *)(v80 + 1232) = 0;
            *(_QWORD *)(v80 + 1224) = 0;
            *(_BYTE *)(v80 + 1240) = 0;
            *(_OWORD *)(v80 + 1248) = 0u;
            *(_OWORD *)(v80 + 1264) = 0u;
            *(_OWORD *)(v80 + 1280) = 0u;
            *(_OWORD *)(v80 + 1293) = 0u;
            *(_QWORD *)(v80 + 1312) = 0;
            *(_QWORD *)(v80 + 1320) = 0;
            *(_BYTE *)(v80 + 1328) = 0;
            *(_OWORD *)(v80 + 1336) = 0u;
            *(_OWORD *)(v80 + 1352) = 0u;
            *(_OWORD *)(v80 + 1368) = 0u;
            *(_OWORD *)(v80 + 1381) = 0u;
            *(_QWORD *)(v80 + 1400) = 0;
            *(_QWORD *)(v80 + 1408) = 0;
            *(_BYTE *)(v80 + 1416) = 0;
            *(_OWORD *)(v80 + 1424) = 0u;
            *(_OWORD *)(v80 + 1440) = 0u;
            *(_OWORD *)(v80 + 1456) = 0u;
            *(_OWORD *)(v80 + 1469) = 0u;
            *(_QWORD *)(v80 + 1496) = 0;
            *(_QWORD *)(v80 + 1488) = 0;
            *(_BYTE *)(v80 + 1504) = 0;
            *(_DWORD *)(v80 + 992) = 0;
            *(_OWORD *)(v80 + 960) = 0u;
            *(_OWORD *)(v80 + 976) = 0u;
            *(_OWORD *)(v80 + 928) = 0u;
            *(_OWORD *)(v80 + 944) = 0u;
            *(_OWORD *)(v80 + 896) = 0u;
            *(_OWORD *)(v80 + 912) = 0u;
            *(_QWORD *)(v80 + 1125) = 0;
            *(_OWORD *)(v80 + 1096) = 0u;
            *(_OWORD *)(v80 + 1112) = 0u;
            *(_OWORD *)(v80 + 1064) = 0u;
            *(_OWORD *)(v80 + 1080) = 0u;
            *(_QWORD *)(v80 + 1656) = 0;
            *(_OWORD *)(v80 + 1624) = 0u;
            *(_OWORD *)(v80 + 1640) = 0u;
            *(_OWORD *)(v80 + 1592) = 0u;
            *(_OWORD *)(v80 + 1608) = 0u;
            *(_OWORD *)(v80 + 1560) = 0u;
            *(_OWORD *)(v80 + 1576) = 0u;
            *(_OWORD *)(v80 + 1528) = 0u;
            *(_OWORD *)(v80 + 1544) = 0u;
            *(_OWORD *)(v80 + 1512) = 0u;
            *(_DWORD *)(v80 + 1664) = 1065353216;
            *(_OWORD *)(v80 + 1688) = 0u;
            *(_OWORD *)(v80 + 1672) = 0u;
            *(_DWORD *)(v80 + 1704) = 1065353216;
            *(_OWORD *)(v80 + 1728) = 0u;
            *(_OWORD *)(v80 + 1712) = 0u;
            *(_DWORD *)(v80 + 1744) = 1065353216;
            *(_OWORD *)(v80 + 1768) = 0u;
            *(_OWORD *)(v80 + 1752) = 0u;
            *(_DWORD *)(v80 + 1784) = 1065353216;
            *(_OWORD *)(v80 + 1808) = 0u;
            *(_OWORD *)(v80 + 1792) = 0u;
            *(_DWORD *)(v80 + 1824) = 1065353216;
            *(_OWORD *)(v80 + 1832) = 0u;
            *(_OWORD *)(v80 + 1848) = 0u;
            *(_DWORD *)(v80 + 1864) = 1065353216;
            *(_QWORD *)(v80 + 1904) = 0;
            *(_OWORD *)(v80 + 1888) = 0u;
            *(_OWORD *)(v80 + 1872) = 0u;
            *(_DWORD *)(v80 + 1912) = 1065353216;
            *(_OWORD *)(v80 + 2184) = 0u;
            *(_OWORD *)(v80 + 2200) = 0u;
            *(_OWORD *)(v80 + 2152) = 0u;
            *(_OWORD *)(v80 + 2168) = 0u;
            *(_OWORD *)(v80 + 2120) = 0u;
            *(_OWORD *)(v80 + 2136) = 0u;
            *(_OWORD *)(v80 + 2088) = 0u;
            *(_OWORD *)(v80 + 2104) = 0u;
            *(_OWORD *)(v80 + 2056) = 0u;
            *(_OWORD *)(v80 + 2072) = 0u;
            *(_OWORD *)(v80 + 2024) = 0u;
            *(_OWORD *)(v80 + 2040) = 0u;
            *(_OWORD *)(v80 + 1992) = 0u;
            *(_OWORD *)(v80 + 2008) = 0u;
            *(_OWORD *)(v80 + 1960) = 0u;
            *(_OWORD *)(v80 + 1976) = 0u;
            *(_OWORD *)(v80 + 1928) = 0u;
            *(_OWORD *)(v80 + 1944) = 0u;
            *(_QWORD *)(v76 + 24) = v80;
            *(_BYTE *)(v80 + 808) = 0;
            v81 = operator new();
            bzero((void *)v81, 0x8B0uLL);
            *(_QWORD *)(v81 + 792) = 0x3F80000000000001;
            *(_QWORD *)(v81 + 800) = 0x1FFFFFFFFLL;
            *(_OWORD *)(v81 + 812) = xmmword_232D73520;
            *(_DWORD *)(v81 + 852) = 0;
            *(_QWORD *)(v81 + 828) = 0;
            *(_DWORD *)(v81 + 835) = 0;
            *(_OWORD *)(v81 + 856) = xmmword_232D73530;
            *(_QWORD *)(v81 + 872) = 3840;
            *(_QWORD *)(v81 + 880) = 0x1E3CE50800210000;
            *(_DWORD *)(v81 + 888) = 1184;
            *(_OWORD *)(v81 + 1000) = 0u;
            *(_OWORD *)(v81 + 1016) = 0u;
            *(_OWORD *)(v81 + 1032) = 0u;
            *(_QWORD *)(v81 + 1144) = 0;
            *(_QWORD *)(v81 + 1136) = 0;
            *(_BYTE *)(v81 + 1152) = 0;
            *(_OWORD *)(v81 + 1160) = 0u;
            *(_OWORD *)(v81 + 1176) = 0u;
            *(_OWORD *)(v81 + 1192) = 0u;
            *(_OWORD *)(v81 + 1205) = 0u;
            *(_QWORD *)(v81 + 1232) = 0;
            *(_QWORD *)(v81 + 1224) = 0;
            *(_BYTE *)(v81 + 1240) = 0;
            *(_OWORD *)(v81 + 1248) = 0u;
            *(_OWORD *)(v81 + 1264) = 0u;
            *(_OWORD *)(v81 + 1280) = 0u;
            *(_OWORD *)(v81 + 1293) = 0u;
            *(_QWORD *)(v81 + 1312) = 0;
            *(_QWORD *)(v81 + 1320) = 0;
            *(_BYTE *)(v81 + 1328) = 0;
            *(_OWORD *)(v81 + 1336) = 0u;
            *(_OWORD *)(v81 + 1352) = 0u;
            *(_OWORD *)(v81 + 1368) = 0u;
            *(_OWORD *)(v81 + 1381) = 0u;
            *(_QWORD *)(v81 + 1400) = 0;
            *(_QWORD *)(v81 + 1408) = 0;
            *(_BYTE *)(v81 + 1416) = 0;
            *(_OWORD *)(v81 + 1424) = 0u;
            *(_OWORD *)(v81 + 1440) = 0u;
            *(_OWORD *)(v81 + 1456) = 0u;
            *(_OWORD *)(v81 + 1469) = 0u;
            *(_QWORD *)(v81 + 1496) = 0;
            *(_QWORD *)(v81 + 1488) = 0;
            *(_BYTE *)(v81 + 1504) = 0;
            *(_DWORD *)(v81 + 992) = 0;
            *(_OWORD *)(v81 + 960) = 0u;
            *(_OWORD *)(v81 + 976) = 0u;
            *(_OWORD *)(v81 + 928) = 0u;
            *(_OWORD *)(v81 + 944) = 0u;
            *(_OWORD *)(v81 + 896) = 0u;
            *(_OWORD *)(v81 + 912) = 0u;
            *(_QWORD *)(v81 + 1125) = 0;
            *(_OWORD *)(v81 + 1096) = 0u;
            *(_OWORD *)(v81 + 1112) = 0u;
            *(_OWORD *)(v81 + 1064) = 0u;
            *(_OWORD *)(v81 + 1080) = 0u;
            *(_QWORD *)(v81 + 1656) = 0;
            *(_OWORD *)(v81 + 1624) = 0u;
            *(_OWORD *)(v81 + 1640) = 0u;
            *(_OWORD *)(v81 + 1592) = 0u;
            *(_OWORD *)(v81 + 1608) = 0u;
            *(_OWORD *)(v81 + 1560) = 0u;
            *(_OWORD *)(v81 + 1576) = 0u;
            *(_OWORD *)(v81 + 1528) = 0u;
            *(_OWORD *)(v81 + 1544) = 0u;
            *(_OWORD *)(v81 + 1512) = 0u;
            *(_DWORD *)(v81 + 1664) = 1065353216;
            *(_OWORD *)(v81 + 1688) = 0u;
            *(_OWORD *)(v81 + 1672) = 0u;
            *(_DWORD *)(v81 + 1704) = 1065353216;
            *(_OWORD *)(v81 + 1728) = 0u;
            *(_OWORD *)(v81 + 1712) = 0u;
            *(_DWORD *)(v81 + 1744) = 1065353216;
            *(_OWORD *)(v81 + 1768) = 0u;
            *(_OWORD *)(v81 + 1752) = 0u;
            *(_DWORD *)(v81 + 1784) = 1065353216;
            *(_OWORD *)(v81 + 1808) = 0u;
            *(_OWORD *)(v81 + 1792) = 0u;
            *(_DWORD *)(v81 + 1824) = 1065353216;
            *(_OWORD *)(v81 + 1832) = 0u;
            *(_OWORD *)(v81 + 1848) = 0u;
            *(_DWORD *)(v81 + 1864) = 1065353216;
            *(_QWORD *)(v81 + 1904) = 0;
            *(_OWORD *)(v81 + 1888) = 0u;
            *(_OWORD *)(v81 + 1872) = 0u;
            *(_DWORD *)(v81 + 1912) = 1065353216;
            *(_OWORD *)(v81 + 2184) = 0u;
            *(_OWORD *)(v81 + 2200) = 0u;
            *(_OWORD *)(v81 + 2152) = 0u;
            *(_OWORD *)(v81 + 2168) = 0u;
            *(_OWORD *)(v81 + 2120) = 0u;
            *(_OWORD *)(v81 + 2136) = 0u;
            *(_OWORD *)(v81 + 2088) = 0u;
            *(_OWORD *)(v81 + 2104) = 0u;
            *(_OWORD *)(v81 + 2056) = 0u;
            *(_OWORD *)(v81 + 2072) = 0u;
            *(_OWORD *)(v81 + 2024) = 0u;
            *(_OWORD *)(v81 + 2040) = 0u;
            *(_OWORD *)(v81 + 1992) = 0u;
            *(_OWORD *)(v81 + 2008) = 0u;
            *(_OWORD *)(v81 + 1960) = 0u;
            *(_OWORD *)(v81 + 1976) = 0u;
            *(_OWORD *)(v81 + 1928) = 0u;
            *(_OWORD *)(v81 + 1944) = 0u;
            *(_OWORD *)(v76 + 40) = 0u;
            *(_QWORD *)(v76 + 32) = v81;
            *(_BYTE *)(v81 + 808) = 0;
            *(_OWORD *)(v76 + 56) = 0u;
            *(_OWORD *)(v76 + 72) = 0u;
            *(_OWORD *)(v76 + 88) = 0u;
            *(_OWORD *)(v76 + 104) = 0u;
            *(_OWORD *)(v76 + 120) = 0u;
            *(_OWORD *)(v76 + 136) = 0u;
            *(_OWORD *)(v76 + 152) = 0u;
            *(_OWORD *)(v76 + 168) = 0u;
            *(_OWORD *)(v76 + 184) = 0u;
            *(_OWORD *)(v76 + 200) = 0u;
            *(_OWORD *)(v76 + 216) = 0u;
            *(_OWORD *)(v76 + 232) = 0u;
            *(_OWORD *)(v76 + 248) = 0u;
            *(_OWORD *)(v76 + 264) = 0u;
            *(_OWORD *)(v76 + 280) = 0u;
            *(_OWORD *)(v76 + 296) = 0u;
            *(_OWORD *)(v76 + 312) = 0u;
            *(_OWORD *)(v76 + 328) = 0u;
            *(_OWORD *)(v76 + 344) = 0u;
            *(_OWORD *)(v76 + 360) = 0u;
            *(_OWORD *)(v76 + 376) = 0u;
            *(_OWORD *)(v76 + 392) = 0u;
            *(_OWORD *)(v76 + 408) = 0u;
            v82 = operator new();
            *(_QWORD *)v82 = v4;
            *(_QWORD *)(v82 + 8) = 0;
            *(_QWORD *)(v82 + 16) = v100;
            *(_OWORD *)(v82 + 24) = 0u;
            *(_OWORD *)(v82 + 40) = 0u;
            *(_QWORD *)(v76 + 424) = v82;
            v83 = operator new();
            v60 = 0;
            *(_QWORD *)v83 = v4;
            *(_QWORD *)(v83 + 8) = 0;
            v21 = v98;
            *(_QWORD *)(v83 + 16) = v100;
            *(_OWORD *)(v83 + 24) = 0u;
            *(_OWORD *)(v83 + 40) = 0u;
            *(_QWORD *)(v76 + 432) = v83;
            *((_QWORD *)impl + 773) = v76;
          }
          else
          {
            v84 = *((_QWORD *)impl + 773);
            if (v84)
            {
              v85 = AGX::DeviceSWTessellationState<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~DeviceSWTessellationState(v84);
              MEMORY[0x234927ECC](v85, 0xA0C40088E2AA8);
            }
            v86 = *((_QWORD *)impl + 685);
            if (v86)
              MEMORY[0x234927ECC](v86, 0xC400A2AC0F1);
            *((_QWORD *)impl + 685) = 0;
            v87 = *((_QWORD *)impl + 684);
            if (v87)
            {
              dispatch_release(*(dispatch_object_t *)(v87 + 16));
              MEMORY[0x234927ECC](v87, 0x10A0C4025E0BC92);
            }
            *((_QWORD *)impl + 684) = 0;
            v88 = (id *)*((_QWORD *)impl + 683);
            if (v88)
            {

              *v88 = 0;
              v88[1] = 0;

              v88[2] = 0;
              MEMORY[0x234927ECC](v88, 0x80C40D6874129);
            }
            *((_QWORD *)impl + 683) = 0;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Compiler setup failed.\n", "agxa_device_template.hpp", 1233, "setupCompiler");
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buffer[0]) = 136315650;
              *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
              WORD2(buffer[1]) = 1024;
              *(_DWORD *)((char *)&buffer[1] + 6) = 1233;
              WORD1(buffer[2]) = 2080;
              *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
              _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Compiler setup failed.\n", (uint8_t *)buffer, 0x1Cu);
            }
            v60 = 1;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              LODWORD(buffer[0]) = 136315650;
              *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
              WORD2(buffer[1]) = 1024;
              *(_DWORD *)((char *)&buffer[1] + 6) = 1233;
              WORD1(buffer[2]) = 2080;
              *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
              _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Compiler setup failed.\n", (uint8_t *)buffer, 0x1Cu);
            }
          }
          MEMORY[0x234927EB4](v21, 0x1000C8052888210);
          goto LABEL_146;
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Compiler initialization failed\n", "agxa_compiler.mm", 197, "initialize");
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buffer[0]) = 136315650;
          *(_QWORD *)((char *)buffer + 4) = "agxa_compiler.mm";
          WORD2(buffer[1]) = 1024;
          *(_DWORD *)((char *)&buffer[1] + 6) = 197;
          WORD1(buffer[2]) = 2080;
          *(_QWORD *)((char *)&buffer[2] + 4) = "initialize";
          _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Compiler initialization failed\n", (uint8_t *)buffer, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          LODWORD(buffer[0]) = 136315650;
          *(_QWORD *)((char *)buffer + 4) = "agxa_compiler.mm";
          WORD2(buffer[1]) = 1024;
          *(_DWORD *)((char *)&buffer[1] + 6) = 197;
          WORD1(buffer[2]) = 2080;
          *(_QWORD *)((char *)&buffer[2] + 4) = "initialize";
          _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Compiler initialization failed\n", (uint8_t *)buffer, 0x1Cu);
        }

        v99[1] = 0;
        *v99 = 0;
        if ((SHIBYTE(v102.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_131;
      }
      operator delete(v102.__r_.__value_.__l.__data_);
      goto LABEL_131;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", "agxa_device_template.hpp", 1193, "setupCompiler");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buffer[0]) = 136315650;
      *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
      WORD2(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 6) = 1193;
      WORD1(buffer[2]) = 2080;
      *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
      _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", (uint8_t *)buffer, 0x1Cu);
    }
    v60 = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LODWORD(buffer[0]) = 136315650;
      *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
      WORD2(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 6) = 1193;
      WORD1(buffer[2]) = 2080;
      *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
      _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", (uint8_t *)buffer, 0x1Cu);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", "agxa_device_template.hpp", 1183, "setupCompiler", (const char *)objc_msgSend((id)objc_msgSend(v16, "bundlePath"), "UTF8String"), *((const char **)impl + 847));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v90 = objc_msgSend((id)objc_msgSend(v16, "bundlePath"), "UTF8String");
      v91 = *((_QWORD *)impl + 847);
      LODWORD(buffer[0]) = 136316162;
      *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
      WORD2(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 6) = 1183;
      WORD1(buffer[2]) = 2080;
      *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
      WORD2(buffer[3]) = 2080;
      *(_QWORD *)((char *)&buffer[3] + 6) = v90;
      HIWORD(buffer[4]) = 2080;
      buffer[5] = v91;
      _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", (uint8_t *)buffer, 0x30u);
    }
    v60 = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v61 = objc_msgSend((id)objc_msgSend(v16, "bundlePath"), "UTF8String");
      v62 = *((_QWORD *)impl + 847);
      LODWORD(buffer[0]) = 136316162;
      *(_QWORD *)((char *)buffer + 4) = "agxa_device_template.hpp";
      WORD2(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 6) = 1183;
      WORD1(buffer[2]) = 2080;
      *(_QWORD *)((char *)&buffer[2] + 4) = "setupCompiler";
      WORD2(buffer[3]) = 2080;
      *(_QWORD *)((char *)&buffer[3] + 6) = v61;
      HIWORD(buffer[4]) = 2080;
      buffer[5] = v62;
      _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", (uint8_t *)buffer, 0x30u);
    }
  }
LABEL_146:
  objc_autoreleasePoolPop(v6);
  return v60 == 0;
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return -[AGXA10FamilyIndirectArgumentBufferLayout initWithStructType:]([AGXA10FamilyIndirectArgumentBufferLayout alloc], "initWithStructType:", a3);
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  return -[AGXA10FamilyIndirectArgumentEncoder initWithLayout:device:]([AGXA10FamilyIndirectArgumentEncoder alloc], "initWithLayout:device:", a3, self);
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)1;
}

- (id)indirectArgumentBufferDecodingData
{
  return (id)MEMORY[0x24BDAC990];
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  return -[AGXA10FamilyRasterizationRateMap initWithDevice:descriptor:]([AGXA10FamilyRasterizationRateMap alloc], "initWithDevice:descriptor:", self, a3);
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return 0;
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  if (os_parse_boot_arg_int()
    && -[AGXA10FamilyDevice newResourceGroupFromResources:count:]::disableDropHints == 1)
  {
    return 0;
  }
  else
  {
    return -[AGXA10FamilyResourceGroup initWithDevice:resources:count:]([AGXA10FamilyResourceGroup alloc], "initWithDevice:resources:count:", self->_impl, a3, a4);
  }
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  void *v5;
  AGXTextureLayout *v6;
  uint64_t v7;

  v5 = (void *)objc_opt_new();
  v6 = -[AGXTextureLayout initWithDevice:descriptor:isHeapOrBufferBacked:]([AGXTextureLayout alloc], "initWithDevice:descriptor:isHeapOrBufferBacked:", self, a3, 0);
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AGXTextureLayout size](v6, "size"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD8E18]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a3, "compressionMode")), CFSTR("kAGXCompressionMode"));
  return v5;
}

- (BOOL)isRTZRoundingSupported
{
  return 0;
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return !a3 || (_DWORD)a3 == 1;
}

- (unsigned)maximumComputeSubstreams
{
  return 0;
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  uint64_t v6;
  unint64_t v7;

  v6 = mach_absolute_time();
  if (getTimebaseInfo(void)::once[0] != -1)
    dispatch_once(getTimebaseInfo(void)::once, &__block_literal_global_5974);
  v7 = v6 * getTimebaseInfo(void)::sTimebaseInfo / unk_254235750;
  *a3 = v7;
  *a4 = v7;
}

- (NSArray)counterSets
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSArray *v7;

  v2 = objc_alloc(MEMORY[0x24BDDD568]);
  v3 = (void *)objc_msgSend(v2, "initWithName:description:", *MEMORY[0x24BDDD160], *MEMORY[0x24BDDD1C0]);
  v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, 0);
  v5 = objc_alloc(MEMORY[0x24BDDD580]);
  v6 = (void *)objc_msgSend(v5, "initWithName:description:counters:", *MEMORY[0x24BDDD158], *MEMORY[0x24BDDD1D0], v4);
  v7 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, 0);

  return v7;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  return -[AGXMTLCounterSampleBuffer initWithDevice:descriptor:error:]([AGXMTLCounterSampleBuffer alloc], "initWithDevice:descriptor:error:", self, a3, a4);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  return 0;
}

- (id)newCounterSampleBufferWithLength:(unint64_t)a3 label:(id)a4 error:(id *)a5
{
  return -[AGXMTLCounterSampleBuffer initWithDevice:length:label:options:error:]([AGXMTLCounterSampleBuffer alloc], "initWithDevice:length:label:options:error:", self, a3, a4, 0, a5);
}

- (id)counterSampleBufferLimits
{
  return &unk_25041E1F8;
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return a3 == 0;
}

- (unint64_t)deviceCreationFlags
{
  return *((_QWORD *)self->_impl + 778);
}

- (BOOL)supportsRaytracing
{
  unint64_t v3;

  v3 = -[_MTLDevice argumentBuffersSupport](self, "argumentBuffersSupport");
  if (v3)
    LOBYTE(v3) = -[_MTLDevice supportsFunctionPointers](self, "supportsFunctionPointers");
  return v3;
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  objc_super v4;

  if (-[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA"))
    return 261;
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice latestSupportedGenericBVHVersion](&v4, sel_latestSupportedGenericBVHVersion);
}

- (BOOL)requiresRaytracingEmulation
{
  return 1;
}

- (BOOL)buildBVHForRIA
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    -[AGXA10FamilyDevice buildBVHForRIA]::riaBvhGenOverride = 0;
  }
  return 0;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  void *v7;
  unsigned __int8 v8;
  _DWORD *v9;
  void *BVHDescriptor;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  int v12;
  objc_super v13;

  if (-[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA"))
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    v7 = (void *)MEMORY[0x234928298]();
    v9 = &unk_255FF8000;
    if ((v8 & 1) == 0)
    {
      v9 = &unk_255FF8000;
      if (v12)
      {
        AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
        v9 = (_DWORD *)&unk_255FF8000;
      }
    }
    BVHDescriptor = (void *)AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createBVHDescriptor(a4, 0, v9[410] & ~((int)v9[410] >> 31));
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::calcAccelerationStructureSizes(&retstr->var0, (uint64_t)self, a4, BVHDescriptor);
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AGXA10FamilyDevice;
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A accelerationStructureSizesWithDescriptor:](&v13, sel_accelerationStructureSizesWithDescriptor_, a4);
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return -[AGXA10FamilyDevice newAccelerationStructureWithSize:resourceIndex:](self, "newAccelerationStructureWithSize:resourceIndex:", a3, 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  _BOOL4 v7;
  __objc2_class **v8;

  v7 = -[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA");
  v8 = off_2503FF330;
  if (!v7)
    v8 = off_2503FF338;
  return (id)objc_msgSend(objc_alloc(*v8), "initWithDevice:length:resourceIndex:storageMode:", self, a3, a4, 2);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  uint64_t v7;
  _BOOL4 v8;
  __objc2_class **v9;

  if (objc_msgSend(a4, "forceResourceIndex"))
    v7 = objc_msgSend(a4, "resourceIndex");
  else
    v7 = 0;
  v8 = -[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA");
  v9 = off_2503FF330;
  if (!v8)
    v9 = off_2503FF338;
  return (id)objc_msgSend(objc_alloc(*v9), "initWithDevice:length:resourceIndex:storageMode:", self, a3, v7, objc_msgSend(a4, "storageMode"));
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  return -[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:](self, "newAccelerationStructureWithBuffer:offset:resourceIndex:", a3, a4, 0);
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA"))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", "agxa_device_objc.mm", 2731, "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]", "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v11 = "agxa_device_objc.mm";
      v12 = 1024;
      v13 = 2731;
      v14 = 2080;
      v15 = "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      v16 = 2080;
      v17 = "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", buf, 0x26u);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v11 = "agxa_device_objc.mm";
      v12 = 1024;
      v13 = 2731;
      v14 = 2080;
      v15 = "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      v16 = 2080;
      v17 = "-[AGXA10FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", buf, 0x26u);
    }
    abort();
  }
  return -[AGXA10FamilyRayTracingAccelerationStructureSW initWithBuffer:offset:device:resourceIndex:]([AGXA10FamilyRayTracingAccelerationStructureSW alloc], "initWithBuffer:offset:device:resourceIndex:", a3, a4, self, a5);
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  objc_super v6;

  if (!-[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
    return (*(_QWORD *)&a3 & 0xFFEFFFFFFFFFFFLL) == 0;
  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyDevice;
  return -[_MTLDevice isCompatibleWithAccelerationStructure:](&v6, sel_isCompatibleWithAccelerationStructure_, a3);
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  AGXA10FamilyRayTracingAccelerationStructure *v7;
  objc_super v9;

  if (-[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXA10FamilyDevice;
    return -[_MTLDevice deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:](&v9, sel_deserializePrimitiveAccelerationStructureFromBytes_withDescriptor_, a3, a4);
  }
  else
  {
    v7 = -[AGXA10FamilyRayTracingAccelerationStructure initWithDevice:length:resourceIndex:storageMode:]([AGXA10FamilyRayTracingAccelerationStructure alloc], "initWithDevice:length:resourceIndex:storageMode:", self, *((_QWORD *)a3 + 2), 0, 0);
    if (v7)
      -[AGXA10FamilyDevice deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:](self, "deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:", v7, a3, a4);
  }
  return v7;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  id v9;
  AGXA10FamilyRayTracingAccelerationStructureSW *v10;
  objc_super v12;

  if (-[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v12.receiver = self;
    v12.super_class = (Class)AGXA10FamilyDevice;
    v9 = -[_MTLDevice deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:](&v12, sel_deserializeInstanceAccelerationStructureFromBytes_primitiveAccelerationStructures_withDescriptor_, a3, a4, a5);
    v10 = -[AGXA10FamilyRayTracingAccelerationStructureSW initWithDevice:src:]([AGXA10FamilyRayTracingAccelerationStructureSW alloc], "initWithDevice:src:", self, v9);

  }
  else
  {
    v10 = -[AGXA10FamilyRayTracingAccelerationStructure initWithDevice:length:resourceIndex:storageMode:]([AGXA10FamilyRayTracingAccelerationStructure alloc], "initWithDevice:length:resourceIndex:storageMode:", self, *((_QWORD *)a3 + 2), 0, 0);
    if (v10)
      -[AGXA10FamilyDevice deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:](self, "deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:", v10, a3, a4, a5);
  }
  return v10;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  uint64_t v9;
  objc_super v10;

  if (-[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v10.receiver = self;
    v10.super_class = (Class)AGXA10FamilyDevice;
    -[_MTLDevice deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:](&v10, sel_deserializePrimitiveAccelerationStructure_fromBytes_withDescriptor_, a3, a4, a5);
  }
  else
  {
    memcpy(*((void **)a3 + 41), (char *)a4 + 24, *((_QWORD *)a4 + 1) - 24);
    v9 = *((_QWORD *)a3 + 41);
    *(_QWORD *)(v9 + 144) = objc_msgSend(a3, "accelerationStructureUniqueIdentifier");
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  objc_super v26;

  if (-[AGXA10FamilyDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v26.receiver = self;
    v26.super_class = (Class)AGXA10FamilyDevice;
    -[_MTLDevice deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:](&v26, sel_deserializeInstanceAccelerationStructure_fromBytes_primitiveAccelerationStructures_withDescriptor_, a3, a4, a5, a6);
  }
  else
  {
    v11 = 0x255FF5000uLL;
    v24 = (char *)a3;
    v12 = (_QWORD *)*((_QWORD *)a3 + 41);
    memcpy(v12, (char *)a4 + 24, *((_QWORD *)a4 + 1) - 24);
    if (((*((_DWORD *)a4 + 36) - *((_DWORD *)a4 + 38)) & 0xFFFFFFF0) != 0)
    {
      v13 = 0;
      v14 = (_DWORD *)((char *)v12 + v12[16] + 8);
      v25 = a6;
      do
      {
        v15 = *v14;
        v16 = (char *)v12 + *((_QWORD *)v14 - 1);
        v17 = *(_DWORD *)(objc_msgSend(a5, "objectAtIndexedSubscript:", v15, v24) + *(int *)(v11 + 3856) + 24);
        *((_DWORD *)v16 + 1) = v17;
        if (objc_msgSend(a6, "instanceDescriptorType") != 2 && objc_msgSend(a6, "instanceDescriptorType") != 4)
        {
          v18 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v15), "buffer");
          v19 = v12;
          v20 = v11;
          v21 = *(_QWORD *)(v18 + (int)*MEMORY[0x24BE51650] + 8);
          v22 = v21 + objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v15), "bufferOffset");
          v11 = v20;
          v12 = v19;
          a6 = v25;
          *((_QWORD *)v16 + 11) = v22;
        }
        *v14 = v17;
        v14 += 4;
        ++v13;
      }
      while (v13 < (*((_DWORD *)a4 + 36) - *((_DWORD *)a4 + 38)) >> 4);
    }
    v23 = *(_QWORD *)&v24[*(int *)(v11 + 3856) + 8];
    *(_QWORD *)(v23 + 144) = objc_msgSend(v24, "accelerationStructureUniqueIdentifier", v24);
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = -[AGXA10FamilyDevice heapBufferSizeAndAlignWithLength:options:](self, "heapBufferSizeAndAlignWithLength:options:", a3, 0);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  if (self)
    -[AGXA10FamilyDevice accelerationStructureSizesWithDescriptor:](self, "accelerationStructureSizesWithDescriptor:", a3);
  v4 = -[AGXA10FamilyDevice heapAccelerationStructureSizeAndAlignWithSize:](self, "heapAccelerationStructureSizeAndAlignWithSize:", 0);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  return -[AGXA10FamilyDevice resourcePatchingTypeForResourceType:]::resourceToPatchingTypeMap[a3];
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v9;
  size_t v10;
  char *v11;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  unint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  unsigned int v53;
  unsigned int v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if (a3 != 8)
  {
    if (a3 == 7 || a3 == 6)
      std::vector<unsigned long long>::__insert_with_size[abi:nn180100]<unsigned long long *,unsigned long long *>((unint64_t *)self->_impl + 701, *((void **)self->_impl + 702), (char *)a4, (char *)&a4[a5], a5);
    return;
  }
  if (-[AGXA10FamilyDevice buildBVHForRIA](self, "buildBVHForRIA"))
    return;
  impl = self->_impl;
  v9 = impl[694];
  if (!*(_DWORD *)(v9 + 48) && (*(_DWORD *)(v9 + 44) + 1) < 2)
  {
    if (!a5)
      return;
    if ((a5 & 0x8000000000000000) != 0)
      abort();
    v10 = 8 * a5;
    v11 = (char *)operator new(8 * a5);
    v12 = (unsigned int *)&v11[v10];
    memcpy(v11, a4, v10);
    std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
    v13 = *(_QWORD *)&v11[v10 - 8];
    if (HIDWORD(v13))
      goto LABEL_58;
    v14 = impl[694];
    v15 = *(unsigned int *)(v14 + 16);
    v16 = (int *)MEMORY[0x24BE51650];
    if (v13 < v15)
    {
LABEL_31:
      v25 = 0;
      atomic_store(0, (unint64_t *)(impl[694] + 32));
      v26 = (unsigned int *)v11;
      do
      {
        v28 = v25 + 1;
        if (*(_QWORD *)v26 > v28)
        {
          v29 = *(_QWORD *)v26 - 1;
          v30 = impl[694];
          v31 = *(_QWORD *)(v30 + 24);
          if (v28 < v29)
          {
            v32 = 8 * v28;
            v33 = v29 - v28;
            v34 = v25 + 2;
            do
            {
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v31 + 8) + *v16 + 24) + v32) = v34;
              v32 += 8;
              ++v34;
              --v33;
            }
            while (v33);
          }
          v35 = (unint64_t *)(v30 + 32);
          v36 = *(_QWORD *)(v30 + 32);
          v37 = 8 * v29;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v31 + 8) + *v16 + 24) + v37) = v36;
          v38 = __ldaxr((unint64_t *)(v30 + 32));
          if (v38 != v36)
          {
            __clrex();
            while (1)
            {
LABEL_44:
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 24) + 8) + *v16 + 24) + v37) = v38;
              v39 = __ldaxr(v35);
              if (v39 == v38)
              {
                if (!__stlxr((v38 & 0xFFFFFFFF00000000 | v28) + 0x100000000, v35))
                  goto LABEL_32;
              }
              else
              {
                __clrex();
              }
              v38 = v39;
            }
          }
          if (__stlxr((v36 & 0xFFFFFFFF00000000 | v28) + 0x100000000, v35))
            goto LABEL_44;
        }
LABEL_32:
        v27 = *v26;
        v26 += 2;
        v25 = v27;
      }
      while (v26 != v12);
      v40 = impl[694];
      v41 = (*(_DWORD *)(v40 + 16) - 1);
      if (v41 <= v25)
        goto LABEL_57;
      v42 = v25 + 1;
      v43 = *(_QWORD *)(v40 + 24);
      if (v42 < v41)
      {
        v44 = 8 * v42;
        v45 = v41 - v42;
        v46 = v25 + 2;
        do
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v43 + 8) + *v16 + 24) + v44) = v46;
          v44 += 8;
          ++v46;
          --v45;
        }
        while (v45);
      }
      v47 = (unint64_t *)(v40 + 32);
      v48 = *(_QWORD *)(v40 + 32);
      v49 = 8 * v41;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v43 + 8) + *v16 + 24) + v49) = v48;
      v50 = __ldaxr((unint64_t *)(v40 + 32));
      if (v50 == v48)
      {
        if (!__stlxr((v48 & 0xFFFFFFFF00000000 | v42) + 0x100000000, v47))
        {
          v51 = 1;
          goto LABEL_56;
        }
      }
      else
      {
        __clrex();
      }
      v51 = 0;
LABEL_56:
      if ((v51 & 1) == 0)
      {
        while (1)
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v40 + 24) + 8) + *v16 + 24) + v49) = v50;
          v52 = __ldaxr(v47);
          if (v52 == v50)
          {
            if (!__stlxr((v50 & 0xFFFFFFFF00000000 | v42) + 0x100000000, v47))
              break;
          }
          else
          {
            __clrex();
          }
          v50 = v52;
        }
      }
LABEL_57:
      atomic_store(v13, (unsigned int *)(impl[694] + 44));
LABEL_58:
      operator delete(v11);
      return;
    }
    do
    {
      if ((_DWORD)v15)
        v15 = (2 * v15);
      else
        v15 = 16;
    }
    while (v13 >= v15);
    v17 = -[AGXBuffer initUntrackedInternalBufferWithDevice:length:options:]([AGXBuffer alloc], "initUntrackedInternalBufferWithDevice:length:options:", *(_QWORD *)v14, 8 * v15, 0);
    v18 = v17;
    v19 = *(_QWORD *)(v14 + 8);
    if (v19)
    {
      memcpy(*(void **)&v17[*v16 + 24], *(const void **)(v19 + *v16 + 24), 8 * *(unsigned int *)(v14 + 16));

    }
    *(_QWORD *)(v14 + 8) = v18;
    *(_DWORD *)(v14 + 16) = v15;
    v20 = *(unsigned int **)(v14 + 56);
    v21 = *v20;
    if (*v20 + 1 > 1)
      v22 = v21 + 1;
    else
      v22 = 1;
    v23 = __ldaxr(v20);
    if (v23 == v21)
    {
      if (!__stlxr(v22, v20))
      {
        v24 = 1;
        goto LABEL_30;
      }
    }
    else
    {
      __clrex();
    }
    v24 = 0;
LABEL_30:
    if ((v24 & 1) == 0)
    {
      while (1)
      {
        if (v23 + 1 > 1)
          v53 = v23 + 1;
        else
          v53 = 1;
        v54 = __ldaxr(v20);
        if (v54 == v23)
        {
          if (!__stlxr(v53, v20))
            goto LABEL_31;
        }
        else
        {
          __clrex();
        }
        v23 = v54;
      }
    }
    goto LABEL_31;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", "agxa_mempool_template.hpp", 302, "reserve");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "agxa_mempool_template.hpp";
    v57 = 1024;
    v58 = 302;
    v59 = 2080;
    v60 = "reserve";
    _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "agxa_mempool_template.hpp";
    v57 = 1024;
    v58 = 302;
    v59 = 2080;
    v60 = "reserve";
    _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
  }
}

- (BOOL)metalAssertionsEnabled
{
  return self->_metalAssertionsEnabled;
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  self->_metalAssertionsEnabled = a3;
}

- (BOOL)disableComputeEncoderCoalescing
{
  return self->_disableComputeEncoderCoalescing;
}

- (void)setDisableComputeEncoderCoalescing:(BOOL)a3
{
  self->_disableComputeEncoderCoalescing = a3;
}

- (BOOL)disableBlitEncoderCoalescing
{
  return self->_disableBlitEncoderCoalescing;
}

- (void)setDisableBlitEncoderCoalescing:(BOOL)a3
{
  self->_disableBlitEncoderCoalescing = a3;
}

- (BOOL)disableEncoderCoalescing
{
  return self->_disableEncoderCoalescing;
}

- (void)setDisableEncoderCoalescing:(BOOL)a3
{
  self->_disableEncoderCoalescing = a3;
}

- (void).cxx_destruct
{
  AGXATelemetry *p_telemetry;
  NSObject *queue;
  NSString *deviceName;
  NSMutableDictionary *backtracePayload;
  NSMutableDictionary *dimensionPayload;
  NSMutableDictionary *payload;
  NSArray *clientKeys;
  NSObject *timer;
  NSObject *v10;
  NSObject *backtraceQueue;
  _QWORD block[5];

  p_telemetry = &self->_telemetry;
  queue = self->_telemetry.queue;
  if (queue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN13AGXATelemetry16disableTelemetryEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = p_telemetry;
    dispatch_sync(queue, block);
  }
  deviceName = p_telemetry->deviceName;
  if (deviceName)

  backtracePayload = p_telemetry->backtracePayload;
  if (backtracePayload)

  dimensionPayload = p_telemetry->dimensionPayload;
  if (dimensionPayload)

  payload = p_telemetry->payload;
  if (payload)

  clientKeys = p_telemetry->clientKeys;
  if (clientKeys)

  timer = p_telemetry->timer;
  if (timer)
  {
    dispatch_release(timer);
    p_telemetry->timer = 0;
  }
  v10 = p_telemetry->queue;
  if (v10)
  {
    dispatch_release(v10);
    p_telemetry->queue = 0;
  }
  backtraceQueue = p_telemetry->backtraceQueue;
  if (backtraceQueue)
  {
    dispatch_release(backtraceQueue);
    p_telemetry->backtraceQueue = 0;
  }
}

- (id).cxx_construct
{
  self->_telemetry.clientKeys = 0;
  *(_OWORD *)&self->_telemetry.deviceName = 0u;
  *(_OWORD *)&self->_telemetry.backtracePayload = 0u;
  *(_OWORD *)((char *)&self->_telemetry.dimensionPayload + 1) = 0u;
  bzero(&self->_telemetry.genericCounts, 0x338uLL);
  self->performance_state_assertion.lock.lock._os_unfair_lock_opaque = 0;
  return self;
}

uint64_t __86__AGXA10FamilyDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeComputePipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__AGXA10FamilyDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeComputePipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __85__AGXA10FamilyDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeRenderPipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __77__AGXA10FamilyDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeRenderPipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __89__AGXA10FamilyDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeRenderPipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __81__AGXA10FamilyDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_storeRenderPipelineState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35__AGXA10FamilyDevice_setupDeferred__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const dispatch_source_type_s *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  Boolean keyExistsAndHasValidFormat[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _QWORD handler[36];

  handler[34] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[101];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 5568));
  if (*(_DWORD *)(v2 + 5544) <= 0xFu)
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 5528, 0x10u);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 5568));
  AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::compileDriverShaders(v1[101], v1);
  *(_QWORD *)(v2 + 4456) = 0;
  handler[0] = 0;
  if (findEnvVarNum<unsigned long long>("AGX_DATA_BUFFER_CACHING_OVERRIDE", handler))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: environment variable forcing the following data buffer classes to use cacheable memory: 0x%016llX\n");
  }
  else
  {
    keyExistsAndHasValidFormat[0] = 0;
    handler[0] = CFPreferencesGetAppIntegerValue(CFSTR("dataBufferCachingOverride"), CFSTR("com.apple.Metal"), keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat[0])
    {
      v3 = 0;
      goto LABEL_8;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: preference forcing the following data buffer classes to use cacheable memory: 0x%016llX\n");
  }
  v3 = handler[0];
LABEL_8:
  v4 = 0;
  v5 = &AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::databuffer_params;
  do
  {
    v6 = *v5;
    v5 += 2;
    v20 = xmmword_232D761E8;
    v21 = xmmword_232D761F8;
    v22 = 0;
    v24 = xmmword_232D76218;
    *(_OWORD *)keyExistsAndHasValidFormat = defaultArgs;
    v19 = xmmword_232D761D8;
    *(_WORD *)&keyExistsAndHasValidFormat[8] = v6;
    *(_DWORD *)&keyExistsAndHasValidFormat[4] = (((v3 >> v4) & 1) == 0) << 10;
    v25 = 0;
    v23 = v6;
    v7 = 0x8000000;
    switch((int)v4)
    {
      case 0:
      case 1:
      case 2:
      case 9:
      case 29:
      case 30:
        v7 = 0x8000000;
        goto LABEL_13;
      case 3:
      case 19:
      case 22:
        v7 = 0x2008000000;
        goto LABEL_13;
      case 4:
      case 7:
      case 12:
      case 13:
      case 15:
      case 16:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 31:
      case 33:
        goto LABEL_13;
      case 5:
      case 6:
        v8 = 1207959552;
        goto LABEL_19;
      case 8:
      case 10:
      case 11:
      case 17:
      case 18:
      case 20:
      case 28:
        v7 = 402653184;
LABEL_13:
        *((_QWORD *)&v24 + 1) = v7;
        break;
      case 14:
        v8 = 671088640;
LABEL_19:
        *((_QWORD *)&v24 + 1) = v8;
        DWORD1(v19) = 0x8000;
        break;
      case 32:
        *((_QWORD *)&v24 + 1) = 0x8000000;
        *(_DWORD *)&keyExistsAndHasValidFormat[4] = 0;
        break;
      default:
        AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setupDeferred(AGXA10FamilyDevice *)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
    handler[v4++] = objc_msgSend(objc_alloc(MEMORY[0x24BE51600]), "initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:", v1, objc_opt_class(), keyExistsAndHasValidFormat, 104, 0);
  }
  while (v4 != 34);
  objc_msgSend(v1, "setHwResourcePool:count:", handler, 34);
  v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  *(_QWORD *)(v2 + 6952) = dispatch_queue_create("com.apple.AGXMetal.MemoryPoolDecay", v9);
  *(std::chrono::system_clock::time_point *)(v2 + 6344) = std::chrono::system_clock::now();
  v10 = (const dispatch_source_type_s *)MEMORY[0x24BDACA18];
  v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v2 + 6952));
  v12 = MEMORY[0x24BDAC760];
  *(_QWORD *)(v2 + 6960) = v11;
  handler[0] = v12;
  handler[1] = 3221225472;
  handler[2] = ___ZN3AGX6DeviceINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXA10FamilyDevice_block_invoke_42;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = v2;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 6960), 0, 0xB2D05E00uLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 6960));
  v13 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 6uLL, *(dispatch_queue_t *)(v2 + 6952));
  *(_QWORD *)(v2 + 6968) = v13;
  *(_QWORD *)keyExistsAndHasValidFormat = v12;
  *(_QWORD *)&keyExistsAndHasValidFormat[8] = 3221225472;
  *(_QWORD *)&v19 = ___ZN3AGX6DeviceINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXA10FamilyDevice_block_invoke_2;
  *((_QWORD *)&v19 + 1) = &__block_descriptor_40_e5_v8__0l;
  *(_QWORD *)&v20 = v2;
  dispatch_source_set_event_handler(v13, keyExistsAndHasValidFormat);
  dispatch_activate(*(dispatch_object_t *)(v2 + 6968));
  v14 = dispatch_source_create(v10, 0, 0, *(dispatch_queue_t *)(v2 + 6952));
  *(_QWORD *)(v2 + 6984) = v14;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = ___ZN3AGX6DeviceINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXA10FamilyDevice_block_invoke_3;
  v17[3] = &__block_descriptor_40_e5_v8__0l;
  v17[4] = v2;
  dispatch_source_set_event_handler(v14, v17);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 6984), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 6984));
  v15 = dispatch_source_create(v10, 0, 0, *(dispatch_queue_t *)(v2 + 6952));
  *(_QWORD *)(v2 + 6992) = v15;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = ___ZN3AGX6DeviceINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXA10FamilyDevice_block_invoke_4;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v2;
  dispatch_source_set_event_handler(v15, v16);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 6992), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 6992));
}

uint64_t __52__AGXA10FamilyDevice__registerForSignpostEnablement__block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint32_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = result;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(result + 32) + 1784));
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1776), "compact");
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1776), "allObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v2 + 32) + 1784));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v26;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v26 != v5)
            objc_enumerationMutation(v3);
          v7 = *(uint64_t **)(*((_QWORD *)&v25 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v7, "label"))
            else
              v8 = 1;
            if (!v8)
            {
              {
                v10 = objc_msgSend((id)objc_msgSend(v7, "label"), "UTF8String");
                v11 = *(_DWORD *)(v7[10] + 2768);
                *(_DWORD *)buf = 136446466;
                v30 = v10;
                v31 = 1026;
                v32 = v11;
                v12 = v9;
                v13 = "ComputePipelineLabel";
                v14 = "Label=%{public,signpost.description:attribute}s ID=%{public,signpost.description:attribute}u";
                v15 = 18;
LABEL_6:
                _os_signpost_emit_with_name_impl(&dword_232C19000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v13, v14, buf, v15);
                goto LABEL_7;
              }
            }
            goto LABEL_7;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v7, "label"))
            goto LABEL_7;
          v16 = v7 + 18;
          v17 = v7[19];
          if (v17)
          {
            v18 = *(_DWORD *)(v17 + 2760);
            v19 = *v16;
            if (*v16)
              goto LABEL_22;
          }
          else
          {
            v18 = -1;
            v19 = *v16;
            if (*v16)
            {
LABEL_22:
              v20 = *(_DWORD *)(v19 + 2776);
              v21 = v7[20];
              if (!v21)
                goto LABEL_26;
              goto LABEL_23;
            }
          }
          v20 = -1;
          v21 = v7[20];
          if (!v21)
          {
LABEL_26:
            v22 = -1;
            goto LABEL_27;
          }
LABEL_23:
          v22 = *(_DWORD *)(v21 + 2776);
LABEL_27:
          {
            {
              v24 = objc_msgSend((id)objc_msgSend(v7, "label"), "UTF8String");
              *(_DWORD *)buf = 136446978;
              v30 = v24;
              v31 = 1026;
              v32 = v18;
              v33 = 1026;
              v34 = v20;
              v35 = 1026;
              v36 = v22;
              v12 = v23;
              v13 = "RenderPipelineLabel";
              v14 = "Label=%{public,signpost.description:attribute}s VertexID=%{public,signpost.description:attribute}u F"
                    "ragmentID=%{public,signpost.description:attribute}u TileID=%{public,signpost.description:attribute}u";
              v15 = 30;
              goto LABEL_6;
            }
          }
LABEL_7:
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
