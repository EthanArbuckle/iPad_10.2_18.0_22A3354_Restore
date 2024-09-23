@implementation CLSSurvey

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40792D8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB5A0 != -1)
    dispatch_once(&qword_1ED0FB5A0, block);
  return (id)qword_1ED0FB598;
}

- (CLSSurvey)initWithType:(int64_t)a3 authorID:(id)a4
{
  id v7;
  CLSSurvey *v8;
  CLSSurvey *v9;
  NSDate *teacherLastModifiedDate;
  NSDate *studentFirstSubmissionDate;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLSSurvey;
  v8 = -[CLSObject _init](&v13, sel__init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_authorID, a4);
    teacherLastModifiedDate = v9->_teacherLastModifiedDate;
    v9->_teacherLastModifiedDate = 0;

    studentFirstSubmissionDate = v9->_studentFirstSubmissionDate;
    v9->_studentFirstSubmissionDate = 0;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSurvey)initWithCoder:(id)a3
{
  id v4;
  CLSSurvey *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *authorID;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSDate *teacherLastModifiedDate;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSDate *studentFirstSubmissionDate;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSString *serverETag;
  const char *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSSurvey;
  v5 = -[CLSObject initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("authorID"));
    v12 = objc_claimAutoreleasedReturnValue();
    authorID = v5->_authorID;
    v5->_authorID = (NSString *)v12;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("type"));
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("teacherLastModifiedDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    teacherLastModifiedDate = v5->_teacherLastModifiedDate;
    v5->_teacherLastModifiedDate = (NSDate *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("studentFirstSubmissionDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    studentFirstSubmissionDate = v5->_studentFirstSubmissionDate;
    v5->_studentFirstSubmissionDate = (NSDate *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("serverETag"));
    v25 = objc_claimAutoreleasedReturnValue();
    serverETag = v5->_serverETag;
    v5->_serverETag = (NSString *)v25;

    v5->_surveyUpdateStatus = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("surveyUpdateStatus"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t updated;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend__init(v7, v8, v9);
  objc_msgSend_objectID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_setObjectID_(v10, v17, (uint64_t)v16);

  objc_msgSend_dateCreated(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v20, v21, v22);
  objc_msgSend_setDateCreated_(v10, v24, (uint64_t)v23);

  objc_msgSend_dateLastModified(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_copy(v27, v28, v29);
  objc_msgSend_setDateLastModified_(v10, v31, (uint64_t)v30);

  objc_msgSend_parentObjectID(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_copy(v34, v35, v36);
  objc_msgSend_setParentObjectID_(v10, v38, (uint64_t)v37);

  objc_msgSend_authorID(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend_copy(v41, v42, v43);
  objc_msgSend_setAuthorID_(v10, v45, (uint64_t)v44);

  objc_msgSend_title(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend_copy(v48, v49, v50);
  objc_msgSend_setTitle_(v10, v52, (uint64_t)v51);

  v55 = objc_msgSend_type(self, v53, v54);
  objc_msgSend_setType_(v10, v56, v55);
  objc_msgSend_teacherLastModifiedDate(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend_copy(v59, v60, v61);
  objc_msgSend_setTeacherLastModifiedDate_(v10, v63, (uint64_t)v62);

  objc_msgSend_studentFirstSubmissionDate(self, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend_copy(v66, v67, v68);
  objc_msgSend_setStudentFirstSubmissionDate_(v10, v70, (uint64_t)v69);

  objc_msgSend_serverETag(self, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend_copy(v73, v74, v75);
  objc_msgSend_setServerETag_(v10, v77, (uint64_t)v76);

  updated = objc_msgSend_surveyUpdateStatus(self, v78, v79);
  objc_msgSend_setSurveyUpdateStatus_(v10, v81, updated);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend_surveySteps(self, v82, v83, 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v95, v99, 16);
  if (v86)
  {
    v89 = v86;
    v90 = *(_QWORD *)v96;
    do
    {
      v91 = 0;
      do
      {
        if (*(_QWORD *)v96 != v90)
          objc_enumerationMutation(v84);
        v92 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v95 + 1) + 8 * v91), v87, v88);
        objc_msgSend_addSurveyStep_(v10, v93, (uint64_t)v92);

        ++v91;
      }
      while (v89 != v91);
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v95, v99, 16);
    }
    while (v89);
  }

  return v10;
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
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSSurvey;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_title, CFSTR("title"), v12.receiver, v12.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_authorID, CFSTR("authorID"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_teacherLastModifiedDate, CFSTR("teacherLastModifiedDate"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_studentFirstSubmissionDate, CFSTR("studentFirstSubmissionDate"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_serverETag, CFSTR("serverETag"));
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_surveyUpdateStatus, CFSTR("surveyUpdateStatus"));

}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)type
{
  uint64_t v2;
  int64_t type;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  type = self->_type;
  objc_msgSend_unlock(self, v5, v6);
  return type;
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

- (NSString)authorID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_authorID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setAuthorID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *authorID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  authorID = self->_authorID;
  v12 = (id)v8;
  if (v8 | (unint64_t)authorID
    && (!v8 || !authorID || (objc_msgSend_isEqualToString_(authorID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_authorID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (id)teacherLastModifiedDate
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_teacherLastModifiedDate;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTeacherLastModifiedDate:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *teacherLastModifiedDate;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  teacherLastModifiedDate = self->_teacherLastModifiedDate;
  v12 = (id)v8;
  if (v8 | (unint64_t)teacherLastModifiedDate
    && (!v8
     || !teacherLastModifiedDate
     || (objc_msgSend_isEqualToDate_(teacherLastModifiedDate, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_teacherLastModifiedDate, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (id)studentFirstSubmissionDate
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_studentFirstSubmissionDate;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setStudentFirstSubmissionDate:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *studentFirstSubmissionDate;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  studentFirstSubmissionDate = self->_studentFirstSubmissionDate;
  v12 = (id)v8;
  if (v8 | (unint64_t)studentFirstSubmissionDate
    && (!v8
     || !studentFirstSubmissionDate
     || (objc_msgSend_isEqualToDate_(studentFirstSubmissionDate, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_studentFirstSubmissionDate, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (id)serverETag
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_serverETag;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setServerETag:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *serverETag;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  serverETag = self->_serverETag;
  v12 = (id)v8;
  if (v8 | (unint64_t)serverETag
    && (!v8 || !serverETag || (objc_msgSend_isEqualToString_(serverETag, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_serverETag, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)surveyUpdateStatus
{
  uint64_t v2;
  int64_t surveyUpdateStatus;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  surveyUpdateStatus = self->_surveyUpdateStatus;
  objc_msgSend_unlock(self, v5, v6);
  return surveyUpdateStatus;
}

- (void)setSurveyUpdateStatus:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_surveyUpdateStatus != a3)
  {
    self->_surveyUpdateStatus = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)addSurveyStep:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("surveySteps"));
}

- (void)removeSurveyStep:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("surveySteps"));
}

- (NSArray)surveySteps
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
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
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSSurvey;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("title");
  v22[1] = CFSTR("teacherLastModifiedDate");
  v22[2] = CFSTR("studentFirstSubmissionDate");
  v22[3] = CFSTR("serverETag");
  v22[4] = CFSTR("surveyUpdateStatus");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 5);
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

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSSurvey;
  v5 = -[CLSObject validateObject:](&v17, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_title, v6, v7))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = (void *)MEMORY[0x1E0CB34D0];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("ERROR_DESCRIPTION_SURVEY_NO_TITLE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_errorObject_description_(v8, v15, (uint64_t)a3, 2, self, v14);

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  unsigned int v24;
  char v25;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t updated;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  void *v93;
  char v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  objc_msgSend_objectID(self, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_objectID(v7, v10, v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v24 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend_objectID(self, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_11;
  v16 = (void *)v13;
  objc_msgSend_objectID(v7, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend_objectID(self, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v7, v21, v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v20, v23, (uint64_t)v4) & 1) == 0)
  {

    goto LABEL_10;
  }
  v112 = v16;
  v113 = v19;
  v114 = v4;
  v115 = v20;
  v24 = 1;
LABEL_17:
  objc_msgSend_parentObjectID(self, v10, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend_parentObjectID(v7, v27, v28);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v116)
    {
      v109 = 0;
      v43 = v3;
      v37 = v24;
      v116 = 0;
      v108 = 0;
LABEL_32:
      v44 = objc_msgSend_type(self, v27, v28);
      if (v44 != objc_msgSend_type(v7, v45, v46))
      {
        v25 = 0;
        LOBYTE(v24) = v37;
        v3 = v43;
        v29 = v109;
        v58 = v106;
        v54 = v107;
        goto LABEL_48;
      }
      objc_msgSend_title(self, v47, v48);
      v24 = v37;
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (v111 || (objc_msgSend_title(v7, v49, v50), (v103 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_title(self, v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v54 = v107;
        if (!v51)
        {
          v25 = 0;
          v3 = v43;
          v29 = v109;
          v58 = v106;
          goto LABEL_45;
        }
        v102 = (void *)v51;
        objc_msgSend_title(v7, v52, v53);
        v55 = objc_claimAutoreleasedReturnValue();
        v3 = v43;
        v29 = v109;
        v58 = v106;
        if (!v55)
        {
          v66 = v24;

          if (v111)
          else

          v87 = v105;
LABEL_95:
          if ((v108 & 1) != 0)
          {

          }
          goto LABEL_97;
        }
        v101 = (void *)v55;
        objc_msgSend_title(self, v56, v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_title(v7, v60, v61);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v59, v62, (uint64_t)v4) & 1) == 0)
        {
          v66 = v24;

          if (v111)
          else

          if ((v108 & 1) != 0)
          {

          }
LABEL_97:
          if (!v29)

          if ((v66 & 1) == 0)
            goto LABEL_11;
          goto LABEL_100;
        }
        v98 = v4;
        v99 = v59;
        v100 = 1;
      }
      else
      {
        v103 = 0;
        v100 = 0;
        v3 = v43;
        v29 = v109;
        v58 = v106;
      }
      objc_msgSend_authorID(self, v49, v50);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v69)
      {
        objc_msgSend_authorID(v7, v67, v68);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v109)
        {
          v109 = 0;
          updated = objc_msgSend_surveyUpdateStatus(self, v67, v68, v24);
LABEL_74:
          if (updated == objc_msgSend_surveyUpdateStatus(v7, v85, v86))
          {
            objc_msgSend_surveySteps(v7, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend_questionArraysEqual_(self, v91, (uint64_t)v90);

            if ((v95 & 1) != 0)
            {
              LOBYTE(v24) = v94;
LABEL_77:

              v92 = v69;
              if (v69)
              {

LABEL_103:
                if ((v100 & 1) != 0)
                {

                }
                if (!v111)

                if ((v108 & 1) != 0)
                {

                }
                if (v29)
                  goto LABEL_52;
                v65 = v116;
LABEL_51:

LABEL_52:
                if ((v24 & 1) != 0)
                {

                }
                goto LABEL_12;
              }
LABEL_102:
              v93 = v92;

              goto LABEL_103;
            }
            LOBYTE(v24) = v94;
            v92 = v69;
            if (!v69)
              goto LABEL_102;
            goto LABEL_85;
          }
          if ((v95 & 1) != 0)
          {

          }
          LOBYTE(v24) = v94;
LABEL_82:
          if (!v69)

          v92 = v69;
          v25 = 0;
LABEL_85:

          if ((v100 & 1) == 0)
          {
            v63 = v111;
            v64 = v103;
            v54 = v107;
            if (v111)
              goto LABEL_47;
            goto LABEL_46;
          }

          v54 = v107;
LABEL_45:
          v63 = v111;
          v64 = v103;
          if (v111)
          {
LABEL_47:

LABEL_48:
            if ((v108 & 1) != 0)
            {

            }
LABEL_50:
            v65 = v116;
            if (v29)
              goto LABEL_52;
            goto LABEL_51;
          }
LABEL_46:

          v63 = v111;
          goto LABEL_47;
        }
      }
      objc_msgSend_authorID(self, v67, v68);
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_82;
      v106 = (void *)v70;
      objc_msgSend_authorID(v7, v71, v72);
      v73 = objc_claimAutoreleasedReturnValue();
      if (v73)
      {
        v97 = (void *)v73;
        objc_msgSend_authorID(self, v74, v75);
        v76 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_authorID(v7, v77, v78);
        v79 = objc_claimAutoreleasedReturnValue();
        v96 = (void *)v76;
        v80 = (void *)v76;
        v4 = (void *)v79;
        if (!objc_msgSend_isEqualToString_(v80, v81, v79))
        {
          v25 = 0;
          goto LABEL_77;
        }
        updated = objc_msgSend_surveyUpdateStatus(self, v82, v83, v24 | 0x100000000);
        goto LABEL_74;
      }
      v66 = v24;

      if (v69)
      else

      v87 = v105;
      if ((v100 & 1) != 0)
      {

      }
      v54 = v107;
      if (!v111)

      goto LABEL_95;
    }
  }
  objc_msgSend_parentObjectID(self, v27, v28);
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    v25 = 0;
    goto LABEL_50;
  }
  v4 = (void *)v30;
  objc_msgSend_parentObjectID(v7, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v36 = (void *)v33;
    v110 = v3;
    v37 = v24;
    objc_msgSend_parentObjectID(self, v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentObjectID(v7, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v38, v42, (uint64_t)v41) & 1) != 0)
    {
      v104 = v41;
      v105 = v38;
      v106 = v36;
      v107 = v4;
      v109 = v29;
      v43 = v110;
      v108 = 1;
      goto LABEL_32;
    }

    if (v29)
    {

      if ((v37 & 1) == 0)
      {
LABEL_30:
        v25 = 0;
        v3 = v110;
        goto LABEL_12;
      }
    }
    else
    {

      if ((v37 & 1) == 0)
        goto LABEL_30;
    }

    goto LABEL_30;
  }

  if (v29)
  {

    if ((v24 & 1) != 0)
    {
LABEL_100:

    }
  }
  else
  {

    if ((v24 & 1) != 0)
      goto LABEL_100;
  }
LABEL_11:
  v25 = 0;
LABEL_12:
  if (!v12)

LABEL_15:
  return v25;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  v16 = v13 ^ (2 * objc_msgSend_type(self, v14, v15));
  objc_msgSend_title(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_hash(v19, v20, v21);

  objc_msgSend_authorID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v22 ^ objc_msgSend_hash(v25, v26, v27);

  v31 = v28 ^ objc_msgSend_surveyUpdateStatus(self, v29, v30);
  objc_msgSend_surveySteps(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v16 ^ v31 ^ objc_msgSend_hash(v34, v35, v36);

  return v37;
}

- (BOOL)questionArraysEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t i;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  char isEqual;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_surveySteps(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  if (v10 == objc_msgSend_count(v4, v11, v12))
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v13, (uint64_t)CFSTR("displayOrder"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v14;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_sortedArrayUsingDescriptors_(v7, v17, (uint64_t)v16);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_sortedArrayUsingDescriptors_(v4, v20, (uint64_t)v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
      v4 = (id)v21;
    }
    v22 = objc_msgSend_count(v7, v17, v18);
    if (v22 < 1)
    {
      v24 = 1;
    }
    else
    {
      v23 = v22;
      v24 = 0;
      for (i = 0; i != v23; v24 = i >= v23)
      {
        v26 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectAtIndexedSubscript_(v7, v27, i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v4, v29, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v28, v31, (uint64_t)v30);

        objc_autoreleasePoolPop(v26);
        if ((isEqual & 1) == 0)
          break;
        ++i;
      }
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentFirstSubmissionDate, 0);
  objc_storeStrong((id *)&self->_teacherLastModifiedDate, 0);
  objc_storeStrong((id *)&self->_serverETag, 0);
  objc_storeStrong((id *)&self->_authorID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
