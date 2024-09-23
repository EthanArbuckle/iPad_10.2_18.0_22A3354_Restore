@implementation HDVisionSampleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[27];

  v8[26] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("prescription_type");
  v8[1] = CFSTR("verifiable_data");
  v8[2] = CFSTR("left_sphere");
  v8[3] = CFSTR("right_sphere");
  v8[4] = CFSTR("left_cylinder");
  v8[5] = CFSTR("right_cylinder");
  v8[6] = CFSTR("left_axis");
  v8[7] = CFSTR("right_axis");
  v8[8] = CFSTR("left_add_power");
  v8[9] = CFSTR("right_add_power");
  v8[10] = CFSTR("left_vertex_distance");
  v8[11] = CFSTR("right_vertex_distance");
  v8[12] = CFSTR("left_prism_amount");
  v8[13] = CFSTR("right_prism_amount");
  v8[14] = CFSTR("left_prism_angle");
  v8[15] = CFSTR("right_prism_angle");
  v8[16] = CFSTR("left_far_pupillary_distance");
  v8[17] = CFSTR("right_far_pupillary_distance");
  v8[18] = CFSTR("left_near_pupillary_distance");
  v8[19] = CFSTR("right_near_pupillary_distance");
  v8[20] = CFSTR("glasses_description");
  v8[21] = CFSTR("left_base_curve");
  v8[22] = CFSTR("right_base_curve");
  v8[23] = CFSTR("left_contact_diameter");
  v8[24] = CFSTR("right_contact_diameter");
  v8[25] = CFSTR("brand");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  HDCodableVisionSample *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableVisionSample);
    v23 = v10;
    -[HDCodableVisionSample setSample:](v11, "setSample:", v10);
    v12 = HDSQLiteColumnWithNameAsInt64();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_sphere"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_sphere"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_cylinder"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_cylinder"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_axis"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_axis"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_add_power"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_add_power"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_vertex_distance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_vertex_distance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_prism_amount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_prism_amount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_prism_angle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_prism_angle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_far_pupillary_distance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_far_pupillary_distance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_near_pupillary_distance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_near_pupillary_distance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HDSQLiteColumnWithNameIsNull() & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      HDSQLiteColumnWithNameAsString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_base_curve"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_base_curve"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_contact_diameter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_contact_diameter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HDSQLiteColumnWithNameIsNull() & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      HDSQLiteColumnWithNameAsString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HDCodableVisionSample setPrescriptionType:](v11, "setPrescriptionType:", v12);
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      -[HDCodableVisionSample setLeftSphere:](v11, "setLeftSphere:");
    }
    v21 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      -[HDCodableVisionSample setRightSphere:](v11, "setRightSphere:");
    }
    v10 = v23;
    if (v39)
    {
      objc_msgSend(v39, "doubleValue");
      -[HDCodableVisionSample setLeftCylinder:](v11, "setLeftCylinder:");
    }
    if (v38)
    {
      objc_msgSend(v38, "doubleValue");
      -[HDCodableVisionSample setRightCylinder:](v11, "setRightCylinder:");
    }
    if (v37)
    {
      objc_msgSend(v37, "doubleValue");
      -[HDCodableVisionSample setLeftAxis:](v11, "setLeftAxis:");
    }
    if (v36)
    {
      objc_msgSend(v36, "doubleValue");
      -[HDCodableVisionSample setRightAxis:](v11, "setRightAxis:");
    }
    if (v35)
    {
      objc_msgSend(v35, "doubleValue");
      -[HDCodableVisionSample setLeftAddPower:](v11, "setLeftAddPower:");
    }
    if (v34)
    {
      objc_msgSend(v34, "doubleValue");
      -[HDCodableVisionSample setRightAddPower:](v11, "setRightAddPower:");
    }
    if (v33)
    {
      objc_msgSend(v33, "doubleValue");
      -[HDCodableVisionSample setLeftVertexDistance:](v11, "setLeftVertexDistance:");
    }
    if (v32)
    {
      objc_msgSend(v32, "doubleValue");
      -[HDCodableVisionSample setRightVertexDistance:](v11, "setRightVertexDistance:");
    }
    if (v31)
    {
      objc_msgSend(v31, "doubleValue");
      -[HDCodableVisionSample setLeftPrismAmount:](v11, "setLeftPrismAmount:");
    }
    if (v30)
    {
      objc_msgSend(v30, "doubleValue");
      -[HDCodableVisionSample setRightPrismAmount:](v11, "setRightPrismAmount:");
    }
    if (v29)
    {
      objc_msgSend(v29, "doubleValue");
      -[HDCodableVisionSample setLeftPrismAngle:](v11, "setLeftPrismAngle:");
    }
    if (v28)
    {
      objc_msgSend(v28, "doubleValue");
      -[HDCodableVisionSample setRightPrismAngle:](v11, "setRightPrismAngle:");
    }
    if (v27)
    {
      objc_msgSend(v27, "doubleValue");
      -[HDCodableVisionSample setLeftFarPupillaryDistance:](v11, "setLeftFarPupillaryDistance:");
    }
    if (v26)
    {
      objc_msgSend(v26, "doubleValue");
      -[HDCodableVisionSample setRightFarPupillaryDistance:](v11, "setRightFarPupillaryDistance:");
    }
    if (v25)
    {
      objc_msgSend(v25, "doubleValue");
      -[HDCodableVisionSample setLeftNearPupillaryDistance:](v11, "setLeftNearPupillaryDistance:");
    }
    if (v24)
    {
      objc_msgSend(v24, "doubleValue");
      -[HDCodableVisionSample setRightNearPupillaryDistance:](v11, "setRightNearPupillaryDistance:");
    }
    if (v15)
      -[HDCodableVisionSample setGlassesDescription:](v11, "setGlassesDescription:", v15);
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      -[HDCodableVisionSample setLeftBaseCurve:](v11, "setLeftBaseCurve:");
    }
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      -[HDCodableVisionSample setRightBaseCurve:](v11, "setRightBaseCurve:");
    }
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      -[HDCodableVisionSample setLeftContactDiameter:](v11, "setLeftContactDiameter:");
    }
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      -[HDCodableVisionSample setRightContactDiameter:](v11, "setRightContactDiameter:");
    }
    if (v20)
      -[HDCodableVisionSample setBrand:](v11, "setBrand:", v20);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_valueForOptionalDoubleProperty:(uint64_t)a1 row:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1 && (HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v5, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];

  v4 = HDSQLiteColumnWithNameAsInt64();
  -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_sphere"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_sphere"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (!(v7 | v10))
  {
LABEL_8:
    v11 = (objc_class *)MEMORY[0x1E0CB6DB8];
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB6500];
    goto LABEL_9;
  }
  if (v4 != 1)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_1B7802000, v12, OS_LOG_TYPE_FAULT, "Unexpectedly reached execution point. Creating generic vision prescription bare object.", v15, 2u);
    }
    goto LABEL_8;
  }
  v11 = (objc_class *)MEMORY[0x1E0CB6750];
LABEL_9:
  v13 = (void *)objc_msgSend([v11 alloc], "_init");

  return v13;
}

- (id)_quantityWithNumber:(void *)a3 unit:
{
  void *v3;
  void *v5;
  id v6;

  v3 = 0;
  if (a1 && a2)
  {
    v5 = (void *)MEMORY[0x1E0CB6A28];
    v6 = a3;
    objc_msgSend(a2, "doubleValue");
    objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  BOOL v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
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
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
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
  id v112;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((_DWORD)a4)
  {
    v12 = HDSQLiteColumnWithNameAsInt64();
    v112 = v10;
    objc_msgSend(v10, "_setPrescriptionType:", v12);
    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_sphere"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_sphere"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_cylinder"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v19, v20);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_cylinder"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v21, v22);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_axis"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v23, v24);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_axis"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v25, v26);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_add_power"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v27, v28);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_add_power"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(v15 | v18))
    {
      v32 = 1;
LABEL_35:

      goto LABEL_36;
    }
    if (v12 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v10;
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_base_curve"));
        v64 = objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_base_curve"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_contact_diameter"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_contact_diameter"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteColumnWithNameAsString();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v65;
        v106 = (void *)v64;
        if (v15)
        {
          v96 = v15;
          v67 = objc_alloc(MEMORY[0x1E0CB64F8]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v104 = v33;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v106, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v70 = v66;
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v102, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = (void *)objc_msgSend(v67, "initWithSphere:cylinder:axis:addPower:baseCurve:diameter:", v96, v111, v109, v107, v69, v72);

          v66 = v70;
          v65 = v100;

          v33 = v104;
          objc_msgSend(v104, "_setLeftEyeSpecification:", v73);

          v15 = v96;
        }
        if (v18)
        {
          v74 = objc_alloc(MEMORY[0x1E0CB64F8]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v105 = v66;
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v65, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v105, v77);
          v78 = v33;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = (void *)objc_msgSend(v74, "initWithSphere:cylinder:axis:addPower:baseCurve:diameter:", v18, v110, v108, v31, v76, v79);

          v33 = v78;
          v65 = v100;

          v66 = v105;
          objc_msgSend(v78, "_setRightEyeSpecification:", v80);

        }
        objc_msgSend(v33, "_setBrand:", v98);

        v32 = 1;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Expected a contacts prescription"));
      v81 = (id)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        if (!a6)
          goto LABEL_29;
        goto LABEL_32;
      }
    }
    else
    {
      if (v12 != 1)
      {
        v32 = 1;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v10;
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_vertex_distance"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_vertex_distance"));
        v34 = objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_prism_amount"));
        v35 = objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_prism_amount"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_prism_angle"));
        v36 = objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_prism_angle"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_far_pupillary_distance"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_far_pupillary_distance"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("left_near_pupillary_distance"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDVisionSampleEntityEncoder _valueForOptionalDoubleProperty:row:]((uint64_t)self, CFSTR("right_near_pupillary_distance"));
        v95 = 0;
        v101 = v37;
        v103 = v33;
        v90 = (void *)v36;
        v91 = (void *)v35;
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35 && v36)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB6DC0]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v91, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v90, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = (void *)objc_msgSend(v38, "initWithAmount:angle:eye:", v40, v42, 1);

          v33 = v103;
          v37 = v101;

        }
        v43 = 0;
        v92 = (void *)v34;
        if (v99 && v97)
        {
          v44 = objc_alloc(MEMORY[0x1E0CB6DC0]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v99, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v97, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v44, "initWithAmount:angle:eye:", v46, v48, 2);

          v33 = v103;
          v37 = v101;

        }
        if (v15)
        {
          v84 = objc_alloc(MEMORY[0x1E0CB6748]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v106, v86);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v94, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v93, v51);
          v52 = v43;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v84, "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v15, v111, v109, v107, v83, v95, v50, v53);

          v43 = v52;
          v33 = v103;

          v37 = v101;
          objc_msgSend(v103, "_setLeftEyeSpecification:", v54);

        }
        v55 = v92;
        v56 = v89;
        if (v18)
        {
          v87 = objc_alloc(MEMORY[0x1E0CB6748]);
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v92, v85);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v101, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDVisionSampleEntityEncoder _quantityWithNumber:unit:]((uint64_t)self, v89, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v87, "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v18, v110, v108, v31, v57, v43, v59, v61);
          v88 = v43;
          v63 = (void *)v62;

          v56 = v89;
          v33 = v103;

          v37 = v101;
          v55 = v92;

          objc_msgSend(v103, "_setRightEyeSpecification:", v63);
          v43 = v88;
        }

        v32 = 1;
        v10 = v112;
LABEL_25:
        v81 = v106;
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Expected a glasses prescription"));
      v81 = (id)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        if (!a6)
        {
LABEL_29:
          _HKLogDroppedError();
          v32 = 0;
          v33 = v81;
          goto LABEL_34;
        }
LABEL_32:
        v81 = objc_retainAutorelease(v81);
        v32 = 0;
        *a6 = v81;
        v33 = v81;
        goto LABEL_34;
      }
    }
    v33 = 0;
    v32 = 0;
    goto LABEL_34;
  }
  v32 = 0;
LABEL_36:

  return v32;
}

@end
