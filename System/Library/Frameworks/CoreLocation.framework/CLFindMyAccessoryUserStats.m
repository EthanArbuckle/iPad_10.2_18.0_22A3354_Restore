@implementation CLFindMyAccessoryUserStats

- (CLFindMyAccessoryUserStats)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);

  return 0;
}

- (CLFindMyAccessoryUserStats)initWithPayloadV1:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  NSObject *v14;
  char *v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, v3) == 19)
  {
    v9 = (unsigned __int8 *)objc_msgSend_bytes(a3, v6, v7, v8);
    LOWORD(v10) = *(_WORD *)(v9 + 13);
    LOWORD(v11) = *(_WORD *)(v9 + 17);
    return (CLFindMyAccessoryUserStats *)objc_msgSend_initWithOverflowFlag_crashCount_multiTime_nearOwnerTime_wildTime_soundCount_soundTime_rangingCount_rangingTime_multiLeashedTime_multiTimeV2_nearOwnerTimeV2_leashedTime_singleConnTime_dualConnTime_dualLeashedTime_utAccelCount_lastClear_bootR1Time_ownerLongSoundCount_ownerShortSoundCount_utLongSoundCount_utShortSoundCount_bomSoundCount_version_(self, v12, *v9, v9[1], *(unsigned __int16 *)(v9 + 11), *(unsigned __int16 *)(v9 + 15), 0, 0, (double)(*((unsigned __int16 *)v9 + 1) | (v9[4] << 16)), (double)(*(unsigned __int16 *)(v9 + 5) | (v9[7] << 16)), (double)(*((unsigned __int16 *)v9 + 4) | (v9[10] << 16)), (double)v10, (double)v11, 0.0, 0.0, 0.0, 0, 0, 0,
                                           0,
                                           0,
                                           0,
                                           0,
                                           0,
                                           0,
                                           0,
                                           1);
  }
  else
  {
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990990);
    v14 = qword_1EE172120;
    if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "Payload size does not match userstats version 1 response size", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172118 != -1)
        dispatch_once(&qword_1EE172118, &unk_1E2990990);
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryUserStats initWithPayloadV1:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
    return 0;
  }
}

- (CLFindMyAccessoryUserStats)initWithPayloadV2:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v23;
  char *v24;
  uint8_t buf[1640];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, v3) == 60)
  {
    v9 = objc_msgSend_bytes(a3, v6, v7, v8);
    v10 = *(unsigned __int16 *)(v9 + 50);
    v11 = *(unsigned __int16 *)(v9 + 52);
    v12 = *(_DWORD *)(v9 + 4);
    v13 = *(_DWORD *)(v9 + 8);
    v14 = *(_DWORD *)(v9 + 16);
    v15 = *(_DWORD *)(v9 + 20);
    LODWORD(v16) = *(_DWORD *)(v9 + 12);
    LODWORD(v18) = *(_DWORD *)(v9 + 40);
    LODWORD(v17) = *(_DWORD *)(v9 + 44);
    LODWORD(v19) = *(_DWORD *)(v9 + 24);
    LODWORD(v20) = *(_DWORD *)(v9 + 28);
    LODWORD(v21) = *(_DWORD *)(v9 + 36);
    return (CLFindMyAccessoryUserStats *)objc_msgSend_initWithOverflowFlag_crashCount_multiTime_nearOwnerTime_wildTime_soundCount_soundTime_rangingCount_rangingTime_multiLeashedTime_multiTimeV2_nearOwnerTimeV2_leashedTime_singleConnTime_dualConnTime_dualLeashedTime_utAccelCount_lastClear_bootR1Time_ownerLongSoundCount_ownerShortSoundCount_utLongSoundCount_utShortSoundCount_bomSoundCount_version_(self, (const char *)(v11 + v10 + *(unsigned __int16 *)(v9 + 56)), 0, 0, (unsigned __int16)(v11 + v10 + *(_WORD *)(v9 + 56)), *(unsigned __int16 *)(v9 + 48), *(unsigned int *)(v9 + 32), (double)(v12 + *(_DWORD *)v9), (double)(v14 + v13 + v15), (double)v16, (double)(3 * v11- (unsigned __int16)(*(_WORD *)(v9 + 54) + v10)+ 8 * (unsigned __int16)(*(_WORD *)(v9 + 54) + v10)), (double)v17, (double)*(unsigned int *)v9, (double)v12, (double)v13, (double)v14, (double)v15,
                                           (double)v19,
                                           (double)v20,
                                           (double)v21,
                                           (double)v18,
                                           *(unsigned __int16 *)(v9 + 52),
                                           *(unsigned __int16 *)(v9 + 54),
                                           *(unsigned __int16 *)(v9 + 56),
                                           *(unsigned __int16 *)(v9 + 58),
                                           2);
  }
  else
  {
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990990);
    v23 = qword_1EE172120;
    if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "Payload size does not match userstats version 2 response size", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172118 != -1)
        dispatch_once(&qword_1EE172118, &unk_1E2990990);
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryUserStats initWithPayloadV2:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    return 0;
  }
}

- (CLFindMyAccessoryUserStats)initWithOverflowFlag:(int64_t)a3 crashCount:(int64_t)a4 multiTime:(double)a5 nearOwnerTime:(double)a6 wildTime:(double)a7 soundCount:(int64_t)a8 soundTime:(double)a9 rangingCount:(int64_t)a10 rangingTime:(double)a11 multiLeashedTime:(double)a12 multiTimeV2:(double)a13 nearOwnerTimeV2:(double)a14 leashedTime:(double)a15 singleConnTime:(double)a16 dualConnTime:(double)a17 dualLeashedTime:(double)a18 utAccelCount:(int64_t)a19 lastClear:(double)a20 bootR1Time:(double)a21 ownerLongSoundCount:(int64_t)a22 ownerShortSoundCount:(int64_t)a23 utLongSoundCount:(int64_t)a24 utShortSoundCount:(int64_t)a25 bomSoundCount:(int64_t)a26 version:(unint64_t)a27
{
  CLFindMyAccessoryUserStats *result;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CLFindMyAccessoryUserStats;
  result = -[CLFindMyAccessoryUserStats init](&v42, sel_init);
  if (result)
  {
    result->_version = a27;
    result->_overflowFlag = a3;
    result->_crashCount = a4;
    result->_multiTime = a5;
    result->_nearOwnerTime = a6;
    result->_wildTime = a7;
    result->_soundCount = a8;
    result->_soundTime = a9;
    result->_rangingCount = a10;
    result->_rangingTime = a11;
    result->_multiLeashedTime = a12;
    result->_multiTimeV2 = a13;
    result->_nearOwnerTimeV2 = a14;
    result->_leashedTime = a15;
    result->_singleConnTime = a16;
    result->_dualConnTime = a17;
    result->_dualLeashedTime = a18;
    result->_utAccelCount = a19;
    result->_lastClear = a20;
    result->_bootR1Time = a21;
    result->_ownerLongSoundCount = a22;
    result->_ownerShortSoundCount = a23;
    result->_utLongSoundCount = a24;
    result->_utShortSoundCount = a25;
    result->_bomSoundCount = a26;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryUserStats)initWithCoder:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  uint64_t v137;

  v5 = (void *)objc_msgSend_decodeObjectForKey_(a3, a2, (uint64_t)CFSTR("overflowFlag"), v3);
  v137 = objc_msgSend_integerValue(v5, v6, v7, v8);
  v11 = (void *)objc_msgSend_decodeObjectForKey_(a3, v9, (uint64_t)CFSTR("crashCount"), v10);
  v15 = objc_msgSend_integerValue(v11, v12, v13, v14);
  objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("multiTime"), v17);
  v136 = v18;
  objc_msgSend_decodeDoubleForKey_(a3, v19, (uint64_t)CFSTR("nearOwnerTime"), v20);
  v135 = v21;
  objc_msgSend_decodeDoubleForKey_(a3, v22, (uint64_t)CFSTR("wildTime"), v23);
  v134 = v24;
  v27 = (void *)objc_msgSend_decodeObjectForKey_(a3, v25, (uint64_t)CFSTR("soundCount"), v26);
  v31 = objc_msgSend_integerValue(v27, v28, v29, v30);
  objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("soundTime"), v33);
  v133 = v34;
  v37 = (void *)objc_msgSend_decodeObjectForKey_(a3, v35, (uint64_t)CFSTR("rangingCount"), v36);
  v41 = objc_msgSend_integerValue(v37, v38, v39, v40);
  objc_msgSend_decodeDoubleForKey_(a3, v42, (uint64_t)CFSTR("rangingTime"), v43);
  v132 = v44;
  objc_msgSend_decodeDoubleForKey_(a3, v45, (uint64_t)CFSTR("multiLeashedTime"), v46);
  v131 = v47;
  objc_msgSend_decodeDoubleForKey_(a3, v48, (uint64_t)CFSTR("multiTimeV2"), v49);
  v51 = v50;
  objc_msgSend_decodeDoubleForKey_(a3, v52, (uint64_t)CFSTR("nearOwnerTimeV2"), v53);
  v55 = v54;
  objc_msgSend_decodeDoubleForKey_(a3, v56, (uint64_t)CFSTR("leashedTime"), v57);
  v59 = v58;
  objc_msgSend_decodeDoubleForKey_(a3, v60, (uint64_t)CFSTR("singleConnTime"), v61);
  v63 = v62;
  objc_msgSend_decodeDoubleForKey_(a3, v64, (uint64_t)CFSTR("dualConnTime"), v65);
  v67 = v66;
  objc_msgSend_decodeDoubleForKey_(a3, v68, (uint64_t)CFSTR("dualLeashedTime"), v69);
  v71 = v70;
  v74 = (void *)objc_msgSend_decodeObjectForKey_(a3, v72, (uint64_t)CFSTR("utAccelCount"), v73);
  v78 = objc_msgSend_integerValue(v74, v75, v76, v77);
  objc_msgSend_decodeDoubleForKey_(a3, v79, (uint64_t)CFSTR("lastClear"), v80);
  v82 = v81;
  objc_msgSend_decodeDoubleForKey_(a3, v83, (uint64_t)CFSTR("bootR1Time"), v84);
  v86 = v85;
  v89 = (void *)objc_msgSend_decodeObjectForKey_(a3, v87, (uint64_t)CFSTR("ownerLongSoundCount"), v88);
  v93 = objc_msgSend_integerValue(v89, v90, v91, v92);
  v96 = (void *)objc_msgSend_decodeObjectForKey_(a3, v94, (uint64_t)CFSTR("ownerShortSoundCount"), v95);
  v100 = objc_msgSend_integerValue(v96, v97, v98, v99);
  v103 = (void *)objc_msgSend_decodeObjectForKey_(a3, v101, (uint64_t)CFSTR("utLongSoundCount"), v102);
  v107 = objc_msgSend_integerValue(v103, v104, v105, v106);
  v110 = (void *)objc_msgSend_decodeObjectForKey_(a3, v108, (uint64_t)CFSTR("utShortSoundCount"), v109);
  v114 = objc_msgSend_integerValue(v110, v111, v112, v113);
  v117 = (void *)objc_msgSend_decodeObjectForKey_(a3, v115, (uint64_t)CFSTR("bomSoundCount"), v116);
  v121 = objc_msgSend_integerValue(v117, v118, v119, v120);
  v124 = (void *)objc_msgSend_decodeObjectForKey_(a3, v122, (uint64_t)CFSTR("version"), v123);
  v128 = objc_msgSend_unsignedIntegerValue(v124, v125, v126, v127);
  return (CLFindMyAccessoryUserStats *)objc_msgSend_initWithOverflowFlag_crashCount_multiTime_nearOwnerTime_wildTime_soundCount_soundTime_rangingCount_rangingTime_multiLeashedTime_multiTimeV2_nearOwnerTimeV2_leashedTime_singleConnTime_dualConnTime_dualLeashedTime_utAccelCount_lastClear_bootR1Time_ownerLongSoundCount_ownerShortSoundCount_utLongSoundCount_utShortSoundCount_bomSoundCount_version_(self, v129, v137, v15, v31, v41, v78, v93, v136, v135, v134, v133, v132, v131, v51, v55, v59, v63, v67,
                                         v71,
                                         v82,
                                         v86,
                                         v100,
                                         v107,
                                         v114,
                                         v121,
                                         v128);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;

  v6 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, self->_overflowFlag, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("overflowFlag"));
  v10 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, self->_crashCount, v9);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("crashCount"));
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("multiTime"), v13, self->_multiTime);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("nearOwnerTime"), v15, self->_nearOwnerTime);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("wildTime"), v17, self->_wildTime);
  v20 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v18, self->_soundCount, v19);
  objc_msgSend_encodeObject_forKey_(a3, v21, v20, (uint64_t)CFSTR("soundCount"));
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("soundTime"), v23, self->_soundTime);
  v26 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v24, self->_rangingCount, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("rangingCount"));
  objc_msgSend_encodeDouble_forKey_(a3, v28, (uint64_t)CFSTR("rangingTime"), v29, self->_rangingTime);
  objc_msgSend_encodeDouble_forKey_(a3, v30, (uint64_t)CFSTR("multiLeashedTime"), v31, self->_multiLeashedTime);
  objc_msgSend_encodeDouble_forKey_(a3, v32, (uint64_t)CFSTR("multiTimeV2"), v33, self->_multiTimeV2);
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("nearOwnerTimeV2"), v35, self->_nearOwnerTimeV2);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("leashedTime"), v37, self->_leashedTime);
  objc_msgSend_encodeDouble_forKey_(a3, v38, (uint64_t)CFSTR("singleConnTime"), v39, self->_singleConnTime);
  objc_msgSend_encodeDouble_forKey_(a3, v40, (uint64_t)CFSTR("dualConnTime"), v41, self->_dualConnTime);
  objc_msgSend_encodeDouble_forKey_(a3, v42, (uint64_t)CFSTR("dualLeashedTime"), v43, self->_dualLeashedTime);
  v46 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v44, self->_utAccelCount, v45);
  objc_msgSend_encodeObject_forKey_(a3, v47, v46, (uint64_t)CFSTR("utAccelCount"));
  objc_msgSend_encodeDouble_forKey_(a3, v48, (uint64_t)CFSTR("lastClear"), v49, self->_lastClear);
  objc_msgSend_encodeDouble_forKey_(a3, v50, (uint64_t)CFSTR("bootR1Time"), v51, self->_bootR1Time);
  v54 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v52, self->_ownerLongSoundCount, v53);
  objc_msgSend_encodeObject_forKey_(a3, v55, v54, (uint64_t)CFSTR("ownerLongSoundCount"));
  v58 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v56, self->_ownerShortSoundCount, v57);
  objc_msgSend_encodeObject_forKey_(a3, v59, v58, (uint64_t)CFSTR("ownerShortSoundCount"));
  v62 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v60, self->_utLongSoundCount, v61);
  objc_msgSend_encodeObject_forKey_(a3, v63, v62, (uint64_t)CFSTR("utLongSoundCount"));
  v66 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v64, self->_utShortSoundCount, v65);
  objc_msgSend_encodeObject_forKey_(a3, v67, v66, (uint64_t)CFSTR("utShortSoundCount"));
  v70 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v68, self->_bomSoundCount, v69);
  objc_msgSend_encodeObject_forKey_(a3, v71, v70, (uint64_t)CFSTR("bomSoundCount"));
  v74 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v72, self->_version, v73);
  objc_msgSend_encodeObject_forKey_(a3, v75, v74, (uint64_t)CFSTR("version"));
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int64_t)overflowFlag
{
  return self->_overflowFlag;
}

- (int64_t)crashCount
{
  return self->_crashCount;
}

- (double)multiTime
{
  return self->_multiTime;
}

- (double)nearOwnerTime
{
  return self->_nearOwnerTime;
}

- (double)wildTime
{
  return self->_wildTime;
}

- (int64_t)soundCount
{
  return self->_soundCount;
}

- (double)soundTime
{
  return self->_soundTime;
}

- (int64_t)rangingCount
{
  return self->_rangingCount;
}

- (double)rangingTime
{
  return self->_rangingTime;
}

- (double)multiLeashedTime
{
  return self->_multiLeashedTime;
}

- (double)multiTimeV2
{
  return self->_multiTimeV2;
}

- (double)nearOwnerTimeV2
{
  return self->_nearOwnerTimeV2;
}

- (double)leashedTime
{
  return self->_leashedTime;
}

- (double)singleConnTime
{
  return self->_singleConnTime;
}

- (double)dualConnTime
{
  return self->_dualConnTime;
}

- (double)dualLeashedTime
{
  return self->_dualLeashedTime;
}

- (int64_t)utAccelCount
{
  return self->_utAccelCount;
}

- (double)lastClear
{
  return self->_lastClear;
}

- (double)bootR1Time
{
  return self->_bootR1Time;
}

- (int64_t)ownerLongSoundCount
{
  return self->_ownerLongSoundCount;
}

- (int64_t)ownerShortSoundCount
{
  return self->_ownerShortSoundCount;
}

- (int64_t)utLongSoundCount
{
  return self->_utLongSoundCount;
}

- (int64_t)utShortSoundCount
{
  return self->_utShortSoundCount;
}

- (int64_t)bomSoundCount
{
  return self->_bomSoundCount;
}

@end
