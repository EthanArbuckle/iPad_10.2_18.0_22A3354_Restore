@implementation FedStatsCategoricalType

- (void)setVersion:(unint64_t)a3
{
  NSArray *categories;
  NSDictionary *categoryMap;
  FedStatsSQLiteCategoryDatabase *categoryFile;
  FedStatsCategoricalTypePreEncoderProtocol *preEncoder;
  NSArray *filters;
  NSNumber *prefixSize;
  NSNumber *fragmentSize;

  self->_version = a3;
  categories = self->_categories;
  self->_categories = 0;

  categoryMap = self->_categoryMap;
  self->_categoryMap = 0;

  categoryFile = self->_categoryFile;
  self->_categoryFile = 0;

  preEncoder = self->_preEncoder;
  self->_preEncoder = 0;

  filters = self->_filters;
  self->_filters = 0;

  prefixSize = self->_prefixSize;
  self->_prefixSize = 0;

  fragmentSize = self->_fragmentSize;
  self->_fragmentSize = 0;

}

- (FedStatsCategoricalType)initWithCategories:(id)a3
{
  id v5;
  FedStatsCategoricalType *v6;
  FedStatsCategoricalType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, objc_msgSend(v5, "count"));
  v7 = v6;
  if (v6)
  {
    -[FedStatsCategoricalType setVersion:](v6, "setVersion:", 1);
    objc_storeStrong((id *)&v7->_categories, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4
{
  id v7;
  id v8;
  FedStatsCategoricalType *v9;
  FedStatsCategoricalType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalType;
  v9 = -[FedStatsBoundedULongType initWithBound:](&v12, sel_initWithBound_, objc_msgSend(v8, "count"));
  v10 = v9;
  if (v9)
  {
    -[FedStatsCategoricalType setVersion:](v9, "setVersion:", 2);
    objc_storeStrong((id *)&v10->_categoryMap, a3);
    objc_storeStrong((id *)&v10->_categories, a4);
  }

  return v10;
}

- (FedStatsCategoricalType)initWithCategoryFile:(id)a3
{
  id v5;
  FedStatsCategoricalType *v6;
  FedStatsCategoricalType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, objc_msgSend(v5, "dimensionality"));
  v7 = v6;
  if (v6)
  {
    -[FedStatsCategoricalType setVersion:](v6, "setVersion:", 3);
    objc_storeStrong((id *)&v7->_categoryFile, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithPrefixSize:(id)a3 fragmentSize:(id)a4 prefixTree:(id)a5 filters:(id)a6 tokenizer:(id)a7 preEncoder:(id)a8
{
  id v15;
  id v16;
  uint64_t v17;
  FedStatsCategoricalType *v18;
  FedStatsCategoricalType *v19;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v24 = a6;
  v23 = a7;
  v21 = a8;
  if (v16)
    v17 = objc_msgSend(v16, "dimensionality", v21, v23, v24, v25);
  else
    v17 = 1;
  v26.receiver = self;
  v26.super_class = (Class)FedStatsCategoricalType;
  v18 = -[FedStatsBoundedULongType initWithBound:](&v26, sel_initWithBound_, (v17 << objc_msgSend(v15, "unsignedIntegerValue", v21)) + 1);
  v19 = v18;
  if (v18)
  {
    -[FedStatsCategoricalType setVersion:](v18, "setVersion:", 4);
    objc_storeStrong((id *)&v19->_categoryFile, a5);
    objc_storeStrong((id *)&v19->_prefixSize, a3);
    objc_storeStrong((id *)&v19->_fragmentSize, a4);
    objc_storeStrong((id *)&v19->_filters, a6);
    objc_storeStrong((id *)&v19->_tokenizer, a7);
    objc_storeStrong((id *)&v19->_preEncoder, a8);
  }

  return v19;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  id *v66;
  const __CFString *v67;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  id *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id obj;
  id obja;
  id objb;
  id v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id *v118;
  id v120;
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  id v128;
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
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _QWORD v150[7];

  v150[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("categories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("categoryMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("categoryFile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("prefixSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = (v6 != 0) + 1;
  else
    v10 = v6 != 0;
  if (v8)
    ++v10;
  if (v9)
    ++v10;
  if (v10 != 1)
  {
    if (a4)
    {
      v22 = a4;
      v150[0] = CFSTR("categories");
      v150[1] = CFSTR("categoryMap");
      v150[2] = CFSTR("categoryFile");
      v150[3] = CFSTR("prefixTreeParameters");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("You're allowed to have exactly one of {%@} as key in parameters"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 301, v25);
      *v22 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
LABEL_81:
    v21 = 0;
    goto LABEL_102;
  }
  v118 = a4;
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("categories"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v142;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v142 != v16)
              objc_enumerationMutation(v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v118)
              {
                +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
                *v118 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_58;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
          if (v15)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      v20 = objc_msgSend(v13, "count");

      if (v19 == v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategories:", v13);
        goto LABEL_59;
      }
    }
    v49 = v118;
    goto LABEL_53;
  }
  if (!v7)
  {
    v49 = a4;
    if (v8)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("categoryFile"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("minIndex"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
          v52 = objc_msgSend(v50, "unsignedIntegerValue");
        else
          v52 = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v5, "objectForKey:", CFSTR("maxIndex"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
          v63 = objc_msgSend(v61, "unsignedIntegerValue");
        else
          v63 = 0x7FFFFFFFFFFFFFFFLL;
        v128 = 0;
        +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:", v11, v52, v63, 1, &v128);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v128;
        if (v64)
        {
          v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategoryFile:", v64);
        }
        else if (v118)
        {
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v65, CFSTR("Cannot create database from the provided URL"));
          v21 = 0;
          *v118 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }

        goto LABEL_59;
      }
LABEL_53:
      if (v49)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
        v21 = 0;
        *v49 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
LABEL_58:
      v21 = 0;
      goto LABEL_59;
    }
    if (v9)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("prefixSize"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v53;
      if (v53 && (objc_msgSend(v53, "integerValue") & 0x8000000000000000) == 0)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("fragmentSize"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v54;
        if (!v54 || objc_msgSend(v54, "integerValue") <= 0)
        {
          if (v118)
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v69);
            *v118 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_58;
        }
        if (objc_msgSend(v11, "unsignedIntegerValue"))
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("prefixTreeParameters"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v118)
            {
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v87);
              *v118 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_144;
          }
          objc_msgSend(v55, "objectForKey:", CFSTR("fileName"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v118)
            {
LABEL_143:

LABEL_144:
              goto LABEL_58;
            }
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v59);
            *v118 = (id)objc_claimAutoreleasedReturnValue();
LABEL_142:

            goto LABEL_143;
          }
          v127 = 0;
          +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:", v56, 0, 0x7FFFFFFFFFFFFFFFLL, 0, &v127);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v127;
          v59 = v58;
          if (v118 && !v57)
          {
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v58, CFSTR("Cannot load prefix tree as database"));
            *v118 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_142;
          }

          if (!v57)
            goto LABEL_58;
        }
        else
        {
          v57 = 0;
        }
        objc_msgSend(v5, "objectForKey:", CFSTR("filters"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v118)
            {
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101);
              v21 = 0;
              *v118 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v21 = 0;
            }
            goto LABEL_200;
          }
        }
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v11;
        if (v70)
        {
          obja = v70;
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v112 = v70;
          v71 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v124;
            do
            {
              for (j = 0; j != v72; ++j)
              {
                if (*(_QWORD *)v124 != v73)
                  objc_enumerationMutation(v112);
                v75 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v70 = obja;
                  if (v118)
                  {
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v76);
                    *v118 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_179;
                  }
                  goto LABEL_180;
                }
                objc_msgSend(v75, "objectForKey:", CFSTR("filterVariant"));
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                if (v76)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v118)
                    {
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v78);
                      *v118 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_178;
                    }
                    v70 = obja;
                    goto LABEL_179;
                  }
                  objc_msgSend(v75, "objectForKey:", CFSTR("filterParameters"));
                  v77 = objc_claimAutoreleasedReturnValue();
                  if (v77)
                    v78 = (void *)v77;
                  else
                    v78 = (void *)MEMORY[0x24BDBD1B8];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v118)
                    {
                      v80 = (id)objc_claimAutoreleasedReturnValue();
                      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v80);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      goto LABEL_176;
                    }
LABEL_178:
                    v70 = obja;

LABEL_179:
LABEL_180:

                    v21 = 0;
                    v11 = v106;
LABEL_199:

LABEL_200:
LABEL_59:

                    goto LABEL_101;
                  }
                  v122 = 0;
                  +[FedStatsCategoricalTypeFilterFactory filterForVariant:parameters:error:](FedStatsCategoricalTypeFilterFactory, "filterForVariant:parameters:error:", v76, v78, &v122);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = v122;
                  if (!v79)
                  {
                    if (v118)
                    {
                      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v80, CFSTR("Cannot create filter with given parameters"));
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_176:
                      *v118 = v97;
                    }

                    goto LABEL_178;
                  }
                  objc_msgSend(v116, "addObject:", v79);

                }
                v11 = v106;
              }
              v72 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
            }
            while (v72);
          }

          v49 = v118;
          v70 = obja;
        }
        objc_msgSend(v5, "objectForKey:", CFSTR("tokenizerVariant"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "objectForKey:", CFSTR("tokenizerParameters"));
            v82 = objc_claimAutoreleasedReturnValue();
            if (v82)
              v83 = (void *)v82;
            else
              v83 = (void *)MEMORY[0x24BDBD1B8];
            objc_opt_class();
            v113 = v83;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v121 = 0;
              +[FedStatsCategoricalTypeTokenizerFactory tokenizerForVariant:parameters:error:](FedStatsCategoricalTypeTokenizerFactory, "tokenizerForVariant:parameters:error:", v81, v83, &v121);
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = v121;
              v86 = v85;
              if (v84)
              {

                v114 = (id)v84;
                goto LABEL_150;
              }
              if (v49)
              {
                +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v85, CFSTR("Cannot create tokenizer with given parameters"));
                *v118 = (id)objc_claimAutoreleasedReturnValue();
              }

              v21 = 0;
              v11 = v106;
            }
            else
            {
              if (v49)
              {
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v96);
                *v118 = (id)objc_claimAutoreleasedReturnValue();

              }
              v21 = 0;
            }
            v95 = v113;
          }
          else
          {
            if (!v49)
            {
              v21 = 0;
LABEL_198:

              goto LABEL_199;
            }
            v94 = v49;
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v95);
            v21 = 0;
            *v94 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_197:

          goto LABEL_198;
        }
        v114 = 0;
LABEL_150:
        objc_msgSend(v5, "objectForKey:", CFSTR("preEncodingVariant"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v88)
        {
          v90 = 0;
          goto LABEL_164;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            v21 = 0;
            v95 = v114;
LABEL_196:

            v11 = v106;
            goto LABEL_197;
          }
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v90);
          v21 = 0;
          *v118 = (id)objc_claimAutoreleasedReturnValue();
          v95 = v114;
LABEL_195:

          goto LABEL_196;
        }
        objb = v70;
        objc_msgSend(v5, "objectForKey:", CFSTR("preEncodingParameters"));
        v89 = objc_claimAutoreleasedReturnValue();
        if (v89)
          v90 = (void *)v89;
        else
          v90 = (void *)MEMORY[0x24BDBD1B8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v120 = 0;
          +[FedStatsCategoricalTypePreEncoderFactory preEncoderForVariant:parameters:error:](FedStatsCategoricalTypePreEncoderFactory, "preEncoderForVariant:parameters:error:", v88, v90, &v120);
          v91 = objc_claimAutoreleasedReturnValue();
          v92 = v120;
          v93 = v92;
          if (v91)
          {

            v90 = (void *)v91;
            v70 = objb;
LABEL_164:
            v95 = v114;
            v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrefixSize:fragmentSize:prefixTree:filters:tokenizer:preEncoder:", v106, v12, v57, v116, v114, v90);
            goto LABEL_195;
          }
          if (!v118)
            goto LABEL_193;
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v92, CFSTR("Cannot create pre-encoder with given parameters"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v118)
          {
LABEL_194:
            v21 = 0;
            v70 = objb;
            v95 = v114;
            goto LABEL_195;
          }
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v93);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *v118 = v98;
LABEL_193:

        goto LABEL_194;
      }
      if (v118)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v60);
        *v118 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_23:
      v21 = 0;
      goto LABEL_101;
    }
    goto LABEL_81;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("categoryMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v118)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v26);
      v21 = 0;
      *v118 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_100;
    }
    goto LABEL_69;
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v27 = v11;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
  if (!v28)
    goto LABEL_34;
  v29 = v28;
  v30 = *(_QWORD *)v138;
  do
  {
    for (k = 0; k != v29; ++k)
    {
      if (*(_QWORD *)v138 != v30)
        objc_enumerationMutation(v27);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v118)
        {
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v26);
          *v118 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_69:
        v21 = 0;
        goto LABEL_100;
      }
    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
  }
  while (v29);
LABEL_34:

  objc_msgSend(v27, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortedArrayUsingSelector:", sel_compare_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
  if (!v35)
    goto LABEL_51;
  v115 = 0;
  v36 = *(_QWORD *)v134;
  v104 = v34;
  v105 = v11;
  v99 = *(_QWORD *)v134;
LABEL_36:
  v37 = 0;
  v38 = v118;
  v100 = v35;
LABEL_37:
  if (*(_QWORD *)v134 != v36)
    objc_enumerationMutation(v34);
  v101 = v37;
  v111 = *(id *)(*((_QWORD *)&v133 + 1) + 8 * v37);
  objc_msgSend(v27, "objectForKey:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v103 = v39;
    obj = v39;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
    if (!v40)
      goto LABEL_49;
    v41 = v40;
    v42 = *(_QWORD *)v130;
    v102 = v26;
LABEL_42:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v130 != v42)
        objc_enumerationMutation(obj);
      v44 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * v43);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v107, "allKeys");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "containsObject:", v44);

      if (v46)
      {
        v34 = v104;
        v11 = v105;
        v66 = v118;
        v26 = (__CFString *)v102;
        v39 = v103;
        if (v118)
        {
          v67 = CFSTR("Subcategories must be distinct");
LABEL_96:
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v67);
          *v66 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_97;
      }
      +[FedStatsCategoricalTypeSubcategory categoryWithSuperCategory:index:](FedStatsCategoricalTypeSubcategory, "categoryWithSuperCategory:index:", v111, v115);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setObject:forKey:", v47, v44);

      if (v41 == ++v43)
      {
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
        v38 = v118;
        v26 = (__CFString *)v102;
        if (v41)
          goto LABEL_42;
LABEL_49:

        ++v115;
        v37 = v101 + 1;
        v34 = v104;
        v11 = v105;
        v36 = v99;
        if (v101 + 1 == v100)
        {
          v35 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
          if (!v35)
          {
LABEL_51:

            v48 = v107;
            v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategoryMap:categories:", v107, v34);
            goto LABEL_99;
          }
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    v34 = v104;
    v11 = v105;
    v66 = v118;
    v26 = (__CFString *)v102;
    v39 = v103;
    if (v118)
    {
      v67 = v102;
      goto LABEL_96;
    }
LABEL_97:

    goto LABEL_98;
  }
  if (v38)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v26);
    *v38 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_98:

  v21 = 0;
  v48 = v107;
LABEL_99:

LABEL_100:
LABEL_101:

LABEL_102:
  return v21;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  id v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  switch(-[FedStatsCategoricalType version](self, "version"))
  {
    case 1uLL:
      -[FedStatsCategoricalType categories](self, "categories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", v6);

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = &unk_250C57AA0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8 + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_50;
    case 2uLL:
      -[FedStatsCategoricalType categoryMap](self, "categoryMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "index") + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = &unk_250C57AA0;
      }
      goto LABEL_49;
    case 3uLL:
      -[FedStatsCategoricalType categoryFile](self, "categoryFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(v12, "encode:error:", v6, &v49);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v49;

      if (v9)
      {
        v13 = v9;
      }
      else if (a4)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v11, CFSTR("Error when encoding categorical type over database"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_49;
    case 4uLL:
      v11 = v6;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[FedStatsCategoricalType filters](self, "filters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v46;
        do
        {
          v18 = 0;
          v19 = v11;
          do
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v18), "filter:", v19);
            v11 = (id)objc_claimAutoreleasedReturnValue();

            ++v18;
            v19 = v11;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v16);
      }

      -[FedStatsCategoricalType tokenizer](self, "tokenizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[FedStatsCategoricalType tokenizer](self, "tokenizer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "tokenize:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v50 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[FedStatsCategoricalType preEncoder](self, "preEncoder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[FedStatsCategoricalType preEncoder](self, "preEncoder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "preEncode:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v22, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v25)
      {
        v9 = 0;
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[FedStatsCategoricalType prefixSize](self, "prefixSize");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      -[FedStatsCategoricalType fragmentSize](self, "fragmentSize");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");

      if (objc_msgSend(v26, "length") <= v28)
      {
        v9 = 0;
        goto LABEL_47;
      }
      objc_msgSend(v26, "stringByPaddingToLength:withString:startingAtIndex:", v30 + v28, CFSTR("0"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v31;
      if (!v28)
      {
        v36 = 0;
        v34 = &unk_250C57AA0;
        goto LABEL_38;
      }
      objc_msgSend(v31, "substringToIndex:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FedStatsCategoricalType categoryFile](self, "categoryFile");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v33, "encode:error:", v32, &v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v44;

      if (v34)
      {
        if (!objc_msgSend(v34, "unsignedIntegerValue"))
        {
          +[FedStatsLog logger](FedStatsLog, "logger");
          v40 = objc_claimAutoreleasedReturnValue();
          v36 = v42;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[FedStatsCategoricalType encodeToIndex:possibleError:].cold.1(v40);

LABEL_45:
          v9 = 0;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v34, "unsignedIntegerValue") - 1);
        v35 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v35;
        v36 = v42;
LABEL_38:
        objc_msgSend(v43, "substringWithRange:", v28, v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        bitStringToInt(v37);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v38 = objc_msgSend(v34, "unsignedIntegerValue") << v30;
          v39 = objc_msgSend(v32, "unsignedIntegerValue");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v39 + v38 + 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      if (a4)
      {
        v36 = v42;
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v42, CFSTR("Error when encoding prefix over prefix tree"));
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
        v36 = v42;
      }
LABEL_46:

      v26 = v43;
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
      return v9;
    default:
      if (a4)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("The categorical type version is not supported"));
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_50;
  }
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;

  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      v10 = CFSTR("The decoder can only work with a non-null number type");
      v11 = 500;
LABEL_8:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v11, v10);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v7 = -[FedStatsCategoricalType version](self, "version");
  if (v7 - 1 < 2)
  {
    if (objc_msgSend(v6, "unsignedLongValue"))
    {
      -[FedStatsCategoricalType categories](self, "categories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "unsignedLongValue") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[FedStatsCategoricalType kOutOfCategories](self, "kOutOfCategories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if (v7 != 3)
  {
    if (a4)
    {
      v10 = CFSTR("The categorical type version is not supported");
      v11 = 900;
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  -[FedStatsCategoricalType categoryFile](self, "categoryFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v12, "decode:error:", objc_msgSend(v6, "unsignedLongValue"), &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v13 = v9;

LABEL_16:
  return v9;
}

- (int64_t)dataType
{
  return 3;
}

- (id)kOutOfCategories
{
  return CFSTR("FedStatsCategoricalDataOutOfBounds");
}

- (id)sampleForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (!a3)
  {
LABEL_6:
    -[FedStatsCategoricalType kOutOfCategories](self, "kOutOfCategories");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[FedStatsCategoricalType version](self, "version");
  if (v5 == 3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsCategoricalType decodeFromIndex:possibleError:](self, "decodeFromIndex:possibleError:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
      goto LABEL_5;
    goto LABEL_6;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalType categoryMap](self, "categoryMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__FedStatsCategoricalType_sampleForIndex___block_invoke;
  v11[3] = &unk_250C514E0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend((id)v13[5], "objectAtIndex:", arc4random_uniform(objc_msgSend((id)v13[5], "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v12, 8);

  return v10;
}

void __42__FedStatsCategoricalType_sampleForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 40) - 1;
  if (v5 == objc_msgSend(a3, "index"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSDictionary)categoryMap
{
  return self->_categoryMap;
}

- (FedStatsSQLiteCategoryDatabase)categoryFile
{
  return self->_categoryFile;
}

- (NSArray)filters
{
  return self->_filters;
}

- (FedStatsCategoricalTypeTokenizerProtocol)tokenizer
{
  return self->_tokenizer;
}

- (FedStatsCategoricalTypePreEncoderProtocol)preEncoder
{
  return self->_preEncoder;
}

- (NSNumber)prefixSize
{
  return self->_prefixSize;
}

- (NSNumber)fragmentSize
{
  return self->_fragmentSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentSize, 0);
  objc_storeStrong((id *)&self->_prefixSize, 0);
  objc_storeStrong((id *)&self->_preEncoder, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_categoryFile, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

- (void)encodeToIndex:(os_log_t)log possibleError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23B40B000, log, OS_LOG_TYPE_DEBUG, "Datapoint has no matching prefix, discarding", v1, 2u);
}

@end
