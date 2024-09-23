@implementation CHDrawing

- (CHDrawing)initWithContentsOfFile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHDrawing *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int isEqualToString;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CHDrawing *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CHDrawing;
  v10 = -[CHDrawing init](&v50, sel_init);
  if (!v10)
    goto LABEL_12;
  if ((unint64_t)objc_msgSend_length(v4, v5, v6, v7, v8, v9) < 5
    || (v16 = objc_msgSend_length(v4, v11, v12, v13, v14, v15),
        objc_msgSend_substringFromIndex_(v4, v17, v16 - 4, v18, v19, v20),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("json"), v23, v24, v25),
        v21,
        !isEqualToString))
  {
    v42 = objc_retainAutorelease(v4);
    v47 = (const char *)objc_msgSend_cStringUsingEncoding_(v42, v43, 4, v44, v45, v46);
    CHDrawingStrokes::readCharacter(&v10->_drawing, v47);
LABEL_12:
    v41 = v10;
    goto LABEL_13;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], v27, (uint64_t)v4, v28, v29, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v4;
      _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_ERROR, "Could not read data from file %@", buf, 0xCu);
    }

  }
  v49 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v31, (uint64_t)v33, 1, (uint64_t)&v49, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v49;
  v41 = (CHDrawing *)(id)objc_msgSend_initWithContentsOfJSONDictionary_(v10, v37, (uint64_t)v35, v38, v39, v40);

LABEL_13:
  return v41;
}

- (CHDrawing)initWithContentsOfXYString:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHDrawing *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  float v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int isEqualToString;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CHDrawing;
  v8 = -[CHDrawing init](&v76, sel_init);
  if (v8)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend_componentsSeparatedByString_(v71, v4, (uint64_t)CFSTR("\n"), v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v72, (uint64_t)v77, 16, v11);
    if (v16)
    {
      v17 = *(_QWORD *)v73;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v73 != v17)
            objc_enumerationMutation(v9);
          objc_msgSend_componentsSeparatedByString_(*(void **)(*((_QWORD *)&v72 + 1) + 8 * v18), v12, (uint64_t)CFSTR(" "), v13, v14, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend_count(v19, v20, v21, v22, v23, v24) < 2)
          {
            if (objc_msgSend_count(v19, v25, v26, v27, v28, v29) == 1)
            {
              objc_msgSend_objectAtIndexedSubscript_(v19, v55, 0, v56, v57, v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v59, v60, (uint64_t)CFSTR(";"), v61, v62, v63);

              if (isEqualToString)
                objc_msgSend_endStroke(v8, v65, v66, v67, v68, v69);
            }
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v19, v25, 0, v27, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v30, v31, v32, v33, v34, v35);
            v37 = v36;
            objc_msgSend_objectAtIndexedSubscript_(v19, v38, 1, v39, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v42, v43, v44, v45, v46, v47);
            v49 = v48;

            objc_msgSend_addPoint_(v8, v50, v51, v52, v53, v54, v37, v49);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v72, (uint64_t)v77, 16, v15);
      }
      while (v16);
    }

  }
  return v8;
}

- (CHDrawing)initWithContentsOfJSONDictionary:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHDrawing *v8;
  void *v9;
  BOOL v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  float v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  float v80;
  float v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  id v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  objc_super v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v107.receiver = self;
  v107.super_class = (Class)CHDrawing;
  v8 = -[CHDrawing init](&v107, sel_init);
  if (v8)
  {
    objc_msgSend_objectForKey_(v95, v4, (uint64_t)CFSTR("channel"), v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      v32 = 0;
      v33 = 1;
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v95, v11, (uint64_t)CFSTR("channel"), v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v15, v16, (uint64_t)CFSTR("x"), v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
      {
        v32 = 0;
      }
      else
      {
        objc_msgSend_objectForKeyedSubscript_(v15, v22, (uint64_t)CFSTR("x"), v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend_integerValue(v26, v27, v28, v29, v30, v31);

      }
      objc_msgSend_objectForKey_(v15, v22, (uint64_t)CFSTR("y"), v23, v24, v25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        v33 = 1;
      }
      else
      {
        objc_msgSend_objectForKeyedSubscript_(v15, v36, (uint64_t)CFSTR("y"), v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_integerValue(v40, v41, v42, v43, v44, v45);

      }
    }
    objc_msgSend_objectForKeyedSubscript_(v95, v11, (uint64_t)CFSTR("data"), v12, v13, v14);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v103, (uint64_t)v109, 16, v47);
    if (v48)
    {
      v97 = *(_QWORD *)v104;
      do
      {
        v98 = v48;
        for (i = 0; i != v98; ++i)
        {
          if (*(_QWORD *)v104 != v97)
            objc_enumerationMutation(obj);
          v50 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v51 = v50;
          v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v99, (uint64_t)v108, 16, v53);
          if (v58)
          {
            v59 = *(_QWORD *)v100;
            do
            {
              for (j = 0; j != v58; ++j)
              {
                if (*(_QWORD *)v100 != v59)
                  objc_enumerationMutation(v51);
                v61 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
                objc_msgSend_objectAtIndexedSubscript_(v61, v54, v32, v55, v56, v57);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_floatValue(v62, v63, v64, v65, v66, v67);
                v69 = v68;
                objc_msgSend_objectAtIndexedSubscript_(v61, v70, v33, v71, v72, v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_floatValue(v74, v75, v76, v77, v78, v79);
                v81 = v80;

                objc_msgSend_addPoint_(v8, v82, v83, v84, v85, v86, v69, v81);
              }
              v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v99, (uint64_t)v108, 16, v57);
            }
            while (v58);
          }

          objc_msgSend_endStroke(v8, v87, v88, v89, v90, v91);
        }
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v92, (uint64_t)&v103, (uint64_t)v109, 16, v93);
      }
      while (v48);
    }

  }
  return v8;
}

- (CHDrawing)initWithCoder:(id)a3
{
  id v4;
  CHDrawing *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CHDrawing *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const void *v53;
  _QWORD *v54;
  int64_t v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  int64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  __int128 v68;
  unint64_t v69;
  unint64_t v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t i;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double *v106;
  NSObject *v107;
  void *v108;
  id v109;
  void *v111;
  uint64_t v112;
  void *v113;
  unint64_t vars0;
  id obj;
  id v116;
  CHDrawing *v117;
  void *v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  objc_super v124;
  char *v125;
  char *v126;
  __int128 v127;
  unint64_t v128;
  void *v129;

  STACK[0xE18] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)CHDrawing;
  v116 = v4;
  v5 = -[CHDrawing init](&v124, sel_init);
  if (v5)
  {
    v117 = v5;
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v8, v7, v9, v10, v11);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v111, (uint64_t)CFSTR("drawingStrokes"), v13, v14);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v117;
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v111, (uint64_t)CFSTR("drawingStrokesTimeStamps"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v19;
    if (!v113)
      goto LABEL_59;
    sub_1BE68F7D8((uint64_t)&STACK[0xB20]);
    if (objc_msgSend_count(v113, v20, v21, v22, v23, v24))
    {
      v25 = (_QWORD *)((unint64_t)&STACK[0xB20] | 0x60);
      v26 = STACK[0xB80];
      if (STACK[0xB80])
      {
        v27 = STACK[0xB88];
        v28 = (void *)STACK[0xB80];
        if (STACK[0xB88] != v26)
        {
          v29 = STACK[0xB88];
          do
          {
            v31 = *(void **)(v29 - 24);
            v29 -= 24;
            v30 = v31;
            if (v31)
            {
              *(_QWORD *)(v27 - 16) = v30;
              operator delete(v30);
            }
            v27 = v29;
          }
          while (v29 != v26);
          v28 = (void *)STACK[0xB80];
          v25 = (_QWORD *)((unint64_t)&STACK[0xB20] | 0x60);
        }
        STACK[0xB88] = v26;
        operator delete(v28);
      }
      *v25 = 0;
      v25[1] = 0;
      v25[2] = 0;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      obj = v113;
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v120, (uint64_t)&STACK[0xAA0], 16, v34);
      v19 = v118;
      if (v40)
      {
        v41 = (unint64_t)&STACK[0xB20] | 0x70;
        v119 = *(_QWORD *)v121;
        while (2)
        {
          v42 = 0;
          v112 = v40;
          do
          {
            if (*(_QWORD *)v121 != v119)
              objc_enumerationMutation(obj);
            v45 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v42);
            v46 = objc_msgSend_length(v45, v35, v36, v37, v38, v39);
            if ((v46 & 0xF) != 0)
            {
              v32 = 0;
              goto LABEL_53;
            }
            v47 = objc_retainAutorelease(v45);
            v53 = (const void *)objc_msgSend_bytes(v47, v48, v49, v50, v51, v52);
            v54 = (_QWORD *)STACK[0xB88];
            if (STACK[0xB88] >= STACK[0xB90])
            {
              v57 = STACK[0xB80];
              v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v54 - STACK[0xB80]) >> 3);
              v59 = v58 + 1;
              if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
                sub_1BE61F930();
              if (0x5555555555555556 * ((uint64_t)(STACK[0xB90] - v57) >> 3) > v59)
                v59 = 0x5555555555555556 * ((uint64_t)(STACK[0xB90] - v57) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(STACK[0xB90] - v57) >> 3) >= 0x555555555555555)
                v60 = 0xAAAAAAAAAAAAAAALL;
              else
                v60 = v59;
              v128 = v41;
              if (v60)
              {
                if (v60 > 0xAAAAAAAAAAAAAAALL)
                  sub_1BE61F100();
                v61 = (char *)operator new(24 * v60);
              }
              else
              {
                v61 = 0;
              }
              v125 = v61;
              v126 = &v61[24 * v58];
              v62 = v126;
              *((_QWORD *)v126 + 1) = 0;
              *(_QWORD *)&v127 = &v61[24 * v58];
              *((_QWORD *)&v127 + 1) = &v61[24 * v60];
              vars0 = *((_QWORD *)&v127 + 1);
              *((_QWORD *)v62 + 2) = 0;
              *(_QWORD *)v62 = 0;
              if (v46 >= 8)
              {
                v63 = v46 & 0xFFFFFFFFFFFFFFF8;
                if (v63 < 0)
                  sub_1BE61F930();
                v64 = v41;
                v65 = (char *)operator new(v63);
                *(_QWORD *)v62 = v65;
                v66 = &v65[8 * (v63 >> 3)];
                *((_QWORD *)v62 + 2) = v66;
                memcpy(v65, v53, v63);
                *((_QWORD *)v62 + 1) = v66;
                v41 = v64;
              }
              v44 = (unint64_t)(v62 + 24);
              *(_QWORD *)&v127 = v62 + 24;
              if (v54 == (_QWORD *)v57)
              {
                STACK[0xB80] = (unint64_t)v62;
                STACK[0xB88] = v44;
                STACK[0xB90] = vars0;
                v4 = v116;
                v15 = v117;
                v40 = v112;
              }
              else
              {
                v15 = v117;
                do
                {
                  v67 = v62;
                  *((_QWORD *)v62 - 2) = 0;
                  *((_QWORD *)v62 - 1) = 0;
                  v68 = *(_OWORD *)(v54 - 3);
                  v54 -= 3;
                  *(_OWORD *)(v62 - 24) = v68;
                  v62 -= 24;
                  *((_QWORD *)v67 - 1) = v54[2];
                  *v54 = 0;
                  v54[1] = 0;
                  v54[2] = 0;
                }
                while (v54 != (_QWORD *)v57);
                v54 = (_QWORD *)STACK[0xB80];
                v69 = STACK[0xB88];
                STACK[0xB80] = (unint64_t)v62;
                v70 = v127;
                *(_OWORD *)&STACK[0xB88] = v127;
                v44 = v70;
                v4 = v116;
                v40 = v112;
                if ((_QWORD *)v69 != v54)
                {
                  v71 = (_QWORD *)v69;
                  do
                  {
                    v73 = (void *)*(v71 - 3);
                    v71 -= 3;
                    v72 = v73;
                    if (v73)
                    {
                      *(_QWORD *)(v69 - 16) = v72;
                      operator delete(v72);
                    }
                    v69 = (unint64_t)v71;
                  }
                  while (v71 != v54);
                }
              }
              v19 = v118;
              if (v54)
                operator delete(v54);
            }
            else
            {
              *v54 = 0;
              v54[1] = 0;
              v54[2] = 0;
              if (v46 >= 8)
              {
                v55 = v46 & 0xFFFFFFFFFFFFFFF8;
                if (v55 < 0)
                  sub_1BE61F930();
                v56 = (char *)operator new(v55);
                *v54 = v56;
                v54[1] = v56;
                v43 = &v56[8 * (v55 >> 3)];
                v54[2] = v43;
                memcpy(v56, v53, v55);
                v54[1] = v43;
                v19 = v118;
              }
              v44 = (unint64_t)(v54 + 3);
            }
            STACK[0xB88] = v44;
            ++v42;
          }
          while (v42 != v40);
          v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v120, (uint64_t)&STACK[0xAA0], 16, v39);
          if (v40)
            continue;
          break;
        }
      }
      v32 = 1;
LABEL_53:

      STACK[0xB98] = objc_msgSend_count(obj, v74, v75, v76, v77, v78);
      sub_1BE68A1A4(&STACK[0xB20]);
    }
    else
    {
      sub_1BE683638((uint64_t *)&STACK[0xB20]);
      v32 = 1;
    }
    sub_1BE69045C((uint64_t)&v129, (uint64_t)&STACK[0xB20]);
    sub_1BE68A9CC((uint64_t)&v15->_drawing, (uint64_t)&v129);
    sub_1BE690148(&v129);
    sub_1BE690148((void **)&STACK[0xB20]);
    v84 = objc_msgSend_count(v19, v79, v80, v81, v82, v83);
    if (v84 == objc_msgSend_count(v113, v85, v86, v87, v88, v89))
    {
      for (i = 0; i < objc_msgSend_count(v19, v90, v91, v92, v93, v94); ++i)
      {
        objc_msgSend_objectAtIndex_(v19, v96, i, v97, v98, v99);
        v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v106 = (double *)objc_msgSend_bytes(v100, v101, v102, v103, v104, v105);
        sub_1BE68A2DC(&v15->_drawing.strokeBounds.__begin_, *v106);
        sub_1BE68A454(&v15->_drawing.strokeBounds.__begin_, v106[1]);

      }
    }
    if (!v32)
    {
LABEL_59:
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v107 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        v108 = (void *)objc_opt_class();
        LODWORD(STACK[0xB20]) = 138412290;
        STACK[0xB24] = (unint64_t)v108;
        v109 = v108;
        _os_log_impl(&dword_1BE607000, v107, OS_LOG_TYPE_ERROR, "%@ decoding failed. There was a problem decoding the stroke data.", (uint8_t *)&STACK[0xB20], 0xCu);

      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  int64_t v25;
  char *v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t i;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double *begin;
  double v47;
  double *v48;
  double *v49;
  double v50;
  double *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *vars0;
  uint64_t vars8;
  void *v65;
  uint64_t v66;

  STACK[0x618] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  vars0 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v17 = v4;
  while (v16 < objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14))
  {
    sub_1BE69045C((uint64_t)&v65, (uint64_t)&self->_drawing);
    vars8 = 0;
    v24 = *(_BYTE **)(v66 + v15);
    v23 = *(_BYTE **)(v66 + v15 + 8);
    v25 = v23 - v24;
    if (v23 == v24)
    {
      v27 = 0;
      v26 = 0;
    }
    else
    {
      if (v25 < 0)
        sub_1BE61F930();
      v26 = (char *)operator new(v23 - v24);
      v27 = &v26[8 * (v25 >> 3)];
      memcpy(v26, v24, v25);
    }
    sub_1BE690148(&v65);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v28, (uint64_t)v26, v27 - v26, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v17;
    objc_msgSend_addObject_(vars0, v32, (uint64_t)v31, v33, v34, v35);

    if (v26)
      operator delete(v26);
    ++v16;
    v15 += 24;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21, v22);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_strokeCount(self, v36, v37, v38, v39, v40); ++i)
  {
    begin = self->_drawing.startTimes.__begin_;
    v47 = -1.0;
    if (i < self->_drawing.startTimes.__end_ - begin)
      v47 = begin[i];
    v48 = (double *)operator new(8uLL);
    *v48 = v47;
    v49 = self->_drawing.endTimes.__begin_;
    v50 = -1.0;
    if (i < self->_drawing.endTimes.__end_ - v49)
      v50 = v49[i];
    v51 = (double *)operator new(0x10uLL);
    *v51 = v47;
    v51[1] = v50;
    operator delete(v48);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v52, (uint64_t)v51, 16, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v41, v56, (uint64_t)v55, v57, v58, v59);

    operator delete(v51);
  }
  objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)vars0, (uint64_t)CFSTR("drawingStrokes"), v44, v45);
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v41, (uint64_t)CFSTR("drawingStrokesTimeStamps"), v61, v62);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_super v35;

  objc_msgSend_bounds(self, a2, v2, v3, v4, v5);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("origin: (%0.2f, %0.2f), size: (%0.2f, %0.2f)"), v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)CHDrawing;
  -[CHDrawing description](&v35, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_strokeCount(self, v17, v18, v19, v20, v21);
  v28 = objc_msgSend_pointCount(self, v23, v24, v25, v26, v27);
  objc_msgSend_stringByAppendingFormat_(v16, v29, (uint64_t)CFSTR(" strokes: %lu, points: %lu, %@"), v30, v31, v32, v22, v28, v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)newDrawingWithTransform:(id)a3
{
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHDrawing *v10;
  unint64_t i;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t j;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = (void (**)(_QWORD))a3;
  v10 = objc_alloc_init(CHDrawing);
  for (i = 0; objc_msgSend_strokeCount(self, v5, v6, v7, v8, v9) > i; ++i)
  {
    for (j = 0; objc_msgSend_pointCountForStrokeIndex_(self, v12, i, v13, v14, v15) > j; ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v17, i, j, v20, v21);
      v4[2](v4);
      objc_msgSend_addPoint_(v10, v22, v23, v24, v25, v26);
    }
    objc_msgSend_endStroke(v10, v17, v18, v19, v20, v21);
  }

  return v10;
}

- (id)newDrawingWithAffineTransform:(CGAffineTransform *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHDrawing *v10;
  unint64_t i;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t j;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v10 = objc_alloc_init(CHDrawing);
  for (i = 0; objc_msgSend_strokeCount(self, v5, v6, v7, v8, v9) > i; ++i)
  {
    for (j = 0; objc_msgSend_pointCountForStrokeIndex_(self, v12, i, v13, v14, v15) > j; ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v17, i, j, v20, v21);
      objc_msgSend_addPoint_(v10, v24, v25, v26, v27, v28, vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v22), *(float64x2_t *)&a3->a, v23)));
    }
    objc_msgSend_endStroke(v10, v17, v18, v19, v20, v21);
  }
  return v10;
}

- (id)drawingByRemovingUnnaturalHorizontalGaps:(double)a3
{
  CHDrawing *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  double *v21;
  double *v22;
  double *v23;
  unint64_t v24;
  CGFloat width;
  double height;
  CGFloat x;
  CGFloat y;
  double v29;
  double v30;
  double *v31;
  double v32;
  CGFloat v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  double v42;
  double v43;
  double v44;
  double *v45;
  unint64_t v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  double *v53;
  uint64_t v54;
  __int128 v55;
  CHDrawing *v56;
  CHDrawing *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t i;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v82;
  uint64_t v83;
  double *v84;
  uint64_t *__p;
  uint64_t *v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v4 = self;
  objc_msgSend_bounds(v4, v5, v6, v7, v8, v9);
  if (v15 <= a3 * 0.8)
  {
    v56 = v4;
    goto LABEL_59;
  }
  objc_msgSend_strokeIndicesSortedByMinXCoordinate(v4, v10, v11, v12, v13, v14);
  v84 = 0;
  v20 = __p;
  if (v86 == __p)
  {
    v56 = v4;
    if (__p)
      goto LABEL_58;
    goto LABEL_59;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v83 = 0;
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  objc_msgSend_boundsForStrokeIndex_(v4, v16, *__p, v17, v18, v19, a3 + 50.0);
  while (1)
  {
    v32 = v29;
    v33 = v30;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    if (CGRectIsNull(v87))
      goto LABEL_8;
    v92.origin.y = 0.0;
    v92.size.height = 1.0;
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    v92.origin.x = v32;
    v92.size.width = v33;
    if (!CGRectIntersectsRect(v88, v92))
    {
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = height;
      v42 = v32 - CGRectGetMaxX(v91);
      if (v42 > a3 * 0.8)
      {
        v43 = v42 + -50.0;
        if (v42 >= a3)
          v43 = a3;
        if (v42 >= v82)
          v44 = v42 + -50.0;
        else
          v44 = v43;
        v83 = (uint64_t)((double)v83 - v44);
      }
LABEL_8:
      x = v32;
      y = 0.0;
      width = v33;
      height = 1.0;
      if (v23 < v22)
        goto LABEL_4;
      goto LABEL_12;
    }
    v93.origin.y = 0.0;
    v93.size.height = 1.0;
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = width;
    v89.size.height = height;
    v93.origin.x = v32;
    v93.size.width = v33;
    v90 = CGRectUnion(v89, v93);
    x = v90.origin.x;
    y = v90.origin.y;
    width = v90.size.width;
    height = v90.size.height;
    if (v23 < v22)
    {
LABEL_4:
      *v23 = (double)v83;
      v31 = v23 + 1;
      goto LABEL_5;
    }
LABEL_12:
    v38 = v23 - v21;
    v39 = v38 + 1;
    if ((unint64_t)(v38 + 1) >> 61)
      sub_1BE61F930();
    if (((char *)v22 - (char *)v21) >> 2 > v39)
      v39 = ((char *)v22 - (char *)v21) >> 2;
    if ((unint64_t)((char *)v22 - (char *)v21) >= 0x7FFFFFFFFFFFFFF8)
      v40 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v40 = v39;
    if (v40)
    {
      if (v40 >> 61)
        sub_1BE61F100();
      v41 = operator new(8 * v40);
    }
    else
    {
      v41 = 0;
    }
    v45 = (double *)&v41[8 * v38];
    *v45 = (double)v83;
    v31 = v45 + 1;
    if (v23 == v21)
      goto LABEL_33;
    v46 = (char *)v23 - (char *)v21 - 8;
    if (v46 >= 0x168)
    {
      v49 = ((char *)(v23 - 1) - (char *)v21) & 0xFFFFFFFFFFFFFFF8;
      if (&v41[(char *)v23 - (char *)v21 - 8 - v49] > &v41[(char *)v23 - (char *)v21 - 8])
      {
        v47 = v23;
      }
      else if ((double *)((char *)v23 - v49 - 8) > v23 - 1)
      {
        v47 = v23;
      }
      else if ((unint64_t)((char *)v21 - v41) >= 0x20)
      {
        v50 = (v46 >> 3) + 1;
        v51 = 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
        v47 = &v23[v51 / 0xFFFFFFFFFFFFFFF8];
        v45 = (double *)((char *)v45 - v51);
        v52 = &v41[8 * v38 - 16];
        v53 = v23 - 2;
        v54 = v50 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v55 = *(_OWORD *)v53;
          *(v52 - 1) = *((_OWORD *)v53 - 1);
          *v52 = v55;
          v52 -= 2;
          v53 -= 4;
          v54 -= 4;
        }
        while (v54);
        if (v50 == (v50 & 0x3FFFFFFFFFFFFFFCLL))
          goto LABEL_33;
      }
      else
      {
        v47 = v23;
      }
    }
    else
    {
      v47 = v23;
    }
    do
    {
      v48 = *((_QWORD *)v47-- - 1);
      *((_QWORD *)v45-- - 1) = v48;
    }
    while (v47 != v21);
LABEL_33:
    v22 = (double *)&v41[8 * v40];
    v84 = v45;
    if (v21)
      operator delete(v21);
    v21 = v45;
LABEL_5:
    ++v24;
    v23 = v31;
    if (v24 >= v86 - __p)
      break;
    objc_msgSend_boundsForStrokeIndex_(v4, v34, __p[v24], v35, v36, v37, *(_QWORD *)&v82);
  }
  if (v83)
  {
    v57 = objc_alloc_init(CHDrawing);

    for (i = 0; i < objc_msgSend_strokeCount(v4, v58, v59, v60, v61, v62); ++i)
    {
      v68 = 0;
      v69 = v84[__p[i]];
      while (v68 < objc_msgSend_pointCountForStrokeIndex_(v4, v64, i, v65, v66, v67))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v70, i, v68, v73, v74);
        objc_msgSend_addPoint_(v57, v76, v77, v78, v79, v80, v69 + v75);
        ++v68;
      }
      objc_msgSend_endStroke(v57, v70, v71, v72, v73, v74);
    }
    v4 = v57;
  }
  v56 = v4;
  if (v84)
    operator delete(v84);
  v20 = __p;
  if (__p)
LABEL_58:
    operator delete(v20);
LABEL_59:

  return v56;
}

- (unint64_t)pointCount
{
  _BYTE *begin;
  _BYTE *end;
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  int64x2_t v11;
  uint64_t v12;
  const double *v13;
  int64x2_t v14;
  const double *v15;
  unint64_t v16;
  _QWORD *v17;
  float64x2x3_t v18;
  float64x2x3_t v19;

  begin = self->_drawing.strokes.__begin_;
  end = self->_drawing.strokes.__end_;
  if (end == begin)
    return 0;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  v5 = *((_QWORD *)end - 2) == *((_QWORD *)end - 3);
  v6 = *((_QWORD *)end - 2) == *((_QWORD *)end - 3) ? -1 : 0;
  v7 = v4 - v5;
  if (v7 < 1)
    return 0;
  if ((unint64_t)v7 >= 5)
  {
    v10 = v7 & 3;
    if ((v7 & 3) == 0)
      v10 = 4;
    v8 = v7 - v10;
    v11 = 0uLL;
    v12 = v8;
    v13 = (const double *)self->_drawing.strokes.__begin_;
    v14 = 0uLL;
    do
    {
      v15 = v13;
      v13 += 12;
      v18 = vld3q_f64(v15);
      v15 += 6;
      v11 = (int64x2_t)vsraq_n_u64((uint64x2_t)v11, (uint64x2_t)vshrq_n_s64(vsubq_s64((int64x2_t)v18.val[1], (int64x2_t)v18.val[0]), 3uLL), 1uLL);
      v19 = vld3q_f64(v15);
      v14 = (int64x2_t)vsraq_n_u64((uint64x2_t)v14, (uint64x2_t)vshrq_n_s64(vsubq_s64((int64x2_t)v19.val[1], (int64x2_t)v19.val[0]), 3uLL), 1uLL);
      v12 -= 4;
    }
    while (v12);
    result = vaddvq_s64(vaddq_s64(v14, v11));
  }
  else
  {
    v8 = 0;
    result = 0;
  }
  v16 = v4 + v6 - v8;
  v17 = &begin[24 * v8 + 8];
  do
  {
    result += (unint64_t)((uint64_t)(*v17 - *(v17 - 1)) >> 3) >> 1;
    v17 += 3;
    --v16;
  }
  while (v16);
  return result;
}

- (unint64_t)pointCountForStrokeIndex:(unint64_t)a3
{
  return (unint64_t)((uint64_t)(*((_QWORD *)self->_drawing.strokes.__begin_ + 3 * a3 + 1)
                                    - *((_QWORD *)self->_drawing.strokes.__begin_ + 3 * a3)) >> 3) >> 1;
}

- (CGPoint)pointForStrokeIndex:(unint64_t)a3 pointIndex:(unint64_t)a4
{
  double *v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = (double *)(*((_QWORD *)self->_drawing.strokes.__begin_ + 3 * a3) + 16 * a4);
  v5 = *v4;
  v6 = v4[1];
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)startTimeForStroke:(unint64_t)a3
{
  double *begin;
  double result;

  begin = self->_drawing.startTimes.__begin_;
  result = -1.0;
  if (a3 < self->_drawing.startTimes.__end_ - begin)
    return begin[a3];
  return result;
}

- (double)endTimeForStroke:(unint64_t)a3
{
  double *begin;
  double result;

  begin = self->_drawing.endTimes.__begin_;
  result = -1.0;
  if (a3 < self->_drawing.endTimes.__end_ - begin)
    return begin[a3];
  return result;
}

- (unint64_t)strokeCount
{
  _BYTE *end;
  uint64_t v3;

  end = self->_drawing.strokes.__end_;
  v3 = end - (char *)self->_drawing.strokes.__begin_;
  if (v3)
    return 0xAAAAAAAAAAAAAAABLL * (v3 >> 3) - (*((_QWORD *)end - 2) == *((_QWORD *)end - 3));
  else
    return 0;
}

- (id)indexesOfStrokesSmallerThanSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  void *v10;
  _BYTE *end;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  CHDrawingStrokes *p_drawing;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *__p[3];

  height = a3.height;
  width = a3.width;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, v3, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  end = self->_drawing.strokes.__end_;
  v12 = end - (char *)self->_drawing.strokes.__begin_;
  if (v12)
  {
    v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    v14 = *((_QWORD *)end - 2) == *((_QWORD *)end - 3);
    v15 = v13 - v14;
    if (v13 != v14)
    {
      v16 = 0;
      p_drawing = &self->_drawing;
      do
      {
        CHDrawingStrokes::getBoundingBoxForStroke(p_drawing, v16, __p);
        v22 = __p[0];
        if (*((double *)__p[0] + 2) - *(double *)__p[0] >= width
          || *((double *)__p[0] + 3) - *((double *)__p[0] + 1) >= height
          || (objc_msgSend_addIndex_(v10, v18, v16, v19, v20, v21), (v22 = __p[0]) != 0))
        {
          __p[1] = v22;
          operator delete(v22);
        }
        ++v16;
      }
      while (v15 != v16);
    }
  }
  return v10;
}

- (CHDrawing)drawingWithStrokesFromIndexSet:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE68B5EC;
  v22[3] = &unk_1E77F2CB8;
  v11 = v10;
  v23 = v11;
  objc_msgSend_enumerateIndexesUsingBlock_(v4, v12, (uint64_t)v22, v13, v14, v15);
  objc_msgSend_drawingWithStrokesFromIndexArray_(self, v16, (uint64_t)v11, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHDrawing *)v20;
}

- (CHDrawing)drawingWithStrokesFromIndexArray:(id)a3
{
  CHDrawing *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  _QWORD *begin;
  _QWORD *v24;
  const void *v25;
  uint64_t v26;
  int64_t v27;
  char *v28;
  CHDrawing *v29;
  id v30;
  CHDrawing *v31;
  char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v39;
  char **v40;
  __int128 v41;
  __int128 vars0;
  void *v43;

  STACK[0xC38] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v4 = objc_alloc_init(CHDrawing);
  sub_1BE68F7D8((uint64_t)&STACK[0x9A0]);
  v40 = (char **)((unint64_t)&STACK[0x9A0] | 0x60);
  v5 = STACK[0xA00];
  if (STACK[0xA00])
  {
    v6 = STACK[0xA08];
    v7 = (void *)STACK[0xA00];
    if (STACK[0xA08] != v5)
    {
      v8 = STACK[0xA08];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v6 - 16) = v9;
          operator delete(v9);
        }
        v6 = v8;
      }
      while (v8 != v5);
      v7 = (void *)STACK[0xA00];
    }
    STACK[0xA08] = v5;
    operator delete(v7);
  }
  *v40 = 0;
  *(_QWORD *)(((unint64_t)&STACK[0x9A0] | 0x60) + 8) = 0;
  *(_QWORD *)(((unint64_t)&STACK[0x9A0] | 0x60) + 0x10) = 0;
  v41 = 0u;
  vars0 = 0u;
  v11 = v39;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v41, (uint64_t)&STACK[0x920], 16, v13);
  if (v19)
  {
    v20 = *(_QWORD *)vars0;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)vars0 != v20)
            objc_enumerationMutation(v11);
          v22 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), v14, v15, v16, v17, v18);
          begin = self->_drawing.strokes.__begin_;
          v14 = (const char *)&begin[3 * v22];
          v24 = (_QWORD *)STACK[0xA08];
          if (STACK[0xA08] < STACK[0xA10])
            break;
          STACK[0xA08] = (unint64_t)sub_1BE671CD8(v40, (uint64_t)v14);
          if (v19 == ++i)
            goto LABEL_20;
        }
        *v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        v25 = *(const void **)v14;
        v26 = begin[3 * v22 + 1];
        v27 = v26 - *(_QWORD *)v14;
        if (v26 != *(_QWORD *)v14)
        {
          if (v27 < 0)
            sub_1BE61F930();
          v28 = (char *)operator new(v26 - *(_QWORD *)v14);
          *v24 = v28;
          v24[1] = v28;
          v29 = self;
          v30 = v11;
          v31 = v4;
          v32 = &v28[8 * (v27 >> 3)];
          v24[2] = v32;
          memcpy(v28, v25, v27);
          v24[1] = v32;
          v4 = v31;
          v11 = v30;
          self = v29;
        }
        STACK[0xA08] = (unint64_t)(v24 + 3);
      }
LABEL_20:
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v41, (uint64_t)&STACK[0x920], 16, v18);
    }
    while (v19);
  }

  STACK[0xA18] = objc_msgSend_count(v11, v33, v34, v35, v36, v37);
  sub_1BE68A1A4(&STACK[0x9A0]);
  sub_1BE69045C((uint64_t)&v43, (uint64_t)&STACK[0x9A0]);
  if (v4)
    sub_1BE68A9CC((uint64_t)&v4->_drawing, (uint64_t)&v43);
  sub_1BE690148(&v43);
  sub_1BE690148((void **)&STACK[0x9A0]);

  return v4;
}

- (CGPoint)centroidForStrokeIndexes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  CGPoint result;

  v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v14 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_FAULT, "At least one stroke index must be passed", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BE68BB1C;
  v20[3] = &unk_1E77F2CE0;
  v20[4] = self;
  v20[5] = buf;
  v20[6] = &v25;
  v20[7] = &v21;
  objc_msgSend_enumerateIndexesUsingBlock_(v4, v10, (uint64_t)v20, v11, v12, v13);
  v15 = v22[3];
  if (v15 < 1)
  {
    v16 = 0.0;
    v17 = 0.0;
  }
  else
  {
    v16 = *((double *)v30 + 3) / (double)v15;
    v17 = v26[3] / (double)v15;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(buf, 8);

  v18 = v16;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGRect)boundsForStrokeIndexes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[6];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  __n128 (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)();
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x5012000000;
  v19 = sub_1BE68BCB0;
  v20 = nullsub_11;
  v21 = &unk_1BE94989A;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v22 = *MEMORY[0x1E0C9D628];
  v23 = v6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE68BCC0;
  v15[3] = &unk_1E77F2C40;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend_enumerateIndexesUsingBlock_(a3, a2, (uint64_t)v15, v3, v4, v5);
  v7 = v17[6];
  v8 = v17[7];
  v9 = v17[8];
  v10 = v17[9];
  _Block_object_dispose(&v16, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)boundsForStrokeIndex:(unint64_t)a3
{
  _BYTE *end;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *__p[3];
  CGRect result;

  end = self->_drawing.strokes.__end_;
  v4 = end - (char *)self->_drawing.strokes.__begin_;
  if (v4 && (uint64_t)(0xAAAAAAAAAAAAAAABLL * (v4 >> 3) - (*((_QWORD *)end - 2) == *((_QWORD *)end - 3))) > 0)
  {
    CHDrawingStrokes::getBoundingBoxForStroke(&self->_drawing, a3, __p);
    v5 = *(double *)__p[0];
    v6 = *((double *)__p[0] + 1);
    v7 = *((double *)__p[0] + 2) - *(double *)__p[0];
    v8 = *((double *)__p[0] + 3) - v6;
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *__p[3];
  CGRect result;

  CHDrawingStrokes::getBoundingBox(&self->_drawing, (double **)__p);
  v2 = *(double *)__p[0];
  v3 = *((double *)__p[0] + 1);
  v4 = *((double *)__p[0] + 2) - *(double *)__p[0];
  v5 = *((double *)__p[0] + 3) - v3;
  __p[1] = __p[0];
  operator delete(__p[0]);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (float)cumulativePointToPointDistance
{
  _BYTE *begin;
  _BYTE *end;
  float result;
  int64_t v5;
  uint64_t i;
  float64x2_t **v7;
  float64x2_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float64x2_t *v12;
  float32x2_t v13;

  begin = self->_drawing.strokes.__begin_;
  end = self->_drawing.strokes.__end_;
  result = 0.0;
  if (end != begin)
  {
    v5 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3) - (*((_QWORD *)end - 2) == *((_QWORD *)end - 3));
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        v7 = (float64x2_t **)&begin[24 * i];
        v8 = *v7;
        v9 = (char *)v7[1] - (char *)*v7;
        if ((unint64_t)v9 >= 0x19)
        {
          v10 = (unint64_t)(v9 >> 3) >> 1;
          if (v10 <= 2)
            v10 = 2;
          v11 = v10 - 1;
          v12 = v8 + 1;
          do
          {
            v13 = vsub_f32(vcvt_f32_f64(v12[-1]), vcvt_f32_f64(*v12));
            result = result + sqrtf(vaddv_f32(vmul_f32(v13, v13)));
            ++v12;
            --v11;
          }
          while (v11);
        }
      }
    }
  }
  return result;
}

- (float)distanceBetweenFirstAndLastPoint
{
  float64x2_t **begin;
  float64x2_t **end;
  unint64_t v4;
  float32x2_t v5;

  begin = (float64x2_t **)self->_drawing.strokes.__begin_;
  end = (float64x2_t **)self->_drawing.strokes.__end_;
  if (end == begin)
    v4 = -1;
  else
    v4 = ~(unint64_t)(*(end - 2) == *(end - 3)) - 0x5555555555555555 * (end - begin);
  v5 = vsub_f32(vcvt_f32_f64(**begin), vcvt_f32_f64(*(float64x2_t *)((char *)begin[3 * v4]+ (((char *)begin[3 * v4 + 1] - (char *)begin[3 * v4]) & 0xFFFFFFFFFFFFFFF0)- 16)));
  return sqrtf(vaddv_f32(vmul_f32(v5, v5)));
}

- (void)addPoint:(CGPoint)a3
{
  sub_1BE688E58(&self->_drawing.strokeBounds.__begin_, a3.x, a3.y);
}

- (void)addStartTime:(double)a3
{
  sub_1BE68A2DC(&self->_drawing.strokeBounds.__begin_, a3);
}

- (void)addEndTime:(double)a3
{
  sub_1BE68A454(&self->_drawing.strokeBounds.__begin_, a3);
}

- (void)endStroke
{
  if (*((_QWORD *)self->_drawing.strokes.__end_ - 2) != *((_QWORD *)self->_drawing.strokes.__end_ - 3))
  {
    ++self->_drawing.currentStrokeIndex;
    sub_1BE68A1A4(&self->_drawing.strokeBounds.__begin_);
  }
}

- (void)clear
{
  sub_1BE683638((uint64_t *)&self->_drawing);
}

- (BOOL)isPrefixForDrawing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  unint64_t i;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;

  v4 = a3;
  v10 = objc_msgSend_pointCount(self, v5, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_pointCount(v4, v11, v12, v13, v14, v15)
    && (v21 = objc_msgSend_strokeCount(self, v16, v17, v18, v19, v20),
        v21 <= objc_msgSend_strokeCount(v4, v22, v23, v24, v25, v26)))
  {
    for (i = 0; ; ++i)
    {
      v35 = objc_msgSend_strokeCount(self, v27, v28, v29, v30, v31);
      v32 = i >= v35;
      if (i >= v35)
        break;
      v40 = objc_msgSend_pointCountForStrokeIndex_(self, v36, i, v37, v38, v39);
      if (v40 > objc_msgSend_pointCountForStrokeIndex_(v4, v41, i, v42, v43, v44))
        break;
      v49 = 0;
      while (v49 < objc_msgSend_pointCountForStrokeIndex_(self, v45, i, v46, v47, v48))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(self, v27, i, v49, v30, v31);
        v51 = v50;
        v53 = v52;
        objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v54, i, v49, v55, v56);
        v32 = 0;
        if (v51 == v58)
        {
          ++v49;
          if (v53 == v57)
            continue;
        }
        goto LABEL_4;
      }
    }
  }
  else
  {
    v32 = 0;
  }
LABEL_4:

  return v32;
}

- (_NSRange)matchingStrokePrefixRangeForDrawing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t i;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  NSUInteger v39;
  NSUInteger v40;
  _NSRange result;

  v9 = a3;
  for (i = 0; i < objc_msgSend_strokeCount(self, v4, v5, v6, v7, v8); ++i)
  {
    if (i >= objc_msgSend_strokeCount(v9, v11, v12, v13, v14, v15))
      break;
    v20 = objc_msgSend_pointCountForStrokeIndex_(self, v16, i, v17, v18, v19);
    if (v20 != objc_msgSend_pointCountForStrokeIndex_(v9, v21, i, v22, v23, v24))
      break;
    v29 = 0;
    while (v29 < objc_msgSend_pointCountForStrokeIndex_(self, v25, i, v26, v27, v28))
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v4, i, v29, v7, v8);
      v31 = v30;
      v33 = v32;
      objc_msgSend_pointForStrokeIndex_pointIndex_(v9, v34, i, v29, v35, v36);
      if (v31 == v38)
      {
        ++v29;
        if (v33 == v37)
          continue;
      }
      goto LABEL_11;
    }
  }
LABEL_11:

  v39 = 0;
  v40 = i;
  result.length = v40;
  result.location = v39;
  return result;
}

- (BOOL)isEqualToDrawing:(id)a3
{
  CHDrawing *v4;
  CHDrawing *v5;
  uint64_t v6;
  char *end;
  char *begin;
  BOOL v9;
  double *v10;
  double *v11;
  double *v12;
  int64_t currentStrokeIndex;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  STACK[0x598] = *MEMORY[0x1E0C80C00];
  v4 = (CHDrawing *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      sub_1BE69045C((uint64_t)&v16, (uint64_t)&v4->_drawing);
      v6 = v17;
      begin = (char *)self->_drawing.strokes.__begin_;
      end = (char *)self->_drawing.strokes.__end_;
      if (end - begin == v18 - v17)
        goto LABEL_9;
    }
    else
    {
      bzero(&v16, 0x280uLL);
      v6 = 0;
      begin = (char *)self->_drawing.strokes.__begin_;
      end = (char *)self->_drawing.strokes.__end_;
      if (end == begin)
      {
        while (1)
        {
LABEL_9:
          if (begin == end)
          {
            sub_1BE690148(&v16);
            currentStrokeIndex = self->_drawing.currentStrokeIndex;
            if (v5)
            {
              sub_1BE69045C((uint64_t)&v16, (uint64_t)&v5->_drawing);
              v14 = v19;
            }
            else
            {
              bzero(&v16, 0x280uLL);
              v14 = 0;
            }
            v9 = currentStrokeIndex == v14;
            sub_1BE690148(&v16);
            goto LABEL_18;
          }
          v11 = *(double **)begin;
          v10 = (double *)*((_QWORD *)begin + 1);
          v12 = *(double **)v6;
          if ((double *)((char *)v10 - *(_QWORD *)begin) != (double *)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6))
            goto LABEL_4;
          if (v11 != v10)
            break;
LABEL_8:
          begin += 24;
          v6 += 24;
        }
        while (*v11 == *v12)
        {
          ++v11;
          ++v12;
          if (v11 == v10)
            goto LABEL_8;
        }
      }
    }
LABEL_4:
    sub_1BE690148(&v16);
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToDrawing;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToDrawing = objc_msgSend_isEqualToDrawing_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToDrawing;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v12 = 0;
  if (objc_msgSend_strokeCount(self, a2, v2, v3, v4, v5))
  {
    v13 = 0;
    do
      v12 += objc_msgSend_pointCountForStrokeIndex_(self, v7, v13++, v9, v10, v11);
    while (v13 < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18));
  }
  return objc_msgSend_strokeCount(self, v7, v8, v9, v10, v11) + v12;
}

- (id)xyRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t j;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_strokeCount(self, v7, v8, v9, v10, v11); ++i)
  {
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v14, i, v15, v16, v17); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v19, i, j, v21, v22);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("%d %d\n"), v26, v27, v28, (int)v23, (int)v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v12, v30, (uint64_t)v29, v31, v32, v33);

    }
    objc_msgSend_appendString_(v12, v19, (uint64_t)CFSTR(";\n"), v20, v21, v22);
  }
  return v12;
}

- (id)jsonRepresentationWithContext:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t i;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t j;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v62;
  id v63;
  _QWORD v64[3];

  v64[2] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v63 = (id)objc_msgSend_mutableCopy(v62, v4, v5, v6, v7, v8);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18); ++i)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v21, v22, v23, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v26, i, v27, v28, v29); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v32, i, j, v34, v35);
      v37 = v36;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v38, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v43;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v44, v45, v46, v47, v48, v37);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v49;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v50, (uint64_t)v64, 2, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v30, v54, (uint64_t)v53, v55, v56, v57);

    }
    objc_msgSend_addObject_(v19, v32, (uint64_t)v30, v33, v34, v35);

  }
  objc_msgSend_setObject_forKeyedSubscript_(v63, v21, (uint64_t)v19, (uint64_t)CFSTR("data"), v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v63, v58, (uint64_t)&unk_1E7827290, (uint64_t)CFSTR("channels"), v59, v60);

  return v63;
}

- (Matrix<float>)bitmapRepresentationForSize:(SEL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unsigned int v49;

  return (Matrix<float> *)CHDrawingStrokes::generateBitmap(&self->_drawing, (int)a4.width, (uint64_t)retstr, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                            v21,
                            v22,
                            v23,
                            v24,
                            v25,
                            v26,
                            v27,
                            v28,
                            v29,
                            v30,
                            v31,
                            v32,
                            v33,
                            v34,
                            v35,
                            v36,
                            v37,
                            v38,
                            v39,
                            v40,
                            v41,
                            v42,
                            v43,
                            v44,
                            v45,
                            v46,
                            v47,
                            v48,
                            v49);
}

- (Matrix<float>)orientationRepresentationForSampling:(SEL)a3 convolutionWidth:(unint64_t)a4
{
  Matrix<float> *result;

  CHDrawingStrokes::generateOrientation(&self->_drawing, a4, a5, (uint64_t)retstr);
  return result;
}

- (id)sortedDrawingUsingMinXCoordinate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t (*v21)(uint64_t *, uint64_t *);
  unint64_t v22;
  unint64_t v23;
  void *v24;

  STACK[0xB78] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_copy(self, a2, v2, v3, v4, v5);
  v7 = (void *)v6;
  if (v6)
  {
    sub_1BE69045C((uint64_t)&STACK[0x8C0], v6 + 128);
    v8 = (uint64_t *)STACK[0x920];
    v9 = (uint64_t *)STACK[0x928];
  }
  else
  {
    bzero(&STACK[0x8C0], 0x280uLL);
    v9 = 0;
    v8 = 0;
  }
  v10 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v9 - v8));
  v21 = (uint64_t (*)(uint64_t *, uint64_t *))sub_1BE690CF4;
  if (v9 == v8)
    v11 = 0;
  else
    v11 = v10;
  sub_1BE690D90(v8, v9, &v21, v11, 1);
  if (STACK[0x928] == STACK[0x920])
  {
    v15 = 0;
    v14 = 0;
    v17 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_18;
  }
  v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(STACK[0x928] - STACK[0x920]) >> 3);
  v13 = *(_QWORD *)(STACK[0x928] - 16) == *(_QWORD *)(STACK[0x928] - 24);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if ((v14 & 0x8000000000000000) != 0)
      sub_1BE61F930();
    v15 = ((v14 - 1) >> 6) + 1;
    v16 = operator new(8 * v15);
    v17 = (unint64_t)v16;
    v22 = v14;
    v23 = v15;
    if (v14 >= 0x41)
      v18 = (v14 - 1) >> 6;
    else
      v18 = 0;
    v16[v18] = 0;
    if (v14 >= 0x40)
      bzero(v16, 8 * (v14 >> 6));
    if ((v14 & 0x3F) != 0)
    {
      *(_QWORD *)(v17 + 8 * (v14 >> 6)) &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v14 & 0x3F));
      v19 = (void *)STACK[0x8D8];
      if (!STACK[0x8D8])
        goto LABEL_20;
LABEL_19:
      operator delete(v19);
      v14 = v22;
      v15 = v23;
      goto LABEL_20;
    }
LABEL_18:
    v19 = (void *)STACK[0x8D8];
    if (!STACK[0x8D8])
      goto LABEL_20;
    goto LABEL_19;
  }
  v15 = 0;
  v17 = 0;
  v19 = (void *)STACK[0x8D8];
  if (STACK[0x8D8])
    goto LABEL_19;
LABEL_20:
  STACK[0x8D8] = v17;
  STACK[0x8E0] = v14;
  STACK[0x8E8] = v15;
  sub_1BE69045C((uint64_t)&v24, (uint64_t)&STACK[0x8C0]);
  if (v7)
    sub_1BE68A9CC((uint64_t)v7 + 128, (uint64_t)&v24);
  sub_1BE690148(&v24);
  sub_1BE690148((void **)&STACK[0x8C0]);
  return v7;
}

- (id)sortedDrawingUsingStrokeMidPoint:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t i;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double *v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  double *v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  char *v36;
  double *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  double *v41;
  double *v42;
  size_t v43;
  int64x2_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  unint64_t v48;
  int64x2_t v49;
  int64x2_t *v50;
  int64x2_t v51;
  int64x2_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  _QWORD *v71;
  void *__p;
  double *v73;
  double *v74;
  void **p_p;

  v7 = 0;
  __p = 0;
  v73 = 0;
  v74 = 0;
  for (i = objc_msgSend_strokeCount(self, a2, (uint64_t)a3, v3, v4, v5, a3);
        v7 < i;
        i = objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18, v71))
  {
    objc_msgSend_boundsForStrokeIndex_(self, v9, v7, v10, v11, v12);
    v21 = v19 + v20 * 0.5;
    v22 = v73;
    if (v73 < v74)
    {
      *v73 = v21;
      v13 = (uint64_t)(v22 + 1);
      goto LABEL_3;
    }
    v23 = (double *)__p;
    v24 = (char *)v73 - (_BYTE *)__p;
    v25 = ((char *)v73 - (_BYTE *)__p) >> 3;
    v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 61)
      sub_1BE61F930();
    v27 = (char *)v74 - (_BYTE *)__p;
    if (((char *)v74 - (_BYTE *)__p) >> 2 > v26)
      v26 = v27 >> 2;
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
      v28 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v28 = v26;
    if (v28)
    {
      if (v28 >> 61)
        sub_1BE61F100();
      v29 = (char *)operator new(8 * v28);
      v30 = (double *)&v29[8 * v25];
      *v30 = v21;
      v13 = (uint64_t)(v30 + 1);
      v31 = (char *)v22 - (char *)v23;
      if (v22 == v23)
        goto LABEL_23;
LABEL_17:
      v32 = v31 - 8;
      if (v32 < 0x58)
        goto LABEL_54;
      if ((unint64_t)((char *)v22 - &v29[v24]) < 0x20)
        goto LABEL_54;
      v33 = (v32 >> 3) + 1;
      v34 = 8 * (v33 & 0x3FFFFFFFFFFFFFFCLL);
      v35 = &v22[v34 / 0xFFFFFFFFFFFFFFF8];
      v30 = (double *)((char *)v30 - v34);
      v36 = &v29[8 * v25 - 16];
      v37 = v22 - 2;
      v38 = v33 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v39 = *(_OWORD *)v37;
        *((_OWORD *)v36 - 1) = *((_OWORD *)v37 - 1);
        *(_OWORD *)v36 = v39;
        v36 -= 32;
        v37 -= 4;
        v38 -= 4;
      }
      while (v38);
      v22 = v35;
      if (v33 != (v33 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_54:
        do
        {
          v40 = *((_QWORD *)v22-- - 1);
          *((_QWORD *)v30-- - 1) = v40;
        }
        while (v22 != v23);
      }
      goto LABEL_23;
    }
    v29 = 0;
    v30 = (double *)(8 * v25);
    *(double *)(8 * v25) = v21;
    v13 = 8 * v25 + 8;
    v31 = (char *)v22 - (char *)v23;
    if (v22 != v23)
      goto LABEL_17;
LABEL_23:
    __p = v30;
    v74 = (double *)&v29[8 * v28];
    if (v23)
      operator delete(v23);
LABEL_3:
    v73 = (double *)v13;
    ++v7;
  }
  v42 = (double *)__p;
  v41 = v73;
  v43 = (char *)v73 - (_BYTE *)__p;
  if (v73 == __p)
  {
    v44 = 0;
    v45 = 0;
  }
  else
  {
    if ((v43 & 0x8000000000000000) != 0)
      sub_1BE61F930();
    v44 = (int64x2_t *)operator new((char *)v73 - (_BYTE *)__p);
    bzero(v44, v43);
    v45 = (uint64_t *)((char *)v44->i64 + v43);
    if (v43 - 8 < 0x18)
    {
      v46 = 0;
      v47 = (uint64_t *)v44;
      goto LABEL_33;
    }
    v48 = ((v43 - 8) >> 3) + 1;
    v46 = v48 & 0x3FFFFFFFFFFFFFFCLL;
    v47 = &v44->i64[v48 & 0x3FFFFFFFFFFFFFFCLL];
    v49 = (int64x2_t)xmmword_1BE8D5080;
    v50 = v44 + 1;
    v51 = vdupq_n_s64(2uLL);
    v52 = vdupq_n_s64(4uLL);
    v53 = v48 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v50[-1] = v49;
      *v50 = vaddq_s64(v49, v51);
      v49 = vaddq_s64(v49, v52);
      v50 += 2;
      v53 -= 4;
    }
    while (v53);
    if (v48 != v46)
    {
      do
LABEL_33:
        *v47++ = v46++;
      while (v47 != v45);
    }
  }
  p_p = &__p;
  v54 = ((char *)v45 - (char *)v44) >> 3;
  v55 = 126 - 2 * __clz(v54);
  if (v41 == v42)
    v56 = 0;
  else
    v56 = v55;
  sub_1BE694884((uint64_t)v44, v45, (uint64_t **)&p_p, v56, 1);
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v41 != v42)
  {
    if (v54 <= 1)
      v54 = 1;
    v62 = (uint64_t *)v44;
    do
    {
      v63 = *v62++;
      objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v57, v63, v58, v59, v60);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v61, v65, (uint64_t)v64, v66, v67, v68);

      --v54;
    }
    while (v54);
  }
  objc_msgSend_drawingWithStrokesFromIndexArray_(self, v57, (uint64_t)v61, v58, v59, v60);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    *v71 = objc_retainAutorelease(v61);

  if (v44)
    operator delete(v44);
  if (__p)
  {
    v73 = (double *)__p;
    operator delete(__p);
  }
  return v69;
}

- (id)sortedDrawingUsingStrokeMidPointHorizontalOverlapAware:(id *)a3 shouldSortRTL:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  int64x2_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  int64x2_t v21;
  int64x2_t *v22;
  int64x2_t v23;
  int64x2_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  unint64_t i;
  _QWORD *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  __int128 v58;
  char *v59;
  const std::nothrow_t *v60;
  unint64_t v61;
  uint64_t *v62;
  BOOL v63;
  uint64_t *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  int64x2_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  _QWORD *v93;
  _BOOL4 v94;
  void *__p;
  unint64_t v96;
  char *v97;
  int64x2_t *v98;
  __int8 *v99;
  uint64_t v100;
  __int128 v101;

  v6 = a4;
  v9 = objc_msgSend_strokeCount(self, a2, (uint64_t)a3, a4, v4, v5);
  v99 = 0;
  v100 = 0;
  v98 = 0;
  v94 = v6;
  if (v9)
  {
    if (v9 >> 61)
      sub_1BE61F930();
    v15 = 8 * v9;
    v16 = (int64x2_t *)operator new(8 * v9);
    v98 = v16;
    bzero(v16, v15);
    v17 = &v16->i64[v15 / 8];
    v99 = &v16->i8[v15];
    if (v15 - 8 >= 0x18)
    {
      v20 = ((v15 - 8) >> 3) + 1;
      v18 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      v19 = &v16->i64[v20 & 0x3FFFFFFFFFFFFFFCLL];
      v21 = (int64x2_t)xmmword_1BE8D5080;
      v22 = v16 + 1;
      v23 = vdupq_n_s64(2uLL);
      v24 = vdupq_n_s64(4uLL);
      v25 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v22[-1] = v21;
        *v22 = vaddq_s64(v21, v23);
        v21 = vaddq_s64(v21, v24);
        v22 += 2;
        v25 -= 4;
      }
      while (v25);
      if (v20 == v18)
        goto LABEL_10;
    }
    else
    {
      v18 = 0;
      v19 = (uint64_t *)v16;
    }
    do
      *v19++ = v18++;
    while (v19 != v17);
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
LABEL_10:
  __p = 0;
  v96 = 0;
  v97 = 0;
  v26 = objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14, a3);
  v32 = v26;
  if (v26)
  {
    if (v26 >> 59)
      sub_1BE61F930();
    v33 = (char *)operator new(32 * v26);
    __p = &v33[v96 & 0xFFFFFFFFFFFFFFE0];
    v96 = (unint64_t)__p;
    v97 = &v33[32 * v32];
  }
  for (i = 0; i < objc_msgSend_strokeCount(self, v27, v28, v29, v30, v31); ++i)
  {
    objc_msgSend_boundsForStrokeIndex_(self, v36, i, v37, v38, v39);
    v44 = v40;
    v45 = v41;
    v46 = v42;
    v47 = v43;
    v48 = (_QWORD *)v96;
    if (v96 < (unint64_t)v97)
    {
      *(_QWORD *)v96 = v40;
      v48[1] = v41;
      v35 = v48 + 4;
      v48[2] = v42;
      v48[3] = v43;
      goto LABEL_15;
    }
    v49 = __p;
    v50 = (uint64_t)(v96 - (_QWORD)__p) >> 5;
    v51 = v50 + 1;
    if ((unint64_t)(v50 + 1) >> 59)
      sub_1BE61F930();
    v52 = v97 - (_BYTE *)__p;
    if ((v97 - (_BYTE *)__p) >> 4 > v51)
      v51 = v52 >> 4;
    if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFE0)
      v53 = 0x7FFFFFFFFFFFFFFLL;
    else
      v53 = v51;
    if (v53)
    {
      if (v53 >> 59)
        sub_1BE61F100();
      v54 = (char *)operator new(32 * v53);
      v55 = &v54[32 * v50];
      *(_QWORD *)v55 = v44;
      *((_QWORD *)v55 + 1) = v45;
      *((_QWORD *)v55 + 2) = v46;
      *((_QWORD *)v55 + 3) = v47;
      v56 = v55;
      if (v48 == v49)
      {
LABEL_27:
        v57 = &v54[32 * v53];
        v35 = v55 + 32;
        __p = v56;
        v97 = v57;
        if (v48)
          goto LABEL_32;
        goto LABEL_15;
      }
    }
    else
    {
      v54 = 0;
      v55 = (char *)(32 * v50);
      *(_QWORD *)v55 = v40;
      *((_QWORD *)v55 + 1) = v41;
      *((_QWORD *)v55 + 2) = v42;
      *((_QWORD *)v55 + 3) = v43;
      v56 = (char *)(32 * v50);
      if (v48 == v49)
        goto LABEL_27;
    }
    do
    {
      v58 = *((_OWORD *)v48 - 1);
      *((_OWORD *)v56 - 2) = *((_OWORD *)v48 - 2);
      *((_OWORD *)v56 - 1) = v58;
      v56 -= 32;
      v48 -= 4;
    }
    while (v48 != v49);
    v48 = v49;
    v59 = &v54[32 * v53];
    v35 = v55 + 32;
    __p = v56;
    v97 = v59;
    if (v49)
LABEL_32:
      operator delete(v48);
LABEL_15:
    v96 = (unint64_t)v35;
  }
  *(_QWORD *)&v101 = &__p;
  *((_QWORD *)&v101 + 1) = v94;
  if ((char *)v17 - (char *)v16 < 1025)
  {
LABEL_37:
    v64 = 0;
    v61 = 0;
  }
  else
  {
    v60 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v61 = ((char *)v17 - (char *)v16) >> 3;
    while (1)
    {
      v62 = (uint64_t *)operator new(8 * v61, v60);
      if (v62)
        break;
      v63 = v61 > 1;
      v61 >>= 1;
      if (!v63)
        goto LABEL_37;
    }
    v64 = v62;
  }
  *(_QWORD *)&v70 = sub_1BE695874(v16->i64, v17, &v101, ((char *)v17 - (char *)v16) >> 3, v64, v61).n128_u64[0];
  if (v64)
    operator delete(v64);
  v71 = (void *)MEMORY[0x1E0C99DE8];
  v72 = objc_msgSend_strokeCount(self, v65, v66, v67, v68, v69, v70);
  objc_msgSend_arrayWithCapacity_(v71, v73, v72, v74, v75, v76);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v98;
  if (v99 != (__int8 *)v98)
  {
    if ((unint64_t)((v99 - (__int8 *)v98) >> 3) <= 1)
      v83 = 1;
    else
      v83 = (v99 - (__int8 *)v98) >> 3;
    v84 = (uint64_t *)v98;
    do
    {
      v85 = *v84++;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v77, v85, v78, v79, v80);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v81, v87, (uint64_t)v86, v88, v89, v90);

      --v83;
    }
    while (v83);
  }
  objc_msgSend_drawingWithStrokesFromIndexArray_(self, v77, (uint64_t)v81, v78, v79, v80);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
    *v93 = objc_retainAutorelease(v81);

  if (__p)
  {
    v96 = (unint64_t)__p;
    operator delete(__p);
  }
  if (v82)
    operator delete(v82);
  return v91;
}

- (id)drawingScaledByFactor:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return (id)objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(self, a2, v3, v4, v5, v6, 0.0, 0.0, a3);
}

- (id)drawingTransformedWithTranslation:(CGVector)a3 scaleFactor:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double dy;
  double dx;
  CHDrawing *v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t i;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t j;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  dy = a3.dy;
  dx = a3.dx;
  if (a4 == 1.0 && a3.dx == 0.0 && a3.dy == 0.0)
  {
    v12 = (CHDrawing *)objc_msgSend_copy(self, a2, v4, v5, v6, v7);
  }
  else
  {
    v12 = objc_alloc_init(CHDrawing);
    for (i = 0; i < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18); ++i)
    {
      for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v20, i, v21, v22, v23); ++j)
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(self, v25, i, j, v28, v29);
        objc_msgSend_addPoint_(v12, v32, v33, v34, v35, v36, (dx + v30) * a4, (dy + v31) * a4);
      }
      objc_msgSend_endStroke(v12, v25, v26, v27, v28, v29);
    }
  }
  return v12;
}

- (id)drawingSpatiallyResampled:(double)a3 outputPointMap:(void *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  void *v10;
  float v11;
  void *v13;

  STACK[0xF78] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend_copy(self, a2, (uint64_t)a4, v4, v5, v6);
  v10 = (void *)v9;
  if (v9)
    sub_1BE69045C((uint64_t)&STACK[0xCC0], v9 + 128);
  else
    bzero(&STACK[0xCC0], 0x280uLL);
  sub_1BE68F7D8((uint64_t)&STACK[0xA40]);
  v11 = a3;
  sub_1BE68721C((uint64_t)&STACK[0xCC0], (uint64_t *)&STACK[0xA40], a4, 0x7FFFFFFFFFFFFFFFLL, v11);
  sub_1BE69045C((uint64_t)&v13, (uint64_t)&STACK[0xA40]);
  if (v10)
    sub_1BE68A9CC((uint64_t)v10 + 128, (uint64_t)&v13);
  sub_1BE690148(&v13);
  sub_1BE690148((void **)&STACK[0xA40]);
  sub_1BE690148((void **)&STACK[0xCC0]);
  return v10;
}

- (id)drawingSpatiallyResampled:(double)a3 maxPointsPerStroke:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  void *v10;
  float v11;
  void *v13;

  STACK[0xF78] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend_copy(self, a2, a4, v4, v5, v6);
  v10 = (void *)v9;
  if (v9)
    sub_1BE69045C((uint64_t)&STACK[0xCC0], v9 + 128);
  else
    bzero(&STACK[0xCC0], 0x280uLL);
  sub_1BE68F7D8((uint64_t)&STACK[0xA40]);
  v11 = a3;
  sub_1BE68721C((uint64_t)&STACK[0xCC0], (uint64_t *)&STACK[0xA40], 0, a4, v11);
  sub_1BE69045C((uint64_t)&v13, (uint64_t)&STACK[0xA40]);
  if (v10)
    sub_1BE68A9CC((uint64_t)v10 + 128, (uint64_t)&v13);
  sub_1BE690148(&v13);
  sub_1BE690148((void **)&STACK[0xA40]);
  sub_1BE690148((void **)&STACK[0xCC0]);
  return v10;
}

- (id)drawingSpatiallyResampled:(double)a3
{
  return (id)((uint64_t (*)(CHDrawing *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_drawingSpatiallyResampled_maxPointsPerStroke_, 0x7FFFFFFFLL);
}

- (id)drawingResampledWithCatmullRomSplineInterpolation:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  float v10;
  void *v12;

  STACK[0xF78] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend_copy(self, a2, v3, v4, v5, v6);
  v9 = (void *)v8;
  if (v8)
    sub_1BE69045C((uint64_t)&STACK[0xCC0], v8 + 128);
  else
    bzero(&STACK[0xCC0], 0x280uLL);
  sub_1BE68F7D8((uint64_t)&STACK[0xA40]);
  v10 = a3;
  CHDrawingStrokes::resampleStrokesWithCatmullRomSplineInterpolation((CHDrawingStrokes *)&STACK[0xCC0], (CHDrawingStrokes *)&STACK[0xA40], v10);
  sub_1BE69045C((uint64_t)&v12, (uint64_t)&STACK[0xA40]);
  if (v9)
    sub_1BE68A9CC((uint64_t)v9 + 128, (uint64_t)&v12);
  sub_1BE690148(&v12);
  sub_1BE690148((void **)&STACK[0xA40]);
  sub_1BE690148((void **)&STACK[0xCC0]);
  return v9;
}

- (CHDrawing)drawingWithLastStrokes:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHDrawing *v15;
  uint64_t v16;
  unint64_t i;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CHDrawing *v28;

  v8 = objc_msgSend_strokeCount(self, a2, a3, v3, v4, v5);
  v9 = v8 - a3;
  if (v8 <= a3)
  {
    v28 = self;
  }
  else
  {
    v10 = v8;
    v15 = objc_alloc_init(CHDrawing);
    v16 = v9 & ~(v9 >> 63);
    if (v16 < v10)
    {
      do
      {
        for (i = 0; i < objc_msgSend_pointCountForStrokeIndex_(self, v11, v16, v12, v13, v14); ++i)
        {
          objc_msgSend_pointForStrokeIndex_pointIndex_(self, v18, v16, i, v21, v22);
          objc_msgSend_addPoint_(v15, v23, v24, v25, v26, v27);
        }
        objc_msgSend_endStroke(v15, v18, v19, v20, v21, v22);
        ++v16;
      }
      while (v16 != v10);
    }
    v28 = v15;
  }
  return v28;
}

- (id)singleStrokeDrawing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHDrawing *v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t j;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if ((unint64_t)objc_msgSend_strokeCount(self, a2, v2, v3, v4, v5) <= 1)
    return self;
  v12 = objc_alloc_init(CHDrawing);
  for (i = 0; i < objc_msgSend_strokeCount(self, v7, v8, v9, v10, v11); ++i)
  {
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v14, i, v16, v17, v18); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v7, i, j, v10, v11);
      objc_msgSend_addPoint_(v12, v20, v21, v22, v23, v24);
    }
  }
  objc_msgSend_endStroke(v12, v14, v15, v16, v17, v18);
  return v12;
}

- (vector<long,)strokeIndicesSortedByMinXCoordinate
{
  _BYTE *begin;
  _BYTE *end;
  uint64_t v6;
  int64_t v7;
  int64_t *v8;
  int64_t *v9;
  int64_t *v10;
  int64_t v11;
  int64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  int64_t *v17;
  int64_t v18;
  unint64_t v19;
  int64_t *v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  int64_t *v26;
  uint64_t v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *p_strokes;
  uint64_t *v33;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  begin = self->_drawing.strokes.__begin_;
  p_strokes = (uint64_t *)&self->_drawing.strokes;
  end = self->_drawing.strokes.__end_;
  v6 = end - begin;
  if (end != begin)
  {
    v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3) - (*((_QWORD *)end - 2) == *((_QWORD *)end - 3));
    if (v7 >= 1)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        while (v10 < v9)
        {
          *v10++ = v11;
          v12 = v10;
          retstr->var1 = v10;
          if (++v11 == v7)
            goto LABEL_35;
        }
        v13 = v10 - v8;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61)
          sub_1BE61F930();
        if (((char *)v9 - (char *)v8) >> 2 > v14)
          v14 = ((char *)v9 - (char *)v8) >> 2;
        if ((unint64_t)((char *)v9 - (char *)v8) >= 0x7FFFFFFFFFFFFFF8)
          v15 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v15 = v14;
        if (v15)
        {
          if (v15 >> 61)
            sub_1BE61F100();
          v16 = operator new(8 * v15);
          v17 = (int64_t *)&v16[8 * v13];
          *v17 = v11;
          v12 = v17 + 1;
          v18 = (char *)v10 - (char *)v8;
          if (v10 == v8)
            goto LABEL_20;
        }
        else
        {
          v16 = 0;
          v17 = (int64_t *)(8 * v13);
          *(_QWORD *)(8 * v13) = v11;
          v12 = (int64_t *)(8 * v13 + 8);
          v18 = (char *)v10 - (char *)v8;
          if (v10 == v8)
            goto LABEL_20;
        }
        v19 = v18 - 8;
        if (v19 >= 0x168)
        {
          v22 = ((char *)(v10 - 1) - (char *)v8) & 0xFFFFFFFFFFFFFFF8;
          if (&v16[(char *)v10 - (char *)v8 - 8 - v22] > &v16[(char *)v10 - (char *)v8 - 8])
          {
            v20 = v10;
          }
          else if ((int64_t *)((char *)v10 - v22 - 8) > v10 - 1)
          {
            v20 = v10;
          }
          else if ((unint64_t)((char *)v8 - v16) >= 0x20)
          {
            v23 = (v19 >> 3) + 1;
            v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
            v20 = &v10[v24 / 0xFFFFFFFFFFFFFFF8];
            v17 = (int64_t *)((char *)v17 - v24);
            v25 = &v16[8 * v13 - 16];
            v26 = v10 - 2;
            v27 = v23 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v28 = *(_OWORD *)v26;
              *(v25 - 1) = *((_OWORD *)v26 - 1);
              *v25 = v28;
              v25 -= 2;
              v26 -= 4;
              v27 -= 4;
            }
            while (v27);
            if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_20;
          }
          else
          {
            v20 = v10;
          }
        }
        else
        {
          v20 = v10;
        }
        do
        {
          v21 = *--v20;
          *--v17 = v21;
        }
        while (v20 != v8);
LABEL_20:
        v9 = (int64_t *)&v16[8 * v15];
        retstr->var0 = v17;
        retstr->var1 = v12;
        retstr->var2.var0 = v9;
        if (v8)
          operator delete(v8);
        v8 = v17;
        retstr->var1 = v12;
        ++v11;
        v10 = v12;
        if (v11 == v7)
          goto LABEL_35;
      }
    }
  }
  v12 = 0;
  v8 = 0;
LABEL_35:
  v29 = 126 - 2 * __clz(v12 - v8);
  v33 = p_strokes;
  if (v12 == v8)
    v30 = 0;
  else
    v30 = v29;
  return (vector<long, std::allocator<long>> *)sub_1BE691F8C((unint64_t)v8, v12, &v33, v30, 1);
}

- (void)setLineHeight:(double)a3
{
  *(double *)&self[2].super.isa = a3;
}

- (void)appendSegment:(id)a3 fromDrawing:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;

  v70 = a3;
  v6 = a4;
  objc_msgSend_startCutPoint(v70, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_strokeIndex(v12, v13, v14, v15, v16, v17);

  objc_msgSend_endCutPoint(v70, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_strokeIndex(v24, v25, v26, v27, v28, v29);

  objc_msgSend_startCutPoint(v70, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_pointIndex(v36, v37, v38, v39, v40, v41);

  if (v18 <= v30)
  {
    v48 = v18;
    do
    {
      if (v48 != v18)
        v42 = 0;
      objc_msgSend_endCutPoint(v70, v43, v44, v45, v46, v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend_pointIndex(v50, v51, v52, v53, v54, v55);

      v61 = objc_msgSend_pointCountForStrokeIndex_(v6, v57, v48, v58, v59, v60);
      v62 = v61 - 1;
      if (v61 >= 1)
      {
        if (v48 == v30)
          v62 = v56;
        if (v42 <= v62)
        {
          v63 = v62 + 1;
          v64 = v42;
          do
          {
            objc_msgSend_pointForStrokeIndex_pointIndex_(v6, v43, v48, v64, v46, v47);
            objc_msgSend_addPoint_(self, v65, v66, v67, v68, v69);
            ++v64;
          }
          while (v63 != v64);
        }
        objc_msgSend_endStroke(self, v43, v44, v45, v46, v47);
      }
    }
    while (v48++ != v30);
  }

}

- (void)appendDrawing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t j;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  for (i = 0; i < objc_msgSend_strokeCount(v25, v4, v5, v6, v7, v8); ++i)
  {
    for (j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v25, v10, i, v11, v12, v13); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(v25, v15, i, j, v18, v19);
      objc_msgSend_addPoint_(self, v20, v21, v22, v23, v24);
    }
    objc_msgSend_endStroke(self, v15, v16, v17, v18, v19);
  }

}

- (double)averageCharacterHeightEstimation:(double)a3 minChunkHeight:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t i;
  CGRect *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGRect *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  CGSize size;
  unint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  CGFloat v49;
  double v50;
  double MaxX;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double MinX;
  BOOL IsNull;
  char v58;
  double v60;
  CGRect *v61;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat r2;
  double v72;
  CGFloat v73;
  double v74;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGRect *__p;
  CGRect *v81;
  CGRect *v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  __p = 0;
  v81 = 0;
  v82 = 0;
  v9 = objc_msgSend_strokeCount(self, a2, v4, v5, v6, v7);
  v15 = v9;
  if (v9)
  {
    if (v9 >> 59)
      sub_1BE61F930();
    __p = (CGRect *)operator new(32 * v9);
    v81 = __p;
    v82 = &__p[v15];
  }
  for (i = 0; i < objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14); ++i)
  {
    objc_msgSend_boundsForStrokeIndex_(self, v18, i, v19, v20, v21);
    v26 = v22;
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = v81;
    if (v81 < v82)
    {
      v81->origin.x = v22;
      v81->origin.y = v23;
      v17 = v81 + 1;
      v81->size.width = v24;
      v81->size.height = v25;
      goto LABEL_6;
    }
    v31 = v81 - __p;
    v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 59)
      sub_1BE61F930();
    v33 = (char *)v82 - (char *)__p;
    if (((char *)v82 - (char *)__p) >> 4 > v32)
      v32 = v33 >> 4;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFE0)
      v34 = 0x7FFFFFFFFFFFFFFLL;
    else
      v34 = v32;
    if (v34)
    {
      if (v34 >> 59)
        sub_1BE61F100();
      v35 = (char *)operator new(32 * v34);
      v36 = &v35[32 * v31];
      *(CGFloat *)v36 = v26;
      *((CGFloat *)v36 + 1) = v27;
      *((CGFloat *)v36 + 2) = v28;
      *((CGFloat *)v36 + 3) = v29;
      v37 = (uint64_t)v36;
      if (v81 == __p)
      {
LABEL_18:
        v17 = (CGRect *)(v36 + 32);
        __p = (CGRect *)v37;
        v82 = (CGRect *)&v35[32 * v34];
        if (v81)
          goto LABEL_23;
        goto LABEL_6;
      }
    }
    else
    {
      v35 = 0;
      v36 = (char *)(32 * v31);
      *(CGFloat *)v36 = v22;
      *((CGFloat *)v36 + 1) = v23;
      *((CGFloat *)v36 + 2) = v24;
      *((CGFloat *)v36 + 3) = v25;
      v37 = 32 * v31;
      if (v81 == __p)
        goto LABEL_18;
    }
    do
    {
      size = v30[-1].size;
      *(CGPoint *)(v37 - 32) = v30[-1].origin;
      *(CGSize *)(v37 - 16) = size;
      v37 -= 32;
      --v30;
    }
    while (v30 != __p);
    v30 = __p;
    v17 = (CGRect *)(v36 + 32);
    __p = (CGRect *)v37;
    v82 = (CGRect *)&v35[32 * v34];
    if (v30)
LABEL_23:
      operator delete(v30);
LABEL_6:
    v81 = v17;
  }
  v39 = 126 - 2 * __clz(v81 - __p);
  if (v81 == __p)
    v40 = 0;
  else
    v40 = v39;
  sub_1BE696698(__p, v81, v40, 1);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = *MEMORY[0x1E0C9D628];
  v50 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  MaxX = -1.79769313e308;
  v77 = 0.0;
  v78 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v72 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v73 = *MEMORY[0x1E0C9D628];
  v79 = v72;
  r2 = v78;
  v74 = v50;
  while (v47 < objc_msgSend_strokeCount(self, v41, v42, v43, v44, v45, *(_QWORD *)&r2, *(_QWORD *)&v72, *(_QWORD *)&v73, *(_QWORD *)&v74))
  {
    x = __p[v46].origin.x;
    y = __p[v46].origin.y;
    width = __p[v46].size.width;
    height = __p[v46].size.height;
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    MinX = CGRectGetMinX(v83);
    v84.origin.x = v49;
    v84.size.width = v78;
    v84.origin.y = v79;
    v84.size.height = v50;
    IsNull = CGRectIsNull(v84);
    v58 = MinX - MaxX < a3 || IsNull;
    if ((v58 & 1) != 0 || v50 < a4)
    {
      v85.origin.x = v49;
      v85.size.width = v78;
      v85.origin.y = v79;
      v85.size.height = v50;
      v89.origin.x = x;
      v89.origin.y = y;
      v89.size.width = width;
      v89.size.height = height;
      v86 = CGRectUnion(v85, v89);
      x = v86.origin.x;
      y = v86.origin.y;
      width = v86.size.width;
      height = v86.size.height;
    }
    else
    {
      ++v48;
      v77 = v50 + v77;
      v72 = v79;
      v73 = v49;
      r2 = v78;
      v74 = v50;
    }
    v49 = x;
    v78 = width;
    v79 = y;
    v50 = height;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    MaxX = CGRectGetMaxX(v87);
    ++v47;
    ++v46;
  }
  if (v50 >= a4 || v48 <= 0)
  {
    v60 = v50 + v77;
    ++v48;
    v61 = __p;
    if (!__p)
      return v60 / (double)v48;
LABEL_43:
    operator delete(v61);
    return v60 / (double)v48;
  }
  v63 = v49;
  v65 = v78;
  v64 = v79;
  v66 = v50;
  v68 = v72;
  v67 = v73;
  v69 = r2;
  v70 = v74;
  v88 = CGRectUnion(*(CGRect *)&v63, *(CGRect *)&v67);
  v60 = v77 - v74 + v88.size.height;
  v61 = __p;
  if (__p)
    goto LABEL_43;
  return v60 / (double)v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;

  STACK[0x598] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v10 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  v16 = (void *)objc_msgSend_init(v10, v11, v12, v13, v14, v15);
  if (v16)
  {
    sub_1BE69045C((uint64_t)&v18, (uint64_t)&self->_drawing);
    sub_1BE68A9CC((uint64_t)v16 + 128, (uint64_t)&v18);
    sub_1BE690148(&v18);
  }
  return v16;
}

- (void)writeToFile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  id v65;

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9, v10, v11, v12);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v13, v15, (uint64_t)v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v19, v20, (uint64_t)v65, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v25, v26, (uint64_t)CFSTR("dd-MM-yyyy-HH-mm-ss-SSS"), v27, v28, v29);
  objc_msgSend_now(MEMORY[0x1E0C99D68], v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v25, v36, (uint64_t)v35, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v46, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v52, v53, 4, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v58, (uint64_t)CFSTR("/drawing_%@-%@.json"), v59, v60, v61, v40, v57);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToFileWithContext_folder_basename_(self, v63, (uint64_t)&unk_1E78272B8, (uint64_t)v24, (uint64_t)v62, v64);

}

- (void)writeToFileWithContext:(id)a3 folder:(id)a4 basename:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend_absoluteString(v8, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_fileExistsAtPath_(v10, v17, (uint64_t)v16, v18, v19, v20);

  if ((v21 & 1) != 0)
  {
    v26 = 0;
LABEL_4:
    objc_msgSend_jsonRepresentationWithContext_(self, v22, (uint64_t)v47, v23, v24, v25);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v29, (uint64_t)v28, 1, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v8, v32, (uint64_t)v9, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend_writeToURL_options_error_(v31, v37, (uint64_t)v36, 1, (uint64_t)&v48, v38);
    v39 = v48;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v40 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(v36, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v46;
      v52 = 2112;
      v53 = v39;
      _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_DEFAULT, "Drawing writeToFile saving drawing at URL %@, error = %@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v49 = 0;
  DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v10, v22, (uint64_t)v8, 1, 0, (uint64_t)&v49);
  v26 = v49;
  if ((DirectoryAtURL_withIntermediateDirectories_attributes_error & 1) != 0)
    goto LABEL_4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v28 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v8;
    v52 = 2112;
    v53 = v26;
    _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_ERROR, "Drawing unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
LABEL_9:

}

- (void).cxx_destruct
{
  sub_1BE690148(&self->_drawing.strokeBounds.__begin_);
}

- (id).cxx_construct
{
  sub_1BE68F7D8((uint64_t)&self->_drawing);
  return self;
}

@end
