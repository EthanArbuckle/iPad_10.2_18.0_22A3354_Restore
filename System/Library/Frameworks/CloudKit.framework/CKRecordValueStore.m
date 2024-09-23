@implementation CKRecordValueStore

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_changedKeysSet, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

- (CKRecordValueStore)initWithRecord:(id)a3
{
  id v4;
  CKRecordValueStore *v5;
  CKRecordValueStore *v6;
  uint64_t v7;
  NSMutableDictionary *values;
  uint64_t v9;
  NSMutableDictionary *originalValues;
  uint64_t v11;
  NSMutableSet *changedKeysSet;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKRecordValueStore;
  v5 = -[CKRecordValueStore init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_record, v4);
    v7 = objc_opt_new();
    values = v6->_values;
    v6->_values = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    originalValues = v6->_originalValues;
    v6->_originalValues = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    changedKeysSet = v6->_changedKeysSet;
    v6->_changedKeysSet = (NSMutableSet *)v11;

    v6->_trackChanges = 1;
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id v18;
  id WeakRetained;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  CKRecordValueStore *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  id v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int isEncrypted;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  char isEqual;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  char v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  char v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  id v116;
  id v117;
  id v118;
  CKException *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  CKException *v134;
  const char *v135;
  void *v136;
  CKException *v137;
  uint64_t v138;
  const char *v139;
  CKException *v140;
  const char *v141;
  CKException *v142;
  uint64_t v143;
  objc_class *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  CKException *v150;
  uint64_t v151;
  objc_class *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  CKException *v158;
  uint64_t v159;
  objc_class *v160;
  void *v161;
  objc_class *v162;
  void *v163;
  const char *v164;
  id v165;
  CKException *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  id v172;
  CKException *v173;
  const char *v174;
  CKException *v175;
  const char *v176;
  CKException *v177;
  const char *v178;
  CKException *v179;
  const char *v180;
  CKException *v181;
  const char *v182;
  uint64_t v183;
  CKException *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  CKException *v190;
  const char *v191;
  uint64_t v192;
  id v193;
  id v194;
  uint64_t v195;
  uint8_t buf[8];

  v6 = a4;
  v193 = a3;
  v7 = v6;
  v8 = v7;
  if (!self)
  {

    v116 = v8;
    v117 = v193;
    v118 = v116;
    goto LABEL_53;
  }
  v195 = 0;
  *(_QWORD *)buf = 0;
  v194 = 0;
  CKProcessIndexedArrayKey(v7, &v194, (uint64_t *)buf, &v195);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v194;
  if (v9)
  {
    v119 = [CKException alloc];
    v120 = *MEMORY[0x1E0C99778];
    objc_msgSend_localizedDescription(v9, v121, v122, v123);
LABEL_58:
    v126 = objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  v11 = v10;
  v12 = v8;
  if (v10)
  {
    if ((*(_QWORD *)buf & 0x8000000000000000) != 0 && (*(_QWORD *)buf != -1 || v195))
    {
      v184 = [CKException alloc];
      v185 = *MEMORY[0x1E0C99778];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v186, (uint64_t)CFSTR("Negative indexed list keys (%@) can only be appends"), v187, v8);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = (id)objc_msgSend_initWithName_format_(v184, v189, v185, (uint64_t)CFSTR("%@"), v188);

LABEL_68:
      objc_exception_throw(v172);
    }
    v12 = v10;

  }
  sub_18A5E9588();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_containsObject_(v13, v14, (uint64_t)v12, v15);

  if (v16)
  {
    v119 = [CKException alloc];
    v120 = *MEMORY[0x1E0C99778];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v124, (uint64_t)CFSTR("\"%@\" is a reserved key name"), v125, v12);
    v126 = objc_claimAutoreleasedReturnValue();
LABEL_59:
    v132 = (void *)v126;
    v133 = (void *)objc_msgSend_initWithName_format_(v119, v127, v120, (uint64_t)CFSTR("%@"), v126);
    goto LABEL_67;
  }
  CKValidateKeyName(v12);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v128 = (void *)v17;
    v119 = [CKException alloc];
    v120 = *MEMORY[0x1E0C99778];
    objc_msgSend_localizedDescription(v128, v129, v130, v131);
    goto LABEL_58;
  }

  v18 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_record);
  objc_msgSend_valueStore(WeakRetained, v20, v21, v22);
  v26 = (CKRecordValueStore *)objc_claimAutoreleasedReturnValue();
  if (v26 == self)
    objc_msgSend_encryptedValueStore(WeakRetained, v23, v24, v25);
  else
    objc_msgSend_valueStore(WeakRetained, v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allKeys(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_containsObject_(v31, v32, (uint64_t)v18, v33);

  if (v34)
  {
    v134 = [CKException alloc];
    v136 = (void *)objc_msgSend_initWithName_format_(v134, v135, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You cannot set the same key %@ on both CKRecord and -[CKRecord encryptedValues]"), v18);
    goto LABEL_78;
  }

  v35 = v193;
  v36 = v18;
  objc_msgSend_recordID(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isEncrypted = objc_msgSend_isEncrypted(self, v41, v42, v43);
  if (v35 && (CKValueCanBeSetOnRecord(v35) & 1) == 0)
  {
    v158 = [CKException alloc];
    v159 = *MEMORY[0x1E0C99778];
    v160 = (objc_class *)objc_opt_class();
    NSStringFromClass(v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = (objc_class *)objc_opt_class();
    NSStringFromClass(v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = (id)objc_msgSend_initWithName_format_(v158, v164, v159, (uint64_t)CFSTR("Objects of class %@ cannot be set on %@"), v161, v163);

    objc_exception_throw(v165);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = [CKException alloc];
    v138 = *MEMORY[0x1E0C99778];
    v192 = objc_opt_class();
    v136 = (void *)objc_msgSend_initWithName_format_(v137, v139, v138, (uint64_t)CFSTR("Use %@ for storing record IDs on records"), v192);
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v140 = [CKException alloc];
    v136 = (void *)objc_msgSend_initWithName_format_(v140, v141, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Use -[CKRecord encryptedValues] for storing encrypted values on records"));
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = v35;
    objc_msgSend_coordinate(v45, v46, v47, v48);
    if (v52 < -90.0 || (objc_msgSend_coordinate(v45, v49, v50, v51), v56 > 90.0))
    {
      v142 = [CKException alloc];
      v143 = *MEMORY[0x1E0C99778];
      v144 = (objc_class *)objc_opt_class();
      NSStringFromClass(v144);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_coordinate(v45, v145, v146, v147);
      v133 = (void *)objc_msgSend_initWithName_format_(v142, v148, v143, (uint64_t)CFSTR("Invalid latitude value in %@: %f"), v132, v149);
    }
    else
    {
      objc_msgSend_coordinate(v45, v53, v54, v55);
      if (v60 >= -180.0)
      {
        objc_msgSend_coordinate(v45, v57, v58, v59);
        if (v61 <= 180.0)
        {

          goto LABEL_24;
        }
      }
      v150 = [CKException alloc];
      v151 = *MEMORY[0x1E0C99778];
      v152 = (objc_class *)objc_opt_class();
      NSStringFromClass(v152);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_coordinate(v45, v153, v154, v155);
      v133 = (void *)objc_msgSend_initWithName_format_(v150, v156, v151, (uint64_t)CFSTR("Invalid longitude value in %@: %f"), v132, v157);
    }
LABEL_67:
    v172 = v133;

    goto LABEL_68;
  }
LABEL_24:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    CKValidateRecordArrayValue(v35);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = v35;
    objc_msgSend_recordID(v62, v63, v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    if (!v66
      || (v70 = (void *)v66,
          objc_msgSend_recordID(v62, v67, v68, v69),
          v71 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqual = objc_msgSend_isEqual_(v71, v72, (uint64_t)v40, v73),
          v71,
          v70,
          (isEqual & 1) != 0))
    {

      goto LABEL_30;
    }
    v166 = [CKException alloc];
    v167 = *MEMORY[0x1E0C99778];
    objc_msgSend_recordID(v62, v168, v169, v170);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = (void *)objc_msgSend_initWithName_format_(v166, v171, v167, (uint64_t)CFSTR("You cannot set the same asset on multiple records. Asset %@ is already associated with record %@"), v62, v132);
    goto LABEL_67;
  }
LABEL_30:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = objc_retainAutorelease(v35);
    if (*(_BYTE *)objc_msgSend_objCType(v75, v76, v77, v78) == 81
      && objc_msgSend_unsignedLongLongValue(v75, v79, v80, v81) < 0)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v82 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A5C5000, v82, OS_LOG_TYPE_ERROR, "Attempting to set an unsigned long long value with the high order bit set.  This is not supported by CloudKit", buf, 2u);
      }
      if (byte_1EDF6A0E0 && CKCurrentProcessLinkCheck5dbf91c3fd1d871f0bcfe60afeb451e3e708d350())
      {
        v190 = [CKException alloc];
        v136 = (void *)objc_msgSend_initWithName_format_(v190, v191, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("CloudKit does not support unsigned long long values with the high order bit set."));
        goto LABEL_78;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v83 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A5C5000, v83, OS_LOG_TYPE_ERROR, "Allowing this for backwards compatibility; you will receive this as a signed long long when reading this value"
          " from the server",
          buf,
          2u);
      }
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = v35;
    objc_msgSend_valueID(v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v88;
    if (!v88)
    {
LABEL_51:

      goto LABEL_52;
    }
    objc_msgSend_recordID(v88, v89, v90, v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      objc_msgSend_recordID(v92, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend_isEqual_(v97, v98, (uint64_t)v40, v99);

      if ((v100 & 1) != 0)
      {
        objc_msgSend_key(v92, v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        if (v104)
        {
          objc_msgSend_key(v92, v105, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend_isEqual_(v108, v109, (uint64_t)v36, v110);

          if ((v111 & 1) != 0)
          {
            if (isEncrypted == objc_msgSend_isEncrypted(v92, v112, v113, v114))
              goto LABEL_51;
            v181 = [CKException alloc];
            v183 = *MEMORY[0x1E0C99778];
            if (isEncrypted)
              v136 = (void *)objc_msgSend_initWithName_format_(v181, v182, v183, (uint64_t)CFSTR("Trying to set unencrypted mergeable value on an encrypted field '%@': %@"), v36, v84);
            else
              v136 = (void *)objc_msgSend_initWithName_format_(v181, v182, v183, (uint64_t)CFSTR("Trying to set encrypted mergeable value on an unencrypted field '%@': %@"), v36, v84);
          }
          else
          {
            v179 = [CKException alloc];
            v136 = (void *)objc_msgSend_initWithName_format_(v179, v180, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Mergeable value ID has the wrong key, expected '%@': %@"), v36, v92);
          }
        }
        else
        {
          v177 = [CKException alloc];
          v136 = (void *)objc_msgSend_initWithName_format_(v177, v178, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Mergeable value ID has no key, expected '%@': %@"), v36, v92);
        }
      }
      else
      {
        v175 = [CKException alloc];
        v136 = (void *)objc_msgSend_initWithName_format_(v175, v176, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Mergeable value for key '%@' has the wrong record ID. valueID=%@ self=%@"), v36, v92, v40);
      }
    }
    else
    {
      v173 = [CKException alloc];
      v136 = (void *)objc_msgSend_initWithName_format_(v173, v174, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Mergeable value ID for key '%@' has no record ID: %@"), v36, v92);
    }
LABEL_78:
    objc_exception_throw(v136);
  }
LABEL_52:

LABEL_53:
  objc_msgSend__setObject_forKey_(self, v115, (uint64_t)v193, (uint64_t)v8);

}

- (id)recordID
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_record);
    objc_msgSend_recordID(WeakRetained, v5, v6, v7);
  }
  else
  {
    WeakRetained = 0;
    objc_msgSend_recordID(0, a2, v2, v3);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allKeys
{
  CKRecordValueStore *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_values(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v10;
}

- (void)setObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v6;
  CKRecordValueStore *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int trackChanges;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  sub_18A5E97D0(v7, v41, v6);
  objc_msgSend_values(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalValues(v7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  if (v7)
  {
    trackChanges = v7->_trackChanges;
    if (v6 && v7->_trackChanges)
    {
      objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v6, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend_objectForKeyedSubscript_(v11, v21, (uint64_t)v6, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend_objectForKeyedSubscript_(v11, v24, (uint64_t)v6, v26);
        else
          objc_msgSend_null(MEMORY[0x1E0C99E38], v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v18, v28, (uint64_t)v27, (uint64_t)v6);

      }
      trackChanges = 1;
    }
  }
  else
  {
    trackChanges = 0;
  }
  sub_18A5E970C(v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v30, (uint64_t)v29, (uint64_t)v6);

  if (trackChanges)
  {
    objc_msgSend_changedKeysSet(v7, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend_copy(v6, v35, v36, v37);
    objc_msgSend_addObject_(v34, v39, (uint64_t)v38, v40);

  }
  objc_sync_exit(v7);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  CKRecordValueStore *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_values(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v12;
}

- (NSMutableDictionary)values
{
  CKRecordValueStore *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_values;
  objc_sync_exit(v2);

  return v3;
}

- (NSMutableDictionary)originalValues
{
  CKRecordValueStore *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_originalValues;
  objc_sync_exit(v2);

  return v3;
}

- (NSMutableSet)changedKeysSet
{
  CKRecordValueStore *v2;
  NSMutableSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_changedKeysSet;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (void)setValues:(id)a3
{
  CKRecordValueStore *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *values;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1E1F63750, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);
  values = v4->_values;
  v4->_values = (NSMutableDictionary *)v11;

  objc_sync_exit(v4);
}

- (void)setOriginalValues:(id)a3
{
  CKRecordValueStore *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *originalValues;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1E1F55980, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);
  originalValues = v4->_originalValues;
  v4->_originalValues = (NSMutableDictionary *)v11;

  objc_sync_exit(v4);
}

- (void)setChangedKeysSet:(id)a3
{
  CKRecordValueStore *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *changedKeysSet;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v14, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_mutableCopy(v8, v9, v10, v11);
  changedKeysSet = v4->_changedKeysSet;
  v4->_changedKeysSet = (NSMutableSet *)v12;

  objc_sync_exit(v4);
}

- (id)rawValueForKey:(id)a3
{
  id v4;
  CKRecordValueStore *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_values(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v12;
}

- (void)setRawValue:(id)a3 forKey:(id)a4
{
  id v6;
  CKRecordValueStore *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  sub_18A5E970C(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_values(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, (uint64_t)v6);

  objc_sync_exit(v7);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a4)
    objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)setNilValueForKey:(id)a3
{
  CKRecordValueStore *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_values(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalValues(v4, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && v4->_trackChanges)
  {
    objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v30, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_objectForKeyedSubscript_(v14, v12, (uint64_t)v30, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v30, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v18, (uint64_t)v30);

      }
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend_removeObjectForKey_(v8, v12, (uint64_t)v30, v13);
  if (v15)
  {
    objc_msgSend_changedKeysSet(v4, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend_copy(v30, v24, v25, v26);
    objc_msgSend_addObject_(v23, v28, (uint64_t)v27, v29);

  }
  objc_sync_exit(v4);

}

- (id)allRawValues
{
  CKRecordValueStore *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_values(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v10;
}

- (id)changedKeys
{
  CKRecordValueStore *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_changedKeysSet(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v10;
}

- (void)resetChangedKeys
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKRecordValueStore *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_changedKeysSet(obj, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v5, v6, v7, v8);

  objc_msgSend_originalValues(obj, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v12, v13, v14, v15);

  objc_sync_exit(obj);
}

- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  char v6;
  id v8;
  uint64_t (**v9)(id, uint64_t, _QWORD);
  CKRecordValueStore *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  const char *v52;
  BOOL v53;
  CKRecordValueStore *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v6 = a4;
  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (**)(id, uint64_t, _QWORD))a5;
  v10 = self;
  objc_sync_enter(v10);
  v55 = v10;
  if ((v6 & 1) != 0)
    objc_msgSend_changedKeys(v10, v11, v12, v13);
  else
    objc_msgSend_allKeys(v10, v11, v12, v13);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v73, (uint64_t)v80, 16);
  if (!v16)
  {
    v53 = 0;
    goto LABEL_61;
  }
  v60 = *(_QWORD *)v74;
  v56 = v8;
  v58 = v14;
  do
  {
    v59 = v16;
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v74 != v60)
        objc_enumerationMutation(v14);
      v21 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
      objc_msgSend_values(v10, v17, v18, v19, v55);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v23, v21, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v27 = v26;
      if (v27)
      {
        v31 = v27;
        objc_msgSend_firstObject(v27, v28, v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v57 = v32;
          if (v8)
          {
            v33 = (void *)objc_opt_class();
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v34 = v8;
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v65, (uint64_t)v78, 16);
            if (v38)
            {
              v39 = *(_QWORD *)v66;
              while (2)
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v66 != v39)
                    objc_enumerationMutation(v34);
                  if ((objc_msgSend_isSubclassOfClass_(v33, v36, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j), v37) & 1) != 0)
                  {

                    v10 = v55;
                    v8 = v56;
                    v14 = v58;
                    goto LABEL_35;
                  }
                }
                v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v65, (uint64_t)v78, 16);
                if (v38)
                  continue;
                break;
              }
              v10 = v55;
            }
LABEL_44:
            v8 = v56;
            v14 = v58;
          }
          else
          {
LABEL_35:
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v34 = v31;
            v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v48, (uint64_t)&v61, (uint64_t)v77, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v62;
              while (2)
              {
                for (k = 0; k != v49; ++k)
                {
                  if (*(_QWORD *)v62 != v50)
                    objc_enumerationMutation(v34);
                  if ((v9[2](v9, v21, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k)) & 1) != 0)
                  {

                    v8 = v56;
                    v14 = v58;

                    goto LABEL_59;
                  }
                }
                v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v52, (uint64_t)&v61, (uint64_t)v77, 16);
                if (v49)
                  continue;
                break;
              }
              v31 = v34;
              goto LABEL_44;
            }
            v31 = v34;
          }

          v32 = v57;
        }

LABEL_51:
        goto LABEL_52;
      }
      if (v8)
      {
        v41 = (void *)objc_opt_class();
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v31 = v8;
        v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v42, (uint64_t)&v69, (uint64_t)v79, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v70;
          while (2)
          {
            for (m = 0; m != v45; ++m)
            {
              if (*(_QWORD *)v70 != v46)
                objc_enumerationMutation(v31);
              if ((objc_msgSend_isSubclassOfClass_(v41, v43, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m), v44) & 1) != 0)
              {

                v10 = v55;
                v8 = v56;
                v14 = v58;
                goto LABEL_46;
              }
            }
            v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v43, (uint64_t)&v69, (uint64_t)v79, 16);
            if (v45)
              continue;
            break;
          }
          v10 = v55;
          v8 = v56;
        }
        else
        {
          v10 = v55;
        }
        v14 = v58;
        goto LABEL_51;
      }
LABEL_46:
      if ((((uint64_t (**)(id, uint64_t, void *))v9)[2](v9, v21, v25) & 1) != 0)
      {
LABEL_59:

        v53 = 1;
        goto LABEL_61;
      }
LABEL_52:

    }
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v73, (uint64_t)v80, 16);
    v53 = 0;
  }
  while (v16);
LABEL_61:

  objc_sync_exit(v10);
  return v53;
}

- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, (uint64_t)a3, 0, a4);
}

- (BOOL)containsValuePassingTest:(id)a3
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, 0, 0, a3);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A73B30C;
  v11[3] = &unk_1E1F63778;
  v12 = v8;
  v10 = v8;
  objc_msgSend_containsValueOfClasses_options_passingTest_(self, v9, (uint64_t)a3, a4, v11);

}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4
{
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(self, a2, (uint64_t)a3, 0, a4);
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(self, a2, 0, 0, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKRecordValueStore *v3;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  BOOL trackChanges;

  v3 = self;
  objc_sync_enter(v3);
  if (v3)
    WeakRetained = objc_loadWeakRetained((id *)&v3->_record);
  else
    WeakRetained = 0;
  v5 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_initWithRecord_(v5, v6, (uint64_t)WeakRetained, v7);
  objc_msgSend_values(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_((void *)v8, v13, (uint64_t)v12, v14);

  objc_msgSend_originalValues(v3, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOriginalValues_((void *)v8, v19, (uint64_t)v18, v20);

  objc_msgSend_changedKeysSet(v3, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_mutableCopy(v28, v29, v30, v31);
  v33 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v32;

  if (v3)
    trackChanges = v3->_trackChanges;
  else
    trackChanges = 0;
  *(_BYTE *)(v8 + 8) = trackChanges;

  objc_sync_exit(v3);
  return (id)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  CKRecordValueStore *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_values(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v21, v10, (uint64_t)v9, (uint64_t)CFSTR("RecordValues"));

  objc_msgSend_originalValues(v5, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v21, v15, (uint64_t)v14, (uint64_t)CFSTR("OriginalValues"));

  objc_msgSend_changedKeysSet(v5, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v21, v20, (uint64_t)v19, (uint64_t)CFSTR("ChangedKeys"));

  objc_sync_exit(v5);
  objc_autoreleasePoolPop(v4);

}

- (CKRecordValueStore)initWithCoder:(id)a3
{
  id v4;
  CKRecordValueStore *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *values;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableDictionary *originalValues;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSMutableSet *changedKeysSet;
  uint64_t v42;
  NSMutableDictionary *v43;
  uint64_t v44;
  NSMutableDictionary *v45;
  uint64_t v46;
  NSMutableSet *v47;
  objc_super v49;
  _QWORD v50[3];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CKRecordValueStore;
  v5 = -[CKRecordValueStore init](&v49, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    CKAcceptableValueClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v51, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("RecordValues"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);
    values = v5->_values;
    v5->_values = (NSMutableDictionary *)v18;

    CKAcceptableValueClasses();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v50[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v50, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v20, v23, (uint64_t)v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v26, (uint64_t)v25, (uint64_t)CFSTR("OriginalValues"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_mutableCopy(v27, v28, v29, v30);
    originalValues = v5->_originalValues;
    v5->_originalValues = (NSMutableDictionary *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend_setWithObjects_(v33, v36, v34, v37, v35, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, (uint64_t)CFSTR("ChangedKeys"));
    v40 = objc_claimAutoreleasedReturnValue();
    changedKeysSet = v5->_changedKeysSet;
    v5->_changedKeysSet = (NSMutableSet *)v40;

    if (!v5->_values)
    {
      v42 = objc_opt_new();
      v43 = v5->_values;
      v5->_values = (NSMutableDictionary *)v42;

    }
    if (!v5->_originalValues)
    {
      v44 = objc_opt_new();
      v45 = v5->_originalValues;
      v5->_originalValues = (NSMutableDictionary *)v44;

    }
    if (!v5->_changedKeysSet)
    {
      v46 = objc_opt_new();
      v47 = v5->_changedKeysSet;
      v5->_changedKeysSet = (NSMutableSet *)v46;

    }
    v5->_trackChanges = 1;
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  CKRecordValueStore *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t i;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char isKindOfClass;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  CKRecordValueStore *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v81 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  v63 = v8;
  objc_msgSend_values(v8, v9, v10, v11);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v67, v12, v7, v6, 1);
    v68 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend_allKeys(v67, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v75, (uint64_t)v80, 16);
  if (!v17)
  {

    goto LABEL_30;
  }
  v68 = 0;
  obj = v15;
  v65 = *(_QWORD *)v76;
  do
  {
    v66 = v17;
    for (i = 0; i != v66; ++i)
    {
      if (*(_QWORD *)v76 != v65)
        objc_enumerationMutation(obj);
      v69 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
      objc_msgSend_objectForKeyedSubscript_(v67, v18, v69, v19);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v68)
          v68 = (id)objc_msgSend_mutableCopy(v67, v21, v22, v23);
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v70, v21, v7, v6, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKPropertiesStyleString(v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v68, v29, (uint64_t)v28, v69);

LABEL_12:
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_firstObject(v70, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          if (!v68)
            v68 = (id)objc_msgSend_mutableCopy(v67, v35, v36, v37);
          v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v42 = objc_msgSend_count(v70, v39, v40, v41);
          v24 = (void *)objc_msgSend_initWithCapacity_(v38, v43, v42, v44);
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v45 = v70;
          v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v71, (uint64_t)v79, 16);
          if (v48)
          {
            v49 = *(_QWORD *)v72;
            do
            {
              for (j = 0; j != v48; ++j)
              {
                if (*(_QWORD *)v72 != v49)
                  objc_enumerationMutation(v45);
                objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(*(void **)(*((_QWORD *)&v71 + 1) + 8 * j), v47, v7, v6, 0);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_CKPropertiesStyleString(v51, v52, v53, v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v24, v56, (uint64_t)v55, v57);

              }
              v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v71, (uint64_t)v79, 16);
            }
            while (v48);
          }

          objc_msgSend_setObject_forKeyedSubscript_(v68, v58, (uint64_t)v24, v69);
          goto LABEL_12;
        }
      }
LABEL_25:

    }
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v75, (uint64_t)v80, 16);
  }
  while (v17);

  if (!v68)
LABEL_30:
    v68 = (id)objc_msgSend_copy(v67, v59, v60, v61);
LABEL_31:

  objc_sync_exit(v63);
  return v68;
}

@end
