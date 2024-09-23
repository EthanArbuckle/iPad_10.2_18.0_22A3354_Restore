@implementation CADEventPredicate(EKPredicateExpanding)

- (void)expandWithObjectsPendingCommit:()EKPredicateExpanding deletedObjectIDs:andResultArray:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  _BOOL4 v28;
  EKEvent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  int v84;
  int v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id obj;
  id obja;
  id v92;
  id v93;
  os_log_t log;
  NSObject *loga;
  void *v96;
  os_log_t i;
  id v98;
  unsigned int v99;
  id v100;
  unsigned int v101;
  void *v102;
  unsigned int v103;
  id v104;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[4];
  id v119;
  __int128 *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[5];
  _BYTE v130[128];
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  id v134;
  __int16 v135;
  void *v136;
  _BYTE v137[128];
  uint8_t v138[128];
  __int128 v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v104 = a5;
  v9 = (void *)objc_opt_new();
  v96 = v8;
  if (objc_msgSend(v8, "count") || objc_msgSend(v7, "count"))
  {
    v88 = v7;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = &v139;
    v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__14;
    v142 = __Block_byref_object_dispose__14;
    v143 = 0;
    if (v8)
      objc_msgSend(v10, "unionSet:");
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke;
    v129[3] = &unk_1E47866E8;
    v129[4] = &v139;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v129);
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    obj = v7;
    log = (os_log_t)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
    if (log)
    {
      v92 = *(id *)v126;
      do
      {
        for (i = 0; i != log; i = (os_log_t)((char *)i + 1))
        {
          if (*(id *)v126 != v92)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "objectID");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v102);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v100 = v13;
            v14 = objc_msgSend(v100, "isIntegrationEvent");
            if ((objc_msgSend(v102, "isTemporary") & v14) == 1)
              ((void (**)(_QWORD, id))v12)[2](v12, v100);
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            objc_msgSend(v100, "detachedItems");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v122;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v122 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
                  objc_msgSend(v19, "objectID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v20)
                  {
                    objc_msgSend(v11, "addObject:", v20);
                    objc_msgSend(v9, "addObject:", v20);
                    if (v14 && objc_msgSend(v20, "isTemporary"))
                      ((void (**)(_QWORD, void *))v12)[2](v12, v19);
                  }
                  else
                  {
                    logHandle();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v134 = v100;
                      v135 = 2114;
                      v136 = v102;
                      _os_log_error_impl(&dword_1A2318000, v21, OS_LOG_TYPE_ERROR, "A detached item's objectID is nil for event %@ (%{public}@)", buf, 0x16u);
                    }

                  }
                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
              }
              while (v16);
            }

          }
        }
        log = (os_log_t)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
      }
      while (log);
    }

    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_5;
    v118[3] = &unk_1E4786710;
    v22 = v11;
    v119 = v22;
    v120 = &v139;
    objc_msgSend(v104, "indexesOfObjectsPassingTest:", v118);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "removeObjectsAtIndexes:", v23);

    _Block_object_dispose(&v139, 8);
    v7 = v88;
  }
  v84 = objc_msgSend(a1, "excludeDeclined");
  v103 = objc_msgSend(a1, "excludeProposed");
  v101 = objc_msgSend(a1, "excludeDeclinedUnlessProposed");
  v83 = objc_msgSend(a1, "excludeTimedEvents");
  v85 = objc_msgSend(a1, "excludeAllDayEvents");
  v99 = objc_msgSend(a1, "excludeSkippedReminders");
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v86 = v7;
  v89 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
  if (v89)
  {
    v87 = *(_QWORD *)v115;
    do
    {
      obja = 0;
      do
      {
        if (*(_QWORD *)v115 != v87)
          objc_enumerationMutation(v86);
        v24 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)obja);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "objectID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v96, "containsObject:", v25);

          if ((v26 & 1) == 0)
          {
            v98 = v24;
            objc_msgSend(v98, "objectID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27 == 0;

            if (v28)
            {
              logHandle();
              loga = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v139) = 138412290;
                *(_QWORD *)((char *)&v139 + 4) = v98;
                _os_log_error_impl(&dword_1A2318000, loga, OS_LOG_TYPE_ERROR, "An object pending commit's objectID is nil for event %@", (uint8_t *)&v139, 0xCu);
              }
            }
            else
            {
              v29 = [EKEvent alloc];
              objc_msgSend(v98, "persistentObject");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              loga = -[EKEvent initWithPersistentObject:](v29, "initWithPersistentObject:", v30);

              if (((-[NSObject isAllDay](loga, "isAllDay") ^ 1 | v85) != 1
                 || ((-[NSObject isAllDay](loga, "isAllDay") | v83) & 1) == 0)
                && (!v84 || -[NSObject participationStatus](loga, "participationStatus") != 3))
              {
                objc_msgSend(a1, "calendars");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v31)
                  goto LABEL_97;
                objc_msgSend(a1, "calendars");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "calendar");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "CADObjectID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v32, "containsObject:", v34);

                if (v35)
                {
LABEL_97:
                  objc_msgSend(a1, "eventUUID");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v36)
                    goto LABEL_98;
                  objc_msgSend(v98, "uniqueID");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "eventUUID");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v37, "isEqualToString:", v38);

                  if (v39)
                  {
LABEL_98:
                    -[NSObject objectID](loga, "objectID");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = objc_msgSend(v9, "containsObject:", v40);

                    if ((v41 & 1) == 0)
                    {
                      objc_msgSend(a1, "startDate");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v42)
                      {
                        objc_msgSend(a1, "endDate");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v44 = v43 != 0;

                      }
                      else
                      {
                        v44 = 0;
                      }

                      v45 = (void *)MEMORY[0x1E0D0C2B8];
                      -[NSObject startDate](loga, "startDate");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject endDateUnadjustedForLegacyClients](loga, "endDateUnadjustedForLegacyClients");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "rangeWithStartDate:endDate:", v46, v47);
                      v82 = (void *)objc_claimAutoreleasedReturnValue();

                      v48 = (void *)MEMORY[0x1E0D0C2B8];
                      objc_msgSend(a1, "startDate");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(a1, "endDate");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "rangeWithStartDate:endDate:", v49, v50);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v44)
                      {
                        v51 = objc_msgSend(v82, "intersectsRange:", v81);
                        if ((-[NSObject hasRecurrenceRules](loga, "hasRecurrenceRules") & v44) == 1)
                        {
                          v52 = (void *)objc_opt_new();
                          objc_msgSend(a1, "startDate");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "endDate");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NSObject effectiveTimeZone](loga, "effectiveTimeZone");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NSObject exceptionDates](loga, "exceptionDates");
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v79) = 1;
                          v80 = (void *)objc_msgSend(v52, "copyOccurrenceDatesWithEKEvent:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", loga, v53, v54, v55, v56, 0, v79);

                          goto LABEL_61;
                        }
                        if (!v51)
                        {
                          v80 = 0;
                          goto LABEL_62;
                        }
                      }
                      else
                      {
                        -[NSObject hasRecurrenceRules](loga, "hasRecurrenceRules");
                      }
                      v57 = (void *)MEMORY[0x1E0C99D20];
                      -[NSObject startDate](loga, "startDate");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "arrayWithObject:", v52);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:

LABEL_62:
                      objc_msgSend(MEMORY[0x1E0C99E20], "set");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v44)
                      {
                        v112 = 0u;
                        v113 = 0u;
                        v110 = 0u;
                        v111 = 0u;
                        -[NSObject detachedItems](loga, "detachedItems");
                        v93 = (id)objc_claimAutoreleasedReturnValue();
                        v59 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
                        if (v59)
                        {
                          v60 = *(_QWORD *)v111;
                          do
                          {
                            for (k = 0; k != v59; ++k)
                            {
                              if (*(_QWORD *)v111 != v60)
                                objc_enumerationMutation(v93);
                              v62 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
                              objc_msgSend(v62, "objectID");
                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                              v64 = objc_msgSend(v96, "containsObject:", v63);

                              if ((v64 & 1) == 0)
                              {
                                objc_msgSend(v62, "startDate");
                                v65 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(a1, "startDate");
                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(a1, "endDate");
                                v67 = (void *)objc_claimAutoreleasedReturnValue();
                                v68 = objc_msgSend(v65, "CalIsBetweenStartDate:endDate:", v66, v67);

                                if (v68)
                                  objc_msgSend((id)objc_opt_class(), "_addEventOccurrenceAndProposedTimeOccurrenceFor:withOccurrenceStartDate:toResults:excludeProposed:excludeDeclinedUnlessProposed:excludeSkippedReminders:", v62, v65, v104, v103, v101, v99);
                                objc_msgSend(v62, "originalStartDate");
                                v69 = objc_claimAutoreleasedReturnValue();
                                if (v69)
                                {
                                  if (-[NSObject isFloating](loga, "isFloating"))
                                  {
                                    -[NSObject effectiveTimeZone](loga, "effectiveTimeZone");
                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[NSObject dateInTimeZone:fromTimeZone:](v69, "dateInTimeZone:fromTimeZone:", v70, 0);
                                    v71 = objc_claimAutoreleasedReturnValue();

                                    v69 = v71;
                                  }
                                  objc_msgSend(v58, "addObject:", v69);
                                }
                                else
                                {
                                  logHandle();
                                  v69 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                                    -[CADEventPredicate(EKPredicateExpanding) expandWithObjectsPendingCommit:deletedObjectIDs:andResultArray:].cold.1(buf, &buf[1], v69);
                                }

                              }
                            }
                            v59 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v110, v131, 16);
                          }
                          while (v59);
                        }

                      }
                      v108 = 0u;
                      v109 = 0u;
                      v106 = 0u;
                      v107 = 0u;
                      v72 = v80;
                      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
                      if (v73)
                      {
                        v74 = *(_QWORD *)v107;
                        do
                        {
                          for (m = 0; m != v73; ++m)
                          {
                            if (*(_QWORD *)v107 != v74)
                              objc_enumerationMutation(v72);
                            v76 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * m);
                            if ((objc_msgSend(v58, "containsObject:", v76) & 1) == 0)
                              objc_msgSend((id)objc_opt_class(), "_addEventOccurrenceAndProposedTimeOccurrenceFor:withOccurrenceStartDate:toResults:excludeProposed:excludeDeclinedUnlessProposed:excludeSkippedReminders:", v98, v76, v104, v103, v101, v99);
                          }
                          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
                        }
                        while (v73);
                      }

                      -[NSObject objectID](loga, "objectID");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "addObject:", v77);

                    }
                  }
                }
              }
            }

          }
        }
        obja = (char *)obja + 1;
      }
      while (obja != (id)v89);
      v78 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v132, 16);
      v89 = v78;
    }
    while (v78);
  }

}

+ (void)_addEventOccurrenceAndProposedTimeOccurrenceFor:()EKPredicateExpanding withOccurrenceStartDate:toResults:excludeProposed:excludeDeclinedUnlessProposed:excludeSkippedReminders:
{
  id v13;
  id v14;
  void *v15;
  EKEvent *v16;
  EKEvent *v17;
  EKEvent *v18;
  id v19;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(v19, "persistentObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8 && objc_msgSend(v19, "isReminderIntegrationEvent"))
  {
    v16 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v15, v13);
    if (-[EKEvent reminderOccurrenceType](v16, "reminderOccurrenceType") != 1)
      objc_msgSend(v14, "addObject:", v16);
LABEL_11:

    goto LABEL_12;
  }
  if (!a7 || objc_msgSend(v19, "participationStatus") != 3)
  {
    v17 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v15, v13);
    objc_msgSend(v14, "addObject:", v17);

  }
  if ((a6 & 1) == 0)
  {
    objc_msgSend(v19, "proposedStartDate");
    v16 = (EKEvent *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v18 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v15, v16);
      objc_msgSend(v14, "addObject:", v18);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)expandWithObjectsPendingCommit:()EKPredicateExpanding deletedObjectIDs:andResultArray:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "originalStartDate should not be nil", buf, 2u);
}

@end
