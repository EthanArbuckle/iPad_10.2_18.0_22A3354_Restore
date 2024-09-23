@implementation ARPRoutingEvent

- (ARPRoutingEvent)initWithBundleID:(id)a3 outputDeviceID:(id)a4 interval:(id)a5 probabilityVector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ARPRoutingEvent *v14;
  uint64_t v15;
  NSString *bundleID;
  uint64_t v17;
  NSString *outputDeviceID;
  uint64_t v19;
  NSDateInterval *interval;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ARPRoutingEvent;
  v14 = -[ARPRoutingEvent init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    bundleID = v14->_bundleID;
    v14->_bundleID = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    outputDeviceID = v14->_outputDeviceID;
    v14->_outputDeviceID = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    interval = v14->_interval;
    v14->_interval = (NSDateInterval *)v19;

    objc_storeStrong((id *)&v14->_probabilityVector, a6);
  }

  return v14;
}

+ (id)mostRecentRoutingEventInDateInterval:(id)a3 knowledgeStore:(id)a4 eventLimit:(unint64_t)a5 longFormVideoFilter:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  char v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  ARPRoutingEvent *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *context;
  void *v96;
  void *v97;
  void *v98;
  uint64_t (**v99)(id, void *);
  void *v100;
  id obj;
  void *v102;
  NSObject *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *oslog;
  uint64_t v113;
  id v114;
  uint8_t v115;
  char v116[15];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  id v123;
  uint8_t buf[4];
  NSObject *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  _BYTE v132[128];
  void *v133;
  uint64_t v134;
  void *v135;
  _QWORD v136[6];

  v136[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v99 = (uint64_t (**)(id, void *))a6;
  context = (void *)MEMORY[0x1DF0DB988]();
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(v9, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForEventsWithEndInDateRangeFrom:to:", v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForObjectsWithMetadataKey:andIntegerValue:", v17, 1);
  v18 = objc_claimAutoreleasedReturnValue();

  +[ARPRoutingSession minimumRoutingEventDuration](ARPRoutingSession, "minimumRoutingEventDuration");
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3528];
  v92 = (void *)v18;
  v93 = (void *)v15;
  v136[0] = v15;
  v136[1] = v18;
  v91 = (void *)v19;
  v136[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v11;
  v134 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)v22;
  objc_msgSend(v23, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v22, v25, 0, a5, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPRoutingSession.m");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(":%d"), 85);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClientName:", v29);

  objc_msgSend(v27, "setTracker:", &__block_literal_global_1);
  v123 = 0;
  v100 = v10;
  v30 = v27;
  objc_msgSend(v10, "executeQuery:error:", v27, &v123);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v123;
  ARPLog();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v32)
  {
    v35 = 0;
    goto LABEL_49;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:].cold.3(v31, v34);
  oslog = v34;

  v36 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v38, 0, 1, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPRoutingSession.m");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByAppendingFormat:", CFSTR(":%d"), 101);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClientName:", v41);

  v98 = v39;
  objc_msgSend(v39, "setTracker:", &__block_literal_global_15);
  if (!v99)
  {
    -[objc_class sharedAVSystemController](getAVSystemControllerClass(), "sharedAVSystemController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_2;
    v121[3] = &unk_1EA7D4300;
    v122 = v42;
    v43 = v42;
    v99 = (uint64_t (**)(id, void *))MEMORY[0x1DF0DBAFC](v121);

  }
  v87 = v27;
  v88 = v9;
  +[ARPRoutingSession microLocationCorrelationGracePeriod](ARPRoutingSession, "microLocationCorrelationGracePeriod");
  v45 = v44;
  v109 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v86 = v31;
  obj = v31;
  v46 = 0x1E0D15000uLL;
  v47 = 0x1E0D15000uLL;
  v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v132, 16);
  if (v111)
  {
    v96 = 0;
    v97 = 0;
    v107 = 0;
    v110 = *(_QWORD *)v118;
    while (1)
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v118 != v110)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v48);
        v113 = MEMORY[0x1DF0DB988]();
        objc_msgSend(v49, "metadata");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v47 + 2720), "outputDeviceIDs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        ARPExtractLongFormVideoOutputDeviceIDs(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "count") == 1)
        {
          objc_msgSend(v53, "firstObject");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
        }
        v34 = oslog;
        objc_msgSend(v49, "stringValue");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v49, "startDate");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "endDate");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v125 = v55;
          v126 = 2112;
          v127 = v54;
          v128 = 2112;
          v129 = v82;
          v130 = 2112;
          v131 = v83;
          _os_log_debug_impl(&dword_1DD793000, oslog, OS_LOG_TYPE_DEBUG, "Evaluating candiate event %@ -> %@. %@ - %@", buf, 0x2Au);

          v34 = oslog;
        }

        if (v54)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v99[2](v99, v55));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setObject:forKeyedSubscript:", v56, v55);
          }
          if (objc_msgSend(v56, "BOOLValue"))
          {
            v102 = v52;
            objc_msgSend(v49, "startDate");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "dateByAddingTimeInterval:", -v45);
            v58 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v49, "startDate");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "dateByAddingTimeInterval:", v45);
            v60 = objc_claimAutoreleasedReturnValue();

            v103 = v58;
            v106 = (void *)v60;
            objc_msgSend(*(id *)(v46 + 2768), "predicateForEventsWithStartInDateRangeFrom:to:", v58, v60);
            v61 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setPredicate:", v61);
            v114 = v107;
            objc_msgSend(v100, "executeQuery:error:", v98, &v114);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v114;

            objc_msgSend(v62, "firstObject");
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v104 = (void *)v61;
            v105 = v63;
            v108 = v64;
            if (v63)
            {
              v65 = 0;
              v46 = 0x1E0D15000;
              v66 = (void *)v113;
              v52 = v102;
              v67 = v103;
              goto LABEL_36;
            }
            if (v64)
            {
              objc_msgSend(v64, "metadata");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKeyedSubscript:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if (v71)
              {
                objc_msgSend(v108, "metadata");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "objectForKeyedSubscript:", v73);
                v89 = objc_claimAutoreleasedReturnValue();

                v74 = objc_alloc(MEMORY[0x1E0CB3588]);
                objc_msgSend(v49, "startDate");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "endDate");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v74, "initWithStartDate:endDate:", v75, v76);

                v78 = [ARPRoutingEvent alloc];
                objc_msgSend(v49, "stringValue");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = -[ARPRoutingEvent initWithBundleID:outputDeviceID:interval:probabilityVector:](v78, "initWithBundleID:outputDeviceID:interval:probabilityVector:", v79, v54, v77, v89);

                v81 = (void *)v77;
                v65 = 0;
                v96 = (void *)v89;
                v97 = (void *)v80;
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v67 = v103;
              v125 = v103;
              v126 = 2112;
              v127 = v106;
              _os_log_debug_impl(&dword_1DD793000, oslog, OS_LOG_TYPE_DEBUG, "Skipping candidate because there is no associated microlocation between %@ and %@", buf, 0x16u);
              v65 = 1;
              v81 = oslog;
              v46 = 0x1E0D15000;
              v66 = (void *)v113;
            }
            else
            {
              v65 = 1;
              v81 = oslog;
LABEL_34:
              v46 = 0x1E0D15000;
              v66 = (void *)v113;
              v67 = v103;
            }
            v52 = v102;

LABEL_36:
            if ((v65 & 1) == 0)
            {

              objc_autoreleasePoolPop(v66);
              v107 = v105;
              goto LABEL_46;
            }
            v107 = v105;
            v34 = oslog;
          }
          else
          {
            v66 = (void *)v113;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v125 = v55;
              _os_log_debug_impl(&dword_1DD793000, v34, OS_LOG_TYPE_DEBUG, "Skipping candidate because %@ is not a long form video app.", buf, 0xCu);
            }

          }
          v68 = v55;
          v47 = 0x1E0D15000;
          goto LABEL_39;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:].cold.2(&v115, v116, v34);
        v68 = v34;
        v54 = v55;
        v66 = (void *)v113;
LABEL_39:

        objc_autoreleasePoolPop(v66);
        ++v48;
      }
      while (v111 != v48);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v132, 16);
      v111 = v84;
      if (!v84)
        goto LABEL_47;
    }
  }
  v96 = 0;
  v97 = 0;
  v107 = 0;
LABEL_46:
  v34 = oslog;
LABEL_47:

  v32 = v107;
  if (!v107)
  {
    v30 = v87;
    v9 = v88;
    v31 = v86;
    v35 = v97;
    goto LABEL_52;
  }
  v30 = v87;
  v9 = v88;
  v31 = v86;
  v35 = v97;
LABEL_49:
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:].cold.1((uint64_t)v32, v34);

LABEL_52:
  objc_autoreleasePoolPop(context);

  return v35;
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasRouteSharingPolicyLongFormVideo:", a2);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ARPRoutingEvent bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingEvent outputDeviceID](self, "outputDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingEvent interval](self, "interval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingEvent probabilityVector](self, "probabilityVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> bundleID: %@, outputDeviceID: %@, interval: %@, microLocationProbabilityVector: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDictionary)probabilityVector
{
  return self->_probabilityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (void)mostRecentRoutingEventInDateInterval:(uint64_t)a1 knowledgeStore:(NSObject *)a2 eventLimit:longFormVideoFilter:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD793000, a2, OS_LOG_TYPE_ERROR, "Error fetching most recent routing event: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)mostRecentRoutingEventInDateInterval:(os_log_t)log knowledgeStore:eventLimit:longFormVideoFilter:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DD793000, log, OS_LOG_TYPE_DEBUG, "Skipping candidate because it doesn't have exactly one output device.", buf, 2u);
}

+ (void)mostRecentRoutingEventInDateInterval:(void *)a1 knowledgeStore:(NSObject *)a2 eventLimit:longFormVideoFilter:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DD793000, a2, OS_LOG_TYPE_DEBUG, "Found %@ candidate events for most recent routing event", (uint8_t *)&v4, 0xCu);

}

@end
