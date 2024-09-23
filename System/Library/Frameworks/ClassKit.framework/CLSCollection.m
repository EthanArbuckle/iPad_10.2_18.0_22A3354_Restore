@implementation CLSCollection

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4069630;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB3D8 != -1)
    dispatch_once(&qword_1ED0FB3D8, block);
  return (id)qword_1ED0FB3D0;
}

- (id)_init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithObjectID_name_location_type_icon_(self, v8, (uint64_t)v7, &stru_1E974C8A0, &stru_1E974C8A0, 0, &stru_1E974C8A0);

  return v9;
}

- (CLSCollection)initWithObjectID:(id)a3 name:(id)a4 location:(id)a5 type:(int64_t)a6 icon:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  CLSCollection *v17;
  NSDate *dateClassCreated;
  const char *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CLSCollection;
  v16 = -[CLSObject _init](&v21, sel__init);
  v17 = (CLSCollection *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 13, a4);
    objc_storeStrong((id *)&v17->_location, a5);
    v17->_type = a6;
    objc_storeStrong((id *)&v17->_iconID, a7);
    dateClassCreated = v17->_dateClassCreated;
    v17->_dateClassCreated = 0;

    objc_msgSend_setObjectID_(v17, v19, (uint64_t)v12);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  int isEqualToString;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  int v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  int isEqualToDate;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  int v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  int v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  char v138;

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    objc_msgSend_objectID(self, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_objectID(v8, v11, v12), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_objectID(self, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_70;
      v17 = (void *)v14;
      objc_msgSend_objectID(v8, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_59;
      v21 = (void *)v18;
      objc_msgSend_objectID(self, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v8, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

      if (v13)
      {

        if (!isEqualToString)
          goto LABEL_73;
      }
      else
      {

        if ((isEqualToString & 1) == 0)
          goto LABEL_73;
      }
    }
    objc_msgSend_name(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_name(v8, v28, v29), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_name(self, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_70;
      v17 = (void *)v30;
      objc_msgSend_name(v8, v31, v32);
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33)
        goto LABEL_59;
      v36 = (void *)v33;
      objc_msgSend_name(self, v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v8, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_isEqualToString_(v37, v41, (uint64_t)v40);

      if (v13)
      {

        if (!v42)
          goto LABEL_73;
      }
      else
      {

        if ((v42 & 1) == 0)
          goto LABEL_73;
      }
    }
    v43 = objc_msgSend_type(self, v28, v29);
    if (v43 != objc_msgSend_type(v8, v44, v45))
      goto LABEL_73;
    objc_msgSend_dateCreated(self, v46, v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_dateCreated(v8, v48, v49), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_dateCreated(self, v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
        goto LABEL_70;
      v17 = (void *)v50;
      objc_msgSend_dateCreated(v8, v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
        goto LABEL_59;
      v56 = (void *)v53;
      objc_msgSend_dateCreated(self, v54, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateCreated(v8, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v57, v61, (uint64_t)v60);

      if (v13)
      {

        if (!isEqualToDate)
          goto LABEL_73;
      }
      else
      {

        if ((isEqualToDate & 1) == 0)
          goto LABEL_73;
      }
    }
    objc_msgSend_dateLastModified(self, v48, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_dateLastModified(v8, v63, v64), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_dateLastModified(self, v63, v64);
      v65 = objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_70;
      v17 = (void *)v65;
      objc_msgSend_dateLastModified(v8, v66, v67);
      v68 = objc_claimAutoreleasedReturnValue();
      if (!v68)
        goto LABEL_59;
      v71 = (void *)v68;
      objc_msgSend_dateLastModified(self, v69, v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(v8, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend_isEqualToDate_(v72, v76, (uint64_t)v75);

      if (v13)
      {

        if (!v77)
          goto LABEL_73;
      }
      else
      {

        if ((v77 & 1) == 0)
          goto LABEL_73;
      }
    }
    objc_msgSend_location(self, v63, v64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_location(v8, v78, v79), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_location(self, v78, v79);
      v80 = objc_claimAutoreleasedReturnValue();
      if (!v80)
        goto LABEL_70;
      v17 = (void *)v80;
      objc_msgSend_location(v8, v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();
      if (!v83)
        goto LABEL_59;
      v86 = (void *)v83;
      objc_msgSend_location(self, v84, v85);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_location(v8, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend_isEqualToString_(v87, v91, (uint64_t)v90);

      if (v13)
      {

        if (!v92)
          goto LABEL_73;
      }
      else
      {

        if ((v92 & 1) == 0)
          goto LABEL_73;
      }
    }
    objc_msgSend_iconID(self, v78, v79);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_iconID(v8, v93, v94), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_iconID(self, v93, v94);
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95)
        goto LABEL_70;
      v17 = (void *)v95;
      objc_msgSend_iconID(v8, v96, v97);
      v98 = objc_claimAutoreleasedReturnValue();
      if (!v98)
        goto LABEL_59;
      v101 = (void *)v98;
      objc_msgSend_iconID(self, v99, v100);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_iconID(v8, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend_isEqualToString_(v102, v106, (uint64_t)v105);

      if (v13)
      {

        if (!v107)
          goto LABEL_73;
      }
      else
      {

        if ((v107 & 1) == 0)
          goto LABEL_73;
      }
    }
    objc_msgSend_colorName(self, v93, v94);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend_colorName(v8, v108, v109);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_62;
    }
    objc_msgSend_colorName(self, v108, v109);
    v110 = objc_claimAutoreleasedReturnValue();
    if (!v110)
      goto LABEL_70;
    v17 = (void *)v110;
    objc_msgSend_colorName(v8, v111, v112);
    v113 = objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      v116 = (void *)v113;
      objc_msgSend_colorName(self, v114, v115);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_colorName(v8, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend_isEqualToString_(v117, v121, (uint64_t)v120);

      if (v13)
      {

        if (!v122)
          goto LABEL_73;
      }
      else
      {

        if ((v122 & 1) == 0)
          goto LABEL_73;
      }
LABEL_62:
      objc_msgSend_dateClassCreated(self, v108, v109);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend_dateClassCreated(v8, v123, v124);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_77;
      }
      objc_msgSend_dateClassCreated(self, v123, v124);
      v125 = objc_claimAutoreleasedReturnValue();
      if (v125)
      {
        v128 = (void *)v125;
        objc_msgSend_dateClassCreated(v8, v126, v127);
        v129 = objc_claimAutoreleasedReturnValue();
        if (v129)
        {
          v132 = (void *)v129;
          objc_msgSend_dateClassCreated(self, v130, v131);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dateClassCreated(v8, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend_isEqualToDate_(v133, v137, (uint64_t)v136);

          if (v13)
          {

            if ((v138 & 1) != 0)
              goto LABEL_77;
          }
          else
          {

            if ((v138 & 1) != 0)
            {
LABEL_77:
              v7 = 1;
              goto LABEL_74;
            }
          }
LABEL_73:
          v7 = 0;
LABEL_74:

          goto LABEL_75;
        }

      }
LABEL_70:
      if (!v13)
LABEL_71:

LABEL_72:
      goto LABEL_73;
    }
LABEL_59:

    if (!v13)
      goto LABEL_71;
    goto LABEL_72;
  }
  v7 = 0;
LABEL_75:

  return v7;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CLSCollection;
  v5 = -[CLSObject validateObject:](&v29, sel_validateObject_);
  if (v5)
  {
    if ((objc_msgSend_isDeleted(self, v6, v7) & 1) == 0)
    {
      if ((unint64_t)objc_msgSend_length(self->_name, v8, v9) >= 0x101)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = (void *)MEMORY[0x1E0CB34D0];
        v14 = objc_opt_class();
        objc_msgSend_bundleForClass_(v13, v15, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("ERROR_DESCRIPTION_COLLECTION_NAME_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v12, v19, (uint64_t)v18, 256);
LABEL_7:
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v27, (uint64_t)a3, 6, self, v26);
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((unint64_t)objc_msgSend_length(self->_location, v10, v11) >= 0x81)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = (void *)MEMORY[0x1E0CB34D0];
        v22 = objc_opt_class();
        objc_msgSend_bundleForClass_(v21, v23, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v16, v24, (uint64_t)CFSTR("ERROR_DESCRIPTION_COLLECTION_LOCATION_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v20, v25, (uint64_t)v18, 128);
        goto LABEL_7;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSCollection;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("type");
  v22[1] = CFSTR("location");
  v22[2] = CFSTR("dateClassCreated");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 3);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (CLSCollection)initWithCoder:(id)a3
{
  id v4;
  CLSCollection *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *name;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *iconID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *location;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *colorName;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSDate *dateClassCreated;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLSCollection;
  v5 = -[CLSObject initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("type"));
    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("iconID"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconID = v5->_iconID;
    v5->_iconID = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("location"));
    v17 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("colorName"));
    v21 = objc_claimAutoreleasedReturnValue();
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("dateClassCreated"));
    v25 = objc_claimAutoreleasedReturnValue();
    dateClassCreated = v5->_dateClassCreated;
    v5->_dateClassCreated = (NSDate *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSCollection;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_name, CFSTR("name"), v11.receiver, v11.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_iconID, CFSTR("iconID"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_location, CFSTR("location"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_colorName, CFSTR("colorName"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_dateClassCreated, CFSTR("dateClassCreated"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)childCount:(int64_t)a3
{
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v7);
        if (objc_msgSend_type(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i), v10, v11) == a3)
          ++v13;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)childCount
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;

  v3 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  return v8;
}

- (id)children:(int64_t)a3
{
  uint64_t v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_count(v7, v9, v10))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v7;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend_type(v19, v14, v15, (_QWORD)v21) == a3)
            objc_msgSend_addObject_(v8, v14, (uint64_t)v19);
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
      }
      while (v16);
    }

  }
  return v8;
}

- (id)children
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (id)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addCollectionItem:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char isEqualToString;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  char isEqualToDate;
  const char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D82573E4]();
  objc_msgSend_children(self, v6, v7);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, v46, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v43;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_referenceObjectID(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v15), v11, v12, (_QWORD)v42);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceObjectID(v4, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v16, v20, (uint64_t)v19);

        if ((isEqualToString & 1) != 0)
        {
          v27 = (uint64_t)v8;
          goto LABEL_18;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, v46, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend_addChild_(self, v22, (uint64_t)v4);
  objc_msgSend_lock(self, v23, v24);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateLastModified(self, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30 | v27)
  {
    v33 = (void *)v30;
    objc_msgSend_dateLastModified(self, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v34;
    if (v34 && v27)
    {
      objc_msgSend_dateLastModified(self, v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v38, v39, v27);

      if ((isEqualToDate & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    objc_msgSend_setDateLastModified_(self, v31, v27, (_QWORD)v42);
    objc_msgSend_setModified_(self, v41, 1);
  }
LABEL_17:
  objc_msgSend_unlock(self, v31, v32, (_QWORD)v42);
LABEL_18:

  objc_autoreleasePoolPop(v5);
}

- (void)removeCollectionItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  int isEqualToString;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  char isEqualToDate;
  const char *v47;
  void *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_type(self, v5, v6) != 2 && objc_msgSend_type(self, v7, v8) != 5)
  {
    v13 = (void *)MEMORY[0x1D82573E4]();
    objc_msgSend_children(self, v14, v15);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v50, v54, 16);
    if (!v17)
      goto LABEL_22;
    v20 = v17;
    v48 = v13;
    v21 = 0;
    v22 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v51 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend_referenceObjectID(v24, v18, v19, v48);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceObjectID(v4, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v25, v29, (uint64_t)v28);

        if (isEqualToString)
        {
          objc_msgSend_removeChild_(self, v18, (uint64_t)v24);
          v21 = 1;
        }
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v50, v54, 16);
    }
    while (v20);
    v13 = v48;
    if ((v21 & 1) == 0)
      goto LABEL_22;
    objc_msgSend_lock(self, v18, v19);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateLastModified(self, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36 | v33)
    {
      v39 = (void *)v36;
      objc_msgSend_dateLastModified(self, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v40;
      if (v40 && v33)
      {
        objc_msgSend_dateLastModified(self, v41, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToDate = objc_msgSend_isEqualToDate_(v44, v45, v33);

        if ((isEqualToDate & 1) != 0)
          goto LABEL_21;
      }
      else
      {

      }
      objc_msgSend_setDateLastModified_(self, v37, v33);
      objc_msgSend_setModified_(self, v47, 1);
    }
LABEL_21:
    objc_msgSend_unlock(self, v37, v38);

LABEL_22:
    objc_autoreleasePoolPop(v13);
    goto LABEL_23;
  }
  objc_msgSend_dataStore(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v55, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteArchivedCollectionObjects_withCompletion_(v9, v12, (uint64_t)v11, &unk_1E9749C90);

LABEL_23:
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CLSCollection;
  -[CLSObject description](&v34, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_name(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("name"), v9);

  objc_msgSend_location(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("location"), v13);

  objc_msgSend_iconID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v18, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("iconID"), v17);

  v21 = objc_msgSend_type(self, v19, v20);
  NSStringFromCollectionType(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v24, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("type"), v23);

  objc_msgSend_colorName(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v28, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("colorName"), v27);

  objc_msgSend_dateClassCreated(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v32, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("dateClassCreated"), v31);

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSCollection;
  -[CLSObject dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_name, CFSTR("name"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_location, CFSTR("location"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_iconID, CFSTR("iconID"));
  NSStringFromCollectionType(self->_type, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("type"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_colorName, CFSTR("colorName"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)self->_dateClassCreated, CFSTR("dateClassCreated"));
  return v3;
}

- (void)setName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *name;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  name = self->_name;
  v12 = (id)v8;
  if (v8 | (unint64_t)name
    && (!v8 || !name || (objc_msgSend_isEqualToString_(name, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_name, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setLocation:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *location;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  location = self->_location;
  v12 = (id)v8;
  if (v8 | (unint64_t)location
    && (!v8 || !location || (objc_msgSend_isEqualToString_(location, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_location, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setIconID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *iconID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  iconID = self->_iconID;
  v12 = (id)v8;
  if (v8 | (unint64_t)iconID
    && (!v8 || !iconID || (objc_msgSend_isEqualToString_(iconID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_iconID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setColorName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *colorName;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  colorName = self->_colorName;
  v12 = (id)v8;
  if (v8 | (unint64_t)colorName
    && (!v8 || !colorName || (objc_msgSend_isEqualToString_(colorName, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_colorName, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setDateClassCreated:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *dateClassCreated;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  dateClassCreated = self->_dateClassCreated;
  v12 = (id)v8;
  if (v8 | (unint64_t)dateClassCreated
    && (!v8 || !dateClassCreated || (objc_msgSend_isEqualToDate_(dateClassCreated, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dateClassCreated, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)location
{
  return self->_location;
}

- (NSString)iconID
{
  return self->_iconID;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSDate)dateClassCreated
{
  return self->_dateClassCreated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateClassCreated, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_iconID, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
