@implementation CLSHandoutReportItem

- (CLSHandoutReportItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSHandoutReportItem *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSString *studentID;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSString *classID;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSString *handoutID;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSDate *endDate;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSString *attachmentID;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSString *reportID;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  CLSActivityReport *primaryActivityReport;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSArray *additionalActivityReports;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CLSHandoutReportItem;
  v6 = -[CLSHandoutReportItem init](&v50, sel_init);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v6->_granularity = objc_msgSend_decodeIntForKey_(v4, v7, (uint64_t)CFSTR("granularity"));
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("studentID"));
    v10 = objc_claimAutoreleasedReturnValue();
    studentID = v6->_studentID;
    v6->_studentID = (NSString *)v10;

    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("classID"));
    v14 = objc_claimAutoreleasedReturnValue();
    classID = v6->_classID;
    v6->_classID = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, CFSTR("handoutID"));
    v18 = objc_claimAutoreleasedReturnValue();
    handoutID = v6->_handoutID;
    v6->_handoutID = (NSString *)v18;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, CFSTR("startDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    startDate = v6->_startDate;
    v6->_startDate = (NSDate *)v22;

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, CFSTR("endDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    endDate = v6->_endDate;
    v6->_endDate = (NSDate *)v26;

    v6->_completed = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)CFSTR("completed"));
    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, CFSTR("attachmentID"));
    v31 = objc_claimAutoreleasedReturnValue();
    attachmentID = v6->_attachmentID;
    v6->_attachmentID = (NSString *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, CFSTR("reportID"));
    v35 = objc_claimAutoreleasedReturnValue();
    reportID = v6->_reportID;
    v6->_reportID = (NSString *)v35;

    v37 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, CFSTR("primaryActivityReport"));
    v39 = objc_claimAutoreleasedReturnValue();
    primaryActivityReport = v6->_primaryActivityReport;
    v6->_primaryActivityReport = (CLSActivityReport *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend_setWithObjects_(v41, v44, v42, v43, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, CFSTR("additionalActivityReports"));
    v47 = objc_claimAutoreleasedReturnValue();
    additionalActivityReports = v6->_additionalActivityReports;
    v6->_additionalActivityReports = (NSArray *)v47;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  id v17;

  type = self->_type;
  v17 = a3;
  objc_msgSend_encodeInt_forKey_(v17, v5, type, CFSTR("type"));
  objc_msgSend_encodeInt_forKey_(v17, v6, self->_granularity, CFSTR("granularity"));
  objc_msgSend_encodeObject_forKey_(v17, v7, (uint64_t)self->_studentID, CFSTR("studentID"));
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)self->_classID, CFSTR("classID"));
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_handoutID, CFSTR("handoutID"));
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)self->_startDate, CFSTR("startDate"));
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_endDate, CFSTR("endDate"));
  objc_msgSend_encodeBool_forKey_(v17, v12, self->_completed, CFSTR("completed"));
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_attachmentID, CFSTR("attachmentID"));
  objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)self->_reportID, CFSTR("reportID"));
  objc_msgSend_encodeObject_forKey_(v17, v15, (uint64_t)self->_primaryActivityReport, CFSTR("primaryActivityReport"));
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)self->_additionalActivityReports, CFSTR("additionalActivityReports"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
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
  const char *v33;
  uint64_t v34;
  uint64_t isCompleted;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)CLSHandoutReportItem;
  v4 = -[CLSReportItem copyWithZone:](&v54, sel_copyWithZone_, a3);
  v7 = objc_msgSend_type(self, v5, v6);
  objc_msgSend_setType_(v4, v8, v7);
  v11 = objc_msgSend_granularity(self, v9, v10);
  objc_msgSend_setGranularity_(v4, v12, v11);
  objc_msgSend_startDate(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartDate_(v4, v16, (uint64_t)v15);

  objc_msgSend_endDate(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndDate_(v4, v20, (uint64_t)v19);

  objc_msgSend_studentID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStudentID_(v4, v24, (uint64_t)v23);

  objc_msgSend_classID(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClassID_(v4, v28, (uint64_t)v27);

  objc_msgSend_handoutID(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHandoutID_(v4, v32, (uint64_t)v31);

  isCompleted = objc_msgSend_isCompleted(self, v33, v34);
  objc_msgSend_setCompleted_(v4, v36, isCompleted);
  objc_msgSend_attachmentID(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttachmentID_(v4, v40, (uint64_t)v39);

  objc_msgSend_reportID(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReportID_(v4, v44, (uint64_t)v43);

  objc_msgSend_primaryActivityReport(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrimaryActivityReport_(v4, v48, (uint64_t)v47);

  objc_msgSend_additionalActivityReports(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalActivityReports_(v4, v52, (uint64_t)v51);

  return v4;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  int completed;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSDate *startDate;
  void *v11;
  const char *v12;
  int64_t v13;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  completed = self->_completed;
  if (completed == objc_msgSend_isCompleted(v4, v6, v7))
  {
    startDate = self->_startDate;
    objc_msgSend_startDate(v4, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_compare_(startDate, v12, (uint64_t)v11);

  }
  else if (self->_completed || (objc_msgSend_isCompleted(v4, v8, v9) & 1) == 0)
  {
    v13 = 1;
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (void)add:(id)a3
{
  id v4;
  NSDate *startDate;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSDate *v13;
  NSDate *v14;
  NSDate *endDate;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSDate *v21;
  NSDate *v22;
  CLSActivityReport *primaryActivityReport;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  CLSHandoutReportItem *v68;
  void *v69;
  uint8_t buf[16];
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

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  startDate = self->_startDate;
  objc_msgSend_startDate(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_compare_(startDate, v9, (uint64_t)v8);

  if (v10 == 1)
  {
    objc_msgSend_startDate(v4, v11, v12);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v14 = self->_startDate;
    self->_startDate = v13;

  }
  endDate = self->_endDate;
  objc_msgSend_endDate(v4, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_compare_(endDate, v17, (uint64_t)v16);

  if (v18 == -1)
  {
    objc_msgSend_endDate(v4, v19, v20);
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v22 = self->_endDate;
    self->_endDate = v21;

  }
  if (self->_completed)
    self->_completed = objc_msgSend_isCompleted(v4, v19, v20);
  primaryActivityReport = self->_primaryActivityReport;
  objc_msgSend_primaryActivityReport(v4, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_add_(primaryActivityReport, v25, (uint64_t)v24);

  v26 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v68 = self;
  objc_msgSend_additionalActivityReports(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v75, v80, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v76 != v33)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v36 = (void *)MEMORY[0x1D82573E4]();
        v39 = (void *)objc_msgSend_copy(v35, v37, v38);
        objc_msgSend_handoutAuthorizedObjectID(v35, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v26, v43, (uint64_t)v39, v42);

        objc_autoreleasePoolPop(v36);
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v44, (uint64_t)&v75, v80, 16);
    }
    while (v32);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = v4;
  objc_msgSend_additionalActivityReports(v4, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v71, v79, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v72;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v72 != v51)
          objc_enumerationMutation(v47);
        v53 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v52);
        v54 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_handoutAuthorizedObjectID(v53, v55, v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend_objectForKeyedSubscript_(v26, v57, (uint64_t)v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v59;
          if (v59)
            objc_msgSend_add_(v59, v60, (uint64_t)v53);
          else
            objc_msgSend_setObject_forKeyedSubscript_(v26, v60, (uint64_t)v53, v58);

        }
        else
        {
          if (qword_1ED0FB9A0 != -1)
            dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
          v62 = CLSLogDefault;
          if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D4054000, v62, OS_LOG_TYPE_ERROR, "Skipping an additional CLSActivityReport with contextID = nil", buf, 2u);
          }
        }

        objc_autoreleasePoolPop(v54);
        ++v52;
      }
      while (v50 != v52);
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v63, (uint64_t)&v71, v79, 16);
    }
    while (v50);
  }

  objc_msgSend_allValues(v26, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalActivityReports_(v68, v67, (uint64_t)v66);

}

- (void)scalarMultiply:(double)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;

  objc_msgSend_primaryActivityReport(self, a2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scalarMultiply_(v6, v7, v8, a3);

  objc_msgSend_additionalActivityReports(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiply_withScalar_(CLSReportItem, v12, (uint64_t)v11, a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAdditionalActivityReports_(self, v13, (uint64_t)v14);
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
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
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t isCompleted;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  objc_msgSend_reportID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" reportID: %@"), v9);

  objc_msgSend_classID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" classID: %@"), v13);

  objc_msgSend_studentID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v18, (uint64_t)CFSTR(" studentID: %@"), v17);

  objc_msgSend_handoutID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR(" handoutID: %@"), v21);

  objc_msgSend_attachmentID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR(" attachmentID: %@"), v25);

  objc_msgSend_startDate(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR(" startDate: %@"), v29);

  objc_msgSend_endDate(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v34, (uint64_t)CFSTR(" endDate: %@"), v33);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  isCompleted = objc_msgSend_isCompleted(self, v36, v37);
  objc_msgSend_numberWithBool_(v35, v39, isCompleted);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR(" completed: %@"), v40);

  objc_msgSend_primaryActivityReport(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend_primaryActivityReport(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v48, (uint64_t)CFSTR(" primaryActivityReport: %@"), v47);

  }
  objc_msgSend_additionalActivityReports(self, v45, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_count(v49, v50, v51);

  if (v52)
  {
    objc_msgSend_additionalActivityReports(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v56, (uint64_t)CFSTR(" additionalActivityReports: %@"), v55);

  }
  objc_msgSend_appendString_(v6, v53, (uint64_t)CFSTR(">"));
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t isCompleted;
  const char *v36;
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
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)CLSHandoutReportItem;
  -[CLSReportItem dictionaryRepresentation](&v74, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reportID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("reportID"));

  objc_msgSend_classID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("classID"));

  objc_msgSend_studentID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("studentID"));

  objc_msgSend_handoutID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, CFSTR("handoutID"));

  objc_msgSend_attachmentID(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, CFSTR("attachmentID"));

  objc_msgSend_startDate(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v26, CFSTR("startDate"));

  objc_msgSend_endDate(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v30, CFSTR("endDate"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  isCompleted = objc_msgSend_isCompleted(self, v33, v34);
  objc_msgSend_numberWithBool_(v32, v36, isCompleted);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, CFSTR("completed"));

  objc_msgSend_primaryActivityReport(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, CFSTR("primaryActivityReport"));

  objc_msgSend_additionalActivityReports(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_count(v48, v49, v50);

  if (v51)
  {
    v52 = (void *)objc_opt_new();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend_additionalActivityReports(self, v53, v54, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v70, v75, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v71;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v71 != v59)
            objc_enumerationMutation(v55);
          v61 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v60);
          v62 = (void *)MEMORY[0x1D82573E4]();
          objc_msgSend_dictionaryRepresentation(v61, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v52, v66, (uint64_t)v65);

          objc_autoreleasePoolPop(v62);
          ++v60;
        }
        while (v58 != v60);
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v67, (uint64_t)&v70, v75, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v52, CFSTR("additionalActivityReports"));
  }
  return v3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int)a3
{
  self->_granularity = a3;
}

- (NSString)studentID
{
  return self->_studentID;
}

- (void)setStudentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)handoutID
{
  return self->_handoutID;
}

- (void)setHandoutID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)reportID
{
  return self->_reportID;
}

- (void)setReportID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (unint64_t)changeHash
{
  return self->_changeHash;
}

- (CLSActivityReport)primaryActivityReport
{
  return self->_primaryActivityReport;
}

- (void)setPrimaryActivityReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)additionalActivityReports
{
  return self->_additionalActivityReports;
}

- (void)setAdditionalActivityReports:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalActivityReports, 0);
  objc_storeStrong((id *)&self->_primaryActivityReport, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_reportID, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_studentID, 0);
}

@end
