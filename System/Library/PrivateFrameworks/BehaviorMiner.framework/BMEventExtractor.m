@implementation BMEventExtractor

- (BMEventExtractor)init
{
  return -[BMEventExtractor initWithBMMiningTaskConfig:](self, "initWithBMMiningTaskConfig:", 0);
}

- (BMEventExtractor)initWithBMMiningTaskConfig:(id)a3
{
  id v5;
  BMEventExtractor *v6;
  BMEventExtractor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMEventExtractor;
  v6 = -[BMEventExtractor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_shouldStop = 0;
    objc_storeStrong((id *)&v6->_bmMiningTaskConfig, a3);
  }

  return v7;
}

- (void)terminateEarly
{
  -[BMEventExtractor setShouldStop:](self, "setShouldStop:", 1);
}

- (id)extractEventsFilteredByTypes:(id)a3 taskSpecificEventProviders:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  BMInteractionProvider *v52;
  void *v53;
  BMInteractionProvider *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  BMCoreRoutineProvider *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  id v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t ii;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t jj;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v98;
  char v99;
  __int128 v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id obj;
  BMCoreRoutineProvider *obja;
  id objb;
  id v117;
  void *context;
  void *contexta;
  void *contextb;
  id v121;
  id v122;
  NSObject *v123;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint8_t buf[4];
  void *v158;
  __int16 v159;
  void *v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  void *v167;
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v117 = a4;
  v124 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v125 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v153, v168, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v154;
    do
    {
      v12 = v8;
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v154 != v11)
          objc_enumerationMutation(v12);
        v14 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
        if (-[BMEventExtractor shouldStop](self, "shouldStop"))
        {
          v8 = v12;
          v22 = v12;
          v65 = (void *)MEMORY[0x24BDBD1A8];
          goto LABEL_106;
        }
        objc_msgSend(v14, "eventStream");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "eventStream");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "objectForKey:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v14, "eventStream");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "setObject:forKey:", v18, v20);

          }
          objc_msgSend(v18, "addObject:", v14);
          objc_msgSend(v14, "eventStream");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "addObject:", v21);

        }
      }
      v8 = v12;
      v10 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v153, v168, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v124, "count"))
  {
    v23 = (void *)MEMORY[0x2199D5B54]();
    objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStoreWithDirectReadOnlyAccess");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BE1B088];
    objc_msgSend(v124, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0F8], "startDateSortDescriptorAscending:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v167, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v26, 0, 50000, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v152 = 0;
    v108 = (void *)v29;
    objc_msgSend(v24, "executeQuery:error:", v29, &v152);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v152;
    v32 = v31;
    if (v30)
    {
      v104 = v24;
      v106 = v23;
      v112 = v31;
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v101 = v30;
      obj = v30;
      v121 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v166, 16);
      if (v121)
      {
        context = *(void **)v149;
        v103 = v8;
        do
        {
          for (j = 0; j != v121; j = (char *)j + 1)
          {
            if (*(void **)v149 != context)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)j);
            if (-[BMEventExtractor shouldStop](self, "shouldStop"))
            {

              objc_autoreleasePoolPop(v106);
              v65 = (void *)MEMORY[0x24BDBD1A8];
              v8 = v103;
              goto LABEL_104;
            }
            v146 = 0u;
            v147 = 0u;
            v144 = 0u;
            v145 = 0u;
            objc_msgSend(v34, "stream");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "name");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "objectForKey:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v144, v165, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v145;
              do
              {
                for (k = 0; k != v39; ++k)
                {
                  if (*(_QWORD *)v145 != v40)
                    objc_enumerationMutation(v37);
                  v42 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * k);
                  v43 = (void *)MEMORY[0x2199D5B54]();
                  objc_msgSend(v42, "extractEventFromDKEvent:", v34);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v44)
                    objc_msgSend(v22, "addObject:", v44);

                  objc_autoreleasePoolPop(v43);
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v144, v165, 16);
              }
              while (v39);
            }

          }
          v8 = v103;
          v121 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v166, 16);
        }
        while (v121);
      }

      v32 = v112;
      v24 = v104;
      v23 = v106;
      v30 = v101;
    }

    objc_autoreleasePoolPop(v23);
    if (v32)
      goto LABEL_97;
  }
  v45 = 0x24D21E000uLL;
  +[BMItemType interactionRecipients](BMItemType, "interactionRecipients");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v8, "containsObject:", v46);

  if (v47)
  {
    v48 = (void *)MEMORY[0x2199D5B54]();
    BMLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[BMEventExtractor extractEventsFilteredByTypes:taskSpecificEventProviders:error:].cold.2(self);

    -[BMEventExtractor bmMiningTaskConfig](self, "bmMiningTaskConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      BMLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        -[BMEventExtractor extractEventsFilteredByTypes:taskSpecificEventProviders:error:].cold.1(self);

    }
    v52 = [BMInteractionProvider alloc];
    -[BMEventExtractor bmMiningTaskConfig](self, "bmMiningTaskConfig");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[BMInteractionProvider initWithBMMiningTaskConfig:](v52, "initWithBMMiningTaskConfig:", v53);

    v143 = 0;
    -[BMInteractionProvider interactionEventsForTypes:error:](v54, "interactionEventsForTypes:error:", v8, &v143);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v143;
    v32 = v56;
    if (v55)
    {
      obja = (BMCoreRoutineProvider *)v54;
      contexta = v48;
      v109 = v55;
      v112 = v56;
      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      v122 = v55;
      v57 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
      if (!v57)
        goto LABEL_52;
      v58 = v57;
      v59 = *(_QWORD *)v140;
      while (1)
      {
        for (m = 0; m != v58; ++m)
        {
          if (*(_QWORD *)v140 != v59)
            objc_enumerationMutation(v122);
          v61 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * m);
          if (-[BMEventExtractor shouldStop](self, "shouldStop"))
          {
LABEL_101:

            objc_autoreleasePoolPop(contexta);
            v65 = (void *)MEMORY[0x24BDBD1A8];
LABEL_104:
            v32 = v112;
            goto LABEL_105;
          }
          objc_msgSend(v61, "item");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "type");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v8, "containsObject:", v63);

          if (v64)
            objc_msgSend(v22, "addObject:", v61);
        }
        v58 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
        if (!v58)
        {
LABEL_52:

          v55 = v109;
          v32 = v112;
          v45 = 0x24D21E000;
          v48 = contexta;
          v54 = (BMInteractionProvider *)obja;
          break;
        }
      }
    }

    objc_autoreleasePoolPop(v48);
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(*(id *)(v45 + 464), "locationIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v32;
  if ((objc_msgSend(v8, "containsObject:", v66) & 1) != 0)
    goto LABEL_59;
  objc_msgSend(*(id *)(v45 + 464), "enterLocation");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v67))
  {

LABEL_59:
LABEL_60:
    v68 = (void *)MEMORY[0x2199D5B54]();
    v69 = objc_alloc_init(BMCoreRoutineProvider);
    -[BMCoreRoutineProvider locationEvents](v69, "locationEvents");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      obja = v69;
      contexta = v68;
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      v110 = v70;
      v122 = v70;
      v71 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
      if (v71)
      {
        v72 = v71;
        v73 = *(_QWORD *)v136;
        do
        {
          for (n = 0; n != v72; ++n)
          {
            if (*(_QWORD *)v136 != v73)
              objc_enumerationMutation(v122);
            v75 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * n);
            if (-[BMEventExtractor shouldStop](self, "shouldStop"))
              goto LABEL_101;
            objc_msgSend(v75, "item");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "type");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v8, "containsObject:", v77);

            if (v78)
              objc_msgSend(v22, "addObject:", v75);
          }
          v72 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
        }
        while (v72);
      }

      v70 = v110;
      v32 = v112;
      v68 = contexta;
      v69 = obja;
    }

    objc_autoreleasePoolPop(v68);
    goto LABEL_73;
  }
  objc_msgSend(*(id *)(v45 + 464), "exitLocation");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v8, "containsObject:", v98);

  if ((v99 & 1) != 0)
    goto LABEL_60;
LABEL_73:
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v79 = v117;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v131, v162, 16);
  if (!v80)
    goto LABEL_96;
  v82 = v80;
  contextb = *(void **)v132;
  *(_QWORD *)&v81 = 138412546;
  v100 = v81;
  v107 = v79;
  do
  {
    for (ii = 0; ii != v82; ++ii)
    {
      if (*(void **)v132 != contextb)
        objc_enumerationMutation(v79);
      v84 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * ii);
      v130 = 0;
      objc_msgSend(v84, "eventsForTypes:error:", v8, &v130, v100);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v130;
      v87 = v86;
      if (v85)
      {
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        objb = v85;
        v123 = v85;
        v88 = -[NSObject countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v126, v161, 16);
        if (v88)
        {
          v89 = v88;
          v111 = v87;
          v102 = ii;
          v105 = v82;
          v90 = v8;
          v91 = *(_QWORD *)v127;
          while (2)
          {
            for (jj = 0; jj != v89; ++jj)
            {
              if (*(_QWORD *)v127 != v91)
                objc_enumerationMutation(v123);
              v93 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * jj);
              if (-[BMEventExtractor shouldStop](self, "shouldStop"))
              {

                v65 = (void *)MEMORY[0x24BDBD1A8];
                v8 = v90;
                goto LABEL_104;
              }
              objc_msgSend(v93, "item");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "type");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend(v90, "containsObject:", v95);

              if (v96)
                objc_msgSend(v22, "addObject:", v93);
            }
            v89 = -[NSObject countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v126, v161, 16);
            if (v89)
              continue;
            break;
          }
          v8 = v90;
          v87 = v111;
          v32 = v112;
          v82 = v105;
          v79 = v107;
          ii = v102;
        }
      }
      else
      {
        if (!v86)
          goto LABEL_94;
        objb = 0;
        BMLog();
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v100;
          v158 = v87;
          v159 = 2112;
          v160 = v84;
          _os_log_fault_impl(&dword_2147C2000, v123, OS_LOG_TYPE_FAULT, "Unexpected error in taskSpecificEventProvider {error: %@, provider: %@}", buf, 0x16u);
        }
      }

      v85 = objb;
LABEL_94:

    }
    v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v131, v162, 16);
  }
  while (v82);
LABEL_96:

  if (v32)
  {
LABEL_97:

    v22 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v32);
  v22 = v22;
  v65 = v22;
LABEL_105:

LABEL_106:
  return v65;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return (BMMiningTaskConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
}

- (void)extractEventsFilteredByTypes:(void *)a1 taskSpecificEventProviders:error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "bmMiningTaskConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "interactionExtractedTopicFromAttachmentFactorInUse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_2147C2000, v4, v5, "Passing bmMiningTaskConfig to BMInteractionProvider with interactionExtractedTopicFromAttachmentFactorInUse as %@", v6, v7, v8, v9, 2u);

}

- (void)extractEventsFilteredByTypes:(void *)a1 taskSpecificEventProviders:error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "bmMiningTaskConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_2147C2000, v2, v3, "Passing bmMiningTaskConfig to BMInteractionProvider %@", v4, v5, v6, v7, 2u);

}

@end
