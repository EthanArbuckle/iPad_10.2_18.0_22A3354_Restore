@implementation IdentifierGroupingUtils

+ (id)getInterpretationGroupMax:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "identifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasInterpretationGroup") & 1) != 0)
        {
          if (!v7
            || (v11 = objc_msgSend(v10, "interpretationGroup"), v11 > objc_msgSend(v7, "unsignedIntValue")))
          {
            v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", objc_msgSend(v10, "interpretationGroup"));

            v7 = (void *)v12;
          }
        }
        else
        {
          objc_msgSend(v10, "setInterpretationGroup:", 0);
          if (!v7)
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createIdentifier:(unsigned int)a3 interpretationGroupIndex:(unsigned int)a4 nodeIndex:(unsigned int)a5 spanIdentifier:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "copyTo:", v10);
  objc_msgSend(v10, "setNodeIndex:", v6);
  objc_msgSend(v10, "setInterpretationGroup:", v7);
  LODWORD(v6) = objc_msgSend(v9, "groupIndex");

  objc_msgSend(v10, "setGroupIndex:", v6 + a3);
  return v10;
}

+ (id)getTokenIndexIdentifier:(unsigned int)a3 interpretationGroup:(unsigned int)a4 nodeIndex:(unsigned int)a5 span:(id)a6 spanIdentifier:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v30[3] = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  objc_msgSend(a1, "createIdentifier:interpretationGroupIndex:nodeIndex:spanIdentifier:", v10, v9, v8, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("endTokenIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "endTokenIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v29[1] = CFSTR("startTokenIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "startTokenIndex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v15;
  v29[2] = CFSTR("value");
  objc_msgSend(v12, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v30[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v17, 2, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  if (v18)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v18, 4);
    objc_msgSend(v13, "setValue:", v20);

    v21 = objc_alloc_init(MEMORY[0x24BE9E060]);
    -[NSObject setValue:](v21, "setValue:", *MEMORY[0x24BEA3928]);
    objc_msgSend(v13, "setNamespaceA:", v21);
    objc_msgSend(v13, "setBackingAppBundleId:", *MEMORY[0x24BEA3888]);
    objc_msgSend(v13, "setProbability:", 0);
    v22 = v13;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[IdentifierGroupingUtils getTokenIndexIdentifier:interpretationGroup:nodeIndex:span:spanIdentifier:]";
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s Unable to parse MatchingSpan token index JSON: %@", buf, 0x16u);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)limitAlignments:(id)a3 alignmentSpanDict:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v11, "getStartIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v11, "getEndIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);
          objc_msgSend(v31, "addObject:", v15);
        }
        objc_msgSend(v16, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "sortAlignmentDict:orderedIndexes:alignmentSpanDict:", v6, v31, v30);
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  while ((unint64_t)objc_msgSend(v17, "count") <= 0xB)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v31;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (!v19)
    {

      break;
    }
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v18);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24 && objc_msgSend(v24, "count"))
        {
          objc_msgSend(v25, "objectAtIndex:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v26);

          objc_msgSend(v25, "removeObjectAtIndex:", 0);
          v21 = 1;
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v20);

    if ((v21 & 1) == 0)
      break;
  }
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compareStartAndSize_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (void)sortAlignmentDict:(id)a3 orderedIndexes:(id)a4 alignmentSpanDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && (unint64_t)objc_msgSend(v15, "count") >= 2)
        {
          v17[0] = v13;
          v17[1] = 3221225472;
          v17[2] = __78__IdentifierGroupingUtils_sortAlignmentDict_orderedIndexes_alignmentSpanDict___block_invoke;
          v17[3] = &unk_24DCAB770;
          v18 = v9;
          objc_msgSend(v16, "sortUsingComparator:", v17);

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

+ (void)createIdentifierGroups:(id)a3 alignmentSpanDict:(id)a4 identifiers:(id)a5 nodeIndex:(unsigned int)a6 interpretationGroupCurrentMax:(id)a7 tagSpans:(id)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  char v44;
  id v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  int v64;
  void *v65;
  unsigned int v66;
  void *v67;
  id v68;
  id obj;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  char v90;
  uint64_t v91;
  id v92;
  id v93;
  char v94;
  uint64_t v95;
  id v96;
  unsigned int v97;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
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
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint8_t v129[128];
  uint8_t buf[4];
  const char *v131;
  __int16 v132;
  _BYTE v133[14];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v76 = a4;
  v96 = a5;
  v68 = a7;
  v13 = a8;
  v14 = v12;
  v74 = v13;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v70 = v12;
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compareStartAndSize_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v15, "count") < 0xD)
    {
      v19 = v15;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v131 = "+[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGr"
               "oupCurrentMax:tagSpans:]";
        v132 = 1024;
        *(_DWORD *)v133 = 12;
        *(_WORD *)&v133[4] = 2112;
        *(_QWORD *)&v133[6] = v15;
        _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s Limiting the number span alignments to %d when creating interpretation groups. Given %@", buf, 0x1Cu);
      }

      objc_msgSend(a1, "limitAlignments:alignmentSpanDict:", v15, v76);
      v17 = objc_claimAutoreleasedReturnValue();

      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v131 = "+[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGr"
               "oupCurrentMax:tagSpans:]";
        v132 = 2112;
        *(_QWORD *)v133 = v17;
        _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Interpretation group span alignments after limiting: %@", buf, 0x16u);
      }

      v19 = (void *)v17;
    }
    objc_msgSend(a1, "getInterpretationGroups:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
      v97 = objc_msgSend(v68, "unsignedIntValue") + 1;
    else
      v97 = 0;
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    obj = v20;
    v14 = v12;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    if (v72)
    {
      v71 = *(_QWORD *)v121;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v121 != v71)
          {
            v22 = v21;
            objc_enumerationMutation(obj);
            v21 = v22;
          }
          v73 = v21;
          v23 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v21);
          v116 = 0u;
          v117 = 0u;
          v118 = 0u;
          v119 = 0u;
          v24 = v23;
          v78 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
          if (v78)
          {
            v82 = 0;
            v25 = 0;
            v77 = *(_QWORD *)v117;
            v75 = v24;
            while (1)
            {
              for (i = 0; i != v78; ++i)
              {
                if (*(_QWORD *)v117 != v77)
                  objc_enumerationMutation(v24);
                v27 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "objectForKeyedSubscript:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v29, "usoGraph");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v30)
                  goto LABEL_81;
                v79 = v30;
                v80 = i;
                v114 = 0u;
                v115 = 0u;
                v112 = 0u;
                v113 = 0u;
                objc_msgSend(v30, "identifiers");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
                if (!v32)
                {

                  v35 = 0;
                  v44 = 0;
                  goto LABEL_47;
                }
                v33 = v32;
                v92 = v31;
                v34 = 0;
                v94 = 0;
                v90 = 0;
                v35 = 0;
                v36 = *(_QWORD *)v113;
                do
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v113 != v36)
                      objc_enumerationMutation(v92);
                    v38 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
                    v39 = objc_msgSend(v38, "nodeIndex");
                    if (v39 == objc_msgSend(v27, "nodeIndex"))
                    {
                      if ((v34 & 1) != 0)
                        goto LABEL_35;
                      if (objc_msgSend(v29, "hasInput"))
                      {
                        objc_msgSend(a1, "getTokenIndexIdentifier:interpretationGroup:nodeIndex:span:spanIdentifier:", v25, v97, a6, v29, v38);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v40)
                          objc_msgSend(v96, "addObject:", v40);

LABEL_35:
                        v34 = 1;
                      }
                      else
                      {
                        v34 = 0;
                      }
                      objc_msgSend(a1, "createIdentifier:interpretationGroupIndex:nodeIndex:spanIdentifier:", v25, v97, a6, v38);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = objc_msgSend(v38, "groupIndex");
                      if (v35 <= v42)
                        v35 = v42;
                      objc_msgSend(v96, "addObject:", v41);
                      v94 |= objc_msgSend(v38, "sourceComponent") == 1;

                      v90 = 1;
                      v82 = 1;
                      continue;
                    }
                  }
                  v33 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
                }
                while (v33);

                if ((v90 & 1) != 0)
                  v43 = v35 + 1;
                else
                  v43 = 0;
                v25 = v43 + v25;
                v24 = v75;
                v44 = v94;
LABEL_47:
                if ((v82 & 1) != 0 && (v44 & 1) == 0)
                {
                  v110 = 0u;
                  v111 = 0u;
                  v108 = 0u;
                  v109 = 0u;
                  v45 = v74;
                  v83 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
                  if (v83)
                  {
                    v46 = 0;
                    v81 = *(_QWORD *)v109;
                    v86 = v27;
                    v87 = v29;
                    v85 = v45;
                    do
                    {
                      v47 = 0;
                      do
                      {
                        if (*(_QWORD *)v109 != v81)
                        {
                          v48 = v47;
                          objc_enumerationMutation(v45);
                          v47 = v48;
                        }
                        v84 = v47;
                        v49 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v47);
                        v104 = 0u;
                        v105 = 0u;
                        v106 = 0u;
                        v107 = 0u;
                        v89 = v49;
                        objc_msgSend(v49, "usoGraph");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v50, "alignments");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();

                        v93 = v51;
                        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
                        if (v52)
                        {
                          v53 = v52;
                          v54 = *(_QWORD *)v105;
                          v88 = *(_QWORD *)v105;
                          do
                          {
                            v55 = 0;
                            v91 = v53;
                            do
                            {
                              if (*(_QWORD *)v105 != v54)
                                objc_enumerationMutation(v93);
                              v56 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v55);
                              if (objc_msgSend(v56, "equalIndexes:", v27))
                              {
                                v95 = v55;
                                v102 = 0u;
                                v103 = 0u;
                                v100 = 0u;
                                v101 = 0u;
                                objc_msgSend(v89, "usoGraph");
                                v57 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v57, "identifiers");
                                v58 = (void *)objc_claimAutoreleasedReturnValue();

                                v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
                                if (v59)
                                {
                                  v60 = v59;
                                  v61 = *(_QWORD *)v101;
                                  do
                                  {
                                    for (k = 0; k != v60; ++k)
                                    {
                                      if (*(_QWORD *)v101 != v61)
                                        objc_enumerationMutation(v58);
                                      v63 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
                                      v64 = objc_msgSend(v63, "nodeIndex");
                                      if (v64 == objc_msgSend(v56, "nodeIndex"))
                                      {
                                        objc_msgSend(a1, "createIdentifier:interpretationGroupIndex:nodeIndex:spanIdentifier:", v25, v97, a6, v63);
                                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                                        v66 = objc_msgSend(v63, "groupIndex");
                                        if (v35 <= v66)
                                          v35 = v66;
                                        objc_msgSend(v96, "addObject:", v65);

                                        v46 = 1;
                                      }
                                    }
                                    v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
                                  }
                                  while (v60);
                                }

                                v27 = v86;
                                v29 = v87;
                                v45 = v85;
                                v54 = v88;
                                v53 = v91;
                                v55 = v95;
                              }
                              ++v55;
                            }
                            while (v55 != v53);
                            v53 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
                          }
                          while (v53);
                        }

                        v47 = v84 + 1;
                      }
                      while (v84 + 1 != v83);
                      v83 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
                    }
                    while (v83);

                    if ((v46 & 1) != 0)
                      v25 = v25 + v35 + 1;
                    v24 = v75;
                  }
                  else
                  {

                  }
                }
                v30 = v79;
                i = v80;
LABEL_81:

              }
              v78 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
              if (!v78)
              {

                v97 += v82 & 1;
                v14 = v70;
                goto LABEL_85;
              }
            }
          }

LABEL_85:
          v21 = v73 + 1;
        }
        while (v73 + 1 != v72);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
      }
      while (v72);
    }

  }
}

+ (void)createNonOverlapping:(id)a3 interpretationGroup:(id)a4 start:(unint64_t)a5 interpretationGroups:(id)a6
{
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a6;
  if ((unint64_t)objc_msgSend(v11, "count") <= 0x1F)
  {
    if (objc_msgSend(v17, "count") <= a5)
      goto LABEL_12;
    if (objc_msgSend(v17, "count") <= a5)
      goto LABEL_11;
    v12 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "overlaps:", v14);

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v16, "addObject:", v13);
        if ((objc_msgSend(MEMORY[0x24BE9E190], "subset:of:", v16, v11) & 1) == 0)
        {
          objc_msgSend(a1, "createNonOverlapping:interpretationGroup:start:interpretationGroups:", v17, v16, a5 + 1, v11);
          v12 = 1;
        }

      }
      ++a5;
    }
    while (a5 < objc_msgSend(v17, "count"));
    if ((v12 & 1) == 0)
    {
LABEL_11:
      if ((unint64_t)objc_msgSend(v11, "count") <= 0x1F)
      {
LABEL_12:
        if ((objc_msgSend(MEMORY[0x24BE9E190], "subset:of:", v10, v11) & 1) == 0)
          objc_msgSend(v11, "addObject:", v10);
      }
    }
  }

}

+ (id)getInterpretationGroups:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, 0);

      objc_msgSend(a1, "createNonOverlapping:interpretationGroup:start:interpretationGroups:", v4, v9, ++v6, v5);
    }
    while (v6 < objc_msgSend(v4, "count"));
  }

  return v5;
}

uint64_t __78__IdentifierGroupingUtils_sortAlignmentDict_orderedIndexes_alignmentSpanDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a3;
  objc_msgSend(v6, "valueWithNonretainedObject:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13 = !+[CDMServiceGraphUtil spanHasMatcherName:matchingSpan:](CDMServiceGraphUtil, "spanHasMatcherName:matchingSpan:", 3, v9);
    if (v12)
    {
LABEL_3:
      v14 = +[CDMServiceGraphUtil spanHasMatcherName:matchingSpan:](CDMServiceGraphUtil, "spanHasMatcherName:matchingSpan:", 3, v12);
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 1;
    if (v12)
      goto LABEL_3;
  }
  v14 = 0;
LABEL_6:
  if (v13 | v14)
    v15 = v13 & v14;
  else
    v15 = -1;

  return v15;
}

@end
