@implementation ADPearlColorInFieldCalibrationResult

- (id)dictionaryRepresentation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  id v45;
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
  _QWORD v71[34];
  _QWORD v72[36];

  v72[34] = *MEMORY[0x24BDAC8D0];
  ADCommonUtils::matrixNxMToArrayColumnFirst<4ul,3ul,simd_float4x3>(&self[1]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = CFSTR("execute");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_executed);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v69;
  v71[1] = CFSTR("deltaRotationX");
  *(float *)&v3 = self->_deltaRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v68;
  v71[2] = CFSTR("deltaRotationY");
  *(float *)&v4 = self->_deltaRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v67;
  v71[3] = CFSTR("deltaRotationZ");
  *(float *)&v5 = self->_deltaRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v66;
  v71[4] = CFSTR("STDX");
  *(float *)&v6 = self->_stdX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v65;
  v71[5] = CFSTR("STDY");
  *(float *)&v7 = self->_stdY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v64;
  v71[6] = CFSTR("STDZ");
  *(float *)&v8 = self->_stdZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v63;
  v71[7] = CFSTR("absoluteRotationX");
  *(float *)&v9 = self->_absoluteRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v62;
  v71[8] = CFSTR("absoluteRotationY");
  *(float *)&v10 = self->_absoluteRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v61;
  v71[9] = CFSTR("absoluteRotationZ");
  *(float *)&v11 = self->_absoluteRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v60;
  v71[10] = CFSTR("factoryRotationX");
  *(float *)&v12 = self->_factoryRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v59;
  v71[11] = CFSTR("factoryRotationY");
  *(float *)&v13 = self->_factoryRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v72[11] = v58;
  v71[12] = CFSTR("factoryRotationZ");
  *(float *)&v14 = self->_factoryRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[12] = v57;
  v71[13] = CFSTR("absoluteRotationPostISFX");
  *(float *)&v15 = self->_absoluteRotationPostISFX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72[13] = v56;
  v71[14] = CFSTR("absoluteRotationPostISFY");
  *(float *)&v16 = self->_absoluteRotationPostISFY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v72[14] = v55;
  v71[15] = CFSTR("absoluteRotationPostISFZ");
  *(float *)&v17 = self->_absoluteRotationPostISFZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72[15] = v54;
  v71[16] = CFSTR("confidence");
  *(float *)&v18 = self->_confidence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v72[16] = v53;
  v71[17] = CFSTR("preRelative2FactoryX");
  *(float *)&v19 = self->_preRelative2FactoryX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v72[17] = v52;
  v71[18] = CFSTR("preRelative2FactoryY");
  *(float *)&v20 = self->_preRelative2FactoryY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v72[18] = v51;
  v71[19] = CFSTR("preRelative2FactoryZ");
  *(float *)&v21 = self->_preRelative2FactoryZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[19] = v50;
  v71[20] = CFSTR("postRelative2FactoryX");
  *(float *)&v22 = self->_postRelative2FactoryX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v72[20] = v49;
  v71[21] = CFSTR("postRelative2FactoryY");
  *(float *)&v23 = self->_postRelative2FactoryY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v72[21] = v48;
  v71[22] = CFSTR("postRelative2FactoryZ");
  *(float *)&v24 = self->_postRelative2FactoryZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v72[22] = v47;
  v71[23] = CFSTR("postRelative2PrevX");
  *(float *)&v25 = self->_postRelative2PrevX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v72[23] = v46;
  v71[24] = CFSTR("postRelative2PrevY");
  *(float *)&v26 = self->_postRelative2PrevY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72[24] = v27;
  v71[25] = CFSTR("postRelative2PrevZ");
  *(float *)&v28 = self->_postRelative2PrevZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[25] = v29;
  v71[26] = CFSTR("motionRotationX");
  LODWORD(v30) = *(_DWORD *)self->_motionRotation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v72[26] = v31;
  v71[27] = CFSTR("motionRotationY");
  LODWORD(v32) = *(_DWORD *)&self->_motionRotation[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[27] = v33;
  v71[28] = CFSTR("motionRotationZ");
  LODWORD(v34) = *(_DWORD *)&self->_motionRotation[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[28] = v35;
  v71[29] = CFSTR("motionTranslationX");
  LODWORD(v36) = *(_DWORD *)self->_motionTranslation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v72[29] = v37;
  v71[30] = CFSTR("motionTranslationY");
  LODWORD(v38) = *(_DWORD *)&self->_motionTranslation[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[30] = v39;
  v71[31] = CFSTR("motionTranslationZ");
  LODWORD(v40) = *(_DWORD *)&self->_motionTranslation[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v72[31] = v41;
  v71[32] = CFSTR("validDepthPercentage");
  *(float *)&v42 = self->_validDepthPercentage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[33] = CFSTR("pearlToColorExtrinsics");
  v72[32] = v43;
  v72[33] = v70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 34);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (ADPearlColorInFieldCalibrationResult)initWithDictionary:(id)a3
{
  id v4;
  ADPearlColorInFieldCalibrationResult *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  uint64_t v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  objc_super v111;

  v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)ADPearlColorInFieldCalibrationResult;
  v5 = -[ADPearlColorInFieldCalibrationResult init](&v111, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pearlToColorExtrinsics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v110 = v10;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v106 = v12;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v109 = v17;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v105 = v19;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v108 = v24;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      v104 = v26;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      v107 = v31;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v103 = v33;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "floatValue");
      v36 = v35;

      *(_DWORD *)&v5[1]._executed = v15;
      v5[1].super.isa = (Class)__PAIR64__(v106, v110);
      v5[1]._stdX = v22;
      *(_QWORD *)&v5[1]._deltaRotationY = __PAIR64__(v105, v109);
      v5[1]._absoluteRotationY = v29;
      *(_QWORD *)&v5[1]._stdZ = __PAIR64__(v104, v108);
      v5[1]._factoryRotationZ = v36;
      *(_QWORD *)&v5[1]._factoryRotationX = __PAIR64__(v103, v107);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("execute"), v103);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_executed = objc_msgSend(v37, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationX"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    *(float *)&v39 = v39;
    v5->_deltaRotationX = *(float *)&v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationY"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    *(float *)&v41 = v41;
    v5->_deltaRotationY = *(float *)&v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationZ"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    *(float *)&v43 = v43;
    v5->_deltaRotationZ = *(float *)&v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDX"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    *(float *)&v45 = v45;
    v5->_stdX = *(float *)&v45;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDY"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    *(float *)&v47 = v47;
    v5->_stdY = *(float *)&v47;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDZ"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    *(float *)&v49 = v49;
    v5->_stdZ = *(float *)&v49;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationX"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    *(float *)&v51 = v51;
    v5->_absoluteRotationX = *(float *)&v51;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationY"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    *(float *)&v53 = v53;
    v5->_absoluteRotationY = *(float *)&v53;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationZ"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    *(float *)&v55 = v55;
    v5->_absoluteRotationZ = *(float *)&v55;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationX"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    *(float *)&v57 = v57;
    v5->_factoryRotationX = *(float *)&v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationY"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    *(float *)&v59 = v59;
    v5->_factoryRotationY = *(float *)&v59;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationZ"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    *(float *)&v61 = v61;
    v5->_factoryRotationZ = *(float *)&v61;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFX"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    *(float *)&v63 = v63;
    v5->_absoluteRotationPostISFX = *(float *)&v63;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFY"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "doubleValue");
    *(float *)&v65 = v65;
    v5->_absoluteRotationPostISFY = *(float *)&v65;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFZ"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "doubleValue");
    *(float *)&v67 = v67;
    v5->_absoluteRotationPostISFZ = *(float *)&v67;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValue");
    *(float *)&v69 = v69;
    v5->_confidence = *(float *)&v69;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryX"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "doubleValue");
    *(float *)&v71 = v71;
    v5->_preRelative2FactoryX = *(float *)&v71;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryY"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    *(float *)&v73 = v73;
    v5->_preRelative2FactoryY = *(float *)&v73;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryZ"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "doubleValue");
    *(float *)&v75 = v75;
    v5->_preRelative2FactoryZ = *(float *)&v75;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryX"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "doubleValue");
    *(float *)&v77 = v77;
    v5->_postRelative2FactoryX = *(float *)&v77;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryY"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "doubleValue");
    *(float *)&v79 = v79;
    v5->_postRelative2FactoryY = *(float *)&v79;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryZ"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "doubleValue");
    *(float *)&v81 = v81;
    v5->_postRelative2FactoryZ = *(float *)&v81;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevX"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "doubleValue");
    *(float *)&v83 = v83;
    v5->_postRelative2PrevX = *(float *)&v83;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevY"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "doubleValue");
    *(float *)&v85 = v85;
    v5->_postRelative2PrevY = *(float *)&v85;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevZ"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "doubleValue");
    *(float *)&v87 = v87;
    v5->_postRelative2PrevZ = *(float *)&v87;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionRotationX"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "doubleValue");
    *(float *)&v89 = v89;
    *(_DWORD *)v5->_motionRotation = LODWORD(v89);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionRotationY"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "doubleValue");
    *(float *)&v91 = v91;
    *(_DWORD *)&v5->_motionRotation[4] = LODWORD(v91);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionRotationZ"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "doubleValue");
    *(float *)&v93 = v93;
    *(_DWORD *)&v5->_motionRotation[8] = LODWORD(v93);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionTranslationX"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "doubleValue");
    *(float *)&v95 = v95;
    *(_DWORD *)v5->_motionTranslation = LODWORD(v95);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionTranslationY"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "doubleValue");
    *(float *)&v97 = v97;
    *(_DWORD *)&v5->_motionTranslation[4] = LODWORD(v97);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("motionTranslationZ"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "doubleValue");
    *(float *)&v99 = v99;
    *(_DWORD *)&v5->_motionTranslation[8] = LODWORD(v99);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validDepthPercentage"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "doubleValue");
    *(float *)&v101 = v101;
    v5->_validDepthPercentage = *(float *)&v101;

  }
  return v5;
}

- (BOOL)executed
{
  return self->_executed;
}

- (void)setExecuted:(BOOL)a3
{
  self->_executed = a3;
}

- (__n128)pearlToColorExtrinsics
{
  return a1[10];
}

- (__n128)setPearlToColorExtrinsics:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  result[13] = a5;
  return result;
}

- (float)deltaRotationX
{
  return self->_deltaRotationX;
}

- (void)setDeltaRotationX:(float)a3
{
  self->_deltaRotationX = a3;
}

- (float)deltaRotationY
{
  return self->_deltaRotationY;
}

- (void)setDeltaRotationY:(float)a3
{
  self->_deltaRotationY = a3;
}

- (float)deltaRotationZ
{
  return self->_deltaRotationZ;
}

- (void)setDeltaRotationZ:(float)a3
{
  self->_deltaRotationZ = a3;
}

- (float)stdX
{
  return self->_stdX;
}

- (void)setStdX:(float)a3
{
  self->_stdX = a3;
}

- (float)stdY
{
  return self->_stdY;
}

- (void)setStdY:(float)a3
{
  self->_stdY = a3;
}

- (float)stdZ
{
  return self->_stdZ;
}

- (void)setStdZ:(float)a3
{
  self->_stdZ = a3;
}

- (float)absoluteRotationX
{
  return self->_absoluteRotationX;
}

- (void)setAbsoluteRotationX:(float)a3
{
  self->_absoluteRotationX = a3;
}

- (float)absoluteRotationY
{
  return self->_absoluteRotationY;
}

- (void)setAbsoluteRotationY:(float)a3
{
  self->_absoluteRotationY = a3;
}

- (float)absoluteRotationZ
{
  return self->_absoluteRotationZ;
}

- (void)setAbsoluteRotationZ:(float)a3
{
  self->_absoluteRotationZ = a3;
}

- (float)factoryRotationX
{
  return self->_factoryRotationX;
}

- (void)setFactoryRotationX:(float)a3
{
  self->_factoryRotationX = a3;
}

- (float)factoryRotationY
{
  return self->_factoryRotationY;
}

- (void)setFactoryRotationY:(float)a3
{
  self->_factoryRotationY = a3;
}

- (float)factoryRotationZ
{
  return self->_factoryRotationZ;
}

- (void)setFactoryRotationZ:(float)a3
{
  self->_factoryRotationZ = a3;
}

- (float)absoluteRotationPostISFX
{
  return self->_absoluteRotationPostISFX;
}

- (void)setAbsoluteRotationPostISFX:(float)a3
{
  self->_absoluteRotationPostISFX = a3;
}

- (float)absoluteRotationPostISFY
{
  return self->_absoluteRotationPostISFY;
}

- (void)setAbsoluteRotationPostISFY:(float)a3
{
  self->_absoluteRotationPostISFY = a3;
}

- (float)absoluteRotationPostISFZ
{
  return self->_absoluteRotationPostISFZ;
}

- (void)setAbsoluteRotationPostISFZ:(float)a3
{
  self->_absoluteRotationPostISFZ = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)preRelative2FactoryX
{
  return self->_preRelative2FactoryX;
}

- (void)setPreRelative2FactoryX:(float)a3
{
  self->_preRelative2FactoryX = a3;
}

- (float)preRelative2FactoryY
{
  return self->_preRelative2FactoryY;
}

- (void)setPreRelative2FactoryY:(float)a3
{
  self->_preRelative2FactoryY = a3;
}

- (float)preRelative2FactoryZ
{
  return self->_preRelative2FactoryZ;
}

- (void)setPreRelative2FactoryZ:(float)a3
{
  self->_preRelative2FactoryZ = a3;
}

- (float)postRelative2FactoryX
{
  return self->_postRelative2FactoryX;
}

- (void)setPostRelative2FactoryX:(float)a3
{
  self->_postRelative2FactoryX = a3;
}

- (float)postRelative2FactoryY
{
  return self->_postRelative2FactoryY;
}

- (void)setPostRelative2FactoryY:(float)a3
{
  self->_postRelative2FactoryY = a3;
}

- (float)postRelative2FactoryZ
{
  return self->_postRelative2FactoryZ;
}

- (void)setPostRelative2FactoryZ:(float)a3
{
  self->_postRelative2FactoryZ = a3;
}

- (float)postRelative2PrevX
{
  return self->_postRelative2PrevX;
}

- (void)setPostRelative2PrevX:(float)a3
{
  self->_postRelative2PrevX = a3;
}

- (float)postRelative2PrevY
{
  return self->_postRelative2PrevY;
}

- (void)setPostRelative2PrevY:(float)a3
{
  self->_postRelative2PrevY = a3;
}

- (float)postRelative2PrevZ
{
  return self->_postRelative2PrevZ;
}

- (void)setPostRelative2PrevZ:(float)a3
{
  self->_postRelative2PrevZ = a3;
}

- (__n128)motionRotation
{
  return a1[8];
}

- (void)setMotionRotation:(ADPearlColorInFieldCalibrationResult *)self
{
  __int128 v2;

  *(_OWORD *)self->_motionRotation = v2;
}

- (__n128)motionTranslation
{
  return a1[9];
}

- (void)setMotionTranslation:(ADPearlColorInFieldCalibrationResult *)self
{
  __int128 v2;

  *(_OWORD *)self->_motionTranslation = v2;
}

- (float)validDepthPercentage
{
  return self->_validDepthPercentage;
}

- (void)setValidDepthPercentage:(float)a3
{
  self->_validDepthPercentage = a3;
}

@end
