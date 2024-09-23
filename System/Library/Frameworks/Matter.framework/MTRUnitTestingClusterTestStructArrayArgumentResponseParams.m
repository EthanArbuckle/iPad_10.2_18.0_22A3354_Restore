@implementation MTRUnitTestingClusterTestStructArrayArgumentResponseParams

- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterTestStructArrayArgumentResponseParams *v4;
  uint64_t v5;
  NSArray *arg1;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *arg2;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *arg3;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *arg4;
  NSNumber *arg5;
  NSNumber *arg6;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentResponseParams;
  v4 = -[MTRUnitTestingClusterTestStructArrayArgumentResponseParams init](&v23, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    arg2 = v4->_arg2;
    v4->_arg2 = (NSArray *)v9;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    arg3 = v4->_arg3;
    v4->_arg3 = (NSArray *)v13;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    arg4 = v4->_arg4;
    v4->_arg4 = (NSArray *)v17;

    arg5 = v4->_arg5;
    v4->_arg5 = (NSNumber *)&unk_250591A40;

    arg6 = v4->_arg6;
    v4->_arg6 = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestStructArrayArgumentResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentResponseParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  objc_msgSend_arg2(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  objc_msgSend_arg3(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  objc_msgSend_arg4(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  objc_msgSend_arg5(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  objc_msgSend_arg6(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >"),
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
    self->_arg6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRUnitTestingClusterTestStructArrayArgumentResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRUnitTestingClusterTestStructArrayArgumentResponseParams *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  char *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  MTRUnitTestingClusterTestStructArrayArgumentResponseParams *v33;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[72];
  uint64_t v40;
  objc_super v41;
  uint64_t v42;
  void *v43;
  __int128 buf;
  uint64_t v45;
  char v46;
  _BYTE v47[80];
  _BYTE v48[80];
  _BYTE v49[80];
  __int16 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v41.receiver = self;
  v41.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentResponseParams;
  v8 = -[MTRUnitTestingClusterTestStructArrayArgumentResponseParams init](&v41, sel_init);
  if (!v8)
  {
    v33 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 3, error);
  if (v40)
  {
    sub_234104468((uint64_t)v39);
    sub_234104498((uint64_t)v39, *(_QWORD *)(v40 + 8), *(_QWORD *)(v40 + 24));
    v37 = 0uLL;
    v38 = 0;
    sub_234105EE4((uint64_t)v39, 256, &v37);
    if (!(_DWORD)v37)
    {
      sub_234104468((uint64_t)&buf);
      v46 = 0;
      sub_234104498((uint64_t)&buf, 0, 0);
      sub_234104468((uint64_t)v47);
      v47[72] = 0;
      sub_234104498(v9, 0, 0);
      sub_234104468((uint64_t)v48);
      v48[72] = 0;
      sub_234104498(v10, 0, 0);
      sub_234104468((uint64_t)v49);
      v49[72] = 0;
      sub_234104498(v11, 0, 0);
      v50 = 0;
      sub_233D40010((uint64_t)&buf, (uint64_t)v39, (uint64_t)&v35);
      v37 = v35;
      v38 = v36;
      if (!(_DWORD)v35)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v12, (uint64_t)&buf);
        v37 = v35;
        v38 = v36;
        if (!(_DWORD)v35)
        {
          v33 = v8;
          goto LABEL_14;
        }
      }
    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    buf = v37;
    v45 = v38;
    v14 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("Command payload decoding failed: %s"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_retainAutorelease(v16);
      v21 = objc_msgSend_UTF8String(v18, v19, v20);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v24 = objc_retainAutorelease(v16);
      objc_msgSend_UTF8String(v24, v25, v26);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v42 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v22, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v27, v28, (uint64_t)v16, &stru_2505249E8, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v29;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)&v43, &v42, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v32, (uint64_t)CFSTR("MTRErrorDomain"), 13, v31);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v33 = 0;
LABEL_14:
  sub_233CAF128(&v40);
LABEL_16:

  return v33;
}

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSArray)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSArray *)arg2
{
  objc_setProperty_nonatomic_copy(self, a2, arg2, 16);
}

- (NSArray)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSArray *)arg3
{
  objc_setProperty_nonatomic_copy(self, a2, arg3, 24);
}

- (NSArray)arg4
{
  return self->_arg4;
}

- (void)setArg4:(NSArray *)arg4
{
  objc_setProperty_nonatomic_copy(self, a2, arg4, 32);
}

- (NSNumber)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSNumber *)arg5
{
  objc_setProperty_nonatomic_copy(self, a2, arg5, 40);
}

- (NSNumber)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSNumber *)arg6
{
  objc_setProperty_nonatomic_copy(self, a2, arg6, 48);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  void *v89;
  const char *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  const char *v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  double v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  void *v124;
  const char *v125;
  const char *v126;
  ChipError *result;
  const char *v128;
  void *v129;
  const char *v130;
  void *v131;
  const char *v132;
  const char *v133;
  void *v134;
  const char *v135;
  const char *v136;
  void *v137;
  const char *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  const char *v145;
  void *v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  double v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  const char *v163;
  void *v164;
  const char *v165;
  void *v166;
  const char *v167;
  const char *v168;
  void *v169;
  const char *v170;
  const char *v171;
  void *v172;
  const char *v173;
  const char *v174;
  void *v175;
  const char *v176;
  MTRUnitTestingClusterTestStructArrayArgumentResponseParams *v177;
  void *v178;
  _BYTE *v179;
  uint64_t v180;
  _BYTE v181[24];
  uint64_t v182;
  unsigned __int8 v183;
  int v184;
  double v185;
  __int128 v186;
  uint64_t v187;
  unsigned __int8 v188;
  unsigned __int8 v189;
  unsigned __int8 v190;
  __int128 v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  __int128 v196;
  uint64_t v197;
  unsigned __int8 v198;
  char v199;
  uint64_t v200;
  unsigned __int8 v201;
  char v202;
  uint64_t v203;
  unsigned __int8 v204;
  char v205;
  uint64_t v206;
  unsigned __int8 v207;
  char v208;
  __int128 v209;
  uint64_t v210;
  unsigned __int8 v211;
  char v212;

  v7 = (void *)objc_opt_new();
  LOBYTE(v180) = *((_BYTE *)a4 + 72);
  if ((_BYTE)v180)
    BYTE1(v180) = *((_BYTE *)a4 + 73);
  v177 = self;
  v179 = a4;
  sub_233CB1CEC((uint64_t)&v188, (uint64_t)a4, (unsigned __int8 *)&v180);
  while (2)
  {
    if (sub_233CB1DD8((uint64_t)&v188))
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v10, v188);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setA_(v9, v12, (uint64_t)v11);

      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v13, v189);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setB_(v9, v15, (uint64_t)v14);

      v16 = (void *)objc_opt_new();
      objc_msgSend_setC_(v9, v17, (uint64_t)v16);

      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v18, v191);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setA_(v22, v23, (uint64_t)v19);

      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v24, BYTE1(v191));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setB_(v28, v29, (uint64_t)v25);

      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v30, BYTE2(v191));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setC_(v34, v35, (uint64_t)v31);

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v36, *((uint64_t *)&v191 + 1), v192);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setD_(v40, v41, (uint64_t)v37);

      v42 = v193;
      v43 = v194;
      v44 = objc_alloc(MEMORY[0x24BDD17C8]);
      v46 = (void *)objc_msgSend_initWithBytes_length_encoding_(v44, v45, v42, v43, 4);
      objc_msgSend_c(v9, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setE_(v49, v50, (uint64_t)v46);

      objc_msgSend_c(v9, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_e(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
      {
        *(_OWORD *)&retstr->mError = xmmword_2504EF138;
        *(_QWORD *)&retstr->mLine = 32591;
        goto LABEL_42;
      }
      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v57, LOBYTE(v195));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setF_(v61, v62, (uint64_t)v58);

      LODWORD(v63) = HIDWORD(v195);
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v64, v65, v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setG_(v69, v70, (uint64_t)v66);

      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v71, v72, *(double *)&v196);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_c(v9, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v7;
      objc_msgSend_setH_(v76, v78, (uint64_t)v73);

      v79 = (void *)objc_opt_new();
      v211 = v198;
      if (v198)
        v212 = v199;
      sub_233CB2000((uint64_t)&v180, (uint64_t)&v196 + 8, &v211);
      while (sub_233CB208C((uint64_t)&v180))
      {
        v81 = (void *)objc_opt_new();
        objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v82, v180);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setA_(v81, v84, (uint64_t)v83);

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v85, BYTE1(v180));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setB_(v81, v87, (uint64_t)v86);

        objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v88, BYTE2(v180));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setC_(v81, v90, (uint64_t)v89);

        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v91, *(uint64_t *)v181, *(_QWORD *)&v181[8]);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setD_(v81, v93, (uint64_t)v92);

        v95 = *(_QWORD *)&v181[16];
        v94 = v182;
        v96 = objc_alloc(MEMORY[0x24BDD17C8]);
        v98 = (void *)objc_msgSend_initWithBytes_length_encoding_(v96, v97, v95, v94, 4);
        objc_msgSend_setE_(v81, v99, (uint64_t)v98);

        objc_msgSend_e(v81, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v102)
        {
          *(_OWORD *)&retstr->mError = xmmword_2504EF150;
          *(_QWORD *)&retstr->mLine = 32610;

LABEL_41:
          v7 = v77;
LABEL_42:

LABEL_43:
          return result;
        }
        objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v103, v183);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setF_(v81, v105, (uint64_t)v104);

        LODWORD(v106) = v184;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v107, v108, v106);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setG_(v81, v110, (uint64_t)v109);

        objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v111, v112, v185);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setH_(v81, v114, (uint64_t)v113);

        objc_msgSend_addObject_(v79, v115, (uint64_t)v81);
      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if ((_DWORD)v186 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v186;
        *(_QWORD *)&retstr->mLine = v187;
        if (retstr->mError)
          goto LABEL_41;
      }
      objc_msgSend_setD_(v9, v80, (uint64_t)v79, v177);

      v116 = (void *)objc_opt_new();
      v211 = v201;
      v7 = v77;
      if (v201)
        v212 = v202;
      sub_233C05E38((uint64_t)&v180, (uint64_t)&v200, &v211);
      while (sub_233CB2194(&v180))
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v117, v180);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v116, v119, (uint64_t)v118);

      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if (*(_DWORD *)v181 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
      }
      else
      {
        *(_OWORD *)&retstr->mError = *(_OWORD *)v181;
        *(_QWORD *)&retstr->mLine = *(_QWORD *)&v181[16];
        if (retstr->mError)
          goto LABEL_48;
      }
      objc_msgSend_setE_(v9, v117, (uint64_t)v116);

      v116 = (void *)objc_opt_new();
      v211 = v204;
      if (v204)
        v212 = v205;
      sub_233CB15CC((uint64_t)&v180, (uint64_t)&v203, &v211);
      while (sub_233CB2238((uint64_t)&v180))
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v120, v180, *(_QWORD *)v181);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v116, v122, (uint64_t)v121);

      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if (*(_DWORD *)&v181[8] == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
      }
      else
      {
        *(_OWORD *)&retstr->mError = *(_OWORD *)&v181[8];
        *(_QWORD *)&retstr->mLine = v182;
        if (retstr->mError)
          goto LABEL_48;
      }
      objc_msgSend_setF_(v9, v120, (uint64_t)v116);

      v116 = (void *)objc_opt_new();
      v211 = v207;
      if (v207)
        v212 = v208;
      sub_233C05E38((uint64_t)&v180, (uint64_t)&v206, &v211);
      while (sub_233CAFFB0((uint64_t)&v180))
      {
        objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v123, v180);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v116, v125, (uint64_t)v124);

      }
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      if (*(_DWORD *)v181 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
LABEL_39:
        objc_msgSend_setG_(v9, v123, (uint64_t)v116);

        objc_msgSend_addObject_(v77, v126, (uint64_t)v9);
        continue;
      }
      *(_OWORD *)&retstr->mError = *(_OWORD *)v181;
      *(_QWORD *)&retstr->mLine = *(_QWORD *)&v181[16];
      if (!retstr->mError)
        goto LABEL_39;
LABEL_48:

      goto LABEL_42;
    }
    break;
  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v209 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v209;
    *(_QWORD *)&retstr->mLine = v210;
    if (retstr->mError)
      goto LABEL_43;
  }
  objc_msgSend_setArg1_(v177, v8, (uint64_t)v7, v177);

  v7 = (void *)objc_opt_new();
  LOBYTE(v180) = *((_BYTE *)a4 + 152);
  if ((_BYTE)v180)
    BYTE1(v180) = *((_BYTE *)a4 + 153);
  sub_233CB2000((uint64_t)&v188, (uint64_t)a4 + 80, (unsigned __int8 *)&v180);
  while (sub_233CB208C((uint64_t)&v188))
  {
    v129 = (void *)objc_opt_new();
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v130, v188);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setA_(v129, v132, (uint64_t)v131);

    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v133, v189);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setB_(v129, v135, (uint64_t)v134);

    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v136, v190);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setC_(v129, v138, (uint64_t)v137);

    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v139, v191, *((_QWORD *)&v191 + 1));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setD_(v129, v141, (uint64_t)v140);

    v142 = v192;
    v143 = v193;
    v144 = objc_alloc(MEMORY[0x24BDD17C8]);
    v146 = (void *)objc_msgSend_initWithBytes_length_encoding_(v144, v145, v142, v143, 4);
    objc_msgSend_setE_(v129, v147, (uint64_t)v146);

    objc_msgSend_e(v129, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v150)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EF168;
      *(_QWORD *)&retstr->mLine = 32692;

      goto LABEL_43;
    }
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v151, v194);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setF_(v129, v153, (uint64_t)v152);

    LODWORD(v154) = HIDWORD(v194);
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v155, v156, v154);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setG_(v129, v158, (uint64_t)v157);

    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v159, v160, v195);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setH_(v129, v162, (uint64_t)v161);

    objc_msgSend_addObject_(v7, v163, (uint64_t)v129);
  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v196 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
    v164 = v178;
    objc_msgSend_setArg2_(v178, v128, (uint64_t)v7);
  }
  else
  {
    *(_OWORD *)&retstr->mError = v196;
    *(_QWORD *)&retstr->mLine = v197;
    v164 = v178;
    if (retstr->mError)
      goto LABEL_43;
    objc_msgSend_setArg2_(v178, v128, (uint64_t)v7);
  }

  v7 = (void *)objc_opt_new();
  LOBYTE(v180) = v179[232];
  if ((_BYTE)v180)
    BYTE1(v180) = v179[233];
  sub_233C05E38((uint64_t)&v188, (uint64_t)(v179 + 160), (unsigned __int8 *)&v180);
  while (sub_233C05EA4((uint64_t)&v188))
  {
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v165, v188);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v167, (uint64_t)v166);

  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v191 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v191;
    *(_QWORD *)&retstr->mLine = v192;
    if (retstr->mError)
      goto LABEL_43;
  }
  objc_msgSend_setArg3_(v164, v165, (uint64_t)v7);

  v7 = (void *)objc_opt_new();
  LOBYTE(v180) = v179[312];
  if ((_BYTE)v180)
    BYTE1(v180) = v179[313];
  sub_233C05E38((uint64_t)&v188, (uint64_t)(v179 + 240), (unsigned __int8 *)&v180);
  while (sub_233CB230C((uint64_t)&v188))
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v168, v188);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v170, (uint64_t)v169);

  }
  *(_QWORD *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(_QWORD *)&retstr->mLine = 0;
  if ((_DWORD)v191 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v191;
    *(_QWORD *)&retstr->mLine = v192;
    if (retstr->mError)
      goto LABEL_43;
  }
  objc_msgSend_setArg4_(v164, v168, (uint64_t)v7);

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v171, v179[320]);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg5_(v164, v173, (uint64_t)v172);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v174, v179[321]);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg6_(v164, v176, (uint64_t)v175);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 32747;
  return result;
}

@end
