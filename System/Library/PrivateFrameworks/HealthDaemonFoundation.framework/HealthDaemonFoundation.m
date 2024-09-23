void sub_210F9BF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HDKeyPathTypeHasForeignKey(int a1)
{
  return (a1 - 6) < 3;
}

const __CFString *HDSQLForForeignKeyDeletionAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("NO ACTION");
  else
    return off_24CB181D8[a1 - 1];
}

void logActiveStatement(sqlite3_stmt *a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD2FD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
    logActiveStatement_cold_1(a1, v2);
}

void collectStatementStrings(int a1, sqlite3_stmt *pStmt, void *a3)
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_sql(pStmt));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "addObject:", v4);

}

uint64_t SQLite3StatementRelease(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id _HDXPCPeriodicActivityLastSuccessfulRunUserDefaultsKey(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("PeriodicActivity-%@-LastSuccessfulRun"), v2);

  return v3;
}

void sub_210FA0238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _HDXPCPeriodicActivityEarliestNextRunUserDefaultsKey(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("PeriodicActivity-%@-EarliestNextRun"), v2);

  return v3;
}

__CFString *HDStringFromXPCPeriodicActivityResult(unint64_t a1)
{
  if (a1 < 5)
    return off_24CB18318[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id _HDXPCPeriodicActivityErrorCountUserDefaultsKey(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("PeriodicActivity-%@-ErrorCount"), v2);

  return v3;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const __CFString *HDStringFromContentProtectionState(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("unknown");
  else
    return off_24CB18450[a1];
}

id _HDSQLiteValueForDate(void *a1)
{
  void *v1;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    objc_msgSend(v1, "numberWithDouble:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

id _HDSQLiteValueForString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id _HDSQLiteValueForData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id _HDSQLiteValueForUUID(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "hk_dataForUUIDBytes");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    _HDSQLiteValueForData(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _HDSQLiteValueForDataType(void *a1)
{
  if (a1)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "code"));
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

id _HDSQLiteValueForQuantity(void *a1, uint64_t a2)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "doubleValueForUnit:", a2);
    objc_msgSend(v2, "numberWithDouble:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

id _HDSQLiteValueForNumber(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id _HDDateForSQLiteValue(void *a1)
{
  void *v1;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(a1, "doubleValue");
    objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id _HDUUIDForSQLiteValue(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "hk_UUIDWithData:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id _HDQuantityForSQLiteValue(id a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDD3E50];
    v4 = a2;
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void sub_210FA43B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_210FA59EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void _LogOrAppend(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (a3)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      _LogOrAppend_cold_1((uint64_t)v5, v8);
  }
  else
  {
    objc_msgSend(v6, "appendString:", v5);
    objc_msgSend(v7, "appendString:", CFSTR("\n"));
  }

}

id HDSQLiteSchemaDiff(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t m;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t n;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  int v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t jj;
  uint64_t v103;
  void *v104;
  char v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t kk;
  uint64_t v112;
  void *v113;
  char v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t mm;
  uint64_t v121;
  void *v122;
  char v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t nn;
  uint64_t v130;
  void *v131;
  char v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  int v137;
  const __CFString *v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i1;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i2;
  uint64_t v154;
  void *v155;
  void *v156;
  id v157;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  id obj;
  id v167;
  id v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  uint64_t v174;
  id v175;
  id v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  id v183;
  id v184;
  void *v185;
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  _BYTE v244[128];
  uint64_t v245;

  v245 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v165 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v160 = v3;
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v159 = v4;
  objc_msgSend(v4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  obj = v7;
  v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v232, 16);
  if (v163)
  {
    v161 = *(_QWORD *)v192;
    do
    {
      for (i = 0; i != v163; ++i)
      {
        if (*(_QWORD *)v192 != v161)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * i);
        objc_msgSend(v162, "member:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v164 = i;
          objc_msgSend(v160, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v165;
          v175 = v11;
          v16 = v13;
          v169 = v14;
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = 0u;
          v204 = 0u;
          v205 = 0u;
          v206 = 0u;
          objc_msgSend(v16, "tables");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v203, v235, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v204;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v204 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * j));
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v203, v235, 16);
            }
            while (v20);
          }

          v201 = 0u;
          v202 = 0u;
          v199 = 0u;
          v200 = 0u;
          objc_msgSend(v169, "tables");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v199, v234, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v200;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v200 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(v177, "addObject:", *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * k));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v199, v234, 16);
            }
            while (v25);
          }

          v197 = 0u;
          v198 = 0u;
          v195 = 0u;
          v196 = 0u;
          v176 = v17;
          v171 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v195, v233, 16);
          if (v171)
          {
            v170 = *(_QWORD *)v196;
            v167 = v15;
            v168 = v16;
            do
            {
              for (m = 0; m != v171; ++m)
              {
                if (*(_QWORD *)v196 != v170)
                  objc_enumerationMutation(v176);
                v29 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * m);
                objc_msgSend(v177, "member:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v30)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LHS: %@: extra table '%@'"), v175, v29);
                  v34 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addObject:", v34);
                  goto LABEL_113;
                }
                v174 = m;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v175, v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "tables");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "objectForKeyedSubscript:", v29);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "tables");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "objectForKeyedSubscript:", v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v186 = v15;
                v34 = v31;
                v35 = v32;
                v36 = (void *)MEMORY[0x24BDBCF20];
                v184 = v35;
                objc_msgSend(v35, "columns");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "allKeys");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setWithArray:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                v40 = (void *)MEMORY[0x24BDBCF20];
                v185 = v33;
                objc_msgSend(v33, "columns");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "allKeys");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setWithArray:", v42);
                v181 = (void *)objc_claimAutoreleasedReturnValue();

                v229 = 0u;
                v230 = 0u;
                v227 = 0u;
                v228 = 0u;
                v43 = v39;
                v178 = v43;
                v182 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
                if (!v182)
                  goto LABEL_61;
                v180 = *(_QWORD *)v228;
                v183 = v34;
                do
                {
                  for (n = 0; n != v182; ++n)
                  {
                    if (*(_QWORD *)v228 != v180)
                      objc_enumerationMutation(v178);
                    v45 = *(_QWORD *)(*((_QWORD *)&v227 + 1) + 8 * n);
                    objc_msgSend(v181, "member:", v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v46)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LHS: %@: extra column '%@'"), v34, v45);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v48);
                      goto LABEL_59;
                    }
                    objc_msgSend(v184, "columns");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "objectForKeyedSubscript:", v45);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v185, "columns");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "objectForKeyedSubscript:", v45);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v48, "type");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "type");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v51, "isEqualToString:", v52);

                    if ((v53 & 1) == 0)
                    {
                      v54 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v48, "type");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "type");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: Column %@ types differ: %@ vs %@"), v34, v45, v55, v56);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v57);

                    }
                    objc_msgSend(v48, "defaultValue");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "defaultValue");
                    v59 = objc_claimAutoreleasedReturnValue();
                    if (v58 == (void *)v59)
                    {
                      v66 = v58;
                      goto LABEL_43;
                    }
                    v60 = (void *)v59;
                    objc_msgSend(v50, "defaultValue");
                    v61 = objc_claimAutoreleasedReturnValue();
                    if (!v61)
                    {

LABEL_42:
                      v67 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v48, "defaultValue");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "defaultValue");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "stringWithFormat:", CFSTR("%@: Column %@ default values differ: %@ vs %@"), v34, v45, v66, v58);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v68);

LABEL_43:
                      goto LABEL_44;
                    }
                    v62 = (void *)v61;
                    objc_msgSend(v48, "defaultValue");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "defaultValue");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v63, "isEqualToString:", v64);

                    v34 = v183;
                    if ((v65 & 1) == 0)
                      goto LABEL_42;
LABEL_44:
                    v69 = objc_msgSend(v48, "isNullable");
                    if (v69 != objc_msgSend(v50, "isNullable"))
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Column %@ nullability differs: %d vs %d"), v34, v45, objc_msgSend(v48, "isNullable"), objc_msgSend(v50, "isNullable"));
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v70);

                    }
                    v71 = objc_msgSend(v48, "isPrimaryKey");
                    if (v71 != objc_msgSend(v50, "isPrimaryKey"))
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Column %@ pk status differs: %d vs %d"), v34, v45, objc_msgSend(v48, "isPrimaryKey"), objc_msgSend(v50, "isPrimaryKey"));
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v72);

                    }
                    v73 = objc_msgSend(v48, "isAutoincrement");
                    if (v73 != objc_msgSend(v50, "isAutoincrement"))
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Column %@ nullability differs: %d vs %d"), v34, v45, objc_msgSend(v48, "isAutoincrement"), objc_msgSend(v50, "isAutoincrement"));
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v74);

                    }
                    objc_msgSend(v48, "foreignKeyTargetTable");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "foreignKeyTargetTable");
                    v76 = objc_claimAutoreleasedReturnValue();
                    if (v75 == (void *)v76)
                    {
                      v83 = v75;
                    }
                    else
                    {
                      v77 = (void *)v76;
                      v179 = v45;
                      objc_msgSend(v50, "foreignKeyTargetTable");
                      v78 = objc_claimAutoreleasedReturnValue();
                      if (v78)
                      {
                        v79 = (void *)v78;
                        objc_msgSend(v48, "foreignKeyTargetTable");
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v50, "foreignKeyTargetTable");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        v82 = objc_msgSend(v80, "isEqualToString:", v81);

                        if ((v82 & 1) != 0)
                          goto LABEL_58;
                      }
                      else
                      {

                      }
                      v84 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v48, "foreignKeyTargetTable");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "foreignKeyTargetColumn");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      HDSQLForForeignKeyDeletionAction(objc_msgSend(v48, "deletionAction"));
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "foreignKeyTargetTable");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "foreignKeyTargetColumn");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      HDSQLForForeignKeyDeletionAction(objc_msgSend(v50, "deletionAction"));
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v84, "stringWithFormat:", CFSTR("%@: Column %@ foreign key differs: %@(%@) %@ vs %@(%@) %@"), v183, v179, v83, v75, v85, v86, v87, v88);
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "addObject:", v89);

                    }
LABEL_58:

                    v34 = v183;
LABEL_59:

                  }
                  v43 = v178;
                  v182 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v227, v244, 16);
                }
                while (v182);
LABEL_61:

                v225 = 0u;
                v226 = 0u;
                v223 = 0u;
                v224 = 0u;
                v90 = v181;
                v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v223, &v240, 16);
                if (v91)
                {
                  v92 = v91;
                  v93 = *(_QWORD *)v224;
                  do
                  {
                    for (ii = 0; ii != v92; ++ii)
                    {
                      if (*(_QWORD *)v224 != v93)
                        objc_enumerationMutation(v90);
                      v95 = *(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * ii);
                      objc_msgSend(v43, "member:", v95);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v96)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RHS: %@: extra column '%@'"), v34, v95);
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v186, "addObject:", v97);

                      }
                    }
                    v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v223, &v240, 16);
                  }
                  while (v92);
                }

                v221 = 0u;
                v222 = 0u;
                v219 = 0u;
                v220 = 0u;
                objc_msgSend(v184, "indices");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v219, v239, 16);
                if (v99)
                {
                  v100 = v99;
                  v101 = *(_QWORD *)v220;
                  do
                  {
                    for (jj = 0; jj != v100; ++jj)
                    {
                      if (*(_QWORD *)v220 != v101)
                        objc_enumerationMutation(v98);
                      v103 = *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * jj);
                      objc_msgSend(v185, "indices");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v105 = objc_msgSend(v104, "containsObject:", v103);

                      if ((v105 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LHS: %@: extra index '%@'"), v34, v103);
                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v186, "addObject:", v106);

                      }
                    }
                    v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v219, v239, 16);
                  }
                  while (v100);
                }

                v217 = 0u;
                v218 = 0u;
                v215 = 0u;
                v216 = 0u;
                objc_msgSend(v185, "indices");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v215, v238, 16);
                if (v108)
                {
                  v109 = v108;
                  v110 = *(_QWORD *)v216;
                  do
                  {
                    for (kk = 0; kk != v109; ++kk)
                    {
                      if (*(_QWORD *)v216 != v110)
                        objc_enumerationMutation(v107);
                      v112 = *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * kk);
                      objc_msgSend(v184, "indices");
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      v114 = objc_msgSend(v113, "containsObject:", v112);

                      if ((v114 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RHS: %@: extra index '%@'"), v34, v112);
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v186, "addObject:", v115);

                      }
                    }
                    v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v215, v238, 16);
                  }
                  while (v109);
                }

                v213 = 0u;
                v214 = 0u;
                v211 = 0u;
                v212 = 0u;
                objc_msgSend(v184, "triggers");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v211, v237, 16);
                if (v117)
                {
                  v118 = v117;
                  v119 = *(_QWORD *)v212;
                  do
                  {
                    for (mm = 0; mm != v118; ++mm)
                    {
                      if (*(_QWORD *)v212 != v119)
                        objc_enumerationMutation(v116);
                      v121 = *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * mm);
                      objc_msgSend(v185, "triggers");
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      v123 = objc_msgSend(v122, "containsObject:", v121);

                      if ((v123 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LHS: %@: extra trigger '%@'"), v34, v121);
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v186, "addObject:", v124);

                      }
                    }
                    v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v211, v237, 16);
                  }
                  while (v118);
                }

                v209 = 0u;
                v210 = 0u;
                v207 = 0u;
                v208 = 0u;
                objc_msgSend(v185, "triggers");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v207, v236, 16);
                if (v126)
                {
                  v127 = v126;
                  v128 = *(_QWORD *)v208;
                  do
                  {
                    for (nn = 0; nn != v127; ++nn)
                    {
                      if (*(_QWORD *)v208 != v128)
                        objc_enumerationMutation(v125);
                      v130 = *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * nn);
                      objc_msgSend(v184, "triggers");
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      v132 = objc_msgSend(v131, "containsObject:", v130);

                      if ((v132 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RHS: %@: extra trigger '%@'"), v34, v130);
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v186, "addObject:", v133);

                      }
                    }
                    v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v207, v236, 16);
                  }
                  while (v127);
                }

                objc_msgSend(v184, "createTableSchema");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = objc_msgSend(v134, "containsString:", CFSTR("WITHOUT ROWID"));

                objc_msgSend(v185, "createTableSchema");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = objc_msgSend(v136, "containsString:", CFSTR("WITHOUT ROWID"));

                if (!v135)
                {
                  v138 = CFSTR("RHS table constructed WITHOUT ROWID, but LHS table is not");
                  v15 = v167;
                  v16 = v168;
                  v139 = v173;
                  m = v174;
                  v140 = v172;
                  if (!v137)
                    goto LABEL_112;
LABEL_111:
                  objc_msgSend(v186, "addObject:", v138);
                  goto LABEL_112;
                }
                v138 = CFSTR("LHS table constructed WITHOUT ROWID, but RHS table is not");
                v15 = v167;
                v16 = v168;
                v139 = v173;
                m = v174;
                v140 = v172;
                if ((v137 & 1) == 0)
                  goto LABEL_111;
LABEL_112:

LABEL_113:
              }
              v171 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v195, v233, 16);
            }
            while (v171);
          }

          v243 = 0u;
          v242 = 0u;
          v241 = 0u;
          v240 = 0u;
          v141 = v177;
          v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v240, v244, 16);
          if (v142)
          {
            v143 = v142;
            v144 = *(_QWORD *)v241;
            do
            {
              for (i1 = 0; i1 != v143; ++i1)
              {
                if (*(_QWORD *)v241 != v144)
                  objc_enumerationMutation(v141);
                v146 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * i1);
                objc_msgSend(v176, "member:", v146);
                v147 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v147)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RHS: %@: extra table '%@'"), v175, v146);
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addObject:", v148);

                }
              }
              v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v240, v244, 16);
            }
            while (v143);
          }

          i = v164;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LHS has extra database '%@'"), v11);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "addObject:", v16);
        }

      }
      v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v232, 16);
    }
    while (v163);
  }

  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v149 = v162;
  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v187, v231, 16);
  if (v150)
  {
    v151 = v150;
    v152 = *(_QWORD *)v188;
    do
    {
      for (i2 = 0; i2 != v151; ++i2)
      {
        if (*(_QWORD *)v188 != v152)
          objc_enumerationMutation(v149);
        v154 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * i2);
        objc_msgSend(obj, "member:", v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v155)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RHS has extra database '%@'"), v154);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "addObject:", v156);

        }
      }
      v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v187, v231, 16);
    }
    while (v151);
  }

  v157 = v165;
  return v157;
}

void sub_210FA899C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210FAAD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_210FAB9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromGatedActivityResult(unint64_t a1)
{
  if (a1 < 3)
    return off_24CB18840[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_210FAD698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FAD898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FADC64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FADD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)HDSQLiteDatabase;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sqlite3_exec_busy_retry(sqlite3 *a1, const char *a2, int (__cdecl *a3)(void *, int, char **, char **), void *a4, char **a5)
{
  char **v5;
  void *v6;
  int (*v7)(void *, int, char **, char **);
  const char *v8;
  sqlite3 *v9;
  uint64_t result;

  v5 = a5;
  v6 = a4;
  v7 = (int (*)(void *, int, char **, char **))a3;
  v8 = a2;
  v9 = a1;
  while (1)
  {
    result = sqlite3_exec(a1, a2, a3, a4, a5);
    if (result != 5)
      break;
    usleep(0x14u);
    a1 = v9;
    a2 = v8;
    a3 = (int (__cdecl *)(void *, int, char **, char **))v7;
    a4 = v6;
    a5 = v5;
  }
  return result;
}

id HDSQLiteErrorFromDatabase(sqlite3 *a1, sqlite3_stmt *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = sqlite3_extended_errcode(a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", sqlite3_errmsg(a1), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", sqlite3_sql(a2), 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  HDSQLiteErrorWithExtendedCode(v6, v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_210FADEEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteDatabaseErrorFromSQLiteError(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = *MEMORY[0x24BDD0FC8];
  v9[0] = *MEMORY[0x24BDD1398];
  v9[1] = v2;
  v10[0] = v1;
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SQLite error: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthd.SQLite"), 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_210FAE018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_210FAE26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210FAE334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210FAE3B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FAE644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FAE718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FAE830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FAE8F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FAF35C()
{
  JUMPOUT(0x210FAF4CCLL);
}

void sub_210FAF38C()
{
  JUMPOUT(0x210FAF4D8);
}

void sub_210FAF394()
{
  JUMPOUT(0x210FAF39CLL);
}

void sub_210FAF488()
{
  void *v0;
  void *v1;
  void *v2;

  objc_end_catch();
  JUMPOUT(0x210FAF4C4);
}

void sub_210FAF4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, char a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  if ((a16 & 1) != 0)
    objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_210FAF4E0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_210FAF5B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FAFA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_210FB0060(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void HDSQLiteRow::~HDSQLiteRow(HDSQLiteRow *this)
{
  *(_QWORD *)this = &unk_24CB18A80;
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)this + 24);
}

{
  *(_QWORD *)this = &unk_24CB18A80;
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)this + 24);
  JUMPOUT(0x212BD33A8);
}

void sub_210FB01B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210FB030C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB03DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_210FB04E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FB0678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

__CFString *HDSQLiteDatabaseNamePrefix(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@."), v1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_24CB19CC0;
  }

  return v2;
}

void sub_210FB0744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB092C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_210FB0A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210FB0D18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_210FB0E54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FB0F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_210FB1650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  void *v63;
  void *v64;

  _Unwind_Resume(a1);
}

void sub_210FB1920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_210FB1B70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FB1DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FB2084(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB21BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB2308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210FB23D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB24FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB2578(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB2618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB2680(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  double v8;
  id v9;
  uint64_t v10;
  int v11;
  const char *v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (v6)
      v7 = (const char *)v6;
    else
      v7 = "";
    sqlite3_bind_text(a1, a2, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      sqlite3_bind_double(a1, a2, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((unint64_t)objc_msgSend(v5, "length") >= 0x7FFFFFFF)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt * _Nonnull, int, id  _Nonnull __strong)");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("HDSQLiteDatabase.mm"), 1493, CFSTR("NSData parameter passed to SQLiteBindFoundationValueToStatement (%lu bytes) is larger than maximum allowed SQLite blob (%lu bytes)"), objc_msgSend(v5, "length"), 0x7FFFFFFFLL);

        }
        v9 = objc_retainAutorelease(v5);
        v10 = objc_msgSend(v9, "bytes");
        v11 = objc_msgSend(v9, "length");
        if (v10)
          v12 = (const char *)v10;
        else
          v12 = "";
        sqlite3_bind_blob(a1, a2, v12, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20[0] = 0;
          v20[1] = 0;
          objc_msgSend(v5, "getUUIDBytes:", v20);
          sqlite3_bind_blob(a1, a2, v20, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HDSQLiteBindFoundationValueToStatement(sqlite3_stmt * _Nonnull, int, id  _Nonnull __strong)");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("HDSQLiteDatabase.mm"), 1502, CFSTR("Binding unexpected value class %@"), objc_opt_class());

          }
          v13 = objc_retainAutorelease(v5);
          v14 = (const char *)objc_msgSend(v13, "objCType");
          if (!strcmp(v14, "d") || !strcmp(v14, "f"))
          {
            objc_msgSend(v13, "doubleValue");
            sqlite3_bind_double(a1, a2, v15);
          }
          else
          {
            sqlite3_bind_int64(a1, a2, objc_msgSend(v13, "longLongValue"));
          }
        }
      }
    }
  }
  else
  {
    sqlite3_bind_null(a1, a2);
  }

}

void sub_210FB29D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB2AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FB2C80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FB2E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_210FB2FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_210FB306C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB326C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_210FB3314(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteErrorWithExtendedCode(uint64_t a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v17[0] = CFSTR("extended_error_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("error_message");
  v18[0] = v10;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = &stru_24CB19CC0;
  if (v7)
    v13 = v7;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("A SQLite error occurred: (%d) %@"), a1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("sql_statement"));
    objc_msgSend(v14, "appendFormat:", CFSTR(" (failing statement: \"%@\")"), v8);
  }
  if (v9)
  {
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("context"));
    objc_msgSend(v14, "appendFormat:", CFSTR(" <%@>"), v9);
  }
  objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SQLite"), a1, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_210FB3600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210FB3744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_210FB3860(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FB394C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteBindFoundationValuesToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  LODWORD(v6) = a2;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v6 = v6;
  if (v5)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        HDSQLiteBindFoundationValueToStatement(a1, v6 + v8, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      LODWORD(v6) = v6 + v8;
    }
    while (v5);
    v6 = (v9 + v8);
  }

  return v6;
}

void sub_210FB3A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void HDSQLiteBindStringToStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v7, "UTF8String");
  if (v5)
    v6 = (const char *)v5;
  else
    v6 = "";
  sqlite3_bind_text(a1, a2, v6, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

void sub_210FB3B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id HDSQLiteFoundationValueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  int v4;
  void *v5;
  const void *v6;

  v4 = sqlite3_column_type(a1, a2) - 1;
  v5 = 0;
  switch(v4)
  {
    case 0:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 1:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 2:
      HDSQLiteStringValueForStatementColumn(a1, a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      return v5;
    default:
      v6 = sqlite3_column_blob(a1, a2);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v6, sqlite3_column_bytes(a1, a2));
      break;
  }
  return v5;
}

id HDSQLiteStringValueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", sqlite3_column_text(a1, a2));
}

uint64_t HDSQLiteRow::HDSQLiteRow(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5;
  int v6;

  v5 = a3;
  *(_QWORD *)a1 = &unk_24CB18A80;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = sqlite3_column_count(a2);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 20) = v6;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(_QWORD *)(a1 + 8) = a2;
  if (v5)
    HDSQLiteRow::setColumnNames(a1, v5);

  return a1;
}

void sub_210FB3CF0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v2);

  _Unwind_Resume(a1);
}

void HDSQLiteRow::setColumnNames(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    v6 = a1 + 24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v8 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i)), "UTF8String");
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(v6, &v8, &v8, &v13);
        ++v13;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v4);
  }

}

void sub_210FB3E30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

sqlite3_int64 HDSQLiteRow::columnAsInt64(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "virtual int64_t HDSQLiteRow::columnAsInt64(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 67, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "virtual int64_t HDSQLiteRow::columnAsInt64(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 68, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  return sqlite3_column_int64(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
}

void sub_210FB3FAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteRow::indexOfColumn(sqlite3_stmt **this, const char *a2)
{
  _QWORD *v3;
  int v4;
  uint64_t **v5;
  const char *v7;
  int v8;
  const char *v9;

  v9 = a2;
  v3 = this + 3;
  if (!this[6])
  {
    v8 = 0;
    if (*((int *)this + 5) >= 1)
    {
      v4 = 0;
      do
      {
        v7 = sqlite3_column_name(this[1], v4);
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>((uint64_t)v3, &v7, &v7, &v8);
        v4 = v8 + 1;
        v8 = v4;
      }
      while (v4 < *((_DWORD *)this + 5));
    }
  }
  v5 = std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>(v3, &v9);
  if (v5)
    return (*((_DWORD *)v5 + 6) - *((_DWORD *)this + 4));
  else
    return 0xFFFFFFFFLL;
}

void *std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(uint64_t a1, const char **a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  const char *v8;
  char v9;
  unint64_t v10;
  unsigned __int8 *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  void **v19;
  void *i;
  unint64_t v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;

  v8 = *a2;
  v9 = **a2;
  if (v9)
  {
    v10 = 0;
    v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      v10 = (1025 * (v10 + v9)) ^ ((1025 * (v10 + v9)) >> 6);
      v12 = *v11++;
      v9 = v12;
    }
    while (v12);
    v13 = 9 * v10;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13 ^ (v13 >> 11);
  v15 = 32769 * v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16)
  {
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      v4 = 32769 * v14;
      if (v15 >= v16)
        v4 = v15 % v16;
    }
    else
    {
      v4 = v15 & (v16 - 1);
    }
    v19 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v19)
    {
      for (i = *v19; i; i = *(void **)i)
      {
        v21 = *((_QWORD *)i + 1);
        if (v21 == v15)
        {
          if (!strcmp(*((const char **)i + 2), v8))
            return i;
        }
        else
        {
          if (v18 > 1)
          {
            if (v21 >= v16)
              v21 %= v16;
          }
          else
          {
            v21 &= v16 - 1;
          }
          if (v21 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v15;
  *((_QWORD *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  v22 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v23 = *(float *)(a1 + 32);
  if (!v16 || (float)(v23 * (float)v16) < v22)
  {
    v24 = 1;
    if (v16 >= 3)
      v24 = (v16 & (v16 - 1)) != 0;
    v25 = v24 | (2 * v16);
    v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26)
      v27 = v26;
    else
      v27 = v25;
    std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(a1, v27);
    v16 = *(_QWORD *)(a1 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v15 >= v16)
        v4 = v15 % v16;
      else
        v4 = v15;
    }
    else
    {
      v4 = (v16 - 1) & v15;
    }
  }
  v28 = *(_QWORD *)a1;
  v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v29)
  {
    *(_QWORD *)i = *v29;
LABEL_43:
    *v29 = i;
    goto LABEL_44;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v28 + 8 * v4) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v30 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v30 >= v16)
        v30 %= v16;
    }
    else
    {
      v30 &= v16 - 1;
    }
    v29 = (_QWORD *)(*(_QWORD *)a1 + 8 * v30);
    goto LABEL_43;
  }
LABEL_44:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_210FB42D0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t **std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>(_QWORD *a1, const char **a2)
{
  const char *v2;
  char v3;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t ***v13;
  uint64_t **i;
  unint64_t v15;

  v2 = *a2;
  v3 = **a2;
  if (v3)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      v4 = (1025 * (v4 + v3)) ^ ((1025 * (v4 + v3)) >> 6);
      v6 = *v5++;
      v3 = v6;
    }
    while (v6);
    v7 = 9 * v4;
  }
  else
  {
    v7 = 0;
  }
  v8 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v8)
    return 0;
  v9 = 32769 * (v7 ^ (v7 >> 11));
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = 32769 * (v7 ^ (v7 >> 11));
    if (v9 >= *(_QWORD *)&v8)
      v12 = v9 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = v9 & (*(_QWORD *)&v8 - 1);
  }
  v13 = *(uint64_t ****)(*a1 + 8 * v12);
  if (!v13)
    return 0;
  for (i = *v13; i; i = (uint64_t **)*i)
  {
    v15 = (unint64_t)i[1];
    if (v15 == v9)
    {
      if (!strcmp((const char *)i[2], v2))
        return i;
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(_QWORD *)&v8)
          v15 %= *(_QWORD *)&v8;
      }
      else
      {
        v15 &= *(_QWORD *)&v8 - 1;
      }
      if (v15 != v12)
        return 0;
    }
  }
  return i;
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

id OUTLINED_FUNCTION_7(id a1, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = a1;
  return a1;
}

void sub_210FB4D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210FB650C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _StringEscapingSpecialCharactersForLikePredicate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v1 = (objc_class *)MEMORY[0x24BDD16A8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_msgSend(v2, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___StringEscapingSpecialCharactersForLikePredicate_block_invoke;
  v7[3] = &unk_24CB18BA8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v7);

  return v5;
}

void _BindValueToStatement(void *a1, sqlite3_stmt *a2, int *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  const char *v8;
  id v9;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;
  const char *v14;
  int v15;
  sqlite3_stmt *v16;
  int v17;
  const char *v18;
  int v19;
  double v20;
  sqlite3_stmt *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_retainAutorelease(v5);
      v10 = (const char *)objc_msgSend(v9, "objCType");
      if (strcmp(v10, "d") && strcmp(v10, "f"))
      {
        sqlite3_bind_int64(a2, *a3, objc_msgSend(v9, "longLongValue"));
        goto LABEL_22;
      }
      v19 = *a3;
      objc_msgSend(v9, "doubleValue");
      v21 = a2;
      v22 = v19;
LABEL_18:
      sqlite3_bind_double(v21, v22, v20);
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = *a3;
      v12 = objc_retainAutorelease(v5);
      v13 = objc_msgSend(v12, "bytes");
      if (v13)
        v14 = (const char *)v13;
      else
        v14 = "";
      v15 = objc_msgSend(v12, "length");
      v16 = a2;
      v17 = v11;
      v18 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = *a3;
        objc_msgSend(v5, "timeIntervalSinceReferenceDate");
        v21 = a2;
        v22 = v23;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v5)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _BindValueToStatement(__strong id, sqlite3_stmt *, int *)");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("HDSQLitePredicate.m"), 1157, CFSTR("Unsupported predicate value: %@"), v5);

        }
        else
        {
          sqlite3_bind_null(a2, *a3);
        }
        goto LABEL_22;
      }
      v26[0] = 0;
      v26[1] = 0;
      objc_msgSend(v5, "getUUIDBytes:", v26);
      v17 = *a3;
      v18 = (const char *)v26;
      v16 = a2;
      v15 = 16;
    }
    sqlite3_bind_blob(v16, v17, v18, v15, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_22;
  }
  v6 = *a3;
  v7 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  if (v7)
    v8 = (const char *)v7;
  else
    v8 = "";
  sqlite3_bind_text(a2, v6, v8, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_22:
  ++*a3;

}

__CFString *HDSQLOperatorForComparisonType(uint64_t a1)
{
  void *v3;
  void *v4;

  if ((unint64_t)(a1 - 1) < 8)
    return off_24CB18BF0[a1 - 1];
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *HDSQLOperatorForComparisonType(HDSQLiteComparisonType)");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HDSQLitePredicate.m"), 1096, CFSTR("Invalid comparison type: %ld"), a1);

  return 0;
}

uint64_t HDSQLiteComparisonTypeForPredicateOperator(unint64_t a1)
{
  NSObject *v2;

  if (a1 < 0xB && ((0x4BFu >> a1) & 1) != 0)
    return qword_210FD5638[a1];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
    HDSQLiteComparisonTypeForPredicateOperator_cold_1(a1, v2);
  return 0;
}

void _HDCFNotificationCallback(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingNotificationsLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)_pendingNotifications;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
      if (objc_msgSend(v9, "notification", (_QWORD)v12) == a1)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (!v10)
      goto LABEL_14;
    objc_msgSend((id)_pendingNotifications, "removeObject:", v10);
    if (!objc_msgSend((id)_pendingNotifications, "count"))
    {
      v11 = (void *)_pendingNotifications;
      _pendingNotifications = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
    objc_msgSend(v10, "_handleResponse:", a2);

  }
  else
  {
LABEL_9:

LABEL_14:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
  }
}

const __CFString *HDUserNotificationResponseButtonToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (a1 == 2)
    v1 = CFSTR("other");
  if (a1 == 1)
    return CFSTR("cancel");
  else
    return v1;
}

id HDSQLiteEntityDisambiguatedDatabaseTable(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (HDSQLiteEntityDisambiguatedDatabaseTable::onceToken != -1)
    dispatch_once(&HDSQLiteEntityDisambiguatedDatabaseTable::onceToken, &__block_literal_global_369);
  os_unfair_lock_lock((os_unfair_lock_t)&HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableLock);
  objc_msgSend((id)HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache, "objectForKey:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "databaseName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "databaseTable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v3, v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "databaseTable");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend((id)HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache, "setObject:forKey:", v2, a1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableLock);
  return v2;
}

void sub_210FBB4DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id HDSQLiteEntityDisambiguatedSQLForProperty(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("*"))
    || (objc_msgSend(a1, "joinClausesForProperty:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v9, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void sub_210FBB5D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBB6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id HDSQLiteEntityCreateTableSQL(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, char a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  id v23;
  void *v24;
  _BOOL4 HasForeignKey;
  _BOOL4 v26;
  NSObject *v27;
  _HDSQLiteEntityColumn *v28;
  BOOL v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  char v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  void (*v49)(uint64_t, void *);
  void *v50;
  id v51;
  _QWORD *v52;
  _QWORD v53[3];
  char v54;
  char v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  v16 = a4;
  v43 = a5;
  v42 = a6;
  v40 = a7;
  v17 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v39 = a8;
  objc_msgSend(v17, "appendFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ ("), v15, v15, v16, v17);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 1;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v49 = __HDSQLiteEntityCreateTableSQL_block_invoke;
  v50 = &unk_24CB18E08;
  v52 = v53;
  v18 = v17;
  v51 = v18;
  v19 = v16;
  v41 = v15;
  v20 = v48;
  v55 = 0;
  if (a3)
  {
    v21 = a3 - 1;
    v22 = (unsigned __int8 *)(a2 + 16);
    do
    {
      v23 = *((id *)v22 - 2);
      objc_msgSend(v19, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HasForeignKey = HDKeyPathTypeHasForeignKey(*v22);
      if (v24)
        v26 = 0;
      else
        v26 = HasForeignKey;
      if (v26)
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x24BDD2FD8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v23;
          v59 = 2112;
          v60 = v41;
          _os_log_fault_impl(&dword_210F9A000, v27, OS_LOG_TYPE_FAULT, "Expected foreign key for column %@ of table %@ and none found", buf, 0x16u);
        }
      }
      v28 = -[_HDSQLiteEntityColumn initWithName:columnType:keyPathType:foreignKey:]([_HDSQLiteEntityColumn alloc], "initWithName:columnType:keyPathType:foreignKey:", v23, *((_QWORD *)v22 - 1), *v22, v24);
      ((void (*)(_QWORD *, _HDSQLiteEntityColumn *, char *))v49)(v20, v28, &v55);
      v29 = v55 != 0;

      if (v21)
        v30 = v29;
      else
        v30 = 1;
      --v21;
      v22 += 24;
    }
    while ((v30 & 1) == 0);
  }

  if (v43)
  {
    if ((unint64_t)objc_msgSend(v43, "count") <= 1)
      __assert_rtn("HDSQLiteEntityCreateTableSQL", "HDSQLiteEntity.mm", 608, "primaryKeyColumns.count >= 2");
    objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", "));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR(", PRIMARY KEY(%@)"), v31);

  }
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR(", UNIQUE(%@)"), v32);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = v40;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "SQLCheckConstraint");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendFormat:", CFSTR(", CHECK(%@)"), v37);

      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v34);
  }

  objc_msgSend(v18, "appendString:", CFSTR(")"));
  if ((v39 & 1) == 0)
    objc_msgSend(v18, "appendString:", CFSTR(" WITHOUT ROWID"));

  _Block_object_dispose(v53, 8);
  return v18;
}

void sub_210FBBB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,char a36)
{
  void *v36;

  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

uint64_t HDSQLiteEntityHasColumnWithName(void *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t i;
  unint64_t v8;

  v3 = a2;
  v8 = 0;
  v4 = (_QWORD *)objc_msgSend(a1, "columnDefinitionsWithCount:", &v8);
  v5 = 0;
  if (v4 && v8)
  {
    for (i = 0; i < v8; ++i)
    {
      v5 = objc_msgSend(v3, "isEqualToString:", *v4);
      if ((v5 & 1) != 0)
        break;
      v4 += 3;
    }
  }

  return v5;
}

void sub_210FBBCE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void HDSQLiteEntityEnumerateColumns(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v10 = 0;
  if (objc_msgSend(a1, "columnDefinitionsWithCount:", &v10))
  {
    objc_msgSend(a1, "foreignKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __HDSQLiteEntityEnumerateColumns_block_invoke;
    v6[3] = &unk_24CB18DE0;
    v7 = v4;
    v9 = a1;
    v8 = v3;
    v5 = v4;
    _enumerateColumnDefinitions(a1, v6);

  }
}

void sub_210FBBDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id HDSQLiteEntityForProperty(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v15 = 0;
  v4 = MEMORY[0x24BDAC760];
  while (1)
  {
    if (!objc_msgSend(a1, "conformsToProtocol:", &unk_254A93B70))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __HDSQLiteEntityForProperty_block_invoke;
    v8[3] = &unk_24CB18DB8;
    v9 = v3;
    v10 = &v12;
    v11 = a1;
    _enumerateColumnDefinitions(a1, v8);
    v5 = (void *)v13[3];
    if (v5)
      break;
    a1 = (void *)objc_msgSend(a1, "superclass");

  }
  v6 = v5;

LABEL_7:
  _Block_object_dispose(&v12, 8);

  return v6;
}

void sub_210FBBF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HDSQLiteEntityAllDatabaseColumnNames(void *a1)
{
  id v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = MEMORY[0x24BDAC760];
  while (objc_msgSend(a1, "conformsToProtocol:", &unk_254A93B70))
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __HDSQLiteEntityAllDatabaseColumnNames_block_invoke;
    v5[3] = &unk_24CB18E30;
    v6 = v2;
    objc_msgSend(a1, "enumerateColumnsWithBlock:", v5);
    a1 = (void *)objc_msgSend(a1, "superclass");

  }
  return v2;
}

void sub_210FBC008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_210FBC128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBC26C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (v1)

  _Unwind_Resume(a1);
}

void sub_210FBC358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBC3F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_210FBC4D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FBC608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210FBC7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_210FBC85C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 48);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 8);
  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::assertAllPropertiesBound(HDSQLiteStatementBinder *this)
{
  const char **v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  v1 = (const char **)*((_QWORD *)this + 3);
  if (v1)
  {
    v2 = (_QWORD *)((char *)this + 48);
    do
    {
      if (!std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::find<char const*>(v2, v1 + 2))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HDSQLiteStatementBinder::assertAllPropertiesBound() const");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HDSQLiteStatementBinder_Internal.h"), 156, CFSTR("Property '%s' was never bound."), v1[2]);

      }
      v1 = (const char **)*v1;
    }
    while (v1);
  }
}

void sub_210FBC954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBCA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_210FBCBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_210FBCCAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 48);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1 + 8);
  _Unwind_Resume(a1);
}

void sub_210FBCDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_210FBCEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)va1);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_210FBCFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBD09C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210FBD1E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Block_object_dispose((const void *)(v3 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_210FBD600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_210FBD85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id HDSQLiteRow::columnAsNaturalType(HDSQLiteRow *this, int a2)
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id  _Nullable HDSQLiteRow::columnAsNaturalType(int) const");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("HDSQLiteRow_Internal.h"), 180, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id  _Nullable HDSQLiteRow::columnAsNaturalType(int) const");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HDSQLiteRow_Internal.h"), 181, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  switch(sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2))
  {
    case 1:
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", sqlite3_column_int64(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
      break;
    case 2:
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
      break;
    case 3:
      HDSQLiteRow::columnAsString(this, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      HDSQLiteRow::columnAsData(this, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

void sub_210FBDAAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBDBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HDSQLiteRow::columnAsBoolean(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL HDSQLiteRow::columnAsBoolean(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 60, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL HDSQLiteRow::columnAsBoolean(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 61, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  return sqlite3_column_int(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2) != 0;
}

void sub_210FBDD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBDECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsDate(HDSQLiteRow *this, int a2)
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSDate * _Nullable HDSQLiteRow::columnAsDate(int) const");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("HDSQLiteRow_Internal.h"), 138, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSDate * _Nullable HDSQLiteRow::columnAsDate(int) const");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HDSQLiteRow_Internal.h"), 139, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  if (HDSQLiteRow::columnIsNull(this, a2))
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  return v4;
}

void sub_210FBE08C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBE1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsNumber(HDSQLiteRow *this, int a2)
{
  int v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNumber * _Nullable HDSQLiteRow::columnAsNumber(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 149, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNumber * _Nullable HDSQLiteRow::columnAsNumber(int) const");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("HDSQLiteRow_Internal.h"), 150, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  v4 = sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
  if (v4 == 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", sqlite3_column_int64(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }
  else if (v4 == 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_210FBE3E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBE540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *HDSQLiteRow::columnAsString(HDSQLiteRow *this, int a2)
{
  unsigned __int8 *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nullable HDSQLiteRow::columnAsString(int) const");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("HDSQLiteRow_Internal.h"), 81, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nullable HDSQLiteRow::columnAsString(int) const");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HDSQLiteRow_Internal.h"), 82, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  v4 = (unsigned __int8 *)sqlite3_column_text(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
  if (v4)
    v4 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
  return v4;
}

void sub_210FBE6E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBE844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsUUID(HDSQLiteRow *this, int a2)
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSUUID * _Nullable HDSQLiteRow::columnAsUUID(int) const");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("HDSQLiteRow_Internal.h"), 127, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSUUID * _Nullable HDSQLiteRow::columnAsUUID(int) const");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HDSQLiteRow_Internal.h"), 128, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  if (HDSQLiteRow::columnIsNull(this, a2))
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", sqlite3_column_blob(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2));
  return v4;
}

void sub_210FBEA08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBEABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FBEB64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _enumerateColumnDefinitions(void *a1, void *a2)
{
  void (**v3)(id, uint64_t, _BYTE *);
  uint64_t v4;
  unint64_t i;
  char v6;
  unint64_t v7;

  v3 = a2;
  v7 = 0;
  v6 = 0;
  v4 = objc_msgSend(a1, "columnDefinitionsWithCount:", &v7);
  if (v4 && v7)
  {
    for (i = 0; i < v7; ++i)
    {
      v3[2](v3, v4, &v6);
      if (v6)
        break;
      v4 += 24;
    }
  }

}

void sub_210FBEC4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FBEDD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FBEE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_210FBEF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteStatementBinder::HDSQLiteStatementBinder(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  *(_QWORD *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = 1065353216;
  v16 = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i)), "UTF8String");
        std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__emplace_unique_key_args<char const*,char const*,int &>(a1 + 8, &v11, &v11, &v16);
        ++v16;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return a1;
}

void sub_210FBF0B8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table(v1);

  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::find<char const*>(_QWORD *a1, const char **a2)
{
  const char *v2;
  char v3;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t ***v13;
  uint64_t **i;
  unint64_t v15;

  v2 = *a2;
  v3 = **a2;
  if (v3)
  {
    v4 = 0;
    v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      v4 = (1025 * (v4 + v3)) ^ ((1025 * (v4 + v3)) >> 6);
      v6 = *v5++;
      v3 = v6;
    }
    while (v6);
    v7 = 9 * v4;
  }
  else
  {
    v7 = 0;
  }
  v8 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v8)
    return 0;
  v9 = 32769 * (v7 ^ (v7 >> 11));
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = 32769 * (v7 ^ (v7 >> 11));
    if (v9 >= *(_QWORD *)&v8)
      v12 = v9 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = v9 & (*(_QWORD *)&v8 - 1);
  }
  v13 = *(uint64_t ****)(*a1 + 8 * v12);
  if (!v13)
    return 0;
  for (i = *v13; i; i = (uint64_t **)*i)
  {
    v15 = (unint64_t)i[1];
    if (v9 == v15)
    {
      if (!strcmp((const char *)i[2], v2))
        return i;
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(_QWORD *)&v8)
          v15 %= *(_QWORD *)&v8;
      }
      else
      {
        v15 &= *(_QWORD *)&v8 - 1;
      }
      if (v15 != v12)
        return 0;
    }
  }
  return i;
}

id HDSQLiteRow::columnAsData(HDSQLiteRow *this, int a2)
{
  void *v4;
  int v5;
  const void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSData * _Nullable HDSQLiteRow::columnAsData(int) const");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HDSQLiteRow_Internal.h"), 114, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSData * _Nullable HDSQLiteRow::columnAsData(int) const");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HDSQLiteRow_Internal.h"), 115, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  if (HDSQLiteRow::columnIsNull(this, a2))
  {
    v4 = 0;
  }
  else
  {
    v5 = *((_DWORD *)this + 4) + a2;
    v6 = sqlite3_column_blob(*((sqlite3_stmt **)this + 1), v5);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v6, sqlite3_column_bytes(*((sqlite3_stmt **)this + 1), v5));
  }
  return v4;
}

void sub_210FBF36C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL HDSQLiteRow::columnIsNull(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL HDSQLiteRow::columnIsNull(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 53, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL HDSQLiteRow::columnIsNull(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 54, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  return sqlite3_column_type(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2) == 5;
}

void sub_210FBF4AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return objc_opt_class();
}

void sub_210FBF590(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FBF714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBF91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FBFA24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FBFBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FBFEB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FBFFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC00C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC0184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC0490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_210FC073C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FC0800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FC08E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210FC0A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_210FC0BAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FC0EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_210FC118C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_210FC1384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_210FC14F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_210FC162C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_210FC16A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC1758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210FC17B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC1924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_210FC1A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_210FC1F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;

  _Unwind_Resume(a1);
}

void sub_210FC2190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210FC22E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_210FC242C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_210FC276C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_210FC2840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC2A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_210FC2B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC2BB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210FC2CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t HDCompareBuildVersionStrings(char *a1, char *a2)
{
  size_t v4;
  char v5;
  size_t v6;
  char v7;
  char v8;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v10;
  const char **p_first;
  int v12;
  std::vector<std::csub_match>::pointer p_p;
  int v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::match_results<const char *>::value_type *p_unmatched;
  char *first;
  char **p_second;
  unint64_t v23;
  BOOL v24;
  std::match_results<const char *>::value_type *v25;
  char *v26;
  char **v27;
  std::vector<std::csub_match>::pointer v28;
  unint64_t v29;
  std::match_results<const char *>::value_type *v30;
  int v31;
  std::vector<std::csub_match>::pointer v32;
  unint64_t v33;
  std::match_results<const char *>::value_type *v34;
  int v35;
  std::match_results<const char *>::value_type *v36;
  const char *v37;
  int v38;
  std::match_results<const char *>::value_type *v39;
  const char *v40;
  int v41;
  void *v42[2];
  char v43;
  void *v44[2];
  char v45;
  std::match_results<const char *> __p;
  std::match_results<const char *> v47;
  std::regex_traits<char> v48[2];
  std::__shared_weak_count *v49;

  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](v48, "(\\d+)([a-zA-z]+)(\\d+)([a-zA-Z]*)", 0);
  memset(&v47.__prefix_, 0, 17);
  memset(&v47.__suffix_, 0, 17);
  v47.__ready_ = 0;
  v47.__position_start_ = 0;
  memset(&v47, 0, 41);
  v4 = strlen(a1);
  if (std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v48, a1, &a1[v4], &v47, 4160))
  {
    if (v47.__suffix_.matched)
    {
      v5 = 0;
      v47.__matches_.__end_ = v47.__matches_.__begin_;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  memset(&__p.__prefix_, 0, 17);
  memset(&__p.__suffix_, 0, 17);
  __p.__ready_ = 0;
  __p.__position_start_ = 0;
  memset(&__p, 0, 41);
  v6 = strlen(a2);
  v7 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v48, a2, &a2[v6], &__p, 4160);
  if (__p.__suffix_.matched)
    v8 = 0;
  else
    v8 = v7;
  if ((v8 & 1) == 0)
  {
    if ((v5 & 1) == 0)
    {
      v15 = strcmp(a1, a2);
      goto LABEL_23;
    }
LABEL_21:
    v15 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if ((v5 & 1) == 0)
  {
LABEL_19:
    v15 = 1;
    goto LABEL_23;
  }
  begin = v47.__matches_.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v47.__matches_.__end_ - (char *)v47.__matches_.__begin_) >> 3);
  if (v10 <= 1)
    p_first = (const char **)&v47;
  else
    p_first = &v47.__matches_.__begin_->first;
  v12 = atoi(p_first[3]);
  if (0xAAAAAAAAAAAAAAABLL * (((char *)__p.__matches_.__end_ - (char *)__p.__matches_.__begin_) >> 3) <= 1)
    p_p = (std::vector<std::csub_match>::pointer)&__p;
  else
    p_p = __p.__matches_.__begin_;
  v14 = atoi(p_p[1].first);
  if (v12 < v14)
    goto LABEL_21;
  if (v12 > v14)
    goto LABEL_19;
  p_unmatched = begin + 2;
  if (v10 <= 2)
    p_unmatched = &v47.__unmatched_;
  first = (char *)p_unmatched->first;
  p_second = (char **)&begin[2].second;
  if (v10 <= 2)
    p_second = (char **)&v47.__unmatched_.second;
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(v44, first, *p_second, *p_second - first);
  v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__matches_.__end_ - (char *)__p.__matches_.__begin_) >> 3);
  v24 = v23 > 2;
  if (v23 <= 2)
    v25 = &__p.__unmatched_;
  else
    v25 = __p.__matches_.__begin_ + 2;
  v26 = (char *)v25->first;
  v27 = (char **)&__p.__matches_.__begin_[2].second;
  if (!v24)
    v27 = (char **)&__p.__unmatched_.second;
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(v42, v26, *v27, *v27 - v26);
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v44, v42) & 0x80) != 0)
    goto LABEL_50;
  if ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v44, v42) << 24) <= 0)
  {
    v28 = v47.__matches_.__begin_;
    v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v47.__matches_.__end_ - (char *)v47.__matches_.__begin_) >> 3);
    v30 = v47.__matches_.__begin_ + 3;
    if (v29 <= 3)
      v30 = &v47.__unmatched_;
    v31 = atoi(v30->first);
    v32 = __p.__matches_.__begin_;
    v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__matches_.__end_ - (char *)__p.__matches_.__begin_) >> 3);
    v34 = __p.__matches_.__begin_ + 3;
    if (v33 <= 3)
      v34 = &__p.__unmatched_;
    v35 = atoi(v34->first);
    if (v31 >= v35)
    {
      if (v31 > v35)
        goto LABEL_44;
      v36 = v28 + 4;
      if (v29 <= 4)
        v36 = &v47.__unmatched_;
      v37 = v36->first;
      v38 = *(unsigned __int8 *)v36->first;
      v39 = v32 + 4;
      if (v33 <= 4)
        v39 = &__p.__unmatched_;
      v40 = v39->first;
      v41 = *(unsigned __int8 *)v39->first;
      if (v38)
      {
        if (!v41)
          goto LABEL_44;
      }
      if (v38 || !v41)
      {
        v15 = 0;
        if (v38 && v41)
          v15 = strcmp(v37, v40);
        goto LABEL_51;
      }
    }
LABEL_50:
    v15 = 0xFFFFFFFFLL;
    goto LABEL_51;
  }
LABEL_44:
  v15 = 1;
LABEL_51:
  if (v43 < 0)
    operator delete(v42[0]);
  if (v45 < 0)
    operator delete(v44[0]);
LABEL_23:
  if (__p.__matches_.__begin_)
  {
    __p.__matches_.__end_ = __p.__matches_.__begin_;
    operator delete(__p.__matches_.__begin_);
  }
  if (v47.__matches_.__begin_)
  {
    v47.__matches_.__end_ = v47.__matches_.__begin_;
    operator delete(v47.__matches_.__begin_);
  }
  v16 = v49;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  std::locale::~locale(&v48[0].__loc_);
  return v15;
}

void sub_210FC307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  uint64_t v33;

  if (a17 < 0)
    operator delete(__p);
  if (a18)
    operator delete(a18);
  if (a32)
    operator delete(a32);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v33 - 88);
  std::locale::~locale((std::locale *)(v33 - 128));
  _Unwind_Resume(a1);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

BOOL HDSQLiteInstallCustomFunctionsInDatabase(sqlite3 *a1)
{
  _BOOL8 result;
  int function_v2;

  if (sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteCompareBuildVersionsFunction, "UTF8String"), 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteCompareBuildVersions, 0, 0, 0))
  {
    return 0;
  }
  function_v2 = sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteGenerateUUIDFunction, "UTF8String"), 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteGenerateUUID, 0, 0, 0);
  result = 0;
  if (!function_v2)
  {
    if (sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteConvertUUIDStringToBlobFunction, "UTF8String"), 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteConvertUUIDString, 0, 0, 0)|| sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteConvertBlobToUUIDStringFunction, "UTF8String"), 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteConvertBlobToUUIDString, 0, 0, 0)
      || sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteCompareQuantityMetadataValuesFunction, "UTF8String"), 4, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteCompareQuantityMetadataValues, 0, 0, 0))
    {
      return 0;
    }
    return sqlite3_create_function_v2(a1, (const char *)objc_msgSend((id)HDSQLiteMD5Function, "UTF8String"), 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_HDSQLiteMD5, 0, 0, 0) == 0;
  }
  return result;
}

void _HDSQLiteCompareBuildVersions(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  char *v5;
  char *v6;
  int v7;

  if (a2 == 2)
  {
    if (sqlite3_value_type(*a3) == 5 || sqlite3_value_type(a3[1]) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      v5 = (char *)sqlite3_value_text(*a3);
      v6 = (char *)sqlite3_value_text(a3[1]);
      v7 = HDCompareBuildVersionStrings(v5, v6);
      sqlite3_result_int(a1, v7);
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void _HDSQLiteGenerateUUID(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  id v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(v4, "getUUIDBytes:", v5);
  sqlite3_result_blob(a1, v5, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

void sub_210FC33EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _HDSQLiteConvertUUIDString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  const unsigned __int8 *v5;
  size_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      v5 = sqlite3_value_text(*a3);
      v6 = strlen((const char *)v5);
      v7 = objc_alloc(MEMORY[0x24BDD1880]);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v5, v6, 1);
      v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

      v10[0] = 0;
      v10[1] = 0;
      objc_msgSend(v9, "getUUIDBytes:", v10);
      sqlite3_result_blob(a1, v10, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_210FC3564(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _HDSQLiteConvertBlobToUUIDString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  void *v5;
  id v6;
  const char *v7;
  int v8;
  id v9;

  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 4 && sqlite3_value_bytes(*a3) == 16)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", sqlite3_value_blob(*a3));
      v9 = v5;
      if (v5)
      {
        objc_msgSend(v5, "UUIDString");
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v7 = (const char *)objc_msgSend(v6, "UTF8String");

        v8 = strlen(v7);
        sqlite3_result_text(a1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        sqlite3_result_null(a1);
      }

    }
    else
    {
      sqlite3_result_null(a1);
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_210FC368C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _HDSQLiteCompareQuantityMetadataValues(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  double v5;
  const unsigned __int8 *v6;
  double v7;
  const unsigned __int8 *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  if (a2 == 4)
  {
    if (sqlite3_value_type(*a3) == 5
      || sqlite3_value_type(a3[1]) == 5
      || sqlite3_value_type(a3[2]) == 5
      || sqlite3_value_type(a3[3]) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      v5 = sqlite3_value_double(*a3);
      v6 = sqlite3_value_text(a3[1]);
      v7 = sqlite3_value_double(a3[2]);
      v8 = sqlite3_value_text(a3[3]);
      v9 = (void *)MEMORY[0x24BDD3E50];
      v10 = (void *)MEMORY[0x24BDD4048];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unitFromString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "quantityWithUnit:doubleValue:", v12, v5);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD3E50];
      v14 = (void *)MEMORY[0x24BDD4048];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unitFromString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "quantityWithUnit:doubleValue:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "_unit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v20, "isCompatibleWithUnit:", v18);

      if ((v13 & 1) != 0)
        v19 = objc_msgSend(v20, "compare:", v17);
      else
        v19 = 2;
      sqlite3_result_int(a1, v19);

    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

void sub_210FC38C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void _HDSQLiteMD5(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  const void *v5;
  CC_LONG v6;
  unsigned __int8 md[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v5 = sqlite3_value_blob(*a3);
      v6 = sqlite3_value_bytes(*a3);
    }
    CC_MD5(v5, v6, md);
    sqlite3_result_blob(a1, md, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CB17AC0, MEMORY[0x24BEDAAF0]);
}

void sub_210FC3B04(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

std::regex_traits<char> *std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](std::regex_traits<char> *a1, char *a2, int a3)
{
  std::regex_traits<char> *v6;
  size_t v7;

  v6 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v6[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v6[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[1].__col_ + 4) = 0u;
  HIDWORD(v6[2].__ct_) = 0;
  v7 = strlen(a2);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>((uint64_t)a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)&a2[v7]) != (std::basic_regex<char> *)&a2[v7])std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  return a1;
}

void sub_210FC3C64(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x212BD3378]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x24BEDB4B0]);
  return this;
}

void sub_210FC3CC8(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  v6 = (_QWORD *)operator new();
  *v6 = &unk_24CB19058;
  v7 = (_QWORD *)operator new();
  v7[1] = v6;
  std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>((_QWORD *)(a1 + 40), (uint64_t)v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>((std::basic_regex<char> *)a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }
  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32)
LABEL_14:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
    }
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (char *)a3);
  }
}

void sub_210FC3E30(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC3E84(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;

  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v7, a2);
  v3 = (std::__shared_weak_count *)a1[1];
  v4 = v7;
  *(_QWORD *)&v7 = *a1;
  *((_QWORD *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::__owns_one_state<char> *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  std::__node<char> *v15;
  std::__owns_one_state<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v8 != (unsigned __int8 *)a3)
  {
    while (*v8 == 124)
    {
      v12 = a1->__end_;
      v13 = v8 + 1;
      v14 = v8 + 1;
      do
      {
        v8 = v14;
        v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v14, a3);
      }
      while (v14 != v8);
      if (v8 == v13)
      {
        v15 = (std::__node<char> *)operator new();
        v16 = a1->__end_;
        v17 = v16->__first_;
        v15[1].__vftable = (std::__node<char>_vtbl *)v17;
        v16->__first_ = v15;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
      if (v8 == (unsigned __int8 *)a3)
        return a3;
    }
    return (char *)v8;
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  char *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return (char *)a2;
  v4 = (char *)a3;
  if (*a2 == 94)
  {
    v6 = operator new();
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v6 = &unk_24CB191D0;
    *(_QWORD *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      v10 = v3;
      v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>((std::basic_regex<char> *)a1, (char *)v3, v4);
    }
    while (v3 != v10);
    if (v10 != (unsigned __int8 *)v4)
    {
      if (v10 + 1 != (unsigned __int8 *)v4 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &unk_24CB19218;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__owns_one_state<char> *v9;
  unsigned __int8 *v10;

  v3 = a3;
  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>((uint64_t)a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124)
      return (std::basic_regex<char> *)v8;
    v9 = a1->__end_;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>((uint64_t)a1, (std::basic_regex<char> *)(v8 + 1), v3);
    if (v10 == v8 + 1)
      goto LABEL_9;
    v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *v16;
  std::__owns_one_state<char> *v17;
  std::__node<char> *v18;

  end = a1->__end_;
  v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>((uint64_t)a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = v8 + 1;
  while (v12 != a3)
  {
    v13 = (unsigned __int8 *)memchr(v12, 10, a3 - v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = a1->__end_;
    if (v14 == v12)
    {
      v16 = (std::__node<char> *)operator new();
      v17 = a1->__end_;
      v18 = v17->__first_;
      v16[1].__vftable = (std::__node<char>_vtbl *)v18;
      v17->__first_ = v16;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>((uint64_t)a1, v12, v14);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::basic_regex<char> *v12;
  std::basic_regex<char> *v13;
  std::basic_regex<char> *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *v16;
  std::__owns_one_state<char> *v17;
  std::__node<char> *v18;

  end = a1->__end_;
  v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
  while (v12 != a3)
  {
    v13 = (std::basic_regex<char> *)memchr(v12, 10, (char *)a3 - (char *)v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = a1->__end_;
    if (v14 == v12)
    {
      v16 = (std::__node<char> *)operator new();
      v17 = a1->__end_;
      v18 = v17->__first_;
      v16[1].__vftable = (std::__node<char>_vtbl *)v18;
      v17->__first_ = v16;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v12, v14);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC4524(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::~__end_state()
{
  JUMPOUT(0x212BD33A8);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

_QWORD *std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_24CB190B0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_210FC45BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  JUMPOUT(0x212BD33A8);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  std::__node<char> *v6;
  std::__node<char> *first;
  std::__node<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;

  v6 = (std::__node<char> *)operator new();
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&unk_24CB19698;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  v8 = (std::__node<char> *)operator new();
  v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  v10 = (std::__node<char> *)operator new();
  v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&unk_24CB196E0;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v9;

  result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    marked_count = a1->__marked_count_;
    v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  char *v3;
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  char *v18;
  int v20;
  BOOL v21;
  unsigned int marked_count;
  std::basic_regex<char> v23;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      v8 = v6 == 40;
      v7 = a2 + 1;
      v8 = !v8 || v7 == a3;
      if (!v8)
      {
        v8 = *v7 == 63;
        v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          v11 = *v9;
          if (v11 == 33)
          {
            std::regex_traits<char>::regex_traits(&v23.__traits_);
            memset(&v23.__flags_, 0, 40);
            v23.__flags_ = this->__flags_;
            v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v23, v3 + 3, a3);
            marked_count = v23.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v23, 1, this->__marked_count_);
            this->__marked_count_ += marked_count;
            if (v12 == a3 || *v12 != 41)
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            goto LABEL_31;
          }
          if (v11 == 61)
          {
            std::regex_traits<char>::regex_traits(&v23.__traits_);
            memset(&v23.__flags_, 0, 40);
            v23.__flags_ = this->__flags_;
            v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v23, v3 + 3, a3);
            v13 = v23.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v23, 0, this->__marked_count_);
            this->__marked_count_ += v13;
            if (v12 == a3 || *v12 != 41)
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_31:
            v3 = v12 + 1;
            std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&v23.__start_);
            std::locale::~locale(&v23.__traits_.__loc_);
            return v3;
          }
        }
      }
      return v3;
    }
    v14 = operator new();
    v15 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
LABEL_21:
    *(_QWORD *)v14 = v18 + 16;
    *(_QWORD *)(v14 + 8) = first;
    *(_BYTE *)(v14 + 16) = v15;
    end->__first_ = (std::__node<char> *)v14;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94)
      return v3;
    v14 = operator new();
    v15 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
    goto LABEL_21;
  }
  if (a2 + 1 != a3)
  {
    v20 = a2[1];
    if (v20 == 66)
    {
      v21 = 1;
    }
    else
    {
      if (v20 != 98)
        return v3;
      v21 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v21);
    v3 += 2;
  }
  return v3;
}

void sub_210FC4BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  int *p_open_count;
  unsigned __int8 *v12;
  unsigned int marked_count;
  unsigned __int8 *v14;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, a2, a3);
      if (v6 != 123)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, (char *)a3);
      if (v6 != 63)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
LABEL_29:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_30;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      v12 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
      if (v12 == a3)
        goto LABEL_30;
      v3 = v12;
      if (*v12 != 41)
        goto LABEL_30;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
      marked_count = this->__marked_count_;
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      v14 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
      if (v14 == a3 || (v3 = v14, *v14 != 41))
LABEL_30:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
    }
    --*p_open_count;
    return ++v3;
  }
  if (v6 == 46)
  {
    v7 = (std::__node<char> *)operator new();
    end = this->__end_;
    first = end->__first_;
    v7->__vftable = (std::__node<char>_vtbl *)&unk_24CB192F0;
    v7[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v7;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return ++v3;
  }
  if ((v6 - 42) < 2)
    goto LABEL_29;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  size_t v18;
  BOOL v19;
  BOOL v20;
  std::__owns_one_state<char> *v21;
  BOOL v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  size_t __max;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123)
      return a2;
    v15 = a2 + 1;
    v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a1, a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = (int)__max;
LABEL_33:
              v21 = __s;
              v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = (int)__max;
LABEL_45:
            v21 = __s;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  uint64_t v4;
  std::__node<char> *first;

  v4 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v4 = &unk_24CB19260;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_BYTE *)(v4 + 40) = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  std::__node<char> *v8;

  v8 = (std::__node<char> *)operator new();
  std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100]((uint64_t)v8, (uint64_t)a2, a3, (uint64_t)this->__end_->__first_, a4);
  this->__end_->__first_ = v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_210FC5214(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BD33A8](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC5270(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19260;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19260;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = &unk_24CB192A8;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB192A8;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB192A8;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x212BD33A8);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  std::vector<std::csub_match>::size_type v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  char v8;
  std::sub_match<const char *> *begin;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  std::sub_match<const char *> *v15;
  uint64_t v16;
  std::vector<std::csub_match> __p;
  std::vector<std::csub_match>::value_type v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  std::vector<std::csub_match>::value_type v22;
  char v23;
  uint64_t v24;

  v19 = 0;
  v20 = 0;
  v21 = 0;
  memset(&v22, 0, 17);
  v23 = 0;
  v24 = 0;
  memset(&__p, 0, sizeof(__p));
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v5 = *(_QWORD *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  v19 = v5;
  v20 = v5;
  v21 = 0;
  v22 = v18;
  v24 = v5;
  v23 = 1;
  v6 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v7 = v6 == *(const char **)(a2 + 8);
  else
    v7 = 0;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a2 + 32);
  v14 = 1;
  do
  {
    v15 = &begin[v14];
    v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)v16 = v15->std::pair<const char *, const char *>;
    *(_BYTE *)(v16 + 16) = v15->matched;
    v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_210FC590C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  std::match_results<const char *>::value_type *p_unmatched;

  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos)
    this->__position_start_ = __f;
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v12;
  signed int v13;
  _OWORD *v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  const char *v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  const char *v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  std::vector<std::csub_match>::value_type __x;
  _OWORD *v43;
  _OWORD *v44;
  unint64_t v45;

  v43 = 0;
  v44 = 0;
  v45 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v44 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v43, (uint64_t)v39);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v39[32])
    {
      *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
      operator delete(*(void **)&v39[32]);
    }
    v36 = a4;
    v12 = v44;
    *((_DWORD *)v44 - 24) = 0;
    *((_QWORD *)v12 - 11) = a2;
    *((_QWORD *)v12 - 10) = a2;
    *((_QWORD *)v12 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v44 - 40), *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = (_DWORD)a3 - (_DWORD)a2;
    v14 = v44;
    *((_QWORD *)v44 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = (const char *)*((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *((_QWORD *)v14 - 8);
          v29 = *((_QWORD *)v14 - 7) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v44 - 6;
          std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v44 - 12);
          v44 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v39[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v44;
          if ((unint64_t)v44 >= v45)
          {
            v44 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v43, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *v44 = *(_OWORD *)v39;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v39[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v44 = v23 + 6;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v44;
          ++v15;
          if (v43 != v44)
            continue;
          v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v43;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
  return v6;
}

void sub_210FC5D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  std::vector<std::csub_match>::pointer v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::pair<const char *, const char *> v14;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::size_type v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    end = this->__end_;
    v16 = end - begin;
    if (v16 >= __n)
      v17 = __n;
    else
      v17 = end - begin;
    if (v17)
    {
      v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      v19 = &end[__n - v16];
      v20 = 24 * __n - 24 * v16;
      do
      {
        v21 = __u->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    v11 = this->__end_;
    v12 = &v11[__n];
    v13 = 24 * __n;
    do
    {
      v14 = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v11->matched = *(_QWORD *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3;
  BOOL v4;
  std::vector<std::csub_match>::size_type v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  v4 = __sz >= v3;
  v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC6084(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC60D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer((uint64_t)v16);
  return v14;
}

void sub_210FC621C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(96 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __n128 result;
  uint64_t v12;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(_QWORD *)(v8 - 56) = 0;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(_QWORD *)(v8 - 48) = *(_QWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v9 - 64) = 0;
      *(_QWORD *)(v9 - 56) = 0;
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(_QWORD *)(v8 - 24) = *(_QWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v9 - 24) = 0;
      v12 = *(_QWORD *)(a3 + v7 - 16);
      *(_QWORD *)(v8 - 11) = *(_QWORD *)(a3 + v7 - 11);
      *(_QWORD *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<std::__state<char>,0>(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<std::__state<char>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::__compressed_pair<std::csub_match *> *p_end_cap;
  std::sub_match<const char *> *v7;
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  std::sub_match<const char *> *v15;
  std::vector<std::csub_match>::size_type v16;
  std::pair<const char *, const char *> v17;
  std::sub_match<const char *> *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> *v21;
  std::pair<const char *, const char *> v22;
  std::sub_match<const char *> *v23;
  std::sub_match<const char *> *end;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v26;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      v15 = &v9[__n];
      v16 = 24 * __n;
      do
      {
        v17 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&v9->matched = *(_QWORD *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    else
      v14 = 0;
    v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    v19 = &v18[__n];
    v20 = 24 * __n;
    v21 = v18;
    do
    {
      v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      *v21 = v22;
      v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v26 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v18[-1].matched = *(_QWORD *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
      operator delete(end);
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::__compressed_pair<std::pair<unsigned long, const char *> *, std::allocator<std::pair<unsigned long, const char *>>> *p_end_cap;
  std::pair<unsigned long, const char *> *v5;
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  std::pair<unsigned long, const char *> *v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    v8 = (char *)v7 - (char *)this->__begin_;
    v9 = __n + (v8 >> 4);
    if (v9 >> 60)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    else
      v13 = 0;
    v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    v16 = &v14[__n];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_210FC6718(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_210FC6788(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2 + 1, a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  char *v5;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  uint64_t *v7;
  char *v8;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3)
      goto LABEL_20;
    v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3)
      goto LABEL_20;
    do
    {
      v8 = v5;
      v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v5, a3, v7);
    }
    while (v5 != v8);
    if (v8 == a3)
      goto LABEL_20;
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93)
LABEL_20:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  uint64_t v2;
  unsigned int v3;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v2 = operator new();
    v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v2 = &unk_24CB19530;
    *(_QWORD *)(v2 + 8) = first;
    *(_DWORD *)(v2 + 16) = v3;
    end->__first_ = (std::__node<char> *)v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  uint64_t v4;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v4 = operator new();
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v4 = &unk_24CB19578;
    *(_QWORD *)(v4 + 8) = first;
    *(_DWORD *)(v4 + 16) = a2;
    end->__first_ = (std::__node<char> *)v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC6B1C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;
  BOOL v5;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = (char)*a2;
    v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC6C70(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;

  if (a2 == a3)
    return a2;
  v4 = *a2;
  v5 = v4 - 48;
  if (v4 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
    return a2 + 1;
  }
  if ((v4 - 49) > 8)
    return a2;
  v6 = a3;
  v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      v8 = *v7;
      if ((v8 - 48) > 9)
        break;
      if (v5 >= 0x19999999)
        goto LABEL_16;
      ++v7;
      v5 = v8 + 10 * v5 - 48;
      if (v7 == a3)
        goto LABEL_12;
    }
    v6 = v7;
LABEL_12:
    if (!v5)
      goto LABEL_16;
  }
  if (v5 > a1->__marked_count_)
LABEL_16:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v3;
  int v4;
  BOOL v5;
  BOOL v6;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  int v8;
  BOOL v9;
  std::__bracket_expression<char, std::regex_traits<char>> *v10;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100)
      return v3;
    v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      v6 = 1;
      goto LABEL_12;
    case 'S':
      v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      v5 = 1;
LABEL_15:
      v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  char v7;
  int v8;
  int v9;
  char v10;
  int v11;
  char v12;
  int v13;
  char v14;
  std::basic_regex<char>::value_type v15;
  unsigned __int8 v16;
  std::basic_regex<char>::value_type v17;
  __int16 v18;

  v4 = a2;
  if (a2 != a3)
  {
    v5 = *a2;
    v6 = v5;
    if ((char)v5 > 109)
    {
      v7 = 0;
      switch((char)v5)
      {
        case 'n':
          if (!a4)
          {
            v6 = 10;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v18 = 10;
          goto LABEL_81;
        case 'r':
          if (!a4)
          {
            v6 = 13;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v18 = 13;
          goto LABEL_81;
        case 't':
          if (!a4)
          {
            v6 = 9;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v18 = 9;
          goto LABEL_81;
        case 'u':
          if (v4 + 1 == a3)
            goto LABEL_91;
          v8 = v4[1];
          if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 && (v8 | 0x20u) - 97 >= 6)
            goto LABEL_91;
          v4 += 2;
          if (v4 == a3)
            goto LABEL_91;
          v9 = *v4;
          v10 = -48;
          if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38)
            goto LABEL_28;
          v9 |= 0x20u;
          if ((v9 - 97) >= 6)
            goto LABEL_91;
          v10 = -87;
LABEL_28:
          v7 = 16 * (v10 + v9);
LABEL_29:
          if (v4 + 1 == a3)
            goto LABEL_91;
          v11 = v4[1];
          v12 = -48;
          if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38)
            goto LABEL_34;
          v11 |= 0x20u;
          if ((v11 - 97) >= 6)
            goto LABEL_91;
          v12 = -87;
LABEL_34:
          if (v4 + 2 == a3)
            goto LABEL_91;
          v13 = v4[2];
          v14 = -48;
          if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38)
            goto LABEL_39;
          v13 |= 0x20u;
          if ((v13 - 97) >= 6)
            goto LABEL_91;
          v14 = -87;
LABEL_39:
          v15 = v14 + v13 + 16 * (v12 + v11 + v7);
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            *(_BYTE *)a4 = v15;
            *((_BYTE *)a4 + 1) = 0;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v15);
          }
          v4 += 3;
          return v4;
        case 'v':
          if (!a4)
          {
            v6 = 11;
            goto LABEL_69;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v18 = 11;
          break;
        case 'x':
          goto LABEL_29;
        default:
          goto LABEL_53;
      }
      goto LABEL_81;
    }
    if ((char)v5 == 48)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return ++v4;
      }
      v6 = 0;
      goto LABEL_69;
    }
    if ((char)v5 != 99)
    {
      if ((char)v5 == 102)
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v18 = 12;
LABEL_81:
          *(_WORD *)a4 = v18;
          return ++v4;
        }
        v6 = 12;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return ++v4;
      }
LABEL_53:
      if ((char)v5 != 95 && ((char)v5 < 0 || (a1->__traits_.__ct_->__tab_[v5] & 0x500) == 0))
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          *(_BYTE *)a4 = v5;
          *((_BYTE *)a4 + 1) = 0;
          return ++v4;
        }
        goto LABEL_69;
      }
LABEL_91:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if (v4 + 1 == a3)
      goto LABEL_91;
    v16 = v4[1];
    if (((v16 & 0xDF) - 65) > 0x19u)
      goto LABEL_91;
    v17 = v16 & 0x1F;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v17;
      *((_BYTE *)a4 + 1) = 0;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
    }
    v4 += 2;
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  uint64_t v8;
  std::__node<char> *first;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = operator new();
    std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](v8, (uint64_t)this, v2, (uint64_t)this->__end_->__first_);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = operator new();
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &unk_24CB19380;
    *(_QWORD *)(v8 + 8) = first;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = v2;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &unk_24CB193C8;
  *(_QWORD *)(v5 + 8) = v7;
  *(_BYTE *)(v5 + 16) = v2;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_210FC72E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BD33A8](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC733C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  char *v11;

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &unk_24CB194A0;
  *(_QWORD *)(v5 + 8) = v7;
  *(_DWORD *)(v5 + 16) = __i;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = &unk_24CB19338;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_210FC74B8(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19338;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19338;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19380;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19380;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19410;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19410;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19458;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24CB19458;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  std::__bracket_expression<char, std::regex_traits<char>> *v4;

  v4 = (std::__bracket_expression<char, std::regex_traits<char>> *)operator new();
  std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v4, (uint64_t)this, (uint64_t)this->__end_->__first_, __negate, this->__flags_ & 1, (this->__flags_ & 8) != 0);
  this->__end_->__first_ = v4;
  this->__end_ = v4;
  return v4;
}

void sub_210FC7CCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BD33A8](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_210FC8030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  void (__cdecl ***v10)(std::__owns_one_state<char> *__hidden);
  std::locale *v11;
  void **v12;
  void (__cdecl **v14)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v15)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v16)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v17)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v14 = v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v15 = v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))*v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  v17 = v10[1];
  if (v17)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v17 + 1))(v17);
  _Unwind_Resume(a1);
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return MEMORY[0x212BD33A8](a1, 0x10F1C4061CF1F02);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char *current;
  char *last;
  signed __int8 v6;
  signed __int8 v7;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v9;
  uint64_t v10;
  char *p_second;
  std::pair<std::string, std::string> *v13;
  uint64_t v14;
  unint64_t v15;
  _BOOL4 negate;
  int v17;
  uint64_t v18;
  size_t v19;
  unsigned __int8 v20;
  std::vector<char>::pointer v21;
  unint64_t v22;
  int v23;
  std::regex_traits<char>::char_class_type v24;
  int v25;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v27;
  char *v28;
  std::vector<std::pair<std::string, std::string>>::pointer v29;
  std::vector<std::pair<std::string, std::string>>::pointer v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  std::vector<std::string>::pointer v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  size_t v40;
  size_t v41;
  uint64_t v42;
  BOOL v43;
  std::string *v44;
  std::string::size_type v45;
  int v46;
  std::string *v47;
  void **v48;
  uint64_t v49;
  size_t v50;
  int v51;
  std::regex_traits<char>::char_class_type v52;
  int v53;
  std::vector<std::string>::pointer v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  unint64_t v58;
  size_t v59;
  void *v60;
  size_t v61;
  uint64_t v62;
  BOOL v63;
  std::string *v64;
  std::string::size_type size;
  int v66;
  std::string *v67;
  void **p_p;
  uint64_t v69;
  int v70;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v73;
  std::regex_traits<char>::char_class_type neg_mask;
  int v75;
  std::__node<char> *first;
  int v77;
  std::string *v78;
  _BOOL4 v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *__p;
  size_t v84;
  char v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  uint64_t v88;

  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v18 = 0;
    negate = this->__negate_;
    goto LABEL_155;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_27;
  v6 = *current;
  v86 = *current;
  v7 = current[1];
  v87 = v7;
  if (this->__icase_)
  {
    v86 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    v87 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85)
      goto LABEL_8;
LABEL_27:
    negate = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v19 = v84;
  operator delete(__p);
  if (!v19)
    goto LABEL_27;
LABEL_8:
  begin = this->__digraphs_.__begin_;
  v9 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v9)
  {
    v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1)
      v10 = 1;
    p_second = &begin->second;
    do
    {
      if (v86 == *(p_second - 1) && v87 == *p_second)
        goto LABEL_152;
      p_second += 2;
      --v10;
    }
    while (v10);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88);
    v13 = this->__ranges_.__begin_;
    if (this->__ranges_.__end_ == v13)
    {
LABEL_24:
      negate = 0;
      v17 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v13[v14].first.__r_.__value_.__r.__words, &__p) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)&this->__ranges_.__begin_[v14].second.__r_.__value_.__l.__data_) << 24) >= 0x1000000)
      {
        ++v15;
        v13 = this->__ranges_.__begin_;
        ++v14;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * (((char *)this->__ranges_.__end_ - (char *)v13) >> 4))
          goto LABEL_24;
      }
      negate = 1;
      v17 = 5;
    }
    if (v85 < 0)
      operator delete(__p);
    if (negate)
      goto LABEL_129;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_134;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  v54 = this->__equivalences_.__begin_;
  v55 = v85;
  v56 = (char *)this->__equivalences_.__end_ - (char *)v54;
  if (v56)
  {
    v57 = 0;
    v58 = v56 / 24;
    v60 = __p;
    v59 = v84;
    if (v85 >= 0)
      v61 = v85;
    else
      v61 = v84;
    if (v58 <= 1)
      v62 = 1;
    else
      v62 = v56 / 24;
    v63 = 1;
    while (1)
    {
      v64 = &v54[v57];
      size = HIBYTE(v64->__r_.__value_.__r.__words[2]);
      v66 = (char)size;
      if ((size & 0x80u) != 0)
        size = v64->__r_.__value_.__l.__size_;
      if (v61 == size)
      {
        if (v66 >= 0)
          v67 = &v54[v57];
        else
          v67 = (std::string *)v64->__r_.__value_.__r.__words[0];
        if ((v55 & 0x80) == 0)
        {
          if ((_DWORD)v55)
          {
            p_p = &__p;
            v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != v67->__r_.__value_.__s.__data_[0])
                goto LABEL_122;
              p_p = (void **)((char *)p_p + 1);
              v67 = (std::string *)((char *)v67 + 1);
              --v69;
            }
            while (v69);
            negate = 1;
            v17 = 5;
            goto LABEL_126;
          }
          negate = 1;
          if (v63)
            goto LABEL_154;
LABEL_134:
          if ((char)v86 < 0)
          {
            neg_mask = this->__neg_mask_;
            goto LABEL_147;
          }
          mask = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          v73 = tab[v86];
          if ((v73 & mask) == 0 && (v86 != 95 || (mask & 0x80) == 0)
            || (char)v87 < 0
            || (tab[v87] & mask) == 0 && ((mask & 0x80) == 0 || v87 != 95))
          {
            neg_mask = this->__neg_mask_;
            if ((v73 & neg_mask) != 0 || v86 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_151:
              v75 = negate;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v87] & neg_mask) != 0)
                goto LABEL_151;
              v75 = 1;
              if (v87 == 95 && (neg_mask & 0x80) != 0)
                goto LABEL_151;
LABEL_153:
              negate = v75;
LABEL_154:
              v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          v75 = 1;
          goto LABEL_153;
        }
        v80 = v58;
        v82 = v55;
        v70 = memcmp(v60, v67, v59);
        v58 = v80;
        v55 = v82;
        if (!v70)
          break;
      }
LABEL_122:
      v63 = ++v57 < v58;
      if (v57 == v62)
        goto LABEL_125;
    }
    v17 = 5;
    negate = 1;
    goto LABEL_127;
  }
  v63 = 0;
LABEL_125:
  v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0)
LABEL_127:
    operator delete(__p);
  if (!v63)
    goto LABEL_134;
LABEL_129:
  if (v17)
    goto LABEL_154;
  v18 = 2;
LABEL_28:
  v20 = *a2->__current_;
  v86 = v20;
  if (this->__icase_)
  {
    v20 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v20);
    v86 = v20;
  }
  v21 = this->__chars_.__begin_;
  v22 = this->__chars_.__end_ - v21;
  if (v22)
  {
    if (v22 <= 1)
      v22 = 1;
    while (1)
    {
      v23 = *v21++;
      if (v23 == v20)
        break;
      if (!--v22)
        goto LABEL_35;
    }
LABEL_46:
    negate = 1;
    goto LABEL_155;
  }
LABEL_35:
  v24 = this->__neg_mask_;
  if (v24 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v20 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v20] & v24) == 0)
      v25 = (v20 == 95) & (v24 >> 7);
    else
      LOBYTE(v25) = 1;
    end = this->__neg_chars_.__end_;
    v27 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v20, end - this->__neg_chars_.__begin_);
    v28 = v27 ? v27 : end;
    if ((v25 & 1) == 0 && v28 == end)
      goto LABEL_46;
  }
  v29 = this->__ranges_.__begin_;
  v30 = this->__ranges_.__end_;
  if (v29 != v30)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v87);
      v29 = this->__ranges_.__begin_;
      v30 = this->__ranges_.__end_;
    }
    else
    {
      v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      v33 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 0;
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v29[v31].first.__r_.__value_.__r.__words, &__p) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)&this->__ranges_.__begin_[v31].second.__r_.__value_.__l.__data_) << 24) >= 0x1000000)
      {
        ++v32;
        v29 = this->__ranges_.__begin_;
        ++v31;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * (((char *)this->__ranges_.__end_ - (char *)v29) >> 4))
          goto LABEL_57;
      }
      v33 = 1;
      negate = 1;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v33 & 1) != 0)
      goto LABEL_155;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_90;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  v34 = this->__equivalences_.__begin_;
  v35 = v85;
  v36 = (char *)this->__equivalences_.__end_ - (char *)v34;
  if (v36)
  {
    v81 = v18;
    v37 = 0;
    v38 = v36 / 24;
    v39 = __p;
    v40 = v84;
    if (v85 >= 0)
      v41 = v85;
    else
      v41 = v84;
    if (v38 <= 1)
      v42 = 1;
    else
      v42 = v36 / 24;
    v43 = 1;
    while (1)
    {
      v44 = &v34[v37];
      v45 = HIBYTE(v44->__r_.__value_.__r.__words[2]);
      v46 = (char)v45;
      if ((v45 & 0x80u) != 0)
        v45 = v44->__r_.__value_.__l.__size_;
      if (v41 == v45)
      {
        if (v46 >= 0)
          v47 = &v34[v37];
        else
          v47 = (std::string *)v44->__r_.__value_.__r.__words[0];
        if ((v35 & 0x80) != 0)
        {
          v79 = negate;
          v50 = v41;
          v78 = v34;
          v51 = memcmp(v39, v47, v40);
          v34 = v78;
          v41 = v50;
          negate = v79;
          if (!v51)
          {
            negate = 1;
            v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!(_DWORD)v35)
          {
            negate = 1;
            v18 = v81;
            if (!v43)
              goto LABEL_90;
            goto LABEL_155;
          }
          v48 = &__p;
          v49 = v35;
          while (*(unsigned __int8 *)v48 == v47->__r_.__value_.__s.__data_[0])
          {
            v48 = (void **)((char *)v48 + 1);
            v47 = (std::string *)((char *)v47 + 1);
            if (!--v49)
            {
              negate = 1;
              goto LABEL_85;
            }
          }
        }
      }
      v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        v18 = v81;
        if ((v35 & 0x80) == 0)
          goto LABEL_89;
        goto LABEL_88;
      }
    }
  }
  v43 = 0;
  if (v85 < 0)
LABEL_88:
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0)
      goto LABEL_155;
    v52 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v86] & v52) == 0)
    {
      v53 = (v52 >> 7) & 1;
      if (v86 != 95)
        v53 = 0;
      if (v53 != 1)
        goto LABEL_155;
    }
    goto LABEL_46;
  }
LABEL_155:
  if (negate == this->__negate_)
  {
    first = 0;
    v77 = -993;
  }
  else
  {
    a2->__current_ += v18;
    first = this->__first_;
    v77 = -995;
  }
  a2->__do_ = v77;
  a2->__node_ = first;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_210FC8BBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_210FC8D38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_210FC8E44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FC8E98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  char *v18;
  __int128 *v19;
  int v20;
  _BYTE *v21;
  char *v22;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  v9 = 0;
  v10 = 0;
  v31 = 0uLL;
  v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    v11 = a2[1];
    switch(v11)
    {
      case '.':
        v4 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, a2 + 2, a3, (uint64_t)&v31);
        v9 = HIBYTE(v32);
        v10 = *((_QWORD *)&v31 + 1);
        break;
      case ':':
        v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
LABEL_11:
        v6 = v12;
        v13 = 0;
        goto LABEL_44;
      default:
        v10 = 0;
        v9 = 0;
        break;
    }
  }
  v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0)
    v10 = v9;
  if (v10)
  {
    v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    v16 = *v4;
    if (v16 == 92)
    {
      v17 = v4 + 1;
      if (v14)
        v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v17, a3, (uint64_t *)&v31);
      else
        v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    v19 = (__int128 *)v31;
    *((_QWORD *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    v19 = &v31;
  }
  *(_BYTE *)v19 = v16;
  *((_BYTE *)v19 + 1) = 0;
  v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (v20 = *v15, v20 == 93)
    || (v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((_QWORD *)&v31 + 1))
      {
        if (*((_QWORD *)&v31 + 1) != 1)
        {
          v22 = (char *)v31;
LABEL_42:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, *v22, v22[1]);
          goto LABEL_43;
        }
        v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      v22 = (char *)&v31;
      if (HIBYTE(v32) != 1)
        goto LABEL_42;
LABEL_40:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, *v22);
    }
LABEL_43:
    v13 = 1;
    v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    v24 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if ((_DWORD)v21 == 92)
    {
      if (v14)
        v24 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v15 + 2, a3, (uint64_t *)v29);
      else
        v24 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)v27 = v31;
  v28 = v32;
  v32 = 0;
  v31 = 0uLL;
  *(_OWORD *)__p = *(_OWORD *)v29;
  v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0)
    operator delete((void *)v31);
  if ((v13 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_210FC921C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t i;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *__p[2];
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  for (i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_33;
  }
  if (&a2[i] == a3)
LABEL_33:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char *>(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  std::regex_traits<char>::__transform_primary<char *>(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (__int128 *)__p);
  }
  else
  {
    v11 = v19;
    if ((v19 & 0x80u) != 0)
      v11 = v18;
    if (v11 == 2)
    {
      v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v13 = (char *)v17;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_210FC9420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  int v7;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  for (i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_11;
  }
  if (&a2[i] == a3)
LABEL_11:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  v7 = std::regex_traits<char>::__lookup_classname<char const*>(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char *>(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v6;
  int v7;
  int v8;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 != 87)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
  *(_DWORD *)(a5 + 164) |= 0x500u;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
  return a2 + 1;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, uint64_t *a4)
{
  int v5;
  std::basic_regex<char>::value_type v6;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type v8;
  char *v9;
  char v10;
  int v11;
  std::basic_regex<char>::value_type v12;
  __int16 v13;

  if (a2 == a3)
LABEL_80:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  v6 = *a2;
  if (v5 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
        {
          v7 = 10;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 10;
        goto LABEL_77;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
        {
          v7 = 13;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 13;
        goto LABEL_77;
      case 't':
        if (!a4)
        {
          v7 = 9;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 9;
        goto LABEL_77;
      case 'v':
        if (!a4)
        {
          v7 = 11;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v13 = 11;
        goto LABEL_77;
      default:
        if (v5 == 98)
        {
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            v13 = 8;
            goto LABEL_77;
          }
          v7 = 8;
        }
        else
        {
          if (v5 != 102)
            goto LABEL_25;
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }
            v13 = 12;
            goto LABEL_77;
          }
          v7 = 12;
        }
        break;
    }
LABEL_62:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
    return a2 + 1;
  }
  if (v5 > 91)
  {
    if (v5 == 92)
    {
LABEL_16:
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v6;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      v7 = *a2;
      goto LABEL_62;
    }
    if (v5 != 97)
      goto LABEL_25;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      v13 = 7;
LABEL_77:
      *(_WORD *)a4 = v13;
      return a2 + 1;
    }
    v7 = 7;
    goto LABEL_62;
  }
  if (v5 == 34 || v5 == 47)
    goto LABEL_16;
LABEL_25:
  if ((v6 & 0xF8) != 0x30)
    goto LABEL_80;
  v8 = v5 - 48;
  v9 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v9 & 0xF8) != 0x30)
      goto LABEL_49;
    v8 = *v9 + 8 * v8 - 48;
    if (a2 + 2 != a3)
    {
      v10 = a2[2];
      v11 = v10 & 0xF8;
      v12 = v10 + 8 * v8 - 48;
      if (v11 == 48)
        v9 = a2 + 3;
      else
        v9 = a2 + 2;
      if (v11 == 48)
        v8 = v12;
      goto LABEL_49;
    }
  }
  v9 = a3;
LABEL_49:
  if (a4)
  {
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    *(_BYTE *)a4 = v8;
    *((_BYTE *)a4 + 1) = 0;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
  }
  return v9;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    std::regex_traits<char>::transform<char *>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    std::regex_traits<char>::transform<char *>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_210FC9DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  std::pair<std::string,std::string>::~pair((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCA070(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_210FCA118(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_210FCA22C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCA514(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_210FCA5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](char **a1, __int128 *a2)
{
  std::allocator<std::pair<std::string, std::string>> *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  std::pair<std::string, std::string> *v25;
  std::__split_buffer<std::pair<std::string, std::string>> v26;

  v6 = (unint64_t)a1[2];
  v4 = (std::allocator<std::pair<std::string, std::string>> *)(a1 + 2);
  v5 = v6;
  v7 = *((_QWORD *)v4 - 1);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v26.__end_cap_.__value_ = v4;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)v4, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v20 = *a1;
    v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      v24 = vdupq_n_s64(v19);
      v21 = &v15[48 * v11];
    }
    else
    {
      v21 = &v15[48 * v11];
      do
      {
        v22 = *(_OWORD *)(v19 - 48);
        *((_QWORD *)v21 - 4) = *(_QWORD *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(_QWORD *)(v19 - 40) = 0;
        *(_QWORD *)(v19 - 32) = 0;
        *(_QWORD *)(v19 - 48) = 0;
        v23 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v21 - 1) = *(_QWORD *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(_QWORD *)(v19 - 16) = 0;
        *(_QWORD *)(v19 - 8) = 0;
        *(_QWORD *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      v24 = *(int64x2_t *)a1;
    }
    v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    *(int64x2_t *)&v26.__begin_ = v24;
    v25 = (std::pair<std::string, std::string> *)a1[2];
    a1[2] = &v15[48 * v14];
    v26.__end_cap_.__value_ = v25;
    v26.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v24.i64[0];
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&v26);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCA9F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  std::__split_buffer<std::pair<std::string, std::string>>::pointer i;
  std::__split_buffer<std::pair<std::string, std::string>>::pointer begin;

  begin = this->__begin_;
  for (i = this->__end_; i != begin; i = this->__end_)
  {
    this->__end_ = i - 1;
    std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>((uint64_t)&i[-1]);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  uint64_t v17;
  unsigned int loop_count;
  std::__node<char> *v19;
  std::__node<char> *v20;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = (_QWORD *)operator new();
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new();
  loop_count = this->__loop_count_;
  v19 = __s->__first_;
  *(_QWORD *)v17 = &unk_24CB195C0;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = __min;
  *(_QWORD *)(v17 + 32) = __max;
  *(_DWORD *)(v17 + 40) = loop_count;
  *(_DWORD *)(v17 + 44) = v9;
  *(_DWORD *)(v17 + 48) = v8;
  *(_BYTE *)(v17 + 52) = __greedy;
  __s->__first_ = 0;
  v20 = (std::__node<char> *)operator new();
  v20->__vftable = (std::__node<char>_vtbl *)&unk_24CB19650;
  v20[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v20;
  this->__end_ = *(std::__owns_one_state<char> **)(v17 + 16);
  __s->__first_ = (std::__node<char> *)v17;
  ++this->__loop_count_;
}

void sub_210FCAD84(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCAE80(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCAECC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x212BD33A8);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x212BD33A8);
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24CB19620;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x212BD33A8);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BD3318](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_210FCB378(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v8;

  if (a2 == a3)
    return (unsigned __int8 *)a2;
  end = a1->__end_;
  marked_count = a1->__marked_count_;
  v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2)
    return (unsigned __int8 *)a2;
  else
    return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v6;
  char *v7;
  int v8;
  uint64_t v9;
  unsigned int marked_count;
  char *v11;
  _BOOL4 v13;
  uint64_t v14;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(a1, a2, a3);
  v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      v8 = a2[1];
      if (v8 == 40)
      {
        v9 = (uint64_t)(a2 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        marked_count = a1->__marked_count_;
        do
        {
          v11 = (char *)v9;
          v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v9, a3);
        }
        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        v7 = v11 + 2;
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
      }
      else
      {
        v13 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v8);
        v14 = 2;
        if (!v13)
          v14 = 0;
        return &a2[v14];
      }
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v11;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  std::basic_regex<char> *v22;
  int v24;
  int v25;

  v6 = a2;
  if (a2 != a3)
  {
    v7 = __mexp_end;
    v8 = __mexp_begin;
    v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      v13 = a2 + 2;
      v25 = 0;
      v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, a2 + 2, a3, &v25);
      if (v14 == v13)
        goto LABEL_16;
      if (v14 != a3)
      {
        v15 = v14 + 1;
        v16 = *v14;
        if (v16 == 44)
        {
          v24 = -1;
          v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            v19 = v24;
            v18 = v25;
            if (v24 == -1)
            {
              v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            v6 = &v17[2 * (v17[1] == 125)];
            v20 = v8;
            v21 = v7;
            v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          v6 = v14 + 2;
          v18 = v25;
          v20 = v8;
          v21 = v7;
          v22 = this;
          v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  int v6;
  char *result;
  std::__node<char> *v9;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if (a2 == a3)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2)
      return result;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
    return a2 + 1;
  }
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
  if (result != a2)
    return result;
  if (*a2 != 46)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  v9 = (std::__node<char> *)operator new();
  end = this->__end_;
  first = end->__first_;
  v9->__vftable = (std::__node<char>_vtbl *)&unk_24CB19728;
  v9[1].__vftable = (std::__node<char>_vtbl *)first;
  end->__first_ = v9;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  return a2 + 1;
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;

  v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x212BD33A8);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  do
  {
    v7 = v6;
    v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  char *v8;
  unsigned __int8 *v9;
  int locale_low;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  std::basic_regex<char> *v17;
  std::basic_regex<char> *v18;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>((std::basic_regex<char> *)a1, a2, a3);
  v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3)
    goto LABEL_12;
  locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  switch(locale_low)
  {
    case '$':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      goto LABEL_8;
    case '(':
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression((std::basic_regex<char> *)a1);
      v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v17 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v17 == a3 || (v18 = v17, LOBYTE(v17->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression((std::basic_regex<char> *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)&v18->__traits_.__loc_.__locale_ + 1;
LABEL_12:
      if (v9 != (unsigned __int8 *)a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
      return (unsigned __int8 *)a2;
    case '^':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
LABEL_8:
      v15 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = v14 + 16;
      *(_QWORD *)(v11 + 8) = v15;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  return (unsigned __int8 *)a2;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  char *result;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(a1, a2, a3);
  if (result == (char *)a2)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>((uint64_t)a1, a2, a3);
    if (result == (char *)a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
      }
      else
      {
        v7 = (std::__node<char> *)operator new();
        end = a1->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_24CB19728;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        return (char *)&a2->__traits_.__loc_.__locale_ + 1;
      }
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  int locale_low;
  uint64_t v5;

  v3 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    v5 = (locale_low - 36);
    if (v5 > 0x3A)
      goto LABEL_8;
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0)
      return v3;
    if (v5 == 5)
    {
      if (a1->__open_count_)
        return v3;
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2)
        return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  char *v4;
  int v5;
  std::basic_regex<char>::value_type v6;
  BOOL v7;
  _BOOL4 v9;
  uint64_t v10;

  v3 = this;
  if (this == a3)
    return (char *)v3;
  v4 = (char *)&this->__traits_.__loc_.__locale_ + 1;
  if ((std::basic_regex<char> *)((char *)&v3->__traits_.__loc_.__locale_ + 1) == a3
    || LOBYTE(v3->__traits_.__loc_.__locale_) != 92)
  {
    return (char *)v3;
  }
  v5 = *v4;
  v6 = *v4;
  v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
    return (char *)v3 + 2;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
    v10 = 2;
    if (!v9)
      v10 = 0;
    return (char *)v3 + v10;
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, (char *)a3, 0);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  int v9;
  std::match_results<const char *>::value_type *p_unmatched;
  const char *first;
  const char *second;
  uint64_t result;
  int v14;
  const char *v15;
  int v16;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_)
      p_unmatched = &this->__unmatched_;
    else
      p_unmatched = this->__matches_.__begin_;
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        begin = this->__matches_.__begin_;
        end = this->__matches_.__end_;
        if (v16)
          break;
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l)
          goto LABEL_14;
      }
      if (end == begin)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
  }
  result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  _BYTE v57[40];
  __int128 v58;
  void *__p[2];
  _QWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v57 = 0;
    memset(&v57[8], 0, 32);
    v58 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v60, 0, 21);
    std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v51 = a4;
    if (*(_QWORD *)&v57[32])
    {
      *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    v12 = *((_QWORD *)&v61 + 1);
    v13 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    v55 = 0;
    v18 = 0;
    v53 = 0;
    v54 = a2;
    v19 = *((_QWORD *)&v63 + 1);
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v22 = v21 / 0x2A;
    v23 = 3 * (v21 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    v24 = *(_QWORD *)(v20 + 8 * v22) + 32 * v23;
    v25 = a3 - a2;
    *(_DWORD *)(v24 + 88) = a5;
    *(_BYTE *)(v24 + 92) = a6;
    v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v25)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v27 = v19 + v63 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == v52;
          v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v53;
          if ((v55 & (v53 >= v37)) == 0)
            v38 = v37;
          if (v38 != v25)
          {
            v53 = v38;
            std::deque<std::__state<char>>::pop_back(&v61);
            v55 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v61 + 1);
          v40 = v62;
          if ((_QWORD)v62 == *((_QWORD *)&v61 + 1))
          {
            v40 = *((_QWORD *)&v61 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v61 + 1);
              v40 = v62;
            }
          }
          *((_QWORD *)&v63 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v61 + 1) + 8);
              *((_QWORD *)&v61 + 1) = v39;
              v47 = v62 - (_QWORD)v39;
            }
            while ((_QWORD)v62 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v63 = v48;
LABEL_53:
          v55 = 1;
          v53 = v25;
LABEL_38:
          v19 = *((_QWORD *)&v63 + 1);
          if (*((_QWORD *)&v63 + 1))
            continue;
          if ((v55 & 1) != 0)
          {
            v49 = *v51;
            *(_QWORD *)v49 = v54;
            *(_QWORD *)(v49 + 8) = v54 + v53;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          v58 = 0uLL;
          *(_QWORD *)&v57[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v57[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v60[1] + 5) = *(_QWORD *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v60[1] + 24))(v60[1], 0, v57);
          std::deque<std::__state<char>>::push_back(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v57[32])
          {
            *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v61);
  return v6;
}

void sub_210FCC46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100](&a27);
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  const char *v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  const char *v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  const char *v40;
  const char *v41;
  char v42;
  _BYTE v45[56];
  void *__p[2];
  _QWORD v47[4];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v49[40];
  __int128 v50;
  void *v51[6];
  _OWORD *v52;
  _OWORD *v53;
  unint64_t v54;

  v52 = 0;
  v53 = 0;
  v54 = 0;
  *(_DWORD *)v49 = 0;
  memset(&v49[8], 0, 32);
  v50 = 0u;
  memset(v51, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 48);
    *(_OWORD *)__p = 0uLL;
    memset(v47, 0, 21);
    v53 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v52, (uint64_t)v45);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v45[32])
    {
      *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }
    v11 = v53;
    *((_DWORD *)v53 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v53 - 40), *(unsigned int *)(a1 + 32));
    v40 = a3;
    v41 = 0;
    v42 = 0;
    v12 = 0;
    v13 = (const char *)(a3 - a2);
    v14 = v53;
    *((_QWORD *)v53 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    do
    {
      v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
      if (!v15)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = (const char *)*((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v40)
            goto LABEL_19;
          v26 = &v19[-*((_QWORD *)v14 - 11)];
          v27 = v41;
          if ((v42 & ((uint64_t)v41 >= (uint64_t)v26)) == 0)
          {
            v28 = *(v14 - 5);
            *(_OWORD *)v49 = *(_OWORD *)v18;
            *(_OWORD *)&v49[16] = v28;
            if (v49 != v18)
            {
              std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v49[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
              std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v51, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
            }
            v29 = (void *)*v17;
            *(void **)((char *)&v51[3] + 5) = *(void **)((char *)v14 - 11);
            v51[3] = v29;
            v27 = v26;
          }
          v30 = v53;
          if (v27 == v13)
          {
            v31 = (uint64_t)v52;
            while (v30 != (_QWORD *)v31)
            {
              v30 -= 12;
              std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v30);
            }
            v53 = (_OWORD *)v31;
            v42 = 1;
            v41 = v13;
          }
          else
          {
            v41 = v27;
            v32 = v53 - 6;
            std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v53 - 12);
            v53 = v32;
            v42 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          v20 = v53 - 6;
          std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)v53 - 12);
          v53 = v20;
          break;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v45 = *(_OWORD *)v18;
          *(_OWORD *)&v45[16] = v21;
          memset(&v45[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v45[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v47[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = (void *)*v17;
          *(_QWORD *)((char *)&v47[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v47[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v47[1] + 24))(v47[1], 0, v45);
          v23 = v53;
          if ((unint64_t)v53 >= v54)
          {
            v53 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v52, (uint64_t)v45);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v45[16];
            *v53 = *(_OWORD *)v45;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v45[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v47[0];
            __p[0] = 0;
            __p[1] = 0;
            v47[0] = 0;
            v25 = v47[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v47[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v53 = v23 + 6;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      v14 = v53;
    }
    while (v52 != v53);
    if ((v42 & 1) != 0)
    {
      v33 = *a4;
      *(_QWORD *)v33 = a2;
      *(_QWORD *)(v33 + 8) = &v41[(_QWORD)a2];
      *(_BYTE *)(v33 + 16) = 1;
      if ((_QWORD)v50 != *(_QWORD *)&v49[32])
      {
        v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v50 - *(_QWORD *)&v49[32]) >> 3);
        v35 = (_BYTE *)(*(_QWORD *)&v49[32] + 16);
        v36 = 1;
        do
        {
          v37 = v33 + 24 * v36;
          *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
          v38 = *v35;
          v35 += 24;
          *(_BYTE *)(v37 + 16) = v38;
          v15 = v34 > v36++;
        }
        while (v15);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }
  if (v51[0])
  {
    v51[1] = v51[0];
    operator delete(v51[0]);
  }
  if (*(_QWORD *)&v49[32])
  {
    *(_QWORD *)&v50 = *(_QWORD *)&v49[32];
    operator delete(*(void **)&v49[32]);
  }
  *(_QWORD *)v49 = &v52;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v49);
  return v6;
}

void sub_210FCC9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  std::__state<char>::~__state(&a19);
  std::__state<char>::~__state(&a35);
  a35 = v35 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(_QWORD *a1)
{
  unint64_t v2;

  v2 = a1[5] + a1[4] - 1;
  std::__destroy_at[abi:ne180100]<std::__state<char>,0>((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A))
                                                                 + 96 * (v2 % 0x2A)));
  --a1[5];
  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_210FD5B70);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_210FCCF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char> *>>((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_210FCD74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v3 == v2)
  {
    v4 = a1 + 5;
    v3 = (void **)a1[1];
  }
  else
  {
    v4 = a1 + 5;
    v5 = a1[4];
    v6 = &v2[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v2 = (void **)a1[1];
      v3 = (void **)a1[2];
    }
  }
  *v4 = 0;
  v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }
  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

uint64_t HDIsUnitTesting()
{
  if (HDIsUnitTesting_onceToken != -1)
    dispatch_once(&HDIsUnitTesting_onceToken, &__block_literal_global_7);
  return HDIsUnitTesting__HDFIsUnitTesting;
}

BOOL HDSQLiteColumnIsNonNull(HDSQLiteRow *a1, int a2)
{
  return !HDSQLiteRow::columnIsNull(a1, a2);
}

uint64_t HDSQLiteColumnAsInt64(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
}

double HDSQLiteRow::columnAsDouble(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double HDSQLiteRow::columnAsDouble(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 74, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double HDSQLiteRow::columnAsDouble(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 75, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  return sqlite3_column_double(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
}

void sub_210FCE31C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnAsNonEmptyString(HDSQLiteRow *a1, int a2)
{
  void *v2;
  void *v3;
  id v4;

  HDSQLiteRow::columnAsString(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void sub_210FCE384(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const void *HDSQLiteRow::columnAsBytes(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const void * _Nullable HDSQLiteRow::columnAsBytes(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 92, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const void * _Nullable HDSQLiteRow::columnAsBytes(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 93, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  if (HDSQLiteRow::columnIsNull(this, a2))
    return 0;
  else
    return sqlite3_column_blob(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
}

void sub_210FCE4D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteRow::columnBytesLength(HDSQLiteRow *this, int a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "int HDSQLiteRow::columnBytesLength(int) const");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSQLiteRow_Internal.h"), 103, CFSTR("Column must be greater than or equal to 0."));

  }
  if (*((_DWORD *)this + 5) <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "int HDSQLiteRow::columnBytesLength(int) const");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDSQLiteRow_Internal.h"), 104, CFSTR("Column must be less than the number of requested columns (%d)."), (*((_DWORD *)this + 5) - *((_DWORD *)this + 4)));

  }
  if (HDSQLiteRow::columnIsNull(this, a2))
    return 0;
  else
    return sqlite3_column_bytes(*((sqlite3_stmt **)this + 1), *((_DWORD *)this + 4) + a2);
}

void sub_210FCE630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id HDSQLiteRow::columnAsURL(HDSQLiteRow *this, int a2)
{
  void *v2;
  void *v3;

  HDSQLiteRow::columnAsString(this, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v2);
  else
    v3 = 0;

  return v3;
}

void sub_210FCE6B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteColumnWithName(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));

  return v4;
}

void sub_210FCE718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL HDSQLiteColumnWithNameIsNull(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 IsNull;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  IsNull = HDSQLiteRow::columnIsNull(a1, v4);

  return IsNull;
}

void sub_210FCE780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL HDSQLiteColumnWithNameAsBoolean(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  v5 = HDSQLiteRow::columnAsBoolean(a1, v4);

  return v5;
}

void sub_210FCE7E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteColumnWithNameAsInt64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, v4);

  return v5;
}

void sub_210FCE858(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double HDSQLiteColumnWithNameAsDouble(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  double v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  v5 = HDSQLiteRow::columnAsDouble(a1, v4);

  return v5;
}

void sub_210FCE8C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsString(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsString(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCE938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNonEmptyString(HDSQLiteRow *a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  HDSQLiteColumnWithNameAsString(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void sub_210FCE988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsData(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsData(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCE9F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsUUID(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsUUID(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCEA60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsDate(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsDate(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCEACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNumber(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsNumber(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCEB38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsURL(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsURL(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCEBA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsNaturalType(HDSQLiteRow *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;

  v3 = objc_retainAutorelease(a2);
  v4 = (*(uint64_t (**)(HDSQLiteRow *, uint64_t))(*(_QWORD *)a1 + 24))(a1, objc_msgSend(v3, "UTF8String"));
  HDSQLiteRow::columnAsNaturalType(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_210FCEC10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsObject(sqlite3_stmt **a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  HDSQLiteColumnWithNameAsData((HDSQLiteRow *)a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, v6, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v9 = v8;
    if (v7)
      v10 = 1;
    else
      v10 = v8 == 0;
    if (!v10)
    {
      _HKInitializeLogging();
      v11 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v6, "length");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", sqlite3_sql(a1[1]), 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v17 = a3;
        v18 = 2114;
        v19 = v5;
        v20 = 2048;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_210F9A000, v11, OS_LOG_TYPE_ERROR, "Error unarchiving object of class %{public}@ from column %{public}@ (retrieved data of length %lu; sql stateme"
          "nt %@): %{public}@",
          buf,
          0x34u);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_210FCEDCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsObjectWithClasses(sqlite3_stmt **a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  HDSQLiteColumnWithNameAsData((HDSQLiteRow *)a1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v6, v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v10 = v9;
    if (!v8 && v9)
    {
      _HKInitializeLogging();
      v11 = (id)*MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", sqlite3_sql(a1[1]), 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v13;
        v21 = 2114;
        v22 = v10;
        _os_log_error_impl(&dword_210F9A000, v11, OS_LOG_TYPE_ERROR, "Error unarchiving object from column %@ (classes: %@; sql statement %@): %{public}@",
          buf,
          0x2Au);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_210FCEF9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id HDSQLiteColumnWithNameAsArrayOfClass(sqlite3_stmt **a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsObjectWithClasses(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_210FCF064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindNull(HDSQLiteStatementBinder *this, NSString *a2)
{
  const char *v3;
  sqlite3_stmt *v4;
  int v5;
  NSString *v6;

  v6 = objc_retainAutorelease(a2);
  v3 = -[NSString UTF8String](v6, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v3);
  v4 = *(sqlite3_stmt **)this;
  v5 = HDSQLiteStatementBinder::indexForProperty(this, v3);
  sqlite3_bind_null(v4, v5);

}

void sub_210FCF864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindBoolean(HDSQLiteStatementBinder *this, NSString *a2, int a3)
{
  const char *v5;
  sqlite3_stmt *v6;
  int v7;
  NSString *v8;

  v8 = objc_retainAutorelease(a2);
  v5 = -[NSString UTF8String](v8, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  v6 = *(sqlite3_stmt **)this;
  v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_int(v6, v7, a3);

}

void sub_210FCF8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindInt64(HDSQLiteStatementBinder *this, NSString *a2, sqlite3_int64 a3)
{
  const char *v5;
  sqlite3_stmt *v6;
  int v7;
  NSString *v8;

  v8 = objc_retainAutorelease(a2);
  v5 = -[NSString UTF8String](v8, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  v6 = *(sqlite3_stmt **)this;
  v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_int64(v6, v7, a3);

}

void sub_210FCF97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindDouble(HDSQLiteStatementBinder *this, NSString *a2, double a3)
{
  const char *v5;
  sqlite3_stmt *v6;
  int v7;
  NSString *v8;

  v8 = objc_retainAutorelease(a2);
  v5 = -[NSString UTF8String](v8, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v5);
  v6 = *(sqlite3_stmt **)this;
  v7 = HDSQLiteStatementBinder::indexForProperty(this, v5);
  sqlite3_bind_double(v6, v7, a3);

}

void sub_210FCFA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindString(HDSQLiteStatementBinder *this, NSString *a2, NSString *a3)
{
  NSString *v5;
  NSString *v6;
  const char *v7;
  sqlite3_stmt *v8;
  int v9;
  int v10;
  NSString *v11;

  v5 = a2;
  v6 = a3;
  v11 = objc_retainAutorelease(v5);
  v7 = -[NSString UTF8String](v11, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_text(v8, v9, -[NSString UTF8String](objc_retainAutorelease(v6), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v10 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v10);
  }

}

void sub_210FCFAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindData(HDSQLiteStatementBinder *this, NSString *a2, NSData *a3)
{
  NSString *v5;
  NSData *v6;
  const char *v7;
  sqlite3_stmt *v8;
  int v9;
  NSData *v10;
  int v11;
  NSString *v12;

  v5 = a2;
  v6 = a3;
  v12 = objc_retainAutorelease(v5);
  v7 = -[NSString UTF8String](v12, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    v10 = objc_retainAutorelease(v6);
    sqlite3_bind_blob64(v8, v9, -[NSData bytes](v10, "bytes"), -[NSData length](v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v11);
  }

}

void sub_210FCFBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindUUID(HDSQLiteStatementBinder *this, NSString *a2, NSUUID *a3)
{
  NSString *v5;
  NSUUID *v6;
  NSString *v7;
  const char *v8;
  sqlite3_stmt *v9;
  int v10;
  sqlite3_stmt *v11;
  int v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_retainAutorelease(v5);
  v8 = -[NSString UTF8String](v7, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v8);
  if (v6)
  {
    v13[0] = 0;
    v13[1] = 0;
    -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", v13);
    v9 = *(sqlite3_stmt **)this;
    v10 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_blob(v9, v10, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v11 = *(sqlite3_stmt **)this;
    v12 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_null(v11, v12);
  }

}

void sub_210FCFCF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindDate(HDSQLiteStatementBinder *this, NSString *a2, NSDate *a3)
{
  NSString *v5;
  NSDate *v6;
  const char *v7;
  sqlite3_stmt *v8;
  int v9;
  double v10;
  int v11;
  NSString *v12;

  v5 = a2;
  v6 = a3;
  v12 = objc_retainAutorelease(v5);
  v7 = -[NSString UTF8String](v12, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  v8 = *(sqlite3_stmt **)this;
  if (v6)
  {
    v9 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    -[NSDate timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(v8, v9, v10);
  }
  else
  {
    v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v8, v11);
  }

}

void sub_210FCFDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bindNumber(HDSQLiteStatementBinder *this, NSString *a2, NSNumber *a3)
{
  NSString *v5;
  NSNumber *v6;
  const char *v7;
  NSNumber *v8;
  const char *v9;
  sqlite3_stmt *v10;
  int v11;
  sqlite3_stmt *v12;
  int v13;
  double v14;
  sqlite3_stmt *v15;
  int v16;
  NSString *v17;

  v5 = a2;
  v6 = a3;
  v17 = objc_retainAutorelease(v5);
  v7 = -[NSString UTF8String](v17, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v7);
  if (v6)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = (const char *)-[NSNumber objCType](v8, "objCType");
    if (!strcmp(v9, "d") || !strcmp(v9, "f"))
    {
      v12 = *(sqlite3_stmt **)this;
      v13 = HDSQLiteStatementBinder::indexForProperty(this, v7);
      -[NSNumber doubleValue](v8, "doubleValue");
      sqlite3_bind_double(v12, v13, v14);
    }
    else
    {
      v10 = *(sqlite3_stmt **)this;
      v11 = HDSQLiteStatementBinder::indexForProperty(this, v7);
      sqlite3_bind_int64(v10, v11, -[NSNumber longLongValue](v8, "longLongValue"));
    }
  }
  else
  {
    v15 = *(sqlite3_stmt **)this;
    v16 = HDSQLiteStatementBinder::indexForProperty(this, v7);
    sqlite3_bind_null(v15, v16);
  }

}

void sub_210FCFF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDSQLiteStatementBinder::bind(HDSQLiteStatementBinder *this, NSString *a2, objc_object *a3)
{
  NSString *v5;
  objc_object *v6;
  NSString *v7;
  const char *v8;
  sqlite3_stmt *v9;
  int v10;
  sqlite3_stmt *v11;
  int v12;
  uint64_t v13;
  const char *v14;
  sqlite3_stmt *v15;
  int v16;
  double v17;
  sqlite3_stmt *v18;
  int v19;
  objc_object *v20;
  sqlite3_stmt *v21;
  int v22;
  objc_object *v23;
  const char *v24;
  sqlite3_stmt *v25;
  int v26;
  sqlite3_stmt *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_retainAutorelease(v5);
  v8 = -[NSString UTF8String](v7, "UTF8String");
  HDSQLiteStatementBinder::_recordBoundProperty(this, v8);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = *(sqlite3_stmt **)this;
      v12 = HDSQLiteStatementBinder::indexForProperty(this, v8);
      v13 = -[objc_object UTF8String](objc_retainAutorelease(v6), "UTF8String");
      if (v13)
        v14 = (const char *)v13;
      else
        v14 = "";
      sqlite3_bind_text(v11, v12, v14, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = *(sqlite3_stmt **)this;
        v16 = HDSQLiteStatementBinder::indexForProperty(this, v8);
        -[objc_object timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
        sqlite3_bind_double(v15, v16, v17);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = *(sqlite3_stmt **)this;
          v19 = HDSQLiteStatementBinder::indexForProperty(this, v8);
          v20 = objc_retainAutorelease(v6);
          sqlite3_bind_blob(v18, v19, (const void *)-[objc_object bytes](v20, "bytes"), -[objc_object length](v20, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32[0] = 0;
            v32[1] = 0;
            -[objc_object getUUIDBytes:](v6, "getUUIDBytes:", v32);
            v21 = *(sqlite3_stmt **)this;
            v22 = HDSQLiteStatementBinder::indexForProperty(this, v8);
            sqlite3_bind_blob(v21, v22, v32, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HDSQLiteStatementBinder::bind(NSString * _Nonnull __strong, id  _Nullable __strong)");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("HDSQLiteStatementBinder_Internal.h"), 140, &stru_24CB19CC0);

            }
            v23 = objc_retainAutorelease(v6);
            v24 = (const char *)-[objc_object objCType](v23, "objCType");
            if (!strcmp(v24, "d") || !strcmp(v24, "f"))
            {
              v27 = *(sqlite3_stmt **)this;
              v28 = HDSQLiteStatementBinder::indexForProperty(this, v8);
              -[objc_object doubleValue](v23, "doubleValue");
              sqlite3_bind_double(v27, v28, v29);
            }
            else
            {
              v25 = *(sqlite3_stmt **)this;
              v26 = HDSQLiteStatementBinder::indexForProperty(this, v8);
              sqlite3_bind_int64(v25, v26, -[objc_object longLongValue](v23, "longLongValue"));
            }
          }
        }
      }
    }
  }
  else
  {
    v9 = *(sqlite3_stmt **)this;
    v10 = HDSQLiteStatementBinder::indexForProperty(this, v8);
    sqlite3_bind_null(v9, v10);
  }

}

void sub_210FD0270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void HDSQLiteBindSecureCodingObjectToProperty(HDSQLiteStatementBinder *a1, void *a2, void *a3)
{
  id v5;
  NSData *v6;
  NSString *v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    HDSQLiteStatementBinder::bindData(a1, v7, v6);

  }
  else
  {
    HDSQLiteStatementBinder::bindNull(a1, v7);
  }

}

void sub_210FD0340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void *HDSQLiteStatementBinder::_recordBoundProperty(HDSQLiteStatementBinder *this, const char *a2)
{
  char *v2;
  void *v4;
  void *v5;
  const char *v6;

  v6 = a2;
  v2 = (char *)this + 48;
  if (std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>((_QWORD *)this + 6, &v6))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void HDSQLiteStatementBinder::_recordBoundProperty(const char * _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HDSQLiteStatementBinder_Internal.h"), 162, CFSTR("Attempt to bind property '%s' twice."), v6);

  }
  return std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::__emplace_unique_key_args<char const*,char const* const&>((uint64_t)v2, &v6, &v6);
}

void sub_210FD0418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t HDSQLiteStatementBinder::indexForProperty(HDSQLiteStatementBinder *this, const char *a2)
{
  uint64_t **v2;
  void *v4;
  void *v5;
  const char *v6;

  v6 = a2;
  v2 = std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::find<char const*>((_QWORD *)this + 1, &v6);
  if (v2)
    return *((unsigned int *)v2 + 6);
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "int HDSQLiteStatementBinder::indexForProperty(const char * _Nonnull) const");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HDSQLiteStatementBinder_Internal.h"), 35, CFSTR("Property '%s' is not a bindable property on this statement."), v6);

  return 0xFFFFFFFFLL;
}

void sub_210FD04DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__hash_table<char const*,HDSQLiteStatementBinder::_Hash,HDSQLiteStatementBinder::_Comparison,std::allocator<char const*>>::__emplace_unique_key_args<char const*,char const* const&>(uint64_t a1, const char **a2, _QWORD *a3)
{
  uint64_t v3;
  const char *v6;
  char v7;
  unint64_t v8;
  unsigned __int8 *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  void **v17;
  void *i;
  unint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v6 = *a2;
  v7 = **a2;
  if (v7)
  {
    v8 = 0;
    v9 = (unsigned __int8 *)(v6 + 1);
    do
    {
      v8 = (1025 * (v8 + v7)) ^ ((1025 * (v8 + v7)) >> 6);
      v10 = *v9++;
      v7 = v10;
    }
    while (v10);
    v11 = 9 * v8;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11 ^ (v11 >> 11);
  v13 = 32769 * v12;
  v14 = *(_QWORD *)(a1 + 8);
  if (v14)
  {
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      v3 = 32769 * v12;
      if (v13 >= v14)
        v3 = v13 % v14;
    }
    else
    {
      v3 = v13 & (v14 - 1);
    }
    v17 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v17)
    {
      for (i = *v17; i; i = *(void **)i)
      {
        v19 = *((_QWORD *)i + 1);
        if (v19 == v13)
        {
          if (!strcmp(*((const char **)i + 2), v6))
            return i;
        }
        else
        {
          if (v16 > 1)
          {
            if (v19 >= v14)
              v19 %= v14;
          }
          else
          {
            v19 &= v14 - 1;
          }
          if (v19 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v13;
  *((_QWORD *)i + 2) = *a3;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v14 || (float)(v21 * (float)v14) < v20)
  {
    v22 = 1;
    if (v14 >= 3)
      v22 = (v14 & (v14 - 1)) != 0;
    v23 = v22 | (2 * v14);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::__rehash<true>(a1, v25);
    v14 = *(_QWORD *)(a1 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v13 >= v14)
        v3 = v13 % v14;
      else
        v3 = v13;
    }
    else
    {
      v3 = (v14 - 1) & v13;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v27)
  {
    *(_QWORD *)i = *v27;
LABEL_43:
    *v27 = i;
    goto LABEL_44;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v26 + 8 * v3) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v28 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v28 >= v14)
        v28 %= v14;
    }
    else
    {
      v28 &= v14 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_43;
  }
LABEL_44:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_210FD0748(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void logActiveStatement_cold_1(sqlite3_stmt *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  int v6;
  sqlite3_stmt *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = sqlite3_sql(a1);
  v5 = "<unknown sql>";
  if (v4)
    v5 = v4;
  v6 = 134218242;
  v7 = a1;
  v8 = 2082;
  v9 = v5;
  _os_log_error_impl(&dword_210F9A000, v3, OS_LOG_TYPE_ERROR, "Transaction finished with active outstanding statement: %p %{public}s", (uint8_t *)&v6, 0x16u);

}

void _LogOrAppend_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_210F9A000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void HDSQLiteComparisonTypeForPredicateOperator_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_210F9A000, a2, OS_LOG_TYPE_ERROR, "Unrecognized predicate operator type received: %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x24BE07878]();
}

uint64_t AKSEventsUnregister()
{
  return MEMORY[0x24BE07880]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x24BDD2B30]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x24BDD2B78]();
}

uint64_t HKDiagnosticStringFromDuration()
{
  return MEMORY[0x24BDD2B80]();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return MEMORY[0x24BDD2BB8]();
}

uint64_t HKHealthWrapDERDataFromString()
{
  return MEMORY[0x24BDD2F38]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x24BDD2F90]();
}

uint64_t HKLogAssertions()
{
  return MEMORY[0x24BDD2FB8]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x24BDD3018]();
}

uint64_t HKMachAbsoluteTimeGetCurrent()
{
  return MEMORY[0x24BDD3080]();
}

uint64_t HKSubmitAnalyticsFile()
{
  return MEMORY[0x24BDD37F8]();
}

uint64_t HKWithAutoreleasePool()
{
  return MEMORY[0x24BDD3878]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x24BE67120]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x24BDD4348]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CB17AD8(__p);
}

uint64_t operator delete()
{
  return off_24CB17AE0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CB17AE8(__sz);
}

uint64_t operator new()
{
  return off_24CB17AF0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF710](audittoken, buffer, *(_QWORD *)&buffersize);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x24BDAF9C8](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x24BEDDF20](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x24BEDDF28](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x24BEDDF40](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF50](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDDFF8](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x24BEDE0D8](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE100](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x24BEDE120](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

void sqlite3_interrupt(sqlite3 *a1)
{
  MEMORY[0x24BEDE168](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1E8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x24BEDE200](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x24BEDE210](a1, *(_QWORD *)&a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x24BEDE220](a1);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE238](a1, a2, *(_QWORD *)&a3, a4);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x24BEDE2A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE2B8](pStmt);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE308](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE310](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x24BEDE320](a1);
  return result;
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE368](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x24BDB0600]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x24BDB0810]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x24BDB0900]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x24BDB0A10]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x24BDB0A18]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x24BDB0A20]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x24BDB0A28]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x24BDB0A30]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x24BDB0A38]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

