@implementation CMHistoricalFetchToken

- (CMHistoricalFetchToken)initWithType:(unint64_t)a3 cursorList:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMHistoricalFetchToken *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMHistoricalFetchToken;
  v10 = -[CMHistoricalFetchToken init](&v12, sel_init);
  if (v10)
  {
    v10->_tables = (NSMutableArray *)objc_msgSend_mutableCopy(a4, v6, v7, v8, v9);
    v10->_version = 2;
    v10->_fetchType = a3;
  }
  return v10;
}

+ (id)cardioToken
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CMTableCursor *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CMTableCursor *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CMTableCursor *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CMTableCursor *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  CMTableCursor *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  CMTableCursor *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  CMTableCursor *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  CMTableCursor *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  const char *v80;
  uint64_t v81;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 8, v2, v3);
  v6 = [CMTableCursor alloc];
  v10 = (id)objc_msgSend_initWithDatatype_(v6, v7, 0, v8, v9);
  objc_msgSend_addObject_(v5, v11, (uint64_t)v10, v12, v13);
  v14 = [CMTableCursor alloc];
  v18 = (id)objc_msgSend_initWithDatatype_(v14, v15, 1, v16, v17);
  objc_msgSend_addObject_(v5, v19, (uint64_t)v18, v20, v21);
  v22 = [CMTableCursor alloc];
  v26 = (id)objc_msgSend_initWithDatatype_(v22, v23, 2, v24, v25);
  objc_msgSend_addObject_(v5, v27, (uint64_t)v26, v28, v29);
  v30 = [CMTableCursor alloc];
  v34 = (id)objc_msgSend_initWithDatatype_(v30, v31, 3, v32, v33);
  objc_msgSend_addObject_(v5, v35, (uint64_t)v34, v36, v37);
  v38 = [CMTableCursor alloc];
  v42 = (id)objc_msgSend_initWithDatatype_(v38, v39, 4, v40, v41);
  objc_msgSend_addObject_(v5, v43, (uint64_t)v42, v44, v45);
  v46 = [CMTableCursor alloc];
  v50 = (id)objc_msgSend_initWithDatatype_(v46, v47, 6, v48, v49);
  objc_msgSend_addObject_(v5, v51, (uint64_t)v50, v52, v53);
  v54 = [CMTableCursor alloc];
  v58 = (id)objc_msgSend_initWithDatatype_(v54, v55, 5, v56, v57);
  objc_msgSend_addObject_(v5, v59, (uint64_t)v58, v60, v61);
  v62 = [CMTableCursor alloc];
  v66 = (id)objc_msgSend_initWithDatatype_(v62, v63, 7, v64, v65);
  objc_msgSend_addObject_(v5, v67, (uint64_t)v66, v68, v69);
  if (objc_msgSend_count(v5, v70, v71, v72, v73) != 8)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E2953588);
    v74 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v89 = 8;
      v90 = 2048;
      v91 = objc_msgSend_count(v5, v75, v76, v77, v78);
      _os_log_impl(&dword_18F1DC000, v74, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Expected %d cardio tables but initialized %lu", buf, 0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E2953588);
      objc_msgSend_count(v5, v83, v84, v85, v86);
      v87 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMHistoricalFetchToken cardioToken]", "CoreLocation: %s\n", v87);
      if (v87 != (char *)buf)
        free(v87);
    }
  }
  v79 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithType_cursorList_(v79, v80, 0, (uint64_t)v5, v81);
}

+ (id)mobilityToken
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CMTableCursor *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CMTableCursor *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CMTableCursor *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CMTableCursor *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  CMTableCursor *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint8_t buf[4];
  int v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 5, v2, v3);
  v6 = [CMTableCursor alloc];
  v10 = (id)objc_msgSend_initWithDatatype_(v6, v7, 0, v8, v9);
  objc_msgSend_addObject_(v5, v11, (uint64_t)v10, v12, v13);
  v14 = [CMTableCursor alloc];
  v18 = (id)objc_msgSend_initWithDatatype_(v14, v15, 3, v16, v17);
  objc_msgSend_addObject_(v5, v19, (uint64_t)v18, v20, v21);
  v22 = [CMTableCursor alloc];
  v26 = (id)objc_msgSend_initWithDatatype_(v22, v23, 1, v24, v25);
  objc_msgSend_addObject_(v5, v27, (uint64_t)v26, v28, v29);
  v30 = [CMTableCursor alloc];
  v34 = (id)objc_msgSend_initWithDatatype_(v30, v31, 4, v32, v33);
  objc_msgSend_addObject_(v5, v35, (uint64_t)v34, v36, v37);
  v38 = [CMTableCursor alloc];
  v42 = (id)objc_msgSend_initWithDatatype_(v38, v39, 2, v40, v41);
  objc_msgSend_addObject_(v5, v43, (uint64_t)v42, v44, v45);
  if (objc_msgSend_count(v5, v46, v47, v48, v49) != 5)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E2953588);
    v50 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v65 = 5;
      v66 = 2048;
      v67 = objc_msgSend_count(v5, v51, v52, v53, v54);
      _os_log_impl(&dword_18F1DC000, v50, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Expected %d mobility tables but initialized %lu", buf, 0x12u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E2953588);
      objc_msgSend_count(v5, v59, v60, v61, v62);
      v63 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMHistoricalFetchToken mobilityToken]", "CoreLocation: %s\n", v63);
      if (v63 != (char *)buf)
        free(v63);
    }
  }
  v55 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithType_cursorList_(v55, v56, 1, (uint64_t)v5, v57);
}

- (void)dealloc
{
  objc_super v3;

  self->_tables = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHistoricalFetchToken;
  -[CMHistoricalFetchToken dealloc](&v3, sel_dealloc);
}

- (CMHistoricalFetchToken)initWithCoder:(id)a3
{
  CMHistoricalFetchToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMHistoricalFetchToken;
  v4 = -[CMHistoricalFetchToken init](&v21, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v10, v7, 0);
    v4->_tables = (NSMutableArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyTables"), v13);
    v4->_version = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyVersion"), v15, v16);
    v4->_fetchType = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyFetchType"), v18, v19);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_tables, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyTables"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_version, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyVersion"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_fetchType, (uint64_t)CFSTR("kCMHistoricalFetchTokenCodingKeyFetchType"), v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t Type;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9 = (void *)objc_msgSend_tables(self, v5, v6, v7, v8),
        v14 = objc_msgSend_count(v9, v10, v11, v12, v13),
        v19 = (void *)objc_msgSend_tables(a3, v15, v16, v17, v18),
        v14 == objc_msgSend_count(v19, v20, v21, v22, v23))
    && (v28 = objc_msgSend_version(self, v24, v25, v26, v27), v28 == objc_msgSend_version(a3, v29, v30, v31, v32))
    && (Type = objc_msgSend_fetchType(self, v33, v34, v35, v36), Type == objc_msgSend_fetchType(a3, v38, v39, v40, v41)))
  {
    v46 = (void *)objc_msgSend_tables(self, v42, v43, v44, v45);
    if (objc_msgSend_count(v46, v47, v48, v49, v50))
    {
      v55 = 0;
      v56 = 1;
      do
      {
        v57 = (void *)objc_msgSend_tables(self, v51, v52, v53, v54);
        v61 = (void *)objc_msgSend_objectAtIndexedSubscript_(v57, v58, v55, v59, v60);
        v66 = (void *)objc_msgSend_tables(a3, v62, v63, v64, v65);
        v70 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, v55, v68, v69);
        v56 &= objc_msgSend_isEqual_(v61, v71, v70, v72, v73);
        ++v55;
        v78 = (void *)objc_msgSend_tables(self, v74, v75, v76, v77);
      }
      while (objc_msgSend_count(v78, v79, v80, v81, v82) > v55);
    }
    else
    {
      LOBYTE(v56) = 1;
    }
  }
  else
  {
    LOBYTE(v56) = 0;
  }
  return v56;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_version(self, a2, v2, v3, v4);
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend_fetchType(self, v7, v8, v9, v10) - v6 + 32 * v6 + 961;
  v29 = 0u;
  v30 = 0u;
  v16 = (void *)objc_msgSend_tables(self, v12, v13, v14, v15, 0);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v18)
  {
    v23 = v18;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v16);
        v11 = objc_msgSend_hash(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v25++), v19, v20, v21, v22) - v11 + 32 * v11;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v23);
  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Type;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_version(self, v6, v7, v8, v9);
  Type = objc_msgSend_fetchType(self, v11, v12, v13, v14);
  v20 = objc_msgSend_tables(self, v16, v17, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("%@, <version, %lu, fetchType, %lu, tables, %@>"), v22, v23, v5, v10, Type, v20);
}

- (id)getProgressState
{
  return self->_tables;
}

- (NSMutableArray)tables
{
  return self->_tables;
}

- (void)setTables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)fetchType
{
  return self->_fetchType;
}

- (void)setFetchType:(unint64_t)a3
{
  self->_fetchType = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end
