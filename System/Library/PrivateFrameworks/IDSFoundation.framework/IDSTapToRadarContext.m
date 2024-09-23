@implementation IDSTapToRadarContext

- (IDSTapToRadarContext)initWithTitle:(id)a3 problemDescription:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  IDSTapToRadarContext *v9;
  double v10;
  uint64_t v11;
  NSDictionary *rawContext;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSTapToRadarContext;
  v9 = -[IDSTapToRadarContext init](&v14, sel_init);
  if (v9)
  {
    v15[0] = CFSTR("Title");
    v15[1] = CFSTR("Description");
    v16[0] = v6;
    v16[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v16, v10, v15, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    rawContext = v9->_rawContext;
    v9->_rawContext = (NSDictionary *)v11;

  }
  return v9;
}

- (IDSTapToRadarContext)initWithDictionary:(id)a3
{
  id v5;
  IDSTapToRadarContext *v6;
  IDSTapToRadarContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSTapToRadarContext;
  v6 = -[IDSTapToRadarContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawContext, a3);

  return v7;
}

- (id)getTapToRadarURL
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  id v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  uint64_t v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  __CFString *v78;
  double v79;
  const __CFString *v80;
  const char *v81;
  double v82;
  uint64_t v83;
  const char *v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  uint64_t v93;
  const char *v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  const char *v109;
  uint64_t v110;
  double v111;
  void *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, a2, (uint64_t)CFSTR("QueryParameter"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v5, (uint64_t)CFSTR("QueryParameter"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("tap-to-radar://new%@"), v9, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99E98]);
    v14 = (void *)objc_msgSend_initWithString_(v11, v12, (uint64_t)v10, v13);
    goto LABEL_33;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3998]);
  v114 = (void *)objc_msgSend_initWithString_(v15, v16, (uint64_t)CFSTR("tap-to-radar://new"), v17);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v19, (uint64_t)CFSTR("ComponentID"), v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_8;
  v24 = (void *)v21;
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v22, (uint64_t)CFSTR("ComponentName"), v23);
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {

    goto LABEL_8;
  }
  v28 = (void *)v25;
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v26, (uint64_t)CFSTR("ComponentVersion"), v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
LABEL_8:
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, (uint64_t)CFSTR("629332"), v23, CFSTR("ComponentID"));
    objc_msgSend_setObject_forKeyedSubscript_(v18, v45, (uint64_t)CFSTR("IDS"), v46, CFSTR("ComponentName"));
    objc_msgSend_setObject_forKeyedSubscript_(v18, v47, (uint64_t)CFSTR("New Bugs"), v48, CFSTR("ComponentVersion"));
    goto LABEL_9;
  }
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v22, (uint64_t)CFSTR("ComponentID"), v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v31, (uint64_t)v30, v32, CFSTR("ComponentID"));

  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v33, (uint64_t)CFSTR("ComponentName"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v36, (uint64_t)v35, v37, CFSTR("ComponentName"));

  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v38, (uint64_t)CFSTR("ComponentVersion"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v41, (uint64_t)v40, v42, CFSTR("ComponentVersion"));

LABEL_9:
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v43, (uint64_t)CFSTR("Title"), v44);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v49, (uint64_t)v51, v52, CFSTR("Title"));
  }
  else
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v49, v50, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_productBuildVersion(v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v53, v59, (uint64_t)CFSTR("[%@] Tap-to-Radar: Internal IDS error detected"), v60, v58);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v62, (uint64_t)v61, v63, CFSTR("Title"));

  }
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v64, (uint64_t)CFSTR("Description"), v65);
  v66 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v66;
  if (v66)
    objc_msgSend_setObject_forKeyedSubscript_(v18, v67, v66, v68, CFSTR("Description"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v18, v67, (uint64_t)CFSTR("An internal IDS error was detected; please ensure that a sysdiagnose is attached."),
      v68,
      CFSTR("Description"));

  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v70, (uint64_t)CFSTR("Classification"), v71);
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73 && objc_msgSend__isValidClassification_(self, v72, v73, v74))
    objc_msgSend_setObject_forKeyedSubscript_(v18, v72, v73, v74, CFSTR("Classification"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v18, v72, (uint64_t)CFSTR("Serious Bug"), v74, CFSTR("Classification"));
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v75, (uint64_t)CFSTR("Reproducibility"), v76);
  v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v80 = CFSTR("I Didn't Try");
  if (v78 && objc_msgSend__isValidReproducibility_(self, v77, (uint64_t)v78, v79))
    v80 = v78;
  v113 = (void *)v73;
  objc_msgSend_setObject_forKeyedSubscript_(v18, v77, (uint64_t)v80, v79, CFSTR("Reproducibility"));
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v81, (uint64_t)CFSTR("Keywords"), v82);
  v83 = objc_claimAutoreleasedReturnValue();
  v86 = (void *)v83;
  if (v83)
    objc_msgSend_setObject_forKeyedSubscript_(v18, v84, v83, v85, CFSTR("Keywords"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v18, v84, (uint64_t)CFSTR("212336"), v85, CFSTR("Keywords"));

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v10 = v18;
  v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v91, (uint64_t)&v115, v92, v119, 16);
  if (v93)
  {
    v96 = v93;
    v97 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v96; ++i)
      {
        if (*(_QWORD *)v116 != v97)
          objc_enumerationMutation(v10);
        v99 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i);
        v100 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend_objectForKeyedSubscript_(v10, v94, v99, v95);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queryItemWithName_value_(v100, v102, v99, v103, v101);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v90, v105, (uint64_t)v104, v106);

      }
      v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v94, (uint64_t)&v115, v95, v119, 16);
    }
    while (v96);
  }

  v7 = v114;
  objc_msgSend_setQueryItems_(v114, v107, (uint64_t)v90, v108);
  objc_msgSend_URL(v114, v109, v110, v111);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v14;
}

- (BOOL)_isValidClassification:(id)a3
{
  double v3;

  return objc_msgSend_containsObject_(&unk_1E3C887D0, a2, (uint64_t)a3, v3);
}

- (BOOL)_isValidReproducibility:(id)a3
{
  double v3;

  return objc_msgSend_containsObject_(&unk_1E3C887E8, a2, (uint64_t)a3, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawContext, 0);
}

@end
