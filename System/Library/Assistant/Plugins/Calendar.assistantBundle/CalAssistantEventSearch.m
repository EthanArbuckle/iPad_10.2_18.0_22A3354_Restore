@implementation CalAssistantEventSearch

- (EKEventStore)eventStore
{
  uint64_t v2;
  EKEventStore *eventStore;
  EKEventStore *v5;
  EKEventStore *v6;

  eventStore = self->_eventStore;
  if (!eventStore)
  {
    objc_msgSend__ca_eventStoreWithError_(MEMORY[0x24BDC74E8], a2, 0, v2);
    v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventStore;
    self->_eventStore = v5;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

- (void)setEventStore:(id)a3
{
  EKEventStore *v5;
  EKEventStore *v6;

  v5 = (EKEventStore *)a3;
  if (self->_eventStore != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_eventStore, a3);
    v5 = v6;
  }

}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  os_log_t *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  os_log_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  _BOOL4 v75;
  os_log_t *v76;
  os_log_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  id AceEventFromEKEvent_0;
  const char *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  os_log_t v93;
  _BOOL4 v94;
  os_log_t *v95;
  os_log_t v96;
  _BOOL4 v97;
  id v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  NSObject *v146;
  char *v147;
  char *v148;
  NSObject *v149;
  void *v150;
  id v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *log;
  NSObject *loga;
  id v158;
  id v159;
  void (**v160)(id, void *);
  void *v161;
  __CFString *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  void *v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t v174[128];
  uint8_t buf[4];
  const char *v176;
  __int16 v177;
  uint64_t v178;
  __int16 v179;
  void *v180;
  __int16 v181;
  void *v182;
  __int16 v183;
  void *v184;
  __int16 v185;
  void *v186;
  __int16 v187;
  void *v188;
  __int16 v189;
  void *v190;
  __int16 v191;
  uint64_t v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  void *v196;
  uint64_t v197;

  v197 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  sub_22665D4E4();
  sub_22665D4E4();
  v5 = (void *)qword_25586B420;
  if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
    sub_226660BD0(v5);
  v6 = (os_log_t *)MEMORY[0x24BE08FF0];
  v7 = (void *)*MEMORY[0x24BE08FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
    sub_226660B44(v7);
  objc_msgSend__validate(self, v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_timeZoneId(self, v11, v12, v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = (uint64_t)CFTimeZoneCreateWithName(0, v15, 1u);
    else
      v16 = CalCopyTimeZone();
    v20 = (void *)v16;
    if (v16)
    {
      objc_msgSend_limit(self, v17, v18, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend_limit(self, v21, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_intValue(v25, v26, v27, v28);

      }
      else
      {
        v29 = 0;
      }

      v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend_eventStore(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__visibleCalendars(self, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v41;
      if (v41 && objc_msgSend_count(v41, v42, v43, v44))
      {
        v167 = v29;
        v169 = v45;
        sub_22665D4E4();
        v46 = (void *)qword_25586B420;
        if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
        {
          log = v46;
          v155 = (void *)objc_opt_class();
          v158 = v155;
          objc_msgSend_startDate(self, v102, v103, v104);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endDate(self, v105, v106, v107);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_title(self, v108, v109, v110);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_location(self, v111, v112, v113);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_notes(self, v114, v115, v116);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_participants(self, v117, v118, v119);
          *(_DWORD *)buf = 138414594;
          v176 = (const char *)v155;
          v177 = 2112;
          v178 = (uint64_t)v20;
          v179 = 2112;
          v180 = v165;
          v181 = 2112;
          v182 = v163;
          v183 = 2112;
          v184 = v161;
          v185 = 2112;
          v186 = v154;
          v187 = 2112;
          v188 = v153;
          v189 = 2112;
          v190 = v45;
          v191 = 2112;
          v192 = objc_claimAutoreleasedReturnValue();
          v120 = (void *)v192;
          v193 = 2112;
          v194 = (uint64_t)v37;
          _os_log_debug_impl(&dword_22665B000, log, OS_LOG_TYPE_DEBUG, "[%@] - Creating predicate for event search with timeZone %@, startDate %@, endDate %@, title %@, location %@, notes %@, visibleCalendars %@ participants %@ in store %@", buf, 0x66u);

        }
        v160 = v4;
        v162 = v15;
        v47 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
        {
          loga = v47;
          v121 = (void *)objc_opt_class();
          v159 = v121;
          objc_msgSend_startDate(self, v122, v123, v124);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endDate(self, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_title(self, v129, v130, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_location(self, v133, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_notes(self, v137, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_participants(self, v141, v142, v143);
          v144 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136317698;
          v176 = "-[CalAssistantEventSearch performWithCompletion:]";
          v177 = 2112;
          v178 = (uint64_t)v121;
          v179 = 2112;
          v180 = v20;
          v181 = 2112;
          v182 = v166;
          v183 = 2112;
          v184 = v128;
          v185 = 2112;
          v186 = v132;
          v187 = 2112;
          v188 = v136;
          v189 = 2112;
          v190 = v140;
          v191 = 2112;
          v192 = (uint64_t)v169;
          v193 = 2112;
          v194 = v144;
          v145 = (void *)v144;
          v195 = 2112;
          v196 = v37;
          _os_log_debug_impl(&dword_22665B000, loga, OS_LOG_TYPE_DEBUG, "%s [%@] - Creating predicate for event search with timeZone %@, startDate %@, endDate %@, title %@, location %@, notes %@, visibleCalendars %@ participants %@ in store %@", buf, 0x70u);

        }
        objc_msgSend_startDate(self, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_endDate(self, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_title(self, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_location(self, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_notes(self, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participants(self, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v167;
        v168 = v37;
        objc_msgSend_predicateForAssistantEventSearchWithTimeZone_startDate_endDate_title_location_notes_participants_calendars_limit_(v37, v72, (uint64_t)v20, (uint64_t)v51, v55, v59, v63, v67, v71, v169, v152);
        v73 = objc_claimAutoreleasedReturnValue();

        sub_22665D4E4();
        v74 = (void *)qword_25586B420;
        v164 = (void *)v73;
        if (v73)
        {
          v75 = os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG);
          v76 = (os_log_t *)MEMORY[0x24BE08FF0];
          v4 = v160;
          if (v75)
          {
            v146 = v74;
            v147 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v176 = v147;
            v177 = 2112;
            v178 = v73;
            v179 = 2112;
            v180 = v168;
            v148 = v147;
            _os_log_debug_impl(&dword_22665B000, v146, OS_LOG_TYPE_DEBUG, "[%@] - Searching for events matching predicate %@ in store %@", buf, 0x20u);

          }
          v77 = *v76;
          v80 = v168;
          if (os_log_type_enabled(*v76, OS_LOG_TYPE_DEBUG))
          {
            v149 = v77;
            v150 = (void *)objc_opt_class();
            *(_DWORD *)buf = 136315906;
            v176 = "-[CalAssistantEventSearch performWithCompletion:]";
            v177 = 2112;
            v178 = (uint64_t)v150;
            v179 = 2112;
            v180 = v164;
            v181 = 2112;
            v182 = v168;
            v151 = v150;
            _os_log_debug_impl(&dword_22665B000, v149, OS_LOG_TYPE_DEBUG, "%s [%@] - Searching for events matching predicate %@ in store %@", buf, 0x2Au);

            v80 = v168;
          }
          objc_msgSend_eventsMatchingPredicate_(v80, v78, (uint64_t)v164, v79);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          sub_22665D4E4();
          if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
            sub_226660AA8();
          if (os_log_type_enabled(*v76, OS_LOG_TYPE_DEBUG))
            sub_2266609FC();
          v172 = 0u;
          v173 = 0u;
          v170 = 0u;
          v171 = 0u;
          v82 = v81;
          v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v170, (uint64_t)v174, 16);
          if (v84)
          {
            v85 = v84;
            v86 = *(_QWORD *)v171;
            do
            {
              for (i = 0; i != v85; ++i)
              {
                if (*(_QWORD *)v171 != v86)
                  objc_enumerationMutation(v82);
                AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(*(void **)(*((_QWORD *)&v170 + 1) + 8 * i), v20);
                objc_msgSend_addObject_(v33, v89, (uint64_t)AceEventFromEKEvent_0, v90);

              }
              v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v91, (uint64_t)&v170, (uint64_t)v174, 16);
            }
            while (v85);
          }

          sub_22665D4E4();
          if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
            sub_226660964();
          v15 = v162;
          v37 = v168;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
            sub_2266608C0();

          v45 = v169;
        }
        else
        {
          v94 = os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_ERROR);
          v4 = v160;
          v15 = v162;
          v95 = (os_log_t *)MEMORY[0x24BE08FF0];
          if (v94)
            sub_226660838(v74);
          v96 = *v95;
          v97 = os_log_type_enabled(*v95, OS_LOG_TYPE_ERROR);
          v37 = v168;
          v45 = v169;
          if (v97)
            sub_2266607A4(v96);
        }

      }
      else
      {
        sub_22665D4E4();
        v92 = (void *)qword_25586B420;
        if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
          sub_22666072C(v92);
        v93 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
          sub_2266606A0(v93);
      }
      v98 = objc_alloc(MEMORY[0x24BE81170]);
      v14 = (void *)objc_msgSend_initWithResults_(v98, v99, (uint64_t)v33, v100);

    }
    else
    {
      v30 = objc_alloc(MEMORY[0x24BE811A8]);
      v14 = (void *)objc_msgSend_initWithReason_(v30, v31, (uint64_t)CFSTR("Invalid timezone"), v32);
    }

  }
  objc_msgSend_dictionary(v14, v11, v12, v13);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v101);

}

- (id)_visibleCalendars
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc(MEMORY[0x24BDC74B8]);
  objc_msgSend_eventStore(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithEventStore_visibilityChangedCallback_queue_(v4, v9, (uint64_t)v8, 0, 0);

  objc_msgSend_visibleCalendars(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v15, (uint64_t)v14, v16);

  return v3;
}

- (id)_validate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;

  objc_msgSend_startDate(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endDate(self, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v9;
  if ((v5 != 0) != (v9 != 0))
  {
    v13 = CFSTR("Start date and end date must be either both specified or omitted");
LABEL_7:
    v15 = objc_alloc(MEMORY[0x24BE811A8]);
    v14 = (void *)objc_msgSend_initWithReason_(v15, v16, (uint64_t)v13, v17);
    goto LABEL_8;
  }
  v14 = 0;
  if (v5 && v9)
  {
    if (objc_msgSend_compare_(v5, v10, v9, v11) != 1)
    {
      v14 = 0;
      goto LABEL_8;
    }
    v13 = CFSTR("End date cannot be earlier than start date");
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
