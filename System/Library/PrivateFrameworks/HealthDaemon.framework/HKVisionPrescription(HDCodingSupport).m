@implementation HKVisionPrescription(HDCodingSupport)

- (HDCodableVisionSample)codableRepresentationForSync
{
  HDCodableVisionSample *v2;
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
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  objc_super v113;

  v2 = objc_alloc_init(HDCodableVisionSample);
  v113.receiver = a1;
  v113.super_class = (Class)&off_1EF227870;
  objc_msgSendSuper2(&v113, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableVisionSample setSample:](v2, "setSample:", v3);

  -[HDCodableVisionSample setPrescriptionType:](v2, "setPrescriptionType:", objc_msgSend(a1, "prescriptionType"));
  objc_msgSend(a1, "leftSphere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(a1, "rightSphere");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return v2;
  }
  objc_msgSend(a1, "leftSphere");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "leftSphere");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    -[HDCodableVisionSample setLeftSphere:](v2, "setLeftSphere:");

  }
  objc_msgSend(a1, "rightSphere");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "rightSphere");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v11);
    -[HDCodableVisionSample setRightSphere:](v2, "setRightSphere:");

  }
  objc_msgSend(a1, "leftCylinder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "leftCylinder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    -[HDCodableVisionSample setLeftCylinder:](v2, "setLeftCylinder:");

  }
  objc_msgSend(a1, "rightCylinder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "rightCylinder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v17);
    -[HDCodableVisionSample setRightCylinder:](v2, "setRightCylinder:");

  }
  objc_msgSend(a1, "leftAxis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "leftAxis");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v20);
    -[HDCodableVisionSample setLeftAxis:](v2, "setLeftAxis:");

  }
  objc_msgSend(a1, "rightAxis");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(a1, "rightAxis");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValueForUnit:", v23);
    -[HDCodableVisionSample setRightAxis:](v2, "setRightAxis:");

  }
  objc_msgSend(a1, "leftAddPower");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(a1, "leftAddPower");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValueForUnit:", v26);
    -[HDCodableVisionSample setLeftAddPower:](v2, "setLeftAddPower:");

  }
  objc_msgSend(a1, "rightAddPower");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(a1, "rightAddPower");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValueForUnit:", v29);
    -[HDCodableVisionSample setRightAddPower:](v2, "setRightAddPower:");

  }
  v30 = -[HDCodableVisionSample prescriptionType](v2, "prescriptionType");
  if (v30 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v90 = a1;
      objc_msgSend(v90, "leftEye");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "baseCurve");
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        objc_msgSend(v90, "leftEye");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "baseCurve");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "doubleValueForUnit:", v95);
        -[HDCodableVisionSample setLeftBaseCurve:](v2, "setLeftBaseCurve:");

      }
      objc_msgSend(v90, "rightEye");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "baseCurve");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (v97)
      {
        objc_msgSend(v90, "rightEye");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "baseCurve");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "doubleValueForUnit:", v100);
        -[HDCodableVisionSample setRightBaseCurve:](v2, "setRightBaseCurve:");

      }
      objc_msgSend(v90, "leftEye");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "diameter");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      if (v102)
      {
        objc_msgSend(v90, "leftEye");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "diameter");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "doubleValueForUnit:", v105);
        -[HDCodableVisionSample setLeftContactDiameter:](v2, "setLeftContactDiameter:");

      }
      objc_msgSend(v90, "rightEye");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "diameter");
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v107)
      {
        objc_msgSend(v90, "rightEye");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "diameter");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "doubleValueForUnit:", v110);
        -[HDCodableVisionSample setRightContactDiameter:](v2, "setRightContactDiameter:");

      }
      objc_msgSend(v90, "brand");
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v111)
        goto LABEL_55;
      objc_msgSend(v90, "brand");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableVisionSample setBrand:](v2, "setBrand:", v87);
      goto LABEL_54;
    }
  }
  else if (v30 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = a1;
      objc_msgSend(v31, "leftEye");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "vertexDistance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v31, "leftEye");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "vertexDistance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValueForUnit:", v36);
        -[HDCodableVisionSample setLeftVertexDistance:](v2, "setLeftVertexDistance:");

      }
      objc_msgSend(v31, "rightEye");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "vertexDistance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v31, "rightEye");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "vertexDistance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValueForUnit:", v41);
        -[HDCodableVisionSample setRightVertexDistance:](v2, "setRightVertexDistance:");

      }
      objc_msgSend(v31, "leftEye");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "prism");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "amount");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(v31, "leftEye");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "prism");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "amount");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValueForUnit:", v48);
        -[HDCodableVisionSample setLeftPrismAmount:](v2, "setLeftPrismAmount:");

      }
      objc_msgSend(v31, "rightEye");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "prism");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "amount");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(v31, "rightEye");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "prism");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "amount");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "doubleValueForUnit:", v55);
        -[HDCodableVisionSample setRightPrismAmount:](v2, "setRightPrismAmount:");

      }
      objc_msgSend(v31, "leftEye");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "prism");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "angle");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v31, "leftEye");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "prism");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "angle");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "doubleValueForUnit:", v62);
        -[HDCodableVisionSample setLeftPrismAngle:](v2, "setLeftPrismAngle:");

      }
      objc_msgSend(v31, "rightEye");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "prism");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "angle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v31, "rightEye");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "prism");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "angle");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "doubleValueForUnit:", v69);
        -[HDCodableVisionSample setRightPrismAngle:](v2, "setRightPrismAngle:");

      }
      objc_msgSend(v31, "leftEye");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "farPupillaryDistance");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v31, "leftEye");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "farPupillaryDistance");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "doubleValueForUnit:", v74);
        -[HDCodableVisionSample setLeftFarPupillaryDistance:](v2, "setLeftFarPupillaryDistance:");

      }
      objc_msgSend(v31, "rightEye");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "farPupillaryDistance");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76)
      {
        objc_msgSend(v31, "rightEye");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "farPupillaryDistance");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "doubleValueForUnit:", v79);
        -[HDCodableVisionSample setRightFarPupillaryDistance:](v2, "setRightFarPupillaryDistance:");

      }
      objc_msgSend(v31, "leftEye");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "nearPupillaryDistance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(v31, "leftEye");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "nearPupillaryDistance");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "doubleValueForUnit:", v84);
        -[HDCodableVisionSample setLeftNearPupillaryDistance:](v2, "setLeftNearPupillaryDistance:");

      }
      objc_msgSend(v31, "rightEye");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "nearPupillaryDistance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v86)
        goto LABEL_55;
      objc_msgSend(v31, "rightEye");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "nearPupillaryDistance");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "doubleValueForUnit:", v89);
      -[HDCodableVisionSample setRightNearPupillaryDistance:](v2, "setRightNearPupillaryDistance:");

LABEL_54:
LABEL_55:

    }
  }
  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addVisionSamples:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
    v9 = v8;
    if ((objc_msgSend(v6, "hasLeftSphere") & 1) != 0 || (objc_msgSend(v6, "hasRightSphere") & 1) != 0)
    {
      v10 = objc_msgSend(v6, "prescriptionType");
      if (v10 == 2)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6500]), "_init");
        if (objc_msgSend(v6, "applyToObject:", v12))
          goto LABEL_10;
        goto LABEL_15;
      }
      if (v10 != 1)
      {
LABEL_17:

        goto LABEL_18;
      }
      v11 = (objc_class *)MEMORY[0x1E0CB6750];
    }
    else
    {
      v11 = a1;
    }
    v12 = (void *)objc_msgSend([v11 alloc], "_init");
    if ((objc_msgSend(v6, "applyToObject:", v12) & 1) != 0)
    {
LABEL_10:
      objc_msgSend(v12, "_validateWithConfiguration:", v7, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = 0;
      else
        v14 = v12;
      v3 = v14;

      goto LABEL_16;
    }
LABEL_15:
    v3 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v3 = 0;
LABEL_18:

  return v3;
}

@end
