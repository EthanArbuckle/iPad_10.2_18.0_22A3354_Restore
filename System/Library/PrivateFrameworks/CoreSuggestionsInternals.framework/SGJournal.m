@implementation SGJournal

- (SGJournal)init
{
  SGJournal *v2;
  uint64_t v3;
  NSMutableArray *calendarObservers;
  uint64_t v5;
  NSMutableArray *contactsObservers;
  uint64_t v7;
  NSMutableArray *remindersObservers;
  uint64_t v9;
  NSMutableArray *queuedOperations;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SGJournal;
  v2 = -[SGJournal init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    calendarObservers = v2->_calendarObservers;
    v2->_calendarObservers = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    contactsObservers = v2->_contactsObservers;
    v2->_contactsObservers = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    remindersObservers = v2->_remindersObservers;
    v2->_remindersObservers = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    queuedOperations = v2->_queuedOperations;
    v2->_queuedOperations = (NSMutableArray *)v9;

    v2->_observersFrozen = 0;
  }
  return v2;
}

- (void)_callCalendarObservers:(id)a3 contactsObservers:(id)a4 remindersObservers:(id)a5 withEntry:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  int v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  int v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t k;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  void *v100;
  NSObject *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  id obj;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint8_t v134[128];
  uint8_t buf[4];
  uint64_t v136;
  __int16 v137;
  void *v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v12;
  v104 = v10;
  v105 = v11;
  if (v13)
  {

LABEL_4:
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
    if (v15)
    {
      v16 = v15;
      v102 = v9;
      v17 = MEMORY[0x1E0C809B0];
      v108 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v128 != v108)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1C3BD4F6C]();
          v125[0] = v17;
          v125[1] = 3221225472;
          v125[2] = __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke;
          v125[3] = &unk_1E7DB17E0;
          v21 = v12;
          v126 = v21;
          v22 = (void (**)(_QWORD))MEMORY[0x1C3BD5158](v125);
          switch(objc_msgSend(v21, "operation"))
          {
            case 0:
              sgLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v24 = v23;
                v25 = "SGJournal-addEntry: Not set";
                v26 = 2;
                goto LABEL_29;
              }
              break;
            case 1:
              sgLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "duplicateKey");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v29;
                _os_log_impl(&dword_1C3607000, v27, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Add event %{private}@", buf, 0xCu);

                v12 = v106;
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addEvent:", v23);
              break;
            case 2:
              sgLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "eventBatch");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "count");
                v22[2](v22);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218243;
                v136 = v32;
                v12 = v106;
                v137 = 2113;
                v138 = v33;
                _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Add event batch (count=%tu) %{private}@", buf, 0x16u);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "eventBatch");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addEvents:", v23);
              break;
            case 3:
              sgLogHandle();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "duplicateKey");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v46;
                _os_log_impl(&dword_1C3607000, v44, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Cancel event %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cancelEvent:", v23);
              break;
            case 4:
              sgLogHandle();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "eventBatch");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "count");
                v22[2](v22);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218243;
                v136 = v49;
                v17 = MEMORY[0x1E0C809B0];
                v137 = 2113;
                v138 = v50;
                _os_log_impl(&dword_1C3607000, v47, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Cancel event batch (count=%tu) %{private}@", buf, 0x16u);

                v12 = v106;
              }

              objc_msgSend(v21, "eventBatch");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cancelEvents:", v23);
              break;
            case 5:
              sgLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "duplicateKey");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v36;
                _os_log_impl(&dword_1C3607000, v34, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Confirm event from this device %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "confirmEventFromThisDevice:", v23);
              break;
            case 6:
              sgLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "duplicateKey");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v39;
                _os_log_impl(&dword_1C3607000, v37, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Confirm event from other device %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "confirmEventFromOtherDevice:", v23);
              break;
            case 7:
              sgLogHandle();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "duplicateKey");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v42;
                _os_log_impl(&dword_1C3607000, v40, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Reject event from this device %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "rejectEventFromThisDevice:", v23);
              break;
            case 8:
              sgLogHandle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "duplicateKey");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v53;
                _os_log_impl(&dword_1C3607000, v51, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Reject event from other device %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "rejectEventFromOtherDevice:", v23);
              break;
            case 10:
              sgLogHandle();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v21, "event");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "duplicateKey");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v136 = (uint64_t)v56;
                _os_log_impl(&dword_1C3607000, v54, OS_LOG_TYPE_DEFAULT, "SGJournal-addEntry: Event parent deletion %{private}@", buf, 0xCu);

                v17 = MEMORY[0x1E0C809B0];
              }

              objc_msgSend(v21, "event");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "orphanEvent:", v23);
              break;
            default:
              sgLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v43 = objc_msgSend(v21, "operation");
                *(_DWORD *)buf = 67109120;
                LODWORD(v136) = v43;
                v24 = v23;
                v25 = "SGJournal-addEntry event non-nil, but unknown operation %u";
                v26 = 8;
LABEL_29:
                _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
              }
              break;
          }

          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      }
      while (v16);
      v9 = v102;
    }
    v10 = v104;
    v11 = v105;
    goto LABEL_46;
  }
  objc_msgSend(v12, "eventBatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_4;
  objc_msgSend(v12, "contact");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = v10;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    if (v58)
    {
      v59 = v58;
      v103 = v9;
      v60 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v122 != v60)
            objc_enumerationMutation(obj);
          v62 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
          v63 = (void *)MEMORY[0x1C3BD4F6C]();
          v64 = objc_msgSend(v12, "operation");
          switch(v64)
          {
            case 13:
              sgLogHandle();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v68, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject contact", buf, 2u);
              }

              objc_msgSend(v12, "contact");
              v66 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "rejectContact:", v66);
              break;
            case 12:
              sgLogHandle();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v67, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm contact", buf, 2u);
              }

              objc_msgSend(v12, "contact");
              v66 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "confirmContact:", v66);
              break;
            case 11:
              sgLogHandle();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v65, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Add contact", buf, 2u);
              }

              objc_msgSend(v12, "contact");
              v66 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "addContact:", v66);
              break;
            default:
              sgLogHandle();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                v69 = objc_msgSend(v12, "operation");
                *(_DWORD *)buf = 67109120;
                LODWORD(v136) = v69;
                _os_log_error_impl(&dword_1C3607000, v66, OS_LOG_TYPE_ERROR, "SGJournal-addEntry contact non-nil, but unknown operation %u", buf, 8u);
              }
              break;
          }

          objc_autoreleasePoolPop(v63);
        }
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      }
      while (v59);
LABEL_103:
      v9 = v103;
      v10 = v104;
LABEL_104:
      v11 = v105;
      v12 = v106;
    }
  }
  else
  {
    objc_msgSend(v12, "reminder");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v70)
    {
      if (objc_msgSend(v12, "operation") == 9)
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        obj = v9;
        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
        if (!v86)
          goto LABEL_46;
        v87 = v86;
        v88 = v10;
        v89 = v9;
        v90 = *(_QWORD *)v114;
        do
        {
          for (k = 0; k != v87; ++k)
          {
            if (*(_QWORD *)v114 != v90)
              objc_enumerationMutation(obj);
            v92 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
            v93 = (void *)MEMORY[0x1C3BD4F6C]();
            sgLogHandle();
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v94, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Suggested event calendar deleted", buf, 2u);
            }

            objc_msgSend(v92, "calendarDeleted");
            objc_autoreleasePoolPop(v93);
          }
          v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
        }
        while (v87);
      }
      else
      {
        if (objc_msgSend(v12, "operation") != 14)
          goto LABEL_47;
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        obj = v10;
        v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
        if (!v95)
          goto LABEL_46;
        v96 = v95;
        v88 = v10;
        v89 = v9;
        v97 = *(_QWORD *)v110;
        do
        {
          for (m = 0; m != v96; ++m)
          {
            if (*(_QWORD *)v110 != v97)
              objc_enumerationMutation(obj);
            v99 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * m);
            v100 = (void *)MEMORY[0x1C3BD4F6C]();
            sgLogHandle();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v101, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Remove all stored pseudo-contacts", buf, 2u);
            }

            objc_msgSend(v99, "removeAllStoredPseudoContacts");
            objc_autoreleasePoolPop(v100);
          }
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
        }
        while (v96);
      }
      v9 = v89;
      v10 = v88;
      goto LABEL_104;
    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v11;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
    if (v71)
    {
      v72 = v71;
      v103 = v9;
      v73 = *(_QWORD *)v118;
      do
      {
        for (n = 0; n != v72; ++n)
        {
          if (*(_QWORD *)v118 != v73)
            objc_enumerationMutation(obj);
          v75 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * n);
          v76 = (void *)MEMORY[0x1C3BD4F6C]();
          switch(objc_msgSend(v106, "operation"))
          {
            case 15:
              sgRemindersLogHandle();
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v77, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Add reminder", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "addReminder:", v78);
              break;
            case 16:
              sgRemindersLogHandle();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v83, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm Reminder from this device", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "confirmReminderFromThisDevice:", v78);
              break;
            case 17:
              sgRemindersLogHandle();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v79, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject Reminder from this device", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "rejectReminderFromThisDevice:", v78);
              break;
            case 18:
              sgRemindersLogHandle();
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v80, OS_LOG_TYPE_DEBUG, "SGJournal-reminderAlarmTriggered: Reminder alarm triggered from this device", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "reminderAlarmTriggeredFromThisDevice:", v78);
              break;
            case 19:
              sgRemindersLogHandle();
              v81 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Confirm reminder from other device", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "confirmReminderFromOtherDevice:", v78);
              break;
            case 20:
              sgRemindersLogHandle();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v84, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reject reminder from other device", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "rejectReminderFromOtherDevice:", v78);
              break;
            case 21:
              sgRemindersLogHandle();
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v85, OS_LOG_TYPE_DEBUG, "SGJournal-addEntry: Reminder parent deletion", buf, 2u);
              }

              objc_msgSend(v106, "reminder");
              v78 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "orphanReminder:", v78);
              break;
            default:
              sgRemindersLogHandle();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                v82 = objc_msgSend(v106, "operation");
                *(_DWORD *)buf = 67109120;
                LODWORD(v136) = v82;
                _os_log_error_impl(&dword_1C3607000, v78, OS_LOG_TYPE_ERROR, "SGJournal-addEntry reminder non-nil, but unknown operation %u", buf, 8u);
              }
              break;
          }

          objc_autoreleasePoolPop(v76);
        }
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
      }
      while (v72);
      goto LABEL_103;
    }
  }
LABEL_46:

LABEL_47:
}

- (void)addEntry:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

    v5 = 0;
  }
  if (!self->_observersFrozen)
  {
    -[NSMutableArray addObject:](self->_queuedOperations, "addObject:", v5);
    v5 = v7;
  }
  -[SGJournal _callCalendarObservers:contactsObservers:remindersObservers:withEntry:](self, "_callCalendarObservers:contactsObservers:remindersObservers:withEntry:", self->_calendarObservers, self->_contactsObservers, self->_remindersObservers, v5);

}

- (unint64_t)_eventBatchOperationSupportedForEntries:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "operation");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      v19 = v3;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1C3BD4F6C]();
          if (objc_msgSend(v12, "operation") != v6)
          {
            objc_autoreleasePoolPop(v13);
LABEL_16:

            v4 = 0;
            v3 = v19;
            goto LABEL_17;
          }
          objc_msgSend(v12, "event");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "tags");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "containsObject:", v16);

          objc_autoreleasePoolPop(v13);
          if ((v17 & 1) != 0)
            goto LABEL_16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v3 = v19;
        if (v9)
          continue;
        break;
      }
    }

    if (v6 == 1)
      v4 = 2;
    else
      v4 = 4 * (v6 == 3);
  }
  else
  {
    v4 = 0;
  }
LABEL_17:

  return v4;
}

- (void)addEntries:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  SGJournalEntry *v7;
  void *v8;
  SGJournalEntry *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SGJournal _eventBatchOperationSupportedForEntries:](self, "_eventBatchOperationSupportedForEntries:", v4);
  if (v5)
  {
    v6 = v5;
    v7 = [SGJournalEntry alloc];
    sgMap();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SGJournalEntry initWithOperation:eventBatch:](v7, "initWithOperation:eventBatch:", v6, v8);

    -[SGJournal addEntry:](self, "addEntry:", v9);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (SGJournalEntry *)v4;
    v10 = -[SGJournalEntry countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[SGJournal addEntry:](self, "addEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = -[SGJournalEntry countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }

}

- (void)addCalendarObserver:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  if (self->_observersFrozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_observersFrozen"));

  }
  -[NSMutableArray addObject:](self->_calendarObservers, "addObject:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)-[NSMutableArray copy](self->_queuedOperations, "copy");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        v21 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGJournal _callCalendarObservers:contactsObservers:remindersObservers:withEntry:](self, "_callCalendarObservers:contactsObservers:remindersObservers:withEntry:", v13, v9, v9, v11);

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

}

- (void)addContactsObserver:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  if (self->_observersFrozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_observersFrozen"));

  }
  -[NSMutableArray addObject:](self->_contactsObservers, "addObject:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)-[NSMutableArray copy](self->_queuedOperations, "copy");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        v21 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGJournal _callCalendarObservers:contactsObservers:remindersObservers:withEntry:](self, "_callCalendarObservers:contactsObservers:remindersObservers:withEntry:", v9, v13, v9, v11);

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

}

- (void)addRemindersObserver:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  if (self->_observersFrozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_observersFrozen"));

  }
  -[NSMutableArray addObject:](self->_remindersObservers, "addObject:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)-[NSMutableArray copy](self->_queuedOperations, "copy");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        v21 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGJournal _callCalendarObservers:contactsObservers:remindersObservers:withEntry:](self, "_callCalendarObservers:contactsObservers:remindersObservers:withEntry:", v9, v9, v13, v11);

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

}

- (void)freezeObservers
{
  self->_observersFrozen = 1;
  -[NSMutableArray removeAllObjects](self->_queuedOperations, "removeAllObjects");
}

- (void)thawObserversForTesting
{
  void *v4;

  if (!self->_observersFrozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGJournal.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_observersFrozen"));

  }
  self->_observersFrozen = 0;
}

- (BOOL)hasObserver:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_calendarObservers, "containsObject:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = -[NSMutableArray containsObject:](self->_contactsObservers, "containsObject:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_remindersObservers, 0);
  objc_storeStrong((id *)&self->_contactsObservers, 0);
  objc_storeStrong((id *)&self->_calendarObservers, 0);
}

uint64_t __24__SGJournal_addEntries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "event");
}

id __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventBatch");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_pas_mappedArrayWithTransform:", &__block_literal_global_25923);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __83__SGJournal__callCalendarObservers_contactsObservers_remindersObservers_withEntry___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "duplicateKey");
}

@end
