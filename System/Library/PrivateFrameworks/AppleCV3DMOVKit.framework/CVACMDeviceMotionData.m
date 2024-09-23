@implementation CVACMDeviceMotionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EF20[0] != -1)
    dispatch_once(qword_254A6EF20, &unk_24CA36060);
  return (id)qword_254A6EF18;
}

- (CVACMDeviceMotionData)init
{
  CVACMDeviceMotionData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CVACMDeviceMotionData;
  v2 = -[CVACMDeviceMotionData init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMDeviceMotionData setDeviceMotion:](v2, "setDeviceMotion:", v3);

  }
  return v2;
}

- (CVACMDeviceMotionData)initWithDictionary:(id)a3
{
  id v4;
  CVACMDeviceMotionData *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;

  v4 = a3;
  v5 = -[CVACMDeviceMotionData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qx"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quaternion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setX:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "quaternion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setY:", v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qz"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "quaternion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setZ:", v18);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qw"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "quaternion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setW:", v23);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ax"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    LODWORD(v23) = v27;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "userAcceleration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = LODWORD(v23);
    objc_msgSend(v29, "setX:", v30);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ay"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatValue");
    LODWORD(v23) = v32;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "userAcceleration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = LODWORD(v23);
    objc_msgSend(v34, "setY:", v35);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("az"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    LODWORD(v23) = v37;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "userAcceleration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = LODWORD(v23);
    objc_msgSend(v39, "setZ:", v40);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gx"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    LODWORD(v23) = v42;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "gravity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = LODWORD(v23);
    objc_msgSend(v44, "setX:", v45);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gy"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "floatValue");
    LODWORD(v23) = v47;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "gravity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = LODWORD(v23);
    objc_msgSend(v49, "setY:", v50);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gz"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "floatValue");
    LODWORD(v23) = v52;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "gravity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = LODWORD(v23);
    objc_msgSend(v54, "setZ:", v55);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rx"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "floatValue");
    LODWORD(v23) = v57;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rotationRate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = LODWORD(v23);
    objc_msgSend(v59, "setX:", v60);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ry"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "floatValue");
    LODWORD(v23) = v62;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "rotationRate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = LODWORD(v23);
    objc_msgSend(v64, "setY:", v65);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rz"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "floatValue");
    LODWORD(v23) = v67;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "rotationRate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v70) = LODWORD(v23);
    objc_msgSend(v69, "setZ:", v70);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mx"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "floatValue");
    LODWORD(v23) = v72;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "magneticField");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v75) = LODWORD(v23);
    objc_msgSend(v74, "setX:", v75);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("my"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "floatValue");
    LODWORD(v23) = v77;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "magneticField");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v80) = LODWORD(v23);
    objc_msgSend(v79, "setY:", v80);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mz"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "floatValue");
    LODWORD(v23) = v82;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "magneticField");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v85) = LODWORD(v23);
    objc_msgSend(v84, "setZ:", v85);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mc"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "intValue");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setMagneticFieldCalibrationLevel:", v87);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("yc"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "BOOLValue");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setDoingYawCorrection:", v90);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("be"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "BOOLValue");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setDoingBiasEstimation:", v93);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fv"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "BOOLValue");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setFusedWithVision:", v96);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "doubleValue");
    -[CVACMDeviceMotionData setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMDeviceMotionData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v99, "longLongValue"));

  }
  return v5;
}

- (CVACMDeviceMotionData)initWithCoder:(id)a3
{
  id v4;
  CVACMDeviceMotionData *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  int v27;
  void *v28;
  void *v29;
  double v30;
  int v31;
  void *v32;
  void *v33;
  double v34;
  int v35;
  void *v36;
  void *v37;
  double v38;
  int v39;
  void *v40;
  void *v41;
  double v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  int v47;
  void *v48;
  void *v49;
  double v50;
  int v51;
  void *v52;
  void *v53;
  double v54;
  int v55;
  void *v56;
  void *v57;
  double v58;
  int v59;
  void *v60;
  void *v61;
  double v62;
  int v63;
  void *v64;
  void *v65;
  double v66;
  int v67;
  void *v68;
  void *v69;
  double v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;

  v4 = a3;
  v5 = -[CVACMDeviceMotionData init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qx"));
    v8 = v7;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quaternion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setX:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qy"));
    v12 = v11;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "quaternion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setY:", v12);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qz"));
    v16 = v15;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "quaternion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZ:", v16);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qw"));
    v20 = v19;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "quaternion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setW:", v20);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ax"));
    LODWORD(v20) = v23;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "userAcceleration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = LODWORD(v20);
    objc_msgSend(v25, "setX:", v26);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ay"));
    LODWORD(v20) = v27;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "userAcceleration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = LODWORD(v20);
    objc_msgSend(v29, "setY:", v30);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("az"));
    LODWORD(v20) = v31;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "userAcceleration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = LODWORD(v20);
    objc_msgSend(v33, "setZ:", v34);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gx"));
    LODWORD(v20) = v35;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "gravity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = LODWORD(v20);
    objc_msgSend(v37, "setX:", v38);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gy"));
    LODWORD(v20) = v39;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "gravity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = LODWORD(v20);
    objc_msgSend(v41, "setY:", v42);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gz"));
    LODWORD(v20) = v43;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "gravity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = LODWORD(v20);
    objc_msgSend(v45, "setZ:", v46);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rx"));
    LODWORD(v20) = v47;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rotationRate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = LODWORD(v20);
    objc_msgSend(v49, "setX:", v50);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ry"));
    LODWORD(v20) = v51;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rotationRate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = LODWORD(v20);
    objc_msgSend(v53, "setY:", v54);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rz"));
    LODWORD(v20) = v55;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "rotationRate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = LODWORD(v20);
    objc_msgSend(v57, "setZ:", v58);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("mx"));
    LODWORD(v20) = v59;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "magneticField");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v62) = LODWORD(v20);
    objc_msgSend(v61, "setX:", v62);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("my"));
    LODWORD(v20) = v63;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "magneticField");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = LODWORD(v20);
    objc_msgSend(v65, "setY:", v66);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("mz"));
    LODWORD(v20) = v67;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "magneticField");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v70) = LODWORD(v20);
    objc_msgSend(v69, "setZ:", v70);

    v71 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("mc"));
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setMagneticFieldCalibrationLevel:", v71);

    v73 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("yc"));
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setDoingYawCorrection:", v73);

    v75 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("be"));
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setDoingBiasEstimation:", v75);

    v77 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fv"));
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFusedWithVision:", v77);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMDeviceMotionData setTimestamp:](v5, "setTimestamp:");
    -[CVACMDeviceMotionData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CVACMDeviceMotionData)initWithFastPathData:(id)a3
{
  id v4;
  CVACMDeviceMotionData *v5;
  CVACMMotionTypeDeviceMotionData *v6;
  uint64_t v7;
  uint64_t v8;
  CVACMDeviceMotionData *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CVACMDeviceMotionData;
  v5 = -[CVACMDeviceMotionData init](&v11, sel_init);
  if (v5)
  {
    v6 = -[CVACMMotionTypeDeviceMotionData initWithFastPathData:]([CVACMMotionTypeDeviceMotionData alloc], "initWithFastPathData:", v4);
    -[CVACMDeviceMotionData setDeviceMotion:](v5, "setDeviceMotion:", v6);

    v7 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (*(_WORD *)v7 != 3)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v8 = v7;
    -[CVACMDeviceMotionData setTimestamp:](v5, "setTimestamp:", *(double *)(v7 + 16));
    -[CVACMDeviceMotionData setSyncTimestamp:](v5, "setSyncTimestamp:", *(_QWORD *)(v8 + 8));
  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quaternion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "x");
  objc_msgSend(v41, "encodeDouble:forKey:", CFSTR("qx"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quaternion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "y");
  objc_msgSend(v41, "encodeDouble:forKey:", CFSTR("qy"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quaternion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "z");
  objc_msgSend(v41, "encodeDouble:forKey:", CFSTR("qz"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "quaternion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "w");
  objc_msgSend(v41, "encodeDouble:forKey:", CFSTR("qw"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userAcceleration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "x");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("ax"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userAcceleration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "y");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("ay"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userAcceleration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "z");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("az"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "gravity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "x");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("gx"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "gravity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "y");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("gy"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "gravity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "z");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("gz"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rotationRate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "x");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("rx"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rotationRate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "y");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("ry"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rotationRate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "z");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("rz"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "magneticField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "x");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("mx"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "magneticField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "y");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("my"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "magneticField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "z");
  objc_msgSend(v41, "encodeFloat:forKey:", CFSTR("mz"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "encodeInteger:forKey:", (int)objc_msgSend(v37, "magneticFieldCalibrationLevel"), CFSTR("mc"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "encodeBool:forKey:", objc_msgSend(v38, "doingYawCorrection"), CFSTR("yc"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "encodeBool:forKey:", objc_msgSend(v39, "doingBiasEstimation"), CFSTR("be"));

  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "encodeBool:forKey:", objc_msgSend(v40, "fusedWithVision"), CFSTR("fv"));

  -[CVACMDeviceMotionData timestamp](self, "timestamp");
  objc_msgSend(v41, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v41, "encodeInt64:forKey:", -[CVACMDeviceMotionData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_autoreleasePoolPop(v4);

}

- (CVACMDeviceMotionData)initWithCMDeviceMotion:(id)a3
{
  id v4;
  CVACMDeviceMotionData *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  float v62;
  void *v63;
  void *v64;
  double v65;
  float v66;
  void *v67;
  void *v68;
  double v69;
  float v70;
  void *v71;
  void *v72;
  double v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;

  v4 = a3;
  v5 = -[CVACMDeviceMotionData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    -[CVACMDeviceMotionData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "attitude");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quaternion");
    v8 = v7;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quaternion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setX:", v8);

    objc_msgSend(v4, "attitude");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quaternion");
    v13 = v12;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "quaternion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setY:", v13);

    objc_msgSend(v4, "attitude");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "quaternion");
    v18 = v17;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "quaternion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setZ:", v18);

    objc_msgSend(v4, "attitude");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "quaternion");
    v23 = v22;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "quaternion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setW:", v23);

    objc_msgSend(v4, "userAcceleration");
    *(float *)&v23 = v26;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "userAcceleration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = LODWORD(v23);
    objc_msgSend(v28, "setX:", v29);

    objc_msgSend(v4, "userAcceleration");
    *(float *)&v23 = v30;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "userAcceleration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = LODWORD(v23);
    objc_msgSend(v32, "setY:", v33);

    objc_msgSend(v4, "userAcceleration");
    *(float *)&v23 = v34;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "userAcceleration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = LODWORD(v23);
    objc_msgSend(v36, "setZ:", v37);

    objc_msgSend(v4, "gravity");
    *(float *)&v23 = v38;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "gravity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = LODWORD(v23);
    objc_msgSend(v40, "setX:", v41);

    objc_msgSend(v4, "gravity");
    *(float *)&v23 = v42;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "gravity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = LODWORD(v23);
    objc_msgSend(v44, "setY:", v45);

    objc_msgSend(v4, "gravity");
    *(float *)&v23 = v46;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "gravity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = LODWORD(v23);
    objc_msgSend(v48, "setZ:", v49);

    objc_msgSend(v4, "rotationRate");
    *(float *)&v23 = v50;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "rotationRate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = LODWORD(v23);
    objc_msgSend(v52, "setX:", v53);

    objc_msgSend(v4, "rotationRate");
    *(float *)&v23 = v54;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "rotationRate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = LODWORD(v23);
    objc_msgSend(v56, "setY:", v57);

    objc_msgSend(v4, "rotationRate");
    *(float *)&v23 = v58;
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "rotationRate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = LODWORD(v23);
    objc_msgSend(v60, "setZ:", v61);

    if (v4)
    {
      objc_msgSend(v4, "magneticField");
      v62 = *(double *)&v87;
    }
    else
    {
      v87 = 0u;
      v88 = 0u;
      v62 = 0.0;
    }
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "magneticField");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v65 = v62;
    objc_msgSend(v64, "setX:", v65);

    if (v4)
    {
      objc_msgSend(v4, "magneticField");
      v66 = *((double *)&v85 + 1);
    }
    else
    {
      v85 = 0u;
      v86 = 0u;
      v66 = 0.0;
    }
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "magneticField");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v69 = v66;
    objc_msgSend(v68, "setY:", v69);

    if (v4)
    {
      objc_msgSend(v4, "magneticField");
      v70 = *(double *)&v84;
    }
    else
    {
      v83 = 0u;
      v84 = 0u;
      v70 = 0.0;
    }
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion", v83, v84, v85, v86, v87, v88);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "magneticField");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v73 = v70;
    objc_msgSend(v72, "setZ:", v73);

    v74 = objc_msgSend(v4, "magneticFieldCalibrationLevel");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setMagneticFieldCalibrationLevel:", v74);

    v76 = objc_msgSend(v4, "doingYawCorrection");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setDoingYawCorrection:", v76);

    v78 = objc_msgSend(v4, "doingBiasEstimation");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setDoingBiasEstimation:", v78);

    v80 = objc_msgSend(v4, "fusedWithVision");
    -[CVACMDeviceMotionData deviceMotion](v5, "deviceMotion");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFusedWithVision:", v80);

  }
  return v5;
}

- (id)dictionary
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
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[22];
  _QWORD v85[24];

  v85[22] = *MEMORY[0x24BDAC8D0];
  v84[0] = CFSTR("t");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData timestamp](self, "timestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v83;
  v84[1] = CFSTR("qx");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "quaternion");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "x");
  objc_msgSend(v4, "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v80;
  v84[2] = CFSTR("qy");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "quaternion");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "y");
  objc_msgSend(v5, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v77;
  v84[3] = CFSTR("qz");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "quaternion");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "z");
  objc_msgSend(v6, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v74;
  v84[4] = CFSTR("qw");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "quaternion");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "w");
  objc_msgSend(v7, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v71;
  v84[5] = CFSTR("ax");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "userAcceleration");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "x");
  objc_msgSend(v8, "numberWithFloat:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v68;
  v84[6] = CFSTR("ay");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "userAcceleration");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "y");
  objc_msgSend(v9, "numberWithFloat:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v65;
  v84[7] = CFSTR("az");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "userAcceleration");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "z");
  objc_msgSend(v10, "numberWithFloat:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v62;
  v84[8] = CFSTR("gx");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "gravity");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "x");
  objc_msgSend(v11, "numberWithFloat:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v59;
  v84[9] = CFSTR("gy");
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "gravity");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "y");
  objc_msgSend(v12, "numberWithFloat:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v56;
  v84[10] = CFSTR("gz");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "gravity");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "z");
  objc_msgSend(v13, "numberWithFloat:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v53;
  v84[11] = CFSTR("rx");
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rotationRate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "x");
  objc_msgSend(v14, "numberWithFloat:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v85[11] = v50;
  v84[12] = CFSTR("ry");
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rotationRate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "y");
  objc_msgSend(v15, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v85[12] = v47;
  v84[13] = CFSTR("rz");
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rotationRate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "z");
  objc_msgSend(v16, "numberWithFloat:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v85[13] = v44;
  v84[14] = CFSTR("mx");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "magneticField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "x");
  objc_msgSend(v17, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v85[14] = v41;
  v84[15] = CFSTR("my");
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "magneticField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "y");
  objc_msgSend(v18, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v85[15] = v38;
  v84[16] = CFSTR("mz");
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "magneticField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "z");
  objc_msgSend(v19, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v85[16] = v35;
  v84[17] = CFSTR("mc");
  v20 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithInt:", objc_msgSend(v34, "magneticFieldCalibrationLevel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85[17] = v21;
  v84[18] = CFSTR("yc");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "doingYawCorrection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v85[18] = v24;
  v84[19] = CFSTR("be");
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "doingBiasEstimation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v85[19] = v27;
  v84[20] = CFSTR("fv");
  v28 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMDeviceMotionData deviceMotion](self, "deviceMotion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "fusedWithVision"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v85[20] = v30;
  v84[21] = CFSTR("st");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMDeviceMotionData syncTimestamp](self, "syncTimestamp"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v85[21] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (CVACMMotionTypeDeviceMotionData)deviceMotion
{
  return self->_deviceMotion;
}

- (void)setDeviceMotion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMotion, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMotion, 0);
}

@end
