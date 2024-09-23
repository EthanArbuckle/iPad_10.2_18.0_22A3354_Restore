@implementation CHVisualizationManager

+ (id)availableVisualizationIdentifiers
{
  if (qword_1EF568328 != -1)
    dispatch_once(&qword_1EF568328, &unk_1E77F19F0);
  return (id)qword_1EF568320;
}

+ (id)localizedNameForVisualizationIdentifier:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  v7 = a3;
  if (qword_1EF568338 != -1)
    dispatch_once(&qword_1EF568338, &unk_1E77F5638);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568330, v3, (uint64_t)v7, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E77F6F28;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  return v11;
}

+ (id)availableRecognitionSessionStatusKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[11];

  v5[10] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("CHStatusKeyStatus");
  v5[1] = CFSTR("CHStatusKeyEnvironment");
  v5[2] = CFSTR("CHStatusKeyLocales");
  v5[3] = CFSTR("CHStatusKeyLastDurationTotal");
  v5[4] = CFSTR("CHStatusKeyLastDurationDetailed");
  v5[5] = CFSTR("CHStatusStrokeCount");
  v5[6] = CFSTR("CHStatusKeyGroupCount");
  v5[7] = CFSTR("CHStatusKeyTranscript");
  v5[8] = CFSTR("CHStatusKeyAllResults");
  v5[9] = CFSTR("CHStatusKeyAllMathResults");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v5, 10, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedNameForRecognitionSessionStatusKey:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  v7 = a3;
  if (qword_1EF568358 != -1)
    dispatch_once(&qword_1EF568358, &unk_1E77F5658);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568350, v3, (uint64_t)v7, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E77F6F28;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  return v11;
}

+ (BOOL)variableHeightForRecognitionSessionStatusKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], v4, (uint64_t)CFSTR("CHStatusKeyTranscript"), v5, v6, v7, CFSTR("CHStatusKeyAllResults"), CFSTR("CHStatusKeyAllMathResults"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v3, v10, v11, v12);

  return v13;
}

+ (CGColor)newColorForVisualizedItemAtIndex:(int64_t)a3
{
  int64_t v3;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v5;
  __int128 *v6;
  __int128 v7;
  CGColor *v8;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3 % 10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = DeviceRGB;
  switch(v3)
  {
    case 0:
      v6 = &xmmword_1BE8DF878;
      break;
    case 1:
      v6 = &xmmword_1BE8DF898;
      break;
    case 2:
      v6 = &xmmword_1BE8DF8B8;
      break;
    case 3:
      v6 = &xmmword_1BE8DF8D8;
      break;
    case 4:
      v6 = &xmmword_1BE8DF8F8;
      break;
    case 5:
      v6 = &xmmword_1BE8DF918;
      break;
    case 6:
      v6 = &xmmword_1BE8DF938;
      break;
    case 7:
      v6 = &xmmword_1BE8DF958;
      break;
    case 8:
      v6 = &xmmword_1BE8DF978;
      break;
    default:
      v6 = &xmmword_1BE8DF998;
      break;
  }
  v7 = v6[1];
  v10[0] = *v6;
  v10[1] = v7;
  v8 = CGColorCreate(DeviceRGB, (const CGFloat *)v10);
  CGColorSpaceRelease(v5);
  return v8;
}

- (CHVisualizationManager)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use initWithRecognitionSession: instead.", v5, 2u);
  }

  return 0;
}

- (CHVisualizationManager)initWithRecognitionSession:(id)a3
{
  id v5;
  CHVisualizationManager *v6;
  CHVisualizationManager *v7;
  NSMutableSet *v8;
  NSMutableSet *enabledVisualizationIDs;
  NSMutableArray *v10;
  NSMutableArray *activeVisualizationIDs;
  NSMutableDictionary *v12;
  NSMutableDictionary *activeVisualizationsByID;
  NSMutableDictionary *v14;
  NSMutableDictionary *strokeGroupIndexByAncestorID;
  NSMutableSet *v16;
  NSMutableSet *renderedResults;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHVisualizationManager;
  v6 = -[CHVisualizationManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognitionSession, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    enabledVisualizationIDs = v7->__enabledVisualizationIDs;
    v7->__enabledVisualizationIDs = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeVisualizationIDs = v7->__activeVisualizationIDs;
    v7->__activeVisualizationIDs = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeVisualizationsByID = v7->__activeVisualizationsByID;
    v7->__activeVisualizationsByID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    strokeGroupIndexByAncestorID = v7->__strokeGroupIndexByAncestorID;
    v7->__strokeGroupIndexByAncestorID = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    renderedResults = v7->__renderedResults;
    v7->__renderedResults = v16;

  }
  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  CHVisualizationManager *v19;
  _BOOL4 v20;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self && self->__registeredAsChangeObserver)
    objc_msgSend_unregisterChangeObserver_(self->_recognitionSession, a2, (uint64_t)self, v3, v4, v5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend_allValues(self->__activeVisualizationsByID, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v22, (uint64_t)v26, 16, v9);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v7);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend_delegate(v18, v10, v11, v12, v13, v14);
        v19 = (CHVisualizationManager *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == self;

        if (v20)
          objc_msgSend_setDelegate_(v18, v10, 0, v12, v13, v14);
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v22, (uint64_t)v26, 16, v14);
    }
    while (v15);
  }

  v21.receiver = self;
  v21.super_class = (Class)CHVisualizationManager;
  -[CHVisualizationManager dealloc](&v21, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3 forVisualizationIdentifier:(id)a4
{
  int v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int isEnabledVisualizationForIdentifier;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  CHVisualizationManager *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  objc_class *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSMutableArray *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[8];
  uint64_t v112;
  uint64_t (*v113)(uint64_t, void *, void *);
  void *v114;
  CHVisualizationManager *v115;
  _BYTE v116[128];
  uint64_t v117;

  v4 = a3;
  v117 = *MEMORY[0x1E0C80C00];
  v106 = a4;
  if (objc_msgSend_isEnabledVisualizationForIdentifier_(self, v6, (uint64_t)v106, v7, v8, v9) == v4)
    goto LABEL_38;
  if (v4)
  {
    if (self)
      objc_msgSend_addObject_(self->__enabledVisualizationIDs, v10, (uint64_t)v106, v11, v12, v13);
    else
      objc_msgSend_addObject_(0, v10, (uint64_t)v106, v11, v12, v13);
  }
  else if (self)
  {
    objc_msgSend_removeObject_(self->__enabledVisualizationIDs, v10, (uint64_t)v106, v11, v12, v13);
  }
  else
  {
    objc_msgSend_removeObject_(0, v10, (uint64_t)v106, v11, v12, v13);
  }
  if (!self)
    goto LABEL_38;
  v14 = (void *)objc_opt_class();
  objc_msgSend_availableVisualizationIdentifiers(v14, v15, v16, v17, v18, v19);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v107, (uint64_t)v116, 16, v22);
  v28 = v20;
  if (!v27)
    goto LABEL_36;
  v29 = 0;
  v30 = *(_QWORD *)v108;
  do
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v108 != v30)
        objc_enumerationMutation(v20);
      v32 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
      isEnabledVisualizationForIdentifier = objc_msgSend_isEnabledVisualizationForIdentifier_(self, v23, (uint64_t)v32, v24, v25, v26);
      v34 = v32;
      v39 = objc_msgSend_containsObject_(self->__activeVisualizationIDs, v35, (uint64_t)v34, v36, v37, v38);

      if (((isEnabledVisualizationForIdentifier ^ 1 | v39) & 1) == 0)
      {
        v57 = v34;
        if (objc_msgSend_containsObject_(self->__activeVisualizationIDs, v58, (uint64_t)v57, v59, v60, v61))
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v62 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v62, OS_LOG_TYPE_FAULT, "Cannot activate an already active visualization", buf, 2u);
          }

        }
        v63 = v57;
        objc_opt_self();
        if (qword_1EF568348 != -1)
          dispatch_once(&qword_1EF568348, &unk_1E77EFE78);
        v68 = (objc_class *)(id)objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568340, v64, (uint64_t)v63, v65, v66, v67);

        if (v68)
        {
          v73 = [v68 alloc];
          objc_msgSend_recognitionSession(self, v74, v75, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)objc_msgSend_initWithRecognitionSession_(v73, v80, (uint64_t)v79, v81, v82, v83);

          objc_msgSend_setObject_forKey_(self->__activeVisualizationsByID, v85, (uint64_t)v84, (uint64_t)v63, v86, v87);
          objc_msgSend_setDelegate_(v84, v88, (uint64_t)self, v89, v90, v91);

        }
        objc_msgSend_addObject_(self->__activeVisualizationIDs, v69, (uint64_t)v63, v70, v71, v72);
        v92 = self->__activeVisualizationIDs;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v112 = 3221225472;
        v113 = sub_1BE7EC25C;
        v114 = &unk_1E77F56D0;
        v115 = self;
        objc_msgSend_sortUsingComparator_(v92, v93, (uint64_t)buf, v94, v95, v96);

        goto LABEL_11;
      }
      if (((isEnabledVisualizationForIdentifier | v39 ^ 1) & 1) == 0)
      {
        v40 = v34;
        objc_msgSend_objectForKeyedSubscript_(self->__activeVisualizationsByID, v41, (uint64_t)v40, v42, v43, v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
          objc_msgSend_removeObjectForKey_(self->__activeVisualizationsByID, v45, (uint64_t)v40, v47, v48, v49);
        objc_msgSend_delegate(v50, v45, v46, v47, v48, v49);
        v51 = (CHVisualizationManager *)objc_claimAutoreleasedReturnValue();
        v52 = v51 == self;

        if (v52)
          objc_msgSend_setDelegate_(v50, v53, 0, v54, v55, v56);
        objc_msgSend_removeObject_(self->__activeVisualizationIDs, v53, (uint64_t)v40, v54, v55, v56);

LABEL_11:
        v29 = 1;
        continue;
      }
    }
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v107, (uint64_t)v116, 16, v26);
  }
  while (v27);

  if ((v29 & 1) != 0)
  {
    objc_msgSend_delegate(self, v97, v98, v99, v100, v101);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visualizationManagerNeedsDisplay_(v28, v102, (uint64_t)self, v103, v104, v105);
LABEL_36:

  }
  sub_1BE7EB2A4((uint64_t)self);

LABEL_38:
}

- (BOOL)isEnabledVisualizationForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char v9;
  BOOL v10;

  v8 = a3;
  if (self)
    v9 = objc_msgSend_containsObject_(self->__enabledVisualizationIDs, v4, (uint64_t)v8, v5, v6, v7);
  else
    v9 = objc_msgSend_containsObject_(0, v4, (uint64_t)v8, v5, v6, v7);
  v10 = v9;

  return v10;
}

- (void)setStatusReportingEnabled:(BOOL)a3
{
  if (self->_statusReportingEnabled != a3)
  {
    self->_statusReportingEnabled = a3;
    sub_1BE7EB2A4((uint64_t)self);
  }
}

- (NSArray)renderedResults
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (NSArray *)objc_msgSend_allObjects(self->__renderedResults, a2, v2, v3, v4, v5);
}

- (id)valueForRecognitionStatusKey:(id)a3
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
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
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const __CFString *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  id v156;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  _QWORD v288[5];
  _QWORD v289[5];
  __int128 v290;
  __int128 v291;
  __int128 v292;

  v4 = a3;
  if (!objc_msgSend_statusReportingEnabled(self, v5, v6, v7, v8, v9))
  {
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v10, v11, v12, v13, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v33, v34, (uint64_t)CFSTR("<Status Reporting Disabled>"), (uint64_t)&stru_1E77F6F28, 0, v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  if (objc_msgSend_isEqualToString_(v4, v10, (uint64_t)CFSTR("CHStatusKeyStatus"), v12, v13, v14))
  {
    objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_status(v20, v21, v22, v23, v24, v25);
    CHLocalizedDescriptionForRecognitionSessionStatus(v26, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend_isEqualToString_(v4, v15, (uint64_t)CFSTR("CHStatusKeyEnvironment"), v17, v18, v19))
  {
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v41, v42, (uint64_t)CFSTR("In process"), (uint64_t)&stru_1E77F6F28, 0, v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v49, v50, (uint64_t)CFSTR("Out of process"), (uint64_t)&stru_1E77F6F28, 0, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v53, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v58, v59, (uint64_t)CFSTR("Automatic"), (uint64_t)&stru_1E77F6F28, 0, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recognitionSession(self, v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastRecognitionResult(v67, v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_recognitionEnvironment(v73, v74, v75, v76, v77, v78);

    objc_msgSend_recognitionSession(self, v80, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_recognitionEnvironment(v85, v86, v87, v88, v89, v90);

    v96 = v33;
    if (v91)
    {
      if (v91 == 1)
      {
LABEL_11:
        v97 = v96;
LABEL_25:
        v156 = v97;

        v32 = v156;
        goto LABEL_26;
      }
      if (v91 == 2)
      {
        v96 = v52;
        goto LABEL_11;
      }
LABEL_26:

      goto LABEL_27;
    }
    if (v79 != 1)
    {
      if (v79 != 2)
        goto LABEL_26;
      v96 = v52;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v92, (uint64_t)CFSTR("%@ (%@)"), v93, v94, v95, v61, v96);
    v97 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!objc_msgSend_isEqualToString_(v4, v36, (uint64_t)CFSTR("CHStatusKeyLocales"), v38, v39, v40))
  {
    if (objc_msgSend_isEqualToString_(v4, v98, (uint64_t)CFSTR("CHStatusKeyLastDurationTotal"), v100, v101, v102))
    {
      v291 = 0u;
      v292 = 0u;
      v290 = 0u;
      objc_msgSend_recognitionSession(self, v120, v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastRecognitionResult(v125, v126, v127, v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v131;
      if (v131)
      {
        objc_msgSend_generationDuration(v131, v132, v133, v134, v135, v136);
      }
      else
      {
        v291 = 0u;
        v292 = 0u;
        v290 = 0u;
      }

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v187, (uint64_t)CFSTR("%0.2fs"), v188, v189, v190, *((_QWORD *)&v292 + 1));
      v191 = objc_claimAutoreleasedReturnValue();
LABEL_40:
      v242 = (void *)v191;

      v32 = v242;
      goto LABEL_28;
    }
    if (objc_msgSend_isEqualToString_(v4, v120, (uint64_t)CFSTR("CHStatusKeyLastDurationDetailed"), v122, v123, v124))
    {
      v291 = 0u;
      v292 = 0u;
      v290 = 0u;
      objc_msgSend_recognitionSession(self, v138, v139, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastRecognitionResult(v143, v144, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = v149;
      if (v149)
      {
        objc_msgSend_generationDuration(v149, v150, v151, v152, v153, v154);
      }
      else
      {
        v291 = 0u;
        v292 = 0u;
        v290 = 0u;
      }

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v238, (uint64_t)CFSTR("%0.2fs Clutter Filtering, %0.2fs Stroke class., %0.2fs Grouping, %0.2fs Recog., %0.2fs Princ. Lines"), v239, v240, v241, v290, v291, (_QWORD)v292);
      v191 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    if (objc_msgSend_isEqualToString_(v4, v138, (uint64_t)CFSTR("CHStatusStrokeCount"), v140, v141, v142))
    {
      objc_msgSend_recognitionSession(self, v158, v159, v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_latestStrokeProvider(v163, v164, v165, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_orderedStrokes(v169, v170, v171, v172, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend_count(v175, v176, v177, v178, v179, v180);

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v182, (uint64_t)CFSTR("%ld"), v183, v184, v185, v181);
      v186 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v4, v158, (uint64_t)CFSTR("CHStatusKeyGroupCount"), v160, v161, v162))
      {
        if (objc_msgSend_isEqualToString_(v4, v192, (uint64_t)CFSTR("CHStatusKeyTranscript"), v194, v195, v196))
        {
          objc_msgSend_recognitionSession(self, v243, v244, v245, v246, v247);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastRecognitionResult(v169, v248, v249, v250, v251, v252);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_highConfidenceDebugDescription(v253, v254, v255, v256, v257, v258);
          v259 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend_isEqualToString_(v4, v243, (uint64_t)CFSTR("CHStatusKeyAllResults"), v245, v246, v247))
        {
          objc_msgSend_recognitionSession(self, v260, v261, v262, v263, v264);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastRecognitionResult(v169, v265, v266, v267, v268, v269);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          v289[0] = MEMORY[0x1E0C809B0];
          v289[1] = 3221225472;
          v289[2] = sub_1BE7EBEF0;
          v289[3] = &unk_1E77F5680;
          v289[4] = self;
          objc_msgSend_allResultsDebugDescriptionWithGroupHeaderBlock_(v253, v270, (uint64_t)v289, v271, v272, v273);
          v259 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend_isEqualToString_(v4, v260, (uint64_t)CFSTR("CHStatusKeyAllMathResults"), v262, v263, v264))goto LABEL_28;
          objc_msgSend_recognitionSession(self, v274, v275, v276, v277, v278);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastRecognitionResult(v169, v279, v280, v281, v282, v283);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          v288[0] = MEMORY[0x1E0C809B0];
          v288[1] = 3221225472;
          v288[2] = sub_1BE7EBF8C;
          v288[3] = &unk_1E77F56A8;
          v288[4] = self;
          objc_msgSend_allMathResultsDebugDescriptionWithGroupHeaderBlock_(v253, v284, (uint64_t)v288, v285, v286, v287);
          v259 = objc_claimAutoreleasedReturnValue();
        }
        v237 = (void *)v259;

LABEL_48:
        v32 = v237;
        goto LABEL_28;
      }
      objc_msgSend_recognitionSession(self, v192, v193, v194, v195, v196);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastRecognitionResult(v197, v198, v199, v200, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeGroupingResult(v203, v204, v205, v206, v207, v208);
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_strokeGroups(v169, v209, v210, v211, v212, v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = objc_msgSend_count(v214, v215, v216, v217, v218, v219);

      objc_msgSend_textStrokeGroups(v169, v221, v222, v223, v224, v225);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      v232 = objc_msgSend_count(v226, v227, v228, v229, v230, v231);

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v233, (uint64_t)CFSTR("%ld text, %ld non-text"), v234, v235, v236, v232, v220 - v232);
      v186 = objc_claimAutoreleasedReturnValue();
    }
    v237 = (void *)v186;

    goto LABEL_48;
  }
  objc_msgSend_recognitionSession(self, v98, v99, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastRecognitionResult(v103, v104, v105, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredLocales(v109, v110, v111, v112, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v115, v116, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77EFBB8, v117, v118);
    v119 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v119 = &stru_1E77F6F28;
  }

  v32 = (void *)v119;
LABEL_28:

  return v32;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableSet *renderedResults;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3.size.height;
  v14 = a3.size.width;
  v15 = a3.origin.y;
  v16 = a3.origin.x;
  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(self->__renderedResults, a2, (uint64_t)a4, v5, v6, v7);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v18 = self->__activeVisualizationIDs;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v48, (uint64_t)v52, 16, v20);
  if (v21)
  {
    v22 = *(_QWORD *)v49;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v23);
        v25 = self->__activeVisualizationsByID;
        objc_msgSend_objectForKeyedSubscript_(v25, v26, v24, v27, v28, v29, (_QWORD)v48);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          CGContextSaveGState(a4);
          objc_msgSend_drawVisualizationInRect_context_viewBounds_(v30, v31, (uint64_t)a4, v32, v33, v34, v16, v15, v14, v13, x, y, width, height);
          CGContextRestoreGState(a4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            renderedResults = self->__renderedResults;
            objc_msgSend_renderedResults(v30, v35, v36, v37, v38, v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(renderedResults, v42, (uint64_t)v41, v43, v44, v45);

          }
        }

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v46, (uint64_t)&v48, (uint64_t)v52, 16, v47);
    }
    while (v21);
  }

}

- (void)toggleSelectiveVisualizationsAtPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
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
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  if (self)
    self = (CHVisualizationManager *)self->__activeVisualizationsByID;
  objc_msgSend_allValues(self, a2, v3, v4, v5, v6, (_QWORD)v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16, v11);
  if (v17)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v9);
        objc_msgSend_toggleVisualizationRegionAtPoint_(*(void **)(*((_QWORD *)&v20 + 1) + 8 * i), v12, v13, v14, v15, v16, x, y);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16, v16);
    }
    while (v17);
  }

}

- (void)visualizationNeedsDisplay:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_delegate(self, a2, (uint64_t)a3, v3, v4, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visualizationManagerNeedsDisplay_(v11, v7, (uint64_t)self, v8, v9, v10);

}

- (void)visualization:(id)a3 needsDisplayInRect:(CGRect)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend_delegate(self, a2, (uint64_t)a3, v4, v5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visualizationManager_needsDisplayInRect_(v16, v12, (uint64_t)self, v13, v14, v15, x, y, width, height);

}

- (int64_t)visualizationIndexForStrokeGroup:(id)a3
{
  NSMutableDictionary *strokeGroupIndexByAncestorID;
  NSMutableDictionary *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  NSMutableDictionary *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  NSMutableDictionary *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  NSMutableDictionary *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  NSMutableDictionary *v128;
  NSMutableDictionary *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  int64_t v151;
  unint64_t v153;
  void *v154;
  void *v155;
  id v156;
  _QWORD v157[5];
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  _QWORD v167[3];

  v167[1] = *MEMORY[0x1E0C80C00];
  v156 = a3;
  if (self)
    strokeGroupIndexByAncestorID = self->__strokeGroupIndexByAncestorID;
  else
    strokeGroupIndexByAncestorID = 0;
  v5 = strokeGroupIndexByAncestorID;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_ancestorIdentifier(v156, v7, v8, v9, v10, v11);
  objc_msgSend_numberWithInteger_(v6, v13, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v18, (uint64_t)v17, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27);
  }
  else
  {
    if (self)
    {
      objc_msgSend_recognitionSession(self, v23, v24, v25, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastRecognitionResult(v29, v30, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeGroupingResult(v35, v36, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeGroups(v41, v42, v43, v44, v45, v46);
      v155 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x1E0CB3928];
      NSStringFromSelector(sel_ancestorIdentifier);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortDescriptorWithKey_ascending_(v47, v49, (uint64_t)v48, 1, v50, v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v154 = (void *)v52;
      v167[0] = v52;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v53, (uint64_t)v167, 1, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingDescriptors_(v155, v57, (uint64_t)v56, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v62 = v61;
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v162, (uint64_t)v166, 16, v64);
      if (v65)
      {
        v66 = 0;
        v67 = *(_QWORD *)v163;
        while (2)
        {
          v68 = 0;
          v153 = v66;
          v69 = v65 + v66;
          do
          {
            if (*(_QWORD *)v163 != v67)
              objc_enumerationMutation(v62);
            v70 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v68);
            v71 = self->__strokeGroupIndexByAncestorID;
            v72 = (void *)MEMORY[0x1E0CB37E8];
            v78 = objc_msgSend_ancestorIdentifier(v70, v73, v74, v75, v76, v77);
            objc_msgSend_numberWithInteger_(v72, v79, v78, v80, v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v71, v84, (uint64_t)v83, v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v88)
            {
              v69 = v153 + v68;
              goto LABEL_17;
            }
            ++v68;
          }
          while (v65 != v68);
          v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v89, (uint64_t)&v162, (uint64_t)v166, 16, v90);
          v66 = v69;
          if (v65)
            continue;
          break;
        }
      }
      else
      {
        v69 = 0;
      }
LABEL_17:

      v158 = 0;
      v159 = &v158;
      v160 = 0x2020000000;
      v161 = -1;
      v91 = self->__strokeGroupIndexByAncestorID;
      v157[0] = MEMORY[0x1E0C809B0];
      v157[1] = 3221225472;
      v157[2] = sub_1BE7ECB14;
      v157[3] = &unk_1E77F56F8;
      v157[4] = &v158;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v91, v92, (uint64_t)v157, v93, v94, v95);
      v101 = v159[3] + 1;
      while (v69 < objc_msgSend_count(v62, v96, v97, v98, v99, v100))
      {
        objc_msgSend_objectAtIndexedSubscript_(v62, v102, v69, v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v107, v101, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = self->__strokeGroupIndexByAncestorID;
        v113 = (void *)MEMORY[0x1E0CB37E8];
        v119 = objc_msgSend_ancestorIdentifier(v106, v114, v115, v116, v117, v118);
        objc_msgSend_numberWithInteger_(v113, v120, v119, v121, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v112, v125, (uint64_t)v111, (uint64_t)v124, v126, v127);

        ++v69;
        ++v101;
      }
      _Block_object_dispose(&v158, 8);

      v128 = self->__strokeGroupIndexByAncestorID;
    }
    else
    {
      v128 = 0;
    }
    v129 = v128;
    v130 = (void *)MEMORY[0x1E0CB37E8];
    v136 = objc_msgSend_ancestorIdentifier(v156, v131, v132, v133, v134, v135);
    objc_msgSend_numberWithInteger_(v130, v137, v136, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v129, v142, (uint64_t)v141, v143, v144, v145);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v151 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_24;
    }
    v28 = objc_msgSend_integerValue(v22, v146, v147, v148, v149, v150);
  }
  v151 = v28;
LABEL_24:

  return v151;
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHVisualizationManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE7ECC04;
  v6[3] = &unk_1E77F2428;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)recognitionSessionDidChangeStatus:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE7ECE78;
  block[3] = &unk_1E77F1F38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHVisualizationManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CHVisualizationManagerDelegate *)a3;
}

- (BOOL)statusReportingEnabled
{
  return self->_statusReportingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderedResults, 0);
  objc_storeStrong((id *)&self->__strokeGroupIndexByAncestorID, 0);
  objc_storeStrong((id *)&self->__activeVisualizationsByID, 0);
  objc_storeStrong((id *)&self->__activeVisualizationIDs, 0);
  objc_storeStrong((id *)&self->__enabledVisualizationIDs, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
}

@end
