@implementation SGAggregateLogging

+ (void)pushValue:(double)a3 toDistKeyWithDomain:(id)a4 suffix:(id)a5
{
  +[SGAggregateLogging pushValueForDistributionKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "pushValueForDistributionKeyWithDomain:subdomain:suffix:action:value:", a4, 0, a5, 0, (uint64_t)a3);
}

+ (void)pushValueForDistributionKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  aggdKeyForComponents(a3, a4, 0, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setKey:", v8);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackDistributionForMessage:value:", v9, (double)a7);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D19D98], v8);
  v15 = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

+ (void)addValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  id v8;

  aggdKeyForComponents(a3, a4, 0, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SGPETAddValueForScalarKey(v8, a7);

}

+ (void)setValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  aggdKeyForComponents(a3, a4, 0, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setKey:", v8);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackScalarForMessage:updateCount:", v9, a7);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D19D98], v8);
  v15 = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

+ (void)incrementValuesInDomain:(id)a3 subdomain:(id)a4 type:(id)a5 action:(id)a6 withKeysAndIncrements:(id)a7 extraSignature:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__SGAggregateLogging_PET__incrementValuesInDomain_subdomain_type_action_withKeysAndIncrements_extraSignature___block_invoke;
  v23[3] = &unk_1E7DB5740;
  v22 = v13;
  v24 = v22;
  v18 = v14;
  v25 = v18;
  v19 = v15;
  v26 = v19;
  v20 = v16;
  v27 = v20;
  objc_msgSend(a7, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (v17)
  {
    aggdKeyForComponents(v22, v18, v19, v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SGPETAddValueForScalarKey(v21, 1);

  }
}

void __110__SGAggregateLogging_PET__incrementValuesInDomain_subdomain_type_action_withKeysAndIncrements_extraSignature___block_invoke(void **a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v5 = a3;
  v9 = a2;
  if (objc_msgSend(v9, "isEqualToString:", &stru_1E7DB83A8))
    v6 = 0;
  else
    v6 = v9;
  aggdKeyForComponents(a1[4], a1[5], a1[6], v6, a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "intValue");

  SGPETAddValueForScalarKey(v7, v8);
}

+ (unint64_t)twoSigFigs:(id)a3
{
  unint64_t result;
  int v4;
  unint64_t v5;

  result = objc_msgSend(a3, "longLongValue");
  if (result >= 0x65)
  {
    v4 = 1;
    do
    {
      v5 = result;
      result /= 0xAuLL;
      ++v4;
    }
    while (v5 > 0x3F1);
    do
    {
      result *= 10;
      --v4;
    }
    while (v4 > 1);
  }
  return result;
}

+ (id)aggregateKeyForKeySuffix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(CFSTR("com.apple.suggestions"), "stringByAppendingString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v6 = CFSTR("com.apple.suggestions");
  }

  return v6;
}

+ (void)messagesAdded:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.added"), 0, a3);
}

+ (void)messagesLost:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.lost"), 0, a3);
}

+ (void)messagesPruned:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.pruned"), 0, a3);
}

+ (void)messagesFound:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.found"), 0, a3);
}

+ (void)messagesDeleted:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.deleted"), 0, a3);
}

+ (void)messagesUndisplayablyLost:(int64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.undisplayablyLost"), 0, a3);
}

+ (void)messagesFoundAfterUndisplayablyLost:(unint64_t)a3
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("messages.foundAfterUndisplayablyLost"), 0, a3);
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 by:(unint64_t)a7
{
  if (a7)
    +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, a4, a5, a6);
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, a4, a5, a6, 1);
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 by:(unint64_t)a6
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, a4, a5, 0, a6);
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, a4, a5, 0, 1);
}

+ (void)incrementKeyWithDomain:(id)a3 suffix:(id)a4
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, 0, a4, 0, 1);
}

+ (void)setKeyWithDomain:(id)a3 suffix:(id)a4 toValue:(unint64_t)a5
{
  +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, 0, a4, 0, a5);
}

+ (void)pushValue:(double)a3 toDistKeyWithSuffix:(id)a4
{
  +[SGAggregateLogging pushValueForDistributionKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "pushValueForDistributionKeyWithDomain:subdomain:suffix:action:value:", 0, 0, a4, 0, (uint64_t)a3);
}

+ (void)_pushValuesForContact:(id)a3 usingDomain:(id)a4 subdomain:(id)a5 type:(id)a6 action:(id)a7 extraSignature:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  id obj;
  id obja;
  uint64_t v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
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
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _QWORD v142[10];
  _QWORD v143[10];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v114 = a6;
  v17 = a7;
  v105 = a8;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.distribution"), v15);
  v103 = v15;
  v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.scalar"), v15);
  v19 = (double)(unint64_t)objc_msgSend(v14, "richness");
  v102 = v16;
  v113 = v17;
  v104 = (void *)v18;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@.richness"), v18, v17, v16);
  v111 = a1;
  objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", v20, v19);

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  objc_msgSend(v14, "phones");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
  if (v22)
  {
    v23 = v22;
    LODWORD(v24) = 0;
    LODWORD(v25) = 0;
    v26 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v136 != v26)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v28, "extractionInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "extractionType") == 1)
          v25 = (v25 + 1);
        else
          v25 = v25;

        objc_msgSend(v28, "extractionInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "extractionType") == 2)
          v24 = (v24 + 1);
        else
          v24 = v24;

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v106 = v14;
  objc_msgSend(v14, "emailAddresses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
  if (v32)
  {
    v33 = v32;
    LODWORD(v34) = 0;
    LODWORD(v35) = 0;
    v36 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v132 != v36)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
        objc_msgSend(v38, "extractionInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "extractionType") == 1)
          v34 = (v34 + 1);
        else
          v34 = v34;

        objc_msgSend(v38, "extractionInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "extractionType") == 2)
          v35 = (v35 + 1);
        else
          v35 = v35;

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  objc_msgSend(v106, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
  if (v41)
  {
    v42 = v41;
    LODWORD(v43) = 0;
    LODWORD(v44) = 0;
    v109 = *(_QWORD *)v128;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v128 != v109)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
        objc_msgSend(v46, "extractionInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "extractionType") == 1)
          v43 = (v43 + 1);
        else
          v43 = v43;

        objc_msgSend(v46, "extractionInfo");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v48, "extractionType") == 2)
          v44 = (v44 + 1);
        else
          v44 = v44;

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
    }
    while (v42);
  }
  else
  {
    v43 = 0;
    v44 = 0;
  }

  v143[0] = &unk_1E7E0C698;
  v142[0] = &stru_1E7DB83A8;
  v142[1] = CFSTR("phones");
  v49 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v106, "phones");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v110, "count"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v143[1] = obja;
  v142[2] = CFSTR("phones.sig");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2] = v101;
  v142[3] = CFSTR("phones.phrase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v143[3] = v100;
  v142[4] = CFSTR("emailAddresses");
  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v106, "emailAddresses");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v143[4] = v52;
  v142[5] = CFSTR("emailAddresses.sig");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v143[5] = v53;
  v142[6] = CFSTR("emailAddresses.phrase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v143[6] = v54;
  v142[7] = CFSTR("postalAddresses");
  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v106, "postalAddresses");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v143[7] = v57;
  v142[8] = CFSTR("postalAddresses.sig");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v143[8] = v58;
  v142[9] = CFSTR("postalAddresses.phrase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v143[9] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 10);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v111, "incrementValuesInDomain:subdomain:type:action:withKeysAndIncrements:extraSignature:", v112, v102, v114, v113, v60, v105);
  objc_msgSend(v106, "phones");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (double)(unint64_t)objc_msgSend(v61, "count");
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.phones"), v104);
  objc_msgSend(v111, "pushValue:toDistKeyWithSuffix:", v63, v62);

  objc_msgSend(v106, "emailAddresses");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (double)(unint64_t)objc_msgSend(v64, "count");
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.emailAddresses"), v104);
  objc_msgSend(v111, "pushValue:toDistKeyWithSuffix:", v66, v65);

  objc_msgSend(v106, "postalAddresses");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (double)(unint64_t)objc_msgSend(v67, "count");
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.postalAddresses"), v104);
  objc_msgSend(v111, "pushValue:toDistKeyWithSuffix:", v69, v68);

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend(v106, "phones");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v124;
    do
    {
      for (m = 0; m != v72; ++m)
      {
        if (*(_QWORD *)v124 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * m);
        objc_msgSend(v75, "label");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          v77 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v75, "label");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend(v77, "initWithFormat:", CFSTR("%@.phones.%@"), v114, v78);
          objc_msgSend(v111, "incrementKeyWithDomain:subdomain:suffix:action:", v112, v102, v79, v113);

        }
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
    }
    while (v72);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  objc_msgSend(v106, "emailAddresses");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v120;
    do
    {
      for (n = 0; n != v82; ++n)
      {
        if (*(_QWORD *)v120 != v83)
          objc_enumerationMutation(v80);
        v85 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * n);
        objc_msgSend(v85, "label");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (v86)
        {
          v87 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v85, "label");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("%@.emailAddresses.%@"), v114, v88);
          objc_msgSend(v111, "incrementKeyWithDomain:subdomain:suffix:action:", v112, v102, v89, v113);

        }
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
    }
    while (v82);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  objc_msgSend(v106, "postalAddresses");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v116;
    do
    {
      for (ii = 0; ii != v92; ++ii)
      {
        if (*(_QWORD *)v116 != v93)
          objc_enumerationMutation(v90);
        v95 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * ii);
        objc_msgSend(v95, "label");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
        {
          v97 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v95, "label");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (void *)objc_msgSend(v97, "initWithFormat:", CFSTR("%@.postalAddresses.%@"), v114, v98);
          objc_msgSend(v111, "incrementKeyWithDomain:subdomain:suffix:action:", v112, v102, v99, v113);

        }
      }
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
    }
    while (v92);
  }

}

+ (void)performedAction:(id)a3 onRecordForContact:(id)a4
{
  objc_msgSend(a1, "_pushValuesForContact:usingDomain:subdomain:type:action:extraSignature:", a4, CFSTR("behavior"), CFSTR("contacts"), CFSTR("contact"), a3, 0);
}

+ (void)performedAction:(id)a3 onDetail:(id)a4 forContact:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "extractionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extractionType");
  SGExtractionTypeDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = CFSTR("phone");
  }
  else
  {
    v12 = objc_opt_respondsToSelector();
    v11 = CFSTR("emailAddress");
    if ((v12 & 1) != 0)
      v11 = CFSTR("postalAddress");
  }
  v14[0] = &stru_1E7DB83A8;
  v14[1] = v11;
  v15[0] = &unk_1E7E0C698;
  v15[1] = &unk_1E7E0C698;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "incrementValuesInDomain:subdomain:type:action:withKeysAndIncrements:extraSignature:", CFSTR("behavior.scalar"), CFSTR("contacts"), CFSTR("detail"), v8, v13, v10);

}

+ (void)performedAction:(id)a3 forApp:(id)a4 onContact:(id)a5
{
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v14, "state") == 1)
  {
    v10 = CFSTR("contact");
  }
  else if (objc_msgSend(v14, "state") == 2)
  {
    v10 = CFSTR("contactUpdate");
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v14, "extractionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extractionType");
  SGExtractionTypeDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pushValuesForContact:usingDomain:subdomain:type:action:extraSignature:", v13, CFSTR("behavior"), v8, v10, v9, v12);

}

+ (void)performedAction:(id)a3 onEventInCalendar:(id)a4
{
  objc_msgSend(a1, "performedAction:forApp:onEvent:", a3, CFSTR("calendarApp"), a4);
}

+ (void)performedAction:(id)a3 forApp:(id)a4 onEvent:(id)a5
{
  id v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v21 = a4;
  v7 = a5;
  v8 = objc_msgSend(v7, "state") - 1;
  if (v8 > 5)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E7DAF9C8[v8];
  v19 = v9;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E7E0C698, &stru_1E7DB83A8);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D197F0], "resolveName:", v17, v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "tracked"))
          objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E7E0C698, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "incrementValuesInDomain:subdomain:type:action:withKeysAndIncrements:extraSignature:", CFSTR("behavior.scalar"), v21, v19, v22, v10, 0);
}

+ (id)_appNameForApp:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("messagesApp");
  if (a3)
    return (id)v3;
  else
    return CFSTR("mailApp");
}

+ (void)eventsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a1, "_appNameForApp:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "app:performedAction:onEvents:withResult:elapsedTime:", v9, CFSTR("suggest"), v8, CFSTR("banner"), a4);

}

+ (void)app:(id)a3 performedAction:(id)a4 onEvents:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 && objc_msgSend(v13, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("events.%@s"), v14);
    objc_msgSend(a1, "incrementKeyWithDomain:subdomain:suffix:action:", CFSTR("behavior.scalar"), v11, v15, v12);

    v16 = (double)(unint64_t)objc_msgSend(v13, "count");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("behavior.distribution.%@.%@.events"), v12, v11);
    objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", v17, v16);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(a1, "performedAction:forApp:onEvent:", v12, v11, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

  }
}

+ (void)contactsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a1, "_appNameForApp:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "app:performedAction:onContacts:withResult:elapsedTime:", v9, CFSTR("suggest"), v8, CFSTR("banner"), a4);

}

+ (void)app:(id)a3 performedAction:(id)a4 onContacts:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 && objc_msgSend(v13, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("contacts.%@s"), v14);
    objc_msgSend(a1, "incrementKeyWithDomain:subdomain:suffix:action:", CFSTR("behavior.scalar"), v11, v15, v12);

    v16 = (double)(unint64_t)objc_msgSend(v13, "count");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("behavior.distribution.%@.%@.contacts"), v12, v11);
    objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", v17, v16);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(a1, "performedAction:forApp:onContact:", v12, v11, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

  }
}

+ (void)eventConfirmed:(id)a3 inApp:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_appNameForApp:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performedAction:forApp:onEvent:", CFSTR("confirm"), v7, v6);

}

+ (void)eventRejected:(id)a3 inApp:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_appNameForApp:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performedAction:forApp:onEvent:", CFSTR("reject"), v7, v6);

}

+ (void)eventConfirmedByRecord:(id)a3
{
  objc_msgSend(a1, "performedAction:onEventInCalendar:", CFSTR("confirm"), a3);
}

+ (void)eventRejectedByRecord:(id)a3
{
  objc_msgSend(a1, "performedAction:onEventInCalendar:", CFSTR("reject"), a3);
}

+ (void)contactConfirmed:(id)a3 inApp:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_appNameForApp:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performedAction:forApp:onContact:", CFSTR("confirm"), v7, v6);

}

+ (void)contactRejected:(id)a3 inApp:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_appNameForApp:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performedAction:forApp:onContact:", CFSTR("reject"), v7, v6);

}

+ (void)detail:(id)a3 confirmedForContact:(id)a4
{
  objc_msgSend(a1, "performedAction:onDetail:forContact:", CFSTR("confirm"), a3, a4);
}

+ (void)detail:(id)a3 rejectedForContact:(id)a4
{
  objc_msgSend(a1, "performedAction:onDetail:forContact:", CFSTR("reject"), a3, a4);
}

+ (void)recordConfirmedForContact:(id)a3
{
  objc_msgSend(a1, "performedAction:onRecordForContact:", CFSTR("confirm"), a3);
}

+ (void)recordRejectedForContact:(id)a3
{
  objc_msgSend(a1, "performedAction:onRecordForContact:", CFSTR("reject"), a3);
}

+ (void)harvestDrainedNumberOfMails:(int)a3
{
  objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", CFSTR("mailsDrainedPerHarvest"), (double)a3);
  if (a3 >= 1)
  {
    +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("harvestDrainedSomethingFromQueue"), 0, 1);
    +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("mailsDrained"), 0, a3);
  }
}

+ (void)harvestedMessageInQueueSince:(double)a3
{
  objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", CFSTR("messageTimeSpentInQueue"), fmax(CFAbsoluteTimeGetCurrent() - a3, 0.0));
}

+ (id)eventsFromEntity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "enrichments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v5 = v3;
  sgMapAndFilter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contactsFromEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SGSocialProfileDetails *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SGSocialProfileDetails *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D198C8], "originWithType:sourceKey:externalKey:fromForwardedMessage:", 0, 0, 0, 0);
  v37 = v3;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v3, "enrichments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v51)
  {
    v46 = 0;
    v47 = 0;
    v5 = 0;
    v44 = v4;
    v45 = 0;
    v48 = 0;
    v50 = *(_QWORD *)v53;
LABEL_3:
    v6 = 0;
    while (2)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(v4);
      v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v6);
      objc_msgSend(v7, "duplicateKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "entityType");

      switch(v9)
      {
        case 4:
          objc_msgSend(v7, "title");
          v11 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "extractionInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGNames sgNameFromString:origin:recordId:extractionInfo:](SGNames, "sgNameFromString:origin:recordId:extractionInfo:", v11, v38, v49, v12);
          v13 = v46;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 5:
        case 8:
          if (!v5)
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v10 = (void *)MEMORY[0x1E0D197E0];
          objc_msgSend(v7, "title");
          v11 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "extractionInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "emailAddress:label:extractionInfo:withRecordId:", v11, 0, v12, v49);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v5;
          goto LABEL_22;
        case 6:
          if (!v47)
            v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v30 = (void *)MEMORY[0x1E0D198D8];
          objc_msgSend(v7, "title");
          v11 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "extractionInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "phoneNumber:label:extractionInfo:recordId:", v11, 0, v12, v49);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v47;
LABEL_22:
          objc_msgSend(v14, "addObject:", v13);
          goto LABEL_23;
        case 7:
          v27 = v45;
          if (!v45)
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(MEMORY[0x1E0D198E8], "components:city:state:postalCode:country:", 0, 0, 0, 0, 0);
          v11 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0D198E0];
          objc_msgSend(v7, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "extractionInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "postalAddress:components:label:extractionInfo:recordId:", v12, v11, 0, v13, v49);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v27;
          objc_msgSend(v27, "addObject:", v29);

          v4 = v44;
          goto LABEL_23;
        default:
          if (v9 != 19)
            goto LABEL_25;
          v15 = (uint64_t)v48;
          if (!v48)
            v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v48 = (void *)v15;
          v16 = [SGSocialProfileDetails alloc];
          objc_msgSend(v7, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SGSocialProfileDetails initWithSerialized:](v16, "initWithSerialized:", v17);

          if (v11)
          {
            v42 = objc_alloc(MEMORY[0x1E0D19948]);
            -[SGSocialProfileDetails username](v11, "username");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGSocialProfileDetails userIdentifier](v11, "userIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGSocialProfileDetails bundleIdentifier](v11, "bundleIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGSocialProfileDetails displayName](v11, "displayName");
            v18 = objc_claimAutoreleasedReturnValue();
            -[SGSocialProfileDetails service](v11, "service");
            v19 = objc_claimAutoreleasedReturnValue();
            -[SGSocialProfileDetails teamIdentifier](v11, "teamIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "duplicateKey");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "contactDetailKey");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "label");
            v43 = v5;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "extractionInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v18;
            v24 = (void *)v18;
            v25 = (void *)v19;
            v26 = (void *)objc_msgSend(v42, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:label:extractionInfo:recordId:", v12, v13, v40, v23, v19, v20, v21, v22, v49);
            objc_msgSend(v48, "addObject:", v26);

            v4 = v44;
            v5 = v43;

LABEL_23:
          }

LABEL_25:
          if (v51 != ++v6)
            continue;
          v51 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          if (!v51)
            goto LABEL_29;
          goto LABEL_3;
      }
    }
  }
  v46 = 0;
  v47 = 0;
  v5 = 0;
  v45 = 0;
  v48 = 0;
LABEL_29:

  if (v46 || v5 || v47 || v45 || v48)
  {
    v33 = v48;
    objc_msgSend(MEMORY[0x1E0D197B0], "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:", v49, v46, v5, v47, v45, v48);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D198F8], "realtimeContactForNewContact:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v37;
  }
  else
  {
    v31 = 0;
    v32 = v37;
    v33 = 0;
  }

  return v31;
}

+ (void)harvestedEntity:(id)a3 withElapsedTime:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a1, "eventsFromEntity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "app:performedAction:onEvents:withResult:elapsedTime:", CFSTR("suggestd"), CFSTR("harvest"), v7, CFSTR("record"), a4);

  objc_msgSend(a1, "contactsFromEntity:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "app:performedAction:onContacts:withResult:elapsedTime:", CFSTR("suggestd"), CFSTR("harvest"), v8, CFSTR("record"), a4);
}

+ (void)identityGroupSize:(unint64_t)a3
{
  objc_msgSend(a1, "pushValue:toDistKeyWithSuffix:", CFSTR("identityGroupSize"), (double)a3);
}

+ (void)reMatched:(id)a3
{
  id v3;
  int has_internal_diagnostics;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v6 = v3;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v3 = v6;
    if (has_internal_diagnostics)
    {
      objc_msgSend(v6, "hashId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      fastIncrementBy(&reMatched__count, 1, CFSTR("re"), v5);

      v3 = v6;
    }
  }

}

+ (void)suggestionImpressionsViaBanner:(int)a3
{
  fastIncrementBy(&suggestionImpressionsViaBanner__count, a3, 0, CFSTR("impressions.suggestion.banner"));
}

+ (void)suggestionImpressionsViaBannerSuppressed:(int)a3
{
  fastIncrementBy(&suggestionImpressionsViaBannerSuppressed__count, a3, 0, CFSTR("impressions.suggestion.banner.suppressed"));
}

+ (void)hypotheticalSuggestionImpressionsIncludingActedOn:(int)a3
{
  fastIncrementBy(&hypotheticalSuggestionImpressionsIncludingActedOn__count, a3, 0, CFSTR("impressions.suggestion.banner.hypotheticalIncludingActedOn"));
}

+ (void)eventSuggestionImpressionsViaBanner:(int)a3
{
  fastIncrementBy(&eventSuggestionImpressionsViaBanner__count, a3, 0, CFSTR("impressions.suggestion.banner.event"));
}

+ (void)contactSuggestionImpressionsViaBanner:(int)a3
{
  fastIncrementBy(&contactSuggestionImpressionsViaBanner__count, a3, 0, CFSTR("impressions.suggestion.banner.contact"));
}

+ (void)hypotheticalContactSuggestionImpressionsIncludingInsignificant:(int)a3
{
  fastIncrementBy((unsigned int *)&hypotheticalContactSuggestionImpressionsIncludingInsignificant__count, a3, 0, CFSTR("impressions.suggestion.banner.hypotheticalContactIncludingInsignificant"));
}

+ (void)assetVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  +[SGAsset asset](SGAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetVersion");

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = v3;
  +[SGAggregateLogging assetVersion:](SGAggregateLogging, "assetVersion:", v4);
}

+ (void)assetVersion:(int64_t)a3
{
  +[SGAggregateLogging setValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "setValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, CFSTR("assetVersion"), 0, a3);
}

+ (void)databaseCorruptionDetectedViaIntegrityCheck
{
  objc_msgSend(a1, "incrementKeyWithDomain:subdomain:suffix:", CFSTR("database"), CFSTR("corruption"), CFSTR("integrity_check"));
}

+ (void)databaseCorruptionDetectedViaCorruptionMarker
{
  objc_msgSend(a1, "incrementKeyWithDomain:subdomain:suffix:", CFSTR("database"), CFSTR("corruption"), CFSTR("corruption_marker"));
}

+ (void)contactsFoundOnDeviceEnabled:(BOOL)a3
{
  +[SGAggregateLogging setValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "setValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, 0, CFSTR("contactsFoundOnDeviceEnabled"), a3);
}

+ (void)eventsFoundOnDeviceEnabled:(BOOL)a3
{
  +[SGAggregateLogging setValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "setValueForScalarKeyWithDomain:subdomain:suffix:action:value:", 0, 0, 0, CFSTR("eventsFoundOnDeviceEnabled"), a3);
}

id __39__SGAggregateLogging_eventsFromEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isEvent"))
  {
    v4 = (void *)MEMORY[0x1E0D198C8];
    objc_msgSend(*(id *)(a1 + 32), "duplicateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 0, 0, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "tags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "tags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v17, "tracked"))
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v18 = (void *)MEMORY[0x1E0D19900];
    v19 = (void *)MEMORY[0x1E0D19800];
    objc_msgSend(MEMORY[0x1E0D19920], "recordIdForEventWithRowId:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = 0;
    objc_msgSend(v19, "eventWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tags:URL:", v20, v8, 0, 0, 0, 0, 0, 0, 0, 0, v24, 0, 0, 0, v11, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "realtimeEventForNewEvent:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
