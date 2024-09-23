@implementation IDSGFTMetricsCollector

- (IDSGFTMetricsCollector)init
{
  IDSGFTMetricsCollector *v2;
  IDSGFTMetricsCollector *v3;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *referencePointsByType;
  CFMutableDictionaryRef v6;
  NSMutableDictionary *annotatorsByEventType;
  IDSGFTMetricsAnonymizer *v8;
  IDSGFTMetricsAnonymizer *anonymizer;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  NSSet *activeParticipantURIs;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IDSGFTMetricsCollector;
  v2 = -[IDSGFTMetricsCollector init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_referencePointsByType)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      referencePointsByType = v3->_referencePointsByType;
      v3->_referencePointsByType = (NSMutableDictionary *)Mutable;

    }
    if (!v3->_annotatorsByEventType)
    {
      v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      annotatorsByEventType = v3->_annotatorsByEventType;
      v3->_annotatorsByEventType = (NSMutableDictionary *)v6;

    }
    v8 = objc_alloc_init(IDSGFTMetricsAnonymizer);
    anonymizer = v3->_anonymizer;
    v3->_anonymizer = v8;

    objc_msgSend_set(MEMORY[0x1E0C99E60], v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    activeParticipantURIs = v3->_activeParticipantURIs;
    v3->_activeParticipantURIs = (NSSet *)v13;

    *(_QWORD *)&v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)begin:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v9, (uint64_t)v7, v10, v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)begin:(id)a3 uniqueID:(id)a4 withClass:(Class)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  double v12;
  os_unfair_lock_s *p_lock;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  CFMutableDictionaryRef Mutable;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  IDSGFTMetricsAnonymizer *anonymizer;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  id v49;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v9, v10, v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v14, (uint64_t)v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend_setObject_forKeyedSubscript_(self->_referencePointsByType, v20, (uint64_t)Mutable, v21, v8);

  }
  objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v17, (uint64_t)v8, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v11, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v26 = [a5 alloc];
    anonymizer = self->_anonymizer;
    v51[0] = CFSTR("i");
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v28, self->_isInitiator, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = CFSTR("aps");
    v52[0] = v30;
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v35 = objc_msgSend_count(self->_activeParticipantURIs, v32, v33, v34);
    objc_msgSend_numberWithUnsignedInteger_(v31, v36, v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v38;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)v52, v40, v51, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_initWithFromType_fromUniqueID_anonymizer_templateDictionary_(v26, v42, (uint64_t)v8, v43, v11, anonymizer, v41);

    objc_msgSend_objectForKeyedSubscript_(self->_referencePointsByType, v44, (uint64_t)v8, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v46, v47, (uint64_t)v25, v48, v11);

  }
  os_unfair_lock_unlock(p_lock);
  v49 = v25;

  return v49;
}

- (void)annotate:(id)a3 block:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  id v20;

  v20 = a3;
  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_annotatorsByEventType, v8, (uint64_t)v20, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_setObject_forKeyedSubscript_(self->_annotatorsByEventType, v14, (uint64_t)v13, v15, v20);

  }
  objc_msgSend_objectForKeyedSubscript_(self->_annotatorsByEventType, v11, (uint64_t)v20, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v7);

  objc_msgSend_addObject_(v16, v18, (uint64_t)v17, v19);
  os_unfair_lock_unlock(p_lock);

}

- (void)annotate:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  double v18;

  v6 = a4;
  v7 = a3;
  v8 = ids_monotonic_time();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_19BA7A8D0;
  v16 = &unk_1E3C212C8;
  v17 = v6;
  v18 = v8;
  v9 = v6;
  v10 = _Block_copy(&v13);
  objc_msgSend_annotate_block_(self, v11, (uint64_t)v7, v12, v10, v13, v14, v15, v16);

}

- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  id v38;
  const char *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  const char *v57;
  double v58;
  void *v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  void *v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  void *v102;
  void *v103;
  const char *v104;
  double v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  const char *v109;
  double v110;
  const char *v111;
  void *v112;
  double v113;
  void *v114;
  const char *v115;
  double v116;
  void *v117;
  const char *v118;
  double v119;
  void *v120;
  const char *v121;
  double v122;
  void *v123;
  const char *v124;
  double v125;
  void *v126;
  const char *v127;
  double v128;
  void *v129;
  const char *v130;
  double v131;
  void *v132;
  const char *v133;
  double v134;
  void *v135;
  const char *v136;
  double v137;
  uint64_t v138;
  const char *v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t k;
  void *v144;
  void *v145;
  const char *v146;
  double v147;
  void *v148;
  const char *v149;
  double v150;
  const char *v151;
  double v152;
  os_unfair_lock_t lock;
  NSMutableDictionary *obj;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  _BOOL4 v160;
  uint64_t v161;
  id v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  id v171;
  IDSGFTMetricsCollector *v172;
  void *v173;
  void *v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint8_t v205[128];
  uint8_t buf[4];
  double v207;
  uint64_t v208;

  v160 = a4;
  v208 = *MEMORY[0x1E0C80C00];
  objc_msgSend_flushPendingNowKnownMKMs(self, a2, a4, a3);
  v172 = self;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_Metrics(IDSFoundationLog, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v207 = a3;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "GFTMetrics: collecting metrics with timeBase %f", buf, 0xCu);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12);
  v171 = (id)objc_claimAutoreleasedReturnValue();
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  obj = v172->_referencePointsByType;
  v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v196, v14, v205, 16);
  if (v157)
  {
    v156 = *(_QWORD *)v197;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v197 != v156)
          objc_enumerationMutation(obj);
        v158 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v17);
        objc_msgSend_objectForKeyedSubscript_(v172->_annotatorsByEventType, v15, v18, v16, lock);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v162 = (id)v18;
        objc_msgSend_objectForKeyedSubscript_(v172->_referencePointsByType, v26, v18, 0.0);
        v159 = (id)objc_claimAutoreleasedReturnValue();
        v173 = v25;
        v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v27, (uint64_t)&v192, v28, v204, 16);
        if (!v164)
        {
          v175 = 0;
          goto LABEL_48;
        }
        v175 = 0;
        v161 = *(_QWORD *)v193;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v193 != v161)
              objc_enumerationMutation(v159);
            v169 = v31;
            v32 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * v31);
            objc_msgSend_objectForKeyedSubscript_(v172->_referencePointsByType, v29, (uint64_t)v162, v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v33, v34, v32, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v166)
            {
              v190 = 0u;
              v191 = 0u;
              v188 = 0u;
              v189 = 0u;
              v38 = v166;
              v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v188, v40, v203, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v189;
                do
                {
                  for (i = 0; i != v42; ++i)
                  {
                    if (*(_QWORD *)v189 != v43)
                      objc_enumerationMutation(v38);
                    (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * i) + 16))();
                  }
                  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v45, (uint64_t)&v188, v46, v203, 16);
                }
                while (v42);
              }

            }
            v167 = v36;
            objc_msgSend_collectForTimeBase_anonymize_(v36, v37, v160, a3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v184 = 0u;
            v185 = 0u;
            v186 = 0u;
            v187 = 0u;
            v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v184, 0.0, v202, 16);
            if (v49)
            {
              v52 = v49;
              v53 = *(_QWORD *)v185;
              do
              {
                for (j = 0; j != v52; ++j)
                {
                  if (*(_QWORD *)v185 != v53)
                    objc_enumerationMutation(v47);
                  v55 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * j);
                  objc_msgSend_objectForKeyedSubscript_(v55, v50, (uint64_t)CFSTR("toID"), v51);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v55, v57, (uint64_t)CFSTR("fromID"), v58);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend_isEqual_(v56, v60, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v61) & 1) != 0
                    || objc_msgSend_isEqual_(v59, v62, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v63))
                  {
                    objc_msgSend_objectForKeyedSubscript_(v55, v62, (uint64_t)CFSTR("events"), v63);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_isEqual_(v56, v66, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v67)
                      && objc_msgSend_isEqual_(v59, v68, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v69))
                    {
                      v70 = v175;
                      v175 = v65;
                    }
                    else if (objc_msgSend_isEqual_(v59, v68, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v69))
                    {
                      objc_msgSend_objectForKeyedSubscript_(v174, v71, (uint64_t)v56, v72);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v73)
                      {
                        objc_msgSend_array(MEMORY[0x1E0C99DE8], v74, v75, v76);
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_(v174, v78, (uint64_t)v77, v79, v56);

                      }
                      objc_msgSend_objectForKeyedSubscript_(v174, v74, (uint64_t)v56, v76);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v70, v80, (uint64_t)v65, v81);
                      v25 = v173;
                    }
                    else
                    {
                      if (!objc_msgSend_isEqual_(v56, v71, (uint64_t)CFSTR("IDSGFTMetricsWildcard"), v72))
                        goto LABEL_42;
                      objc_msgSend_objectForKeyedSubscript_(v25, v82, (uint64_t)v59, v83);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v84)
                      {
                        objc_msgSend_array(MEMORY[0x1E0C99DE8], v85, v86, v87);
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_(v25, v89, (uint64_t)v88, v90, v59);

                      }
                      objc_msgSend_objectForKeyedSubscript_(v25, v85, (uint64_t)v59, v87);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v70, v91, (uint64_t)v65, v92);
                    }

                  }
                  else
                  {
                    v65 = (void *)objc_msgSend_mutableCopy(v55, v62, v64, v63);
                    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v93, v172->_isInitiator, v94);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setObject_forKeyedSubscript_(v65, v96, (uint64_t)v95, v97, CFSTR("i"));

                    objc_msgSend_addObject_(v171, v98, (uint64_t)v65, v99);
                  }
LABEL_42:

                }
                v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v184, v51, v202, 16);
              }
              while (v52);
            }

            v31 = v169 + 1;
          }
          while (v169 + 1 != v164);
          v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v29, (uint64_t)&v192, v30, v204, 16);
        }
        while (v164);
LABEL_48:

        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v163 = v171;
        v102 = v174;
        v103 = v175;
        v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v100, (uint64_t)&v180, v101, v201, 16);
        if (v168)
        {
          v165 = *(_QWORD *)v181;
          do
          {
            v106 = 0;
            do
            {
              if (*(_QWORD *)v181 != v165)
                objc_enumerationMutation(v163);
              v107 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v106);
              objc_msgSend_objectForKeyedSubscript_(v107, v104, (uint64_t)CFSTR("toID"), v105);
              v108 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v107, v109, (uint64_t)CFSTR("fromID"), v110);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              if (v103)
              {
                objc_msgSend_objectForKeyedSubscript_(v107, v111, (uint64_t)CFSTR("events"), v113);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v114, v115, (uint64_t)v103, v116);

              }
              objc_msgSend_objectForKeyedSubscript_(v25, v111, (uint64_t)v112, v113);
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              if (v117)
              {
                objc_msgSend_objectForKeyedSubscript_(v107, v118, (uint64_t)CFSTR("events"), v119);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v25, v121, (uint64_t)v112, v122);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v120, v124, (uint64_t)v123, v125);

              }
              objc_msgSend_objectForKeyedSubscript_(v102, v118, v108, v119);
              v126 = (void *)objc_claimAutoreleasedReturnValue();

              if (v126)
              {
                objc_msgSend_objectForKeyedSubscript_(v107, v127, (uint64_t)CFSTR("events"), v128);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v102, v130, v108, v131);
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v129, v133, (uint64_t)v132, v134);

              }
              v170 = (void *)v108;
              v178 = 0u;
              v179 = 0u;
              v176 = 0u;
              v177 = 0u;
              objc_msgSend_objectForKeyedSubscript_(v107, v127, (uint64_t)CFSTR("events"), 0.0);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v136, (uint64_t)&v176, v137, v200, 16);
              if (v138)
              {
                v141 = v138;
                v142 = *(_QWORD *)v177;
                do
                {
                  for (k = 0; k != v141; ++k)
                  {
                    if (*(_QWORD *)v177 != v142)
                      objc_enumerationMutation(v135);
                    v144 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * k);
                    objc_msgSend_objectForKeyedSubscript_(v144, v139, (uint64_t)CFSTR("interval"), v140);
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v144, v146, (uint64_t)CFSTR("name"), v147);
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setObject_forKeyedSubscript_(v107, v149, (uint64_t)v145, v150, v148);

                  }
                  v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v139, (uint64_t)&v176, v140, v200, 16);
                }
                while (v141);
              }

              objc_msgSend_removeObjectForKey_(v107, v151, (uint64_t)CFSTR("events"), v152);
              ++v106;
              v25 = v173;
              v102 = v174;
              v103 = v175;
            }
            while (v106 != v168);
            v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(v163, v104, (uint64_t)&v180, v105, v201, 16);
          }
          while (v168);
        }

        v17 = v158 + 1;
      }
      while (v158 + 1 != v157);
      v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v196, v16, v205, 16);
    }
    while (v157);
  }

  os_unfair_lock_unlock(lock);
  return v171;
}

- (void)flushPendingNowKnownMKMs
{
  const char *v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  IDSGFTMetricsMembershipChange *lastMembershipChange;
  os_unfair_lock_t lock;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  lock = &self->_unknownMKMFlushLock;
  os_unfair_lock_lock(&self->_unknownMKMFlushLock);
  v6 = (void *)objc_msgSend_copy(self->_unknownMKMReceiptTimes, v3, v4, v5);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v43, v9, v51, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v44;
    v14 = 138412546;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v7);
        v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_pushTokensByMKIs, v11, v16, *(double *)&v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_Metrics(IDSFoundationLog, v18, v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v16;
          v49 = 2112;
          v50 = v17;
          _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "GFTMetrics: mkm %@ -> token %@", buf, 0x16u);
        }

        if (v17)
        {
          if ((objc_msgSend_isNull(v17, v22, v23, v24) & 1) == 0)
          {
            objc_msgSend_removeObjectForKey_(self->_unknownMKMReceiptTimes, v25, v16, v26);
            objc_msgSend_objectForKeyedSubscript_(v7, v27, v16, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v29, v30, v31, v32);
            v34 = v33;

            objc_msgSend_joinCycleForToken_(self, v35, (uint64_t)v17, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_receivedKMOverPushViaCacheAtTime_(v37, v38, v39, v34);

            lastMembershipChange = self->_lastMembershipChange;
            if (lastMembershipChange)
              objc_msgSend_receivedKMOverPushViaCacheForToken_atTime_(lastMembershipChange, v40, (uint64_t)v17, v34);
          }
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v43, *(double *)&v14, v51, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(lock);
}

- (id)joinCycleForToken:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v6, (uint64_t)CFSTR("ra"), v7, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)error:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("err.%@"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_begin_uniqueID_(self, v6, (uint64_t)v5, v7, &stru_1E3C2E4E8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)uniqueError:(id)a3
{
  double v3;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("err.%@"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v7;
  objc_msgSend_numberWithInt_(v6, v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_begin_uniqueID_(self, v11, (uint64_t)v5, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)localDidJoin
{
  double v2;
  const char *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;

  objc_msgSend_annotate_withEvent_(self, a2, (uint64_t)CFSTR("ra"), v2, CFSTR("lj"));
  objc_msgSend_annotate_withEvent_(self, v4, (uint64_t)CFSTR("kvd"), v5, CFSTR("lj"));
  objc_msgSend_localJoin(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_join(v9, v10, v11, v12);
  return v9;
}

- (id)keyValueDelivery
{
  double v2;

  return (id)objc_msgSend_begin_uniqueID_(self, a2, (uint64_t)CFSTR("kvd"), v2, &unk_1E3C86AD8);
}

- (void)remoteDidJoin:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;

  objc_msgSend_joinCycleForToken_(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteDidJoin(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, (uint64_t)CFSTR("kvd"), v10, CFSTR("rj"));
  objc_msgSend_annotate_withEvent_(self, v11, (uint64_t)CFSTR("lj"), v12, CFSTR("rj"));
}

- (void)remoteDidBecomeActive:(id)a3
{
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  objc_msgSend_joinCycleForToken_(self, a2, (uint64_t)a3, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteDidBecomeActive(v12, v5, v6, v7);
  objc_msgSend_annotate_withEvent_(self, v8, (uint64_t)CFSTR("kvd"), v9, CFSTR("ra"));
  objc_msgSend_annotate_withEvent_(self, v10, (uint64_t)CFSTR("lj"), v11, CFSTR("ra"));

}

- (IDSGFTMetricsLocalJoin)localJoin
{
  uint64_t v3;
  const char *v4;
  double v5;

  v3 = objc_opt_class();
  return (IDSGFTMetricsLocalJoin *)objc_msgSend_begin_uniqueID_withClass_(self, v4, (uint64_t)CFSTR("lj"), v5, &unk_1E3C86AD8, v3);
}

- (void)willSendJoin
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willSendJoin(v7, v4, v5, v6);

}

- (void)didSendJoin
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didSendJoin(v7, v4, v5, v6);

}

- (void)connectQRServer
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectQRServer(v7, v4, v5, v6);

}

- (void)participantIdChanged
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantIdChanged(v7, v4, v5, v6);

}

- (void)participantIdUnknown
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantIdUnknown(v7, v4, v5, v6);

}

- (void)serverShortMKICacheMiss
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverShortMKICacheMiss(v7, v4, v5, v6);

}

- (void)selectedLocalInterface:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedLocalInterface_(v10, v8, (uint64_t)v4, v9);

}

- (void)sendAllocationRequest
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendAllocationRequest(v7, v4, v5, v6);

}

- (void)useGecko
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_useGecko(v7, v4, v5, v6);

}

- (void)globalLinkStart
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_globalLinkStart(v7, v4, v5, v6);

}

- (void)willSendAllocbindRequestThroughInterface:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willSendAllocbindRequestThroughInterface_(v10, v8, (uint64_t)v4, v9);

}

- (void)stunAllocbindRequest
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stunAllocbindRequest(v7, v4, v5, v6);

}

- (void)stunAllocbindResponse
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stunAllocbindResponse(v7, v4, v5, v6);

}

- (void)tcpAllocbindRequest
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tcpAllocbindRequest(v7, v4, v5, v6);

}

- (void)tcpAllocbindResponse
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tcpAllocbindResponse(v7, v4, v5, v6);

}

- (void)quicAllocbindRequest
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quicAllocbindRequest(v7, v4, v5, v6);

}

- (void)quicAllocbindResponse
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quicAllocbindResponse(v7, v4, v5, v6);

}

- (void)allocbindResponseFromInterface:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allocbindResponseFromInterface_(v10, v8, (uint64_t)v4, v9);

}

- (void)allocbindResponseForProtocolStack:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allocbindResponseForProtocolStack_(v10, v8, (uint64_t)v4, v9);

}

- (void)clientChannelConnected
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientChannelConnected(v7, v4, v5, v6);

}

- (void)didConnectUnderlyingRelayLink
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didConnectUnderlyingRelayLink(v7, v4, v5, v6);

}

- (void)didConnectUnderlyingE2ELink
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didConnectUnderlyingE2ELink(v7, v4, v5, v6);

}

- (void)linkConnectedUsingQUIC
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedUsingQUIC(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, (uint64_t)CFSTR("ra"), v10, CFSTR("cl-quic"));
}

- (void)linkConnectedUsingHTTP2
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedUsingHTTP2(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, (uint64_t)CFSTR("ra"), v10, CFSTR("cl-h2"));
}

- (void)linkConnectedUsingTCPSTUN
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedUsingTCPSTUN(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, (uint64_t)CFSTR("ra"), v10, CFSTR("cl-tcp"));
}

- (void)linkConnectedUsingFakeTLS
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;

  objc_msgSend_localJoin(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedUsingFakeTLS(v5, v6, v7, v8);

  objc_msgSend_annotate_withEvent_(self, v9, (uint64_t)CFSTR("ra"), v10, CFSTR("cl-tls"));
}

- (void)linkConnectedWithH2FallbackEnabled:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  const char *v5;
  double v6;
  id v7;

  v4 = a3;
  objc_msgSend_localJoin(self, a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_linkConnectedWithH2FallbackEnabled_(v7, v5, v4, v6);

}

- (void)firstIncomingPacketTime:(double)a3 forMKI:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v6 = a4;
  objc_msgSend_localJoin(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstIncomingPacketTime_forMKI_(v10, v11, (uint64_t)v6, a3);

  IDSGetUUIDDataFromNSUUID(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_getOrCreateMKICycleFor_(self, v15, (uint64_t)v14, v16);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_receivedFirstPacketTime_(v19, v17, v18, a3);
}

- (void)firstOutgoingPacketTime:(double)a3 forMKI:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  id v11;

  v6 = a4;
  objc_msgSend_localJoin(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstOutgoingPacketTime_forMKI_(v11, v10, (uint64_t)v6, a3);

}

- (void)avcReceiveMKMTime:(double)a3 forMKI:(id)a4 isGeneratedLocally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  id v13;

  v5 = a5;
  v8 = a4;
  objc_msgSend_localJoin(self, v9, v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avcReceiveMKMTime_forMKI_isGeneratedLocally_(v13, v12, (uint64_t)v8, a3, v5);

}

- (void)didCreateMKM:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_localJoin(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didCreateMKM_(v10, v8, (uint64_t)v4, v9);

}

- (void)sendMKMToAVC:(id)a3 isGeneratedLocally:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend_localJoin(self, v7, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMKMToAVC_isGeneratedLocally_(v12, v10, (uint64_t)v6, v11, v4);

}

- (void)receivedKMOverPushFromToken:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedKMOverPush(v6, v7, v8, v9);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend_receivedKMOverPushFromToken_(v11, v12, (uint64_t)v14, v13);

}

- (void)receivedKMOverPushViaCacheForToken:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedKMOverPushViaCache(v6, v7, v8, v9);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend_receivedKMOverPushViaCacheForToken_(v11, v12, (uint64_t)v14, v13);

}

- (void)receivedUnknownKMOverPushViaCache:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *unknownMKMReceiptTimes;
  void *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (!self->_unknownMKMReceiptTimes)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    unknownMKMReceiptTimes = self->_unknownMKMReceiptTimes;
    self->_unknownMKMReceiptTimes = Mutable;

  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = ids_monotonic_time();
  objc_msgSend_numberWithDouble_(v8, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_unknownMKMReceiptTimes, v13, (uint64_t)v12, v14, v5);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend_flushPendingNowKnownMKMs(self, v15, v16, v17);
}

- (void)mapMKI:(id)a3 toPushToken:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  NSMutableDictionary *pushTokensByMKIs;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  id v15;

  v15 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  pushTokensByMKIs = self->_pushTokensByMKIs;
  if (!pushTokensByMKIs)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v11 = self->_pushTokensByMKIs;
    self->_pushTokensByMKIs = Mutable;

    pushTokensByMKIs = self->_pushTokensByMKIs;
  }
  objc_msgSend_setObject_forKeyedSubscript_(pushTokensByMKIs, v7, (uint64_t)v6, v8, v15);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend_flushPendingNowKnownMKMs(self, v12, v13, v14);

}

- (void)receivedKMOverQRFromToken:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedKMOverQR(v6, v7, v8, v9);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend_receivedKMOverQRFromToken_(v11, v12, (uint64_t)v14, v13);

}

- (void)receivedKMOverQUICFromToken:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedKMOverQUIC(v6, v7, v8, v9);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend_receivedKMOverQUICFromToken_(v11, v12, (uint64_t)v14, v13);

}

- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_joinCycleForToken_(self, v4, (uint64_t)v14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedUnverifiedKMOverQUIC(v6, v7, v8, v9);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend_receivedUnverifiedKMOverQUICFromToken_(v11, v12, (uint64_t)v14, v13);

}

- (void)sendRatchetedKMtoAVCForToken:(id)a3
{
  os_unfair_lock_s *p_lock;
  IDSGFTMetricsMembershipChange *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_lastMembershipChange;
  os_unfair_lock_unlock(p_lock);
  if (v5)
    objc_msgSend_sendRatchetedKMtoAVCForToken_(v5, v6, (uint64_t)v8, v7);

}

- (void)membershipChange
{
  double v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  IDSGFTMetricsMembershipChange *v10;
  IDSGFTMetricsMembershipChange *lastMembershipChange;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v5;
  objc_msgSend_numberWithInt_(v4, a2, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v8, (uint64_t)CFSTR("mc"), v9, v6, v7);
  v10 = (IDSGFTMetricsMembershipChange *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  lastMembershipChange = self->_lastMembershipChange;
  self->_lastMembershipChange = v10;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)request:(id)a3
{
  double v3;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("req-%@"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v7;
  objc_msgSend_numberWithInt_(v6, v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v12, (uint64_t)v5, v13, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)createLinkCycle
{
  double v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (self->_nextUniqueID + 1);
  self->_nextUniqueID = v5;
  objc_msgSend_numberWithInt_(v4, a2, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v8, (uint64_t)CFSTR("l"), v9, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getOrCreateMKICycleFor:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_begin_uniqueID_withClass_(self, v6, (uint64_t)CFSTR("mki"), v7, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didMitigateCollision:(BOOL)a3
{
  double v3;
  _BOOL4 v4;
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v4 = a3;
  objc_msgSend_error_(self, a2, (uint64_t)CFSTR("nwLink"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v4)
    objc_msgSend_event_(v5, v6, (uint64_t)CFSTR("collisionMitigationSucceeded"), v7);
  else
    objc_msgSend_event_(v5, v6, (uint64_t)CFSTR("collisionMitigationFailed"), v7);

}

- (void)didFailConnectionOfType:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend_uniqueError_(self, v5, (uint64_t)CFSTR("nwLinkConnectionFailure"), v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(v9, v7, (uint64_t)v4, v8);

}

- (void)transactionIDMismatchDetected
{
  double v2;
  const char *v3;
  double v4;
  id v5;

  objc_msgSend_error_(self, a2, (uint64_t)CFSTR("nwLink"), v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(v5, v3, (uint64_t)CFSTR("transactionIDMismatch"), v4);

}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  self->_conversationID = (NSString *)a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (NSSet)activeParticipantURIs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setActiveParticipantURIs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeParticipantURIs, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
  objc_storeStrong((id *)&self->_annotatorsByEventType, 0);
  objc_storeStrong((id *)&self->_lastMembershipChange, 0);
  objc_storeStrong((id *)&self->_unknownMKMReceiptTimes, 0);
  objc_storeStrong((id *)&self->_pushTokensByMKIs, 0);
  objc_storeStrong((id *)&self->_referencePointsByType, 0);
}

@end
