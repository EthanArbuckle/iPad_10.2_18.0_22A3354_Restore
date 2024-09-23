@implementation CHRemoteSketchRecognizer

- (CHRemoteSketchRecognizer)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHRemoteSketchRecognizer *)objc_msgSend_initWithPriority_(self, a2, 0, v2, v3, v4);
}

- (CHRemoteSketchRecognizer)initWithPriority:(int64_t)a3
{
  CHRemoteSketchRecognizer *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHRemoteSketchRecognizer;
  v4 = -[CHRemoteRecognizer initWithEnableCachingIfAvailable:](&v10, sel_initWithEnableCachingIfAvailable_, 0);
  objc_msgSend_setPriority_(v4, v5, a3, v6, v7, v8);
  return v4;
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4
{
  return (id)((uint64_t (*)(CHRemoteSketchRecognizer *, char *, id, id, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_sketchRecognitionResultsForDrawing_options_error_, a3, a4, 0);
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  CHRemoteSketchRecognizer *v5;
  id v7;
  id v8;
  CHRemoteRecognitionSketchRequest *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void **v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void **v94;
  void *v95;
  NSObject *v96;
  id *v97;
  id v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  id *v111;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint8_t v126[16];
  _QWORD v127[7];
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  id location;
  id *p_location;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  _QWORD v144[5];
  uint8_t buf[8];
  uint64_t v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;

  v5 = self;
  if (!self)
  {
    v49 = 0;

    v110 = 0;
    v111 = a5;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  v7 = a4;
  v8 = a3;
  v9 = [CHRemoteRecognitionSketchRequest alloc];
  v15 = objc_msgSend_priority(v5, v10, v11, v12, v13, v14);
  v18 = (void *)objc_msgSend_initWithDrawing_options_priority_(v9, v16, (uint64_t)v8, (uint64_t)v7, v15, v17);

  v24 = objc_msgSend_maxRecognitionResultCount(v5, v19, v20, v21, v22, v23);
  objc_msgSend_setMaxRecognitionResultCount_(v18, v25, v24, v26, v27, v28);
  objc_msgSend_minimumDrawingSize(v5, v29, v30, v31, v32, v33);
  objc_msgSend_setMinimumDrawingSize_(v18, v34, v35, v36, v37, v38);
  v44 = objc_msgSend_enableCachingIfAvailable(v5, v39, v40, v41, v42, v43);
  objc_msgSend_setEnableCachingIfAvailable_(v18, v45, v44, v46, v47, v48);
  v49 = v18;
  v50 = v5;
  objc_sync_enter(v50);
  if (!v50[7])
  {
    v51 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v55 = objc_msgSend_initWithMachServiceName_options_(v51, v52, (uint64_t)CFSTR("com.apple.handwritingd.remoterecognition"), 0, v53, v54);
    v56 = v50[7];
    v50[7] = (void *)v55;

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v57, (uint64_t)&unk_1EF58B478, v58, v59, v60);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v49;
    v123 = (void *)MEMORY[0x1E0C99E60];
    v122 = objc_opt_class();
    v121 = objc_opt_class();
    v120 = objc_opt_class();
    v119 = objc_opt_class();
    v118 = objc_opt_class();
    v116 = objc_opt_class();
    v115 = objc_opt_class();
    v114 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    objc_msgSend_setWithObjects_(v123, v70, v122, v71, v72, v73, v121, v120, v119, v118, v116, v115, v114, v61, v62, v63, v64, v65, v66,
      v67,
      v68,
      v69,
      0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v124, v75, (uint64_t)v74, (uint64_t)sel_handleSketchRecognitionRequest_withReply_, 0, 1);
    objc_msgSend_setRemoteObjectInterface_(v50[7], v76, (uint64_t)v124, v77, v78, v79);
    objc_initWeak(&location, v50);
    v80 = v50[7];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v146 = 3221225472;
    v147 = (uint64_t)sub_1BE6ACD6C;
    v148 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E77F2F70;
    objc_copyWeak((id *)&v149, &location);
    objc_msgSend_setInterruptionHandler_(v80, v81, (uint64_t)buf, v82, v83, v84);
    objc_msgSend_setInvalidationHandler_(v50[7], v85, (uint64_t)&unk_1E77F1590, v86, v87, v88);
    v49 = v117;
    objc_msgSend_resume(v50[7], v89, v90, v91, v92, v93);
    objc_destroyWeak((id *)&v149);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v50);

  v94 = v50;
  objc_sync_enter(v94);
  v95 = v94[7];
  objc_sync_exit(v94);

  if (!v95)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v96 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v96, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v146 = (uint64_t)buf;
  v147 = 0x3032000000;
  v148 = sub_1BE6AC958;
  v149 = sub_1BE6AC968;
  v150 = 0;
  v97 = v94;
  objc_sync_enter(v97);
  v98 = v97[7];
  objc_sync_exit(v97);

  v99 = MEMORY[0x1E0C809B0];
  v144[0] = MEMORY[0x1E0C809B0];
  v144[1] = 3221225472;
  v144[2] = sub_1BE6AC970;
  v144[3] = &unk_1E77F2F20;
  v144[4] = buf;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v98, v100, (uint64_t)v144, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  p_location = &location;
  v140 = 0x3032000000;
  v141 = sub_1BE6AC958;
  v142 = sub_1BE6AC968;
  v143 = 0;
  v132 = 0;
  v133 = &v132;
  v134 = 0x3032000000;
  v135 = sub_1BE6AC958;
  v136 = sub_1BE6AC968;
  v137 = 0;
  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  v127[0] = v99;
  v127[1] = 3221225472;
  v127[2] = sub_1BE6ACA74;
  v127[3] = &unk_1E77F2F48;
  v127[4] = &location;
  v127[5] = &v132;
  v127[6] = &v128;
  objc_msgSend_handleSketchRecognitionRequest_withReply_(v104, v105, (uint64_t)v49, (uint64_t)v127, v106, v107);
  if (*((_BYTE *)v129 + 24))
  {
    v108 = *(void **)(v146 + 40);
    if (v108)
      goto LABEL_12;
    goto LABEL_20;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v113 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v126 = 0;
    _os_log_impl(&dword_1BE607000, v113, OS_LOG_TYPE_ERROR, "Sketch request did not execute reply block", v126, 2u);
  }

  v108 = *(void **)(v146 + 40);
  if (!v108)
LABEL_20:
    v108 = (void *)v133[5];
LABEL_12:
  v109 = objc_retainAutorelease(v108);
  v5 = (CHRemoteSketchRecognizer *)p_location[5];
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);

  _Block_object_dispose(&location, 8);
  _Block_object_dispose(buf, 8);

  v110 = v109;
  v111 = a5;
  if (a5)
LABEL_13:
    *v111 = objc_retainAutorelease(v110);
LABEL_14:

  return v5;
}

- (BOOL)isEqualToRemoteSketchRecognizer:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHRemoteSketchRecognizer *v9;
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
  void *v27;
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
  void *v39;
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
  int isEqual;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v9 = (CHRemoteSketchRecognizer *)a3;
  if (self == v9)
  {
    v57 = 1;
  }
  else
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    v11 = v10;
    v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    if (v11 != v25 || v13 != v24)
      goto LABEL_14;
    objc_msgSend_activeCharacterSet(self, v19, v20, v21, v22, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activeCharacterSet(v9, v28, v29, v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v33)
    {

    }
    else
    {
      v39 = (void *)v33;
      objc_msgSend_activeCharacterSet(self, v34, v35, v36, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_activeCharacterSet(v9, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v40, v47, (uint64_t)v46, v48, v49, v50);

      if (!isEqual)
        goto LABEL_14;
    }
    v58 = objc_msgSend_maxRecognitionResultCount(self, v52, v53, v54, v55, v56);
    if (v58 != objc_msgSend_maxRecognitionResultCount(v9, v59, v60, v61, v62, v63))
    {
LABEL_14:
      v57 = 0;
      goto LABEL_15;
    }
    v69 = objc_msgSend_priority(self, v64, v65, v66, v67, v68);
    v57 = v69 == objc_msgSend_priority(v9, v70, v71, v72, v73, v74);
  }
LABEL_15:

  return v57;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteSketchRecognizer;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteSketchRecognizer = objc_msgSend_isEqualToRemoteSketchRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteSketchRecognizer;
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  CHRemoteSketchRecognizer *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *connection;
  objc_super v10;

  if (self)
  {
    v3 = self;
    objc_sync_enter(v3);
    objc_msgSend_invalidate(v3->__connection, v4, v5, v6, v7, v8);
    connection = v3->__connection;
    v3->__connection = 0;

    objc_sync_exit(v3);
  }
  v10.receiver = self;
  v10.super_class = (Class)CHRemoteSketchRecognizer;
  -[CHRemoteRecognizer dealloc](&v10, sel_dealloc);
}

- (NSCharacterSet)activeCharacterSet
{
  return self->_activeCharacterSet;
}

- (void)setActiveCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_activeCharacterSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCharacterSet, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end
