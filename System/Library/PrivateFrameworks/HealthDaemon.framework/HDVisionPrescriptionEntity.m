@implementation HDVisionPrescriptionEntity

+ (id)databaseTable
{
  return CFSTR("vision_prescription");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 27;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_32;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDVisionPrescriptionEntity.m"), 172, CFSTR("Subclasses must override %s"), "+[HDVisionPrescriptionEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v24 = v12;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E6CE7750;
  v23 = v14;
  v16 = v12;
  v17 = v14;
  if (objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_0, a7, v25, v22, 0))v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

id __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), v2, CFSTR("data_id"), CFSTR("prescription_type"), CFSTR("verifiable_data"), CFSTR("left_sphere"), CFSTR("right_sphere"), CFSTR("left_cylinder"), CFSTR("right_cylinder"), CFSTR("left_axis"), CFSTR("right_axis"), CFSTR("left_add_power"), CFSTR("right_add_power"), CFSTR("left_vertex_distance"), CFSTR("right_vertex_distance"), CFSTR("left_prism_amount"), CFSTR("right_prism_amount"),
    CFSTR("left_prism_angle"),
    CFSTR("right_prism_angle"),
    CFSTR("left_far_pupillary_distance"),
    CFSTR("right_far_pupillary_distance"),
    CFSTR("left_near_pupillary_distance"),
    CFSTR("right_near_pupillary_distance"),
    CFSTR("glasses_description"),
    CFSTR("left_base_curve"),
    CFSTR("right_base_curve"),
    CFSTR("left_contact_diameter"),
    CFSTR("right_contact_diameter"),
    CFSTR("brand"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __92__HDVisionPrescriptionEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  id v130;
  id v131;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "prescriptionType"));
  sqlite3_bind_null(a2, 3);
  objc_msgSend(*(id *)(a1 + 40), "leftSphere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "leftSphere");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    sqlite3_bind_double(a2, 4, v7);

  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }

  objc_msgSend(*(id *)(a1 + 40), "rightSphere");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightSphere");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", v10);
    sqlite3_bind_double(a2, 5, v11);

  }
  else
  {
    sqlite3_bind_null(a2, 5);
  }

  objc_msgSend(*(id *)(a1 + 40), "leftCylinder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "leftCylinder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    sqlite3_bind_double(a2, 6, v15);

  }
  else
  {
    sqlite3_bind_null(a2, 6);
  }

  objc_msgSend(*(id *)(a1 + 40), "rightCylinder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightCylinder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValueForUnit:", v18);
    sqlite3_bind_double(a2, 7, v19);

  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }

  objc_msgSend(*(id *)(a1 + 40), "leftAxis");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "leftAxis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v22);
    sqlite3_bind_double(a2, 8, v23);

  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }

  objc_msgSend(*(id *)(a1 + 40), "rightAxis");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightAxis");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValueForUnit:", v26);
    sqlite3_bind_double(a2, 9, v27);

  }
  else
  {
    sqlite3_bind_null(a2, 9);
  }

  objc_msgSend(*(id *)(a1 + 40), "leftAddPower");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "leftAddPower");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValueForUnit:", v30);
    sqlite3_bind_double(a2, 10, v31);

  }
  else
  {
    sqlite3_bind_null(a2, 10);
  }

  objc_msgSend(*(id *)(a1 + 40), "rightAddPower");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 40), "rightAddPower");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValueForUnit:", v34);
    sqlite3_bind_double(a2, 11, v35);

  }
  else
  {
    sqlite3_bind_null(a2, 11);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = *(id *)(a1 + 40);
    objc_msgSend(v36, "leftEye");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "vertexDistance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v36, "leftEye");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "vertexDistance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValueForUnit:", v41);
      sqlite3_bind_double(a2, 12, v42);

    }
    else
    {
      sqlite3_bind_null(a2, 12);
    }

    objc_msgSend(v36, "rightEye");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "vertexDistance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v36, "rightEye");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "vertexDistance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValueForUnit:", v48);
      sqlite3_bind_double(a2, 13, v49);

    }
    else
    {
      sqlite3_bind_null(a2, 13);
    }

    objc_msgSend(v36, "leftEye");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "prism");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "amount");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v36, "leftEye");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "prism");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "amount");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValueForUnit:", v56);
      sqlite3_bind_double(a2, 14, v57);

    }
    else
    {
      sqlite3_bind_null(a2, 14);
    }

    objc_msgSend(v36, "rightEye");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "prism");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "amount");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v36, "rightEye");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "prism");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "amount");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "doubleValueForUnit:", v64);
      sqlite3_bind_double(a2, 15, v65);

    }
    else
    {
      sqlite3_bind_null(a2, 15);
    }

    objc_msgSend(v36, "leftEye");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "prism");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "angle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v36, "leftEye");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "prism");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "angle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "doubleValueForUnit:", v72);
      sqlite3_bind_double(a2, 16, v73);

    }
    else
    {
      sqlite3_bind_null(a2, 16);
    }

    objc_msgSend(v36, "rightEye");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "prism");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "angle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
    {
      objc_msgSend(v36, "rightEye");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "prism");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "angle");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "doubleValueForUnit:", v80);
      sqlite3_bind_double(a2, 17, v81);

    }
    else
    {
      sqlite3_bind_null(a2, 17);
    }

    objc_msgSend(v36, "leftEye");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "farPupillaryDistance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v36, "leftEye");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "farPupillaryDistance");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "doubleValueForUnit:", v86);
      sqlite3_bind_double(a2, 18, v87);

    }
    else
    {
      sqlite3_bind_null(a2, 18);
    }

    objc_msgSend(v36, "rightEye");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "farPupillaryDistance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v36, "rightEye");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "farPupillaryDistance");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValueForUnit:", v92);
      sqlite3_bind_double(a2, 19, v93);

    }
    else
    {
      sqlite3_bind_null(a2, 19);
    }

    objc_msgSend(v36, "leftEye");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "nearPupillaryDistance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v36, "leftEye");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "nearPupillaryDistance");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "doubleValueForUnit:", v98);
      sqlite3_bind_double(a2, 20, v99);

    }
    else
    {
      sqlite3_bind_null(a2, 20);
    }

    objc_msgSend(v36, "rightEye");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "nearPupillaryDistance");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v36, "rightEye");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "nearPupillaryDistance");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "doubleValueForUnit:", v104);
      sqlite3_bind_double(a2, 21, v105);

    }
    else
    {
      sqlite3_bind_null(a2, 21);
    }

    v43 = 22;
  }
  else
  {
    sqlite3_bind_null(a2, 12);
    sqlite3_bind_null(a2, 13);
    sqlite3_bind_null(a2, 14);
    sqlite3_bind_null(a2, 15);
    sqlite3_bind_null(a2, 16);
    sqlite3_bind_null(a2, 17);
    sqlite3_bind_null(a2, 18);
    sqlite3_bind_null(a2, 19);
    sqlite3_bind_null(a2, 20);
    sqlite3_bind_null(a2, 21);
    sqlite3_bind_null(a2, 22);
    v43 = 23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v131 = *(id *)(a1 + 40);
    objc_msgSend(v131, "leftEye");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "baseCurve");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v131, "leftEye");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "baseCurve");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "doubleValueForUnit:", v110);
      sqlite3_bind_double(a2, v43, v111);

    }
    else
    {
      sqlite3_bind_null(a2, v43);
    }

    objc_msgSend(v131, "rightEye");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "baseCurve");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v131, "rightEye");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "baseCurve");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "doubleValueForUnit:", v116);
      sqlite3_bind_double(a2, v43 + 1, v117);

    }
    else
    {
      sqlite3_bind_null(a2, v43 + 1);
    }

    objc_msgSend(v131, "leftEye");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "diameter");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v131, "leftEye");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "diameter");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "doubleValueForUnit:", v122);
      sqlite3_bind_double(a2, v43 + 2, v123);

    }
    else
    {
      sqlite3_bind_null(a2, v43 + 2);
    }

    objc_msgSend(v131, "rightEye");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "diameter");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v131, "rightEye");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "diameter");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "doubleValueForUnit:", v128);
      sqlite3_bind_double(a2, v43 + 3, v129);

    }
    else
    {
      sqlite3_bind_null(a2, v43 + 3);
    }

    objc_msgSend(v131, "brand");
    v130 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(a2, v43 + 4, (const char *)objc_msgSend(v130, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(a2, v43);
    sqlite3_bind_null(a2, v43 + 1);
    sqlite3_bind_null(a2, v43 + 2);
    sqlite3_bind_null(a2, v43 + 3);
    sqlite3_bind_null(a2, v43 + 4);
  }
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "visionSamples");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addVisionSamples:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDVisionSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([HDVisionSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
