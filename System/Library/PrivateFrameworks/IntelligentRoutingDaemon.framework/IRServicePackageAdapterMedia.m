@implementation IRServicePackageAdapterMedia

- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  unint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unint64_t j;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  NSObject *v106;
  void *v107;
  IRHistoryEventsContainerDO *v108;
  void *v109;
  IRHistoryEventsContainerDO *v110;
  id v112;
  void *v113;
  id v114;
  unint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  void *v123;
  _QWORD v124[4];
  id v125;
  id v126;
  id v127;
  id v128;
  _BYTE *v129;
  uint8_t v130[4];
  const char *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  _BYTE buf[24];
  void *v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v114 = a3;
  v112 = a4;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v114, "historyEvents", v112);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "#service-package-adapter-media, ";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v137 = v10;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Number of history events before filtering = %@", buf, 0x20u);

  }
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v114, "historyEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(&unk_25105EF30, "count"))
  {
    v115 = 0;
    do
    {
      v116 = (void *)objc_opt_new();
      objc_msgSend(&unk_25105EF30, "objectAtIndexedSubscript:", v115);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v14, "integerValue");

      v15 = objc_msgSend(&unk_25105EF30, "count");
      v16 = ++v115 / v15;
      objc_msgSend(&unk_25105EF30, "objectAtIndexedSubscript:", v115 - v16 * v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v17, "integerValue");

      if (objc_msgSend(v13, "count"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v18, v112);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "event");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "eventType") == v117;

          v119 = v18 + 1;
          if (v21 && v119 < objc_msgSend(v13, "count"))
          {
            for (i = v18 + 1; i < objc_msgSend(v13, "count"); ++i)
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", i);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "date");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "date");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "timeIntervalSinceDate:", v26);
              v28 = v27;
              +[IRPreferences shared](IRPreferences, "shared");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "mediaPlaybackEventsTimeIntervalThreshold");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "doubleValue");
              v32 = v28 < v31;

              if (!v32)
                break;
              objc_msgSend(v13, "objectAtIndexedSubscript:", i);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "event");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "eventType") == v122;

              if (v35)
              {
                objc_msgSend(v13, "objectAtIndexedSubscript:", i);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "candidateIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "candidateIdentifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v37, "isEqual:", v39);

                if (v40)
                {
                  objc_msgSend(v13, "objectAtIndexedSubscript:", i);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "event");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "bundleID");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "event");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "bundleID");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v43, "isEqual:", v46)
                    && (objc_msgSend(v116, "containsIndex:", i) & 1) == 0)
                  {
                    objc_msgSend(v116, "addIndex:", v18);
                    objc_msgSend(v116, "addIndex:", i);

                    break;
                  }

                }
              }
            }
          }
          ++v18;
        }
        while (v119 < objc_msgSend(v13, "count"));
      }
      objc_msgSend(v13, "removeObjectsAtIndexes:", v116, v112);

    }
    while (v115 < objc_msgSend(&unk_25105EF30, "count"));
  }
  +[IREventDO mediaUserInteractionEvents](IREventDO, "mediaUserInteractionEvents", v112);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "compactMap:", &__block_literal_global_1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = (void *)objc_opt_new();
  if (objc_msgSend(v13, "count"))
  {
    v48 = 0;
    v120 = 1;
    do
    {
      v49 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "event");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "numberWithLongLong:", objc_msgSend(v51, "eventType"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = objc_msgSend(v123, "containsObject:", v52);

      if ((_DWORD)v49)
      {
        v53 = v120;
        while (v53 < objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "date");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v48);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "date");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "timeIntervalSinceDate:", v57);
          v59 = v58;
          +[IRPreferences shared](IRPreferences, "shared");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "doubleValue");
          v63 = v59 < v62;

          if (!v63)
            break;
          v64 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v13, "objectAtIndexedSubscript:", v53);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "event");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "numberWithLongLong:", objc_msgSend(v66, "eventType"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v64) = objc_msgSend(v123, "containsObject:", v67);

          ++v53;
          if ((_DWORD)v64)
          {
            objc_msgSend(v118, "addIndex:", v48);
            break;
          }
        }
      }
      ++v48;
      ++v120;
    }
    while (v48 < objc_msgSend(v13, "count"));
  }
  objc_msgSend(v13, "removeObjectsAtIndexes:", v118);
  objc_msgSend(v118, "removeAllIndexes");
  if (objc_msgSend(v13, "count"))
  {
    v68 = 0;
    do
    {
      v69 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "event");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "numberWithLongLong:", objc_msgSend(v71, "eventType"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v69) = objc_msgSend(v123, "containsObject:", v72);

      v121 = v68 + 1;
      if ((_DWORD)v69 && v121 < objc_msgSend(v13, "count"))
      {
        for (j = v68 + 1; j < objc_msgSend(v13, "count"); ++j)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", j);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "date");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v68);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "date");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "timeIntervalSinceDate:", v77);
          v79 = v78;
          +[IRPreferences shared](IRPreferences, "shared");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "doubleValue");
          v83 = v79 < v82;

          if (!v83)
            break;
          v84 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v13, "objectAtIndexedSubscript:", j);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "event");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "numberWithLongLong:", objc_msgSend(v86, "eventType"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v84) = objc_msgSend(v123, "containsObject:", v87);

          if ((_DWORD)v84)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", j);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "candidateIdentifier");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", v68);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "candidateIdentifier");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = objc_msgSend(v89, "isEqual:", v91);

            if (v92)
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", j);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "event");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "bundleID");
              v95 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "objectAtIndexedSubscript:", v68);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "event");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "bundleID");
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v95, "isEqual:", v98))
              {
                objc_msgSend(v118, "addIndex:", v68);

                break;
              }

            }
          }
        }
      }
      ++v68;
    }
    while (v121 < objc_msgSend(v13, "count"));
  }
  objc_msgSend(v13, "removeObjectsAtIndexes:", v118);
  +[IREventDO mediaBrokeredDeviceEvents](IREventDO, "mediaBrokeredDeviceEvents");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "compactMap:", &__block_literal_global_9);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v118, "removeAllIndexes");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v137) = 0;
  v124[0] = MEMORY[0x24BDAC760];
  v124[1] = 3221225472;
  v124[2] = __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_3;
  v124[3] = &unk_251043C68;
  v101 = v100;
  v125 = v101;
  v129 = buf;
  v102 = v113;
  v126 = v102;
  v103 = v123;
  v127 = v103;
  v104 = v118;
  v128 = v104;
  objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v124);
  objc_msgSend(v13, "removeObjectsAtIndexes:", v104);
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (id)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v130 = 136315650;
    v131 = "#service-package-adapter-media, ";
    v132 = 2112;
    v133 = v105;
    v134 = 2112;
    v135 = v107;
    _os_log_impl(&dword_23FFBA000, v106, OS_LOG_TYPE_INFO, "%s[%@], Number of history events after filtering = %@", v130, 0x20u);

  }
  v108 = [IRHistoryEventsContainerDO alloc];
  v109 = (void *)objc_msgSend(v13, "copy");
  v110 = -[IRHistoryEventsContainerDO initWithHistoryEvents:](v108, "initWithHistoryEvents:", v109);

  _Block_object_dispose(buf, 8);
  return v110;
}

- (IRServicePackageAdapterMedia)init
{
  IRServicePackageAdapterMedia *v2;
  IRClassificationGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IRServicePackageAdapterMedia;
  v2 = -[IRServicePackageAdapterMedia init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IRClassificationGenerator);
    -[IRServicePackageAdapterMedia setGenerator:](v2, "setGenerator:", v3);

  }
  return v2;
}

- (NSDictionary)contexts
{
  void *v2;
  void *v3;

  -[IRServicePackageAdapterMedia generator](self, "generator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)policyInspections
{
  void *v2;
  void *v3;

  -[IRServicePackageAdapterMedia generator](self, "generator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "policyInspections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5
{
  return 0;
}

- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9
{
  uint64_t v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v9 = a8;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[IRServicePackageAdapterMedia generator](self, "generator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v22, "generateClassificationsWithCandiatesContainer:systemState:historyEventsContainer:miloPrediction:nearbyDeviceContainer:fillInspection:date:", v21, v20, v19, v18, v17, v9, v16);

  return v9;
}

uint64_t __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a2, "eventType"));
}

uint64_t __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a2, "eventType"));
}

void __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x24BDD16E0];
  v19 = v5;
  objc_msgSend(v5, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "eventType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v9);

  if ((_DWORD)v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v10 = v19;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v19, "candidateIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidateForCandidateIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isBrokeredDevice");

    v10 = v19;
    if (v14)
    {
      v15 = *(void **)(a1 + 48);
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v19, "event");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "eventType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v15, "containsObject:", v18);

      v10 = v19;
      if ((_DWORD)v15)
      {
        objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);
        v10 = v19;
      }
    }
  }

}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke;
  v17[3] = &unk_251043C90;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v17);

  objc_msgSend(v7, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2;
  v15[3] = &unk_251043CB8;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "firstWhere:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v13 != 0;

  return (char)v10;
}

void __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;
  +[IRPreferences shared](IRPreferences, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateLastUsedThrForMiLoLowLatancyPowerOpt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v9 >= v13)
  {
    *a4 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v18, "systemState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isMiLoSupportedLocation") & 1) == 0)
  {
LABEL_5:

LABEL_7:
    v16 = v18;
    goto LABEL_8;
  }
  objc_msgSend(v18, "candidateIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v18, "candidateIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v14);
    goto LABEL_5;
  }
LABEL_8:

}

uint64_t __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "containsAirplayTarget"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "candidateIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 forCandidateIdentifier:(id)a5
{
  id v5;
  char v6;

  v5 = a5;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("Speaker")) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("speaker"));

  return v6;
}

- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3
{
  return objc_msgSend(a3, "isUserIntentionEvent");
}

- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a4;
  objc_msgSend(a3, "airplayOrUnknownCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDateForSignificantBundlesLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "historyEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke;
  v23[3] = &unk_251043D20;
  v23[4] = self;
  v24 = v7;
  v25 = v11;
  v26 = v9;
  v14 = v8;
  v27 = v14;
  v15 = v9;
  v16 = v11;
  v17 = v7;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_24;
  v21[3] = &unk_251043D48;
  v22 = v14;
  v18 = v14;
  objc_msgSend(v15, "compactMap:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v26, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "shouldConsiderEventForSignificantBundles:", v6);

    if ((_DWORD)v5)
    {
      objc_msgSend(v26, "candidateIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[IRCandidateDO candidateForIdentifier:within:](IRCandidateDO, "candidateForIdentifier:within:", v7, a1[5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_14;
      objc_msgSend(v26, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isLaterThan:", a1[6]);

      if (!v10)
        goto LABEL_14;
      v11 = (void *)a1[7];
      objc_msgSend(v26, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      objc_msgSend(v8, "nodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "containsObjectPassingTest:", &__block_literal_global_21);

      v15 = (void *)a1[8];
      objc_msgSend(v26, "event");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v12)
      {
        if (!v18)
        {
          v25 = (void *)a1[8];
          objc_msgSend(v26, "event");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bundleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_25105EB58, v23);
          goto LABEL_12;
        }
        v19 = (void *)MEMORY[0x24BDD16E0];
        v20 = objc_msgSend(v18, "integerValue") + 1;
      }
      else
      {
        if (!v18)
        {
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v19 = (void *)MEMORY[0x24BDD16E0];
        v20 = objc_msgSend(v18, "integerValue") - 1;
      }
      objc_msgSend(v19, "numberWithInteger:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)a1[8];
      objc_msgSend(v26, "event");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v24);

LABEL_12:
      goto LABEL_13;
    }
  }
LABEL_15:

}

BOOL __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "avOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "deviceType"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v2, "avOutputDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "deviceSubType") == 11)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v2, "avOutputDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "deviceSubType") == 13)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(v2, "avOutputDevice");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v8, "deviceSubType") == 17;

        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B2E8]), "initWithBundleType:andIdentifier:", 2, v3);
  return v4;
}

- (IRClassificationGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
}

- (id)weeklyAnalyticsWithServiceStore:(id)a3 statistics:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[IRPreferences shared](IRPreferences, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberOfHistoryEventsInCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v12, "unsignedIntegerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchCandidatesContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "historyEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __96__IRServicePackageAdapterMedia_IRAnalytics__weeklyAnalyticsWithServiceStore_statistics_service___block_invoke;
  v29[3] = &unk_2510444F8;
  v17 = v15;
  v30 = v17;
  objc_msgSend(v16, "allWhere:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:](IRHistoryEventsContainerDO, "historyEventsContainerDOWithHistoryEvents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRServicePackageAdapterMedia filterHistory:withCandidatesContainer:](self, "filterHistory:withCandidatesContainer:", v19, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v8, "clientIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("General_Weekly_Client_Identifier"));

  }
  else
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("General_Weekly_Client_Identifier"));
  }

  -[IRServicePackageAdapterMedia _getUIWeeklyAnalyticsWithWeeklyHistory:](self, "_getUIWeeklyAnalyticsWithWeeklyHistory:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addEntriesFromDictionary:", v24);

  -[IRServicePackageAdapterMedia _getGeneralWeeklyAnalyticsWithWeeklyHistory:withCandidatesContainer:](self, "_getGeneralWeeklyAnalyticsWithWeeklyHistory:withCandidatesContainer:", v20, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addEntriesFromDictionary:", v25);

  -[IRServicePackageAdapterMedia _getWeeklyAnalyticsFromStatistics:candidatesContainer:](self, "_getWeeklyAnalyticsFromStatistics:candidatesContainer:", v9, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addEntriesFromDictionary:", v26);
  v27 = (void *)objc_msgSend(v21, "copy");

  return v27;
}

uint64_t __96__IRServicePackageAdapterMedia_IRAnalytics__weeklyAnalyticsWithServiceStore_statistics_service___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRPreferences shared](IRPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreAnalyticsXPCHistoryEventsValidThreshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isEarlierThanOrEqualTo:", v6);

  return v7;
}

- (id)_getUIWeeklyAnalyticsWithWeeklyHistory:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  _QWORD v27[9];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[10];
  _QWORD v49[12];

  v49[10] = *MEMORY[0x24BDAC8D0];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v25 = a3;
  objc_msgSend(v25, "historyEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __84__IRServicePackageAdapterMedia_IRAnalytics___getUIWeeklyAnalyticsWithWeeklyHistory___block_invoke;
  v27[3] = &unk_251045668;
  v27[4] = &v44;
  v27[5] = &v40;
  v27[6] = &v36;
  v27[7] = &v32;
  v27[8] = &v28;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v27);

  v4 = v45[3];
  v5 = v41[3] + v4;
  if (v5)
    v6 = 100 * v4 / v5;
  else
    v6 = 200;
  v7 = v37[3];
  v8 = v33[3] + v7;
  if (v8)
    v9 = 100 * v7 / v8;
  else
    v9 = 200;
  v11 = v7 + v5;
  v10 = v11 == 0;
  v12 = 100 * v5 / v11;
  if (v10)
    v13 = 200;
  else
    v13 = v12;
  v48[0] = CFSTR("Autoroute_UI_Weekly_Accepted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v26;
  v48[1] = CFSTR("Autoroute_UI_Weekly_Rejected");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41[3]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v14;
  v48[2] = CFSTR("Autoroute_UI_Weekly_Prompt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v15;
  v48[3] = CFSTR("Autoroute_UI_Weekly_Accepted_Ratio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v16;
  v48[4] = CFSTR("OneTap_UI_Weekly_Accepted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v37[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v17;
  v48[5] = CFSTR("OneTap_UI_Weekly_Rejected");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v18;
  v48[6] = CFSTR("OneTap_UI_Weekly_Prompt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v19;
  v48[7] = CFSTR("OneTap_UI_Weekly_Accepted_Ratio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v20;
  v48[8] = CFSTR("Autoroute_To_OneTap_UI_Weekly_Ratio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v21;
  v48[9] = CFSTR("PickerTop_UI_Weekly_Prompt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v29[3]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

void __84__IRServicePackageAdapterMedia_IRAnalytics___getUIWeeklyAnalyticsWithWeeklyHistory___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventType");

  if (v4 != 1)
  {
    objc_msgSend(v18, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "eventType");

    if (v7 == 2)
    {
      v5 = a1[5];
      goto LABEL_7;
    }
    objc_msgSend(v18, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "eventType");

    if (v9 == 3)
    {
      v5 = a1[6];
      goto LABEL_7;
    }
    objc_msgSend(v18, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "eventType") == 4)
    {

      v11 = v18;
    }
    else
    {
      objc_msgSend(v18, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "eventType");

      v11 = v18;
      if (v14 != 8)
      {
        objc_msgSend(v18, "event");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "eventType");

        v11 = v18;
        if (v17)
          goto LABEL_9;
        v15 = a1[8];
        goto LABEL_14;
      }
    }
    v15 = a1[7];
LABEL_14:
    v10 = (_QWORD *)(*(_QWORD *)(v15 + 8) + 24);
    goto LABEL_8;
  }
  v5 = a1[4];
LABEL_7:
  v10 = (_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
  v11 = v18;
LABEL_8:
  ++*v10;
LABEL_9:

}

- (id)_getGeneralWeeklyAnalyticsWithWeeklyHistory:(id)a3 withCandidatesContainer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[11];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[13];
  _QWORD v95[15];

  v95[13] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v31 = v5;
  objc_msgSend(v5, "historyEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 200;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__10;
  v80 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v81 = (id)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__10;
  v74 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v75 = (id)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__10;
  v68 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  objc_msgSend(v5, "historyEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke;
  v59[3] = &unk_251045690;
  v59[4] = &v90;
  v59[5] = &v64;
  v59[6] = &v86;
  v59[7] = &v82;
  v59[8] = &v70;
  v59[9] = &v76;
  v59[10] = &v60;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v59);

  v10 = objc_msgSend((id)v77[5], "count");
  v11 = objc_msgSend((id)v71[5], "count");
  +[IRServicePackageAdapterMedia _getUniqueAirplayRoutsFromCandidateIdentifiers:inCandiateContainer:](IRServicePackageAdapterMedia, "_getUniqueAirplayRoutsFromCandidateIdentifiers:inCandiateContainer:", v71[5], v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "count");
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v12 = (void *)v65[5];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke_2;
  v32[3] = &unk_2510456B8;
  v24 = v6;
  v33 = v24;
  v34 = &v55;
  v35 = &v39;
  v36 = &v51;
  v37 = &v47;
  v38 = &v43;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v32);
  v94[0] = CFSTR("General_Weekly_N_events");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v30;
  v94[1] = CFSTR("General_Weekly_N_days_since_last_brokered_scan");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v91[3]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v29;
  v94[2] = CFSTR("General_Weekly_N_playbacks_with_milo");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v87[3]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v28;
  v94[3] = CFSTR("General_Is_Milo_Available_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v83[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v13;
  v94[4] = CFSTR("General_N_Routes_In_History_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v95[4] = v14;
  v94[5] = CFSTR("General_N_Routes_used_With_Milo_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v95[5] = v15;
  v94[6] = CFSTR("General_N_airplay_Routes_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v95[6] = v16;
  v94[7] = CFSTR("General_N_airplay_playback_events_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v95[7] = v17;
  v94[8] = CFSTR("General_N_airplay_playback_events_custom_loi_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v52[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v95[8] = v18;
  v94[9] = CFSTR("General_Have_BLE_headphones_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v61[3]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v95[9] = v19;
  v94[10] = CFSTR("General_N_airplay_playback_events_Milo_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v48[3]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v95[10] = v20;
  v94[11] = CFSTR("General_N_airplay_playback_events_Milo_Eligible_App_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v44[3]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v95[11] = v21;
  v94[12] = CFSTR("General_N_airplay_playback_events_Eligible_App_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40[3]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v95[12] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 13);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  return v27;
}

void __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eventType");

  if (v4 == 9)
  {
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v26, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v5, "daysFromDate:toDate:", v6, v7);

  }
  objc_msgSend(v26, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "eventType");

  if (v9 == 5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v26);
    objc_msgSend(v26, "miloPredictionEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predictionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  objc_msgSend(v26, "systemState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "locationSemanticUserSpecificPlaceType");

  if (v13 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    objc_msgSend(v26, "candidateIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      objc_msgSend(v26, "candidateIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

    }
  }
  objc_msgSend(v26, "candidateIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
    objc_msgSend(v26, "candidateIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

  }
  objc_msgSend(v26, "systemState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "outputDeviceType") == 1)
  {
    objc_msgSend(v26, "systemState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "outputDeviceSubType") == 3)
    {

LABEL_18:
      *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
      goto LABEL_19;
    }
    objc_msgSend(v26, "systemState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "outputDeviceSubType");

    if (v23 == 2)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(v26, "systemState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "predictedOutputDeviceType");

  if (v25 == 1)
    goto LABEL_18;
LABEL_19:

}

void __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;

  v3 = a2;
  v4 = (void *)a1[4];
  v13 = v3;
  objc_msgSend(v3, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateForCandidateIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "containsAirplayTarget"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v13, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEligibleApp");

    if (v8)
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_msgSend(v13, "systemState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "locationSemanticUserSpecificPlaceType");

    if (v10 == 5)
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    objc_msgSend(v13, "systemState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "locationSemanticUserSpecificPlaceType");

    if (v12 == 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
      if (v8)
        ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
    }
  }

}

- (id)_getWeeklyAnalyticsFromStatistics:(id)a3 candidatesContainer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[11];
  _QWORD v36[13];

  v36[11] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = objc_msgSend(v5, "numberOfContextChanges");
  v9 = objc_msgSend(v5, "numberOfMiLoPredictions");
  v10 = objc_msgSend(v5, "numberOfMiLoPredictionsInUpdatesMode");
  v11 = objc_msgSend(v5, "lastMiLoLSLItems");
  v12 = objc_msgSend(v5, "lastMiLoQualityReasonBitmap");
  v31 = objc_msgSend(v5, "lastMiLoQuality");
  v32 = objc_msgSend(v5, "lastMiLoModels");
  v13 = objc_msgSend(v5, "numberOfPickerChoiceEvents");
  v14 = objc_msgSend(v5, "numberOfCorrectPickerChoiceEvents");
  if (v13)
    v15 = 100 * v14 / v13;
  else
    v15 = 200;
  v30 = objc_msgSend(v5, "timeInUpdatesModeInSeconds");

  +[IRPreferences shared](IRPreferences, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mobileAssetVersion");
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = &stru_251046168;
  if (v17)
    v18 = (const __CFString *)v17;
  v35[0] = CFSTR("General_Weekly_N_candidates");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7, v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v34;
  v35[1] = CFSTR("General_Weekly_N_context_changes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v33;
  v35[2] = CFSTR("General_Weekly_N_milo_predictions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v19;
  v35[3] = CFSTR("General_Weekly_N_Milo_Predictions_in_Update_Mode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v20;
  v35[4] = CFSTR("Milo_Number_of_LSL_Items_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v21;
  v35[5] = CFSTR("Milo_Quality_Reason_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v22;
  v35[6] = CFSTR("Milo_Quality_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v23;
  v35[7] = CFSTR("N_MiLo_Different_Models_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v24;
  v35[8] = CFSTR("PickerTop_UI_Weekly_SuccessRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v25;
  v35[9] = CFSTR("Time_In_Update_Mode_Weekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = CFSTR("General_Weekly_Mobile_Asset_Version");
  v36[9] = v26;
  v36[10] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  _BOOL8 v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v70;
  unsigned int v71;
  int v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  unsigned int v100;
  void *v101;
  unsigned int v102;
  void *v103;
  int64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __CFString *v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t *v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  __CFString *v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  __CFString *v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[37];
  _QWORD v182[39];

  v182[37] = *MEMORY[0x24BDAC8D0];
  v120 = a3;
  v16 = a4;
  v121 = a5;
  v17 = a6;
  v113 = a7;
  v114 = a8;
  v115 = a9;
  v112 = a10;
  v119 = v17;
  -[IRServicePackageAdapterMedia filterHistory:withCandidatesContainer:](self, "filterHistory:withCandidatesContainer:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "historyEvents");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v113, "objectForKeyedSubscript:", *MEMORY[0x24BE5B260]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "clientIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v115, "clientIdentifier");
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v109 = &stru_251046168;
  }

  objc_msgSend(v120, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = +[IRAnalyticsUtilities getRedactedBundleID:](IRAnalyticsUtilities, "getRedactedBundleID:", v20);

  v102 = objc_msgSend(v120, "isEligibleApp");
  objc_msgSend(v121, "systemState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v21, "locationSemanticUserSpecificPlaceType");

  objc_msgSend(v120, "eventType");
  IRMediaEventTypeToString();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "systemState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v22, "locationSemanticUserSpecificPlaceType");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v23, "canUse");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v24, "confidence");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v25, "confidenceReasonBitmap");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scores");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v27, "count");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v28, "miLoServiceQuality");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v29, "miLoServiceQualityReasonBitmap");

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "predictionTime");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceNow");
  v33 = v32;

  objc_msgSend(v17, "candidates");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v34, "count");

  v177 = 0;
  v178 = &v177;
  v179 = 0x2020000000;
  v180 = 0;
  v173 = 0;
  v174 = &v173;
  v175 = 0x2020000000;
  v176 = 0;
  v169 = 0;
  v170 = &v169;
  v171 = 0x2020000000;
  v172 = 0;
  v165 = 0;
  v166 = &v165;
  v167 = 0x2020000000;
  v168 = 0;
  v161 = 0;
  v162 = &v161;
  v163 = 0x2020000000;
  v164 = 0;
  v157 = 0;
  v158 = &v157;
  v159 = 0x2020000000;
  v160 = 0;
  v153 = 0;
  v154 = &v153;
  v155 = 0x2020000000;
  v156 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x2020000000;
  v152 = 0;
  v143 = 0;
  v144 = &v143;
  v145 = 0x3032000000;
  v146 = __Block_byref_object_copy__10;
  v147 = __Block_byref_object_dispose__10;
  v148 = &stru_251046168;
  v137 = 0;
  v138 = &v137;
  v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__10;
  v141 = __Block_byref_object_dispose__10;
  v142 = &stru_251046168;
  objc_msgSend(v116, "candidates");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = MEMORY[0x24BDAC760];
  v124[1] = 3221225472;
  v124[2] = __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke;
  v124[3] = &unk_251045720;
  v127 = &v177;
  v128 = &v173;
  v129 = &v169;
  v130 = &v165;
  v118 = v16;
  v125 = v118;
  v131 = &v143;
  v132 = &v137;
  v133 = &v161;
  v110 = v116;
  v126 = v110;
  v134 = &v157;
  v135 = &v153;
  v136 = &v149;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v124);

  objc_msgSend(v17, "candidateForCandidateIdentifier:", v118);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "containsAirplayTarget");
  +[IRAnalyticsUtilities candidateTypeForCandidate:](IRAnalyticsUtilities, "candidateTypeForCandidate:", v36);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsUtilities candidateModelTypeForCandidate:](IRAnalyticsUtilities, "candidateModelTypeForCandidate:", v36);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "timeToBannerInMilliSeconds");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v114, "timeToBannerInMilliSeconds");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedIntegerValue");

  }
  else
  {
    v40 = 0;
  }

  objc_msgSend(v110, "generatorNegativeInputs");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "allValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstWhere:", &__block_literal_global_158);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 != 0;

  +[IRPreferences shared](IRPreferences, "shared");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "mobileAssetVersion");
  v46 = objc_claimAutoreleasedReturnValue();

  if (v46)
    v47 = (const __CFString *)v46;
  else
    v47 = &stru_251046168;
  v82 = (__CFString *)v47;
  objc_msgSend(v112, "historyEvents");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = MEMORY[0x24BDAC760];
  v122[1] = 3221225472;
  v122[2] = __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_4;
  v122[3] = &unk_2510444F8;
  v70 = v36;
  v123 = v70;
  objc_msgSend(v48, "firstWhere:", v122);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v121, "miloProviderLslPredictionResults");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRCandidateClassificationDetectorSameSpace sameSpaceMiLoScoresForCandidate:basedOnMiLoPrediction:andHistoryEventsAsc:andDate:](IRCandidateClassificationDetectorSameSpace, "sameSpaceMiLoScoresForCandidate:basedOnMiLoPrediction:andHistoryEventsAsc:andDate:", v118, v50, v111, v51);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v117, "first");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "unsignedIntegerValue");

  objc_msgSend(v117, "second");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "unsignedIntegerValue");

  v56 = v44;
  if (v55)
    v57 = 100 * v53 / v55;
  else
    v57 = 200;
  v71 = objc_msgSend(v120, "isOutsideApp");
  v182[0] = v109;
  v181[0] = CFSTR("UI_Event_Client_Identifier");
  v181[1] = CFSTR("UI_Event_Internal_App_Name_Enum");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v182[1] = v105;
  v181[2] = CFSTR("UI_Event_Is_Eligible_App");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v182[2] = v103;
  v181[3] = CFSTR("UI_Event_Current_LOI_Enum");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v182[3] = v101;
  v182[4] = v108;
  v181[4] = CFSTR("UI_Event_Type");
  v181[5] = CFSTR("UI_Event_Count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v182[5] = v99;
  v181[6] = CFSTR("UI_Event_MiLo_Available");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v182[6] = v98;
  v181[7] = CFSTR("UI_Event_MiLo_Confidence");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v182[7] = v96;
  v181[8] = CFSTR("UI_Event_Milo_Confidence_Reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v182[8] = v94;
  v181[9] = CFSTR("UI_Event_Milo_N_LSL_Items");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v182[9] = v92;
  v181[10] = CFSTR("UI_Event_Milo_Quality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v182[10] = v90;
  v181[11] = CFSTR("UI_Event_Milo_Quality_Reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v182[11] = v88;
  v181[12] = CFSTR("UI_Event_Milo_Time_Since_Prediction");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)fabs(v33));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v182[12] = v86;
  v181[13] = CFSTR("UI_Event_N_MiLo_Models");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v182[13] = v85;
  v181[14] = CFSTR("UI_Event_MiLo_Suspended_Reasons");
  v58 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v121, "miloProvider");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "numberWithUnsignedInteger:", objc_msgSend(v84, "miLoServiceSuspendedReasonBitmap"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v182[14] = v83;
  v181[15] = CFSTR("UI_Event_N_Candidates");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v182[15] = v81;
  v181[16] = CFSTR("UI_Event_N_Candidates_Classified_AutoRoute");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v178[3]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v182[16] = v79;
  v181[17] = CFSTR("UI_Event_N_Candidates_Classified_OneTap");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v174[3]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v182[17] = v78;
  v181[18] = CFSTR("UI_Event_N_Candidates_Classified_TopOfList");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v170[3]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v182[18] = v77;
  v181[19] = CFSTR("UI_Event_N_Candidates_Classified_Filter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v166[3]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v182[19] = v76;
  v181[20] = CFSTR("UI_Event_Selected_Candidate_Classification");
  v182[20] = v144[5];
  v181[21] = CFSTR("UI_Event_Selected_Candidate_Rule_Reason");
  v182[21] = v138[5];
  v182[22] = v107;
  v181[22] = CFSTR("UI_Event_Selected_Candidate_Type");
  v181[23] = CFSTR("UI_Event_Selected_Candidate_Eligibility");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v162[3]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v182[23] = v75;
  v181[24] = CFSTR("UI_Event_Selected_Candidate_Is_Device_Selector_Output");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v158[3]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v182[24] = v74;
  v181[25] = CFSTR("UI_Event_Selected_Candidate_Is_Device_Selector_Output_And_Eligible");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v154[3]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v182[25] = v59;
  v181[26] = CFSTR("UI_Event_Selected_Candidate_Is_UWB_Or_MiLo");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v150[3]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v182[26] = v60;
  v181[27] = CFSTR("UI_Event_Selected_Candidate_Is_Airplay_Target");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v182[27] = v61;
  v181[28] = CFSTR("UI_Event_Selected_Candidate_Was_Used_At_Home");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v49 != 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v182[28] = v62;
  v182[29] = v106;
  v181[29] = CFSTR("UI_Event_Selected_Candidate_Device_Model_Type");
  v181[30] = CFSTR("UI_Event_Selected_Candidate_Same_Space_MiLo_LSL_Items");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v55);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v182[30] = v63;
  v181[31] = CFSTR("UI_Event_Selected_Candidate_Same_Space_MiLo_Agg_Score");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v57);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v182[31] = v64;
  v181[32] = CFSTR("UI_Event_Time_To_Banner_Milli_Seconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v182[32] = v65;
  v181[33] = CFSTR("UI_Event_Is_Negative_Rules");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v182[33] = v66;
  v182[34] = v82;
  v181[34] = CFSTR("UI_Event_Mobile_Asset_Version");
  v181[35] = CFSTR("UI_Event_Is_Location_Custom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v72 == 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v182[35] = v67;
  v181[36] = CFSTR("UI_Event_Is_Widget");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v71);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v182[36] = v68;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v182, v181, 37);
  v73 = (id)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v143, 8);

  _Block_object_dispose(&v149, 8);
  _Block_object_dispose(&v153, 8);
  _Block_object_dispose(&v157, 8);
  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(&v165, 8);
  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);
  _Block_object_dispose(&v177, 8);

  return v73;
}

void __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  id v20;

  objc_msgSend(a2, "inspectionGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_21;
  v20 = v3;
  if (objc_msgSend(v3, "classification") == 4)
  {
    v4 = *(_QWORD *)(a1 + 48);
  }
  else if (objc_msgSend(v20, "classification") == 3)
  {
    v4 = *(_QWORD *)(a1 + 56);
  }
  else if (objc_msgSend(v20, "classification") == 2)
  {
    v4 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    if (objc_msgSend(v20, "classification") != 1)
      goto LABEL_11;
    v4 = *(_QWORD *)(a1 + 72);
  }
  ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
LABEL_11:
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v20, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqual:", v7);

  v3 = v20;
  if ((_DWORD)v5)
  {
    objc_msgSend(v20, "classification");
    IRCandidateClassificationToString();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v20, "classificationDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (!*(_QWORD *)(v14 + 40))
    {
      *(_QWORD *)(v14 + 40) = &stru_251046168;

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "stateMachineClassification");
    objc_msgSend(v20, "candidateSelectorReasons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstWhere:", &__block_literal_global_21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v17 != 0;

    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) >= 3uLL
       && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) != 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v18;
    if ((objc_msgSend(v20, "sameSpaceBasedOnUWB") & 1) != 0)
      v19 = 1;
    else
      v19 = objc_msgSend(v20, "sameSpaceBasedOnMiLo");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = v19;
    v3 = v20;
  }
LABEL_21:

}

uint64_t __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue");
}

uint64_t __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue");
}

BOOL __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v3, "systemState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "locationSemanticUserSpecificPlaceType") == 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_getUniqueAirplayRoutsFromCandidateIdentifiers:(id)a3 inCandiateContainer:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke;
  v14[3] = &unk_251045768;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "candidateForCandidateIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "nodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke_2;
    v6[3] = &unk_2510445A8;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    v3 = v5;
  }

}

void __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "deviceTypeExistsAirplay"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
}

@end
