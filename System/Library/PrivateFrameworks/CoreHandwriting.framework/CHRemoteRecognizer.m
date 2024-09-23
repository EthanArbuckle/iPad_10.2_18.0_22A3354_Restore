@implementation CHRemoteRecognizer

- (CHRemoteRecognizer)initWithEnableCachingIfAvailable:(BOOL)a3
{
  CHRemoteRecognizer *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHRemoteRecognizer;
  v4 = -[CHRemoteRecognizer init](&v14, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend_defaultMinimumDrawingSize(v5, v6, v7, v8, v9, v10);
    v4->_minimumDrawingSize.width = v11;
    v4->_minimumDrawingSize.height = v12;
    v4->_priority = 0;
    v4->_enableCachingIfAvailable = a3;
  }
  return v4;
}

- (void)setupXPCConnectionIfNeeded
{
  CHRemoteRecognizer *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *connection;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSXPCConnection *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->__connection)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v7 = objc_msgSend_initWithMachServiceName_options_(v3, v4, (uint64_t)CFSTR("com.apple.handwritingd.remoterecognition"), 0, v5, v6);
    connection = v2->__connection;
    v2->__connection = (NSXPCConnection *)v7;

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v9, (uint64_t)&unk_1EF58B478, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v14, v19, v15, v20, v21, v22, v16, v17, v18, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v13, v24, (uint64_t)v23, (uint64_t)sel_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_, 0, 1);
    objc_msgSend_setRemoteObjectInterface_(v2->__connection, v25, (uint64_t)v13, v26, v27, v28);
    objc_initWeak(&location, v2);
    v29 = v2->__connection;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = sub_1BE7E6498;
    v43[3] = &unk_1E77F3140;
    objc_copyWeak(&v44, &location);
    objc_msgSend_setInterruptionHandler_(v29, v30, (uint64_t)v43, v31, v32, v33);
    objc_msgSend_setInvalidationHandler_(v2->__connection, v34, (uint64_t)&unk_1E77F19B0, v35, v36, v37);
    objc_msgSend_resume(v2->__connection, v38, v39, v40, v41, v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v2);

}

- (id)connection
{
  CHRemoteRecognizer *v2;
  NSXPCConnection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->__connection;
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  sub_1BE7E654C(self);
  v3.receiver = self;
  v3.super_class = (Class)CHRemoteRecognizer;
  -[CHRemoteRecognizer dealloc](&v3, sel_dealloc);
}

- (void)logDrawingsAndResultsForRequest:(id)a3 result:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  NSObject *v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  uint8_t buf[4];
  const __CFString *v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  NSObject *v134;
  _QWORD v135[2];
  _QWORD v136[3];

  v136[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryForKey_(v15, v16, (uint64_t)CFSTR("com.apple.corehandwriting"), v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("CHLogAllDrawings"), v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_BOOLValue(v25, v26, v27, v28, v29, v30);

    if ((v31 & 1) != 0)
    {
      objc_msgSend_topTranscription(v8, v32, v33, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v43 = &stru_1E77F6F28;
      v125 = (void *)v37;
      if (v37)
        v43 = (const __CFString *)v37;
      v136[0] = v43;
      v135[0] = CFSTR("string");
      v135[1] = CFSTR("request_description");
      objc_msgSend_debugDescription(v7, v38, v39, v40, v41, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v136[1] = v44;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v45, (uint64_t)v136, (uint64_t)v135, 2, v46);
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      if (qword_1EF568318 != -1)
        dispatch_once(&qword_1EF568318, &unk_1E77EF568);
      v127 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend_setDateFormat_(v127, v47, (uint64_t)CFSTR("dd-MM-yyyy-HH-mm-ss-SSS"), v48, v49, v50);
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v51, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v56, v57, v58, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v62, v63, 4, v64, v65, v66);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_now(MEMORY[0x1E0C99D68], v67, v68, v69, v70, v71);
      v72 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromDate_(v127, v73, v72, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_drawing(v7, v78, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v72) = v83 == 0;

      if ((v72 & 1) != 0)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v88 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = (uint64_t)v9;
          _os_log_impl(&dword_1BE607000, v88, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil drawing. Error = %@", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v84, (uint64_t)CFSTR("drawing_%@_%@.json"), v85, v86, v87, v77, v128);
        v88 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawing(v7, v89, v90, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writeToFileWithContext_folder_basename_(v94, v95, (uint64_t)v126, qword_1EF568310, (uint64_t)v88, v96);

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v97 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = qword_1EF568310;
          v133 = 2112;
          v134 = v88;
          _os_log_impl(&dword_1BE607000, v97, OS_LOG_TYPE_DEFAULT, "%@ serialize drawing to %@/%@, ", buf, 0x20u);
        }

        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v98, (uint64_t)CFSTR("request_%@_%@.hrr"), v99, v100, v101, v77, v128);
        v102 = objc_claimAutoreleasedReturnValue();
        v106 = (id)objc_msgSend_writeToFileInFolder_basename_(v7, v103, qword_1EF568310, (uint64_t)v102, v104, v105);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v107 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = qword_1EF568310;
          v133 = 2112;
          v134 = v102;
          _os_log_impl(&dword_1BE607000, v107, OS_LOG_TYPE_DEFAULT, "%@ serialize request to %@/%@, ", buf, 0x20u);
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v108 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_debugDescription(v7, v109, v110, v111, v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = (uint64_t)v114;
          _os_log_impl(&dword_1BE607000, v108, OS_LOG_TYPE_DEFAULT, "%@ serialize request with description = %@", buf, 0x16u);

        }
      }

      if (v8)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v115, (uint64_t)CFSTR("result_%@_%@.dat"), v116, v117, v118, v77, v128);
        v119 = objc_claimAutoreleasedReturnValue();
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v120 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = qword_1EF568310;
          v133 = 2112;
          v134 = v119;
          _os_log_impl(&dword_1BE607000, v120, OS_LOG_TYPE_DEFAULT, "%@ serialize recognition result to %@/%@, ", buf, 0x20u);
        }

        v124 = (id)objc_msgSend_writeToFileInFolder_basename_(v8, v121, qword_1EF568310, (uint64_t)v119, v122, v123);
      }
      else
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v119 = (id)qword_1EF568E38;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v130 = CFSTR("CHLogAllDrawings");
          v131 = 2112;
          v132 = (uint64_t)v9;
          _os_log_impl(&dword_1BE607000, v119, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil result. Error = %@", buf, 0x16u);
        }
      }

    }
  }

}

- (BOOL)isEqualToRemoteRecognizer:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHRemoteRecognizer *v9;
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
  BOOL v26;
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
  uint64_t v38;
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
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;

  v9 = (CHRemoteRecognizer *)a3;
  if (self == v9)
  {
    LOBYTE(v55) = 1;
  }
  else
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    v11 = v10;
    v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    v26 = v11 == v25 && v13 == v24;
    if (v26
      && (v27 = objc_msgSend_maxRecognitionResultCount(self, v19, v20, v21, v22, v23),
          v27 == objc_msgSend_maxRecognitionResultCount(v9, v28, v29, v30, v31, v32))
      && (v38 = objc_msgSend_priority(self, v33, v34, v35, v36, v37),
          v38 == objc_msgSend_priority(v9, v39, v40, v41, v42, v43)))
    {
      v49 = objc_msgSend_enableCachingIfAvailable(self, v44, v45, v46, v47, v48);
      v55 = v49 ^ objc_msgSend_enableCachingIfAvailable(v9, v50, v51, v52, v53, v54) ^ 1;
    }
    else
    {
      LOBYTE(v55) = 0;
    }
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteRecognizer;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteRecognizer = objc_msgSend_isEqualToRemoteRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognizer;
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
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = (unint64_t)(self->_minimumDrawingSize.height + (double)(unint64_t)self->_minimumDrawingSize.width);
  v8 = objc_msgSend_maxRecognitionResultCount(self, a2, v2, v3, v4, v5);
  return objc_msgSend_priority(self, v9, v10, v11, v12, v13) ^ v8 ^ self->_enableCachingIfAvailable ^ v7;
}

+ (int64_t)absoluteMaxStrokeCountPerRequest
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_opt_class();
  return objc_msgSend_drawingStrokeLimitForLocale_(v2, v3, 0, v4, v5, v6);
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  self->_maxRecognitionResultCount = a3;
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

- (void)setMinimumDrawingSize:(CGSize)a3
{
  self->_minimumDrawingSize = a3;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
}

@end
