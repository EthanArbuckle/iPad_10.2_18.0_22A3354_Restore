@implementation CalculateResult

- (void)_setConversions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_conversions, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        self->_hasStaleCurrencyData |= *(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_setInputValueAndUnit:(id)a3
{
  _BYTE *v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inputValueAndUnit, a3);
  if (v5)
    self->_hasStaleCurrencyData |= v5[13];

}

- (void)_setExpression:(id)a3
{
  objc_storeStrong((id *)&self->_expression, a3);
}

- (void)_setTerms:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_terms, a3);
  if (objc_msgSend(v12, "count") == 1
    && (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "units"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7 == 1))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "units");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_singleUnitID = objc_msgSend(v11, "unitID");

  }
  else
  {
    self->_singleUnitID = 0;
  }

}

- (CalculateResult)init
{
  CalculateResult *v2;
  CalculateResult *v3;
  NSArray *conversions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalculateResult;
  v2 = -[CalculateResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CalculateResult setParseTree:](v2, "setParseTree:", 0);
    -[CalculateResult setResultTree:](v3, "setResultTree:", 0);
    conversions = v3->_conversions;
    v3->_conversions = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)dealloc
{
  TreeObject *parseTree;
  TreeObject *resultTree;
  TreeObject **variableResultTrees;
  uint64_t v6;
  objc_super v7;

  parseTree = self->_parseTree;
  if (parseTree)
  {
    freeTree(parseTree);
    self->_parseTree = 0;
  }
  resultTree = self->_resultTree;
  if (resultTree)
  {
    freeTree(resultTree);
    self->_resultTree = 0;
  }
  variableResultTrees = self->_variableResultTrees;
  if (variableResultTrees)
  {
    if (self->_variableResultTreesCount >= 1)
    {
      v6 = 0;
      do
        freeTree(&self->_variableResultTrees[v6++]->var0);
      while (v6 < self->_variableResultTreesCount);
      variableResultTrees = self->_variableResultTrees;
    }
    free(variableResultTrees);
    self->_variableResultTrees = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CalculateResult;
  -[CalculateResult dealloc](&v7, sel_dealloc);
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v4 = a3;
  -[CalculateResult terms](self, "terms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "terms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  if (!v9)
  {
    -[CalculateResult terms](self, "terms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v4, "terms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v9 = v11 < v13 ? -1 : v11 > v13;

    if (!v9)
    {
      -[CalculateResult terms](self, "terms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 < 2)
      {
LABEL_10:
        v9 = 0;
      }
      else
      {
        v16 = 1;
        while (1)
        {
          -[CalculateResult terms](self, "terms");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "terms");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v18, "compare:", v20);

          if (v9)
            break;
          ++v16;
          -[CalculateResult terms](self, "terms");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (v16 >= v22)
            goto LABEL_10;
        }
      }
    }
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CalculateResult compare:](self, "compare:", v4) == 0;

  return v5;
}

- (NSString)formattedResult
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CalculateResult terms](self, "terms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "formattedResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)enableMeasurementSystemsForLocale:(id)a3 metric:(BOOL *)a4 US:(BOOL *)a5 UK:(BOOL *)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_15;
  v15 = v10;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C99808]))
  {
    v10 = v15;
    if (a5)
      *a5 = 1;
  }
  else
  {
    if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C99800]))
    {
      if (a4)
        *a4 = 1;
      a4 = a5;
      v10 = v15;
      if (a5)
        goto LABEL_14;
      goto LABEL_15;
    }
    if (a6)
      *a6 = 1;
    if (a5)
    {
      if (-[CalculateResult singleUnitID](self, "singleUnitID"))
      {
        -[CalculateResult unitsInfo](self, "unitsInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", -[CalculateResult singleUnitID](self, "singleUnitID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "typeInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isVolume");

        if ((v14 & 1) == 0)
          *a5 = 1;
      }
    }
    v10 = v15;
  }
  if (a4)
LABEL_14:
    *a4 = 1;
LABEL_15:

}

- (id)newUnit:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "unitID");
  -[CalculateResult unitsInfo](self, "unitsInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalculateUnit unitWithID:unitsInfo:exponent:](CalculateUnit, "unitWithID:unitsInfo:exponent:", v4, v5, -[CalculateResult unitExponent](self, "unitExponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)conversionsForMetric:(BOOL)a3 US:(BOOL)a4 UK:(BOOL)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  _BOOL4 v24;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v24 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v28 = (id)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CalculateResult typeInfo](self, "typeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "units");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "unitID");
        if (v13 != -[CalculateResult singleUnitID](self, "singleUnitID"))
        {
          -[CalculateResult inputValueAndUnit](self, "inputValueAndUnit");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14
            || (v15 = (void *)v14,
                v16 = objc_msgSend(v12, "unitID"),
                -[CalculateResult inputValueAndUnit](self, "inputValueAndUnit"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "singleUnitID"),
                v17,
                v15,
                v16 != v18))
          {
            objc_msgSend(v12, "typeInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isTemperature");

            if ((v20 & 1) == 0)
            {
              if (objc_msgSend(v12, "measurementSystem") == 2)
              {
                if (!a4)
                  continue;
              }
              else if (objc_msgSend(v12, "measurementSystem") == 3)
              {
                if (!a5)
                  continue;
              }
              else if (objc_msgSend(v12, "measurementSystem") == 1 && !v24)
              {
                continue;
              }
            }
            v21 = -[CalculateResult newUnit:](self, "newUnit:", v12);
            if (objc_msgSend(v12, "doNotSuggest"))
              v22 = v27;
            else
              v22 = v28;
            objc_msgSend(v22, "addObject:", v21);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  objc_msgSend(v28, "addObjectsFromArray:", v27);
  if (-[CalculateResult unitType](self, "unitType") == 7)
    objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_496);

  return v28;
}

- (BOOL)isAcceptableConversion:(TreeObject *)a3
{
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int var0;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v19;

  if (-[CalculateResult unitType](self, "unitType") != 12)
  {
    v19 = 0;
    v6 = 0x3040000000000000;
    v7 = __bid128_div(5uLL, 0x3040000000000000uLL, 0x64uLL, 0x3040000000000000uLL, 4, &v19);
    v9 = v8;
    var0 = a3->var0;
    if (a3->var0 == 1)
    {
      if (my_rnd_mode)
        v12 = 4;
      else
        v12 = 0;
      v11 = __binary64_to_bid128(v12, &my_fpsf, a3->var4);
      v6 = v13;
    }
    else if (var0 == 2)
    {
      v14 = &a3->var5.var0[1];
      v11 = a3->var5.var0[1];
      v6 = v14[1];
    }
    else if (var0 == 4)
    {
      v11 = (unint64_t)a3->var7[0];
    }
    else
    {
      v11 = 0;
    }
    v15 = v6 & 0x7FFFFFFFFFFFFFFFLL;
    if (-[CalculateResult unitType](self, "unitType") == 7)
    {
      v16 = __bid128_div(1uLL, 0x3040000000000000uLL, 0x400uLL, 0x3040000000000000uLL, 4, &v19);
      v5 = __bid128_quiet_greater_equal(v11, v15, v16, v17, &v19);
      if (!v5)
        return v5;
      v5 = __bid128_quiet_less(v11, v15, 0x100000uLL, 0x3040000000000000, &v19);
    }
    else
    {
      v5 = __bid128_quiet_greater_equal(v11, v15, v7, v9, &v19);
    }
    LOBYTE(v5) = v5 != 0;
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (id)bestConversion
{
  CalculateResult *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  void *v33;
  int v34;
  char v35;
  uint64_t v36;
  int v37;
  double v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  int v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  _QWORD *v60;
  int v61;
  unint64_t v62;
  double v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  int v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  void *v81;
  unint64_t v82;
  unint64_t v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  int v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  CalculateResult *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  id v128;
  char v129;
  uint64_t v130;
  int v131;
  _BOOL4 v132;
  uint64_t v133;
  unint64_t v134;
  id obj;
  id obja;
  int v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  unsigned __int8 v152;
  __int16 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v2 = self;
  v162 = *MEMORY[0x1E0C80C00];
  if (!-[CalculateResult resultTree](self, "resultTree")
    || (-[CalculateResult typeInfo](v2, "typeInfo"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "units"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v6 = 0;
    return v6;
  }
  if (-[CalculateResult unitType](v2, "unitType") == 16)
  {
    -[CalculateResult localizedConversions](v2, "localizedConversions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (-[CalculateResult singleUnitID](v2, "singleUnitID"))
  {
    -[CalculateResult unitsInfo](v2, "unitsInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", -[CalculateResult singleUnitID](v2, "singleUnitID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bestEquivalent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v156 = 0u;
      v157 = 0u;
      v154 = 0u;
      v155 = 0u;
      -[CalculateResult localizedConversions](v2, "localizedConversions");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v161, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v155;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v155 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
            objc_msgSend(v15, "unitInfo");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "unitID");
            v18 = objc_msgSend(v10, "unitID");

            if (v17 == v18)
            {
              v6 = v15;

              return v6;
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v161, 16);
        }
        while (v12);
      }

    }
  }
  -[CalculateResult locales](v2, "locales");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19 || !objc_msgSend(v19, "count"))
  {
    +[Localize systemLocales](Localize, "systemLocales");
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  v153 = 0;
  v152 = 0;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v149;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v149 != v25)
          objc_enumerationMutation(v22);
        -[CalculateResult enableMeasurementSystemsForLocale:metric:US:UK:](v2, "enableMeasurementSystemsForLocale:metric:US:UK:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * j), (char *)&v153 + 1, &v153, &v152);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v148, v160, 16);
    }
    while (v24);
  }

  -[CalculateResult conversionsForMetric:US:UK:](v2, "conversionsForMetric:US:UK:", HIBYTE(v153), v153, v152);
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v145;
    while (2)
    {
      for (k = 0; k != v29; ++k)
      {
        v32 = v22;
        if (*(_QWORD *)v145 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * k), "unitInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "doNotSuggest");

        if (!v34)
        {
          v35 = 0;
          v22 = v32;
          goto LABEL_39;
        }
        v22 = v32;
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
      if (v29)
        continue;
      break;
    }
  }
  v35 = 1;
LABEL_39:

  v36 = -[CalculateResult resultTree](v2, "resultTree");
  v37 = *(_DWORD *)v36;
  if (*(_DWORD *)v36 == 1)
  {
    v38 = *(double *)(v36 + 32);
    if (my_rnd_mode)
      v39 = 4;
    else
      v39 = 0;
    v40 = __binary64_to_bid128(v39, &my_fpsf, v38);
    v133 = v41;
    v134 = v40;
  }
  else if (v37 == 2)
  {
    v133 = *(_QWORD *)(v36 + 56);
    v134 = *(_QWORD *)(v36 + 48);
  }
  else
  {
    if (v37 == 4)
      v134 = *(_QWORD *)(v36 + 64);
    else
      v134 = 0;
    v133 = 0x3040000000000000;
  }
  v142 = 0;
  v143 = 0;
  objc_msgSend(v22, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalculateResult preferMeasurementSystemsForLocale:preferred:fallback:](CalculateResult, "preferMeasurementSystemsForLocale:preferred:fallback:", v42, &v143, &v142);

  -[CalculateResult inputValueAndUnit](v2, "inputValueAndUnit");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[CalculateResult inputValueAndUnit](v2, "inputValueAndUnit");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "singleUnitID");

  }
  else
  {
    v45 = -[CalculateResult singleUnitID](v2, "singleUnitID");
  }

  if (v45)
  {
    -[CalculateResult unitsInfo](v2, "unitsInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "measurementSystem");

    v132 = v143 != v48;
    if (v142)
      v49 = v142 == v48;
    else
      v49 = 0;
    v50 = !v49;
  }
  else
  {
    v50 = 1;
    v132 = 1;
  }
  v131 = v50;
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v51 = v27;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
  if (!v52)
  {

    v105 = 0;
    goto LABEL_128;
  }
  v53 = (id)v52;
  v106 = v22;
  v123 = 0;
  v124 = 0;
  v109 = 0;
  v110 = 0;
  v117 = 0;
  v118 = 0;
  v130 = 0;
  v113 = 0;
  v114 = 0;
  v125 = 0;
  v126 = 0;
  v111 = 0;
  v112 = 0;
  v119 = 0;
  v120 = 0;
  v54 = *(_QWORD *)v139;
  v121 = 0x3040000000000000;
  v122 = 0x3040000000000000;
  v107 = 0x3040000000000000;
  v108 = 0x3040000000000000;
  v115 = 0x3040000000000000;
  v116 = 0x3040000000000000;
  v129 = v35;
  v127 = *(_QWORD *)v139;
  v128 = v51;
  do
  {
    v55 = 0;
    obja = v53;
    do
    {
      if (*(_QWORD *)v139 != v54)
        objc_enumerationMutation(v51);
      v56 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v55);
      if ((v35 & 1) != 0
        || (objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v55), "unitInfo"),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v58 = objc_msgSend(v57, "doNotSuggest"),
            v57,
            (v58 & 1) == 0))
      {
        v59 = -[CalculateResult convertedTree:needsUpdate:](v2, "convertedTree:needsUpdate:", v56, 0, v106);
        if (v59)
        {
          v60 = (_QWORD *)v59;
          v137 = 0;
          v61 = *(_DWORD *)v59;
          if (*(_DWORD *)v59 == 1)
          {
            v63 = *(double *)(v59 + 32);
            if (my_rnd_mode)
              v64 = 4;
            else
              v64 = 0;
            v62 = __binary64_to_bid128(v64, &my_fpsf, v63);
            v66 = v65;
          }
          else if (v61 == 2)
          {
            v62 = *(_QWORD *)(v59 + 48);
            v66 = *(_QWORD *)(v59 + 56);
          }
          else
          {
            if (v61 == 4)
              v62 = *(_QWORD *)(v59 + 64);
            else
              v62 = 0;
            v66 = 0x3040000000000000;
          }
          v67 = __bid128_sub(v134, v133, v62, v66, 4, &v137);
          v69 = v68 & 0x7FFFFFFFFFFFFFFFLL;
          if (-[CalculateResult isAcceptableConversion:](v2, "isAcceptableConversion:", v60))
          {
            if ((v130 & 0x100000000) == 0 || __bid128_quiet_less(v67, v69, v124, v122, &v137))
            {
              v70 = v56;

              v124 = v67;
              v125 = v70;
              v122 = v69;
            }
            if (v132)
            {
              objc_msgSend(v56, "unitInfo");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "measurementSystem");
              v73 = v143;

              if (v72 == v73)
              {
                if ((v114 & 0x100000000) != 0 && !__bid128_quiet_less(v67, v69, v110, v108, &v137))
                {
                  BYTE4(v114) = 1;
                }
                else
                {
                  v74 = v56;

                  BYTE4(v114) = 1;
                  v110 = v67;
                  v111 = v74;
                  v108 = v69;
                }
              }
            }
            if (v142)
              v75 = v131;
            else
              v75 = 0;
            if (v75 == 1
              && (objc_msgSend(v56, "unitInfo"),
                  v76 = (void *)objc_claimAutoreleasedReturnValue(),
                  v77 = objc_msgSend(v76, "measurementSystem"),
                  v78 = v142,
                  v76,
                  v77 == v78))
            {
              if ((v113 & 0x100000000) != 0)
              {
                v79 = __bid128_quiet_less(v67, v69, v118, v116, &v137);
                BYTE4(v130) = 1;
                v81 = v119;
                v80 = v120;
                v82 = v67;
                v83 = v69;
                v67 = v117;
                v69 = v115;
                BYTE4(v113) = 1;
                v84 = v56;
                if (!v79)
                  goto LABEL_119;
              }
              else
              {
                BYTE4(v130) = 1;
                v81 = v119;
                v80 = v120;
                v82 = v67;
                v83 = v69;
                v67 = v117;
                v69 = v115;
                BYTE4(v113) = 1;
                v84 = v56;
              }
LABEL_118:
              v120 = v80;
              v95 = v2;
              v96 = v83;
              v97 = v56;

              v117 = v67;
              v118 = v82;
              v115 = v69;
              v116 = v96;
              v2 = v95;
              v119 = v84;
            }
            else
            {
              BYTE4(v130) = 1;
            }
          }
          else
          {
            if ((v130 & 1) == 0 || __bid128_quiet_less(v67, v69, v123, v121, &v137))
            {
              v85 = v56;

              v123 = v67;
              v121 = v69;
              v126 = v85;
            }
            if (v132)
            {
              objc_msgSend(v56, "unitInfo");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v86, "measurementSystem");
              v88 = v143;

              if (v87 == v88)
              {
                if ((v114 & 1) != 0 && !__bid128_quiet_less(v67, v69, v109, v107, &v137))
                {
                  LOBYTE(v114) = 1;
                }
                else
                {
                  v89 = v56;

                  LOBYTE(v114) = 1;
                  v109 = v67;
                  v107 = v69;
                  v112 = v89;
                }
              }
            }
            if (v142)
              v90 = v131;
            else
              v90 = 0;
            if (v90 == 1)
            {
              objc_msgSend(v56, "unitInfo");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend(v91, "measurementSystem");
              v93 = v142;

              if (v92 == v93)
              {
                if ((v113 & 1) != 0)
                {
                  v94 = __bid128_quiet_less(v67, v69, v117, v115, &v137);
                  LOBYTE(v130) = 1;
                  v84 = v119;
                  v81 = v120;
                  v82 = v118;
                  v83 = v116;
                  LOBYTE(v113) = 1;
                  v80 = v56;
                  if (!v94)
                    goto LABEL_119;
                }
                else
                {
                  LOBYTE(v130) = 1;
                  v84 = v119;
                  v81 = v120;
                  v82 = v118;
                  v83 = v116;
                  LOBYTE(v113) = 1;
                  v80 = v56;
                }
                goto LABEL_118;
              }
            }
            LOBYTE(v130) = 1;
          }
LABEL_119:
          freeTree(v60);
          v35 = v129;
          v54 = v127;
          v51 = v128;
          v53 = obja;
        }
      }
      v55 = (char *)v55 + 1;
    }
    while (v53 != v55);
    v98 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
    v53 = (id)v98;
  }
  while (v98);

  if (v111)
  {
    v99 = v111;

    v100 = v99;
    v22 = v106;
    v101 = v126;
    v102 = v112;
    v104 = v119;
    v103 = v120;
    goto LABEL_135;
  }
  v22 = v106;
  if (v119)
  {
    v104 = v119;

    v99 = 0;
    v100 = v104;
    goto LABEL_133;
  }
  v100 = v125;
  if (!v125)
  {
    if (v112)
    {
      v102 = v112;
      v99 = 0;
      v104 = 0;
      v100 = v102;
      v101 = v126;
      goto LABEL_134;
    }
    if (v120)
    {
      v103 = v120;
      v99 = 0;
      v104 = 0;
      v102 = 0;
      v100 = v103;
      v101 = v126;
      goto LABEL_135;
    }
    v105 = v126;
LABEL_128:
    v101 = v105;
    v99 = 0;
    v104 = 0;
    v102 = 0;
    v103 = 0;
    v100 = v101;
    goto LABEL_135;
  }
  v99 = 0;
  v104 = 0;
LABEL_133:
  v101 = v126;
  v102 = v112;
LABEL_134:
  v103 = v120;
LABEL_135:
  v6 = v100;

  return v6;
}

- (id)availableConversions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CalculateResult typeInfo](self, "typeInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[CalculateResult typeInfo](self, "typeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "units");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CalculateResult conversionsForMetric:US:UK:](self, "conversionsForMetric:US:UK:", 1, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
LABEL_4:
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v8;
}

- (id)localizedConversions
{
  CalculateResult *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(void *, void *);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void (**v39)(void *, void *);
  uint64_t v40;
  CalculateResult *v41;
  uint64_t v42;
  id v43;
  void *v44;
  int v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  id v54;
  void *v55;
  id v56;
  id v57;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int16 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD aBlock[4];
  id v77;
  id v78;
  _QWORD block[5];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x1E0C80C00];
  -[CalculateResult typeInfo](self, "typeInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_38;
  v4 = (void *)v3;
  -[CalculateResult typeInfo](v2, "typeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "units");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CalculateResult locales](v2, "locales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !objc_msgSend(v7, "count"))
    {
      +[Localize systemLocales](Localize, "systemLocales");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (-[CalculateResult unitType](v2, "unitType") == 16)
    {
      v10 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__CalculateResult_localizedConversions__block_invoke;
      block[3] = &unk_1E6EA05D0;
      block[4] = v2;
      if (localizedConversions_onceToken != -1)
        dispatch_once(&localizedConversions_onceToken, block);
      v11 = (void *)objc_opt_new();
      v12 = (void *)objc_opt_new();
      aBlock[0] = v10;
      aBlock[1] = 3221225472;
      aBlock[2] = __39__CalculateResult_localizedConversions__block_invoke_2;
      aBlock[3] = &unk_1E6E9FCB0;
      v54 = v11;
      v77 = v54;
      v57 = v12;
      v78 = v57;
      v13 = (void (**)(void *, void *))_Block_copy(aBlock);
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v55 = v8;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v73 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            -[CalculateResult unitsInfo](v2, "unitsInfo", v54);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "currencyCode");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v19, "currencyCode");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v13[2](v13, v23);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        }
        while (v16);
      }

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v24 = objc_msgSend(&unk_1E6EACC50, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v69 != v26)
              objc_enumerationMutation(&unk_1E6EACC50);
            v13[2](v13, *(void **)(*((_QWORD *)&v68 + 1) + 8 * j));
          }
          v25 = objc_msgSend(&unk_1E6EACC50, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        }
        while (v25);
      }
      v56 = (id)objc_opt_new();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v28 = v57;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v65 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
            -[CalculateResult unitsInfo](v2, "unitsInfo", v54);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              v36 = objc_msgSend(v35, "unitID");
              if (v36 != -[CalculateResult singleUnitID](v2, "singleUnitID"))
              {
                -[CalculateResult inputValueAndUnit](v2, "inputValueAndUnit");
                v37 = objc_claimAutoreleasedReturnValue();
                if (!v37)
                  goto LABEL_34;
                v38 = (void *)v37;
                v58 = objc_msgSend(v35, "unitID");
                -[CalculateResult inputValueAndUnit](v2, "inputValueAndUnit");
                v39 = v13;
                v40 = v30;
                v41 = v2;
                v42 = v31;
                v43 = v28;
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "singleUnitID");

                v28 = v43;
                v31 = v42;
                v2 = v41;
                v30 = v40;
                v13 = v39;

                if (v58 != v45)
                {
LABEL_34:
                  v46 = -[CalculateResult newUnit:](v2, "newUnit:", v35);
                  objc_msgSend(v56, "addObject:", v46);

                }
              }
            }

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
        }
        while (v30);
      }

      v8 = v55;
    }
    else
    {
      v63 = 0;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v47 = v8;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v60;
        do
        {
          for (m = 0; m != v49; ++m)
          {
            if (*(_QWORD *)v60 != v50)
              objc_enumerationMutation(v47);
            -[CalculateResult enableMeasurementSystemsForLocale:metric:US:UK:](v2, "enableMeasurementSystemsForLocale:metric:US:UK:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m), 0, (char *)&v63 + 1, &v63);
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
        }
        while (v49);
      }

      -[CalculateResult conversionsForMetric:US:UK:](v2, "conversionsForMetric:US:UK:", 1, HIBYTE(v63), v63);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (id)objc_msgSend(v52, "copy");

    }
  }
  else
  {
LABEL_38:
    v56 = (id)MEMORY[0x1E0C9AA60];
  }
  return v56;
}

- (TreeObject)convertedTree:(id)a3 needsUpdate:(BOOL *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  double *v14;
  double *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  char __str[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  if (-[CalculateResult resultTree](self, "resultTree"))
  {
    v7 = -[CalculateResult unitType](self, "unitType");
    if (v7 == objc_msgSend(v6, "unitType"))
    {
      +[Calculate _lock](Calculate, "_lock");
      objc_msgSend(v6, "unitInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = newUnitIDNode(objc_msgSend(v8, "unitID"));

      if (!v9)
      {
LABEL_24:
        +[Calculate _unlock](Calculate, "_unlock");
        goto LABEL_25;
      }
      if (objc_msgSend(v6, "exponent") == 1)
      {
        v10 = v9;
        goto LABEL_14;
      }
      snprintf(__str, 0x28uLL, "%d", objc_msgSend(v6, "exponent"));
      if (my_rnd_mode)
        v11 = 4;
      else
        v11 = 0;
      v12 = __bid128_from_string((unsigned __int8 *)__str, v11, &my_fpsf);
      v14 = newDecimalNode(v12, v13);
      if (v14)
      {
        v15 = v14;
        v10 = newTreeObject((uint64_t)functionPow, (uint64_t)v9, (uint64_t)v14);
        if (v10)
        {
LABEL_14:
          v16 = newTreeObject((uint64_t)functionConvert, (uint64_t)-[CalculateResult resultTree](self, "resultTree"), (uint64_t)v10);
          v9 = v10;
          if (v16)
          {
            v17 = v16;
            v18 = malloc_type_calloc(1uLL, 0xD0uLL, 0x10A00405A5B035DuLL);
            if (v18)
            {
              v9 = v18;
              evaluateTree((uint64_t)v17, (uint64_t)v18);
              v17[2] = 0;
              freeTree(v17);
              if (a4 && g_currencyNeedsRefresh)
                *a4 = 1;
              if (!*((_DWORD *)v9 + 51))
                goto LABEL_24;
            }
            else
            {
              v9 = v17;
            }
          }
          goto LABEL_23;
        }
        freeTree(v15);
      }
LABEL_23:
      freeTree(v9);
      v9 = 0;
      goto LABEL_24;
    }
  }
  v9 = 0;
LABEL_25:

  return (TreeObject *)v9;
}

- (id)convertedTo:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  TreeObject *v11;
  _OWORD *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  BOOL isPartialExpression;
  BOOL assumeDegrees;
  BOOL localizeUnit;
  BOOL autoScientificNotation;
  unint64_t unitFormat;
  unint64_t scientificNotationFormat;
  BOOL flexibleFractionDigits;
  BOOL isSimpleVerticalMath;
  int unitExponent;
  int minimumFractionDigits;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  UnitsInfo *unitsInfo;
  uint64_t v31;
  __int16 v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  unint64_t v36;
  unint64_t v37;
  BOOL v38;
  BOOL v39;
  int v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  TreeObject *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  unint64_t v71;
  _BYTE v72[9];

  v4 = a3;
  if (-[CalculateResult resultTree](self, "resultTree"))
  {
    v5 = -[CalculateResult unitType](self, "unitType");
    if (v5 == objc_msgSend(v4, "unitType"))
    {
      if (-[CalculateResult synchronous](self, "synchronous") && -[CalculateResult unitType](self, "unitType") == 16)
      {
        if (+[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled"))
        {
          +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "needsRefresh");

          if (!v7)
            goto LABEL_11;
          +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "refreshSynchronouslyWithTimeout:", 6.0);
        }
        else
        {
          +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTimeout:", 6.0);

          +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "refreshIfNeeded");
        }

      }
LABEL_11:
      v72[0] = 0;
      v11 = -[CalculateResult convertedTree:needsUpdate:](self, "convertedTree:needsUpdate:", v4, v72);
      if (!v11)
        goto LABEL_19;
      v12 = copyTree((uint64_t)-[CalculateResult resultTree](self, "resultTree"));
      if (v12)
      {
        v13 = v12;
        -[CalculateResult unitsInfo](self, "unitsInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UnitTypeInfo unitType](self->_typeInfo, "unitType");
        isPartialExpression = self->_isPartialExpression;
        assumeDegrees = self->_assumeDegrees;
        localizeUnit = self->_localizeUnit;
        autoScientificNotation = self->_autoScientificNotation;
        scientificNotationFormat = self->_scientificNotationFormat;
        unitFormat = self->_unitFormat;
        flexibleFractionDigits = self->_flexibleFractionDigits;
        isSimpleVerticalMath = self->_isSimpleVerticalMath;
        minimumFractionDigits = self->_minimumFractionDigits;
        unitExponent = self->_unitExponent;
        v26 = *(_OWORD *)&self->_resolvedUnitFormats.formats[10];
        v27 = *(_OWORD *)&self->_resolvedUnitFormats.formats[14];
        v69 = *(_OWORD *)&self->_resolvedUnitFormats.formats[12];
        v70 = v27;
        v71 = self->_resolvedUnitFormats.formats[16];
        v28 = *(_OWORD *)&self->_resolvedUnitFormats.formats[2];
        v29 = *(_OWORD *)&self->_resolvedUnitFormats.formats[6];
        v65 = *(_OWORD *)&self->_resolvedUnitFormats.formats[4];
        v66 = v29;
        v67 = *(_OWORD *)&self->_resolvedUnitFormats.formats[8];
        v68 = v26;
        v63 = *(_OWORD *)self->_resolvedUnitFormats.formats;
        v64 = v28;
        LOBYTE(v61) = v72[0];
        HIDWORD(v59) = minimumFractionDigits;
        BYTE1(v59) = isSimpleVerticalMath;
        LOBYTE(v59) = flexibleFractionDigits;
        LOBYTE(v57) = autoScientificNotation;
        BYTE2(v55) = localizeUnit;
        BYTE1(v55) = assumeDegrees;
        LOBYTE(v55) = 0;
        LODWORD(v53) = 0;
        BYTE1(v51) = isPartialExpression;
        LOBYTE(v51) = 0;
        LODWORD(v49) = unitExponent;
        +[CalculateResult resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:](CalculateResult, "resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:", v11, 0, 0, 0, v14, v15, v49, &stru_1E6EA0F18, v51, 0, 0, v53, &v63, v55,
          unitFormat,
          v57,
          scientificNotationFormat,
          v59,
          v61);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          unitsInfo = self->_unitsInfo;
          v31 = -[UnitTypeInfo unitType](self->_typeInfo, "unitType");
          v32 = *(_WORD *)&self->_isTrivial;
          v33 = self->_assumeDegrees;
          v34 = self->_localizeUnit;
          v35 = self->_autoScientificNotation;
          v37 = self->_scientificNotationFormat;
          v36 = self->_unitFormat;
          v38 = self->_flexibleFractionDigits;
          v39 = self->_isSimpleVerticalMath;
          v41 = self->_minimumFractionDigits;
          v40 = self->_unitExponent;
          v42 = *(_OWORD *)&self->_resolvedUnitFormats.formats[14];
          v69 = *(_OWORD *)&self->_resolvedUnitFormats.formats[12];
          v70 = v42;
          v71 = self->_resolvedUnitFormats.formats[16];
          v43 = *(_OWORD *)&self->_resolvedUnitFormats.formats[6];
          v65 = *(_OWORD *)&self->_resolvedUnitFormats.formats[4];
          v66 = v43;
          v44 = *(_OWORD *)&self->_resolvedUnitFormats.formats[10];
          v67 = *(_OWORD *)&self->_resolvedUnitFormats.formats[8];
          v68 = v44;
          v45 = *(_OWORD *)&self->_resolvedUnitFormats.formats[2];
          v63 = *(_OWORD *)self->_resolvedUnitFormats.formats;
          v64 = v45;
          LOBYTE(v62) = v72[0];
          HIDWORD(v60) = v41;
          BYTE1(v60) = v39;
          LOBYTE(v60) = v38;
          LOBYTE(v58) = v35;
          BYTE2(v56) = v34;
          BYTE1(v56) = v33;
          LOBYTE(v56) = 0;
          LODWORD(v54) = 0;
          LOWORD(v52) = v32;
          LODWORD(v50) = v40;
          +[CalculateResult resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:](CalculateResult, "resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:", v13, 0, 0, 0, unitsInfo, v31, v50, &stru_1E6EA0F18, v52, 0, 0, v54, &v63, v56,
            v36,
            v58,
            v37,
            v60,
            v62);
          v46 = (TreeObject *)objc_claimAutoreleasedReturnValue();
          v11 = v46;
          if (v46)
          {
            -[TreeObject setParent:](v46, "setParent:", v9);
            objc_msgSend(v9, "_setInputValueAndUnit:", v11);
            objc_msgSend(v9, "setParent:", self);
            -[TreeObject formattedResult](v11, "formattedResult");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "_setExpression:", v47);

LABEL_20:
            goto LABEL_21;
          }

          freeTree(v13);
LABEL_19:
          v9 = 0;
          goto LABEL_20;
        }
        freeTree(v13);
      }
      freeTree(v11);
      v9 = 0;
      v11 = 0;
      goto LABEL_20;
    }
  }
  v9 = 0;
LABEL_21:

  return v9;
}

- (id)updateVariables:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  TreeObject *v16;
  TreeObject **variableResultTrees;
  CalculateResult *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  TreeObject *resultTree;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  $71D83D51AB0F57F7CF166351F850C832 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_terms, "count") == 1)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_variableLookups, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 == v13)
            {
              v15 = 0;
            }
            else
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "resultTree");

            }
            v16 = (TreeObject *)copyTree(v15);
            variableResultTrees = self->_variableResultTrees;
            variableResultTrees[objc_msgSend(v11, "integerValue")] = v16;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
      }
      while (v7);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = ($71D83D51AB0F57F7CF166351F850C832)0;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    v18 = self;
    +[Calculate _lock](Calculate, "_lock");
    g_variableResultTrees = (uint64_t)v18->_variableResultTrees;
    g_variableResultTreesCount = v18->_variableResultTreesCount;
    g_forceResult = 1;
    g_assumeDegrees = v18->_assumeDegrees;
    g_PreferredType = 2;
    g_ErrorCode = 0;
    LODWORD(v43) = 2;
    HIDWORD(v55) = 0;
    evaluateTree((uint64_t)v18->_parseTree, (uint64_t)&v43);
    v19 = HIDWORD(v55);
    +[Calculate _unlock](Calculate, "_unlock");

    if ((_DWORD)v19)
    {
      +[CalculateError errorWithResultError:](CalculateError, "errorWithResultError:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v4 = v38;
    if ((_DWORD)v43 == 1)
    {
      if (my_rnd_mode)
        v22 = 4;
      else
        v22 = 0;
      v21 = __binary64_to_bid128(v22, &my_fpsf, *(double *)&v45);
      v24 = v23;
    }
    else if ((_DWORD)v43 == 2)
    {
      v24 = v46.var0[1];
      v21 = v46.var0[0];
    }
    else
    {
      if ((_DWORD)v43 == 4)
        v21 = v47;
      else
        v21 = 0;
      v24 = 0x3040000000000000;
    }
    +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v21, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    resultTree = v18->_resultTree;
    v27 = v44;
    v28 = v45;
    v29 = v47;
    *($71D83D51AB0F57F7CF166351F850C832 *)((char *)&resultTree->var5 + 8) = v46;
    *(_OWORD *)&resultTree->var7[0].unitID = v29;
    *(_OWORD *)&resultTree->var2 = v27;
    *(_OWORD *)&resultTree->var4 = v28;
    v30 = v48;
    v31 = v49;
    v32 = v51;
    *(_OWORD *)&resultTree->var7[6].unitID = v50;
    *(_OWORD *)&resultTree->var7[8].unitID = v32;
    *(_OWORD *)&resultTree->var7[2].unitID = v30;
    *(_OWORD *)&resultTree->var7[4].unitID = v31;
    v33 = v52;
    v34 = v53;
    v35 = v55;
    *(_OWORD *)&resultTree->var7[14].unitID = v54;
    *(_OWORD *)&resultTree->var8 = v35;
    *(_OWORD *)&resultTree->var7[10].unitID = v33;
    *(_OWORD *)&resultTree->var7[12].unitID = v34;
    *(_OWORD *)&resultTree->var0 = v43;
    -[NSArray firstObject](self->_terms, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValue:", v25);
    objc_msgSend(v36, "setDecimalValue:", v21, v24);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)graphableFunction
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  TreeObject *resultTree;
  int var0;
  double var4;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  void *v17;
  _QWORD v19[5];
  int v20;
  _QWORD aBlock[5];

  -[NSMutableDictionary objectForKeyedSubscript:](self->_variableLookups, "objectForKeyedSubscript:", CFSTR("x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (!self->_variableResultTrees[v5])
    {
      if (my_rnd_mode)
        v6 = 4;
      else
        v6 = 0;
      v7 = __bid128_from_string("0", v6, &my_fpsf);
      self->_variableResultTrees[v5] = (TreeObject *)newDecimalNode(v7, v8);
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __36__CalculateResult_graphableFunction__block_invoke_2;
    v19[3] = &unk_1E6E9FCF8;
    v19[4] = self;
    v20 = v5;
    v9 = v19;
  }
  else
  {
    resultTree = self->_resultTree;
    var0 = resultTree->var0;
    if (resultTree->var0 == 1)
    {
      var4 = resultTree->var4;
    }
    else if (var0 == 2)
    {
      if (my_rnd_mode)
        v16 = 4;
      else
        v16 = 0;
      var4 = __bid128_to_binary64(resultTree->var5.var0[1], resultTree->var6, v16, &my_fpsf);
    }
    else
    {
      var4 = 0.0;
      if (var0 == 4)
      {
        v13 = (unint64_t)resultTree->var7[0];
        v14 = (uint64_t)rint(1.79769313e308);
        v15 = (uint64_t)rint(2.22507386e-308) < v13 && v14 > v13;
        var4 = (double)v13;
        if (!v15)
          var4 = NAN;
      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__CalculateResult_graphableFunction__block_invoke;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    *(double *)&aBlock[4] = var4;
    v9 = aBlock;
  }
  v17 = _Block_copy(v9);

  return v17;
}

- (BOOL)isNaN
{
  return (~self->_resultTree->var6 & 0x7C00000000000000) == 0;
}

- (id)ignoringNaN
{
  if ((~self->_resultTree->var6 & 0x7C00000000000000) != 0)
    return self;
  else
    return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CalculateResult formattedExpression](self, "formattedExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateResult formattedResult](self, "formattedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)expression
{
  return self->_expression;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_storeStrong((id *)&self->_locales, a3);
}

- (int)minimumFractionDigits
{
  return self->_minimumFractionDigits;
}

- (void)setMinimumFractionDigits:(int)a3
{
  self->_minimumFractionDigits = a3;
}

- (BOOL)autoScientificNotation
{
  return self->_autoScientificNotation;
}

- (void)setAutoScientificNotation:(BOOL)a3
{
  self->_autoScientificNotation = a3;
}

- (unint64_t)scientificNotationFormat
{
  return self->_scientificNotationFormat;
}

- (void)setScientificNotationFormat:(unint64_t)a3
{
  self->_scientificNotationFormat = a3;
}

- (unint64_t)unitFormat
{
  return self->_unitFormat;
}

- (void)setUnitFormat:(unint64_t)a3
{
  self->_unitFormat = a3;
}

- (BOOL)flexibleFractionDigits
{
  return self->_flexibleFractionDigits;
}

- (void)setFlexibleFractionDigits:(BOOL)a3
{
  self->_flexibleFractionDigits = a3;
}

- (BOOL)assumeDegrees
{
  return self->_assumeDegrees;
}

- (BOOL)isTrivial
{
  return self->_isTrivial;
}

- (BOOL)isPartialExpression
{
  return self->_isPartialExpression;
}

- (unint64_t)unitType
{
  return self->_unitType;
}

- (int)unitExponent
{
  return self->_unitExponent;
}

- (NSArray)terms
{
  return self->_terms;
}

- (CalculateResult)inputValueAndUnit
{
  return self->_inputValueAndUnit;
}

- (NSArray)conversions
{
  return self->_conversions;
}

- (BOOL)hasStaleCurrencyData
{
  return self->_hasStaleCurrencyData;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (CalculateResult)parent
{
  return (CalculateResult *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (TreeObject)parseTree
{
  return self->_parseTree;
}

- (void)setParseTree:(TreeObject *)a3
{
  self->_parseTree = a3;
}

- (TreeObject)resultTree
{
  return self->_resultTree;
}

- (void)setResultTree:(TreeObject *)a3
{
  self->_resultTree = a3;
}

- (BOOL)localizeUnit
{
  return self->_localizeUnit;
}

- (void)setLocalizeUnit:(BOOL)a3
{
  self->_localizeUnit = a3;
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setUnitsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitsInfo, a3);
}

- (UnitTypeInfo)typeInfo
{
  return self->_typeInfo;
}

- (void)setTypeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_typeInfo, a3);
}

- (int)singleUnitID
{
  return self->_singleUnitID;
}

- (void)setSingleUnitID:(int)a3
{
  self->_singleUnitID = a3;
}

- (NSMutableDictionary)variableLookups
{
  return self->_variableLookups;
}

- (void)setVariableLookups:(id)a3
{
  objc_storeStrong((id *)&self->_variableLookups, a3);
}

- (TreeObject)variableResultTrees
{
  return self->_variableResultTrees;
}

- (void)setVariableResultTrees:(TreeObject *)a3
{
  self->_variableResultTrees = a3;
}

- (int)variableResultTreesCount
{
  return self->_variableResultTreesCount;
}

- (void)setVariableResultTreesCount:(int)a3
{
  self->_variableResultTreesCount = a3;
}

- ($786B50094F6E1A5F953E25B90648E2E3)resolvedUnitFormats
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].var0[14];
  retstr->var0[16] = self[2].var0[3];
  v4 = *(_OWORD *)&self[1].var0[6];
  v5 = *(_OWORD *)&self[1].var0[10];
  *(_OWORD *)&retstr->var0[4] = *(_OWORD *)&self[1].var0[8];
  *(_OWORD *)&retstr->var0[6] = v5;
  *(_OWORD *)&retstr->var0[8] = *(_OWORD *)&self[1].var0[12];
  *(_OWORD *)&retstr->var0[10] = v3;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[2] = v4;
  v6 = *(_OWORD *)&self[2].var0[1];
  *(_OWORD *)&retstr->var0[12] = *(_OWORD *)&self[1].var0[16];
  *(_OWORD *)&retstr->var0[14] = v6;
  return self;
}

- (void)setResolvedUnitFormats:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)self->_resolvedUnitFormats.formats = *(_OWORD *)a3->var0;
  v3 = *(_OWORD *)&a3->var0[2];
  v4 = *(_OWORD *)&a3->var0[4];
  v5 = *(_OWORD *)&a3->var0[6];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[8] = *(_OWORD *)&a3->var0[8];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[6] = v5;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[4] = v4;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[2] = v3;
  v6 = *(_OWORD *)&a3->var0[10];
  v7 = *(_OWORD *)&a3->var0[12];
  v8 = *(_OWORD *)&a3->var0[14];
  self->_resolvedUnitFormats.formats[16] = a3->var0[16];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[12] = v7;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[14] = v8;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[10] = v6;
}

- (BOOL)isSimpleVerticalMath
{
  return self->_isSimpleVerticalMath;
}

- (void)setIsSimpleVerticalMath:(BOOL)a3
{
  self->_isSimpleVerticalMath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableLookups, 0);
  objc_storeStrong((id *)&self->_typeInfo, 0);
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_conversions, 0);
  objc_storeStrong((id *)&self->_inputValueAndUnit, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

double __36__CalculateResult_graphableFunction__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __36__CalculateResult_graphableFunction__block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v2;
  _QWORD *v3;
  double result;
  unint64_t v5;
  BOOL v6;
  int v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) + 8 * *(int *)(a1 + 40));
  *(_DWORD *)v2 = 1;
  *(double *)(v2 + 32) = a2;
  *(_DWORD *)(v2 + 204) = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  v3 = *(id *)(a1 + 32);
  +[Calculate _lock](Calculate, "_lock", (unsigned __int128)0, (unsigned __int128)0);
  g_variableResultTrees = v3[20];
  g_variableResultTreesCount = *((_DWORD *)v3 + 8);
  g_forceResult = 1;
  g_assumeDegrees = *((_BYTE *)v3 + 10);
  g_PreferredType = 2;
  g_ErrorCode = 0;
  LODWORD(v8[0]) = 2;
  HIDWORD(v19) = 0;
  evaluateTree(v3[15], (uint64_t)v8);

  +[Calculate _unlock](Calculate, "_unlock");
  if (LODWORD(v8[0]) == 1)
    return *(double *)&v9;
  if (LODWORD(v8[0]) == 2)
  {
    if (my_rnd_mode)
      v7 = 4;
    else
      v7 = 0;
    return __bid128_to_binary64(v10, *((unint64_t *)&v10 + 1), v7, &my_fpsf);
  }
  else
  {
    result = 0.0;
    if (LODWORD(v8[0]) == 4)
    {
      v5 = (uint64_t)rint(1.79769313e308);
      v6 = (uint64_t)rint(2.22507386e-308) < (unint64_t)v11 && v5 > (unint64_t)v11;
      result = (double)(unint64_t)v11;
      if (!v6)
        return NAN;
    }
  }
  return result;
}

void __39__CalculateResult_localizedConversions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_new();
  v3 = (void *)localizedConversions_allCurrencies;
  localizedConversions_allCurrencies = v2;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "typeInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "units");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)localizedConversions_allCurrencies;
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __39__CalculateResult_localizedConversions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

uint64_t __46__CalculateResult_conversionsForMetric_US_UK___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v22;

  v4 = a2;
  v5 = a3;
  v22 = 0;
  objc_msgSend(v4, "unitInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "baseNumerator");
  v9 = v8;
  objc_msgSend(v5, "unitInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "baseNumerator");
  LODWORD(v7) = __bid128_quiet_less(v7, v9, v11, v12, &v22);

  if ((_DWORD)v7)
  {
    v13 = -1;
  }
  else
  {
    objc_msgSend(v5, "unitInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "baseNumerator");
    v17 = v16;
    objc_msgSend(v4, "unitInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "baseNumerator");
    LODWORD(v15) = __bid128_quiet_less(v15, v17, v19, v20, &v22);

    v13 = v15;
  }

  return v13;
}

+ (id)defaultNumberFormatter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (defaultNumberFormatter__onceToken != -1)
    dispatch_once(&defaultNumberFormatter__onceToken, &__block_literal_global_487);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupingSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalSeparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)defaultNumberFormatter__numberFormatters, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v9, "setMaximumIntegerDigits:", 10);
    objc_msgSend(v9, "setMaximumFractionDigits:", 3);
    objc_msgSend(v9, "setNumberStyle:", 1);
    objc_msgSend(v9, "setRoundingMode:", 6);
    objc_msgSend(v9, "setLocale:", v3);
    objc_msgSend((id)defaultNumberFormatter__numberFormatters, "setObject:forKey:", v9, v8);
  }

  return v9;
}

+ (id)decimalNumberWithDecimal128:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _BYTE v7[42];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  __bid128_to_string((uint64_t)v7, a3.var0[0], a3.var0[1]);
  v3 = (void *)MEMORY[0x1E0CB3598];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decimalNumberWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CalculateResult)resultWithResultTree:(TreeObject *)a3 parseTree:(TreeObject *)a4 locales:(id)a5 numberFormatter:(id)a6 unitsInfo:(id)a7 unitType:(int)a8 unitExponent:(int)a9 expression:(id)a10 isTrivial:(BOOL)a11 isPartialExpression:(BOOL)a12 variableLookups:(id)a13 variableResultTrees:(TreeObject *)a14 variableResultTreesCount:(int)a15 resolvedUnitFormats:(id *)a16 forceResult:(BOOL)a17 assumeDegrees:(BOOL)a18 localizeUnit:(BOOL)a19 unitFormat:(unint64_t)a20 autoScientificNotation:(BOOL)a21 scientificNotationFormat:(unint64_t)a22 flexibleFractionDigits:(BOOL)a23 isSimpleVerticalMath:(BOOL)a24 minimumFractionDigits:(int)a25 hasStaleCurrencyData:(BOOL)a26
{
  id v30;
  id v31;
  id v32;
  id v33;
  int var0;
  unint64_t v35;
  int v36;
  unint64_t var6;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  int v46;
  int v47;
  int *p_exponent;
  int v49;
  int unitID;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id obj;
  id v71;
  unint64_t v72;
  unint64_t v73;
  id v75;
  id v76;
  void *v77;
  id v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v30 = a5;
  obj = a6;
  v31 = a6;
  v71 = a7;
  v32 = a7;
  v76 = a10;
  v33 = a13;
  var0 = a3->var0;
  v77 = v31;
  v78 = v30;
  v75 = v33;
  if (a3->var0 == 1)
  {
    if (my_rnd_mode)
      v36 = 4;
    else
      v36 = 0;
    v35 = __binary64_to_bid128(v36, &my_fpsf, a3->var4);
  }
  else if (var0 == 2)
  {
    v35 = a3->var5.var0[1];
    var6 = a3->var6;
  }
  else
  {
    if (var0 == 4)
      v35 = (unint64_t)a3->var7[0];
    else
      v35 = 0;
    var6 = 0x3040000000000000;
  }
  v72 = var6;
  v73 = v35;
  +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v35, var6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a17)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if ((v40 & 1) != 0)
    {
      v41 = 0;
      goto LABEL_39;
    }
  }
  v41 = objc_opt_new();
  objc_storeStrong((id *)(v41 + 56), a5);
  objc_storeStrong((id *)(v41 + 48), obj);
  *(_QWORD *)(v41 + 120) = a4;
  *(_QWORD *)(v41 + 128) = a3;
  objc_storeStrong((id *)(v41 + 40), a10);
  *(_BYTE *)(v41 + 11) = a11;
  *(_BYTE *)(v41 + 12) = a12;
  *(_BYTE *)(v41 + 10) = a18;
  *(_BYTE *)(v41 + 15) = a19;
  *(_BYTE *)(v41 + 8) = a21;
  *(_QWORD *)(v41 + 64) = a22;
  *(_QWORD *)(v41 + 72) = a20;
  *(_BYTE *)(v41 + 9) = a23;
  *(_BYTE *)(v41 + 16) = a24;
  *(_DWORD *)(v41 + 20) = a25;
  *(_BYTE *)(v41 + 13) = a26;
  objc_storeStrong((id *)(v41 + 136), v71);
  if (v32)
  {
    v42 = a8;
    objc_msgSend(v32, "infoForUnitType:", a8);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v41 + 144);
    *(_QWORD *)(v41 + 144) = v43;
  }
  else
  {
    v44 = *(void **)(v41 + 144);
    *(_QWORD *)(v41 + 144) = 0;
    v42 = a8;
  }

  v45 = 0;
  v46 = 0;
  v47 = 0;
  p_exponent = &a3->var7[1].exponent;
  while (1)
  {
    v49 = *p_exponent;
    p_exponent += 2;
    if (v49)
      break;
LABEL_22:
    if (++v45 == 16)
      goto LABEL_25;
  }
  if (v47 <= 0)
  {
    v47 = 1;
    v46 = v45;
    goto LABEL_22;
  }
  v46 = 0;
LABEL_25:
  if ((int)v42 < 1)
    unitID = 0;
  else
    unitID = a3->var7[v46 + 1].unitID;
  *(_DWORD *)(v41 + 28) = unitID;
  objc_storeStrong((id *)(v41 + 152), a13);
  *(_QWORD *)(v41 + 160) = a14;
  *(_DWORD *)(v41 + 32) = a15;
  *(_OWORD *)(v41 + 168) = *(_OWORD *)a16->var0;
  v51 = *(_OWORD *)&a16->var0[2];
  v52 = *(_OWORD *)&a16->var0[4];
  v53 = *(_OWORD *)&a16->var0[6];
  *(_OWORD *)(v41 + 232) = *(_OWORD *)&a16->var0[8];
  *(_OWORD *)(v41 + 216) = v53;
  *(_OWORD *)(v41 + 200) = v52;
  *(_OWORD *)(v41 + 184) = v51;
  v54 = *(_OWORD *)&a16->var0[10];
  v55 = *(_OWORD *)&a16->var0[12];
  v56 = *(_OWORD *)&a16->var0[14];
  *(_QWORD *)(v41 + 296) = a16->var0[16];
  *(_OWORD *)(v41 + 264) = v55;
  *(_OWORD *)(v41 + 280) = v56;
  *(_OWORD *)(v41 + 248) = v54;
  v57 = (void *)objc_opt_new();
  for (i = 0; i != 16; ++i)
  {
    if (a3->var7[i + 1].exponent)
    {
      +[CalculateUnit unitWithID:unitsInfo:exponent:](CalculateUnit, "unitWithID:unitsInfo:exponent:", a3->var7[i + 1].unitID, v32);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v59);

    }
  }
  v60 = (void *)objc_msgSend(v57, "copy");
  +[CalculateTerm termWithValue:units:result:](CalculateTerm, "termWithValue:units:result:", v38, v60, v41);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "setDecimalValue:", v73, v72);
  v79[0] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = *(void **)(v41 + 88);
  *(_QWORD *)(v41 + 88) = v62;

  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(v32, "infoForUnitType:", v42);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "name");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E6EAD1D0, "objectForKeyedSubscript:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
      v67 = (int)objc_msgSend(v66, "intValue");
    else
      v67 = 1;
    v30 = v78;
    *(_QWORD *)(v41 + 80) = v67;
    *(_DWORD *)(v41 + 24) = a9;

  }
  else
  {
    *(_QWORD *)(v41 + 80) = 0;
    *(_DWORD *)(v41 + 24) = 0;
    v30 = v78;
  }

LABEL_39:
  return (CalculateResult *)(id)v41;
}

+ (void)preferMeasurementSystemsForLocale:(id)a3 preferred:(unint64_t *)a4 fallback:(unint64_t *)a5
{
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;

  if (a4)
    *a4 = 2;
  if (a5)
    *a5 = 1;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C99800]))
  {
    v7 = v10;
    if (a4)
      *a4 = 3;
    if (a5)
    {
      v8 = 1;
LABEL_15:
      *a5 = v8;
    }
  }
  else
  {
    v9 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C997F8]);
    v7 = v10;
    if (v9)
    {
      if (a4)
        *a4 = 1;
      if (a5)
      {
        v8 = 2;
        goto LABEL_15;
      }
    }
  }

}

void __42__CalculateResult_defaultNumberFormatter___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultNumberFormatter__numberFormatters;
  defaultNumberFormatter__numberFormatters = v0;

}

@end
