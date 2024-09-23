@implementation FHPaymentRingSuggestionController

- (FHPaymentRingSuggestionController)init
{
  FHPaymentRingSuggestionController *v2;
  FHSearchSuggestionController *v3;
  FHSearchSuggestionController *searchController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHPaymentRingSuggestionController;
  v2 = -[FHPaymentRingSuggestionController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FHSearchSuggestionController);
    searchController = v2->_searchController;
    v2->_searchController = v3;

  }
  return v2;
}

- (id)generatePaymentRingSuggestionsFromConvertedObjects:(id)a3 previousStatementPaymentsSum:(id)a4 currentStatementPaymentsSum:(id)a5 statementPurchasesSum:(id)a6 merchantCategoryTransactionSums:(id)a7 billPaymentSelectedSuggestedAmountData:(id)a8 isMonthZero:(BOOL)a9 isMonthOne:(BOOL)a10
{
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  RequestFromPKAccountSummary(a3, a4, a5, a6, a7, a8, a9, a10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHPaymentRingSuggestionController generatePaymentRingSuggestion:](self, "generatePaymentRingSuggestion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ResponseToPKBillPaymentSuggestion(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FinHealthLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymen"
          "tsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSug"
          "gestedAmountData:isMonthZero:isMonthOne:]";
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_228295000, v14, OS_LOG_TYPE_DEBUG, "%s FinHealth final suggestions: %@", (uint8_t *)&v17, 0x16u);

  }
  return v13;
}

- (id)generatePaymentRingSuggestion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSArray *v16;
  NSArray *previousSelectedSuggestion;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v40;
  NSArray *v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  BOOL v73;
  _BOOL4 v74;
  void *v75;
  uint64_t v76;
  dispatch_semaphore_t v77;
  FHSearchSuggestionController *searchController;
  NSObject *v79;
  dispatch_time_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _BOOL4 v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t k;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t m;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  NSObject *v150;
  id v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[4];
  NSObject *v185;
  uint64_t *v186;
  id v187;
  id v188;
  uint64_t v189;
  void *v190;
  _QWORD v191[5];
  id v192;
  id v193;
  uint64_t *v194;
  _BYTE *v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t (*v203)(uint64_t, uint64_t);
  void (*v204)(uint64_t);
  id v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  uint8_t v209[128];
  uint8_t v210[4];
  id v211;
  __int16 v212;
  uint64_t v213;
  __int16 v214;
  uint64_t v215;
  __int16 v216;
  uint64_t v217;
  _BYTE buf[24];
  uint64_t (*v219)(uint64_t, uint64_t);
  void (*v220)(uint64_t);
  id v221;
  uint64_t v222;

  v222 = *MEMORY[0x24BDAC8D0];
  v167 = a3;
  objc_msgSend(v167, "currentStatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remainingMinimumPayment");
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remainingStatementBalance");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentBalance");
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statementBalance");
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creditLimit");
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openingDate");
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closingDate");
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v167, "currentStatement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isMonthZero");

  objc_msgSend(v167, "currentStatement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isMonthOne");

  objc_msgSend(v167, "currentStatement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isMonthOfMerge");

  objc_msgSend(v167, "paymentDetails");
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  previousSelectedSuggestion = self->_previousSelectedSuggestion;
  self->_previousSelectedSuggestion = v16;

  v200 = 0;
  v201 = &v200;
  v202 = 0x3032000000;
  v203 = __Block_byref_object_copy_;
  v204 = __Block_byref_object_dispose_;
  v205 = (id)objc_opt_new();
  if (v166)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v166, "compare:", v18) == 1;

  }
  else
  {
    v19 = 0;
  }
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v165)
  {
    if (v164)
    {
      objc_msgSend(MEMORY[0x24BDD1518], "zero");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v164, "isEqualToNumber:", v21);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(v165, "decimalNumberByDividingBy:", v164);
        v23 = objc_claimAutoreleasedReturnValue();

        v161 = (void *)v23;
      }
    }
  }
  if (v15)
  {
    objc_msgSend(v167, "currentStatement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "combinedBalance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      v27 = objc_alloc(MEMORY[0x24BE31610]);
      objc_msgSend(v167, "currentStatement");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "combinedBalance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v27, "initWithAmount:category:", v29, 31);

      objc_msgSend(v20, "addObject:", v30);
      goto LABEL_18;
    }
  }
  if (((v11 | v13) & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v167, "previousStatementPaymentsSum");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_14;
  objc_msgSend(v167, "previousStatementPaymentsSum");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[FHPaymentRingSuggestionController _fhEqualObjects:obj2:](self, "_fhEqualObjects:obj2:", v32, v33);

  if (v34)
  {
LABEL_14:
    FinHealthLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v167, "description");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v36;
      _os_log_impl(&dword_228295000, v35, OS_LOG_TYPE_DEBUG, "%s Request %@", buf, 0x16u);

    }
    -[FHPaymentRingSuggestionController _zerothOrFirstMonthPaymentRingSuggestionsForList:](self, "_zerothOrFirstMonthPaymentRingSuggestionsForList:", v167);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v37);

    goto LABEL_17;
  }
  if (-[FHPaymentRingSuggestionController _allMandatoryValuesAreSameAmount:](self, "_allMandatoryValuesAreSameAmount:", v167))
  {
LABEL_17:
    v30 = 0;
    goto LABEL_18;
  }
  v196 = 0;
  v197 = &v196;
  v198 = 0x2020000000;
  v199 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v219 = __Block_byref_object_copy_;
  v220 = __Block_byref_object_dispose_;
  v221 = 0;
  v40 = MEMORY[0x24BDAC760];
  if (v19)
  {
    v41 = self->_previousSelectedSuggestion;
    v191[0] = MEMORY[0x24BDAC760];
    v191[1] = 3221225472;
    v191[2] = __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke;
    v191[3] = &unk_24F0DDC18;
    v194 = &v196;
    v191[4] = self;
    v192 = v167;
    v193 = v166;
    v195 = buf;
    -[NSArray enumerateObjectsUsingBlock:](v41, "enumerateObjectsUsingBlock:", v191);

    v42 = v197[3];
  }
  else
  {
    v42 = 18;
    v199 = 18;
  }
  self->_isOnPlanCompletion = v42 == 13;
  objc_msgSend(v167, "previousStatementPaymentsSum");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = !self->_isOnPaymentPlan;

    if (v44)
    {
      v46 = objc_alloc(MEMORY[0x24BE31610]);
      objc_msgSend(v167, "previousStatementPaymentsSum");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v46, "initWithAmount:category:", v47, 2);

      objc_msgSend(v20, "addObject:", v45);
    }
    else
    {
      v45 = 0;
    }
  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v167, "statementPurchasesSum");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_30;
  objc_msgSend(v167, "statementPurchasesSum");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[FHPaymentRingSuggestionController _fhEqualObjects:obj2:](self, "_fhEqualObjects:obj2:", v49, v50);

  if (!v51)
  {
    objc_msgSend(v167, "statementPurchasesSum");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v53, 5);

    objc_msgSend(v20, "addObject:", v52);
  }
  else
  {
LABEL_30:
    v52 = v45;
  }
  v189 = 0;
  v190 = 0;
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v160, "compare:", v54) != 1)
  {

LABEL_38:
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v166, "compare:", v58) == 1)
    {
      v59 = objc_msgSend(v166, "compare:", v159) == -1;

      v57 = v166;
      if (v59)
        goto LABEL_43;
    }
    else
    {

    }
    v57 = v159;
    goto LABEL_43;
  }
  v55 = objc_msgSend(v160, "compare:", v166) == -1;

  if (!v55)
    goto LABEL_38;
  v56 = objc_msgSend(v160, "compare:", v159);
  v57 = v160;
  if (v56 != -1)
    v57 = v159;
LABEL_43:
  v151 = v57;
  FinHealthLogObject();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v210 = 134218754;
    v211 = v190;
    v212 = 2048;
    v213 = v189;
    v214 = 2112;
    v215 = 0;
    v216 = 2112;
    v217 = 0;
    _os_log_impl(&dword_228295000, v60, OS_LOG_TYPE_DEBUG, "Printing _merchantCategoryTransactionSums %lu, %lu, %@, %@", v210, 0x2Au);
  }

  v187 = 0;
  v188 = 0;
  objc_msgSend(v167, "merchantCategoryTransactionSums");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHPaymentRingSuggestionController _minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:merchantCategoryTransactionSums:](self, "_minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:merchantCategoryTransactionSums:", v151, &v190, &v189, &v188, &v187, v61);
  v154 = v188;
  v153 = v187;

  objc_msgSend(v167, "previousStatementPaymentsSum");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    if (v154)
    {
      objc_msgSend(v167, "previousStatementPaymentsSum");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "decimalNumberByAdding:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v167, "statementPurchasesSum");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v64, "compare:", v65) == -1;

      if (v66)
      {
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v64, 3);

        objc_msgSend(v67, "setMerchantCategory:", v190);
        objc_msgSend(v20, "addObject:", v67);
      }
      else
      {
        v67 = v52;
      }

    }
    else
    {
      v67 = v52;
    }
    if (v153)
    {
      objc_msgSend(v167, "previousStatementPaymentsSum");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "decimalNumberByAdding:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v167, "statementPurchasesSum");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "compare:", v70) == -1;

      if (v71)
      {
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v69, 4);

        objc_msgSend(v52, "setMerchantCategory:", v189);
        objc_msgSend(v20, "addObject:", v52);
      }
      else
      {
        v52 = v67;
      }

    }
    else
    {
      v52 = v67;
    }
  }
  if (v165)
  {
    objc_msgSend(v167, "statementPurchasesSum");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = !v72 || v161 == 0;
    v74 = !v73;

    if (v74)
    {
      objc_msgSend(v167, "statementPurchasesSum");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHPaymentRingSuggestionController _suggestedAmountsForPayOffDateForStatementBalance:statementPurchasesSum:creditUtilization:lastPaymentCategory:](self, "_suggestedAmountsForPayOffDateForStatementBalance:statementPurchasesSum:creditUtilization:lastPaymentCategory:", v165, v75, v161, v197[3]);
      v76 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "addObject:", v76);
      v52 = (void *)v76;
    }
  }
  v77 = dispatch_semaphore_create(0);
  searchController = self->_searchController;
  v184[0] = v40;
  v184[1] = 3221225472;
  v184[2] = __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke_53;
  v184[3] = &unk_24F0DDC40;
  v186 = &v200;
  v79 = v77;
  v185 = v79;
  -[FHSearchSuggestionController paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:](searchController, "paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:", CFSTR("Payment Ring"), v158, v157, v184);
  v80 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v79, v80);
  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v81 = (id)v201[5];
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v180, v209, 16);
  v150 = v79;
  if (v82)
  {
    v83 = *(_QWORD *)v181;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v181 != v83)
          objc_enumerationMutation(v81);
        v85 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
        objc_msgSend(v85, "featureRank");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "featureLabel");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = FHPaymentRingSuggestionCategoryFromString();

        if (v88 != 32)
        {
          v89 = objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v86, v88);

          objc_msgSend(v20, "addObject:", v89);
          v52 = (void *)v89;
        }

      }
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v180, v209, 16);
    }
    while (v82);
  }

  if (self->_isOnPaymentPlan)
  {
    v90 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "paymentAmountCategory");
    v91 = 0x24BDD1000;
    v92 = v90;
  }
  else
  {
    v92 = v197[3];
    v91 = 0x24BDD1000uLL;
  }
  objc_msgSend(*(id *)(v91 + 1304), "zero");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  objc_msgSend(v167, "paymentDetails");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v176, v208, 16);
  if (v94)
  {
    v95 = *(_QWORD *)v177;
    while (2)
    {
      for (j = 0; j != v94; ++j)
      {
        if (*(_QWORD *)v177 != v95)
          objc_enumerationMutation(v93);
        v97 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * j);
        v98 = objc_msgSend(v97, "paymentAmountCategory");
        if (v98 == v197[3])
        {
          objc_msgSend(v97, "transactionAmount");
          v99 = objc_claimAutoreleasedReturnValue();

          v156 = (void *)v99;
          goto LABEL_89;
        }
      }
      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v176, v208, 16);
      if (v94)
        continue;
      break;
    }
  }
LABEL_89:

  objc_msgSend(v167, "previousStatementPaymentsSum");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "statementPurchasesSum");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHPaymentRingSuggestionController _calculateThresholdForLastPaymentCategory:statementBalance:lastPaymentCategoryAmount:previousStatementPaymentsSum:statementPurchasesSum:](self, "_calculateThresholdForLastPaymentCategory:statementBalance:lastPaymentCategoryAmount:previousStatementPaymentsSum:statementPurchasesSum:", v92, v165, v156, v100, v101);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  FinHealthLogObject();
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v210 = 138412290;
    v211 = v155;
    _os_log_impl(&dword_228295000, v102, OS_LOG_TYPE_DEBUG, "Calculated Threshold value : %@", v210, 0xCu);
  }

  -[FHPaymentRingSuggestionController _filterSuggestions:belowThreshold:](self, "_filterSuggestions:belowThreshold:", v20, v155);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  FinHealthLogObject();
  v104 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v103, "description");
    v100 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v210 = 138412290;
    v211 = v100;
    _os_log_impl(&dword_228295000, v104, OS_LOG_TYPE_DEBUG, "FinHealth Suggestions after threshold value : %@", v210, 0xCu);

  }
  if (!v165)
    goto LABEL_106;
  objc_msgSend(v167, "statementPurchasesSum");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    objc_msgSend(v167, "statementPurchasesSum");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v165, "compare:", v106);
    if (!v107
      || (objc_msgSend(v167, "statementPurchasesSum"),
          v100 = (id)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v165, "compare:", v100) == -1))
    {
      v108 = objc_msgSend(v164, "compare:", v165) == 1;
      if (v107)
      {

        if (!v108)
          goto LABEL_104;
      }
      else
      {

        if (!v108)
          goto LABEL_104;
      }
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "decimalNumberByDividingBy:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "decimalNumberBySubtracting:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "decimalNumberByDividingBy:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "decimalNumberBySubtracting:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "decimalNumberByDividingBy:", v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.33"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v109) = objc_msgSend(v115, "compare:", v116) == -1;

      if ((_DWORD)v109)
      {
        v149 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "decimalNumberByDividingBy:", v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "decimalNumberBySubtracting:", v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("3"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "decimalNumberByDividingBy:", v123);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "decimalNumberByDividingBy:", v163);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "decimalNumberByAdding:", v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend(v149, "initWithAmount:category:", v125, 23);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.67"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v115, "compare:", v117) == -1;

        v119 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
        if (v118)
        {
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberByDividingBy:", v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberBySubtracting:", v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("6"));
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "decimalNumberByDividingBy:", v123);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberByDividingBy:", v163);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "decimalNumberByAdding:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend(v119, "initWithAmount:category:", v125, 24);
        }
        else
        {
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberByDividingBy:", v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberBySubtracting:", v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("9"));
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "decimalNumberByDividingBy:", v123);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "decimalNumberByDividingBy:", v163);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "decimalNumberByAdding:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend(v119, "initWithAmount:category:", v125, 25);
        }
      }
      v30 = (void *)v126;

      objc_msgSend(v103, "addObject:", v30);
      goto LABEL_107;
    }

  }
LABEL_104:
  if (v160 && !-[FHPaymentRingSuggestionController _categoryIsPaymentPlan:](self, "_categoryIsPaymentPlan:", v197[3]))
  {
    v145 = objc_alloc(MEMORY[0x24BE31610]);
    objc_msgSend(v165, "decimalNumberByAdding:", v160);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "decimalNumberByDividingBy:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v145, "initWithAmount:category:", v148, 29);

    objc_msgSend(v103, "addObject:", v30);
    goto LABEL_107;
  }
LABEL_106:
  v30 = v52;
LABEL_107:
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v127 = (id)v201[5];
  v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v172, v207, 16);
  if (v128)
  {
    v129 = *(_QWORD *)v173;
    do
    {
      for (k = 0; k != v128; ++k)
      {
        if (*(_QWORD *)v173 != v129)
          objc_enumerationMutation(v127);
        v131 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * k);
        objc_msgSend(v131, "featureRank");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "featureLabel");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = FHPaymentRingSuggestionCategoryFromString();

        if (v134 == 32)
        {
          v135 = objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v132, 32);

          objc_msgSend(v103, "addObject:", v135);
          v30 = (void *)v135;
        }

      }
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v172, v207, 16);
    }
    while (v128);
  }

  objc_msgSend(v167, "currentStatementPaymentsSum");
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  if (v136)
  {
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v137 = v103;
    v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v168, v206, 16);
    if (v138)
    {
      v139 = *(_QWORD *)v169;
      do
      {
        for (m = 0; m != v138; ++m)
        {
          if (*(_QWORD *)v169 != v139)
            objc_enumerationMutation(v137);
          v141 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * m);
          objc_msgSend(v141, "amount");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "currentStatementPaymentsSum");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "decimalNumberBySubtracting:", v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v141, "setAmount:", v144);
        }
        v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v168, v206, 16);
      }
      while (v138);
    }

  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v196, 8);
  v20 = v103;
LABEL_18:
  v38 = v20;

  _Block_object_dispose(&v200, 8);
  return v38;
}

void __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "paymentAmountCategory");
  if (objc_msgSend(*(id *)(a1 + 32), "_categoryIsPaymentPlan:", objc_msgSend(v9, "paymentAmountCategory")))
  {
    objc_msgSend(*(id *)(a1 + 40), "previousStatementPaymentsSum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 48));

    if (v8 == -1)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        FinHealthLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestion:]_block_invoke";
          v18 = 2112;
          v19 = v9;
          _os_log_impl(&dword_228295000, v10, OS_LOG_TYPE_DEBUG, "[%s] FinHealth suggestion: %@", buf, 0x16u);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v11 + 32));
}

- (void)recordPaymentRingAction:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FHSearchSuggestionController *searchController;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v14 = objc_alloc_init(v4);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE31540]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue") + 200;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, *MEMORY[0x24BE314D0]);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE31530]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v9, *MEMORY[0x24BE314D8]);

  objc_msgSend(v14, "setObject:forKey:", &unk_24F0DF420, *MEMORY[0x24BE314C8]);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE31528]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, *MEMORY[0x24BE314B0]);

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE31538]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", v11, *MEMORY[0x24BE314C0]);
  searchController = self->_searchController;
  v13 = (void *)objc_msgSend(v14, "copy");
  -[FHSearchSuggestionController recordUserInteraction:](searchController, "recordUserInteraction:", v13);

}

- (id)_zerothOrFirstMonthPaymentRingSuggestionsForList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  id v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  char v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  void *v91;
  void *v92;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  id v111;
  uint64_t v112;
  _BYTE v113[128];
  _BYTE buf[12];
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  int v126;
  __int16 v127;
  int v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "currentStatement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creditLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v99 = v8;

  objc_msgSend(v4, "currentStatement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentBalanceForMonthZero");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentStatement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remainingMinimumPayment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v102 = v13;
  v14 = v99;

  objc_msgSend(v4, "currentStatement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remainingStatementBalance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v101 = v18;

  objc_msgSend(v4, "currentStatement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minimumDue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v103 = v22;

  objc_msgSend(v4, "currentStatement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "statementBalance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v104 = v26;

  objc_msgSend(v4, "currentStatement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isMonthZero");

  objc_msgSend(v4, "currentStatement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = objc_msgSend(v29, "isMonthOne");

  v100 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  FinHealthLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414082;
    *(_QWORD *)&buf[4] = v99;
    v115 = 2112;
    v116 = v105;
    v117 = 2112;
    v118 = v102;
    v119 = 2112;
    v120 = v101;
    v121 = 2112;
    v122 = v103;
    v123 = 2112;
    v124 = v104;
    v125 = 1024;
    v126 = v28;
    v127 = 1024;
    v128 = v30;
    _os_log_impl(&dword_228295000, v31, OS_LOG_TYPE_DEBUG, "Month-zero values CL, CB, RMP, RSB, MD, SB, isMonthZero, isMonthOne, %@, %@, %@, %@, %@, %@, %d, %d", buf, 0x4Au);
  }

  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v105 && v99)
  {
    v34 = v30;
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v99, "isEqualToNumber:", v35);

    if ((v36 & 1) != 0)
    {
      v37 = v33;
    }
    else
    {
      objc_msgSend(v105, "decimalNumberByDividingBy:", v99);
      v38 = objc_claimAutoreleasedReturnValue();

      FinHealthLogObject();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v38;
        _os_log_impl(&dword_228295000, v39, OS_LOG_TYPE_DEBUG, "Logging creditUtilizationForMonthZero %@", buf, 0xCu);
      }

      v37 = (void *)v38;
    }
    LOBYTE(v30) = v34;
  }
  else
  {
    v37 = (void *)v32;
  }
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105 && v104)
  {
    v40 = v37;
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v105, "isEqualToNumber:", v41) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1518], "zero");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v99, "isEqualToNumber:", v42);

      if ((v43 & 1) != 0)
      {
LABEL_33:
        v37 = v40;
        goto LABEL_34;
      }
      objc_msgSend(v104, "decimalNumberByDividingBy:", v99);
      v41 = v98;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_33;
  }
LABEL_34:
  if (-[FHPaymentRingSuggestionController _allMandatoryValuesAreSameAmount:](self, "_allMandatoryValuesAreSameAmount:", v4))
  {
    goto LABEL_89;
  }
  *(_QWORD *)buf = 0;
  v111 = 0;
  v112 = 0;
  v110 = 0;
  objc_msgSend(v4, "merchantCategoryTransactionSums");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHPaymentRingSuggestionController _minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:merchantCategoryTransactionSums:](self, "_minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:merchantCategoryTransactionSums:", v102, buf, &v112, &v111, &v110, v44);
  v45 = v111;
  v96 = v110;

  v94 = v45;
  if (!v45)
  {
    v97 = 0;
    v47 = v100;
    goto LABEL_45;
  }
  objc_msgSend(v45, "decimalNumberByAdding:", v103, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v100;
  if ((v28 & 1) != 0)
    goto LABEL_43;
  if ((v30 & 1) != 0
    || (objc_msgSend(v4, "previousStatementPaymentsSum"), (v48 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v46, "compare:", v101) != -1)
      goto LABEL_42;
LABEL_43:
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v46, 3);
    objc_msgSend(v49, "setMerchantCategory:", *(_QWORD *)buf);
    v97 = v49;
    objc_msgSend(v100, "addObject:", v49);
    goto LABEL_44;
  }

LABEL_42:
  v97 = 0;
LABEL_44:

LABEL_45:
  if (!v96)
    goto LABEL_53;
  objc_msgSend(v96, "decimalNumberByAdding:", v103);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v28 & 1) != 0)
    goto LABEL_51;
  if ((v30 & 1) != 0
    || (objc_msgSend(v4, "previousStatementPaymentsSum"), (v51 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "currentStatement", v94);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "remainingStatementBalance");
    v53 = v30;
    v30 = objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v50, "compare:", v30);

    LOBYTE(v30) = v53;
    v47 = v100;

    if (v54 != -1)
      goto LABEL_52;
LABEL_51:
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v50, 4);

    objc_msgSend(v55, "setMerchantCategory:", v112);
    objc_msgSend(v47, "addObject:", v55);
    v97 = v55;
    goto LABEL_52;
  }

LABEL_52:
LABEL_53:
  if (v37)
    v56 = v28;
  else
    v56 = 0;
  v95 = v37;
  if (v105 && v56)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.33"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v37, "compare:", v57);

    if (v58 == -1)
    {
      v79 = objc_alloc(MEMORY[0x24BE31610]);
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("3"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "decimalNumberByDividingBy:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v79;
      v65 = v63;
      v66 = 20;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.67"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v37, "compare:", v59);

      v61 = objc_alloc(MEMORY[0x24BE31610]);
      if (v60 == -1)
      {
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("6"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "decimalNumberByDividingBy:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v61;
        v65 = v63;
        v66 = 21;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("9"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "decimalNumberByDividingBy:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v61;
        v65 = v63;
        v66 = 22;
      }
    }
    v81 = (void *)objc_msgSend(v64, "initWithAmount:category:", v65, v66, v94);

  }
  else
  {
    if (v98)
      v67 = v30;
    else
      v67 = 0;
    if (!v104 || (v67 & 1) == 0)
    {
      objc_msgSend(v4, "previousStatementPaymentsSum", v94);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
        goto LABEL_77;
    }
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.33"), v94);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v98, "compare:", v69);

    if (v70 == -1)
    {
      v80 = objc_alloc(MEMORY[0x24BE31610]);
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("3"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "decimalNumberByDividingBy:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v80;
      v77 = v75;
      v78 = 26;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.67"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v98, "compare:", v71);

      v73 = objc_alloc(MEMORY[0x24BE31610]);
      if (v72 == -1)
      {
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("6"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "decimalNumberByDividingBy:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v73;
        v77 = v75;
        v78 = 27;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("9"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "decimalNumberByDividingBy:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v73;
        v77 = v75;
        v78 = 28;
      }
    }
    v81 = (void *)objc_msgSend(v76, "initWithAmount:category:", v77, v78);

    objc_msgSend(v81, "amount");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "compare:", v101);

    v97 = v81;
    if (v83 != -1)
      goto LABEL_77;
  }
  objc_msgSend(v47, "addObject:", v81);
  v97 = v81;
LABEL_77:
  objc_msgSend(v4, "currentStatementPaymentsSum");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v85 = v47;
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v107 != v88)
          objc_enumerationMutation(v85);
        if (v84)
        {
          v90 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          objc_msgSend(v90, "amount");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[FHPaymentRingSuggestionController _categoryIsCurrentBalanceType:](self, "_categoryIsCurrentBalanceType:", objc_msgSend(v90, "category")))
          {
            objc_msgSend(v91, "decimalNumberBySubtracting:", v84);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setAmount:", v92);

          }
        }
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    }
    while (v87);
  }

  v14 = v99;
  v37 = v95;
LABEL_89:

  return v100;
}

- (BOOL)_allMandatoryValuesAreSameAmount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "currentStatement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remainingStatementBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentStatement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "remainingMinimumPayment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "compare:", v10) == -1)
  {
    v11 = v10;

    v5 = v11;
  }
  if (v7 && objc_msgSend(v7, "compare:", v10) == -1)
  {
    v14 = v10;

    v7 = v14;
    if (!v9)
      goto LABEL_15;
  }
  else if (!v9)
  {
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "compare:", v10) == -1)
  {
    v12 = v10;

    v9 = v12;
  }
  v13 = 0;
  if (v5 && v7 && v9)
  {
    if (objc_msgSend(v5, "isEqual:", v7))
    {
      v13 = objc_msgSend(v7, "isEqual:", v9);
      goto LABEL_16;
    }
LABEL_15:
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7 merchantCategoryTransactionSums:(id)a8
{
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v13 = a3;
  v14 = a8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  if (v13)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __205__FHPaymentRingSuggestionController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2_merchantCategoryTransactionSums___block_invoke;
    v15[3] = &unk_24F0DDC68;
    v16 = v13;
    v17 = &v27;
    v18 = &v37;
    v19 = &v21;
    v20 = &v33;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  if (a4)
    *a4 = v38[3];
  if (a5)
    *a5 = v34[3];
  if (a6)
    *a6 = objc_retainAutorelease((id)v28[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void __205__FHPaymentRingSuggestionController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2_merchantCategoryTransactionSums___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "compare:", a1[4]) == 1)
  {
    v6 = *(_QWORD *)(a1[5] + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
    {
LABEL_8:
      objc_storeStrong(v7, a3);
      v12 = objc_msgSend(v14, "integerValue");
      v13 = a1[6];
LABEL_11:
      *(_QWORD *)(*(_QWORD *)(v13 + 8) + 24) = v12;
      goto LABEL_12;
    }
    v9 = *(_QWORD *)(a1[7] + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
LABEL_10:
      objc_storeStrong(v10, a3);
      v12 = objc_msgSend(v14, "integerValue");
      v13 = a1[8];
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "compare:") == -1
      || objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)) == -1)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "compare:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)) != -1)
      {
        v7 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
        goto LABEL_8;
      }
      v10 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 statementPurchasesSum:(id)a4 creditUtilization:(id)a5 lastPaymentCategory:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    switch(a6)
    {
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        v14 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("8"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        v20 = v18;
        v21 = 7;
        goto LABEL_18;
      case 7uLL:
        v24 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("7"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v24;
        v20 = v18;
        v21 = 8;
        goto LABEL_18;
      case 8uLL:
        v25 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("6"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v25;
        v20 = v18;
        v21 = 9;
        goto LABEL_18;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        v22 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("5"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v22;
        v20 = v18;
        v21 = 10;
        goto LABEL_18;
      case 0xAuLL:
        v26 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("4"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v26;
        v20 = v18;
        v21 = 11;
        goto LABEL_18;
      case 0xBuLL:
        v27 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("3"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v27;
        v20 = v18;
        v21 = 12;
        goto LABEL_18;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        v23 = objc_alloc(MEMORY[0x24BE31610]);
        objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("2"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decimalNumberByAdding:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;
        v20 = v18;
        v21 = 13;
        goto LABEL_18;
      case 0xDuLL:
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31610]), "initWithAmount:category:", v9, 17);
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.33"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v12, "compare:", v28);

        if (v29 == -1)
        {
          v33 = objc_alloc(MEMORY[0x24BE31610]);
          objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("3"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "decimalNumberByAdding:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v33;
          v20 = v18;
          v21 = 16;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("0.67"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v12, "compare:", v30);

          v32 = objc_alloc(MEMORY[0x24BE31610]);
          objc_msgSend(v9, "decimalNumberBySubtracting:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31 == -1)
          {
            objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("6"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "decimalNumberByAdding:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v32;
            v20 = v18;
            v21 = 15;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("9"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "decimalNumberByDividingBy:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "decimalNumberByAdding:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v32;
            v20 = v18;
            v21 = 14;
          }
        }
LABEL_18:
        v13 = (void *)objc_msgSend(v19, "initWithAmount:category:", v20, v21);

        break;
    }
  }

  return v13;
}

- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 lastPaymentCategoryAmount:(id)a5 previousStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v13)
  {
    v15 = v13;
    switch(a3)
    {
      case 0uLL:
        break;
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("8");
        goto LABEL_13;
      case 7uLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("7");
        goto LABEL_13;
      case 8uLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("6");
        goto LABEL_13;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("5");
        goto LABEL_13;
      case 0xAuLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("4");
        goto LABEL_13;
      case 0xBuLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("3");
        goto LABEL_13;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        objc_msgSend(v11, "decimalNumberBySubtracting:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD1518];
        v18 = CFSTR("2");
LABEL_13:
        objc_msgSend(v17, "decimalNumberWithString:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "decimalNumberByDividingBy:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "decimalNumberByAdding:", v14);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = v16;
        goto LABEL_14;
      case 0xDuLL:
        v19 = v11;
        goto LABEL_17;
      default:
        if (objc_msgSend(v12, "compare:", v15) != 1)
          break;
        v19 = v12;
LABEL_17:
        v22 = (uint64_t)v19;
LABEL_14:

        v15 = (id)v22;
        break;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "amount", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "compare:", v6) == 1)
        {

        }
        else
        {
          objc_msgSend(v13, "amount");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "compare:", v6);

          if (v16)
            continue;
        }
        objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3
{
  return (a3 < 0x1A) & (0x383FFC0u >> a3);
}

- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3
{
  return a3 - 20 < 3;
}

- (BOOL)_fhEqualObjects:(id)a3 obj2:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return a3 == a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_previousSelectedSuggestion, 0);
}

@end
