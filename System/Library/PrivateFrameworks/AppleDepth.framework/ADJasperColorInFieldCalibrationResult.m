@implementation ADJasperColorInFieldCalibrationResult

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
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  _QWORD v60[29];
  _QWORD v61[31];

  v61[29] = *MEMORY[0x24BDAC8D0];
  ADCommonUtils::matrixNxMToArrayColumnFirst<4ul,3ul,simd_float4x3>(&self[1]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = CFSTR("execute");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_executed);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v58;
  v60[1] = CFSTR("deltaRotationX");
  *(float *)&v3 = self->_deltaRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v57;
  v60[2] = CFSTR("deltaRotationY");
  *(float *)&v4 = self->_deltaRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v56;
  v60[3] = CFSTR("deltaRotationZ");
  *(float *)&v5 = self->_deltaRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v55;
  v60[4] = CFSTR("STDX");
  *(float *)&v6 = self->_stdX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v54;
  v60[5] = CFSTR("STDY");
  *(float *)&v7 = self->_stdY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v53;
  v60[6] = CFSTR("STDZ");
  *(float *)&v8 = self->_stdZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v52;
  v60[7] = CFSTR("absoluteRotationX");
  *(float *)&v9 = self->_absoluteRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v51;
  v60[8] = CFSTR("absoluteRotationY");
  *(float *)&v10 = self->_absoluteRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v50;
  v60[9] = CFSTR("absoluteRotationZ");
  *(float *)&v11 = self->_absoluteRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v49;
  v60[10] = CFSTR("factoryRotationX");
  *(float *)&v12 = self->_factoryRotationX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v48;
  v60[11] = CFSTR("factoryRotationY");
  *(float *)&v13 = self->_factoryRotationY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[11] = v47;
  v60[12] = CFSTR("factoryRotationZ");
  *(float *)&v14 = self->_factoryRotationZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[12] = v46;
  v60[13] = CFSTR("absoluteRotationPostISFX");
  *(float *)&v15 = self->_absoluteRotationPostISFX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[13] = v45;
  v60[14] = CFSTR("absoluteRotationPostISFY");
  *(float *)&v16 = self->_absoluteRotationPostISFY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61[14] = v44;
  v60[15] = CFSTR("absoluteRotationPostISFZ");
  *(float *)&v17 = self->_absoluteRotationPostISFZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61[15] = v43;
  v60[16] = CFSTR("confidence");
  *(float *)&v18 = self->_confidence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[16] = v42;
  v60[17] = CFSTR("preRelative2FactoryX");
  *(float *)&v19 = self->_preRelative2FactoryX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[17] = v41;
  v60[18] = CFSTR("preRelative2FactoryY");
  *(float *)&v20 = self->_preRelative2FactoryY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[18] = v40;
  v60[19] = CFSTR("preRelative2FactoryZ");
  *(float *)&v21 = self->_preRelative2FactoryZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[19] = v22;
  v60[20] = CFSTR("postRelative2FactoryX");
  *(float *)&v23 = self->_postRelative2FactoryX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[20] = v24;
  v60[21] = CFSTR("postRelative2FactoryY");
  *(float *)&v25 = self->_postRelative2FactoryY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61[21] = v26;
  v60[22] = CFSTR("postRelative2FactoryZ");
  *(float *)&v27 = self->_postRelative2FactoryZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v61[22] = v28;
  v60[23] = CFSTR("postRelative2PrevX");
  *(float *)&v29 = self->_postRelative2PrevX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[23] = v30;
  v60[24] = CFSTR("postRelative2PrevY");
  *(float *)&v31 = self->_postRelative2PrevY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v61[24] = v32;
  v60[25] = CFSTR("postRelative2PrevZ");
  *(float *)&v33 = self->_postRelative2PrevZ;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[25] = v34;
  v60[26] = CFSTR("executionStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_executionStatus);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v61[26] = v35;
  v60[27] = CFSTR("alpha");
  *(float *)&v36 = self->_alpha;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60[28] = CFSTR("jasperToColorExtrinsics");
  v61[27] = v37;
  v61[28] = v59;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 29);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (ADJasperColorInFieldCalibrationResult)initWithDictionary:(id)a3
{
  id v4;
  ADJasperColorInFieldCalibrationResult *v5;
  void *v6;
  void *v7;
  id v8;
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
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
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
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)ADJasperColorInFieldCalibrationResult;
  v5 = -[ADJasperColorInFieldCalibrationResult init](&v77, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jasperToColorExtrinsics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("execute"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_executed = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationX"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    *(float *)&v23 = v23;
    v5->_deltaRotationX = *(float *)&v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationY"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    *(float *)&v25 = v25;
    v5->_deltaRotationY = *(float *)&v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaRotationZ"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    *(float *)&v27 = v27;
    v5->_deltaRotationZ = *(float *)&v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDX"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    *(float *)&v29 = v29;
    v5->_stdX = *(float *)&v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDY"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    *(float *)&v31 = v31;
    v5->_stdY = *(float *)&v31;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STDZ"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    *(float *)&v33 = v33;
    v5->_stdZ = *(float *)&v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationX"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    *(float *)&v35 = v35;
    v5->_absoluteRotationX = *(float *)&v35;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationY"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    *(float *)&v37 = v37;
    v5->_absoluteRotationY = *(float *)&v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationZ"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    *(float *)&v39 = v39;
    v5->_absoluteRotationZ = *(float *)&v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationX"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    *(float *)&v41 = v41;
    v5->_factoryRotationX = *(float *)&v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationY"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    *(float *)&v43 = v43;
    v5->_factoryRotationY = *(float *)&v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factoryRotationZ"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    *(float *)&v45 = v45;
    v5->_factoryRotationZ = *(float *)&v45;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFX"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    *(float *)&v47 = v47;
    v5->_absoluteRotationPostISFX = *(float *)&v47;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFY"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    *(float *)&v49 = v49;
    v5->_absoluteRotationPostISFY = *(float *)&v49;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteRotationPostISFZ"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    *(float *)&v51 = v51;
    v5->_absoluteRotationPostISFZ = *(float *)&v51;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    *(float *)&v53 = v53;
    v5->_confidence = *(float *)&v53;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryX"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    *(float *)&v55 = v55;
    v5->_preRelative2FactoryX = *(float *)&v55;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryY"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    *(float *)&v57 = v57;
    v5->_preRelative2FactoryY = *(float *)&v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preRelative2FactoryZ"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    *(float *)&v59 = v59;
    v5->_preRelative2FactoryZ = *(float *)&v59;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryX"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    *(float *)&v61 = v61;
    v5->_postRelative2FactoryX = *(float *)&v61;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryY"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    *(float *)&v63 = v63;
    v5->_postRelative2FactoryY = *(float *)&v63;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2FactoryZ"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "doubleValue");
    *(float *)&v65 = v65;
    v5->_postRelative2FactoryZ = *(float *)&v65;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevX"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "doubleValue");
    *(float *)&v67 = v67;
    v5->_postRelative2PrevX = *(float *)&v67;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevY"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValue");
    *(float *)&v69 = v69;
    v5->_postRelative2PrevY = *(float *)&v69;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postRelative2PrevZ"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "doubleValue");
    *(float *)&v71 = v71;
    v5->_postRelative2PrevZ = *(float *)&v71;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionStatus"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    v5->_executionStatus = (uint64_t)v73;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alpha"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "doubleValue");
    *(float *)&v75 = v75;
    v5->_alpha = *(float *)&v75;

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

- (__n128)jasperToColorExtrinsics
{
  return a1[10];
}

- (__n128)setJasperToColorExtrinsics:(__n128)a3
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

- (int64_t)executionStatus
{
  return self->_executionStatus;
}

- (void)setExecutionStatus:(int64_t)a3
{
  self->_executionStatus = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

- (uint64_t)motionRotation
{
  return *(_QWORD *)(a1 + 128);
}

- (void)setMotionRotation:(ADJasperColorInFieldCalibrationResult *)self
{
  uint64_t v2;

  *(_QWORD *)self->_motionRotation = v2;
}

- (uint64_t)motionTranslation
{
  return *(_QWORD *)(a1 + 136);
}

- (void)setMotionTranslation:(ADJasperColorInFieldCalibrationResult *)self
{
  uint64_t v2;

  *(_QWORD *)self->_motionTranslation = v2;
}

- (char)validDepthPercentage
{
  return self->_validDepthPercentage;
}

- (void)setValidDepthPercentage:(char *)a3
{
  self->_validDepthPercentage = a3;
}

@end
