@implementation _ANSTISPInferenceDescriptorV1

+ (id)_nameForConfiguration:(id)a3 withError:(id *)a4
{
  return CFSTR("anst");
}

+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id *v14;
  const char *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_bundleForClass_(MEMORY[0x24BDD1488], v7, (uint64_t)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_subdirectory_(v8, v9, (uint64_t)CFSTR("anst"), CFSTR("mlmodelc"), CFSTR("Models"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend_useE5(v6, v11, v12))
      objc_msgSend_URLByAppendingPathComponent_(v10, v13, (uint64_t)CFSTR("v2_4.espresso.net"));
    else
      objc_msgSend_URLByAppendingPathComponent_(v10, v13, (uint64_t)CFSTR("model.espresso.net"));
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v14)
    {
      v16 = v14;
      a4 = v16;
    }
    else
    {
      if (a4)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0B88];
        v28 = *MEMORY[0x24BDD1328];
        v36[0] = *MEMORY[0x24BDD0BA0];
        v36[1] = v28;
        v37[0] = CFSTR("Unable to retrieve the asset URL.");
        v37[1] = v10;
        v36[2] = *MEMORY[0x24BDD0CB8];
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("anst"), v15, (uint64_t)CFSTR("mlmodelc"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathComponent_(CFSTR("Models"), v30, (uint64_t)v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v31;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)v37, v36, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v26, v34, v27, 4, v33);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      a4 = 0;
    }
    goto LABEL_12;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0B88];
    v19 = *MEMORY[0x24BDD0BA0];
    v39[0] = CFSTR("Unable to retrieve the base URL for the asset.");
    v20 = *MEMORY[0x24BDD0CB8];
    v38[0] = v19;
    v38[1] = v20;
    objc_msgSend_stringByAppendingPathExtension_(CFSTR("anst"), v11, (uint64_t)CFSTR("mlmodelc"));
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(CFSTR("Models"), v21, (uint64_t)v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v39, v38, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v25, v18, 4, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_12:

  }
  return a4;
}

+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t i;
  void *v25;
  const char *v26;
  ANSTPixelBufferDescriptor *v27;
  const char *v28;
  void *v29;
  const char *v30;
  ANSTTensorDescriptor *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  ANSTTensorDescriptor *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  ANSTTensorDescriptor *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  ANSTTensorDescriptor *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  ANSTTensorDescriptor *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  ANSTTensorDescriptor *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  ANSTTensorDescriptor *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  ANSTTensorDescriptor *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  ANSTTensorDescriptor *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  ANSTTensorDescriptor *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  ANSTTensorDescriptor *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  void *v125;
  ANSTTensorDescriptor *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  void *v133;
  ANSTTensorDescriptor *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  void *v141;
  ANSTTensorDescriptor *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  ANSTTensorDescriptor *v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  ANSTTensorDescriptor *v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  ANSTTensorDescriptor *v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  ANSTTensorDescriptor *v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  ANSTTensorDescriptor *v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  ANSTTensorDescriptor *v191;
  const char *v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  ANSTTensorDescriptor *v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  ANSTTensorDescriptor *v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  ANSTTensorDescriptor *v215;
  const char *v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  ANSTTensorDescriptor *v223;
  const char *v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  ANSTTensorDescriptor *v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  ANSTTensorDescriptor *v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  ANSTTensorDescriptor *v247;
  const char *v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  ANSTTensorDescriptor *v255;
  const char *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  const char *v263;
  void *v264;
  int v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  id v276;
  id v277;
  id v278;
  id v279;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  char v287;
  _BYTE v288[2400];
  AcDetNode **v289;
  _QWORD v290[26];
  _OWORD v291[2];
  _OWORD v292[2];
  _OWORD v293[2];
  _OWORD v294[2];
  _OWORD v295[2];
  _OWORD v296[2];
  _OWORD v297[2];
  _OWORD v298[2];
  _OWORD v299[2];
  _OWORD v300[2];
  _OWORD v301[2];
  _OWORD v302[2];
  _OWORD v303[2];
  _OWORD v304[2];
  _OWORD v305[2];
  _OWORD v306[2];
  _OWORD v307[2];
  _OWORD v308[2];
  _OWORD v309[2];
  _OWORD v310[2];
  _OWORD v311[2];
  _OWORD v312[2];
  _OWORD v313[2];
  _OWORD v314[2];
  _OWORD v315[2];
  _OWORD v316[2];
  _QWORD v317[3];
  _OWORD v318[2];
  _OWORD v319[2];
  uint64_t v320;
  uint64_t v321;
  _QWORD v322[2];
  _QWORD v323[2];
  _DWORD v324[50604];
  uint64_t v325;

  v325 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v12 = v9;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    LOBYTE(a6) = 1;
    goto LABEL_12;
  }
  objc_msgSend_useE5(v9, v10, v11);
  v289 = 0;
  bzero(v288, 0x960uLL);
  bzero(v324, 0x316B0uLL);
  v287 = 0;
  v14 = AcANSTCreate(&v289, (uint64_t)&v287, (uint64_t)v324);
  if (!(_DWORD)v14)
  {
    v14 = AcANSTGetParams((uint64_t *)v289, v324, (uint64_t)v288);
    if (!(_DWORD)v14)
    {
      v21 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v16 = (void *)objc_msgSend_initWithCapacity_(v21, v22, 25);
      for (i = 0; i != 1600; i += 64)
      {
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v23, (uint64_t)&v288[i + 776]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v16, v26, (uint64_t)v25);

      }
      if (v289)
        AcANSTDestroy((uint64_t)v289);
      if (a3)
      {
        v27 = [ANSTPixelBufferDescriptor alloc];
        v320 = *MEMORY[0x24BDC5668];
        v321 = MEMORY[0x24BDBD1B8];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)&v321, &v320, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v27, v30, (uint64_t)CFSTR("input_image"), 512, 384, 1111970369, v29, a6);

        if (!v18)
          goto LABEL_10;
        v31 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v32, v33))
          v36 = 104;
        else
          v36 = 102;
        v319[0] = xmmword_235914FE0;
        v319[1] = unk_235914FF0;
        if (objc_msgSend_useE5(v12, v34, v35))
          v38 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v31, v37, (uint64_t)CFSTR("last_mask"), v36, 4, v319, 64, a6);
        else
          v38 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v31, v37, (uint64_t)CFSTR("last_mask"), v36, 4, v319, 1, a6);
        if (!v38)
        {
LABEL_9:

LABEL_10:
          LOBYTE(a6) = 0;
LABEL_11:

          goto LABEL_12;
        }
        v39 = (void *)v38;
        v40 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v41, v42))
          v45 = 104;
        else
          v45 = 102;
        v318[0] = xmmword_235914FE0;
        v318[1] = unk_235914FF0;
        if (objc_msgSend_useE5(v12, v43, v44))
          v47 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v40, v46, (uint64_t)CFSTR("last_salient_mask"), v45, 4, v318, 64, a6);
        else
          v47 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v40, v46, (uint64_t)CFSTR("last_salient_mask"), v45, 4, v318, 1, a6);
        if (!v47)
        {

          goto LABEL_9;
        }
        v49 = (void *)v47;
        v317[0] = v18;
        v317[1] = v39;
        v317[2] = v47;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v48, (uint64_t)v317, 3);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a4)
      {
        v50 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v51, v52))
          v55 = 104;
        else
          v55 = 102;
        v316[0] = xmmword_235914E60;
        v316[1] = unk_235914E70;
        if (objc_msgSend_useE5(v12, v53, v54))
          v57 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v50, v56, (uint64_t)CFSTR("logits@output"), v55, 4, v316, 64, a6);
        else
          v57 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v50, v56, (uint64_t)CFSTR("logits@output"), v55, 4, v316, 1, a6);
        if (!v57)
          goto LABEL_10;
        v58 = (void *)v57;
        v59 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v60, v61))
          v64 = 104;
        else
          v64 = 102;
        v315[0] = xmmword_235914FC0;
        v315[1] = unk_235914FD0;
        if (objc_msgSend_useE5(v12, v62, v63))
          v66 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v59, v65, (uint64_t)CFSTR("centerness@output"), v64, 4, v315, 64, a6);
        else
          v66 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v59, v65, (uint64_t)CFSTR("centerness@output"), v64, 4, v315, 1, a6);
        if (!v66)
        {

          goto LABEL_10;
        }
        v67 = (void *)v66;
        v68 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v69, v70))
          v73 = 104;
        else
          v73 = 102;
        v314[0] = xmmword_235914F40;
        v314[1] = unk_235914F50;
        if (objc_msgSend_useE5(v12, v71, v72))
          v75 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v68, v74, (uint64_t)CFSTR("bbox_reg@output"), v73, 4, v314, 64, a6);
        else
          v75 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v68, v74, (uint64_t)CFSTR("bbox_reg@output"), v73, 4, v314, 1, a6);
        v76 = (void *)v75;
        if (v75)
        {
          v77 = [ANSTTensorDescriptor alloc];
          if (objc_msgSend_useE5(v12, v78, v79))
            v82 = 104;
          else
            v82 = 102;
          v313[0] = xmmword_235914EA0;
          v313[1] = unk_235914EB0;
          if (objc_msgSend_useE5(v12, v80, v81))
            v84 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v77, v83, (uint64_t)CFSTR("face_pose@output"), v82, 4, v313, 64, a6);
          else
            v84 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v77, v83, (uint64_t)CFSTR("face_pose@output"), v82, 4, v313, 1, a6);
          v85 = (void *)v84;
          if (v84)
          {
            v281 = v76;
            v86 = [ANSTTensorDescriptor alloc];
            if (objc_msgSend_useE5(v12, v87, v88))
              v91 = 104;
            else
              v91 = 102;
            v312[0] = xmmword_235914E80;
            v312[1] = unk_235914E90;
            if (objc_msgSend_useE5(v12, v89, v90))
              v93 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v86, v92, (uint64_t)CFSTR("face_attributes@output"), v91, 4, v312, 64, a6);
            else
              v93 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v86, v92, (uint64_t)CFSTR("face_attributes@output"), v91, 4, v312, 1, a6);
            if (v93)
            {
              v280 = v93;
              v94 = [ANSTTensorDescriptor alloc];
              if (objc_msgSend_useE5(v12, v95, v96))
                v99 = 104;
              else
                v99 = 102;
              v311[0] = xmmword_235914EA0;
              v311[1] = unk_235914EB0;
              if (objc_msgSend_useE5(v12, v97, v98))
                v101 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v94, v100, (uint64_t)CFSTR("face_skintone@output"), v99, 4, v311, 64, a6);
              else
                v101 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v94, v100, (uint64_t)CFSTR("face_skintone@output"), v99, 4, v311, 1, a6);
              if (v101)
              {
                v283 = v101;
                v102 = [ANSTTensorDescriptor alloc];
                if (objc_msgSend_useE5(v12, v103, v104))
                  v107 = 104;
                else
                  v107 = 102;
                v310[0] = xmmword_235914EC0;
                v310[1] = unk_235914ED0;
                if (objc_msgSend_useE5(v12, v105, v106))
                  v109 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v102, v108, (uint64_t)CFSTR("id_map@output"), v107, 4, v310, 64, a6);
                else
                  v109 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v102, v108, (uint64_t)CFSTR("id_map@output"), v107, 4, v310, 1, a6);
                if (v109)
                {
                  v282 = v109;
                  v110 = [ANSTTensorDescriptor alloc];
                  if (objc_msgSend_useE5(v12, v111, v112))
                    v115 = 104;
                  else
                    v115 = 102;
                  v309[0] = xmmword_235914FC0;
                  v309[1] = unk_235914FD0;
                  if (objc_msgSend_useE5(v12, v113, v114))
                    v117 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v110, v116, (uint64_t)CFSTR("hand_logits@output"), v115, 4, v309, 64, a6);
                  else
                    v117 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v110, v116, (uint64_t)CFSTR("hand_logits@output"), v115, 4, v309, 1, a6);
                  if (v117)
                  {
                    v279 = v117;
                    v118 = [ANSTTensorDescriptor alloc];
                    if (objc_msgSend_useE5(v12, v119, v120))
                      v123 = 104;
                    else
                      v123 = 102;
                    v308[0] = xmmword_235914FC0;
                    v308[1] = unk_235914FD0;
                    if (objc_msgSend_useE5(v12, v121, v122))
                      v125 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v118, v124, (uint64_t)CFSTR("hand_ctrness@output"), v123, 4, v308, 64, a6);
                    else
                      v125 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v118, v124, (uint64_t)CFSTR("hand_ctrness@output"), v123, 4, v308, 1, a6);
                    if (v125)
                    {
                      v278 = v125;
                      v126 = [ANSTTensorDescriptor alloc];
                      if (objc_msgSend_useE5(v12, v127, v128))
                        v131 = 104;
                      else
                        v131 = 102;
                      v307[0] = xmmword_235914F40;
                      v307[1] = unk_235914F50;
                      if (objc_msgSend_useE5(v12, v129, v130))
                        v133 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v126, v132, (uint64_t)CFSTR("hand_bbox_reg@output"), v131, 4, v307, 64, a6);
                      else
                        v133 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v126, v132, (uint64_t)CFSTR("hand_bbox_reg@output"), v131, 4, v307, 1, a6);
                      if (v133)
                      {
                        v277 = v133;
                        v134 = [ANSTTensorDescriptor alloc];
                        if (objc_msgSend_useE5(v12, v135, v136))
                          v139 = 104;
                        else
                          v139 = 102;
                        v306[0] = xmmword_235914FC0;
                        v306[1] = unk_235914FD0;
                        if (objc_msgSend_useE5(v12, v137, v138))
                          v141 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v134, v140, (uint64_t)CFSTR("hand_pose@output"), v139, 4, v306, 64, a6);
                        else
                          v141 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v134, v140, (uint64_t)CFSTR("hand_pose@output"), v139, 4, v306, 1, a6);
                        if (v141)
                        {
                          v276 = v141;
                          v142 = [ANSTTensorDescriptor alloc];
                          if (objc_msgSend_useE5(v12, v143, v144))
                            v147 = 104;
                          else
                            v147 = 102;
                          v305[0] = xmmword_235914EE0;
                          v305[1] = unk_235914EF0;
                          if (objc_msgSend_useE5(v12, v145, v146))
                            v149 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v142, v148, (uint64_t)CFSTR("sf_cls_logits@output"), v147, 4, v305, 64, a6);
                          else
                            v149 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v142, v148, (uint64_t)CFSTR("sf_cls_logits@output"), v147, 4, v305, 1, a6);
                          v275 = (void *)v149;
                          if (v149)
                          {
                            v150 = [ANSTTensorDescriptor alloc];
                            if (objc_msgSend_useE5(v12, v151, v152))
                              v155 = 104;
                            else
                              v155 = 102;
                            v304[0] = xmmword_235914EE0;
                            v304[1] = unk_235914EF0;
                            if (objc_msgSend_useE5(v12, v153, v154))
                              v157 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v150, v156, (uint64_t)CFSTR("sf_ctrness@output"), v155, 4, v304, 64, a6);
                            else
                              v157 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v150, v156, (uint64_t)CFSTR("sf_ctrness@output"), v155, 4, v304, 1, a6);
                            v274 = (void *)v157;
                            if (v157)
                            {
                              v158 = [ANSTTensorDescriptor alloc];
                              if (objc_msgSend_useE5(v12, v159, v160))
                                v163 = 104;
                              else
                                v163 = 102;
                              v303[0] = xmmword_235914F00;
                              v303[1] = unk_235914F10;
                              if (objc_msgSend_useE5(v12, v161, v162))
                                v165 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v158, v164, (uint64_t)CFSTR("sf_bbox_reg@output"), v163, 4, v303, 64, a6);
                              else
                                v165 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v158, v164, (uint64_t)CFSTR("sf_bbox_reg@output"), v163, 4, v303, 1, a6);
                              v166 = (void *)v165;
                              if (v165)
                              {
                                v167 = [ANSTTensorDescriptor alloc];
                                if (objc_msgSend_useE5(v12, v168, v169))
                                  v172 = 104;
                                else
                                  v172 = 102;
                                v302[0] = xmmword_235914F20;
                                v302[1] = unk_235914F30;
                                if (objc_msgSend_useE5(v12, v170, v171))
                                  v174 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v167, v173, (uint64_t)CFSTR("face_landmark@output"), v172, 4, v302, 64, a6);
                                else
                                  v174 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v167, v173, (uint64_t)CFSTR("face_landmark@output"), v172, 4, v302, 1, a6);
                                v273 = (void *)v174;
                                if (v174)
                                {
                                  v175 = [ANSTTensorDescriptor alloc];
                                  if (objc_msgSend_useE5(v12, v176, v177))
                                    v180 = 104;
                                  else
                                    v180 = 102;
                                  v301[0] = xmmword_235914F40;
                                  v301[1] = unk_235914F50;
                                  if (objc_msgSend_useE5(v12, v178, v179))
                                    v182 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v175, v181, (uint64_t)CFSTR("hand_associations@output"), v180, 4, v301, 64, a6);
                                  else
                                    v182 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v175, v181, (uint64_t)CFSTR("hand_associations@output"), v180, 4, v301, 1, a6);
                                  v285 = (void *)v182;
                                  if (v182)
                                  {
                                    v183 = [ANSTTensorDescriptor alloc];
                                    if (objc_msgSend_useE5(v12, v184, v185))
                                      v188 = 104;
                                    else
                                      v188 = 102;
                                    v300[0] = xmmword_235914F60;
                                    v300[1] = unk_235914F70;
                                    if (objc_msgSend_useE5(v12, v186, v187))
                                      v190 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v183, v189, (uint64_t)CFSTR("smudge_predict@output"), v188, 4, v300, 64, a6);
                                    else
                                      v190 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v183, v189, (uint64_t)CFSTR("smudge_predict@output"), v188, 4, v300, 1, a6);
                                    v284 = (void *)v190;
                                    if (v190)
                                    {
                                      v191 = [ANSTTensorDescriptor alloc];
                                      if (objc_msgSend_useE5(v12, v192, v193))
                                        v196 = 104;
                                      else
                                        v196 = 102;
                                      v299[0] = xmmword_235914FE0;
                                      v299[1] = unk_235914FF0;
                                      if (objc_msgSend_useE5(v12, v194, v195))
                                        v198 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v191, v197, (uint64_t)CFSTR("prior_mask@output"), v196, 4, v299, 64, a6);
                                      else
                                        v198 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v191, v197, (uint64_t)CFSTR("prior_mask@output"), v196, 4, v299, 1, a6);
                                      v272 = (void *)v198;
                                      if (v198)
                                      {
                                        v199 = [ANSTTensorDescriptor alloc];
                                        if (objc_msgSend_useE5(v12, v200, v201))
                                          v204 = 104;
                                        else
                                          v204 = 102;
                                        v298[0] = xmmword_235914F80;
                                        v298[1] = unk_235914F90;
                                        if (objc_msgSend_useE5(v12, v202, v203))
                                          v206 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v199, v205, (uint64_t)CFSTR("person@output"), v204, 4, v298, 64, a6);
                                        else
                                          v206 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v199, v205, (uint64_t)CFSTR("person@output"), v204, 4, v298, 1, a6);
                                        v269 = (void *)v206;
                                        if (v206)
                                        {
                                          v207 = [ANSTTensorDescriptor alloc];
                                          if (objc_msgSend_useE5(v12, v208, v209))
                                            v212 = 104;
                                          else
                                            v212 = 102;
                                          v297[0] = xmmword_235914F80;
                                          v297[1] = unk_235914F90;
                                          if (objc_msgSend_useE5(v12, v210, v211))
                                            v214 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v207, v213, (uint64_t)CFSTR("salient_person@output"), v212, 4, v297, 64, a6);
                                          else
                                            v214 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v207, v213, (uint64_t)CFSTR("salient_person@output"), v212, 4, v297, 1, a6);
                                          v268 = (void *)v214;
                                          if (v214)
                                          {
                                            v215 = [ANSTTensorDescriptor alloc];
                                            if (objc_msgSend_useE5(v12, v216, v217))
                                              v220 = 104;
                                            else
                                              v220 = 102;
                                            v296[0] = xmmword_235914F80;
                                            v296[1] = unk_235914F90;
                                            if (objc_msgSend_useE5(v12, v218, v219))
                                              v222 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v215, v221, (uint64_t)CFSTR("skin@output"), v220, 4, v296, 64, a6);
                                            else
                                              v222 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v215, v221, (uint64_t)CFSTR("skin@output"), v220, 4, v296, 1, a6);
                                            v267 = (void *)v222;
                                            if (v222)
                                            {
                                              v223 = [ANSTTensorDescriptor alloc];
                                              if (objc_msgSend_useE5(v12, v224, v225))
                                                v228 = 104;
                                              else
                                                v228 = 102;
                                              v295[0] = xmmword_235914F80;
                                              v295[1] = unk_235914F90;
                                              if (objc_msgSend_useE5(v12, v226, v227))
                                                v230 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v223, v229, (uint64_t)CFSTR("hair@output"), v228, 4, v295, 64, a6);
                                              else
                                                v230 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v223, v229, (uint64_t)CFSTR("hair@output"), v228, 4, v295, 1, a6);
                                              v266 = (void *)v230;
                                              if (v230)
                                              {
                                                v231 = [ANSTTensorDescriptor alloc];
                                                if (objc_msgSend_useE5(v12, v232, v233))
                                                  v236 = 104;
                                                else
                                                  v236 = 102;
                                                v294[0] = xmmword_235914F80;
                                                v294[1] = unk_235914F90;
                                                if (objc_msgSend_useE5(v12, v234, v235))
                                                  v238 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v231, v237, (uint64_t)CFSTR("sky@output"), v236, 4, v294, 64, a6);
                                                else
                                                  v238 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v231, v237, (uint64_t)CFSTR("sky@output"), v236, 4, v294, 1, a6);
                                                v271 = (void *)v238;
                                                if (v238)
                                                {
                                                  v239 = [ANSTTensorDescriptor alloc];
                                                  if (objc_msgSend_useE5(v12, v240, v241))
                                                    v244 = 104;
                                                  else
                                                    v244 = 102;
                                                  v293[0] = xmmword_235914FA0;
                                                  v293[1] = unk_235914FB0;
                                                  if (objc_msgSend_useE5(v12, v242, v243))
                                                    v246 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v239, v245, (uint64_t)CFSTR("viseg@output"), v244, 4, v293, 64, a6);
                                                  else
                                                    v246 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v239, v245, (uint64_t)CFSTR("viseg@output"), v244, 4, v293, 1, a6);
                                                  v270 = (void *)v246;
                                                  if (v246)
                                                  {
                                                    v247 = [ANSTTensorDescriptor alloc];
                                                    if (objc_msgSend_useE5(v12, v248, v249))
                                                      v252 = 104;
                                                    else
                                                      v252 = 102;
                                                    v292[0] = xmmword_235914FC0;
                                                    v292[1] = unk_235914FD0;
                                                    if (objc_msgSend_useE5(v12, v250, v251))
                                                      v254 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v247, v253, (uint64_t)CFSTR("saliency@output"), v252, 4, v292, 64, a6);
                                                    else
                                                      v254 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v247, v253, (uint64_t)CFSTR("saliency@output"), v252, 4, v292, 1, a6);
                                                    v286 = (void *)v254;
                                                    if (v254)
                                                    {
                                                      v255 = [ANSTTensorDescriptor alloc];
                                                      if (objc_msgSend_useE5(v12, v256, v257))
                                                        v260 = 104;
                                                      else
                                                        v260 = 102;
                                                      v291[0] = xmmword_235914FE0;
                                                      v291[1] = unk_235914FF0;
                                                      if (objc_msgSend_useE5(v12, v258, v259))
                                                        v262 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v255, v261, (uint64_t)CFSTR("salient_person_prior_mask@output"), v260, 4, v291, 64, a6);
                                                      else
                                                        v262 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v255, v261, (uint64_t)CFSTR("salient_person_prior_mask@output"), v260, 4, v291, 1, a6);
                                                      v264 = (void *)v262;
                                                      if (v262)
                                                      {
                                                        v290[0] = v58;
                                                        v290[1] = v67;
                                                        v290[2] = v281;
                                                        v290[3] = v85;
                                                        v290[4] = v280;
                                                        v290[5] = v283;
                                                        v290[6] = v282;
                                                        v290[7] = v279;
                                                        v290[8] = v278;
                                                        v290[9] = v277;
                                                        v290[10] = v276;
                                                        v290[11] = v275;
                                                        v290[12] = v274;
                                                        v290[13] = v166;
                                                        v290[14] = v273;
                                                        v290[15] = v285;
                                                        v290[16] = v284;
                                                        v290[17] = v272;
                                                        v290[18] = v269;
                                                        v290[19] = v268;
                                                        v290[20] = v267;
                                                        v290[21] = v266;
                                                        v290[22] = v271;
                                                        v290[23] = v270;
                                                        v290[24] = v286;
                                                        v290[25] = v262;
                                                        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v263, (uint64_t)v290, 26);
                                                        v265 = 0;
                                                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                                                      }
                                                      else
                                                      {
                                                        v265 = 1;
                                                      }

                                                    }
                                                    else
                                                    {
                                                      v265 = 1;
                                                    }

                                                  }
                                                  else
                                                  {
                                                    v265 = 1;
                                                  }

                                                }
                                                else
                                                {
                                                  v265 = 1;
                                                }

                                              }
                                              else
                                              {
                                                v265 = 1;
                                              }

                                            }
                                            else
                                            {
                                              v265 = 1;
                                            }

                                          }
                                          else
                                          {
                                            v265 = 1;
                                          }

                                        }
                                        else
                                        {
                                          v265 = 1;
                                        }

                                      }
                                      else
                                      {
                                        v265 = 1;
                                      }

                                    }
                                    else
                                    {
                                      v265 = 1;
                                    }

                                  }
                                  else
                                  {
                                    v265 = 1;
                                  }

                                }
                                else
                                {
                                  v265 = 1;
                                }

                              }
                              else
                              {
                                v265 = 1;
                              }

                            }
                            else
                            {
                              v265 = 1;
                            }

                          }
                          else
                          {
                            v265 = 1;
                          }
                          v76 = v281;

                          v141 = v276;
                        }
                        else
                        {
                          v265 = 1;
                          v76 = v281;
                        }

                        v133 = v277;
                      }
                      else
                      {
                        v265 = 1;
                        v76 = v281;
                      }

                      v125 = v278;
                    }
                    else
                    {
                      v265 = 1;
                      v76 = v281;
                    }

                    v117 = v279;
                  }
                  else
                  {
                    v265 = 1;
                    v76 = v281;
                  }

                  v109 = v282;
                }
                else
                {
                  v265 = 1;
                  v76 = v281;
                }

                v101 = v283;
              }
              else
              {
                v265 = 1;
                v76 = v281;
              }

              v93 = v280;
            }
            else
            {
              v265 = 1;
              v76 = v281;
            }

          }
          else
          {
            v265 = 1;
          }

        }
        else
        {
          v265 = 1;
        }

        if (v265)
          goto LABEL_10;
      }
      LOBYTE(a6) = 1;
      goto LABEL_11;
    }
  }
  if (v289)
    AcANSTDestroy((uint64_t)v289);
  if (a6)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v322[0] = *MEMORY[0x24BDD0BA0];
    v323[0] = CFSTR("Unable to get underlying network metadata.");
    v322[1] = CFSTR("AcReturn");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v323[1] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)v323, v322, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v19, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_12:

  return (char)a6;
}

- (id)newPostprocessorWithError:(id *)a3
{
  _ANSTISPInferencePostprocessorV1 *v4;

  v4 = [_ANSTISPInferencePostprocessorV1 alloc];
  return (id)MEMORY[0x24BEDD108](v4, sel_initWithInferenceDescriptor_error_, self);
}

- (id)inputImageDescriptor
{
  return (id)MEMORY[0x24BEDD108](self, sel_inputPixelBufferDescriptorNamed_, CFSTR("input_image"));
}

- (id)inputLastMaskDescriptor
{
  return (id)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("last_mask"));
}

- (id)inputLastSalientMaskDescriptor
{
  return (id)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("last_salient_mask"));
}

- (id)outputLogitsDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputCenternessDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputBoxRegressionDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputFacePoseDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputFaceAttributesDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSkinToneDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSubjectIDMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHandLogitsDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHandCenternessDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHandBoxRegressionDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHandPoseDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSalientFaceLogitsDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSalientFaceCenternessDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSalientFaceBoxRegressionDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputFaceLandmarkDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHandAssociationDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSmudgeConfidenceDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputPriorMaskMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputPersonMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSalientPersonMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSkinMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputHairMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSkyMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSemanticMapDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSaliencyDescriptor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_outputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v3, v4, 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)outputSalientPersonPriorMaskDescriptor
{
  return (id)MEMORY[0x24BEDD108](self, sel_outputTensorDescriptorNamed_, CFSTR("salient_person_prior_mask@output"));
}

@end
