@implementation CHRemoteRecognitionRequest

- (CHRemoteRecognitionRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5
{
  id v9;
  id v10;
  CHRemoteRecognitionRequest *v11;
  CHRemoteRecognitionRequest *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CHRemoteRecognitionRequest;
  v11 = -[CHRemoteRecognitionRequest init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_drawing, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_hasBeenSubmitted = 0;
    v12->_priority = a5;
    objc_msgSend_objectForKeyedSubscript_(v10, v13, (uint64_t)CFSTR("CHRequestOptionContributeToStyle"), v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_shouldContributeToStyle = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

  }
  return v12;
}

- (CHRemoteRecognitionRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CHRemoteRecognitionRequest *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  float v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  id v64;
  objc_super v66;
  uint8_t buf[4];
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("drawing"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("priority"), v11, v12, v13);
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend_setWithObjects_(v15, v20, v16, v21, v22, v23, v17, v18, v19, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("options"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 <= 2 && v9)
  {
    v66.receiver = self;
    v66.super_class = (Class)CHRemoteRecognitionRequest;
    v29 = -[CHRemoteRecognitionRequest init](&v66, sel_init);
    objc_storeStrong((id *)&v29->_drawing, v9);
    objc_storeStrong((id *)&v29->_options, v28);
    v29->_priority = v14;
    objc_msgSend_decodeFloatForKey_(v4, v30, (uint64_t)CFSTR("minimumDrawingWidth"), v31, v32, v33);
    v35 = v34;
    objc_msgSend_decodeFloatForKey_(v4, v36, (uint64_t)CFSTR("minimumDrawingHeight"), v37, v38, v39);
    v29->_minimumDrawingSize.width = v35;
    v29->_minimumDrawingSize.height = v40;
    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("maxRecognitionResultCount"), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v29->_maxRecognitionResultCount = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49, v50);

    v29->_enableCachingIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v51, (uint64_t)CFSTR("enableCachingIfAvailable"), v52, v53, v54);
    v29->_hasBeenSubmitted = objc_msgSend_decodeBoolForKey_(v4, v55, (uint64_t)CFSTR("hasBeenSubmitted"), v56, v57, v58);
    v29->_shouldContributeToStyle = objc_msgSend_decodeBoolForKey_(v4, v59, (uint64_t)CFSTR("shouldContributeToStyle"), v60, v61, v62);
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v63 = (id)qword_1EF568E38;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = (id)objc_opt_class();
      v64 = v68;
      _os_log_impl(&dword_1BE607000, v63, OS_LOG_TYPE_ERROR, "%@ decoding failed. Drawing is required to be non-null and priority has to be valid.", buf, 0xCu);

    }
    v29 = 0;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat width;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat height;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  objc_msgSend_encodeObject_forKey_(v40, v4, (uint64_t)self->_drawing, (uint64_t)CFSTR("drawing"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v40, v7, (uint64_t)self->_options, (uint64_t)CFSTR("options"), v8, v9);
  width = self->_minimumDrawingSize.width;
  *(float *)&width = width;
  objc_msgSend_encodeFloat_forKey_(v40, v11, (uint64_t)CFSTR("minimumDrawingWidth"), v12, v13, v14, width);
  height = self->_minimumDrawingSize.height;
  *(float *)&height = height;
  objc_msgSend_encodeFloat_forKey_(v40, v16, (uint64_t)CFSTR("minimumDrawingHeight"), v17, v18, v19, height);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v20, self->_maxRecognitionResultCount, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v25, (uint64_t)v24, (uint64_t)CFSTR("maxRecognitionResultCount"), v26, v27);

  objc_msgSend_encodeBool_forKey_(v40, v28, self->_enableCachingIfAvailable, (uint64_t)CFSTR("enableCachingIfAvailable"), v29, v30);
  objc_msgSend_encodeBool_forKey_(v40, v31, self->_hasBeenSubmitted, (uint64_t)CFSTR("hasBeenSubmitted"), v32, v33);
  objc_msgSend_encodeInteger_forKey_(v40, v34, self->_priority, (uint64_t)CFSTR("priority"), v35, v36);
  objc_msgSend_encodeBool_forKey_(v40, v37, self->_shouldContributeToStyle, (uint64_t)CFSTR("shouldContributeToStyle"), v38, v39);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  CoreHandwriting::writeObjectToFileInFolder((CoreHandwriting *)self, (objc_object *)a3, (NSURL *)a4, (NSString *)a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setDrawing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHDrawing *v9;
  NSObject *v10;
  CHDrawing *v11;
  CHDrawing *drawing;
  uint8_t v13[16];

  v9 = (CHDrawing *)a3;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v13, 2u);
    }

  }
  if (self->_drawing != v9)
  {
    v11 = (CHDrawing *)objc_msgSend_copy(v9, v4, v5, v6, v7, v8);
    drawing = self->_drawing;
    self->_drawing = v11;

  }
}

- (void)setOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  NSObject *v10;
  NSDictionary *v11;
  NSDictionary *options;
  uint8_t v13[16];

  v9 = (NSDictionary *)a3;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v13, 2u);
    }

  }
  if (self->_options != v9)
  {
    v11 = (NSDictionary *)objc_msgSend_copy(v9, v4, v5, v6, v7, v8);
    options = self->_options;
    self->_options = v11;

  }
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  uint8_t v8[16];

  height = a3.height;
  width = a3.width;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v6 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v8, 2u);
    }

  }
  if (self->_minimumDrawingSize.width != width || self->_minimumDrawingSize.height != height)
  {
    self->_minimumDrawingSize.width = width;
    self->_minimumDrawingSize.height = height;
  }
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }

  }
  if (self->_maxRecognitionResultCount != a3)
    self->_maxRecognitionResultCount = a3;
}

- (void)setEnableCachingIfAvailable:(BOOL)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }

  }
  self->_enableCachingIfAvailable = a3;
}

- (void)setHasBeenSubmitted:(BOOL)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (self->_hasBeenSubmitted && !a3)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_FAULT, "hasBeenSubmitted state cannot be reverted after being set to YES", v6, 2u);
    }

  }
  self->_hasBeenSubmitted = a3;
}

- (void)setPriority:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if (self->_hasBeenSubmitted)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }

  }
  if (self->_priority != a3)
    self->_priority = a3;
}

- (BOOL)isEqualToRemoteRecognitionRequest:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHRemoteRecognitionRequest *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int isEqualToDrawing;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int isEqualToDictionary;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int shouldContributeToStyle;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;

  v9 = (CHRemoteRecognitionRequest *)a3;
  if (self != v9)
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    v11 = v10;
    v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    if (v11 != v25 || v13 != v24)
      goto LABEL_20;
    v27 = objc_msgSend_maxRecognitionResultCount(self, v19, v20, v21, v22, v23);
    if (v27 != objc_msgSend_maxRecognitionResultCount(v9, v28, v29, v30, v31, v32))
      goto LABEL_20;
    v38 = objc_msgSend_enableCachingIfAvailable(self, v33, v34, v35, v36, v37);
    if (v38 != objc_msgSend_enableCachingIfAvailable(v9, v39, v40, v41, v42, v43))
      goto LABEL_20;
    objc_msgSend_drawing(self, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_drawing(v9, v50, v51, v52, v53, v54);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49 == v60)
    {

    }
    else
    {
      objc_msgSend_drawing(self, v55, v56, v57, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawing(v9, v62, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDrawing = objc_msgSend_isEqualToDrawing_(v61, v68, (uint64_t)v67, v69, v70, v71);

      if (!isEqualToDrawing)
        goto LABEL_20;
    }
    objc_msgSend_options(self, v73, v74, v75, v76, v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v9, v80, v81, v82, v83, v84);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79 == v90)
    {

    }
    else
    {
      objc_msgSend_options(self, v85, v86, v87, v88, v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v9, v92, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v91, v98, (uint64_t)v97, v99, v100, v101);

      if (!isEqualToDictionary)
        goto LABEL_20;
    }
    v108 = objc_msgSend_priority(self, v103, v104, v105, v106, v107);
    if (v108 == objc_msgSend_priority(v9, v109, v110, v111, v112, v113))
    {
      shouldContributeToStyle = objc_msgSend_shouldContributeToStyle(self, v114, v115, v116, v117, v118);
      v78 = shouldContributeToStyle ^ objc_msgSend_shouldContributeToStyle(v9, v120, v121, v122, v123, v124) ^ 1;
      goto LABEL_21;
    }
LABEL_20:
    LOBYTE(v78) = 0;
    goto LABEL_21;
  }
  LOBYTE(v78) = 1;
LABEL_21:

  return v78;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteRecognitionRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteRecognitionRequest = objc_msgSend_isEqualToRemoteRecognitionRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionRequest;
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
  double height;
  double width;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  width = self->_minimumDrawingSize.width;
  height = self->_minimumDrawingSize.height;
  objc_msgSend_options(self, a2, v2, v3, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_hash(v9, v10, v11, v12, v13, v14);

  objc_msgSend_drawing(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_hash(v21, v22, v23, v24, v25, v26);

  v33 = objc_msgSend_maxRecognitionResultCount(self, v28, v29, v30, v31, v32);
  return v15 ^ v27 ^ v33 ^ objc_msgSend_shouldContributeToStyle(self, v34, v35, v36, v37, v38) ^ (unint64_t)(height + (double)(unint64_t)width);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_description(self->_options, a2, v2, v3, v4, v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v8;
  v14 = CFSTR("Y");
  if (self->_enableCachingIfAvailable)
    v15 = CFSTR("Y");
  else
    v15 = CFSTR("N");
  if (self->_hasBeenSubmitted)
    v16 = CFSTR("Y");
  else
    v16 = CFSTR("N");
  if (!self->_shouldContributeToStyle)
    v14 = CFSTR("N");
  objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("Remote Recognition Request %p (option keys=%@, drawing=%p, enableCachingIfAvailable=%@, hasBeenSubmitted=%@, priority=%ld, shouldContributeToStyle=%@)"), v10, v11, v12, self, v8, self->_drawing, v15, v16, self->_priority, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CGSize)minimumDrawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumDrawingSize.width;
  height = self->_minimumDrawingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (NSDictionary)options
{
  return self->_options;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (BOOL)hasBeenSubmitted
{
  return self->_hasBeenSubmitted;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)shouldContributeToStyle
{
  return self->_shouldContributeToStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end
