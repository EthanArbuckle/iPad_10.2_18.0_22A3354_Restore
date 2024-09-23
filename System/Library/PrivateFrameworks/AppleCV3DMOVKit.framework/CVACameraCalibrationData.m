@implementation CVACameraCalibrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EEC0 != -1)
    dispatch_once(&qword_254A6EEC0, &unk_24CA35FA0);
  return (id)qword_254A6EEB8;
}

- (void)updateProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "intrinsicMatrix");
  -[CVACameraCalibrationData setIntrinsicMatrix:](self, "setIntrinsicMatrix:");
  objc_msgSend(v4, "intrinsicMatrixReferenceDimensions");
  -[CVACameraCalibrationData setIntrinsicMatrixReferenceDimensions:](self, "setIntrinsicMatrixReferenceDimensions:");
  objc_msgSend(v4, "extrinsicMatrix");
  -[CVACameraCalibrationData setExtrinsicMatrix:](self, "setExtrinsicMatrix:");
  objc_msgSend(v4, "pixelSize");
  -[CVACameraCalibrationData setPixelSize:](self, "setPixelSize:");
  objc_msgSend(v4, "lensDistortionLookupTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CVACameraCalibrationData setLensDistortionLookupTable:](self, "setLensDistortionLookupTable:", v5);

  objc_msgSend(v4, "inverseLensDistortionLookupTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CVACameraCalibrationData setInverseLensDistortionLookupTable:](self, "setInverseLensDistortionLookupTable:", v6);

  objc_msgSend(v4, "lensDistortionCenter");
  v8 = v7;
  v10 = v9;

  -[CVACameraCalibrationData setLensDistortionCenter:](self, "setLensDistortionCenter:", v8, v10);
}

- (CVACameraCalibrationData)initWithAVCameraCalibrationData:(id)a3 timestamp:(double)a4 streamID:(id)a5
{
  id v8;
  id v9;
  CVACameraCalibrationData *v10;
  CVACameraCalibrationData *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CVACameraCalibrationData;
  v10 = -[CVACameraCalibrationData init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CVACameraCalibrationData setStreamID:](v10, "setStreamID:", v9);
    -[CVACameraCalibrationData setTimestamp:](v11, "setTimestamp:", a4);
    -[CVACameraCalibrationData updateProperties:](v11, "updateProperties:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "cameraCalibrationDataDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CVACameraCalibrationData setCalibrationDictionary:](v11, "setCalibrationDictionary:", v12);

    }
  }

  return v11;
}

- (CVACameraCalibrationData)initWithCoder:(id)a3
{
  id v4;
  CVACameraCalibrationData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  float v64;
  double v65;
  void *v66;
  float v67;
  void *v68;
  void *v69;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  double v79;
  unsigned int v80;
  unsigned int v81;
  double v82;
  unsigned int v83;
  unsigned int v84;
  double v85;
  unsigned int v86;
  double v87;
  unsigned int v88;
  double v89;
  id v90;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)CVACameraCalibrationData;
  v5 = -[CVACameraCalibrationData init](&v91, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("si"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibrationData setStreamID:](v5, "setStreamID:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACameraCalibrationData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("d"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibrationData setCalibrationDictionary:](v5, "setCalibrationDictionary:", v8);

    -[CVACameraCalibrationData calibrationDictionary](v5, "calibrationDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("im"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (v14)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v86 = v16;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v80 = v18;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v87 = COERCE_DOUBLE(__PAIR64__(v80, v86));

        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v81 = v21;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v75 = v23;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "floatValue");
        v82 = COERCE_DOUBLE(__PAIR64__(v75, v81));

        objc_msgSend(v13, "objectAtIndexedSubscript:", 6);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        v76 = v26;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v72 = v28;

        objc_msgSend(v13, "objectAtIndexedSubscript:", 8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");

        -[CVACameraCalibrationData setIntrinsicMatrix:](v5, "setIntrinsicMatrix:", v87, v82, COERCE_DOUBLE(__PAIR64__(v72, v76)));
      }
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("imrd"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "floatValue");
        v34 = v33;
        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        -[CVACameraCalibrationData setIntrinsicMatrixReferenceDimensions:](v5, "setIntrinsicMatrixReferenceDimensions:", v34, v36);

      }
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("em"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v88 = v40;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        v83 = v42;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "floatValue");
        v89 = COERCE_DOUBLE(__PAIR64__(v83, v88));

        objc_msgSend(v38, "objectAtIndexedSubscript:", 3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "floatValue");
        v84 = v45;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 4);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "floatValue");
        v77 = v47;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 5);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "floatValue");
        v85 = COERCE_DOUBLE(__PAIR64__(v77, v84));

        objc_msgSend(v38, "objectAtIndexedSubscript:", 6);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        v78 = v50;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 7);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "floatValue");
        v73 = v52;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 8);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "floatValue");
        v79 = COERCE_DOUBLE(__PAIR64__(v73, v78));

        objc_msgSend(v38, "objectAtIndexedSubscript:", 9);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "floatValue");
        v74 = v55;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 10);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "floatValue");
        v71 = v57;

        objc_msgSend(v38, "objectAtIndexedSubscript:", 11);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "floatValue");

        -[CVACameraCalibrationData setExtrinsicMatrix:](v5, "setExtrinsicMatrix:", v89, v85, v79, COERCE_DOUBLE(__PAIR64__(v71, v74)));
      }
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ps"));
      -[CVACameraCalibrationData setPixelSize:](v5, "setPixelSize:");
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ldlt"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CVACameraCalibrationData setLensDistortionLookupTable:](v5, "setLensDistortionLookupTable:", v59);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ildlt"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[CVACameraCalibrationData setInverseLensDistortionLookupTable:](v5, "setInverseLensDistortionLookupTable:", v60);

      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ldc"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61)
      {
        objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "floatValue");
        v65 = v64;
        objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "floatValue");
        -[CVACameraCalibrationData setLensDistortionCenter:](v5, "setLensDistortionCenter:", v65, v67);

      }
      goto LABEL_18;
    }
    if (objc_msgSend(MEMORY[0x24BDB2430], "instancesRespondToSelector:", sel_initWithCameraCalibrationDataDictionary_error_))
    {
      v10 = objc_alloc(MEMORY[0x24BDB2430]);
      -[CVACameraCalibrationData calibrationDictionary](v5, "calibrationDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      v12 = (void *)objc_msgSend(v10, "initWithCameraCalibrationDataDictionary:error:", v11, &v90);
      v13 = v90;
      -[CVACameraCalibrationData setCalibrationData:](v5, "setCalibrationData:", v12);

      if (v13)
      {
        NSLog(CFSTR("Failed to recreate calibration data : %@"), v13);
        NSLog(CFSTR("Failed to recreate calibration data : %@"), v13);
LABEL_18:

        objc_autoreleasePoolPop(v6);
        goto LABEL_19;
      }
      -[CVACameraCalibrationData calibrationData](v5, "calibrationData");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[CVACameraCalibrationData updateProperties:](v5, "updateProperties:", v68);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "operatingSystemVersionString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Failed to recreate calibration data : OS %@"), v69);

    }
    -[CVACameraCalibrationData calibrationData](v5, "calibrationData");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibrationData updateProperties:](v5, "updateProperties:", v13);
    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
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
  _QWORD v68[2];
  _QWORD v69[12];
  _QWORD v70[2];
  _QWORD v71[11];

  v71[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x212BC8864]();
  -[CVACameraCalibrationData streamID](self, "streamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("si"));

  -[CVACameraCalibrationData timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("t"));
  -[CVACameraCalibrationData calibrationDictionary](self, "calibrationDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CVACameraCalibrationData calibrationDictionary](self, "calibrationDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("d"));

  }
  else
  {
    LODWORD(v8) = *(_DWORD *)self->_anon_60;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v64;
    LODWORD(v10) = *(_DWORD *)&self->_anon_60[4];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v62;
    LODWORD(v11) = *(_DWORD *)&self->_anon_60[8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v60;
    LODWORD(v12) = *(_DWORD *)&self->_anon_60[16];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
    v67 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v13;
    LODWORD(v14) = *(_DWORD *)&self->_anon_60[20];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v15;
    LODWORD(v16) = *(_DWORD *)&self->_anon_60[24];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v71[5] = v17;
    LODWORD(v18) = *(_DWORD *)&self->_anon_60[32];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v71[6] = v19;
    LODWORD(v20) = *(_DWORD *)&self->_anon_60[36];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v71[7] = v21;
    LODWORD(v22) = *(_DWORD *)&self->_anon_60[40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71[8] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 9);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "encodeObject:forKey:", v66, CFSTR("im"));
    v24 = (void *)MEMORY[0x24BDD16E0];
    -[CVACameraCalibrationData intrinsicMatrixReferenceDimensions](self, "intrinsicMatrixReferenceDimensions");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v25;
    v26 = (void *)MEMORY[0x24BDD16E0];
    -[CVACameraCalibrationData intrinsicMatrixReferenceDimensions](self, "intrinsicMatrixReferenceDimensions");
    objc_msgSend(v26, "numberWithDouble:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("imrd"));

    LODWORD(v30) = self[1].super.isa;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v65;
    LODWORD(v31) = HIDWORD(self[1].super.isa);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v63;
    *(float *)&v32 = self[1]._pixelSize;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v61;
    LODWORD(v33) = self[1]._streamID;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v59;
    LODWORD(v34) = HIDWORD(self[1]._streamID);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v58;
    LODWORD(v35) = LODWORD(self[1]._timestamp);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v36;
    LODWORD(v37) = self[1]._calibrationDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v38;
    LODWORD(v39) = HIDWORD(self[1]._calibrationDictionary);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v40;
    LODWORD(v41) = self[1]._calibrationData;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69[8] = v42;
    LODWORD(v43) = self[1]._lensDistortionLookupTable;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v44;
    LODWORD(v45) = HIDWORD(self[1]._lensDistortionLookupTable);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[10] = v46;
    LODWORD(v47) = self[1]._inverseLensDistortionLookupTable;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v69[11] = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("em"));
    -[CVACameraCalibrationData pixelSize](self, "pixelSize");
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("ps"));
    -[CVACameraCalibrationData lensDistortionLookupTable](self, "lensDistortionLookupTable");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("ldlt"));

    -[CVACameraCalibrationData inverseLensDistortionLookupTable](self, "inverseLensDistortionLookupTable");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v51, CFSTR("ildlt"));

    v52 = (void *)MEMORY[0x24BDD16E0];
    -[CVACameraCalibrationData lensDistortionCenter](self, "lensDistortionCenter");
    objc_msgSend(v52, "numberWithDouble:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v53;
    v54 = (void *)MEMORY[0x24BDD16E0];
    -[CVACameraCalibrationData lensDistortionCenter](self, "lensDistortionCenter");
    objc_msgSend(v54, "numberWithDouble:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v57, CFSTR("ldc"));

    v5 = v67;
  }
  objc_autoreleasePoolPop(v5);

}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_streamID, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSDictionary)calibrationDictionary
{
  return self->_calibrationDictionary;
}

- (void)setCalibrationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_calibrationDictionary, a3);
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
  objc_storeStrong((id *)&self->_calibrationData, a3);
}

- (__n128)intrinsicMatrix
{
  return a1[6];
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  return result;
}

- (CGSize)intrinsicMatrixReferenceDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicMatrixReferenceDimensions.width;
  height = self->_intrinsicMatrixReferenceDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIntrinsicMatrixReferenceDimensions:(CGSize)a3
{
  self->_intrinsicMatrixReferenceDimensions = a3;
}

- (__n128)extrinsicMatrix
{
  return a1[9];
}

- (__n128)setExtrinsicMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (void)setPixelSize:(float)a3
{
  self->_pixelSize = a3;
}

- (NSData)lensDistortionLookupTable
{
  return self->_lensDistortionLookupTable;
}

- (void)setLensDistortionLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->_lensDistortionLookupTable, a3);
}

- (NSData)inverseLensDistortionLookupTable
{
  return self->_inverseLensDistortionLookupTable;
}

- (void)setInverseLensDistortionLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, a3);
}

- (CGPoint)lensDistortionCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_lensDistortionCenter.x;
  y = self->_lensDistortionCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLensDistortionCenter:(CGPoint)a3
{
  self->_lensDistortionCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, 0);
  objc_storeStrong((id *)&self->_lensDistortionLookupTable, 0);
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_calibrationDictionary, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
}

@end
