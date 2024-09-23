uint64_t LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_45:
        *(_DWORD *)(a1 + 8) = v26;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v30;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        *(_BYTE *)(a1 + 24) = v20 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2402E3654(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2402E85AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  NSObject *v117;
  const char *v118;
  id v119;
  void *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  void *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  id v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint8_t v158[128];
  uint8_t buf[4];
  void *v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend_bmltIdentifiers(v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v18 = (void *)LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      objc_msgSend_bmltIdentifiers(v7, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialTaskID(v24, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bmltIdentifiers(v7, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialDeploymentID(v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v160 = v29;
      v161 = 2112;
      v162 = v39;
      _os_log_impl(&dword_2402DE000, v19, OS_LOG_TYPE_INFO, "bmltIdentifiers: %@ %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend_experimentIdentifiers(v7, v14, v15, v16, v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = (void *)LBFLogContextAggregator;
      if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
      {
        v42 = v41;
        objc_msgSend_experimentIdentifiers(v7, v43, v44, v45, v46);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialExperimentID(v152, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_experimentIdentifiers(v7, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialDeploymentID(v56, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_experimentIdentifiers(v7, v62, v63, v64, v65);
        v66 = v8;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialTreatmentID(v67, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v160 = v51;
        v161 = 2112;
        v162 = v61;
        v163 = 2112;
        v164 = v72;
        _os_log_impl(&dword_2402DE000, v42, OS_LOG_TYPE_INFO, "bmltIdentifiers: %@ %@ %@", buf, 0x20u);

        v8 = v66;
      }
    }
  }
  v150 = v7;
  v73 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v74 = *(void **)(a1 + 32);
    v75 = v73;
    objc_msgSend_startTime(v6, v76, v77, v78, v79, v7);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateToStringInUTCAndLocal_(v74, v81, (uint64_t)v80, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v160 = v84;
    _os_log_impl(&dword_2402DE000, v75, OS_LOG_TYPE_INFO, "Bucket Start Time: %@", buf, 0xCu);

  }
  v85 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v86 = *(void **)(a1 + 32);
    v87 = v85;
    objc_msgSend_endTime(v6, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateToStringInUTCAndLocal_(v86, v93, (uint64_t)v92, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v160 = v96;
    _os_log_impl(&dword_2402DE000, v87, OS_LOG_TYPE_INFO, "Bucket End Time:   %@", buf, 0xCu);

  }
  v151 = v6;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v97 = v8;
  v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v154, (uint64_t)v158, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v155;
    do
    {
      for (i = 0; i != v100; ++i)
      {
        if (*(_QWORD *)v155 != v101)
          objc_enumerationMutation(v97);
        v103 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v104 = v103;
          v105 = (void *)LBFLogContextAggregator;
          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
          {
            v106 = *(void **)(a1 + 32);
            v107 = v105;
            objc_msgSend_timestamp(v104, v108, v109, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dateToStringInUTCAndLocal_(v106, v113, (uint64_t)v112, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v160 = v116;
            v117 = v107;
            v118 = "BMLighthouseLedgerMlruntimedEvent %@";
LABEL_28:
            _os_log_impl(&dword_2402DE000, v117, OS_LOG_TYPE_INFO, v118, buf, 0xCu);

          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v119 = v103;
            v120 = (void *)LBFLogContextAggregator;
            if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
            {
              v121 = *(void **)(a1 + 32);
              v107 = v120;
              objc_msgSend_timestamp(v119, v122, v123, v124, v125);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dateToStringInUTCAndLocal_(v121, v126, (uint64_t)v112, v127, v128);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v160 = v116;
              v117 = v107;
              v118 = "BMLighthouseLedgerLighthousePluginEvent %@";
              goto LABEL_28;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v129 = v103;
              v130 = (void *)LBFLogContextAggregator;
              if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
              {
                v131 = *(void **)(a1 + 32);
                v107 = v130;
                objc_msgSend_timestamp(v129, v132, v133, v134, v135);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_dateToStringInUTCAndLocal_(v131, v136, (uint64_t)v112, v137, v138);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v160 = v116;
                v117 = v107;
                v118 = "BMLighthouseLedgerTrialdEvent %@";
                goto LABEL_28;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v140 = v103;
              v141 = (void *)LBFLogContextAggregator;
              if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
              {
                v142 = *(void **)(a1 + 32);
                v107 = v141;
                objc_msgSend_timestamp(v140, v143, v144, v145, v146);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_dateToStringInUTCAndLocal_(v142, v147, (uint64_t)v112, v148, v149);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v160 = v116;
                v117 = v107;
                v118 = "BMLighthouseLedgerDediscoPrivacyEvent %@";
                goto LABEL_28;
              }
            }
          }
        }

      }
      v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v139, (uint64_t)&v154, (uint64_t)v158, 16);
    }
    while (v100);
  }

}

void sub_2402E8CD8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *sub_2402E8CE8(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_2402EA278(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_2402ED084(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_2402F03E0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_2402F0878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_2402F0FD0(uint64_t a1)
{
  Class result;

  if (!qword_256FF5748)
    qword_256FF5748 = _sl_dlopen();
  result = objc_getClass("FedStatsDataEncoder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_256FF5740 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2402F1084(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2402F1098(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 8u);
}

id sub_2402F10D4(uint64_t a1, void *a2)
{
  return a2;
}

void sub_2402F10E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2402F10F4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, a3, a4, a5, 8u);
}

void sub_2402F1110(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_2402F1120(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  return objc_msgSend_code(v5, a2, a3, a4, a5);
}

id sub_2402F1128(id a1)
{
  return a1;
}

BOOL LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2402F18A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;

  objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_254355850;
  qword_254355850 = v5;

}

void sub_2402F1A10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2402F1A24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = LBFLogContextBiomeManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_ERROR))
      sub_240314E24(v7);
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend_source(*(void **)(v6 + 8), a2, a3, a4, a5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v8;

}

void sub_2402F1C88(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v9 = 134217984;
    v10 = objc_msgSend_count(v3, v5, v6, v7, v8);
    _os_log_impl(&dword_2402DE000, v4, OS_LOG_TYPE_INFO, "Completed with %ld events.", (uint8_t *)&v9, 0xCu);

  }
}

void sub_2402F1D40(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);

}

void sub_2402F1E90()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2402DE000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

uint64_t sub_2402F1EF4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  return v7;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOEventStatusReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_45:
        *(_DWORD *)(a1 + 8) = v26;
      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v30;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        *(_BYTE *)(a1 + 24) = v20 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 100)
        break;
      switch((_DWORD)v18)
      {
        case 1:
          v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 48), v22);
          if (!PBReaderPlaceMark()
            || !LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v22, a2))
          {
            goto LABEL_44;
          }
LABEL_37:
          PBReaderRecallMark();

          break;
        case 2:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v24;

          break;
        case 3:
          *(_BYTE *)(a1 + 56) |= 1u;
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
            *(_QWORD *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v21 = 0;
          }
          *(_QWORD *)(a1 + 8) = v21;
          break;
        default:
          goto LABEL_38;
      }
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((_DWORD)v18)
    {
      case 'e':
        v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        v23 = 24;
        break;
      case 'f':
        v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        v23 = 32;
        break;
      case 'g':
        v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        v23 = 40;
        break;
      default:
LABEL_38:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_42;
    }
    objc_storeStrong((id *)(a1 + v23), v22);
    if (!PBReaderPlaceMark() || (LIGHTHOUSE_BITACORA_PROTOEventStatusReadFrom((uint64_t)v22, a2) & 1) == 0)
    {
LABEL_44:

      return 0;
    }
    goto LABEL_37;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v18;
  uint64_t result;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 32), v18);
          if (PBReaderPlaceMark()
            && LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v20;

          continue;
        case 3u:
          *(_BYTE *)(a1 + 44) |= 1u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v24 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v24 = 0;
          }
          *(_QWORD *)(a1 + 8) = v24;
          continue;
        case 4u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v27) = 0;
LABEL_45:
          *(_DWORD *)(a1 + 24) = v27;
          continue;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          break;
        v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0)
          goto LABEL_47;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v34 = 0;
          goto LABEL_49;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_49:
      *(_BYTE *)(a1 + 40) = v34 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2402F5CEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void LBFLoggingUtilsInit()
{
  if (qword_254355848 != -1)
    dispatch_once(&qword_254355848, &unk_251095090);
}

void sub_2402F5D30()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;

  v0 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventManager);
  v1 = (void *)LBFLogContextEventManager;
  LBFLogContextEventManager = (uint64_t)v0;

  v2 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryAggregator);
  v3 = (void *)LBFLogContextAggregator;
  LBFLogContextAggregator = (uint64_t)v2;

  v4 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventFiltering);
  v5 = (void *)LBFLogContextEventFiltering;
  LBFLogContextEventFiltering = (uint64_t)v4;

  v6 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBiomeManager);
  v7 = (void *)LBFLogContextBiomeManager;
  LBFLogContextBiomeManager = (uint64_t)v6;

  v8 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventsHolder);
  v9 = (void *)LBFLogContextEventsHolder;
  LBFLogContextEventsHolder = (uint64_t)v8;

  v10 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBiomeConverter);
  v11 = (void *)LBFLogContextBiomeConverter;
  LBFLogContextBiomeConverter = (uint64_t)v10;

  v12 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryProtoConverter);
  v13 = (void *)LBFLogContextProtoConverter;
  LBFLogContextProtoConverter = (uint64_t)v12;

  v14 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBitacoraStateInfo);
  v15 = (void *)LBFLogContextBitacoraStateInfo;
  LBFLogContextBitacoraStateInfo = (uint64_t)v14;

  v16 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryTrialStatusDetector);
  v17 = (void *)LBFLogContextTrialStatusDetector;
  LBFLogContextTrialStatusDetector = (uint64_t)v16;

  v18 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBitacoraStateTransition);
  v19 = (void *)LBFLogContextBitacoraStateTransition;
  LBFLogContextBitacoraStateTransition = (uint64_t)v18;

  v20 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryStateDetector);
  v21 = (void *)LBFLogContextStateDetector;
  LBFLogContextStateDetector = (uint64_t)v20;

  v22 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryTrialIdentifires);
  v23 = (void *)LBFLogContextTrialIdentifires;
  LBFLogContextTrialIdentifires = (uint64_t)v22;

}

id sub_2402F6594(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t LIGHTHOUSE_BITACORA_PROTOBitacoraStateReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  int *v56;
  uint64_t v57;
  int *v58;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v59;
  void *v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  uint64_t result;
  uint64_t v123;
  BOOL v124;
  uint64_t v125;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v6) == 0;
  v8 = &OBJC_IVAR___LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent__eventType;
  v9 = (int *)MEMORY[0x24BE7AF30];
  v10 = &OBJC_IVAR___LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent__eventType;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v6))
      return *(_BYTE *)(a2 + *v6) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v4;
      v15 = *(_QWORD *)(a2 + v14);
      if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v5))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
      *(_QWORD *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v17 = v12++ >= 9;
      if (v17)
      {
        v13 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v6);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v6);
    if (*(_BYTE *)(a2 + *v6))
      v13 = 0;
LABEL_14:
    if (v18 || (v13 & 7) == 4)
      return *(_BYTE *)(a2 + *v6) == 0;
    v20 = v13 >> 3;
    if ((int)(v13 >> 3) > 300)
    {
      switch((int)v20)
      {
        case 301:
          v29 = 0;
          v30 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x800u;
          while (2)
          {
            v31 = *v4;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v23 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_173:
          v123 = 68;
          goto LABEL_239;
        case 302:
          v67 = 0;
          v68 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x400u;
          while (2)
          {
            v69 = *v4;
            v70 = *(_QWORD *)(a2 + v69);
            if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v70);
              *(_QWORD *)(a2 + v69) = v70 + 1;
              v23 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                v17 = v68++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_198;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_198:
          v123 = 64;
          goto LABEL_239;
        case 303:
          v72 = 0;
          v73 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x2000u;
          while (2)
          {
            v74 = *v4;
            v75 = *(_QWORD *)(a2 + v74);
            if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v75);
              *(_QWORD *)(a2 + v74) = v75 + 1;
              v23 |= (unint64_t)(v76 & 0x7F) << v72;
              if (v76 < 0)
              {
                v72 += 7;
                v17 = v73++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_202;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_202:
          v123 = 76;
          goto LABEL_239;
        case 304:
          v77 = 0;
          v78 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x1000u;
          while (2)
          {
            v79 = *v4;
            v80 = *(_QWORD *)(a2 + v79);
            if (v80 == -1 || v80 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v80);
              *(_QWORD *)(a2 + v79) = v80 + 1;
              v23 |= (unint64_t)(v81 & 0x7F) << v77;
              if (v81 < 0)
              {
                v77 += 7;
                v17 = v78++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_206;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_206:
          v123 = 72;
          goto LABEL_239;
        case 305:
          v82 = 0;
          v83 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x200u;
          while (2)
          {
            v84 = *v4;
            v85 = *(_QWORD *)(a2 + v84);
            if (v85 == -1 || v85 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v85);
              *(_QWORD *)(a2 + v84) = v85 + 1;
              v23 |= (unint64_t)(v86 & 0x7F) << v82;
              if (v86 < 0)
              {
                v82 += 7;
                v17 = v83++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_210;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_210:
          v123 = 60;
          goto LABEL_239;
        case 306:
          v87 = 0;
          v88 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 0x100u;
          while (2)
          {
            v89 = *v4;
            v90 = *(_QWORD *)(a2 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v90);
              *(_QWORD *)(a2 + v89) = v90 + 1;
              v23 |= (unint64_t)(v91 & 0x7F) << v87;
              if (v91 < 0)
              {
                v87 += 7;
                v17 = v88++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_214;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_214:
          v123 = 56;
          goto LABEL_239;
        default:
          switch((int)v20)
          {
            case 501:
              v21 = 0;
              v22 = 0;
              v23 = 0;
              *(_DWORD *)(a1 + v8[13]) |= 0x4000u;
              while (2)
              {
                v24 = *v4;
                v25 = *(_QWORD *)(a2 + v24);
                if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v5))
                {
                  *(_BYTE *)(a2 + *v6) = 1;
                }
                else
                {
                  v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v25);
                  *(_QWORD *)(a2 + v24) = v25 + 1;
                  v23 |= (unint64_t)(v26 & 0x7F) << v21;
                  if (v26 < 0)
                  {
                    v21 += 7;
                    v17 = v22++ >= 9;
                    if (v17)
                    {
                      LODWORD(v23) = 0;
                      goto LABEL_169;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v6))
                LODWORD(v23) = 0;
LABEL_169:
              v123 = 104;
              goto LABEL_239;
            case 502:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 96;
              goto LABEL_79;
            case 503:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 88;
              goto LABEL_79;
            case 504:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 128;
              goto LABEL_79;
            case 505:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 120;
              goto LABEL_79;
            default:
              switch((int)v20)
              {
                case 401:
                  v39 = 0;
                  v40 = 0;
                  v23 = 0;
                  *(_DWORD *)(a1 + v8[13]) |= 0x20u;
                  while (2)
                  {
                    v41 = *v4;
                    v42 = *(_QWORD *)(a2 + v41);
                    if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v5))
                    {
                      *(_BYTE *)(a2 + *v6) = 1;
                    }
                    else
                    {
                      v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v42);
                      *(_QWORD *)(a2 + v41) = v42 + 1;
                      v23 |= (unint64_t)(v43 & 0x7F) << v39;
                      if (v43 < 0)
                      {
                        v39 += 7;
                        v17 = v40++ >= 9;
                        if (v17)
                        {
                          LODWORD(v23) = 0;
                          goto LABEL_181;
                        }
                        continue;
                      }
                    }
                    break;
                  }
                  if (*(_BYTE *)(a2 + *v6))
                    LODWORD(v23) = 0;
LABEL_181:
                  v123 = 44;
                  goto LABEL_239;
                case 402:
                  v107 = 0;
                  v108 = 0;
                  v23 = 0;
                  *(_DWORD *)(a1 + v8[13]) |= 0x10u;
                  while (2)
                  {
                    v109 = *v4;
                    v110 = *(_QWORD *)(a2 + v109);
                    if (v110 == -1 || v110 >= *(_QWORD *)(a2 + *v5))
                    {
                      *(_BYTE *)(a2 + *v6) = 1;
                    }
                    else
                    {
                      v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v110);
                      *(_QWORD *)(a2 + v109) = v110 + 1;
                      v23 |= (unint64_t)(v111 & 0x7F) << v107;
                      if (v111 < 0)
                      {
                        v107 += 7;
                        v17 = v108++ >= 9;
                        if (v17)
                        {
                          LODWORD(v23) = 0;
                          goto LABEL_230;
                        }
                        continue;
                      }
                    }
                    break;
                  }
                  if (*(_BYTE *)(a2 + *v6))
                    LODWORD(v23) = 0;
LABEL_230:
                  v123 = 40;
                  goto LABEL_239;
                case 403:
                  v112 = 0;
                  v113 = 0;
                  v23 = 0;
                  *(_DWORD *)(a1 + v8[13]) |= 0x80u;
                  while (2)
                  {
                    v114 = *v4;
                    v115 = *(_QWORD *)(a2 + v114);
                    if (v115 == -1 || v115 >= *(_QWORD *)(a2 + *v5))
                    {
                      *(_BYTE *)(a2 + *v6) = 1;
                    }
                    else
                    {
                      v116 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v115);
                      *(_QWORD *)(a2 + v114) = v115 + 1;
                      v23 |= (unint64_t)(v116 & 0x7F) << v112;
                      if (v116 < 0)
                      {
                        v112 += 7;
                        v17 = v113++ >= 9;
                        if (v17)
                        {
                          LODWORD(v23) = 0;
                          goto LABEL_234;
                        }
                        continue;
                      }
                    }
                    break;
                  }
                  if (*(_BYTE *)(a2 + *v6))
                    LODWORD(v23) = 0;
LABEL_234:
                  v123 = 52;
                  goto LABEL_239;
                case 404:
                  v117 = 0;
                  v118 = 0;
                  v23 = 0;
                  *(_DWORD *)(a1 + v8[13]) |= 0x40u;
                  break;
                default:
                  goto LABEL_164;
              }
              break;
          }
          break;
      }
      while (1)
      {
        v119 = *v4;
        v120 = *(_QWORD *)(a2 + v119);
        if (v120 == -1 || v120 >= *(_QWORD *)(a2 + *v5))
          break;
        v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v120);
        *(_QWORD *)(a2 + v119) = v120 + 1;
        v23 |= (unint64_t)(v121 & 0x7F) << v117;
        if ((v121 & 0x80) == 0)
          goto LABEL_236;
        v117 += 7;
        v17 = v118++ >= 9;
        if (v17)
        {
          LODWORD(v23) = 0;
          goto LABEL_238;
        }
      }
      *(_BYTE *)(a2 + *v6) = 1;
LABEL_236:
      if (*(_BYTE *)(a2 + *v6))
        LODWORD(v23) = 0;
LABEL_238:
      v123 = 48;
LABEL_239:
      *(_DWORD *)(a1 + v123) = v23;
      goto LABEL_240;
    }
    if ((int)v20 > 101)
    {
      switch((int)v20)
      {
        case 201:
          v34 = 0;
          v35 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 4u;
          while (2)
          {
            v36 = *v4;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v23 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v17 = v35++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_177;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_177:
          v123 = 32;
          goto LABEL_239;
        case 202:
          v92 = 0;
          v93 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 8u;
          while (2)
          {
            v94 = *v4;
            v95 = *(_QWORD *)(a2 + v94);
            if (v95 == -1 || v95 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v95);
              *(_QWORD *)(a2 + v94) = v95 + 1;
              v23 |= (unint64_t)(v96 & 0x7F) << v92;
              if (v96 < 0)
              {
                v92 += 7;
                v17 = v93++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_218:
          v123 = 36;
          goto LABEL_239;
        case 203:
          v97 = 0;
          v98 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 1u;
          while (2)
          {
            v99 = *v4;
            v100 = *(_QWORD *)(a2 + v99);
            if (v100 == -1 || v100 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v101 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v100);
              *(_QWORD *)(a2 + v99) = v100 + 1;
              v23 |= (unint64_t)(v101 & 0x7F) << v97;
              if (v101 < 0)
              {
                v97 += 7;
                v17 = v98++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_222;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_222:
          v123 = 24;
          goto LABEL_239;
        case 204:
          v102 = 0;
          v103 = 0;
          v23 = 0;
          *(_DWORD *)(a1 + v8[13]) |= 2u;
          while (2)
          {
            v104 = *v4;
            v105 = *(_QWORD *)(a2 + v104);
            if (v105 == -1 || v105 >= *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v106 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v105);
              *(_QWORD *)(a2 + v104) = v105 + 1;
              v23 |= (unint64_t)(v106 & 0x7F) << v102;
              if (v106 < 0)
              {
                v102 += 7;
                v17 = v103++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_226;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v23) = 0;
LABEL_226:
          v123 = 28;
          goto LABEL_239;
        default:
          if ((_DWORD)v20 == 102)
          {
            v50 = 0;
            v51 = 0;
            v52 = 0;
            *(_DWORD *)(a1 + v8[13]) |= 0x8000u;
            while (1)
            {
              v53 = *v4;
              v54 = *(_QWORD *)(a2 + v53);
              if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v5))
                break;
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if ((v55 & 0x80) == 0)
                goto LABEL_187;
              v50 += 7;
              v17 = v51++ >= 9;
              if (v17)
              {
                v52 = 0;
                goto LABEL_189;
              }
            }
            *(_BYTE *)(a2 + *v6) = 1;
LABEL_187:
            if (*(_BYTE *)(a2 + *v6))
              v52 = 0;
LABEL_189:
            v124 = v52 != 0;
            v125 = 136;
LABEL_190:
            *(_BYTE *)(a1 + v125) = v124;
          }
          else
          {
LABEL_164:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          break;
      }
      goto LABEL_240;
    }
    switch((int)v20)
    {
      case 1:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 80;
        goto LABEL_79;
      case 2:
        v56 = v8;
        v57 = v2;
        v58 = v10;
        v59 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
        objc_storeStrong((id *)(a1 + 112), v59);
        if (PBReaderPlaceMark()
          && LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v59, a2))
        {
          PBReaderRecallMark();

          v10 = v58;
          v2 = v57;
          v8 = v56;
LABEL_240:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          continue;
        }

        return 0;
      case 3:
        PBReaderReadString();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 16;
LABEL_79:
        v60 = *(void **)(a1 + v28);
        *(_QWORD *)(a1 + v28) = v27;

        goto LABEL_240;
      case 4:
        v61 = 0;
        v62 = 0;
        v63 = 0;
        while (2)
        {
          v64 = *v4;
          v65 = *(_QWORD *)(a2 + v64);
          if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v65);
            *(_QWORD *)(a2 + v64) = v65 + 1;
            v63 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              v17 = v62++ >= 9;
              if (v17)
              {
                v63 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v63 = 0;
LABEL_194:
        *(_QWORD *)(a1 + 8) = v63;
        goto LABEL_240;
      default:
        if ((_DWORD)v20 != 101)
          goto LABEL_164;
        v44 = 0;
        v45 = 0;
        v46 = 0;
        *(_DWORD *)(a1 + v8[13]) |= 0x10000u;
        while (2)
        {
          v47 = *v4;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v17 = v45++ >= 9;
              if (v17)
              {
                v46 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v46 = 0;
LABEL_185:
        v124 = v46 != 0;
        v125 = v10[14];
        goto LABEL_190;
    }
  }
}

void sub_2402F9F40()
{
  LBFEventManager *v0;
  void *v1;

  v0 = objc_alloc_init(LBFEventManager);
  v1 = (void *)qword_254355868;
  qword_254355868 = (uint64_t)v0;

}

void sub_2402FA068(uint64_t a1)
{
  LBFBiomeManager *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_240315784();
  }
  v2 = [LBFBiomeManager alloc];
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_LighthousePluginEvent(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 8);
  *(_QWORD *)(v23 + 8) = v22;

}

void sub_2402FA1B8(uint64_t a1)
{
  LBFBiomeManager *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_2403157B0();
  }
  v2 = [LBFBiomeManager alloc];
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_TrialdEvent(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 16);
  *(_QWORD *)(v23 + 16) = v22;

}

void sub_2402FA308(uint64_t a1)
{
  LBFBiomeManager *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_2403157DC();
  }
  v2 = [LBFBiomeManager alloc];
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_MlruntimedEvent(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 24);
  *(_QWORD *)(v23 + 24) = v22;

}

void sub_2402FA458(uint64_t a1)
{
  LBFBiomeManager *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_240315808();
  }
  v2 = [LBFBiomeManager alloc];
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_DediscoPrivacyEvent(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 32);
  *(_QWORD *)(v23 + 32) = v22;

}

uint64_t sub_2402FB20C(uint64_t *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LBFTrialEvent *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  LBFTrialEvent *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  LBFTrialEvent *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;

  v3 = a2;
  v8 = v3;
  if (a1[4]
    && (v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !(_DWORD)v9))
  {
    v37 = 1;
  }
  else
  {
    v13 = (void *)a1[5];
    objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_eventType(v8, v19, v20, v21, v22) == 1)
    {
      v27 = [LBFTrialEvent alloc];
      v32 = objc_msgSend_eventSucceeded(v8, v28, v29, v30, v31);
      v36 = (void *)objc_msgSend_initWithAllocation_(v27, v33, v32, v34, v35);
    }
    else
    {
      v36 = 0;
    }
    if (objc_msgSend_eventType(v8, v23, v24, v25, v26) == 2)
    {
      v42 = [LBFTrialEvent alloc];
      v47 = objc_msgSend_eventSucceeded(v8, v43, v44, v45, v46);
      v51 = objc_msgSend_initWithActivation_(v42, v48, v47, v49, v50);

      v36 = (void *)v51;
    }
    if (objc_msgSend_eventType(v8, v38, v39, v40, v41) == 3)
    {
      v56 = [LBFTrialEvent alloc];
      v61 = objc_msgSend_eventSucceeded(v8, v57, v58, v59, v60);
      v65 = objc_msgSend_initWithDeactivation_(v56, v62, v61, v63, v64);

      v36 = (void *)v65;
    }
    v66 = a1[6];
    objc_msgSend_timestamp(v8, v52, v53, v54, v55);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v66 + 16))(v66, v18, v36, v67);

  }
  return v37;
}

void sub_2402FB47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2402FB494(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2402FB4A4(uint64_t a1)
{

}

uint64_t sub_2402FB4AC(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t sub_2402FB5EC(uint64_t *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  LBFLighthouseEvent *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  const char *v101;
  void *v102;
  uint64_t v103;
  LBFLighthouseEvent *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  id v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  const char *v150;
  void *v151;
  LBFLighthouseEvent *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;

  v3 = a2;
  v8 = v3;
  if (a1[4]
    && (v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !(_DWORD)v9))
  {
    v103 = 1;
  }
  else
  {
    v13 = (void *)a1[5];
    objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_performTaskStatus(v8, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend_performTaskStatus(v8, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v28, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_performTaskStatus(v8, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v39, v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_performTaskStatus(v8, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_errorCode(v49, v50, v51, v52, v53);
        v33 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v34, v55, (uint64_t)v44, v54, 0);

      }
      v56 = [LBFLighthouseEvent alloc];
      objc_msgSend_performTaskStatus(v8, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_succeeded(v61, v62, v63, v64, v65);
      v23 = (void *)objc_msgSend_initWithPerformTaskStatus_error_(v56, v67, v66, (uint64_t)v33, v68);

    }
    objc_msgSend_performTrialTaskStatus(v8, v24, v25, v26, v27);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend_performTrialTaskStatus(v8, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v74, v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        v80 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_performTrialTaskStatus(v8, v81, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v85, v86, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_performTrialTaskStatus(v8, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_errorCode(v95, v96, v97, v98, v99);
        v102 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v80, v101, (uint64_t)v90, v100, 0);

      }
      else
      {
        v102 = 0;
      }
      v104 = [LBFLighthouseEvent alloc];
      objc_msgSend_performTrialTaskStatus(v8, v105, v106, v107, v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend_succeeded(v109, v110, v111, v112, v113);
      v117 = objc_msgSend_initWithPerformTrialTaskStatus_error_(v104, v115, v114, (uint64_t)v102, v116);

      v23 = (void *)v117;
    }
    objc_msgSend_stop(v8, v70, v71, v72, v73);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      objc_msgSend_stop(v8, v119, v120, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v123, v124, v125, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (v128)
      {
        v129 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_stop(v8, v130, v131, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v134, v135, v136, v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stop(v8, v140, v141, v142, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend_errorCode(v144, v145, v146, v147, v148);
        v151 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v129, v150, (uint64_t)v139, v149, 0);

      }
      else
      {
        v151 = 0;
      }
      v152 = [LBFLighthouseEvent alloc];
      objc_msgSend_stop(v8, v153, v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = objc_msgSend_succeeded(v157, v158, v159, v160, v161);
      v165 = objc_msgSend_initWithStop_error_(v152, v163, v162, (uint64_t)v151, v164);

      v23 = (void *)v165;
    }
    v166 = a1[6];
    objc_msgSend_timestamp(v8, v119, v120, v121, v122);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v166 + 16))(v166, v18, v23, v167);

  }
  return v103;
}

void sub_2402FBA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2402FBA90(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t sub_2402FBBD0(uint64_t *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  LBFMLRuntimedEvent *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  LBFMLRuntimedEvent *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  const char *v123;
  void *v124;
  LBFMLRuntimedEvent *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int v170;
  const char *v171;
  void *v172;
  LBFMLRuntimedEvent *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;

  v3 = a2;
  v8 = v3;
  if (a1[4]
    && (v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !(_DWORD)v9))
  {
    v76 = 1;
  }
  else
  {
    v13 = (void *)a1[5];
    objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_activityScheduleStatus(v8, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v28 = [LBFMLRuntimedEvent alloc];
      objc_msgSend_activityScheduleStatus(v8, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_scheduled(v33, v34, v35, v36, v37);
      v23 = (void *)objc_msgSend_initWithScheduleStatus_(v28, v39, v38, v40, v41);

    }
    objc_msgSend_taskFetched(v8, v24, v25, v26, v27);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend_taskFetched(v8, v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_taskFetched(v8, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v58, v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_taskFetched(v8, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend_errorCode(v68, v69, v70, v71, v72);
        v75 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v53, v74, (uint64_t)v63, v73, 0);

      }
      else
      {
        v75 = 0;
      }
      v77 = [LBFMLRuntimedEvent alloc];
      objc_msgSend_taskFetched(v8, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend_succeeded(v82, v83, v84, v85, v86);
      v90 = objc_msgSend_initWithTaskFetched_error_(v77, v88, v87, (uint64_t)v75, v89);

      v23 = (void *)v90;
    }
    objc_msgSend_taskScheduled(v8, v43, v44, v45, v46);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      objc_msgSend_taskScheduled(v8, v92, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v96, v97, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        v102 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_taskScheduled(v8, v103, v104, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v107, v108, v109, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_taskScheduled(v8, v113, v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend_errorCode(v117, v118, v119, v120, v121);
        v124 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v102, v123, (uint64_t)v112, v122, 0);

      }
      else
      {
        v124 = 0;
      }
      v125 = [LBFMLRuntimedEvent alloc];
      objc_msgSend_taskScheduled(v8, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend_succeeded(v130, v131, v132, v133, v134);
      v138 = objc_msgSend_initWithTaskScheduled_error_(v125, v136, v135, (uint64_t)v124, v137);

      v23 = (void *)v138;
    }
    objc_msgSend_taskCompleted(v8, v92, v93, v94, v95);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    if (v139)
    {
      objc_msgSend_taskCompleted(v8, v140, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v144, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (v149)
      {
        v150 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend_taskCompleted(v8, v151, v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v155, v156, v157, v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_taskCompleted(v8, v161, v162, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend_errorCode(v165, v166, v167, v168, v169);
        v172 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v150, v171, (uint64_t)v160, v170, 0);

      }
      else
      {
        v172 = 0;
      }
      v173 = [LBFMLRuntimedEvent alloc];
      objc_msgSend_taskCompleted(v8, v174, v175, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = objc_msgSend_succeeded(v178, v179, v180, v181, v182);
      v186 = objc_msgSend_initWithTaskCompleted_error_(v173, v184, v183, (uint64_t)v172, v185);

      v23 = (void *)v186;
    }
    v187 = a1[6];
    objc_msgSend_timestamp(v8, v140, v141, v142, v143);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v187 + 16))(v187, v18, v23, v188);

  }
  return v76;
}

void sub_2402FC0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2402FC0D0(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t sub_2402FC210(uint64_t *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  LBFDprivacydEvent *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v87;

  v3 = a2;
  v8 = v3;
  if (a1[4]
    && (v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !(_DWORD)v9))
  {
    v41 = 1;
  }
  else
  {
    v13 = (void *)a1[5];
    objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_event(v8, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorMessage(v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_alloc(MEMORY[0x24BDD1540]);
      objc_msgSend_event(v8, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorMessage(v33, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v28, v39, (uint64_t)v38, 0, 0);

    }
    else
    {
      v40 = 0;
    }
    v42 = [LBFDprivacydEvent alloc];
    objc_msgSend_event(v8, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_phase(v47, v48, v49, v50, v51);
    objc_msgSend_eventIdentifier(v8, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_event(v8, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_succeeded(v62, v63, v64, v65, v66);
    v72 = objc_msgSend_aggregateFunction(v8, v68, v69, v70, v71);
    v77 = objc_msgSend_count(v8, v73, v74, v75, v76);
    v79 = (void *)objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_aggregateFunction_count_(v42, v78, v52, (uint64_t)v57, v67, v40, v72, v77);

    v80 = a1[6];
    objc_msgSend_timestamp(v8, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v80 + 16))(v80, v87, v79, v85);

  }
  return v41;
}

void sub_2402FC4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2402FC510(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

void sub_2402FC8A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_2402FD1DC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2402FD1E8()
{
  uint64_t v0;

  return v0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 100)
        break;
      switch((_DWORD)v18)
      {
        case 1:
          v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 56), v19);
          if (!PBReaderPlaceMark()
            || !LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v19, a2))
          {
            goto LABEL_46;
          }
LABEL_37:
          PBReaderRecallMark();

          break;
        case 2:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v25;

          break;
        case 3:
          *(_BYTE *)(a1 + 64) |= 1u;
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v22 = 0;
          }
          *(_QWORD *)(a1 + 8) = v22;
          break;
        default:
LABEL_40:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          break;
      }
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((int)v18)
    {
      case 'e':
        v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOScheduleStatus);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark()
          || (LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_37;
      case 'f':
        v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        v23 = 40;
        break;
      case 'g':
        v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        v23 = 48;
        break;
      case 'h':
        v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        v23 = 32;
        break;
      default:
        goto LABEL_40;
    }
    objc_storeStrong((id *)(a1 + v23), v19);
    if (!PBReaderPlaceMark() || (LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom((uint64_t)v19, a2) & 1) == 0)
    {
LABEL_46:

      return 0;
    }
    goto LABEL_37;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || !LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom((uint64_t)v17, a2))
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiersReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL sub_240300D34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_240300D4C()
{
  sub_24030F3F8();
  return sub_2403160F4();
}

void sub_240300D88(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_240300D90@<X0>(unint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_24030D43C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_240300DB4()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_240300DBC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_24030D43C(*a1);
  *a2 = result;
  return result;
}

void sub_240300DE4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_240300DF0(_QWORD *a1@<X8>)
{
  *a1 = &unk_251094F70;
}

uint64_t sub_240300E00()
{
  sub_2403162C8();
  sub_240316220();
  return sub_2403162D4();
}

uint64_t sub_240300E60()
{
  sub_24030F43C();
  return sub_2403160F4();
}

uint64_t sub_240300E98()
{
  sub_2403162C8();
  sub_240316220();
  return sub_2403162D4();
}

unint64_t sub_240300EF4@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 3;
  if (result < 3)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t *sub_240300F08@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_240300F20(_QWORD *a1@<X8>)
{
  *a1 = &unk_251095028;
}

uint64_t sub_240300F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7B58);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7B58);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AE0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "experimentIdentifiers";
  *(_QWORD *)(v7 + 8) = 21;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "bmltIdentifiers";
  *((_QWORD *)v11 + 1) = 15;
  v11[16] = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_240301080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_240316100();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 2)
      {
        sub_24030115C();
      }
      else if (result == 1)
      {
        sub_2403066A0(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, &qword_256FF55A0, (uint64_t)&unk_240319AD0);
      }
      result = sub_240316100();
    }
  }
  return result;
}

uint64_t sub_24030115C()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  sub_24030CB9C(&qword_256FF5580, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319968);
  return sub_240316154();
}

uint64_t sub_2403011F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_24030125C(v3, a1, a2, a3);
  if (!v4)
  {
    sub_2403013D0(v3, a1, a2, a3);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_24030125C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = a4;
  sub_240308D40(&qword_256FF5430);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_24030F334(a1 + *(int *)(v11 + 20), (uint64_t)v6, &qword_256FF5430);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_24030F3BC((uint64_t)v6, &qword_256FF5430);
  sub_24030D3A0((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  sub_24030CB9C(&qword_256FF55A0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319AD0);
  sub_2403161F0();
  return sub_240309448((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_2403013D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = a4;
  sub_240308D40(&qword_256FF5438);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_24030F334(a1 + *(int *)(v11 + 24), (uint64_t)v6, &qword_256FF5438);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_24030F3BC((uint64_t)v6, &qword_256FF5438);
  sub_24030D3A0((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_24030CB9C(&qword_256FF5580, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319968);
  sub_2403161F0();
  return sub_240309448((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_240301548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_240316088();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + *(int *)(a1 + 24);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

unint64_t sub_2403015C8()
{
  return 0xD00000000000003ALL;
}

uint64_t (*sub_2403015F0())()
{
  return nullsub_1;
}

uint64_t sub_240301604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240301080(a1, a2, a3);
}

uint64_t sub_240301618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2403011F0(a1, a2, a3);
}

uint64_t sub_240301630()
{
  sub_24030CB9C(&qword_256FF55F8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C00);
  return sub_2403160E8();
}

uint64_t sub_240301684@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5218, (uint64_t)qword_256FF7B58, a1);
}

uint64_t sub_2403016A0()
{
  sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
  return sub_240316184();
}

uint64_t sub_2403016E4()
{
  sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
  return sub_240316190();
}

uint64_t sub_24030173C(uint64_t a1)
{
  return sub_240301CE8(a1, 0xD000000000000016, 0x800000024031C290, qword_256FF7B70, &qword_256FF7B70[1]);
}

uint64_t sub_240301764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7B80);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7B80);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "trialExperimentID";
  *(_QWORD *)(v7 + 8) = 17;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "trialDeploymentID";
  *((_QWORD *)v11 + 1) = 17;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "trialTreatmentID";
  *(_QWORD *)(v12 + 8) = 16;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_2403018F8()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_240316100();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 3 || result == 2 || result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      sub_24031613C();
    }
    v0 = 0;
  }
  return result;
}

uint64_t sub_2403019BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_240301FC8(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  if (!v4)
  {
    sub_24030203C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    sub_240301A50(v3);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_240301A50(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 28) + 8))
    return sub_2403161CC();
  return result;
}

uint64_t sub_240301AC8@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  result = sub_240316088();
  v5 = a1[6];
  v6 = (_QWORD *)(a2 + a1[5]);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(a2 + a1[7]);
  *v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_240301B0C(uint64_t a1, uint64_t a2)
{
  return sub_240302108(a1, a2, &qword_256FF5220, qword_256FF7B70);
}

uint64_t sub_240301B2C()
{
  return sub_2403018F8();
}

uint64_t sub_240301B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2403019BC(a1, a2, a3);
}

uint64_t sub_240301B54()
{
  sub_24030CB9C(&qword_256FF5628, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319A98);
  return sub_2403160E8();
}

uint64_t sub_240301BA4@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5228, (uint64_t)qword_256FF7B80, a1);
}

uint64_t sub_240301BC0@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_240316214();
  v6 = sub_24030D3E4(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_240301C2C()
{
  sub_24030CB9C(&qword_256FF55A0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319AD0);
  return sub_240316184();
}

uint64_t sub_240301C6C()
{
  sub_24030CB9C(&qword_256FF55A0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319AD0);
  return sub_240316190();
}

uint64_t sub_240301CC0(uint64_t a1)
{
  return sub_240301CE8(a1, 0xD000000000000010, 0x800000024031C310, qword_256FF7B98, &qword_256FF7B98[1]);
}

uint64_t sub_240301CE8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t result;

  result = sub_240316274();
  *a4 = 0xD00000000000003ALL;
  *a5 = 0x800000024031C220;
  return result;
}

uint64_t sub_240301D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7BA8);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7BA8);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AE0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "trialTaskID";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "trialDeploymentID";
  *((_QWORD *)v11 + 1) = 17;
  v11[16] = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_240301EA0()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_240316100();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 2 || result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      sub_24031613C();
    }
    v0 = 0;
  }
  return result;
}

uint64_t sub_240301F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_240301FC8(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  if (!v4)
  {
    sub_24030203C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_240301FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 20) + 8))
    return sub_2403161CC();
  return result;
}

uint64_t sub_24030203C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 24) + 8))
    return sub_2403161CC();
  return result;
}

uint64_t sub_2403020B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  result = sub_240316088();
  v5 = *(int *)(a1 + 24);
  v6 = (_QWORD *)(a2 + *(int *)(a1 + 20));
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t sub_2403020E8(uint64_t a1, uint64_t a2)
{
  return sub_240302108(a1, a2, &qword_256FF5230, qword_256FF7B98);
}

uint64_t sub_240302108(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_24030215C()
{
  return sub_240301EA0();
}

uint64_t sub_240302170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240301F4C(a1, a2, a3);
}

uint64_t sub_240302184()
{
  sub_24030CB9C(&qword_256FF5630, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319930);
  return sub_2403160E8();
}

uint64_t sub_2403021D4@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5238, (uint64_t)qword_256FF7BA8, a1);
}

uint64_t sub_2403021F0()
{
  sub_24030CB9C(&qword_256FF5580, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319968);
  return sub_240316184();
}

uint64_t sub_240302230()
{
  sub_24030CB9C(&qword_256FF5580, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319968);
  return sub_240316190();
}

uint64_t sub_240302284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7BC0);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7BC0);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318B00;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "trialIdentifiers";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "contextID";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "timestamp";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 101;
  *(_QWORD *)v15 = "performTaskStatus";
  *((_QWORD *)v15 + 1) = 17;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 102;
  *(_QWORD *)v17 = "performTrialTaskStatus";
  *((_QWORD *)v17 + 1) = 22;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 103;
  *(_QWORD *)v19 = "stop";
  *((_QWORD *)v19 + 1) = 4;
  v19[16] = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_2403024BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = v3;
  result = sub_240316100();
  v11 = v4;
  if (!v4)
  {
    while (1)
    {
      if ((v10 & 1) != 0)
        return result;
      if (result > 100)
      {
        switch(result)
        {
          case 'e':
            v12 = v11;
            sub_240302660();
LABEL_5:
            v11 = v12;
            break;
          case 'f':
            v12 = v11;
            sub_2403026F4();
            goto LABEL_5;
          case 'g':
            v12 = v11;
            sub_240302788();
            goto LABEL_5;
        }
      }
      else
      {
        switch(result)
        {
          case 1:
            v12 = v11;
            sub_2403066A0(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, &qword_256FF55C0, (uint64_t)&unk_240319C38);
            goto LABEL_5;
          case 2:
            type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
            v12 = v11;
            sub_24031613C();
            goto LABEL_5;
          case 3:
            type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
            v12 = v11;
            sub_240316130();
            goto LABEL_5;
        }
      }
      result = sub_240316100();
    }
  }
  return result;
}

uint64_t sub_240302660()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  return sub_240316154();
}

uint64_t sub_2403026F4()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  return sub_240316154();
}

uint64_t sub_240302788()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  return sub_240316154();
}

uint64_t sub_24030281C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_240302900(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  if (!v4)
  {
    sub_24030203C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
    sub_240306884(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
    sub_240302A7C(v3, a1, a2, a3);
    sub_240302BF0(v3, a1, a2, a3);
    sub_240302D64(v3, a1, a2, a3);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_240302900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[4];

  v15[3] = a4;
  v15[1] = a3;
  sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a5(0);
  sub_24030F334(a1 + *(int *)(v13 + 20), (uint64_t)v8, &qword_256FF5648);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_24030F3BC((uint64_t)v8, &qword_256FF5648);
  sub_24030D3A0((uint64_t)v8, (uint64_t)v12, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
  sub_2403161F0();
  return sub_240309448((uint64_t)v12, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_240302A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = a4;
  sub_240308D40(&qword_256FF5640);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_24030F334(a1 + *(int *)(v11 + 32), (uint64_t)v6, &qword_256FF5640);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_24030F3BC((uint64_t)v6, &qword_256FF5640);
  sub_24030D3A0((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  sub_2403161F0();
  return sub_240309448((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_240302BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = a4;
  sub_240308D40(&qword_256FF5640);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_24030F334(a1 + *(int *)(v11 + 36), (uint64_t)v6, &qword_256FF5640);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_24030F3BC((uint64_t)v6, &qword_256FF5640);
  sub_24030D3A0((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  sub_2403161F0();
  return sub_240309448((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_240302D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = a4;
  sub_240308D40(&qword_256FF5640);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_24030F334(a1 + *(int *)(v11 + 40), (uint64_t)v6, &qword_256FF5640);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_24030F3BC((uint64_t)v6, &qword_256FF5640);
  sub_24030D3A0((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  sub_2403161F0();
  return sub_240309448((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_240302ED8@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  sub_240316088();
  v4 = a2 + a1[5];
  v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a1[7];
  v7 = (_QWORD *)(a2 + a1[6]);
  *v7 = 0;
  v7[1] = 0;
  v8 = a2 + v6;
  *(_QWORD *)v8 = 0;
  *(_BYTE *)(v8 + 8) = 1;
  v9 = a2 + a1[8];
  v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  v12(v9, 1, 1, v10);
  v12(a2 + a1[9], 1, 1, v10);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v12)(a2 + a1[10], 1, 1, v10);
}

unint64_t sub_240302FC0()
{
  return 0xD00000000000003FLL;
}

uint64_t sub_240302FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2403024BC(a1, a2, a3);
}

uint64_t sub_240302FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030281C(a1, a2, a3);
}

uint64_t sub_240303004()
{
  sub_24030CB9C(&qword_256FF5638, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_2403197C8);
  return sub_2403160E8();
}

uint64_t sub_240303054@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5240, (uint64_t)qword_256FF7BC0, a1);
}

uint64_t sub_240303070()
{
  sub_24030CB9C(&qword_256FF5560, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319800);
  return sub_240316184();
}

uint64_t sub_2403030B0()
{
  sub_24030CB9C(&qword_256FF5560, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319800);
  return sub_240316190();
}

uint64_t sub_240303104()
{
  uint64_t result;

  result = sub_240316274();
  qword_256FF7BD8 = 0xD00000000000003FLL;
  unk_256FF7BE0 = 0x800000024031C330;
  return result;
}

uint64_t sub_240303174()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7BE8);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7BE8);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "succeeded";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "errorDomain";
  *((_QWORD *)v11 + 1) = 11;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "errorCode";
  *(_QWORD *)(v12 + 8) = 9;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_24030330C(uint64_t a1, uint64_t a2)
{
  return sub_240302108(a1, a2, &qword_256FF5248, &qword_256FF7BD8);
}

uint64_t sub_24030332C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240305F6C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_240303348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030605C(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_240303364()
{
  sub_24030CB9C(&qword_256FF5660, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319660);
  return sub_2403160E8();
}

uint64_t sub_2403033B4@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5250, (uint64_t)qword_256FF7BE8, a1);
}

uint64_t sub_2403033D0()
{
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  return sub_240316184();
}

uint64_t sub_240303410()
{
  sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
  return sub_240316190();
}

uint64_t sub_240303460(uint64_t a1, uint64_t a2)
{
  return sub_24030E43C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus) & 1;
}

uint64_t sub_240303480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C00);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C00);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318B10;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "trialIdentifiers";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "contextID";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "timestamp";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 101;
  *(_QWORD *)v15 = "activityScheduleStatus";
  *((_QWORD *)v15 + 1) = 22;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 102;
  *(_QWORD *)v17 = "taskFetched";
  *((_QWORD *)v17 + 1) = 11;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 103;
  *(_QWORD *)v19 = "taskScheduled";
  *((_QWORD *)v19 + 1) = 13;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 104;
  *(_QWORD *)v21 = "taskCompleted";
  *((_QWORD *)v21 + 1) = 13;
  v21[16] = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_2403036EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(0);
  v0 = swift_allocObject();
  v1 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  v2 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)(v0
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *v3 = 0;
  v3[1] = 0;
  v4 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(_QWORD *)v4 = 0;
  *(_BYTE *)(v4 + 8) = 1;
  v5 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v9(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled, 1, 1, v8);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v9)(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted, 1, 1, v8);
  qword_256FF5268 = v0;
  return result;
}

uint64_t sub_240303820(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = sub_240308D40(&qword_256FF5670);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_240308D40(&qword_256FF5678);
  MEMORY[0x24BDAC7A8](v6);
  v39 = (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  v12 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *v13 = 0;
  v13[1] = 0;
  v14 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(_QWORD *)v14 = 0;
  *(_BYTE *)(v14 + 8) = 1;
  v15 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  v36 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  v16 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  v37 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  v18 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v19 = *(void (**)(void))(*(_QWORD *)(v18 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19)(v17, 1, 1, v18);
  v38 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  v19();
  v40 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  v19();
  v20 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_24030F334(v20, (uint64_t)v10, &qword_256FF5648);
  swift_beginAccess();
  sub_24030F378((uint64_t)v10, v11, &qword_256FF5648);
  swift_endAccess();
  v21 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  v23 = *v21;
  v22 = v21[1];
  swift_beginAccess();
  *v13 = v23;
  v13[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
  swift_beginAccess();
  v25 = *v24;
  LOBYTE(v24) = *((_BYTE *)v24 + 8);
  swift_beginAccess();
  *(_QWORD *)v14 = v25;
  *(_BYTE *)(v14 + 8) = (_BYTE)v24;
  v26 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  v27 = v39;
  sub_24030F334(v26, v39, &qword_256FF5678);
  v28 = v36;
  swift_beginAccess();
  sub_24030F378(v27, v28, &qword_256FF5678);
  swift_endAccess();
  v29 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  sub_24030F334(v29, (uint64_t)v5, &qword_256FF5670);
  v30 = v37;
  swift_beginAccess();
  sub_24030F378((uint64_t)v5, v30, &qword_256FF5670);
  swift_endAccess();
  v31 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_24030F334(v31, (uint64_t)v5, &qword_256FF5670);
  v32 = v38;
  swift_beginAccess();
  sub_24030F378((uint64_t)v5, v32, &qword_256FF5670);
  swift_endAccess();
  v33 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_24030F334(v33, (uint64_t)v5, &qword_256FF5670);
  swift_release();
  v34 = v40;
  swift_beginAccess();
  sub_24030F378((uint64_t)v5, v34, &qword_256FF5670);
  swift_endAccess();
  return v1;
}

uint64_t sub_240303CD0()
{
  uint64_t v0;

  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers, &qword_256FF5648);
  swift_bridgeObjectRelease();
  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus, &qword_256FF5678);
  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched, &qword_256FF5670);
  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled, &qword_256FF5670);
  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted, &qword_256FF5670);
  return swift_deallocClassInstance();
}

uint64_t sub_240303D80()
{
  return type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(0);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF52F8);
}

void sub_240303D9C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_240303E98(319, &qword_256FF5308, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  if (v0 <= 0x3F)
  {
    sub_240303E98(319, &qword_256FF5310, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
    if (v1 <= 0x3F)
    {
      sub_240303E98(319, &qword_256FF5318, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5440);
}

void sub_240303E98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_240316280();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5420);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5410);
}

uint64_t sub_240303F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t (*v16)(uint64_t);
  unint64_t *v17;
  void *v18;

  result = sub_240316100();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result > 100)
      {
        switch(result)
        {
          case 'e':
            v11 = a2;
            v12 = a1;
            v13 = a3;
            v14 = a4;
            v15 = &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
            v16 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus;
            v17 = (unint64_t *)&unk_256FF5500;
            v18 = &unk_2403193C8;
            goto LABEL_6;
          case 'f':
            v11 = a2;
            v12 = a1;
            v13 = a3;
            v14 = a4;
            v15 = &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
            goto LABEL_5;
          case 'g':
            v11 = a2;
            v12 = a1;
            v13 = a3;
            v14 = a4;
            v15 = &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
            goto LABEL_5;
          case 'h':
            v11 = a2;
            v12 = a1;
            v13 = a3;
            v14 = a4;
            v15 = &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
LABEL_5:
            v16 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent;
            v17 = (unint64_t *)&unk_256FF54E0;
            v18 = &unk_240319260;
            goto LABEL_6;
          default:
            goto LABEL_7;
        }
      }
      switch(result)
      {
        case 1:
          v11 = a2;
          v12 = a1;
          v13 = a3;
          v14 = a4;
          v15 = &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
          v16 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers;
          v17 = &qword_256FF55C0;
          v18 = &unk_240319C38;
LABEL_6:
          sub_24030ABA8(v11, v12, v13, v14, (uint64_t)v15, v16, v17, (uint64_t)v18);
          break;
        case 2:
          sub_24030AE84();
          break;
        case 3:
          sub_24030AC6C(a2, a1, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp, (void (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BE5C100]);
          break;
      }
LABEL_7:
      result = sub_240316100();
    }
  }
  return result;
}

uint64_t sub_2403040F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  result = sub_2403041C8(a1, a2, a3, a4);
  if (!v4)
  {
    sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
    sub_240304354(a1);
    sub_2403043DC(a1, a2, a3, a4);
    sub_240304568(a1, a2, a3, a4);
    sub_2403046F4(a1, a2, a3, a4);
    return sub_240304880(a1, a2, a3, a4);
  }
  return result;
}

uint64_t sub_2403041C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5648);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5648);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_240304354(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  result = swift_beginAccess();
  if ((*(_BYTE *)(v1 + 8) & 1) == 0)
    return sub_2403161C0();
  return result;
}

uint64_t sub_2403043DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5678);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5678);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5678);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_24030CB9C(&qword_256FF5500, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_2403193C8);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_240304568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5670);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5670);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5670);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_2403046F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5670);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5670);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5670);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_240304880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5670);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5670);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5670);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

BOOL sub_240304A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v50;
  char v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v132 = a2;
  v123 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  v119 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  v113 = (uint64_t)&v110 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_240308D40(&qword_256FF5680);
  v4 = MEMORY[0x24BDAC7A8](v122);
  v111 = (uint64_t)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v114 = (uint64_t)&v110 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v120 = (uint64_t)&v110 - v8;
  v9 = sub_240308D40(&qword_256FF5670);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v110 = (uint64_t)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v117 = (char *)&v110 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v112 = (uint64_t)&v110 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v118 = (char *)&v110 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v115 = (uint64_t)&v110 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v129 = (uint64_t)&v110 - v20;
  v21 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  v125 = *(_QWORD *)(v21 - 8);
  v126 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v116 = (uint64_t)&v110 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_240308D40(&qword_256FF5688);
  MEMORY[0x24BDAC7A8](v124);
  v127 = (uint64_t)&v110 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_240308D40(&qword_256FF5678);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v121 = (uint64_t)&v110 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v130 = (uint64_t)&v110 - v27;
  v28 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v128 = (uint64_t)&v110 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_240308D40(&qword_256FF5658);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v110 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_240308D40(&qword_256FF5648);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v131 = (uint64_t)&v110 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v110 - v37;
  v39 = a1;
  v40 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_24030F334(v40, (uint64_t)v38, &qword_256FF5648);
  v41 = v132;
  v42 = v132
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  v43 = (uint64_t)&v33[*(int *)(v31 + 48)];
  sub_24030F334((uint64_t)v38, (uint64_t)v33, &qword_256FF5648);
  sub_24030F334(v42, v43, &qword_256FF5648);
  v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
  if (v44((uint64_t)v33, 1, v28) == 1)
  {
    swift_retain();
    swift_retain();
    sub_24030F3BC((uint64_t)v38, &qword_256FF5648);
    v45 = v41;
    if (v44(v43, 1, v28) == 1)
    {
      sub_24030F3BC((uint64_t)v33, &qword_256FF5648);
      goto LABEL_11;
    }
LABEL_6:
    v47 = &qword_256FF5658;
    v48 = (uint64_t)v33;
LABEL_7:
    sub_24030F3BC(v48, v47);
LABEL_8:
    swift_release();
    swift_release();
    return 0;
  }
  v45 = v41;
  v46 = v131;
  sub_24030F334((uint64_t)v33, v131, &qword_256FF5648);
  if (v44(v43, 1, v28) == 1)
  {
    swift_retain();
    swift_retain();
    sub_24030F3BC((uint64_t)v38, &qword_256FF5648);
    sub_240309448(v46, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  v50 = v128;
  sub_24030D3A0(v43, v128, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  swift_retain();
  swift_retain();
  v51 = sub_24030ECBC(v46, v50);
  sub_240309448(v50, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v38, &qword_256FF5648);
  sub_240309448(v46, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v33, &qword_256FF5648);
  if ((v51 & 1) == 0)
    goto LABEL_8;
LABEL_11:
  v52 = (uint64_t *)(v39
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  v53 = *v52;
  v54 = v52[1];
  v55 = (_QWORD *)(v45
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  v56 = v55[1];
  if (v54)
  {
    v57 = v129;
    v58 = v130;
    if (!v56 || (v53 != *v55 || v54 != v56) && (sub_2403162A4() & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    v57 = v129;
    v58 = v130;
    if (v56)
      goto LABEL_8;
  }
  v59 = v39
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  v60 = *(double *)v59;
  v61 = *(_BYTE *)(v59 + 8);
  v62 = v45
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  if ((v61 & 1) != 0)
  {
    if ((*(_BYTE *)(v62 + 8) & 1) == 0)
      goto LABEL_8;
  }
  else if ((*(_BYTE *)(v62 + 8) & 1) != 0 || v60 != *(double *)v62)
  {
    goto LABEL_8;
  }
  v63 = v39
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  sub_24030F334(v63, v58, &qword_256FF5678);
  v64 = v45
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  v65 = v127;
  v66 = v127 + *(int *)(v124 + 48);
  sub_24030F334(v58, v127, &qword_256FF5678);
  sub_24030F334(v64, v66, &qword_256FF5678);
  v67 = v126;
  v68 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v125 + 48);
  if (v68(v65, 1, v126) == 1)
  {
    sub_24030F3BC(v58, &qword_256FF5678);
    if (v68(v66, 1, v67) == 1)
    {
      sub_24030F3BC(v65, &qword_256FF5678);
      goto LABEL_30;
    }
LABEL_28:
    v47 = &qword_256FF5688;
LABEL_43:
    v48 = v65;
    goto LABEL_7;
  }
  v69 = v121;
  sub_24030F334(v65, v121, &qword_256FF5678);
  if (v68(v66, 1, v67) == 1)
  {
    sub_24030F3BC(v130, &qword_256FF5678);
    sub_240309448(v69, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
    goto LABEL_28;
  }
  v70 = v116;
  sub_24030D3A0(v66, v116, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  v71 = sub_24030E2EC(v69, v70);
  sub_240309448(v70, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_24030F3BC(v130, &qword_256FF5678);
  sub_240309448(v69, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_24030F3BC(v65, &qword_256FF5678);
  if ((v71 & 1) == 0)
    goto LABEL_8;
LABEL_30:
  v72 = v39
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  sub_24030F334(v72, v57, &qword_256FF5670);
  v73 = v45
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  v74 = v57;
  v75 = v120;
  v76 = v120 + *(int *)(v122 + 48);
  sub_24030F334(v74, v120, &qword_256FF5670);
  v77 = v73;
  v65 = v75;
  sub_24030F334(v77, v76, &qword_256FF5670);
  v78 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v119 + 48);
  v79 = v123;
  if (v78(v65, 1, v123) == 1)
  {
    sub_24030F3BC(v74, &qword_256FF5670);
    v80 = v78(v76, 1, v79);
    v81 = (uint64_t)v118;
    if (v80 != 1)
    {
LABEL_42:
      v47 = &qword_256FF5680;
      goto LABEL_43;
    }
    sub_24030F3BC(v65, &qword_256FF5670);
    v82 = (uint64_t)v117;
  }
  else
  {
    v83 = v115;
    sub_24030F334(v65, v115, &qword_256FF5670);
    v84 = v78(v76, 1, v79);
    v82 = (uint64_t)v117;
    v81 = (uint64_t)v118;
    if (v84 == 1)
    {
      v85 = v129;
LABEL_41:
      sub_24030F3BC(v85, &qword_256FF5670);
      sub_240309448(v83, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      goto LABEL_42;
    }
    v86 = v113;
    sub_24030D3A0(v76, v113, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    v87 = sub_24030E43C(v83, v86, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_240309448(v86, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_24030F3BC(v129, &qword_256FF5670);
    sub_240309448(v83, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_24030F3BC(v120, &qword_256FF5670);
    if ((v87 & 1) == 0)
      goto LABEL_8;
  }
  v88 = v39
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_24030F334(v88, v81, &qword_256FF5670);
  v89 = v45
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  v90 = v114;
  v91 = v114 + *(int *)(v122 + 48);
  sub_24030F334(v81, v114, &qword_256FF5670);
  v92 = v89;
  v65 = v90;
  sub_24030F334(v92, v91, &qword_256FF5670);
  v93 = v123;
  if (v78(v90, 1, v123) == 1)
  {
    sub_24030F3BC(v81, &qword_256FF5670);
    if (v78(v91, 1, v93) == 1)
    {
      sub_24030F3BC(v90, &qword_256FF5670);
      goto LABEL_45;
    }
    goto LABEL_42;
  }
  v94 = v90;
  v83 = v112;
  sub_24030F334(v94, v112, &qword_256FF5670);
  if (v78(v91, 1, v93) == 1)
  {
    v85 = v81;
    goto LABEL_41;
  }
  v95 = v91;
  v96 = v81;
  v97 = v83;
  v98 = v113;
  sub_24030D3A0(v95, v113, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  v99 = sub_24030E43C(v83, v98, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_240309448(v98, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_24030F3BC(v96, &qword_256FF5670);
  sub_240309448(v97, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_24030F3BC(v114, &qword_256FF5670);
  if ((v99 & 1) == 0)
    goto LABEL_8;
LABEL_45:
  v100 = v39
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_24030F334(v100, v82, &qword_256FF5670);
  v101 = v45
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  v102 = v111;
  v103 = v111 + *(int *)(v122 + 48);
  sub_24030F334(v82, v111, &qword_256FF5670);
  v104 = v102;
  sub_24030F334(v101, v103, &qword_256FF5670);
  v105 = v123;
  if (v78(v102, 1, v123) != 1)
  {
    v106 = v102;
    v107 = v110;
    sub_24030F334(v106, v110, &qword_256FF5670);
    if (v78(v103, 1, v105) == 1)
    {
      swift_release();
      swift_release();
      sub_24030F3BC(v82, &qword_256FF5670);
      sub_240309448(v107, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      goto LABEL_50;
    }
    v108 = v113;
    sub_24030D3A0(v103, v113, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    v109 = sub_24030E43C(v107, v108, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    swift_release();
    swift_release();
    sub_240309448(v108, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_24030F3BC(v82, &qword_256FF5670);
    sub_240309448(v107, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_24030F3BC(v104, &qword_256FF5670);
    return (v109 & 1) != 0;
  }
  swift_release();
  swift_release();
  sub_24030F3BC(v82, &qword_256FF5670);
  if (v78(v103, 1, v105) != 1)
  {
LABEL_50:
    sub_24030F3BC(v104, &qword_256FF5680);
    return 0;
  }
  sub_24030F3BC(v102, &qword_256FF5670);
  return 1;
}

uint64_t sub_240305764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24030C680(a1, &qword_256FF5260, &qword_256FF5268, a2);
}

unint64_t sub_240305780()
{
  return 0xD000000000000039;
}

uint64_t sub_24030579C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030A608(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass, sub_240303820, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_240303F0C);
}

uint64_t sub_2403057D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030AF04(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2403040F8);
}

uint64_t sub_2403057F4()
{
  sub_24030CB9C(&qword_256FF5668, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_2403194F8);
  return sub_2403160E8();
}

uint64_t sub_240305844@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5258, (uint64_t)qword_256FF7C00, a1);
}

uint64_t sub_240305860()
{
  sub_24030CB9C(&qword_256FF5520, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_240319530);
  return sub_240316184();
}

uint64_t sub_2403058A0()
{
  sub_24030CB9C(&qword_256FF5520, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_240319530);
  return sub_240316190();
}

uint64_t sub_2403058F0(uint64_t a1, uint64_t a2)
{
  return sub_24030E17C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t (*)(uint64_t, uint64_t))sub_240304A0C) & 1;
}

uint64_t sub_240305918()
{
  uint64_t result;

  result = sub_240316274();
  qword_256FF7C18 = 0xD000000000000039;
  unk_256FF7C20 = 0x800000024031C3F0;
  return result;
}

uint64_t sub_24030598C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C28);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C28);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_240318B20;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "scheduled";
  *(_QWORD *)(v5 + 8) = 9;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = sub_2403161FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_240316208();
}

uint64_t sub_240305A90()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_240316100();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
      sub_24031610C();
    }
    v0 = 0;
  }
  return result;
}

uint64_t sub_240305B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_240305B80(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  if (!v4)
    return sub_24031607C();
  return result;
}

uint64_t sub_240305B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 20)) != 2)
    return sub_24031619C();
  return result;
}

uint64_t sub_240305BF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_240316088();
  *(_BYTE *)(a2 + *(int *)(a1 + 20)) = 2;
  return result;
}

uint64_t sub_240305C24(uint64_t a1, uint64_t a2)
{
  return sub_240302108(a1, a2, &qword_256FF5270, &qword_256FF7C18);
}

uint64_t sub_240305C44()
{
  return sub_240305A90();
}

uint64_t sub_240305C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240305B24(a1, a2, a3);
}

uint64_t sub_240305C6C()
{
  sub_24030CB9C(&qword_256FF5690, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_240319390);
  return sub_2403160E8();
}

uint64_t sub_240305CBC@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5278, (uint64_t)qword_256FF7C28, a1);
}

uint64_t sub_240305CD8()
{
  sub_24030CB9C(&qword_256FF5500, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_2403193C8);
  return sub_240316184();
}

uint64_t sub_240305D18()
{
  sub_24030CB9C(&qword_256FF5500, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_2403193C8);
  return sub_240316190();
}

uint64_t sub_240305D6C()
{
  uint64_t result;

  result = sub_240316274();
  qword_256FF7C40 = 0xD000000000000039;
  *(_QWORD *)algn_256FF7C48 = 0x800000024031C3F0;
  return result;
}

uint64_t sub_240305DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C50);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C50);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "succeeded";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "errorDomain";
  *((_QWORD *)v11 + 1) = 11;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "errorCode";
  *(_QWORD *)(v12 + 8) = 9;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_240305F6C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  char v8;

  while (1)
  {
    result = sub_240316100();
    v6 = v4;
    if (v4 || (v8 & 1) != 0)
      return result;
    switch(result)
    {
      case 3:
        a4(0);
        sub_240316124();
LABEL_3:
        v6 = 0;
        break;
      case 2:
        a4(0);
        sub_24031613C();
        goto LABEL_3;
      case 1:
        a4(0);
        sub_24031610C();
        goto LABEL_3;
    }
    v4 = v6;
  }
}

uint64_t sub_24030605C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  result = sub_240305B80(v4, a1, a2, a3, a4);
  if (!v5)
  {
    sub_24030203C(v4, a1, a2, a3, a4);
    sub_2403060F0(v4, a1, a2, a3, a4);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_2403060F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 28) + 4) & 1) == 0)
    return sub_2403161B4();
  return result;
}

uint64_t sub_240306164@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  result = sub_240316088();
  v5 = a1[6];
  *(_BYTE *)(a2 + a1[5]) = 2;
  v6 = (_QWORD *)(a2 + v5);
  *v6 = 0;
  v6[1] = 0;
  v7 = a2 + a1[7];
  *(_DWORD *)v7 = 0;
  *(_BYTE *)(v7 + 4) = 1;
  return result;
}

uint64_t sub_2403061B0(uint64_t a1, uint64_t a2)
{
  return sub_240302108(a1, a2, &qword_256FF5280, &qword_256FF7C40);
}

uint64_t sub_2403061D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240305F6C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_2403061EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030605C(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_240306208()
{
  sub_24030CB9C(&qword_256FF5698, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319228);
  return sub_2403160E8();
}

uint64_t sub_240306258@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5288, (uint64_t)qword_256FF7C50, a1);
}

uint64_t sub_240306274()
{
  sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
  return sub_240316184();
}

uint64_t sub_2403062B4()
{
  sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
  return sub_240316190();
}

uint64_t sub_240306304(uint64_t a1, uint64_t a2)
{
  return sub_24030E43C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent) & 1;
}

uint64_t sub_240306324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C68);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C68);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318B30;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "trialIdentifiers";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "contextID";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "timestamp";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "eventType";
  *((_QWORD *)v15 + 1) = 9;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "eventSucceeded";
  *(_QWORD *)(v16 + 8) = 14;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_240306528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = v3;
  result = sub_240316100();
  v11 = v4;
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          v12 = v11;
          sub_2403066A0(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, &qword_256FF55C0, (uint64_t)&unk_240319C38);
          goto LABEL_5;
        case 2:
          type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
          v12 = v11;
          sub_24031613C();
          goto LABEL_5;
        case 3:
          type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
          v12 = v11;
          sub_240316130();
          goto LABEL_5;
        case 4:
          v12 = v11;
          sub_240306744();
          goto LABEL_5;
        case 5:
          type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
          v12 = v11;
          sub_24031610C();
LABEL_5:
          v11 = v12;
          break;
        default:
          break;
      }
      result = sub_240316100();
    }
  }
  return result;
}

uint64_t sub_2403066A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  a5(0);
  a6(0);
  sub_24030CB9C(a7, a6, a8);
  return sub_240316154();
}

uint64_t sub_240306744()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  sub_24030F3F8();
  return sub_240316118();
}

uint64_t sub_2403067B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_240302900(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  if (!v4)
  {
    sub_24030203C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
    sub_240306884(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
    sub_2403068F8(v3);
    sub_240306980(v3);
    return sub_24031607C();
  }
  return result;
}

uint64_t sub_240306884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t result;

  result = a5(0);
  if ((*(_BYTE *)(a1 + *(int *)(result + 28) + 8) & 1) == 0)
    return sub_2403161C0();
  return result;
}

uint64_t sub_2403068F8(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 32)) != 4)
  {
    sub_24030F3F8();
    return sub_2403161A8();
  }
  return result;
}

uint64_t sub_240306980(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 36)) != 2)
    return sub_24031619C();
  return result;
}

uint64_t sub_2403069F4@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  sub_240316088();
  v4 = a2 + a1[5];
  v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7 = a1[7];
  v8 = (_QWORD *)(a2 + a1[6]);
  *v8 = 0;
  v8[1] = 0;
  v9 = a2 + v7;
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  v10 = a1[9];
  *(_BYTE *)(a2 + a1[8]) = 4;
  *(_BYTE *)(a2 + v10) = 2;
  return result;
}

unint64_t sub_240306A7C()
{
  return 0xD000000000000035;
}

uint64_t sub_240306A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240306528(a1, a2, a3);
}

uint64_t sub_240306AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2403067B8(a1, a2, a3);
}

uint64_t sub_240306AC0()
{
  sub_24030CB9C(&qword_256FF56A0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_2403190C0);
  return sub_2403160E8();
}

uint64_t sub_240306B10@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5290, (uint64_t)qword_256FF7C68, a1);
}

uint64_t sub_240306B2C()
{
  sub_24030CB9C(&qword_256FF54C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_2403190F8);
  return sub_240316184();
}

uint64_t sub_240306B6C()
{
  sub_24030CB9C(&qword_256FF54C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_2403190F8);
  return sub_240316190();
}

uint64_t sub_240306BC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C80);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C80);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318B40;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "Unknown";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "allocation";
  *(_QWORD *)(v11 + 8) = 10;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "activation";
  *((_QWORD *)v13 + 1) = 10;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "deactivation";
  *((_QWORD *)v15 + 1) = 12;
  v15[16] = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_240306D80@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF5298, (uint64_t)qword_256FF7C80, a1);
}

uint64_t sub_240306D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  _QWORD *v41;
  char *v42;
  _QWORD *v43;
  char *v44;
  _QWORD *v45;
  char *v46;
  _QWORD *v47;
  char *v48;
  _QWORD *v49;
  char *v50;
  _QWORD *v51;
  char *v52;
  _QWORD *v53;
  char *v54;
  uint64_t v56;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7C98);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7C98);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_240318B50;
  v5 = v56 + v4;
  v6 = v56 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v56 + v4) = 1;
  *(_QWORD *)v6 = "telemetryID";
  *(_QWORD *)(v6 + 8) = 11;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_2403161FC();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 2;
  *(_QWORD *)v10 = "trialIdentifiers";
  *(_QWORD *)(v10 + 8) = 16;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 3;
  *(_QWORD *)v12 = "contextID";
  *((_QWORD *)v12 + 1) = 9;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 4;
  *(_QWORD *)v14 = "timestamp";
  *((_QWORD *)v14 + 1) = 9;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 101;
  *(_QWORD *)v16 = "isAllocated";
  *((_QWORD *)v16 + 1) = 11;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 102;
  *(_QWORD *)v18 = "isActivated";
  *((_QWORD *)v18 + 1) = 11;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 201;
  *(_QWORD *)v20 = "countGeneralTargetting";
  *((_QWORD *)v20 + 1) = 22;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 202;
  *(_QWORD *)v22 = "countGeneralTargettingMet";
  *((_QWORD *)v22 + 1) = 25;
  v22[16] = 2;
  v9();
  v23 = v5 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 8 * v3) = 203;
  *(_QWORD *)v23 = "countCustomTargetting";
  *(_QWORD *)(v23 + 8) = 21;
  *(_BYTE *)(v23 + 16) = 2;
  v9();
  v24 = (_QWORD *)(v5 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 204;
  *(_QWORD *)v25 = "countCustomTargettingMet";
  *((_QWORD *)v25 + 1) = 24;
  v25[16] = 2;
  v9();
  v26 = (_QWORD *)(v5 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 301;
  *(_QWORD *)v27 = "countTaskFetchedSucceeded";
  *((_QWORD *)v27 + 1) = 25;
  v27[16] = 2;
  v9();
  v28 = (_QWORD *)(v5 + 11 * v3);
  v29 = (char *)v28 + *(int *)(v1 + 48);
  *v28 = 302;
  *(_QWORD *)v29 = "countTaskFetchedFailed";
  *((_QWORD *)v29 + 1) = 22;
  v29[16] = 2;
  v9();
  v30 = (_QWORD *)(v5 + 12 * v3);
  v31 = (char *)v30 + *(int *)(v1 + 48);
  *v30 = 303;
  *(_QWORD *)v31 = "countTaskScheduledSucceeded";
  *((_QWORD *)v31 + 1) = 27;
  v31[16] = 2;
  v9();
  v32 = (_QWORD *)(v5 + 13 * v3);
  v33 = (char *)v32 + *(int *)(v1 + 48);
  *v32 = 304;
  *(_QWORD *)v33 = "countTaskScheduledFailed";
  *((_QWORD *)v33 + 1) = 24;
  v33[16] = 2;
  v9();
  v34 = (_QWORD *)(v5 + 14 * v3);
  v35 = (char *)v34 + *(int *)(v1 + 48);
  *v34 = 305;
  *(_QWORD *)v35 = "countTaskCompletedSucceeded";
  *((_QWORD *)v35 + 1) = 27;
  v35[16] = 2;
  v9();
  v36 = (_QWORD *)(v5 + 15 * v3);
  v37 = (char *)v36 + *(int *)(v1 + 48);
  *v36 = 306;
  *(_QWORD *)v37 = "countTaskCompletedFailed";
  *((_QWORD *)v37 + 1) = 24;
  v37[16] = 2;
  v9();
  v38 = v5 + 16 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 16 * v3) = 401;
  *(_QWORD *)v38 = "countPerformTaskSucceeded";
  *(_QWORD *)(v38 + 8) = 25;
  *(_BYTE *)(v38 + 16) = 2;
  v9();
  v39 = (_QWORD *)(v5 + 17 * v3);
  v40 = (char *)v39 + *(int *)(v1 + 48);
  *v39 = 402;
  *(_QWORD *)v40 = "countPerformTaskFailed";
  *((_QWORD *)v40 + 1) = 22;
  v40[16] = 2;
  v9();
  v41 = (_QWORD *)(v5 + 18 * v3);
  v42 = (char *)v41 + *(int *)(v1 + 48);
  *v41 = 403;
  *(_QWORD *)v42 = "countStopSucceeded";
  *((_QWORD *)v42 + 1) = 18;
  v42[16] = 2;
  v9();
  v43 = (_QWORD *)(v5 + 19 * v3);
  v44 = (char *)v43 + *(int *)(v1 + 48);
  *v43 = 404;
  *(_QWORD *)v44 = "countStopFailed";
  *((_QWORD *)v44 + 1) = 15;
  v44[16] = 2;
  v9();
  v45 = (_QWORD *)(v5 + 20 * v3);
  v46 = (char *)v45 + *(int *)(v1 + 48);
  *v45 = 501;
  *(_QWORD *)v46 = "trialIdentifierType";
  *((_QWORD *)v46 + 1) = 19;
  v46[16] = 2;
  v9();
  v47 = (_QWORD *)(v5 + 21 * v3);
  v48 = (char *)v47 + *(int *)(v1 + 48);
  *v47 = 502;
  *(_QWORD *)v48 = "trialExperimentID";
  *((_QWORD *)v48 + 1) = 17;
  v48[16] = 2;
  v9();
  v49 = (_QWORD *)(v5 + 22 * v3);
  v50 = (char *)v49 + *(int *)(v1 + 48);
  *v49 = 503;
  *(_QWORD *)v50 = "trialDeploymentID";
  *((_QWORD *)v50 + 1) = 17;
  v50[16] = 2;
  v9();
  v51 = (_QWORD *)(v5 + 23 * v3);
  v52 = (char *)v51 + *(int *)(v1 + 48);
  *v51 = 504;
  *(_QWORD *)v52 = "trialTreatmentID";
  *((_QWORD *)v52 + 1) = 16;
  v52[16] = 2;
  v9();
  v53 = (_QWORD *)(v5 + 24 * v3);
  v54 = (char *)v53 + *(int *)(v1 + 48);
  *v53 = 505;
  *(_QWORD *)v54 = "trialTaskID";
  *((_QWORD *)v54 + 1) = 11;
  v54[16] = 2;
  v9();
  return sub_240316208();
}

uint64_t sub_2403073D0()
{
  uint64_t result;

  type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(0);
  swift_allocObject();
  result = sub_24030740C();
  qword_256FF52B0 = result;
  return result;
}

uint64_t sub_24030740C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  v1 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  v2 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)(v0
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *v3 = 0;
  v3[1] = 0;
  v4 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(_QWORD *)v4 = 0;
  *(_BYTE *)(v4 + 8) = 1;
  *(_BYTE *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated) = 2;
  *(_BYTE *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated) = 2;
  v5 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  *(_DWORD *)v5 = 0;
  *(_BYTE *)(v5 + 4) = 1;
  v6 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  *(_DWORD *)v6 = 0;
  *(_BYTE *)(v6 + 4) = 1;
  v7 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  *(_DWORD *)v7 = 0;
  *(_BYTE *)(v7 + 4) = 1;
  v8 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  *(_DWORD *)v8 = 0;
  *(_BYTE *)(v8 + 4) = 1;
  v9 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  *(_DWORD *)v9 = 0;
  *(_BYTE *)(v9 + 4) = 1;
  v10 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  *(_DWORD *)v10 = 0;
  *(_BYTE *)(v10 + 4) = 1;
  v11 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  *(_DWORD *)v11 = 0;
  *(_BYTE *)(v11 + 4) = 1;
  v12 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  *(_DWORD *)v12 = 0;
  *(_BYTE *)(v12 + 4) = 1;
  v13 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  *(_DWORD *)v13 = 0;
  *(_BYTE *)(v13 + 4) = 1;
  v14 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  *(_DWORD *)v14 = 0;
  *(_BYTE *)(v14 + 4) = 1;
  v15 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  *(_DWORD *)v15 = 0;
  *(_BYTE *)(v15 + 4) = 1;
  v16 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  *(_DWORD *)v16 = 0;
  *(_BYTE *)(v16 + 4) = 1;
  v17 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  *(_DWORD *)v17 = 0;
  *(_BYTE *)(v17 + 4) = 1;
  v18 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  *(_DWORD *)v18 = 0;
  *(_BYTE *)(v18 + 4) = 1;
  *(_BYTE *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType) = 3;
  v19 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  *v21 = 0;
  v21[1] = 0;
  v22 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  *v22 = 0;
  v22[1] = 0;
  return v0;
}

uint64_t sub_240307610(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  _BYTE *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _BYTE *v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;

  v3 = sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8](v3);
  v90 = (uint64_t)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  v5 = v1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  v89 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *v7 = 0;
  v7[1] = 0;
  v8 = v1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(_QWORD *)v8 = 0;
  *(_BYTE *)(v8 + 8) = 1;
  v91 = (_BYTE *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
  *(_BYTE *)(v1
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated) = 2;
  v9 = (_BYTE *)(v1
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
  *v9 = 2;
  v10 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  *(_DWORD *)v10 = 0;
  *(_BYTE *)(v10 + 4) = 1;
  v11 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  v92 = v9;
  v93 = v11;
  *(_DWORD *)v11 = 0;
  *(_BYTE *)(v11 + 4) = 1;
  v12 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  v94 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  *(_DWORD *)v12 = 0;
  *(_BYTE *)(v12 + 4) = 1;
  v13 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  v95 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  *(_DWORD *)v13 = 0;
  *(_BYTE *)(v13 + 4) = 1;
  v14 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  v96 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  *(_DWORD *)v14 = 0;
  *(_BYTE *)(v14 + 4) = 1;
  v15 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  v97 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  *(_DWORD *)v15 = 0;
  *(_BYTE *)(v15 + 4) = 1;
  v16 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  v98 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  *(_DWORD *)v16 = 0;
  *(_BYTE *)(v16 + 4) = 1;
  v17 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  v99 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  *(_DWORD *)v17 = 0;
  *(_BYTE *)(v17 + 4) = 1;
  v18 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  v100 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  *(_DWORD *)v18 = 0;
  *(_BYTE *)(v18 + 4) = 1;
  v19 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  v101 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  *(_DWORD *)v19 = 0;
  *(_BYTE *)(v19 + 4) = 1;
  v20 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  v102 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  *(_DWORD *)v20 = 0;
  *(_BYTE *)(v20 + 4) = 1;
  v21 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  v103 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  *(_DWORD *)v21 = 0;
  *(_BYTE *)(v21 + 4) = 1;
  v22 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  v104 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  *(_DWORD *)v22 = 0;
  *(_BYTE *)(v22 + 4) = 1;
  v23 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  v105 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  *(_BYTE *)(v23 + 4) = 1;
  *(_DWORD *)v23 = 0;
  v24 = (_BYTE *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  *v24 = 3;
  v25 = (_QWORD *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  v106 = v24;
  v107 = v25;
  *v25 = 0;
  v25[1] = 0;
  v26 = (_QWORD *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  v108 = (_QWORD *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  *v26 = 0;
  v26[1] = 0;
  v27 = (_QWORD *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  v109 = (_QWORD *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  *v27 = 0;
  v27[1] = 0;
  v28 = (_QWORD *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  v110 = (_QWORD *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  *v28 = 0;
  v28[1] = 0;
  swift_beginAccess();
  v29 = *(_QWORD *)(a1 + 16);
  v30 = *(_QWORD *)(a1 + 24);
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v29;
  *(_QWORD *)(v1 + 24) = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v31 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  v32 = v90;
  sub_24030F334(v31, v90, &qword_256FF5648);
  v33 = v89;
  swift_beginAccess();
  sub_24030F378(v32, v33, &qword_256FF5648);
  swift_endAccess();
  v34 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  v36 = *v34;
  v35 = v34[1];
  swift_beginAccess();
  *v7 = v36;
  v7[1] = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
  swift_beginAccess();
  v38 = *v37;
  LOBYTE(v37) = *((_BYTE *)v37 + 8);
  swift_beginAccess();
  *(_QWORD *)v8 = v38;
  *(_BYTE *)(v8 + 8) = (_BYTE)v37;
  v39 = (_BYTE *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
  swift_beginAccess();
  LOBYTE(v39) = *v39;
  v40 = v91;
  swift_beginAccess();
  *v40 = (_BYTE)v39;
  v41 = (_BYTE *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
  swift_beginAccess();
  LOBYTE(v41) = *v41;
  v42 = v92;
  swift_beginAccess();
  *v42 = (_BYTE)v41;
  v43 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v43;
  LOBYTE(v43) = *(_BYTE *)(v43 + 4);
  swift_beginAccess();
  *(_DWORD *)v10 = (_DWORD)v42;
  *(_BYTE *)(v10 + 4) = v43;
  v44 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v44;
  LOBYTE(v44) = *(_BYTE *)(v44 + 4);
  v45 = v93;
  swift_beginAccess();
  *(_DWORD *)v45 = (_DWORD)v42;
  *(_BYTE *)(v45 + 4) = v44;
  v46 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v46;
  LOBYTE(v46) = *(_BYTE *)(v46 + 4);
  v47 = v94;
  swift_beginAccess();
  *(_DWORD *)v47 = (_DWORD)v42;
  *(_BYTE *)(v47 + 4) = v46;
  v48 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v48;
  LOBYTE(v48) = *(_BYTE *)(v48 + 4);
  v49 = v95;
  swift_beginAccess();
  *(_DWORD *)v49 = (_DWORD)v42;
  *(_BYTE *)(v49 + 4) = v48;
  v50 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v50;
  LOBYTE(v50) = *(_BYTE *)(v50 + 4);
  v51 = v96;
  swift_beginAccess();
  *(_DWORD *)v51 = (_DWORD)v42;
  *(_BYTE *)(v51 + 4) = v50;
  v52 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v52;
  LOBYTE(v52) = *(_BYTE *)(v52 + 4);
  v53 = v97;
  swift_beginAccess();
  *(_DWORD *)v53 = (_DWORD)v42;
  *(_BYTE *)(v53 + 4) = v52;
  v54 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v54;
  LOBYTE(v54) = *(_BYTE *)(v54 + 4);
  v55 = v98;
  swift_beginAccess();
  *(_DWORD *)v55 = (_DWORD)v42;
  *(_BYTE *)(v55 + 4) = v54;
  v56 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v56;
  LOBYTE(v56) = *(_BYTE *)(v56 + 4);
  v57 = v99;
  swift_beginAccess();
  *(_DWORD *)v57 = (_DWORD)v42;
  *(_BYTE *)(v57 + 4) = v56;
  v58 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v58;
  LOBYTE(v58) = *(_BYTE *)(v58 + 4);
  v59 = v100;
  swift_beginAccess();
  *(_DWORD *)v59 = (_DWORD)v42;
  *(_BYTE *)(v59 + 4) = v58;
  v60 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v60;
  LOBYTE(v60) = *(_BYTE *)(v60 + 4);
  v61 = v101;
  swift_beginAccess();
  *(_DWORD *)v61 = (_DWORD)v42;
  *(_BYTE *)(v61 + 4) = v60;
  v62 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v62;
  LOBYTE(v62) = *(_BYTE *)(v62 + 4);
  v63 = v102;
  swift_beginAccess();
  *(_DWORD *)v63 = (_DWORD)v42;
  *(_BYTE *)(v63 + 4) = v62;
  v64 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v64;
  LOBYTE(v64) = *(_BYTE *)(v64 + 4);
  v65 = v103;
  swift_beginAccess();
  *(_DWORD *)v65 = (_DWORD)v42;
  *(_BYTE *)(v65 + 4) = v64;
  v66 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v66;
  LOBYTE(v66) = *(_BYTE *)(v66 + 4);
  v67 = v104;
  swift_beginAccess();
  *(_DWORD *)v67 = (_DWORD)v42;
  *(_BYTE *)(v67 + 4) = v66;
  v68 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v68;
  LOBYTE(v68) = *(_BYTE *)(v68 + 4);
  v69 = v105;
  swift_beginAccess();
  *(_DWORD *)v69 = (_DWORD)v42;
  *(_BYTE *)(v69 + 4) = v68;
  v70 = (_BYTE *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  swift_beginAccess();
  LOBYTE(v70) = *v70;
  v71 = v106;
  swift_beginAccess();
  *v71 = (_BYTE)v70;
  v72 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  swift_beginAccess();
  v74 = *v72;
  v73 = v72[1];
  v75 = v107;
  swift_beginAccess();
  *v75 = v74;
  v75[1] = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v76 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  swift_beginAccess();
  v78 = *v76;
  v77 = v76[1];
  v79 = v108;
  swift_beginAccess();
  *v79 = v78;
  v79[1] = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v80 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  swift_beginAccess();
  v82 = *v80;
  v81 = v80[1];
  v83 = v109;
  swift_beginAccess();
  *v83 = v82;
  v83[1] = v81;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v84 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  swift_beginAccess();
  v86 = *v84;
  v85 = v84[1];
  swift_bridgeObjectRetain();
  swift_release();
  v87 = v110;
  swift_beginAccess();
  *v87 = v86;
  v87[1] = v85;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_240308020()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_24030F3BC(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers, &qword_256FF5648);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2403080C4()
{
  return type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(0);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF53E0);
}

void sub_2403080E0()
{
  unint64_t v0;

  sub_240303E98(319, &qword_256FF5308, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_2403081C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2403081D8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for LighthouseBitacoraProto_BitacoraState(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF53F0);
}

uint64_t sub_2403081FC()
{
  return sub_240308AA4();
}

_BYTE *initializeBufferWithCopyOfBuffer for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2403082F8 + 4 * byte_240318B6E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24030832C + 4 * byte_240318B69[v4]))();
}

uint64_t sub_24030832C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240308334(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24030833CLL);
  return result;
}

uint64_t sub_240308348(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240308350);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240308354(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24030835C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType()
{
  return &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType;
}

uint64_t *sub_240308378(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_240316094();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_240308400(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_240308444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_2403084A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_240308510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24030856C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_2403085D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2403085E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_24030865C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24030866C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_240316094();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5400);
}

uint64_t sub_240308710()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240308720()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240308730()
{
  return sub_24031205C();
}

_QWORD *sub_240308744(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_2403087CC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240316094();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_240308800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24030885C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2403088B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_240308914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_240308970()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24030897C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  int v10;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    v10 = ((v9 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v10 = -2;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_240308A14()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240308A20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_240316094();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  return result;
}

uint64_t sub_240308A98()
{
  return sub_240308AA4();
}

uint64_t sub_240308AA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240316094();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_240308B10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, int *);
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, _QWORD, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v13 = *((_QWORD *)v12 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      v14 = sub_240308D40(&qword_256FF5430);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      v16 = v12[5];
      v17 = &v10[v16];
      v18 = &v11[v16];
      v19 = *((_QWORD *)v18 + 1);
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *((_QWORD *)v17 + 1) = v19;
      v20 = v12[6];
      v21 = &v10[v20];
      v22 = &v11[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = v12[7];
      v25 = &v10[v24];
      v26 = &v11[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = *(void (**)(char *, _QWORD, uint64_t, int *))(v13 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v10, 0, 1, v12);
    }
    v29 = *(int *)(a3 + 24);
    v30 = (char *)a1 + v29;
    v31 = (char *)a2 + v29;
    v32 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      v34 = sub_240308D40(&qword_256FF5438);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v30, (uint64_t *)v31, v7);
      v35 = *(int *)(v32 + 20);
      v36 = &v30[v35];
      v37 = &v31[v35];
      v38 = *((_QWORD *)v37 + 1);
      *(_QWORD *)v36 = *(_QWORD *)v37;
      *((_QWORD *)v36 + 1) = v38;
      v39 = *(int *)(v32 + 24);
      v40 = &v30[v39];
      v41 = &v31[v39];
      v42 = *((_QWORD *)v41 + 1);
      *(_QWORD *)v40 = *(_QWORD *)v41;
      *((_QWORD *)v40 + 1) = v42;
      v43 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v43(v30, 0, 1, v32);
    }
  }
  return a1;
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5470);
}

uint64_t sub_240308D40(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242682A2C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF5460);
}

uint64_t sub_240308D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v4 = sub_240316094();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v8 = a1 + *(int *)(a2 + 24);
  v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9);
  if (!(_DWORD)result)
  {
    v5(v8, v4);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_240308EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t, int *);
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, _QWORD, uint64_t, uint64_t);

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5430);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = v11[5];
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = v11[6];
    v19 = &v9[v18];
    v20 = &v10[v18];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = v11[7];
    v23 = &v9[v22];
    v24 = &v10[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = *(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v9, 0, 1, v11);
  }
  v27 = *(int *)(a3 + 24);
  v28 = (char *)(a1 + v27);
  v29 = (char *)(a2 + v27);
  v30 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    v32 = sub_240308D40(&qword_256FF5438);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v28, (uint64_t)v29, v6);
    v33 = *(int *)(v30 + 20);
    v34 = &v28[v33];
    v35 = &v29[v33];
    v36 = *((_QWORD *)v35 + 1);
    *(_QWORD *)v34 = *(_QWORD *)v35;
    *((_QWORD *)v34 + 1) = v36;
    v37 = *(int *)(v30 + 24);
    v38 = &v28[v37];
    v39 = &v29[v37];
    v40 = *((_QWORD *)v39 + 1);
    *(_QWORD *)v38 = *(_QWORD *)v39;
    *((_QWORD *)v38 + 1) = v40;
    v41 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(v28, 0, 1, v30);
  }
  return a1;
}

uint64_t sub_2403090AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void (*v24)(char *, _QWORD, uint64_t, int *);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  void (*v40)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;

  v6 = sub_240316094();
  v59 = *(_QWORD *)(v6 - 8);
  v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 24);
  v58(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v8, v9, v6);
      v15 = v10[5];
      v16 = &v8[v15];
      v17 = &v9[v15];
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
      v18 = v10[6];
      v19 = &v8[v18];
      v20 = &v9[v18];
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
      v21 = v10[7];
      v22 = &v8[v21];
      v23 = &v9[v21];
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
      v24 = *(void (**)(char *, _QWORD, uint64_t, int *))(v11 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_240309448((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    v25 = sub_240308D40(&qword_256FF5430);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  v58((uint64_t)v8, (uint64_t)v9, v6);
  v43 = v10[5];
  v44 = &v8[v43];
  v45 = &v9[v43];
  *(_QWORD *)v44 = *(_QWORD *)v45;
  *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = v10[6];
  v47 = &v8[v46];
  v48 = &v9[v46];
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *((_QWORD *)v47 + 1) = *((_QWORD *)v48 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49 = v10[7];
  v50 = &v8[v49];
  v51 = &v9[v49];
  *(_QWORD *)v50 = *(_QWORD *)v51;
  *((_QWORD *)v50 + 1) = *((_QWORD *)v51 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  v26 = *(int *)(a3 + 24);
  v27 = (char *)(a1 + v26);
  v28 = (char *)(a2 + v26);
  v29 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  v32 = v31(v27, 1, v29);
  v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      v58((uint64_t)v27, (uint64_t)v28, v6);
      v52 = *(int *)(v29 + 20);
      v53 = &v27[v52];
      v54 = &v28[v52];
      *(_QWORD *)v53 = *(_QWORD *)v54;
      *((_QWORD *)v53 + 1) = *((_QWORD *)v54 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v55 = *(int *)(v29 + 24);
      v56 = &v27[v55];
      v57 = &v28[v55];
      *(_QWORD *)v56 = *(_QWORD *)v57;
      *((_QWORD *)v56 + 1) = *((_QWORD *)v57 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240309448((uint64_t)v27, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    goto LABEL_12;
  }
  if (v33)
  {
LABEL_12:
    v41 = sub_240308D40(&qword_256FF5438);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v27, v28, v6);
  v34 = *(int *)(v29 + 20);
  v35 = &v27[v34];
  v36 = &v28[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  v37 = *(int *)(v29 + 24);
  v38 = &v27[v37];
  v39 = &v28[v37];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
  v40 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40(v27, 0, 1, v29);
  return a1;
}

uint64_t sub_240309448(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240309484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5430);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
    *(_OWORD *)&v9[v11[6]] = *(_OWORD *)&v10[v11[6]];
    *(_OWORD *)&v9[v11[7]] = *(_OWORD *)&v10[v11[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = *(int *)(a3 + 24);
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  v17 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = sub_240308D40(&qword_256FF5438);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v15, (uint64_t)v16, v6);
    *(_OWORD *)&v15[*(int *)(v17 + 20)] = *(_OWORD *)&v16[*(int *)(v17 + 20)];
    *(_OWORD *)&v15[*(int *)(v17 + 24)] = *(_OWORD *)&v16[*(int *)(v17 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_24030962C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;

  v6 = sub_240316094();
  v52 = *(_QWORD *)(v6 - 8);
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 40);
  v51(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v8, v9, v6);
      *(_OWORD *)&v8[v10[5]] = *(_OWORD *)&v9[v10[5]];
      *(_OWORD *)&v8[v10[6]] = *(_OWORD *)&v9[v10[6]];
      *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_240309448((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    v15 = sub_240308D40(&qword_256FF5430);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v51((uint64_t)v8, (uint64_t)v9, v6);
  v26 = v10[5];
  v27 = &v8[v26];
  v28 = &v9[v26];
  v30 = *(_QWORD *)v28;
  v29 = *((_QWORD *)v28 + 1);
  *(_QWORD *)v27 = v30;
  *((_QWORD *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  v31 = v10[6];
  v32 = &v8[v31];
  v33 = &v9[v31];
  v35 = *(_QWORD *)v33;
  v34 = *((_QWORD *)v33 + 1);
  *(_QWORD *)v32 = v35;
  *((_QWORD *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  v36 = v10[7];
  v37 = &v8[v36];
  v38 = &v9[v36];
  v40 = *(_QWORD *)v38;
  v39 = *((_QWORD *)v38 + 1);
  *(_QWORD *)v37 = v40;
  *((_QWORD *)v37 + 1) = v39;
  swift_bridgeObjectRelease();
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (char *)(a1 + v16);
  v18 = (char *)(a2 + v16);
  v19 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      v51((uint64_t)v17, (uint64_t)v18, v6);
      v41 = *(int *)(v19 + 20);
      v42 = &v17[v41];
      v43 = &v18[v41];
      v45 = *(_QWORD *)v43;
      v44 = *((_QWORD *)v43 + 1);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v44;
      swift_bridgeObjectRelease();
      v46 = *(int *)(v19 + 24);
      v47 = &v17[v46];
      v48 = &v18[v46];
      v50 = *(_QWORD *)v48;
      v49 = *((_QWORD *)v48 + 1);
      *(_QWORD *)v47 = v50;
      *((_QWORD *)v47 + 1) = v49;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_240309448((uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = sub_240308D40(&qword_256FF5438);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v17, v18, v6);
  *(_OWORD *)&v17[*(int *)(v19 + 20)] = *(_OWORD *)&v18[*(int *)(v19 + 20)];
  *(_OWORD *)&v17[*(int *)(v19 + 24)] = *(_OWORD *)&v18[*(int *)(v19 + 24)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_240309908()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240309914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = sub_240308D40(&qword_256FF5430);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = sub_240308D40(&qword_256FF5438);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_2403099B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2403099C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_240316094();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_240308D40(&qword_256FF5430);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_240308D40(&qword_256FF5438);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_240309A68()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_240316094();
  if (v0 <= 0x3F)
  {
    sub_240303E98(319, &qword_256FF5450, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    if (v1 <= 0x3F)
    {
      sub_240303E98(319, &qword_256FF5458, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *sub_240309B28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_240309BD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240309C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_240309CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240309D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_240309DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240309E40()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240309E50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240309E60()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240316094();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_240309ED4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_240309F9C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24030A004(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24030A0A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24030A174(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_24030A1E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24030A288()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24030A298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_24030A324()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24030A334(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_240316094();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_24030A3B0()
{
  return sub_24031205C();
}

unint64_t sub_24030A3C4()
{
  unint64_t result;

  result = qword_256FF5480;
  if (!qword_256FF5480)
  {
    result = MEMORY[0x242682A44](&unk_240318DE8, &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType);
    atomic_store(result, (unint64_t *)&qword_256FF5480);
  }
  return result;
}

unint64_t sub_24030A40C()
{
  unint64_t result;

  result = qword_256FF5488;
  if (!qword_256FF5488)
  {
    result = MEMORY[0x242682A44](&unk_240318D68, &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType);
    atomic_store(result, (unint64_t *)&qword_256FF5488);
  }
  return result;
}

unint64_t sub_24030A454()
{
  unint64_t result;

  result = qword_256FF5490;
  if (!qword_256FF5490)
  {
    result = MEMORY[0x242682A44](&unk_240318E28, &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType);
    atomic_store(result, (unint64_t *)&qword_256FF5490);
  }
  return result;
}

uint64_t sub_24030A498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE v11[24];

  v1 = sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for LighthouseBitacoraProto_BitacoraState(0) + 20));
  swift_beginAccess();
  if (!*(_QWORD *)(v4 + 24))
  {
    swift_retain();
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v5 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_24030F334(v5, (uint64_t)v3, &qword_256FF5648);
  v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  LODWORD(v5) = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v3, 1, v6);
  swift_retain();
  sub_24030F3BC((uint64_t)v3, &qword_256FF5648);
  if ((_DWORD)v5 == 1)
    goto LABEL_6;
  v7 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID;
  swift_beginAccess();
  if (!*(_QWORD *)(v7 + 8))
    goto LABEL_6;
  v8 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  v9 = *(_BYTE *)(v8 + 8) ^ 1;
LABEL_7:
  swift_release();
  return v9 & 1;
}

uint64_t sub_24030A608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = *(int *)(a4(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    a5(0);
    swift_allocObject();
    v14 = swift_retain();
    *(_QWORD *)(v7 + v13) = a6(v14);
    swift_release();
  }
  v15 = swift_retain();
  a7(v15, a1, a2, a3);
  return swift_release();
}

uint64_t sub_24030A6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char v10;

  result = sub_240316100();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result <= 300)
      {
        if (result > 101)
        {
          switch(result)
          {
            case 201:
            case 202:
            case 203:
            case 204:
LABEL_4:
              sub_24030AD70();
              break;
            default:
              if (result == 102)
LABEL_20:
                sub_24030ACF0();
              break;
          }
        }
        else
        {
          switch(result)
          {
            case 1:
              sub_24030AB2C();
              break;
            case 2:
              sub_24030ABA8(a2, a1, a3, a4, (uint64_t)&OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, &qword_256FF55C0, (uint64_t)&unk_240319C38);
              break;
            case 3:
LABEL_22:
              sub_24030AE84();
              break;
            case 4:
              sub_24030AC6C(a2, a1, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp, MEMORY[0x24BE5C138]);
              break;
            default:
              if (result == 101)
                goto LABEL_20;
              break;
          }
        }
      }
      else
      {
        switch(result)
        {
          case 301:
          case 302:
          case 303:
          case 304:
          case 305:
          case 306:
            goto LABEL_4;
          default:
            switch(result)
            {
              case 501:
                sub_24030ADF0();
                break;
              case 502:
              case 503:
              case 504:
              case 505:
                goto LABEL_22;
              default:
                switch(result)
                {
                  case 401:
                  case 402:
                  case 403:
                  case 404:
                    goto LABEL_4;
                  default:
                    goto LABEL_5;
                }
            }
            break;
        }
      }
LABEL_5:
      result = sub_240316100();
    }
  }
  return result;
}

uint64_t sub_24030AB2C()
{
  swift_beginAccess();
  sub_24031613C();
  return swift_endAccess();
}

uint64_t sub_24030ABA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  swift_beginAccess();
  a6(0);
  sub_24030CB9C(a7, a6, a8);
  sub_240316154();
  return swift_endAccess();
}

uint64_t sub_24030AC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;

  v9 = a2 + *a5;
  swift_beginAccess();
  a6(v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_24030ACF0()
{
  swift_beginAccess();
  sub_24031610C();
  return swift_endAccess();
}

uint64_t sub_24030AD70()
{
  swift_beginAccess();
  sub_240316148();
  return swift_endAccess();
}

uint64_t sub_24030ADF0()
{
  swift_beginAccess();
  sub_24030F43C();
  sub_240316118();
  return swift_endAccess();
}

uint64_t sub_24030AE84()
{
  swift_beginAccess();
  sub_24031613C();
  return swift_endAccess();
}

uint64_t sub_24030AF04(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v10;
  uint64_t result;

  a4(0);
  v10 = swift_retain();
  a5(v10, a1, a2, a3);
  result = swift_release();
  if (!v5)
    return sub_24031607C();
  return result;
}

uint64_t sub_24030AF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  result = sub_24030B308(a1);
  if (!v4)
  {
    sub_24030B3A4(a1, a2, a3, a4);
    sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
    sub_24030B530(a1);
    sub_24030B5B8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
    sub_24030B5B8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded);
    sub_24030B648(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed);
    sub_24030B6D4(a1);
    sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
    sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
    sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
    return sub_24030B774(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  }
  return result;
}

uint64_t sub_24030B308(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    sub_2403161CC();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24030B3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[6];

  v14[5] = a4;
  v5 = sub_240308D40(&qword_256FF5648);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_24030F334(v12, (uint64_t)v7, &qword_256FF5648);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_24030F3BC((uint64_t)v7, &qword_256FF5648);
  sub_24030D3A0((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
  sub_2403161F0();
  return sub_240309448((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_24030B530(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  result = swift_beginAccess();
  if ((*(_BYTE *)(v1 + 8) & 1) == 0)
    return sub_2403161E4();
  return result;
}

uint64_t sub_24030B5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _BYTE *v5;
  uint64_t result;

  v5 = (_BYTE *)(a1 + *a5);
  result = swift_beginAccess();
  if (*v5 != 2)
    return sub_24031619C();
  return result;
}

uint64_t sub_24030B648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t result;

  v5 = a1 + *a5;
  result = swift_beginAccess();
  if ((*(_BYTE *)(v5 + 4) & 1) == 0)
    return sub_2403161D8();
  return result;
}

uint64_t sub_24030B6D4(uint64_t a1)
{
  _BYTE *v1;
  uint64_t result;

  v1 = (_BYTE *)(a1
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  result = swift_beginAccess();
  if (*v1 != 3)
  {
    sub_24030F43C();
    return sub_2403161A8();
  }
  return result;
}

uint64_t sub_24030B774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t result;

  v5 = a1 + *a5;
  result = swift_beginAccess();
  if (*(_QWORD *)(v5 + 8))
  {
    swift_bridgeObjectRetain();
    sub_2403161CC();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24030B820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  int v43;
  unsigned __int8 *v44;
  int v45;
  unsigned __int8 *v46;
  int v47;
  unsigned __int8 *v48;
  int v49;
  int *v50;
  int v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  int *v55;
  int v56;
  char v57;
  uint64_t v58;
  int *v59;
  int v60;
  char v61;
  uint64_t v62;
  int *v63;
  int v64;
  char v65;
  uint64_t v66;
  int *v67;
  int v68;
  char v69;
  uint64_t v70;
  int *v71;
  int v72;
  char v73;
  uint64_t v74;
  int *v75;
  int v76;
  char v77;
  uint64_t v78;
  int *v79;
  int v80;
  char v81;
  uint64_t v82;
  int *v83;
  int v84;
  char v85;
  uint64_t v86;
  int *v87;
  int v88;
  char v89;
  uint64_t v90;
  int *v91;
  int v92;
  char v93;
  uint64_t v94;
  int *v95;
  int v96;
  char v97;
  uint64_t v98;
  int *v99;
  int v100;
  char v101;
  uint64_t v102;
  int *v103;
  int v104;
  char v105;
  uint64_t v106;
  unsigned __int8 *v107;
  int v108;
  unsigned __int8 *v109;
  int v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v4 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_240308D40(&qword_256FF5658);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_240308D40(&qword_256FF5648);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v135 = (uint64_t)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v132 - v14;
  swift_beginAccess();
  v136 = a1;
  v17 = *(_QWORD *)(a1 + 16);
  v16 = *(_QWORD *)(a1 + 24);
  swift_beginAccess();
  v18 = *(_QWORD *)(a2 + 24);
  if (!v16)
  {
    if (!v18)
      goto LABEL_8;
    return 0;
  }
  if (!v18)
    return 0;
  if (v17 == *(_QWORD *)(a2 + 16) && v16 == v18 || (v19 = sub_2403162A4(), result = 0, (v19 & 1) != 0))
  {
LABEL_8:
    v133 = v7;
    v134 = a2;
    v21 = v136;
    v22 = v136
        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
    swift_beginAccess();
    sub_24030F334(v22, (uint64_t)v15, &qword_256FF5648);
    v23 = v134;
    v24 = v134
        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
    swift_beginAccess();
    v25 = (uint64_t)&v10[*(int *)(v8 + 48)];
    sub_24030F334((uint64_t)v15, (uint64_t)v10, &qword_256FF5648);
    sub_24030F334(v24, v25, &qword_256FF5648);
    v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (v26((uint64_t)v10, 1, v4) == 1)
    {
      swift_retain();
      swift_retain();
      sub_24030F3BC((uint64_t)v15, &qword_256FF5648);
      v27 = v21;
      if (v26(v25, 1, v4) == 1)
      {
        sub_24030F3BC((uint64_t)v10, &qword_256FF5648);
        v28 = v23;
        goto LABEL_16;
      }
    }
    else
    {
      v29 = v135;
      sub_24030F334((uint64_t)v10, v135, &qword_256FF5648);
      if (v26(v25, 1, v4) != 1)
      {
        v30 = (uint64_t)v133;
        sub_24030D3A0(v25, (uint64_t)v133, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        v27 = v136;
        swift_retain();
        swift_retain();
        v31 = sub_24030ECBC(v29, v30);
        sub_240309448(v30, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        v28 = v23;
        sub_24030F3BC((uint64_t)v15, &qword_256FF5648);
        sub_240309448(v29, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        sub_24030F3BC((uint64_t)v10, &qword_256FF5648);
        if ((v31 & 1) == 0)
          goto LABEL_28;
LABEL_16:
        v32 = (uint64_t *)(v27
                        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
        swift_beginAccess();
        v33 = *v32;
        v34 = v32[1];
        v35 = (_QWORD *)(v28
                       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
        swift_beginAccess();
        v36 = v35[1];
        if (v34)
        {
          if (!v36 || (v33 != *v35 || v34 != v36) && (sub_2403162A4() & 1) == 0)
            goto LABEL_28;
        }
        else if (v36)
        {
          goto LABEL_28;
        }
        v37 = (uint64_t *)(v27
                        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
        swift_beginAccess();
        v38 = *v37;
        v39 = *((_BYTE *)v37 + 8);
        v40 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
        swift_beginAccess();
        if ((v39 & 1) != 0)
        {
          v41 = v134;
          if ((*(_BYTE *)(v40 + 8) & 1) == 0)
            goto LABEL_28;
        }
        else
        {
          if ((*(_BYTE *)(v40 + 8) & 1) != 0)
            goto LABEL_28;
          v41 = v134;
          if (v38 != *(_QWORD *)v40)
            goto LABEL_28;
        }
        v42 = (unsigned __int8 *)(v27
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
        swift_beginAccess();
        v43 = *v42;
        v44 = (unsigned __int8 *)(v41
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
        swift_beginAccess();
        v45 = *v44;
        if (v43 == 2)
        {
          if (v45 != 2)
            goto LABEL_28;
        }
        else if (v45 == 2 || ((((v45 & 1) == 0) ^ v43) & 1) == 0)
        {
          goto LABEL_28;
        }
        v46 = (unsigned __int8 *)(v27
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
        swift_beginAccess();
        v47 = *v46;
        v48 = (unsigned __int8 *)(v41
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
        swift_beginAccess();
        v49 = *v48;
        if (v47 == 2)
        {
          if (v49 != 2)
            goto LABEL_28;
        }
        else if (v49 == 2 || ((((v49 & 1) == 0) ^ v47) & 1) == 0)
        {
          goto LABEL_28;
        }
        v50 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting);
        swift_beginAccess();
        v51 = *v50;
        v52 = v41;
        v53 = *((_BYTE *)v50 + 4);
        v54 = v52
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
        swift_beginAccess();
        if ((v53 & 1) != 0)
        {
          if ((*(_BYTE *)(v54 + 4) & 1) == 0)
            goto LABEL_28;
        }
        else if ((*(_BYTE *)(v54 + 4) & 1) != 0 || v51 != *(_DWORD *)v54)
        {
          goto LABEL_28;
        }
        v55 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet);
        swift_beginAccess();
        v56 = *v55;
        v57 = *((_BYTE *)v55 + 4);
        v58 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
        swift_beginAccess();
        if ((v57 & 1) != 0)
        {
          if ((*(_BYTE *)(v58 + 4) & 1) == 0)
            goto LABEL_28;
        }
        else if ((*(_BYTE *)(v58 + 4) & 1) != 0 || v56 != *(_DWORD *)v58)
        {
          goto LABEL_28;
        }
        v59 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting);
        swift_beginAccess();
        v60 = *v59;
        v61 = *((_BYTE *)v59 + 4);
        v62 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
        swift_beginAccess();
        if ((v61 & 1) != 0)
        {
          if ((*(_BYTE *)(v62 + 4) & 1) == 0)
            goto LABEL_28;
        }
        else if ((*(_BYTE *)(v62 + 4) & 1) != 0 || v60 != *(_DWORD *)v62)
        {
          goto LABEL_28;
        }
        v63 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet);
        swift_beginAccess();
        v64 = *v63;
        v65 = *((_BYTE *)v63 + 4);
        v66 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
        swift_beginAccess();
        if ((v65 & 1) == 0)
        {
          if ((*(_BYTE *)(v66 + 4) & 1) != 0 || v64 != *(_DWORD *)v66)
            goto LABEL_28;
LABEL_62:
          v67 = (int *)(v27
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded);
          swift_beginAccess();
          v68 = *v67;
          v69 = *((_BYTE *)v67 + 4);
          v70 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
          swift_beginAccess();
          if ((v69 & 1) != 0)
          {
            if ((*(_BYTE *)(v70 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v70 + 4) & 1) != 0 || v68 != *(_DWORD *)v70)
          {
            goto LABEL_28;
          }
          v71 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed);
          swift_beginAccess();
          v72 = *v71;
          v73 = *((_BYTE *)v71 + 4);
          v74 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
          swift_beginAccess();
          if ((v73 & 1) != 0)
          {
            if ((*(_BYTE *)(v74 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v74 + 4) & 1) != 0 || v72 != *(_DWORD *)v74)
          {
            goto LABEL_28;
          }
          v75 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded);
          swift_beginAccess();
          v76 = *v75;
          v77 = *((_BYTE *)v75 + 4);
          v78 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
          swift_beginAccess();
          if ((v77 & 1) != 0)
          {
            if ((*(_BYTE *)(v78 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v78 + 4) & 1) != 0 || v76 != *(_DWORD *)v78)
          {
            goto LABEL_28;
          }
          v79 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed);
          swift_beginAccess();
          v80 = *v79;
          v81 = *((_BYTE *)v79 + 4);
          v82 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
          swift_beginAccess();
          if ((v81 & 1) != 0)
          {
            if ((*(_BYTE *)(v82 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v82 + 4) & 1) != 0 || v80 != *(_DWORD *)v82)
          {
            goto LABEL_28;
          }
          v83 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded);
          swift_beginAccess();
          v84 = *v83;
          v85 = *((_BYTE *)v83 + 4);
          v86 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
          swift_beginAccess();
          if ((v85 & 1) != 0)
          {
            if ((*(_BYTE *)(v86 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v86 + 4) & 1) != 0 || v84 != *(_DWORD *)v86)
          {
            goto LABEL_28;
          }
          v87 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed);
          swift_beginAccess();
          v88 = *v87;
          v89 = *((_BYTE *)v87 + 4);
          v90 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
          swift_beginAccess();
          if ((v89 & 1) != 0)
          {
            if ((*(_BYTE *)(v90 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v90 + 4) & 1) != 0 || v88 != *(_DWORD *)v90)
          {
            goto LABEL_28;
          }
          v91 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded);
          swift_beginAccess();
          v92 = *v91;
          v93 = *((_BYTE *)v91 + 4);
          v94 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
          swift_beginAccess();
          if ((v93 & 1) != 0)
          {
            if ((*(_BYTE *)(v94 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v94 + 4) & 1) != 0 || v92 != *(_DWORD *)v94)
          {
            goto LABEL_28;
          }
          v95 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed);
          swift_beginAccess();
          v96 = *v95;
          v97 = *((_BYTE *)v95 + 4);
          v98 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
          swift_beginAccess();
          if ((v97 & 1) != 0)
          {
            if ((*(_BYTE *)(v98 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v98 + 4) & 1) != 0 || v96 != *(_DWORD *)v98)
          {
            goto LABEL_28;
          }
          v99 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded);
          swift_beginAccess();
          v100 = *v99;
          v101 = *((_BYTE *)v99 + 4);
          v102 = v134
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
          swift_beginAccess();
          if ((v101 & 1) != 0)
          {
            if ((*(_BYTE *)(v102 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v102 + 4) & 1) != 0 || v100 != *(_DWORD *)v102)
          {
            goto LABEL_28;
          }
          v103 = (int *)(v136
                       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed);
          swift_beginAccess();
          v104 = *v103;
          v105 = *((_BYTE *)v103 + 4);
          v106 = v134
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
          swift_beginAccess();
          if ((v105 & 1) != 0)
          {
            if ((*(_BYTE *)(v106 + 4) & 1) == 0)
              goto LABEL_28;
          }
          else if ((*(_BYTE *)(v106 + 4) & 1) != 0 || v104 != *(_DWORD *)v106)
          {
            goto LABEL_28;
          }
          v107 = (unsigned __int8 *)(v136
                                   + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
          swift_beginAccess();
          v108 = *v107;
          v109 = (unsigned __int8 *)(v134
                                   + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
          swift_beginAccess();
          v110 = *v109;
          if (v108 == 3)
          {
            if (v110 != 3)
              goto LABEL_28;
          }
          else if (v110 == 3 || v108 != v110)
          {
            goto LABEL_28;
          }
          v111 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
          swift_beginAccess();
          v112 = *v111;
          v113 = v111[1];
          v114 = (_QWORD *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
          swift_beginAccess();
          v115 = v114[1];
          if (v113)
          {
            if (!v115 || (v112 != *v114 || v113 != v115) && (sub_2403162A4() & 1) == 0)
              goto LABEL_28;
          }
          else if (v115)
          {
            goto LABEL_28;
          }
          v116 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
          swift_beginAccess();
          v117 = *v116;
          v118 = v116[1];
          v119 = (_QWORD *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
          swift_beginAccess();
          v120 = v119[1];
          if (v118)
          {
            if (!v120 || (v117 != *v119 || v118 != v120) && (sub_2403162A4() & 1) == 0)
              goto LABEL_28;
          }
          else if (v120)
          {
            goto LABEL_28;
          }
          v121 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
          swift_beginAccess();
          v122 = *v121;
          v123 = v121[1];
          v124 = (_QWORD *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
          swift_beginAccess();
          v125 = v124[1];
          if (v123)
          {
            if (!v125 || (v122 != *v124 || v123 != v125) && (sub_2403162A4() & 1) == 0)
              goto LABEL_28;
          }
          else if (v125)
          {
            goto LABEL_28;
          }
          v126 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
          swift_beginAccess();
          v127 = *v126;
          v128 = v126[1];
          v129 = (_QWORD *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
          swift_beginAccess();
          v130 = v129[1];
          if (v128)
          {
            if (!v130)
              goto LABEL_28;
            if (v127 == *v129 && v128 == v130)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_release();
              swift_release();
            }
            else
            {
              v131 = sub_2403162A4();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_release();
              swift_release();
              result = 0;
              if ((v131 & 1) == 0)
                return result;
            }
          }
          else
          {
            swift_bridgeObjectRetain();
            swift_release();
            swift_release();
            if (v130)
            {
              swift_bridgeObjectRelease();
              return 0;
            }
          }
          return 1;
        }
        if ((*(_BYTE *)(v66 + 4) & 1) != 0)
          goto LABEL_62;
LABEL_28:
        swift_release();
        swift_release();
        return 0;
      }
      swift_retain();
      swift_retain();
      sub_24030F3BC((uint64_t)v15, &qword_256FF5648);
      sub_240309448(v29, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    }
    sub_24030F3BC((uint64_t)v10, &qword_256FF5658);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_24030C664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24030C680(a1, &qword_256FF52A8, &qword_256FF52B0, a2);
}

uint64_t sub_24030C680@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X2>, _QWORD *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;

  sub_240316088();
  v8 = *(int *)(a1 + 20);
  if (*a2 != -1)
    swift_once();
  *(_QWORD *)(a4 + v8) = *a3;
  return swift_retain();
}

unint64_t sub_24030C6E8()
{
  return 0xD000000000000027;
}

uint64_t sub_24030C708@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_240316094();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_24030C740(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_240316094();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t sub_24030C778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030A608(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass, sub_240307610, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24030A6E8);
}

uint64_t sub_24030C7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24030AF04(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for LighthouseBitacoraProto_BitacoraState, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24030AF98);
}

uint64_t sub_24030C7D0()
{
  sub_24030CB9C(&qword_256FF56B0, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318F30);
  return sub_2403160E8();
}

uint64_t sub_24030C820@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF52A0, (uint64_t)qword_256FF7C98, a1);
}

uint64_t sub_24030C83C()
{
  sub_24030CB9C(&qword_256FF54A0, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318F68);
  return sub_240316184();
}

uint64_t sub_24030C87C()
{
  sub_2403162C8();
  sub_240316220();
  return sub_2403162D4();
}

uint64_t sub_24030C8D0()
{
  sub_24030CB9C(&qword_256FF54A0, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318F68);
  return sub_240316190();
}

uint64_t sub_24030C920()
{
  sub_2403162C8();
  sub_240316220();
  return sub_2403162D4();
}

uint64_t sub_24030C970(uint64_t a1, uint64_t a2)
{
  return sub_24030E17C(a1, a2, type metadata accessor for LighthouseBitacoraProto_BitacoraState, sub_24030B820) & 1;
}

uint64_t sub_24030C998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_240316214();
  sub_24030D3FC(v0, qword_256FF7CB0);
  sub_24030D3E4(v0, (uint64_t)qword_256FF7CB0);
  sub_240308D40(&qword_256FF5600);
  v1 = sub_240308D40(&qword_256FF5608);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_240318AF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "Unknown";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2403161FC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "experiment";
  *((_QWORD *)v11 + 1) = 10;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 2;
  *(_QWORD *)v12 = "BMLT";
  *(_QWORD *)(v12 + 8) = 4;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_240316208();
}

uint64_t sub_24030CB28@<X0>(uint64_t a1@<X8>)
{
  return sub_240301BC0(&qword_256FF52B8, (uint64_t)qword_256FF7CB0, a1);
}

uint64_t sub_24030CB44()
{
  return sub_24030CB9C(&qword_256FF5498, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318E78);
}

uint64_t sub_24030CB70()
{
  return sub_24030CB9C(&qword_256FF54A0, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318F68);
}

uint64_t sub_24030CB9C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242682A44](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24030CBDC()
{
  return sub_24030CB9C(&qword_256FF54A8, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318EA0);
}

uint64_t sub_24030CC08()
{
  return sub_24030CB9C(&qword_256FF54B0, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (uint64_t)&unk_240318EE0);
}

uint64_t sub_24030CC34()
{
  return sub_24030CB9C(&qword_256FF54B8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_240319008);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF56E8);
}

uint64_t sub_24030CC74()
{
  return sub_24030CB9C(&qword_256FF54C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_2403190F8);
}

uint64_t sub_24030CCA0()
{
  return sub_24030CB9C(&qword_256FF54C8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_240319030);
}

uint64_t sub_24030CCCC()
{
  return sub_24030CB9C(&qword_256FF54D0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, (uint64_t)&unk_240319070);
}

uint64_t sub_24030CCF8()
{
  return sub_24030CB9C(&qword_256FF54D8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319170);
}

uint64_t sub_24030CD24()
{
  return sub_24030CB9C(&qword_256FF54E0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319260);
}

uint64_t sub_24030CD50()
{
  return sub_24030CB9C(&qword_256FF54E8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_240319198);
}

uint64_t sub_24030CD7C()
{
  return sub_24030CB9C(&qword_256FF54F0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, (uint64_t)&unk_2403191D8);
}

uint64_t sub_24030CDA8()
{
  return sub_24030CB9C(&qword_256FF54F8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_2403192D8);
}

uint64_t sub_24030CDD4()
{
  return sub_24030CB9C(&qword_256FF5500, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_2403193C8);
}

uint64_t sub_24030CE00()
{
  return sub_24030CB9C(&qword_256FF5508, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_240319300);
}

uint64_t sub_24030CE2C()
{
  return sub_24030CB9C(&qword_256FF5510, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus, (uint64_t)&unk_240319340);
}

uint64_t sub_24030CE58()
{
  return sub_24030CB9C(&qword_256FF5518, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_240319440);
}

uint64_t sub_24030CE84()
{
  return sub_24030CB9C(&qword_256FF5520, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_240319530);
}

uint64_t sub_24030CEB0()
{
  return sub_24030CB9C(&qword_256FF5528, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_240319468);
}

uint64_t sub_24030CEDC()
{
  return sub_24030CB9C(&qword_256FF5530, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t)&unk_2403194A8);
}

uint64_t sub_24030CF08()
{
  return sub_24030CB9C(&qword_256FF5538, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_2403195A8);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF56D8);
}

uint64_t sub_24030CF48()
{
  return sub_24030CB9C(&qword_256FF5540, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319698);
}

uint64_t sub_24030CF74()
{
  return sub_24030CB9C(&qword_256FF5548, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_2403195D0);
}

uint64_t sub_24030CFA0()
{
  return sub_24030CB9C(&qword_256FF5550, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, (uint64_t)&unk_240319610);
}

uint64_t sub_24030CFCC()
{
  return sub_24030CB9C(&qword_256FF5558, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319710);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(uint64_t a1)
{
  return sub_24030D00C(a1, (uint64_t *)&unk_256FF56C0);
}

uint64_t sub_24030D00C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24030D040()
{
  return sub_24030CB9C(&qword_256FF5560, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319800);
}

uint64_t sub_24030D06C()
{
  return sub_24030CB9C(&qword_256FF5568, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319738);
}

uint64_t sub_24030D098()
{
  return sub_24030CB9C(&qword_256FF5570, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, (uint64_t)&unk_240319778);
}

uint64_t sub_24030D0C4()
{
  return sub_24030CB9C(&qword_256FF5578, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319878);
}

uint64_t sub_24030D0F0()
{
  return sub_24030CB9C(&qword_256FF5580, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_240319968);
}

uint64_t sub_24030D11C()
{
  return sub_24030CB9C(&qword_256FF5588, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_2403198A0);
}

uint64_t sub_24030D148()
{
  return sub_24030CB9C(&qword_256FF5590, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers, (uint64_t)&unk_2403198E0);
}

uint64_t sub_24030D174()
{
  return sub_24030CB9C(&qword_256FF5598, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_2403199E0);
}

uint64_t sub_24030D1A0()
{
  return sub_24030CB9C(&qword_256FF55A0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319AD0);
}

uint64_t sub_24030D1CC()
{
  return sub_24030CB9C(&qword_256FF55A8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319A08);
}

uint64_t sub_24030D1F8()
{
  return sub_24030CB9C(&qword_256FF55B0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers, (uint64_t)&unk_240319A48);
}

uint64_t sub_24030D224()
{
  return sub_24030CB9C(&qword_256FF55B8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319B48);
}

uint64_t sub_24030D250()
{
  return sub_24030CB9C(&qword_256FF55C0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319C38);
}

uint64_t sub_24030D27C()
{
  return sub_24030CB9C(&qword_256FF55C8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319B70);
}

uint64_t sub_24030D2A8()
{
  return sub_24030CB9C(&qword_256FF55D0, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers, (uint64_t)&unk_240319BB0);
}

uint64_t sub_24030D2D4()
{
  return sub_24030D360(&qword_256FF55D8, &qword_256FF55E0);
}

uint64_t sub_24030D2F8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242682A38](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24030D33C()
{
  return sub_24030D360(&qword_256FF55E8, &qword_256FF55F0);
}

uint64_t sub_24030D360(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_24030D2F8(a2);
    result = MEMORY[0x242682A44](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24030D3A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24030D3E4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_24030D3FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_24030D43C(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_24030D44C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  unsigned int (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t *v53;
  uint64_t v54;
  char v55;
  char v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double *v67;
  char v68;
  double *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int (*v76)(uint64_t, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  uint64_t v93;
  char v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  char *v104;
  char *v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int *v128;
  uint64_t v129;

  v129 = a2;
  v3 = sub_240316094();
  v110 = *(_QWORD *)(v3 - 8);
  v111 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v109 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v108 = (char *)&v107 - v6;
  v124 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v121 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v118 = (uint64_t)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_240308D40(&qword_256FF5650);
  v8 = MEMORY[0x24BDAC7A8](v123);
  v113 = (uint64_t)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v116 = (uint64_t)&v107 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v122 = (uint64_t)&v107 - v12;
  v13 = sub_240308D40(&qword_256FF5640);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v112 = (uint64_t)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v117 = (char *)&v107 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v115 = (uint64_t)&v107 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v114 = (uint64_t)&v107 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v128 = (int *)((char *)&v107 - v23);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v120 = (char *)&v107 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v119 = (uint64_t)&v107 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v125 = (uint64_t)&v107 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v126 = (uint64_t)&v107 - v30;
  v31 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)&v107 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_240308D40(&qword_256FF5658);
  MEMORY[0x24BDAC7A8](v35);
  v37 = (char *)&v107 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_240308D40(&qword_256FF5648);
  v39 = MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)&v107 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)&v107 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v46 = (char *)&v107 - v45;
  v47 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  v48 = *(int *)(v47 + 20);
  v127 = a1;
  v49 = a1 + v48;
  v50 = (int *)v47;
  sub_24030F334(v49, (uint64_t)v46, &qword_256FF5648);
  sub_24030F334(v129 + v50[5], (uint64_t)v44, &qword_256FF5648);
  v51 = (uint64_t)&v37[*(int *)(v35 + 48)];
  sub_24030F334((uint64_t)v46, (uint64_t)v37, &qword_256FF5648);
  sub_24030F334((uint64_t)v44, v51, &qword_256FF5648);
  v52 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  if (v52((uint64_t)v37, 1, v31) == 1)
  {
    sub_24030F3BC((uint64_t)v44, &qword_256FF5648);
    sub_24030F3BC((uint64_t)v46, &qword_256FF5648);
    if (v52(v51, 1, v31) == 1)
    {
      sub_24030F3BC((uint64_t)v37, &qword_256FF5648);
      goto LABEL_11;
    }
LABEL_6:
    v53 = &qword_256FF5658;
    v54 = (uint64_t)v37;
LABEL_7:
    sub_24030F3BC(v54, v53);
LABEL_8:
    v55 = 0;
    return v55 & 1;
  }
  sub_24030F334((uint64_t)v37, (uint64_t)v41, &qword_256FF5648);
  if (v52(v51, 1, v31) == 1)
  {
    sub_24030F3BC((uint64_t)v44, &qword_256FF5648);
    sub_24030F3BC((uint64_t)v46, &qword_256FF5648);
    sub_240309448((uint64_t)v41, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  sub_24030D3A0(v51, (uint64_t)v34, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  v57 = sub_24030ECBC((uint64_t)v41, (uint64_t)v34);
  sub_240309448((uint64_t)v34, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v44, &qword_256FF5648);
  sub_24030F3BC((uint64_t)v46, &qword_256FF5648);
  sub_240309448((uint64_t)v41, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v37, &qword_256FF5648);
  if ((v57 & 1) == 0)
    goto LABEL_8;
LABEL_11:
  v58 = v50[6];
  v59 = v127;
  v60 = (_QWORD *)(v127 + v58);
  v61 = *(_QWORD *)(v127 + v58 + 8);
  v62 = v129;
  v63 = (_QWORD *)(v129 + v58);
  v64 = v63[1];
  if (!v61)
  {
    v65 = (uint64_t)v128;
    if (v64)
      goto LABEL_8;
    goto LABEL_18;
  }
  v65 = (uint64_t)v128;
  if (!v64)
    goto LABEL_8;
  if (*v60 == *v63 && v61 == v64 || (v55 = 0, (sub_2403162A4() & 1) != 0))
  {
LABEL_18:
    v66 = v50[7];
    v67 = (double *)(v59 + v66);
    v68 = *(_BYTE *)(v59 + v66 + 8);
    v69 = (double *)(v62 + v66);
    v70 = *(unsigned __int8 *)(v62 + v66 + 8);
    if ((v68 & 1) != 0)
    {
      v72 = v125;
      v71 = v126;
      if (!v70)
        goto LABEL_8;
    }
    else
    {
      if (*v67 != *v69)
        LOBYTE(v70) = 1;
      v72 = v125;
      v71 = v126;
      if ((v70 & 1) != 0)
        goto LABEL_8;
    }
    sub_24030F334(v59 + v50[8], v71, &qword_256FF5640);
    sub_24030F334(v62 + v50[8], v72, &qword_256FF5640);
    v73 = v122;
    v74 = v122 + *(int *)(v123 + 48);
    sub_24030F334(v71, v122, &qword_256FF5640);
    v75 = v73;
    sub_24030F334(v72, v74, &qword_256FF5640);
    v76 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48);
    v77 = v73;
    v78 = v124;
    if (v76(v77, 1, v124) == 1)
    {
      v79 = v50;
      sub_24030F3BC(v72, &qword_256FF5640);
      v75 = v122;
      v80 = v124;
      sub_24030F3BC(v71, &qword_256FF5640);
      if (v76(v74, 1, v80) != 1)
        goto LABEL_37;
      sub_24030F3BC(v75, &qword_256FF5640);
      v81 = (uint64_t)v120;
    }
    else
    {
      v82 = v119;
      sub_24030F334(v75, v119, &qword_256FF5640);
      v83 = v76(v74, 1, v78);
      v81 = (uint64_t)v120;
      if (v83 == 1)
      {
        sub_24030F3BC(v125, &qword_256FF5640);
        v84 = v126;
LABEL_29:
        sub_24030F3BC(v84, &qword_256FF5640);
        v85 = v82;
LABEL_36:
        sub_240309448(v85, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
        goto LABEL_37;
      }
      v79 = v50;
      v86 = v118;
      sub_24030D3A0(v74, v118, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      v87 = sub_24030E43C(v82, v86, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_240309448(v86, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_24030F3BC(v125, &qword_256FF5640);
      sub_24030F3BC(v126, &qword_256FF5640);
      v80 = v124;
      sub_240309448(v82, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      v65 = (uint64_t)v128;
      sub_24030F3BC(v75, &qword_256FF5640);
      if ((v87 & 1) == 0)
        goto LABEL_8;
    }
    sub_24030F334(v59 + v79[9], v81, &qword_256FF5640);
    v128 = v79;
    sub_24030F334(v129 + v79[9], v65, &qword_256FF5640);
    v75 = v116;
    v88 = v116 + *(int *)(v123 + 48);
    sub_24030F334(v81, v116, &qword_256FF5640);
    sub_24030F334(v65, v88, &qword_256FF5640);
    if (v76(v75, 1, v80) != 1)
    {
      v91 = v114;
      sub_24030F334(v75, v114, &qword_256FF5640);
      v92 = v76(v88, 1, v80);
      v90 = (uint64_t)v117;
      if (v92 == 1)
      {
        sub_24030F3BC(v65, &qword_256FF5640);
        sub_24030F3BC(v81, &qword_256FF5640);
        v85 = v91;
        goto LABEL_36;
      }
      v93 = v118;
      sub_24030D3A0(v88, v118, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      v94 = sub_24030E43C(v91, v93, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_240309448(v93, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_24030F3BC(v65, &qword_256FF5640);
      sub_24030F3BC(v81, &qword_256FF5640);
      sub_240309448(v91, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_24030F3BC(v75, &qword_256FF5640);
      if ((v94 & 1) == 0)
        goto LABEL_8;
      goto LABEL_39;
    }
    sub_24030F3BC(v65, &qword_256FF5640);
    sub_24030F3BC(v81, &qword_256FF5640);
    v89 = v76(v88, 1, v80);
    v90 = (uint64_t)v117;
    if (v89 == 1)
    {
      sub_24030F3BC(v75, &qword_256FF5640);
LABEL_39:
      v95 = (char *)v128;
      v96 = v115;
      sub_24030F334(v59 + v128[10], v115, &qword_256FF5640);
      sub_24030F334(v129 + *((int *)v95 + 10), v90, &qword_256FF5640);
      v75 = v113;
      v97 = v113 + *(int *)(v123 + 48);
      sub_24030F334(v96, v113, &qword_256FF5640);
      sub_24030F334(v90, v97, &qword_256FF5640);
      v98 = v124;
      if (v76(v75, 1, v124) == 1)
      {
        sub_24030F3BC(v90, &qword_256FF5640);
        sub_24030F3BC(v96, &qword_256FF5640);
        if (v76(v97, 1, v98) == 1)
        {
          sub_24030F3BC(v75, &qword_256FF5640);
LABEL_45:
          v102 = v110;
          v101 = v111;
          v103 = *(void (**)(char *, uint64_t, uint64_t))(v110 + 16);
          v104 = v108;
          v103(v108, v59, v111);
          v105 = v109;
          v103(v109, v129, v101);
          sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
          v55 = sub_24031622C();
          v106 = *(void (**)(char *, uint64_t))(v102 + 8);
          v106(v105, v101);
          v106(v104, v101);
          return v55 & 1;
        }
        goto LABEL_37;
      }
      v82 = v112;
      sub_24030F334(v75, v112, &qword_256FF5640);
      if (v76(v97, 1, v98) != 1)
      {
        v99 = v118;
        sub_24030D3A0(v97, v118, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
        v100 = sub_24030E43C(v82, v99, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
        sub_240309448(v99, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
        sub_24030F3BC(v90, &qword_256FF5640);
        sub_24030F3BC(v115, &qword_256FF5640);
        sub_240309448(v82, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
        sub_24030F3BC(v75, &qword_256FF5640);
        if ((v100 & 1) != 0)
          goto LABEL_45;
        goto LABEL_8;
      }
      sub_24030F3BC(v90, &qword_256FF5640);
      v84 = v115;
      goto LABEL_29;
    }
LABEL_37:
    v53 = &qword_256FF5650;
    v54 = v75;
    goto LABEL_7;
  }
  return v55 & 1;
}

uint64_t sub_24030DFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;

  v4 = sub_240316094();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - v9;
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v12 = *(int *)(v11 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_19;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_2403162A4() & 1) != 0))
  {
LABEL_10:
    v19 = *(int *)(v11 + 24);
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (v23)
      {
        if (*v20 != *v22 || v21 != v23)
        {
          v18 = 0;
          if ((sub_2403162A4() & 1) == 0)
            return v18 & 1;
        }
LABEL_20:
        v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v25(v10, a1, v4);
        v25(v8, a2, v4);
        sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v18 = sub_24031622C();
        v26 = *(void (**)(char *, uint64_t))(v5 + 8);
        v26(v8, v4);
        v26(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v23)
    {
      goto LABEL_20;
    }
LABEL_19:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_24030E17C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v23;

  v8 = sub_240316094();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v15 = *(int *)(a3(0) + 20);
  v16 = *(_QWORD *)(a1 + v15);
  v17 = *(_QWORD *)(a2 + v15);
  if (v16 == v17
    || (swift_retain(), swift_retain(), v18 = a4(v16, v17), swift_release(), swift_release(), (v18 & 1) != 0))
  {
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v19(v14, a1, v8);
    v19(v12, a2, v8);
    sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v20 = sub_24031622C();
    v21 = *(void (**)(char *, uint64_t))(v9 + 8);
    v21(v12, v8);
    v21(v14, v8);
  }
  else
  {
    v20 = 0;
  }
  return v20 & 1;
}

uint64_t sub_24030E2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(char *, uint64_t, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v4 = sub_240316094();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  v11 = *(int *)(type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0)
               + 20);
  v12 = *(unsigned __int8 *)(a1 + v11);
  v13 = *(unsigned __int8 *)(a2 + v11);
  if (v12 == 2)
  {
    if (v13 != 2)
    {
LABEL_7:
      v15 = 0;
      return v15 & 1;
    }
  }
  else if (v13 == 2 || ((((v13 & 1) == 0) ^ v12) & 1) == 0)
  {
    goto LABEL_7;
  }
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v10, a1, v4);
  v14(v8, a2, v4);
  sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v15 = sub_24031622C();
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, v4);
  v16(v10, v4);
  return v15 & 1;
}

uint64_t sub_24030E43C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  _DWORD *v26;
  char v27;
  _DWORD *v28;
  int v29;
  void (*v31)(char *, uint64_t, uint64_t);
  void (*v32)(char *, uint64_t);
  uint64_t v33;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v33 - v11;
  v13 = a3(0);
  v14 = v13;
  v15 = *(int *)(v13 + 20);
  v16 = *(unsigned __int8 *)(a1 + v15);
  v17 = *(unsigned __int8 *)(a2 + v15);
  if (v16 == 2)
  {
    if (v17 != 2)
      goto LABEL_17;
  }
  else if (v17 == 2 || ((((v17 & 1) == 0) ^ v16) & 1) == 0)
  {
    goto LABEL_17;
  }
  v18 = *(int *)(v13 + 24);
  v19 = (_QWORD *)(a1 + v18);
  v20 = *(_QWORD *)(a1 + v18 + 8);
  v21 = (_QWORD *)(a2 + v18);
  v22 = v21[1];
  if (!v20)
  {
    if (!v22)
      goto LABEL_15;
LABEL_17:
    v24 = 0;
    return v24 & 1;
  }
  if (!v22)
    goto LABEL_17;
  v23 = *v19 == *v21 && v20 == v22;
  if (v23 || (v24 = 0, (sub_2403162A4() & 1) != 0))
  {
LABEL_15:
    v25 = *(int *)(v14 + 28);
    v26 = (_DWORD *)(a1 + v25);
    v27 = *(_BYTE *)(a1 + v25 + 4);
    v28 = (_DWORD *)(a2 + v25);
    v29 = *(unsigned __int8 *)(a2 + v25 + 4);
    if ((v27 & 1) != 0)
    {
      if (!v29)
        goto LABEL_17;
    }
    else
    {
      if (*v26 != *v28)
        LOBYTE(v29) = 1;
      if ((v29 & 1) != 0)
        goto LABEL_17;
    }
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v31(v12, a1, v6);
    v31(v10, a2, v6);
    sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v24 = sub_24031622C();
    v32 = *(void (**)(char *, uint64_t))(v7 + 8);
    v32(v10, v6);
    v32(v12, v6);
  }
  return v24 & 1;
}

uint64_t sub_24030E60C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  char v30;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  char v43;
  double *v44;
  int v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v4 = sub_240316094();
  v62 = *(_QWORD *)(v4 - 8);
  v63 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v59 - v7;
  v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v64 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_240308D40(&qword_256FF5658);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_240308D40(&qword_256FF5648);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v59 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v59 - v21;
  v23 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  v24 = *(int *)(v23 + 20);
  v65 = a1;
  v25 = a1 + v24;
  v26 = (int *)v23;
  sub_24030F334(v25, (uint64_t)v22, &qword_256FF5648);
  v27 = v26[5];
  v66 = a2;
  sub_24030F334(a2 + v27, (uint64_t)v20, &qword_256FF5648);
  v28 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_24030F334((uint64_t)v22, (uint64_t)v13, &qword_256FF5648);
  sub_24030F334((uint64_t)v20, v28, &qword_256FF5648);
  v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v29((uint64_t)v13, 1, v8) == 1)
  {
    sub_24030F3BC((uint64_t)v20, &qword_256FF5648);
    sub_24030F3BC((uint64_t)v22, &qword_256FF5648);
    if (v29(v28, 1, v8) == 1)
    {
      sub_24030F3BC((uint64_t)v13, &qword_256FF5648);
      goto LABEL_10;
    }
LABEL_6:
    sub_24030F3BC((uint64_t)v13, &qword_256FF5658);
    goto LABEL_7;
  }
  sub_24030F334((uint64_t)v13, (uint64_t)v17, &qword_256FF5648);
  if (v29(v28, 1, v8) == 1)
  {
    sub_24030F3BC((uint64_t)v20, &qword_256FF5648);
    sub_24030F3BC((uint64_t)v22, &qword_256FF5648);
    sub_240309448((uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  v32 = v64;
  sub_24030D3A0(v28, v64, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  v33 = sub_24030ECBC((uint64_t)v17, v32);
  sub_240309448(v32, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v20, &qword_256FF5648);
  sub_24030F3BC((uint64_t)v22, &qword_256FF5648);
  sub_240309448((uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_24030F3BC((uint64_t)v13, &qword_256FF5648);
  if ((v33 & 1) == 0)
    goto LABEL_7;
LABEL_10:
  v34 = v26[6];
  v36 = v65;
  v35 = v66;
  v37 = (_QWORD *)(v65 + v34);
  v38 = *(_QWORD *)(v65 + v34 + 8);
  v39 = (_QWORD *)(v66 + v34);
  v40 = v39[1];
  if (v38)
  {
    if (!v40)
      goto LABEL_7;
    if (*v37 != *v39 || v38 != v40)
    {
      v30 = 0;
      if ((sub_2403162A4() & 1) == 0)
        return v30 & 1;
    }
  }
  else if (v40)
  {
    goto LABEL_7;
  }
  v41 = v26[7];
  v42 = (double *)(v36 + v41);
  v43 = *(_BYTE *)(v36 + v41 + 8);
  v44 = (double *)(v35 + v41);
  v45 = *(unsigned __int8 *)(v35 + v41 + 8);
  if ((v43 & 1) != 0)
  {
    if (!v45)
      goto LABEL_7;
  }
  else
  {
    if (*v42 != *v44)
      LOBYTE(v45) = 1;
    if ((v45 & 1) != 0)
      goto LABEL_7;
  }
  v46 = v26[8];
  v47 = *(unsigned __int8 *)(v36 + v46);
  v48 = *(unsigned __int8 *)(v35 + v46);
  if (v47 == 4)
  {
    if (v48 == 4)
      goto LABEL_28;
LABEL_7:
    v30 = 0;
    return v30 & 1;
  }
  v30 = 0;
  if (v48 != 4 && v47 == v48)
  {
LABEL_28:
    v49 = v26[9];
    v50 = *(unsigned __int8 *)(v36 + v49);
    v51 = *(unsigned __int8 *)(v35 + v49);
    if (v50 == 2)
    {
      if (v51 == 2)
      {
LABEL_33:
        v52 = v62;
        v53 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
        v54 = v60;
        v55 = v36;
        v56 = v63;
        v53(v60, v55, v63);
        v57 = v61;
        v53(v61, v35, v56);
        sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v30 = sub_24031622C();
        v58 = *(void (**)(char *, uint64_t))(v52 + 8);
        v58(v57, v56);
        v58(v54, v56);
        return v30 & 1;
      }
    }
    else if (v51 != 2 && ((((v51 & 1) == 0) ^ v50) & 1) != 0)
    {
      goto LABEL_33;
    }
    goto LABEL_7;
  }
  return v30 & 1;
}

uint64_t sub_24030EAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;

  v4 = sub_240316094();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - v9;
  v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v12 = v11[5];
  v13 = (_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_28;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_28;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = 0, (sub_2403162A4() & 1) != 0))
  {
LABEL_10:
    v19 = v11[6];
    v20 = (_QWORD *)(a1 + v19);
    v21 = *(_QWORD *)(a1 + v19 + 8);
    v22 = (_QWORD *)(a2 + v19);
    v23 = v22[1];
    if (v21)
    {
      if (!v23)
        goto LABEL_28;
      if (*v20 != *v22 || v21 != v23)
      {
        v18 = 0;
        if ((sub_2403162A4() & 1) == 0)
          return v18 & 1;
      }
    }
    else if (v23)
    {
      goto LABEL_28;
    }
    v25 = v11[7];
    v26 = (_QWORD *)(a1 + v25);
    v27 = *(_QWORD *)(a1 + v25 + 8);
    v28 = (_QWORD *)(a2 + v25);
    v29 = v28[1];
    if (v27)
    {
      if (v29)
      {
        if (*v26 != *v28 || v27 != v29)
        {
          v18 = 0;
          if ((sub_2403162A4() & 1) == 0)
            return v18 & 1;
        }
LABEL_30:
        v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v32(v10, a1, v4);
        v32(v8, a2, v4);
        sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v18 = sub_24031622C();
        v33 = *(void (**)(char *, uint64_t))(v5 + 8);
        v33(v8, v4);
        v33(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v29)
    {
      goto LABEL_30;
    }
LABEL_28:
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_24030ECBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  char *v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v67 = a1;
  v68 = a2;
  v2 = sub_240316094();
  v58 = *(_QWORD *)(v2 - 8);
  v59 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v57 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v55 - v5;
  v65 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v62 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v55 = (uint64_t)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_240308D40(&qword_256FF5610);
  MEMORY[0x24BDAC7A8](v61);
  v66 = (uint64_t)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_240308D40(&qword_256FF5438);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v60 = (uint64_t)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v63 = (uint64_t)&v55 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v64 = (uint64_t)&v55 - v13;
  v14 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_240308D40(&qword_256FF5618);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_240308D40(&qword_256FF5430);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v55 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v55 - v28;
  v30 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_24030F334(v67 + *(int *)(v30 + 20), (uint64_t)v29, &qword_256FF5430);
  sub_24030F334(v68 + *(int *)(v30 + 20), (uint64_t)v27, &qword_256FF5430);
  v31 = (uint64_t)&v20[*(int *)(v18 + 48)];
  sub_24030F334((uint64_t)v29, (uint64_t)v20, &qword_256FF5430);
  sub_24030F334((uint64_t)v27, v31, &qword_256FF5430);
  v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (v32((uint64_t)v20, 1, v14) != 1)
  {
    sub_24030F334((uint64_t)v20, (uint64_t)v24, &qword_256FF5430);
    if (v32(v31, 1, v14) != 1)
    {
      sub_24030D3A0(v31, (uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      v35 = sub_24030EAC8((uint64_t)v24, (uint64_t)v17);
      sub_240309448((uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      sub_24030F3BC((uint64_t)v27, &qword_256FF5430);
      sub_24030F3BC((uint64_t)v29, &qword_256FF5430);
      sub_240309448((uint64_t)v24, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      sub_24030F3BC((uint64_t)v20, &qword_256FF5430);
      if ((v35 & 1) == 0)
        goto LABEL_15;
      goto LABEL_8;
    }
    sub_24030F3BC((uint64_t)v27, &qword_256FF5430);
    sub_24030F3BC((uint64_t)v29, &qword_256FF5430);
    sub_240309448((uint64_t)v24, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    v33 = &qword_256FF5618;
    v34 = (uint64_t)v20;
LABEL_14:
    sub_24030F3BC(v34, v33);
    goto LABEL_15;
  }
  sub_24030F3BC((uint64_t)v27, &qword_256FF5430);
  sub_24030F3BC((uint64_t)v29, &qword_256FF5430);
  if (v32(v31, 1, v14) != 1)
    goto LABEL_6;
  sub_24030F3BC((uint64_t)v20, &qword_256FF5430);
LABEL_8:
  v36 = v67;
  v37 = v64;
  sub_24030F334(v67 + *(int *)(v30 + 24), v64, &qword_256FF5438);
  v38 = v68;
  v39 = v63;
  sub_24030F334(v68 + *(int *)(v30 + 24), v63, &qword_256FF5438);
  v40 = v66;
  v41 = v66 + *(int *)(v61 + 48);
  sub_24030F334(v37, v66, &qword_256FF5438);
  sub_24030F334(v39, v41, &qword_256FF5438);
  v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
  v43 = v65;
  if (v42(v40, 1, v65) == 1)
  {
    sub_24030F3BC(v39, &qword_256FF5438);
    sub_24030F3BC(v37, &qword_256FF5438);
    if (v42(v41, 1, v43) == 1)
    {
      sub_24030F3BC(v40, &qword_256FF5438);
LABEL_18:
      v50 = v58;
      v49 = v59;
      v51 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
      v52 = v56;
      v51(v56, v36, v59);
      v53 = v57;
      v51(v57, v38, v49);
      sub_24030CB9C(&qword_256FF5620, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v45 = sub_24031622C();
      v54 = *(void (**)(char *, uint64_t))(v50 + 8);
      v54(v53, v49);
      v54(v52, v49);
      return v45 & 1;
    }
    goto LABEL_13;
  }
  v44 = v60;
  sub_24030F334(v40, v60, &qword_256FF5438);
  if (v42(v41, 1, v43) == 1)
  {
    sub_24030F3BC(v39, &qword_256FF5438);
    sub_24030F3BC(v37, &qword_256FF5438);
    sub_240309448(v44, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
LABEL_13:
    v33 = &qword_256FF5610;
    v34 = v40;
    goto LABEL_14;
  }
  v47 = v55;
  sub_24030D3A0(v41, v55, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  v48 = sub_24030DFD0(v44, v47);
  sub_240309448(v47, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_24030F3BC(v39, &qword_256FF5438);
  sub_24030F3BC(v37, &qword_256FF5438);
  sub_240309448(v44, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_24030F3BC(v40, &qword_256FF5438);
  if ((v48 & 1) != 0)
    goto LABEL_18;
LABEL_15:
  v45 = 0;
  return v45 & 1;
}

uint64_t sub_24030F334(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_240308D40(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24030F378(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_240308D40(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24030F3BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_240308D40(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24030F3F8()
{
  unint64_t result;

  result = qword_256FF56A8;
  if (!qword_256FF56A8)
  {
    result = MEMORY[0x242682A44](&unk_240319E6C, &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_256FF56A8);
  }
  return result;
}

unint64_t sub_24030F43C()
{
  unint64_t result;

  result = qword_256FF56B8;
  if (!qword_256FF56B8)
  {
    result = MEMORY[0x242682A44](&unk_240318DA0, &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType);
    atomic_store(result, (unint64_t *)&qword_256FF56B8);
  }
  return result;
}

uint64_t *sub_24030F480(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, _QWORD, uint64_t, int *);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  int *v60;
  uint64_t v61;
  unsigned int (*v62)(char *, uint64_t, int *);
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  void (*v71)(char *, _QWORD, uint64_t, int *);
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  void (*v83)(char *, _QWORD, uint64_t, int *);
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  void (*v95)(char *, _QWORD, uint64_t, int *);
  char *__dst;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  void (*v101)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
    v13 = *(_QWORD *)(v12 - 8);
    v101 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = sub_240308D40(&qword_256FF5648);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v98 = v13;
      v8(v10, v11, v7);
      v16 = *(int *)(v12 + 20);
      v99 = v10;
      __dst = &v10[v16];
      v17 = v7;
      v18 = &v11[v16];
      v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      v20 = *((_QWORD *)v19 - 1);
      v100 = v17;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
      {
        v21 = sub_240308D40(&qword_256FF5430);
        memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v8(__dst, v18, v17);
        v22 = v19[5];
        v23 = &__dst[v22];
        v24 = &v18[v22];
        v25 = *((_QWORD *)v24 + 1);
        *(_QWORD *)v23 = *(_QWORD *)v24;
        *((_QWORD *)v23 + 1) = v25;
        v26 = v19[6];
        v27 = &__dst[v26];
        v28 = &v18[v26];
        v29 = *((_QWORD *)v28 + 1);
        *(_QWORD *)v27 = *(_QWORD *)v28;
        *((_QWORD *)v27 + 1) = v29;
        v30 = v19[7];
        v31 = &__dst[v30];
        v32 = &v18[v30];
        v33 = *((_QWORD *)v32 + 1);
        *(_QWORD *)v31 = *(_QWORD *)v32;
        *((_QWORD *)v31 + 1) = v33;
        v34 = *(void (**)(char *, _QWORD, uint64_t, int *))(v20 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v34(__dst, 0, 1, v19);
      }
      v35 = *(int *)(v12 + 24);
      v36 = &v99[v35];
      v37 = &v11[v35];
      v38 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      v39 = *(_QWORD *)(v38 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
      {
        v40 = sub_240308D40(&qword_256FF5438);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v101(v36, v37, v100);
        v41 = *(int *)(v38 + 20);
        v42 = &v36[v41];
        v43 = &v37[v41];
        v44 = *((_QWORD *)v43 + 1);
        *(_QWORD *)v42 = *(_QWORD *)v43;
        *((_QWORD *)v42 + 1) = v44;
        v45 = *(int *)(v38 + 24);
        v46 = &v36[v45];
        v47 = &v37[v45];
        v48 = *((_QWORD *)v47 + 1);
        *(_QWORD *)v46 = *(_QWORD *)v47;
        *((_QWORD *)v46 + 1) = v48;
        v49 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v49(v36, 0, 1, v38);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v98 + 56))(v99, 0, 1, v12);
      v7 = v100;
    }
    v50 = a3[6];
    v51 = a3[7];
    v52 = (uint64_t *)((char *)a1 + v50);
    v53 = (uint64_t *)((char *)a2 + v50);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    v55 = (char *)a1 + v51;
    v56 = (char *)a2 + v51;
    v55[8] = v56[8];
    *(_QWORD *)v55 = *(_QWORD *)v56;
    v57 = a3[8];
    v58 = (char *)a1 + v57;
    v59 = (char *)a2 + v57;
    v60 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
    v61 = *((_QWORD *)v60 - 1);
    v62 = *(unsigned int (**)(char *, uint64_t, int *))(v61 + 48);
    swift_bridgeObjectRetain();
    if (v62(v59, 1, v60))
    {
      v63 = sub_240308D40(&qword_256FF5640);
      memcpy(v58, v59, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    }
    else
    {
      v101(v58, v59, v7);
      v58[v60[5]] = v59[v60[5]];
      v64 = v60[6];
      v65 = &v58[v64];
      v66 = &v59[v64];
      v67 = *((_QWORD *)v66 + 1);
      *(_QWORD *)v65 = *(_QWORD *)v66;
      *((_QWORD *)v65 + 1) = v67;
      v68 = v60[7];
      v69 = &v58[v68];
      v70 = &v59[v68];
      v69[4] = v70[4];
      *(_DWORD *)v69 = *(_DWORD *)v70;
      v71 = *(void (**)(char *, _QWORD, uint64_t, int *))(v61 + 56);
      swift_bridgeObjectRetain();
      v71(v58, 0, 1, v60);
    }
    v72 = a3[9];
    v73 = (char *)a1 + v72;
    v74 = (char *)a2 + v72;
    if (v62((char *)a2 + v72, 1, v60))
    {
      v75 = sub_240308D40(&qword_256FF5640);
      memcpy(v73, v74, *(_QWORD *)(*(_QWORD *)(v75 - 8) + 64));
    }
    else
    {
      v101(v73, v74, v7);
      v73[v60[5]] = v74[v60[5]];
      v76 = v60[6];
      v77 = &v73[v76];
      v78 = &v74[v76];
      v79 = *((_QWORD *)v78 + 1);
      *(_QWORD *)v77 = *(_QWORD *)v78;
      *((_QWORD *)v77 + 1) = v79;
      v80 = v60[7];
      v81 = &v73[v80];
      v82 = &v74[v80];
      v81[4] = v82[4];
      *(_DWORD *)v81 = *(_DWORD *)v82;
      v83 = *(void (**)(char *, _QWORD, uint64_t, int *))(v61 + 56);
      swift_bridgeObjectRetain();
      v83(v73, 0, 1, v60);
    }
    v84 = a3[10];
    v85 = (char *)a1 + v84;
    v86 = (char *)a2 + v84;
    if (v62(v86, 1, v60))
    {
      v87 = sub_240308D40(&qword_256FF5640);
      memcpy(v85, v86, *(_QWORD *)(*(_QWORD *)(v87 - 8) + 64));
    }
    else
    {
      v101(v85, v86, v7);
      v85[v60[5]] = v86[v60[5]];
      v88 = v60[6];
      v89 = &v85[v88];
      v90 = &v86[v88];
      v91 = *((_QWORD *)v90 + 1);
      *(_QWORD *)v89 = *(_QWORD *)v90;
      *((_QWORD *)v89 + 1) = v91;
      v92 = v60[7];
      v93 = &v85[v92];
      v94 = &v86[v92];
      v93[4] = v94[4];
      *(_DWORD *)v93 = *(_DWORD *)v94;
      v95 = *(void (**)(char *, _QWORD, uint64_t, int *))(v61 + 56);
      swift_bridgeObjectRetain();
      v95(v85, 0, 1, v60);
    }
  }
  return a1;
}

uint64_t sub_24030F9AC(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v4 = sub_240316094();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + a2[5];
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    v8 = v6 + *(int *)(v7 + 20);
    v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
    {
      v5(v8, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v10 = v6 + *(int *)(v7 + 24);
    v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
    {
      v5(v10, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  v12 = a1 + a2[8];
  v13 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48);
  if (!v14(v12, 1, v13))
  {
    v5(v12, v4);
    swift_bridgeObjectRelease();
  }
  v15 = a1 + a2[9];
  if (!v14(v15, 1, v13))
  {
    v5(v15, v4);
    swift_bridgeObjectRelease();
  }
  v16 = a1 + a2[10];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(v16, 1, v13);
  if (!(_DWORD)result)
  {
    v5(v16, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24030FBE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t, int *);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  int *v58;
  uint64_t v59;
  unsigned int (*v60)(char *, uint64_t, int *);
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  void (*v69)(char *, _QWORD, uint64_t, int *);
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  void (*v81)(char *, _QWORD, uint64_t, int *);
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  void (*v93)(char *, _QWORD, uint64_t, int *);
  char *__dst;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  void (*v99)(char *, char *, uint64_t);

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  v99 = (void (*)(char *, char *, uint64_t))v7;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5648);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v96 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    v97 = v9;
    __dst = &v9[v14];
    v15 = v6;
    v16 = &v10[v14];
    v17 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v18 = *((_QWORD *)v17 - 1);
    v98 = v15;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_240308D40(&qword_256FF5430);
      memcpy(__dst, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v16, v15);
      v20 = v17[5];
      v21 = &__dst[v20];
      v22 = &v16[v20];
      v23 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      v24 = v17[6];
      v25 = &__dst[v24];
      v26 = &v16[v24];
      v27 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v27;
      v28 = v17[7];
      v29 = &__dst[v28];
      v30 = &v16[v28];
      v31 = *((_QWORD *)v30 + 1);
      *(_QWORD *)v29 = *(_QWORD *)v30;
      *((_QWORD *)v29 + 1) = v31;
      v32 = *(void (**)(char *, _QWORD, uint64_t, int *))(v18 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(__dst, 0, 1, v17);
    }
    v33 = *(int *)(v11 + 24);
    v34 = &v97[v33];
    v35 = &v10[v33];
    v36 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = sub_240308D40(&qword_256FF5438);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v99(v34, v35, v98);
      v39 = *(int *)(v36 + 20);
      v40 = &v34[v39];
      v41 = &v35[v39];
      v42 = *((_QWORD *)v41 + 1);
      *(_QWORD *)v40 = *(_QWORD *)v41;
      *((_QWORD *)v40 + 1) = v42;
      v43 = *(int *)(v36 + 24);
      v44 = &v34[v43];
      v45 = &v35[v43];
      v46 = *((_QWORD *)v45 + 1);
      *(_QWORD *)v44 = *(_QWORD *)v45;
      *((_QWORD *)v44 + 1) = v46;
      v47 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v47(v34, 0, 1, v36);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v96 + 56))(v97, 0, 1, v11);
    v6 = v98;
  }
  v48 = a3[6];
  v49 = a3[7];
  v50 = (_QWORD *)(a1 + v48);
  v51 = (_QWORD *)(a2 + v48);
  v52 = v51[1];
  *v50 = *v51;
  v50[1] = v52;
  v53 = a1 + v49;
  v54 = a2 + v49;
  *(_BYTE *)(v53 + 8) = *(_BYTE *)(v54 + 8);
  *(_QWORD *)v53 = *(_QWORD *)v54;
  v55 = a3[8];
  v56 = (char *)(a1 + v55);
  v57 = (char *)(a2 + v55);
  v58 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v59 = *((_QWORD *)v58 - 1);
  v60 = *(unsigned int (**)(char *, uint64_t, int *))(v59 + 48);
  swift_bridgeObjectRetain();
  if (v60(v57, 1, v58))
  {
    v61 = sub_240308D40(&qword_256FF5640);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
  }
  else
  {
    v99(v56, v57, v6);
    v56[v58[5]] = v57[v58[5]];
    v62 = v58[6];
    v63 = &v56[v62];
    v64 = &v57[v62];
    v65 = *((_QWORD *)v64 + 1);
    *(_QWORD *)v63 = *(_QWORD *)v64;
    *((_QWORD *)v63 + 1) = v65;
    v66 = v58[7];
    v67 = &v56[v66];
    v68 = &v57[v66];
    v67[4] = v68[4];
    *(_DWORD *)v67 = *(_DWORD *)v68;
    v69 = *(void (**)(char *, _QWORD, uint64_t, int *))(v59 + 56);
    swift_bridgeObjectRetain();
    v69(v56, 0, 1, v58);
  }
  v70 = a3[9];
  v71 = (char *)(a1 + v70);
  v72 = (char *)(a2 + v70);
  if (v60((char *)(a2 + v70), 1, v58))
  {
    v73 = sub_240308D40(&qword_256FF5640);
    memcpy(v71, v72, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
  }
  else
  {
    v99(v71, v72, v6);
    v71[v58[5]] = v72[v58[5]];
    v74 = v58[6];
    v75 = &v71[v74];
    v76 = &v72[v74];
    v77 = *((_QWORD *)v76 + 1);
    *(_QWORD *)v75 = *(_QWORD *)v76;
    *((_QWORD *)v75 + 1) = v77;
    v78 = v58[7];
    v79 = &v71[v78];
    v80 = &v72[v78];
    v79[4] = v80[4];
    *(_DWORD *)v79 = *(_DWORD *)v80;
    v81 = *(void (**)(char *, _QWORD, uint64_t, int *))(v59 + 56);
    swift_bridgeObjectRetain();
    v81(v71, 0, 1, v58);
  }
  v82 = a3[10];
  v83 = (char *)(a1 + v82);
  v84 = (char *)(a2 + v82);
  if (v60(v84, 1, v58))
  {
    v85 = sub_240308D40(&qword_256FF5640);
    memcpy(v83, v84, *(_QWORD *)(*(_QWORD *)(v85 - 8) + 64));
  }
  else
  {
    v99(v83, v84, v6);
    v83[v58[5]] = v84[v58[5]];
    v86 = v58[6];
    v87 = &v83[v86];
    v88 = &v84[v86];
    v89 = *((_QWORD *)v88 + 1);
    *(_QWORD *)v87 = *(_QWORD *)v88;
    *((_QWORD *)v87 + 1) = v89;
    v90 = v58[7];
    v91 = &v83[v90];
    v92 = &v84[v90];
    v91[4] = v92[4];
    *(_DWORD *)v91 = *(_DWORD *)v92;
    v93 = *(void (**)(char *, _QWORD, uint64_t, int *))(v59 + 56);
    swift_bridgeObjectRetain();
    v93(v83, 0, 1, v58);
  }
  return a1;
}

char *sub_2403100E8(char *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int *v26;
  uint64_t (*v27)(char *, uint64_t, int *);
  char *v28;
  int v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void (*v39)(char *, _QWORD, uint64_t, int *);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  void (*v49)(char *, _QWORD, uint64_t, int *);
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  void (*v62)(char *, _QWORD, uint64_t, uint64_t);
  int *v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  int *v74;
  uint64_t v75;
  uint64_t (*v76)(char *, uint64_t, int *);
  int v77;
  int v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char v85;
  void (*v86)(char *, _QWORD, uint64_t, int *);
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  int v91;
  int v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char v99;
  void (*v100)(char *, _QWORD, uint64_t, int *);
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  int v105;
  int v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  char *v111;
  char *v112;
  char v113;
  void (*v114)(char *, _QWORD, uint64_t, int *);
  uint64_t v115;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  char *v122;
  int v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  int v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  char *v135;
  char *v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t (*v144)(char *, uint64_t, uint64_t);
  int v145;
  int v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  char *v151;
  char *v152;
  void (*v153)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  uint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  char *v168;
  char *v169;
  void (*v170)(char *, char *, uint64_t);
  char *__dst;
  _QWORD *__dsta;
  char *__src;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(char *, uint64_t, uint64_t);
  uint64_t v177;
  int *v178;

  v6 = sub_240316094();
  v177 = *(_QWORD *)(v6 - 8);
  v176 = *(void (**)(char *, uint64_t, uint64_t))(v177 + 24);
  v176(a1, a2, v6);
  v178 = a3;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      __src = a1;
      v15 = *(void (**)(char *, char *, uint64_t))(v177 + 16);
      v15(v8, v9, v6);
      v16 = *(int *)(v10 + 20);
      __dst = &v8[v16];
      v17 = v6;
      v18 = &v9[v16];
      v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      v20 = *((_QWORD *)v19 - 1);
      v174 = v17;
      v170 = v15;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
      {
        v21 = sub_240308D40(&qword_256FF5430);
        memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v15(__dst, v18, v17);
        v40 = v19[5];
        v41 = &__dst[v40];
        v42 = &v18[v40];
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
        v43 = v19[6];
        v44 = &__dst[v43];
        v45 = &v18[v43];
        *(_QWORD *)v44 = *(_QWORD *)v45;
        *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
        v46 = v19[7];
        v47 = &__dst[v46];
        v48 = &v18[v46];
        *(_QWORD *)v47 = *(_QWORD *)v48;
        *((_QWORD *)v47 + 1) = *((_QWORD *)v48 + 1);
        v49 = *(void (**)(char *, _QWORD, uint64_t, int *))(v20 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v49(__dst, 0, 1, v19);
      }
      v50 = *(int *)(v10 + 24);
      v51 = &v8[v50];
      v52 = &v9[v50];
      v53 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      v54 = *(_QWORD *)(v53 - 8);
      a1 = __src;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53))
      {
        v55 = sub_240308D40(&qword_256FF5438);
        memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
      }
      else
      {
        v170(v51, v52, v174);
        v56 = *(int *)(v53 + 20);
        v57 = &v51[v56];
        v58 = &v52[v56];
        *(_QWORD *)v57 = *(_QWORD *)v58;
        *((_QWORD *)v57 + 1) = *((_QWORD *)v58 + 1);
        v59 = *(int *)(v53 + 24);
        v60 = &v51[v59];
        v61 = &v52[v59];
        *(_QWORD *)v60 = *(_QWORD *)v61;
        *((_QWORD *)v60 + 1) = *((_QWORD *)v61 + 1);
        v62 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v62(v51, 0, 1, v53);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      v6 = v174;
      goto LABEL_16;
    }
LABEL_7:
    v22 = sub_240308D40(&qword_256FF5648);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
LABEL_16:
    v63 = v178;
    goto LABEL_17;
  }
  if (v14)
  {
    sub_240309448((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_7;
  }
  v175 = v6;
  v176(v8, (uint64_t)v9, v6);
  v23 = *(int *)(v10 + 20);
  v24 = &v8[v23];
  v25 = &v9[v23];
  v26 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  __dsta = (_QWORD *)*((_QWORD *)v26 - 1);
  v27 = (uint64_t (*)(char *, uint64_t, int *))__dsta[6];
  v28 = v24;
  LODWORD(v24) = v27(v24, 1, v26);
  v29 = v27(v25, 1, v26);
  if ((_DWORD)v24)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v28, v25, v175);
      v30 = v26[5];
      v31 = &v28[v30];
      v32 = &v25[v30];
      *(_QWORD *)v31 = *(_QWORD *)v32;
      *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
      v33 = v26[6];
      v34 = &v28[v33];
      v35 = &v25[v33];
      *(_QWORD *)v34 = *(_QWORD *)v35;
      *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
      v36 = v26[7];
      v37 = &v28[v36];
      v38 = &v25[v36];
      *(_QWORD *)v37 = *(_QWORD *)v38;
      *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
      v39 = (void (*)(char *, _QWORD, uint64_t, int *))__dsta[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v39(v28, 0, 1, v26);
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v29)
  {
    sub_240309448((uint64_t)v28, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_41:
    v138 = sub_240308D40(&qword_256FF5430);
    memcpy(v28, v25, *(_QWORD *)(*(_QWORD *)(v138 - 8) + 64));
    goto LABEL_42;
  }
  v176(v28, (uint64_t)v25, v175);
  v155 = v26[5];
  v156 = &v28[v155];
  v157 = &v25[v155];
  *(_QWORD *)v156 = *(_QWORD *)v157;
  *((_QWORD *)v156 + 1) = *((_QWORD *)v157 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v158 = v26[6];
  v159 = &v28[v158];
  v160 = &v25[v158];
  *(_QWORD *)v159 = *(_QWORD *)v160;
  *((_QWORD *)v159 + 1) = *((_QWORD *)v160 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v161 = v26[7];
  v162 = &v28[v161];
  v163 = &v25[v161];
  *(_QWORD *)v162 = *(_QWORD *)v163;
  *((_QWORD *)v162 + 1) = *((_QWORD *)v163 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_42:
  v139 = *(int *)(v10 + 24);
  v140 = &v8[v139];
  v141 = &v9[v139];
  v142 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v143 = *(_QWORD *)(v142 - 8);
  v144 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v143 + 48);
  v145 = v144(v140, 1, v142);
  v146 = v144(v141, 1, v142);
  if (v145)
  {
    v6 = v175;
    v63 = v178;
    if (!v146)
    {
      (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v140, v141, v175);
      v147 = *(int *)(v142 + 20);
      v148 = &v140[v147];
      v149 = &v141[v147];
      *(_QWORD *)v148 = *(_QWORD *)v149;
      *((_QWORD *)v148 + 1) = *((_QWORD *)v149 + 1);
      v150 = *(int *)(v142 + 24);
      v151 = &v140[v150];
      v152 = &v141[v150];
      *(_QWORD *)v151 = *(_QWORD *)v152;
      *((_QWORD *)v151 + 1) = *((_QWORD *)v152 + 1);
      v153 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v143 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v153(v140, 0, 1, v142);
      goto LABEL_17;
    }
    goto LABEL_47;
  }
  v6 = v175;
  v63 = v178;
  if (v146)
  {
    sub_240309448((uint64_t)v140, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
LABEL_47:
    v154 = sub_240308D40(&qword_256FF5438);
    memcpy(v140, v141, *(_QWORD *)(*(_QWORD *)(v154 - 8) + 64));
    goto LABEL_17;
  }
  v176(v140, (uint64_t)v141, v175);
  v164 = *(int *)(v142 + 20);
  v165 = &v140[v164];
  v166 = &v141[v164];
  *(_QWORD *)v165 = *(_QWORD *)v166;
  *((_QWORD *)v165 + 1) = *((_QWORD *)v166 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v167 = *(int *)(v142 + 24);
  v168 = &v140[v167];
  v169 = &v141[v167];
  *(_QWORD *)v168 = *(_QWORD *)v169;
  *((_QWORD *)v168 + 1) = *((_QWORD *)v169 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_17:
  v64 = v63[6];
  v65 = &a1[v64];
  v66 = (_QWORD *)(a2 + v64);
  *(_QWORD *)v65 = *v66;
  *((_QWORD *)v65 + 1) = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v63[7];
  v68 = &a1[v67];
  v69 = (uint64_t *)(a2 + v67);
  v70 = *v69;
  v68[8] = *((_BYTE *)v69 + 8);
  *(_QWORD *)v68 = v70;
  v71 = v63[8];
  v72 = &a1[v71];
  v73 = (char *)(a2 + v71);
  v74 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v75 = *((_QWORD *)v74 - 1);
  v76 = *(uint64_t (**)(char *, uint64_t, int *))(v75 + 48);
  v77 = v76(v72, 1, v74);
  v78 = v76(v73, 1, v74);
  if (v77)
  {
    if (!v78)
    {
      (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v72, v73, v6);
      v72[v74[5]] = v73[v74[5]];
      v79 = v74[6];
      v80 = &v72[v79];
      v81 = &v73[v79];
      *(_QWORD *)v80 = *(_QWORD *)v81;
      *((_QWORD *)v80 + 1) = *((_QWORD *)v81 + 1);
      v82 = v74[7];
      v83 = &v72[v82];
      v84 = &v73[v82];
      v85 = v84[4];
      *(_DWORD *)v83 = *(_DWORD *)v84;
      v83[4] = v85;
      v86 = *(void (**)(char *, _QWORD, uint64_t, int *))(v75 + 56);
      swift_bridgeObjectRetain();
      v86(v72, 0, 1, v74);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v78)
  {
    sub_240309448((uint64_t)v72, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_22:
    v87 = sub_240308D40(&qword_256FF5640);
    memcpy(v72, v73, *(_QWORD *)(*(_QWORD *)(v87 - 8) + 64));
    goto LABEL_23;
  }
  v176(v72, (uint64_t)v73, v6);
  v72[v74[5]] = v73[v74[5]];
  v117 = v74[6];
  v118 = &v72[v117];
  v119 = &v73[v117];
  *(_QWORD *)v118 = *(_QWORD *)v119;
  *((_QWORD *)v118 + 1) = *((_QWORD *)v119 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v120 = v74[7];
  v121 = &v72[v120];
  v122 = &v73[v120];
  v123 = *(_DWORD *)v122;
  v121[4] = v122[4];
  *(_DWORD *)v121 = v123;
LABEL_23:
  v88 = v63[9];
  v89 = &a1[v88];
  v90 = (char *)(a2 + v88);
  v91 = v76(&a1[v88], 1, v74);
  v92 = v76(v90, 1, v74);
  if (v91)
  {
    if (!v92)
    {
      (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v89, v90, v6);
      v89[v74[5]] = v90[v74[5]];
      v93 = v74[6];
      v94 = &v89[v93];
      v95 = &v90[v93];
      *(_QWORD *)v94 = *(_QWORD *)v95;
      *((_QWORD *)v94 + 1) = *((_QWORD *)v95 + 1);
      v96 = v74[7];
      v97 = &v89[v96];
      v98 = &v90[v96];
      v99 = v98[4];
      *(_DWORD *)v97 = *(_DWORD *)v98;
      v97[4] = v99;
      v100 = *(void (**)(char *, _QWORD, uint64_t, int *))(v75 + 56);
      swift_bridgeObjectRetain();
      v100(v89, 0, 1, v74);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v92)
  {
    sub_240309448((uint64_t)v89, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_28:
    v101 = sub_240308D40(&qword_256FF5640);
    memcpy(v89, v90, *(_QWORD *)(*(_QWORD *)(v101 - 8) + 64));
    goto LABEL_29;
  }
  v176(v89, (uint64_t)v90, v6);
  v89[v74[5]] = v90[v74[5]];
  v124 = v74[6];
  v125 = &v89[v124];
  v126 = &v90[v124];
  *(_QWORD *)v125 = *(_QWORD *)v126;
  *((_QWORD *)v125 + 1) = *((_QWORD *)v126 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v127 = v74[7];
  v128 = &v89[v127];
  v129 = &v90[v127];
  v130 = *(_DWORD *)v129;
  v128[4] = v129[4];
  *(_DWORD *)v128 = v130;
LABEL_29:
  v102 = v63[10];
  v103 = &a1[v102];
  v104 = (char *)(a2 + v102);
  v105 = v76(&a1[v102], 1, v74);
  v106 = v76(v104, 1, v74);
  if (!v105)
  {
    if (!v106)
    {
      v176(v103, (uint64_t)v104, v6);
      v103[v74[5]] = v104[v74[5]];
      v131 = v74[6];
      v132 = &v103[v131];
      v133 = &v104[v131];
      *(_QWORD *)v132 = *(_QWORD *)v133;
      *((_QWORD *)v132 + 1) = *((_QWORD *)v133 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v134 = v74[7];
      v135 = &v103[v134];
      v136 = &v104[v134];
      v137 = *(_DWORD *)v136;
      v135[4] = v136[4];
      *(_DWORD *)v135 = v137;
      return a1;
    }
    sub_240309448((uint64_t)v103, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
    goto LABEL_34;
  }
  if (v106)
  {
LABEL_34:
    v115 = sub_240308D40(&qword_256FF5640);
    memcpy(v103, v104, *(_QWORD *)(*(_QWORD *)(v115 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v177 + 16))(v103, v104, v6);
  v103[v74[5]] = v104[v74[5]];
  v107 = v74[6];
  v108 = &v103[v107];
  v109 = &v104[v107];
  *(_QWORD *)v108 = *(_QWORD *)v109;
  *((_QWORD *)v108 + 1) = *((_QWORD *)v109 + 1);
  v110 = v74[7];
  v111 = &v103[v110];
  v112 = &v104[v110];
  v113 = v112[4];
  *(_DWORD *)v111 = *(_DWORD *)v112;
  v111[4] = v113;
  v114 = *(void (**)(char *, _QWORD, uint64_t, int *))(v75 + 56);
  swift_bridgeObjectRetain();
  v114(v103, 0, 1, v74);
  return a1;
}

uint64_t sub_240310BB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  char *v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  int *v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, int *);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void (*v58)(char *, char *, uint64_t);

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5648);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v56 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    v57 = v9;
    v15 = &v9[v14];
    v16 = v7;
    v17 = &v10[v14];
    v18 = v6;
    v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v55 = *((_QWORD *)v19 - 1);
    v58 = (void (*)(char *, char *, uint64_t))v16;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v55 + 48))(v17, 1, v19))
    {
      v20 = sub_240308D40(&qword_256FF5430);
      memcpy(v15, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v16((uint64_t)v15, (uint64_t)v17, v18);
      *(_OWORD *)&v15[v19[5]] = *(_OWORD *)&v17[v19[5]];
      *(_OWORD *)&v15[v19[6]] = *(_OWORD *)&v17[v19[6]];
      *(_OWORD *)&v15[v19[7]] = *(_OWORD *)&v17[v19[7]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v55 + 56))(v15, 0, 1, v19);
    }
    v21 = *(int *)(v11 + 24);
    v22 = &v57[v21];
    v23 = &v10[v21];
    v24 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      v26 = sub_240308D40(&qword_256FF5438);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      v6 = v18;
    }
    else
    {
      v6 = v18;
      v58(v22, v23, v18);
      *(_OWORD *)&v22[*(int *)(v24 + 20)] = *(_OWORD *)&v23[*(int *)(v24 + 20)];
      *(_OWORD *)&v22[*(int *)(v24 + 24)] = *(_OWORD *)&v23[*(int *)(v24 + 24)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v57, 0, 1, v11);
    v7 = (void (*)(uint64_t, uint64_t, uint64_t))v58;
  }
  v27 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  v30 = a3[8];
  v31 = (char *)(a1 + v30);
  v32 = (char *)(a2 + v30);
  v33 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v34 = *((_QWORD *)v33 - 1);
  v35 = *(unsigned int (**)(char *, uint64_t, int *))(v34 + 48);
  if (v35(v32, 1, v33))
  {
    v36 = sub_240308D40(&qword_256FF5640);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v31, (uint64_t)v32, v6);
    v31[v33[5]] = v32[v33[5]];
    *(_OWORD *)&v31[v33[6]] = *(_OWORD *)&v32[v33[6]];
    v37 = v33[7];
    v38 = &v31[v37];
    v39 = &v32[v37];
    v38[4] = v39[4];
    *(_DWORD *)v38 = *(_DWORD *)v39;
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v34 + 56))(v31, 0, 1, v33);
  }
  v40 = a3[9];
  v41 = (char *)(a1 + v40);
  v42 = (char *)(a2 + v40);
  if (v35((char *)(a2 + v40), 1, v33))
  {
    v43 = sub_240308D40(&qword_256FF5640);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v41, (uint64_t)v42, v6);
    v41[v33[5]] = v42[v33[5]];
    *(_OWORD *)&v41[v33[6]] = *(_OWORD *)&v42[v33[6]];
    v44 = v33[7];
    v45 = &v41[v44];
    v46 = &v42[v44];
    v45[4] = v46[4];
    *(_DWORD *)v45 = *(_DWORD *)v46;
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v34 + 56))(v41, 0, 1, v33);
  }
  v47 = a3[10];
  v48 = (char *)(a1 + v47);
  v49 = (char *)(a2 + v47);
  if (v35(v49, 1, v33))
  {
    v50 = sub_240308D40(&qword_256FF5640);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v48, (uint64_t)v49, v6);
    v48[v33[5]] = v49[v33[5]];
    *(_OWORD *)&v48[v33[6]] = *(_OWORD *)&v49[v33[6]];
    v51 = v33[7];
    v52 = &v48[v51];
    v53 = &v49[v51];
    v52[4] = v53[4];
    *(_DWORD *)v52 = *(_DWORD *)v53;
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v34 + 56))(v48, 0, 1, v33);
  }
  return a1;
}

uint64_t sub_24031102C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int *v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, int *);
  int v30;
  size_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(char *, uint64_t, uint64_t);
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  _BYTE *v73;
  int *v74;
  uint64_t v75;
  uint64_t (*v76)(_BYTE *, uint64_t, int *);
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  _BYTE *v86;
  int v87;
  int v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  _BYTE *v95;
  int v96;
  int v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v103;
  _QWORD *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  _QWORD *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(char *, char *, uint64_t);
  uint64_t v138;
  uint64_t v139;
  void (*v140)(uint64_t, uint64_t);
  uint64_t v141;
  int *v142;
  uint64_t v143;

  v6 = sub_240316094();
  v141 = *(_QWORD *)(v6 - 8);
  v143 = v6;
  v140 = *(void (**)(uint64_t, uint64_t))(v141 + 40);
  v140(a1, a2);
  v142 = a3;
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_240309448((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    ((void (*)(char *, char *, uint64_t))v140)(v8, v9, v143);
    v24 = *(int *)(v10 + 20);
    v25 = &v8[v24];
    v26 = &v9[v24];
    v27 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v28 = *((_QWORD *)v27 - 1);
    v29 = *(uint64_t (**)(char *, uint64_t, int *))(v28 + 48);
    v139 = (uint64_t)v25;
    LODWORD(v25) = v29(v25, 1, v27);
    v30 = v29(v26, 1, v27);
    if ((_DWORD)v25)
    {
      if (v30)
      {
        v31 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
        v32 = (void *)v139;
LABEL_18:
        memcpy(v32, v26, v31);
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v141 + 32))(v139, v26, v143);
      *(_OWORD *)(v139 + v27[5]) = *(_OWORD *)&v26[v27[5]];
      *(_OWORD *)(v139 + v27[6]) = *(_OWORD *)&v26[v27[6]];
      *(_OWORD *)(v139 + v27[7]) = *(_OWORD *)&v26[v27[7]];
      (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v28 + 56))(v139, 0, 1, v27);
    }
    else
    {
      if (v30)
      {
        sub_240309448(v139, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
        v31 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
        v32 = (void *)v139;
        goto LABEL_18;
      }
      ((void (*)(uint64_t, char *, uint64_t))v140)(v139, v26, v143);
      v39 = v27[5];
      v40 = (_QWORD *)(v139 + v39);
      v41 = &v26[v39];
      v43 = *(_QWORD *)v41;
      v42 = *((_QWORD *)v41 + 1);
      *v40 = v43;
      v40[1] = v42;
      swift_bridgeObjectRelease();
      v44 = v27[6];
      v45 = (_QWORD *)(v139 + v44);
      v46 = &v26[v44];
      v48 = *(_QWORD *)v46;
      v47 = *((_QWORD *)v46 + 1);
      *v45 = v48;
      v45[1] = v47;
      swift_bridgeObjectRelease();
      v49 = v27[7];
      v50 = (_QWORD *)(v139 + v49);
      v51 = &v26[v49];
      v53 = *(_QWORD *)v51;
      v52 = *((_QWORD *)v51 + 1);
      *v50 = v53;
      v50[1] = v52;
      swift_bridgeObjectRelease();
    }
LABEL_21:
    v54 = *(int *)(v10 + 24);
    v55 = &v8[v54];
    v56 = &v9[v54];
    v57 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v58 = *(_QWORD *)(v57 - 8);
    v59 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48);
    v60 = v59(v55, 1, v57);
    v61 = v59(v56, 1, v57);
    if (v60)
    {
      v23 = v142;
      if (!v61)
      {
        (*(void (**)(char *, char *, uint64_t))(v141 + 32))(v55, v56, v143);
        *(_OWORD *)&v55[*(int *)(v57 + 20)] = *(_OWORD *)&v56[*(int *)(v57 + 20)];
        *(_OWORD *)&v55[*(int *)(v57 + 24)] = *(_OWORD *)&v56[*(int *)(v57 + 24)];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
        goto LABEL_27;
      }
    }
    else
    {
      v23 = v142;
      if (!v61)
      {
        ((void (*)(char *, char *, uint64_t))v140)(v55, v56, v143);
        v127 = *(int *)(v57 + 20);
        v128 = &v55[v127];
        v129 = &v56[v127];
        v131 = *(_QWORD *)v129;
        v130 = *((_QWORD *)v129 + 1);
        *(_QWORD *)v128 = v131;
        *((_QWORD *)v128 + 1) = v130;
        swift_bridgeObjectRelease();
        v132 = *(int *)(v57 + 24);
        v133 = &v55[v132];
        v134 = &v56[v132];
        v136 = *(_QWORD *)v134;
        v135 = *((_QWORD *)v134 + 1);
        *(_QWORD *)v133 = v136;
        *((_QWORD *)v133 + 1) = v135;
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      sub_240309448((uint64_t)v55, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    }
    v62 = sub_240308D40(&qword_256FF5438);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
    goto LABEL_27;
  }
  if (v14)
  {
LABEL_7:
    v22 = sub_240308D40(&qword_256FF5648);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    v23 = v142;
    goto LABEL_27;
  }
  v138 = a2;
  v15 = *(void (**)(char *, char *, uint64_t))(v141 + 32);
  v15(v8, v9, v143);
  v16 = *(int *)(v10 + 20);
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v20 = *((_QWORD *)v19 - 1);
  v137 = v15;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
  {
    v21 = sub_240308D40(&qword_256FF5430);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v15(v17, v18, v143);
    *(_OWORD *)&v17[v19[5]] = *(_OWORD *)&v18[v19[5]];
    *(_OWORD *)&v17[v19[6]] = *(_OWORD *)&v18[v19[6]];
    *(_OWORD *)&v17[v19[7]] = *(_OWORD *)&v18[v19[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
  }
  v33 = *(int *)(v10 + 24);
  v34 = &v8[v33];
  v35 = &v9[v33];
  v36 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v37 = *(_QWORD *)(v36 - 8);
  a2 = v138;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    v38 = sub_240308D40(&qword_256FF5438);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    v137(v34, v35, v143);
    *(_OWORD *)&v34[*(int *)(v36 + 20)] = *(_OWORD *)&v35[*(int *)(v36 + 20)];
    *(_OWORD *)&v34[*(int *)(v36 + 24)] = *(_OWORD *)&v35[*(int *)(v36 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  v23 = v142;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_27:
  v63 = v23[6];
  v64 = (_QWORD *)(a1 + v63);
  v65 = (uint64_t *)(a2 + v63);
  v67 = *v65;
  v66 = v65[1];
  *v64 = v67;
  v64[1] = v66;
  swift_bridgeObjectRelease();
  v68 = v23[7];
  v69 = v23[8];
  v70 = a1 + v68;
  v71 = a2 + v68;
  *(_QWORD *)v70 = *(_QWORD *)v71;
  *(_BYTE *)(v70 + 8) = *(_BYTE *)(v71 + 8);
  v72 = (_BYTE *)(a1 + v69);
  v73 = (_BYTE *)(a2 + v69);
  v74 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  v75 = *((_QWORD *)v74 - 1);
  v76 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v75 + 48);
  v77 = v76(v72, 1, v74);
  v78 = v76(v73, 1, v74);
  if (v77)
  {
    if (!v78)
    {
      v79 = v143;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v141 + 32))(v72, v73, v143);
      v72[v74[5]] = v73[v74[5]];
      *(_OWORD *)&v72[v74[6]] = *(_OWORD *)&v73[v74[6]];
      v80 = v74[7];
      v81 = &v72[v80];
      v82 = &v73[v80];
      v81[4] = v82[4];
      *(_DWORD *)v81 = *(_DWORD *)v82;
      (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v75 + 56))(v72, 0, 1, v74);
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (v78)
  {
    sub_240309448((uint64_t)v72, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_32:
    v83 = sub_240308D40(&qword_256FF5640);
    memcpy(v72, v73, *(_QWORD *)(*(_QWORD *)(v83 - 8) + 64));
    v79 = v143;
    goto LABEL_33;
  }
  v79 = v143;
  ((void (*)(_BYTE *, _BYTE *, uint64_t))v140)(v72, v73, v143);
  v72[v74[5]] = v73[v74[5]];
  v103 = v74[6];
  v104 = &v72[v103];
  v105 = (uint64_t *)&v73[v103];
  v107 = *v105;
  v106 = v105[1];
  *v104 = v107;
  v104[1] = v106;
  swift_bridgeObjectRelease();
  v108 = v74[7];
  v109 = &v72[v108];
  v110 = &v73[v108];
  *(_DWORD *)v109 = *(_DWORD *)v110;
  v109[4] = v110[4];
LABEL_33:
  v84 = v23[9];
  v85 = (_BYTE *)(a1 + v84);
  v86 = (_BYTE *)(a2 + v84);
  v87 = v76((_BYTE *)(a1 + v84), 1, v74);
  v88 = v76(v86, 1, v74);
  if (v87)
  {
    if (!v88)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v141 + 32))(v85, v86, v79);
      v85[v74[5]] = v86[v74[5]];
      *(_OWORD *)&v85[v74[6]] = *(_OWORD *)&v86[v74[6]];
      v89 = v74[7];
      v90 = &v85[v89];
      v91 = &v86[v89];
      v90[4] = v91[4];
      *(_DWORD *)v90 = *(_DWORD *)v91;
      (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v75 + 56))(v85, 0, 1, v74);
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v88)
  {
    sub_240309448((uint64_t)v85, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_38:
    v92 = sub_240308D40(&qword_256FF5640);
    memcpy(v85, v86, *(_QWORD *)(*(_QWORD *)(v92 - 8) + 64));
    goto LABEL_39;
  }
  ((void (*)(_BYTE *, _BYTE *, uint64_t))v140)(v85, v86, v79);
  v85[v74[5]] = v86[v74[5]];
  v111 = v74[6];
  v112 = &v85[v111];
  v113 = (uint64_t *)&v86[v111];
  v115 = *v113;
  v114 = v113[1];
  *v112 = v115;
  v112[1] = v114;
  swift_bridgeObjectRelease();
  v116 = v74[7];
  v117 = &v85[v116];
  v118 = &v86[v116];
  *(_DWORD *)v117 = *(_DWORD *)v118;
  v117[4] = v118[4];
LABEL_39:
  v93 = v23[10];
  v94 = (_BYTE *)(a1 + v93);
  v95 = (_BYTE *)(a2 + v93);
  v96 = v76((_BYTE *)(a1 + v93), 1, v74);
  v97 = v76(v95, 1, v74);
  if (!v96)
  {
    if (!v97)
    {
      ((void (*)(_BYTE *, _BYTE *, uint64_t))v140)(v94, v95, v79);
      v94[v74[5]] = v95[v74[5]];
      v119 = v74[6];
      v120 = &v94[v119];
      v121 = (uint64_t *)&v95[v119];
      v123 = *v121;
      v122 = v121[1];
      *v120 = v123;
      v120[1] = v122;
      swift_bridgeObjectRelease();
      v124 = v74[7];
      v125 = &v94[v124];
      v126 = &v95[v124];
      *(_DWORD *)v125 = *(_DWORD *)v126;
      v125[4] = v126[4];
      return a1;
    }
    sub_240309448((uint64_t)v94, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
    goto LABEL_44;
  }
  if (v97)
  {
LABEL_44:
    v101 = sub_240308D40(&qword_256FF5640);
    memcpy(v94, v95, *(_QWORD *)(*(_QWORD *)(v101 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v141 + 32))(v94, v95, v79);
  v94[v74[5]] = v95[v74[5]];
  *(_OWORD *)&v94[v74[6]] = *(_OWORD *)&v95[v74[6]];
  v98 = v74[7];
  v99 = &v94[v98];
  v100 = &v95[v98];
  v99[4] = v100[4];
  *(_DWORD *)v99 = *(_DWORD *)v100;
  (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v75 + 56))(v94, 0, 1, v74);
  return a1;
}

uint64_t sub_24031194C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240311958(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_240308D40(&qword_256FF5648);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = sub_240308D40(&qword_256FF5640);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t sub_240311A3C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240311A48(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_240316094();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_240308D40(&qword_256FF5648);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[6] + 8) = a2;
        return result;
      }
      v10 = sub_240308D40(&qword_256FF5640);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_240311B1C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_240316094();
  if (v0 <= 0x3F)
  {
    sub_240303E98(319, &qword_256FF5308, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    if (v1 <= 0x3F)
    {
      sub_240303E98(319, &qword_256FF56D0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

_QWORD *sub_240311BF4(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v13[4] = v14[4];
    *(_DWORD *)v13 = *(_DWORD *)v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_240311CAC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_240311CF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)(v12 + 4) = *(_BYTE *)(v13 + 4);
  *(_DWORD *)v12 = *(_DWORD *)v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_240311D80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  int v13;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = (int *)(a2 + v10);
  v13 = *v12;
  *(_BYTE *)(v11 + 4) = *((_BYTE *)v12 + 4);
  *(_DWORD *)v11 = v13;
  return a1;
}

uint64_t sub_240311E24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_BYTE *)(v9 + 4) = *(_BYTE *)(v10 + 4);
  *(_DWORD *)v9 = *(_DWORD *)v10;
  return a1;
}

uint64_t sub_240311EA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_240316094();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_BYTE *)(v13 + 4) = *(_BYTE *)(v14 + 4);
  return a1;
}

uint64_t sub_240311F34()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240311F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_240311FD0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240311FE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_240316094();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t sub_24031205C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240316094();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_2403120E0(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t, int *);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  char *__dst;
  char *v60;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240316094();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = sub_240308D40(&qword_256FF5648);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v58 = v13;
      v8(v10, v11, v7);
      v16 = *(int *)(v12 + 20);
      __dst = &v10[v16];
      v60 = v10;
      v17 = &v11[v16];
      v18 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      v19 = *((_QWORD *)v18 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v19 + 48))(v17, 1, v18))
      {
        v20 = sub_240308D40(&qword_256FF5430);
        memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        v8(__dst, v17, v7);
        v21 = v18[5];
        v22 = &__dst[v21];
        v23 = &v17[v21];
        v24 = *((_QWORD *)v23 + 1);
        *(_QWORD *)v22 = *(_QWORD *)v23;
        *((_QWORD *)v22 + 1) = v24;
        v25 = v18[6];
        v26 = &__dst[v25];
        v27 = &v17[v25];
        v57 = *((_QWORD *)v27 + 1);
        *(_QWORD *)v26 = *(_QWORD *)v27;
        *((_QWORD *)v26 + 1) = v57;
        v28 = v18[7];
        v29 = &__dst[v28];
        v30 = &v17[v28];
        v31 = *((_QWORD *)v30 + 1);
        *(_QWORD *)v29 = *(_QWORD *)v30;
        *((_QWORD *)v29 + 1) = v31;
        v32 = *(void (**)(char *, _QWORD, uint64_t, int *))(v19 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v32(__dst, 0, 1, v18);
      }
      v33 = *(int *)(v12 + 24);
      v34 = &v60[v33];
      v35 = &v11[v33];
      v36 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      v37 = *(_QWORD *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        v38 = sub_240308D40(&qword_256FF5438);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      }
      else
      {
        v8(v34, v35, v7);
        v39 = *(int *)(v36 + 20);
        v40 = &v34[v39];
        v41 = &v35[v39];
        v42 = *((_QWORD *)v41 + 1);
        *(_QWORD *)v40 = *(_QWORD *)v41;
        *((_QWORD *)v40 + 1) = v42;
        v43 = *(int *)(v36 + 24);
        v44 = &v34[v43];
        v45 = &v35[v43];
        v46 = *((_QWORD *)v45 + 1);
        *(_QWORD *)v44 = *(_QWORD *)v45;
        *((_QWORD *)v44 + 1) = v46;
        v47 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v47(v34, 0, 1, v36);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v60, 0, 1, v12);
    }
    v48 = a3[6];
    v49 = a3[7];
    v50 = &a1[v48];
    v51 = &a2[v48];
    v52 = *((_QWORD *)v51 + 1);
    *(_QWORD *)v50 = *(_QWORD *)v51;
    *((_QWORD *)v50 + 1) = v52;
    v53 = &a1[v49];
    v54 = &a2[v49];
    v53[8] = v54[8];
    *(_QWORD *)v53 = *(_QWORD *)v54;
    v55 = a3[9];
    a1[a3[8]] = a2[a3[8]];
    a1[v55] = a2[v55];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2403123E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_240316094();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    v8 = v6 + *(int *)(v7 + 20);
    v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
    {
      v5(v8, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v10 = v6 + *(int *)(v7 + 24);
    v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
    {
      v5(v10, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_240312550(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, _QWORD, uint64_t, int *);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  char *__dst;
  char *v58;

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5648);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v56 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    __dst = &v9[v14];
    v58 = v9;
    v15 = &v10[v14];
    v16 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v17 = *((_QWORD *)v16 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v17 + 48))(v15, 1, v16))
    {
      v18 = sub_240308D40(&qword_256FF5430);
      memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v15, v6);
      v19 = v16[5];
      v20 = &__dst[v19];
      v21 = &v15[v19];
      v22 = *((_QWORD *)v21 + 1);
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = v22;
      v23 = v16[6];
      v24 = &__dst[v23];
      v25 = &v15[v23];
      v55 = *((_QWORD *)v25 + 1);
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *((_QWORD *)v24 + 1) = v55;
      v26 = v16[7];
      v27 = &__dst[v26];
      v28 = &v15[v26];
      v29 = *((_QWORD *)v28 + 1);
      *(_QWORD *)v27 = *(_QWORD *)v28;
      *((_QWORD *)v27 + 1) = v29;
      v30 = *(void (**)(char *, _QWORD, uint64_t, int *))(v17 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30(__dst, 0, 1, v16);
    }
    v31 = *(int *)(v11 + 24);
    v32 = &v58[v31];
    v33 = &v10[v31];
    v34 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = sub_240308D40(&qword_256FF5438);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v32, (uint64_t)v33, v6);
      v37 = *(int *)(v34 + 20);
      v38 = &v32[v37];
      v39 = &v33[v37];
      v40 = *((_QWORD *)v39 + 1);
      *(_QWORD *)v38 = *(_QWORD *)v39;
      *((_QWORD *)v38 + 1) = v40;
      v41 = *(int *)(v34 + 24);
      v42 = &v32[v41];
      v43 = &v33[v41];
      v44 = *((_QWORD *)v43 + 1);
      *(_QWORD *)v42 = *(_QWORD *)v43;
      *((_QWORD *)v42 + 1) = v44;
      v45 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45(v32, 0, 1, v34);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v58, 0, 1, v11);
  }
  v46 = a3[6];
  v47 = a3[7];
  v48 = (_QWORD *)(a1 + v46);
  v49 = (_QWORD *)(a2 + v46);
  v50 = v49[1];
  *v48 = *v49;
  v48[1] = v50;
  v51 = a1 + v47;
  v52 = a2 + v47;
  *(_BYTE *)(v51 + 8) = *(_BYTE *)(v52 + 8);
  *(_QWORD *)v51 = *(_QWORD *)v52;
  v53 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v53) = *(_BYTE *)(a2 + v53);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24031282C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  int v14;
  int v15;
  void (*v16)(uint64_t, char *, uint64_t);
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int *v27;
  uint64_t (*v28)(uint64_t, uint64_t, int *);
  int v29;
  size_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void (*v41)(char *, _QWORD, uint64_t, int *);
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  void (*v54)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  _QWORD *v70;
  char *v71;
  uint64_t v72;
  _QWORD *v73;
  char *v74;
  uint64_t v75;
  _QWORD *v76;
  char *v77;
  uint64_t v78;
  _QWORD *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t, uint64_t);
  int v87;
  int v88;
  uint64_t v89;
  _QWORD *v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  char *v94;
  void (*v95)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v96;
  _QWORD *v97;
  char *v98;
  uint64_t v99;
  _QWORD *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*__src)(char *, char *, uint64_t);
  void (*__srca)(uint64_t, _QWORD, uint64_t, int *);
  int *v107;
  void (*v108)(uint64_t, char *, uint64_t);
  _QWORD *__dst;
  char *__dsta;
  uint64_t v111;

  v6 = sub_240316094();
  __dst = *(_QWORD **)(v6 - 8);
  v111 = v6;
  v7 = (void (*)(uint64_t, uint64_t))__dst[3];
  v7(a1, a2);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13((uint64_t)v10, 1, v11);
  if (!v14)
  {
    v108 = (void (*)(uint64_t, char *, uint64_t))v7;
    if (v15)
    {
      sub_240309448(v9, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    ((void (*)(uint64_t, char *, uint64_t))v7)(v9, v10, v111);
    v24 = *(int *)(v11 + 20);
    v25 = v9 + v24;
    v26 = &v10[v24];
    v27 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v102 = *((_QWORD *)v27 - 1);
    v104 = v25;
    v28 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v102 + 48);
    LODWORD(v25) = v28(v25, 1, v27);
    v29 = v28((uint64_t)v26, 1, v27);
    if ((_DWORD)v25)
    {
      if (!v29)
      {
        ((void (*)(uint64_t, char *, uint64_t))__dst[2])(v104, v26, v111);
        v63 = v27[5];
        v64 = (_QWORD *)(v104 + v63);
        v65 = &v26[v63];
        *v64 = *(_QWORD *)v65;
        v64[1] = *((_QWORD *)v65 + 1);
        v66 = v27[6];
        v67 = (_QWORD *)(v104 + v66);
        v68 = &v26[v66];
        *v67 = *(_QWORD *)v68;
        v67[1] = *((_QWORD *)v68 + 1);
        v69 = v27[7];
        v70 = (_QWORD *)(v104 + v69);
        v71 = &v26[v69];
        *v70 = *(_QWORD *)v71;
        v70[1] = *((_QWORD *)v71 + 1);
        __srca = *(void (**)(uint64_t, _QWORD, uint64_t, int *))(v102 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        __srca(v104, 0, 1, v27);
        goto LABEL_23;
      }
      v30 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
      v31 = (void *)v104;
    }
    else
    {
      if (!v29)
      {
        v108(v104, v26, v111);
        v72 = v27[5];
        v73 = (_QWORD *)(v104 + v72);
        v74 = &v26[v72];
        *v73 = *(_QWORD *)v74;
        v73[1] = *((_QWORD *)v74 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v75 = v27[6];
        v76 = (_QWORD *)(v104 + v75);
        v77 = &v26[v75];
        *v76 = *(_QWORD *)v77;
        v76[1] = *((_QWORD *)v77 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v78 = v27[7];
        v79 = (_QWORD *)(v104 + v78);
        v80 = &v26[v78];
        *v79 = *(_QWORD *)v80;
        v79[1] = *((_QWORD *)v80 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      sub_240309448(v104, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      v30 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
      v31 = (void *)v104;
    }
    memcpy(v31, v26, v30);
LABEL_23:
    v81 = *(int *)(v11 + 24);
    v82 = v9 + v81;
    v83 = &v10[v81];
    v84 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v85 = *(_QWORD *)(v84 - 8);
    v86 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v85 + 48);
    v87 = v86(v82, 1, v84);
    v88 = v86((uint64_t)v83, 1, v84);
    if (v87)
    {
      if (!v88)
      {
        ((void (*)(uint64_t, char *, uint64_t))__dst[2])(v82, v83, v111);
        v89 = *(int *)(v84 + 20);
        v90 = (_QWORD *)(v82 + v89);
        v91 = &v83[v89];
        *v90 = *(_QWORD *)v91;
        v90[1] = *((_QWORD *)v91 + 1);
        v92 = *(int *)(v84 + 24);
        v93 = (_QWORD *)(v82 + v92);
        v94 = &v83[v92];
        *v93 = *(_QWORD *)v94;
        v93[1] = *((_QWORD *)v94 + 1);
        v95 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v85 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v95(v82, 0, 1, v84);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v88)
      {
        v108(v82, v83, v111);
        v96 = *(int *)(v84 + 20);
        v97 = (_QWORD *)(v82 + v96);
        v98 = &v83[v96];
        *v97 = *(_QWORD *)v98;
        v97[1] = *((_QWORD *)v98 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v99 = *(int *)(v84 + 24);
        v100 = (_QWORD *)(v82 + v99);
        v101 = &v83[v99];
        *v100 = *(_QWORD *)v101;
        v100[1] = *((_QWORD *)v101 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      sub_240309448(v82, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    }
    v21 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5438) - 8) + 64);
    v22 = (void *)v82;
    v23 = v83;
    goto LABEL_8;
  }
  if (v15)
  {
LABEL_7:
    v21 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5648) - 8) + 64);
    v22 = (void *)v9;
    v23 = v10;
LABEL_8:
    memcpy(v22, v23, v21);
    goto LABEL_17;
  }
  v107 = a3;
  v16 = (void (*)(uint64_t, char *, uint64_t))__dst[2];
  v16(v9, v10, v111);
  v17 = *(int *)(v11 + 20);
  __dsta = (char *)(v9 + v17);
  v18 = &v10[v17];
  v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  v103 = *((_QWORD *)v19 - 1);
  __src = (void (*)(char *, char *, uint64_t))v16;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v103 + 48))(v18, 1, v19))
  {
    v20 = sub_240308D40(&qword_256FF5430);
    memcpy(__dsta, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v16((uint64_t)__dsta, v18, v111);
    v32 = v19[5];
    v33 = &__dsta[v32];
    v34 = &v18[v32];
    *(_QWORD *)v33 = *(_QWORD *)v34;
    *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
    v35 = v19[6];
    v36 = &__dsta[v35];
    v37 = &v18[v35];
    *(_QWORD *)v36 = *(_QWORD *)v37;
    *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
    v38 = v19[7];
    v39 = &__dsta[v38];
    v40 = &v18[v38];
    *(_QWORD *)v39 = *(_QWORD *)v40;
    *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
    v41 = *(void (**)(char *, _QWORD, uint64_t, int *))(v103 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(__dsta, 0, 1, v19);
  }
  v42 = *(int *)(v11 + 24);
  v43 = (char *)(v9 + v42);
  v44 = &v10[v42];
  v45 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v46 = *(_QWORD *)(v45 - 8);
  a3 = v107;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
  {
    v47 = sub_240308D40(&qword_256FF5438);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
  }
  else
  {
    __src(v43, v44, v111);
    v48 = *(int *)(v45 + 20);
    v49 = &v43[v48];
    v50 = &v44[v48];
    *(_QWORD *)v49 = *(_QWORD *)v50;
    *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
    v51 = *(int *)(v45 + 24);
    v52 = &v43[v51];
    v53 = &v44[v51];
    *(_QWORD *)v52 = *(_QWORD *)v53;
    *((_QWORD *)v52 + 1) = *((_QWORD *)v53 + 1);
    v54 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v54(v43, 0, 1, v45);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_17:
  v55 = a3[6];
  v56 = (_QWORD *)(a1 + v55);
  v57 = (_QWORD *)(a2 + v55);
  *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = a3[7];
  v59 = a1 + v58;
  v60 = (uint64_t *)(a2 + v58);
  v61 = *v60;
  *(_BYTE *)(v59 + 8) = *((_BYTE *)v60 + 8);
  *(_QWORD *)v59 = v61;
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_240312EF8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;

  v6 = sub_240316094();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_240308D40(&qword_256FF5648);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v31 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    v32 = v9;
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v30 = *((_QWORD *)v17 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v30 + 48))(v16, 1, v17))
    {
      v18 = sub_240308D40(&qword_256FF5430);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      *(_OWORD *)&v15[v17[5]] = *(_OWORD *)&v16[v17[5]];
      *(_OWORD *)&v15[v17[6]] = *(_OWORD *)&v16[v17[6]];
      *(_OWORD *)&v15[v17[7]] = *(_OWORD *)&v16[v17[7]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v30 + 56))(v15, 0, 1, v17);
    }
    v19 = *(int *)(v11 + 24);
    v20 = &v32[v19];
    v21 = &v10[v19];
    v22 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = sub_240308D40(&qword_256FF5438);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v20, (uint64_t)v21, v6);
      *(_OWORD *)&v20[*(int *)(v22 + 20)] = *(_OWORD *)&v21[*(int *)(v22 + 20)];
      *(_OWORD *)&v20[*(int *)(v22 + 24)] = *(_OWORD *)&v21[*(int *)(v22 + 24)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v11);
  }
  v25 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v26 = a1 + v25;
  v27 = a2 + v25;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  *(_BYTE *)(v26 + 8) = *(_BYTE *)(v27 + 8);
  v28 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  return a1;
}

uint64_t sub_240313174(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  int v14;
  int v15;
  void (*v16)(uint64_t, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  int *v20;
  uint64_t v21;
  size_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int *v28;
  uint64_t (*v29)(uint64_t, uint64_t, int *);
  int v30;
  size_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  int v70;
  int v71;
  uint64_t v72;
  _QWORD *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (**__src)(void *, _QWORD, uint64_t, int *);
  int *v85;
  void (*v86)(uint64_t, char *, uint64_t);
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  uint64_t v89;

  v6 = sub_240316094();
  v87 = *(_QWORD *)(v6 - 8);
  v89 = v6;
  v7 = *(void (**)(uint64_t, uint64_t))(v87 + 40);
  v7(a1, a2);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13((uint64_t)v10, 1, v11);
  if (!v14)
  {
    v86 = (void (*)(uint64_t, char *, uint64_t))v7;
    if (v15)
    {
      sub_240309448(v9, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    ((void (*)(uint64_t, char *, uint64_t))v7)(v9, v10, v89);
    v25 = *(int *)(v11 + 20);
    v26 = v9 + v25;
    v27 = &v10[v25];
    v28 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    v82 = *((_QWORD *)v28 - 1);
    v83 = v26;
    v29 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v82 + 48);
    LODWORD(v26) = v29(v26, 1, v28);
    v30 = v29((uint64_t)v27, 1, v28);
    if ((_DWORD)v26)
    {
      if (!v30)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v83, v27, v89);
        *(_OWORD *)(v83 + v28[5]) = *(_OWORD *)&v27[v28[5]];
        *(_OWORD *)(v83 + v28[6]) = *(_OWORD *)&v27[v28[6]];
        *(_OWORD *)(v83 + v28[7]) = *(_OWORD *)&v27[v28[7]];
        (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v82 + 56))(v83, 0, 1, v28);
        goto LABEL_23;
      }
      v31 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
      v32 = (void *)v83;
    }
    else
    {
      if (!v30)
      {
        v86(v83, v27, v89);
        v49 = v28[5];
        v50 = (_QWORD *)(v83 + v49);
        v51 = &v27[v49];
        v53 = *(_QWORD *)v51;
        v52 = *((_QWORD *)v51 + 1);
        *v50 = v53;
        v50[1] = v52;
        swift_bridgeObjectRelease();
        v54 = v28[6];
        v55 = (_QWORD *)(v83 + v54);
        v56 = &v27[v54];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        *v55 = v58;
        v55[1] = v57;
        swift_bridgeObjectRelease();
        v59 = v28[7];
        v60 = (_QWORD *)(v83 + v59);
        v61 = &v27[v59];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        *v60 = v63;
        v60[1] = v62;
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      sub_240309448(v83, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      v31 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5430) - 8) + 64);
      v32 = (void *)v83;
    }
    memcpy(v32, v27, v31);
LABEL_23:
    v64 = *(int *)(v11 + 24);
    v65 = v9 + v64;
    v66 = &v10[v64];
    v67 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    v68 = *(_QWORD *)(v67 - 8);
    v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
    v70 = v69(v65, 1, v67);
    v71 = v69((uint64_t)v66, 1, v67);
    if (v70)
    {
      if (!v71)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v65, v66, v89);
        *(_OWORD *)(v65 + *(int *)(v67 + 20)) = *(_OWORD *)&v66[*(int *)(v67 + 20)];
        *(_OWORD *)(v65 + *(int *)(v67 + 24)) = *(_OWORD *)&v66[*(int *)(v67 + 24)];
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v71)
      {
        v86(v65, v66, v89);
        v72 = *(int *)(v67 + 20);
        v73 = (_QWORD *)(v65 + v72);
        v74 = &v66[v72];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        *v73 = v76;
        v73[1] = v75;
        swift_bridgeObjectRelease();
        v77 = *(int *)(v67 + 24);
        v78 = (_QWORD *)(v65 + v77);
        v79 = &v66[v77];
        v81 = *(_QWORD *)v79;
        v80 = *((_QWORD *)v79 + 1);
        *v78 = v81;
        v78[1] = v80;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      sub_240309448(v65, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    }
    v22 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5438) - 8) + 64);
    v23 = (void *)v65;
    v24 = v66;
    goto LABEL_8;
  }
  if (v15)
  {
LABEL_7:
    v22 = *(_QWORD *)(*(_QWORD *)(sub_240308D40(&qword_256FF5648) - 8) + 64);
    v23 = (void *)v9;
    v24 = v10;
LABEL_8:
    memcpy(v23, v24, v22);
    goto LABEL_17;
  }
  v85 = a3;
  v16 = *(void (**)(uint64_t, char *, uint64_t))(v87 + 32);
  v16(v9, v10, v89);
  v17 = *(int *)(v11 + 20);
  v18 = (char *)(v9 + v17);
  v19 = &v10[v17];
  v20 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  __src = (void (**)(void *, _QWORD, uint64_t, int *))*((_QWORD *)v20 - 1);
  v88 = (void (*)(char *, char *, uint64_t))v16;
  if (((unsigned int (*)(char *, uint64_t, int *))__src[6])(v19, 1, v20))
  {
    v21 = sub_240308D40(&qword_256FF5430);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v16((uint64_t)v18, v19, v89);
    *(_OWORD *)&v18[v20[5]] = *(_OWORD *)&v19[v20[5]];
    *(_OWORD *)&v18[v20[6]] = *(_OWORD *)&v19[v20[6]];
    *(_OWORD *)&v18[v20[7]] = *(_OWORD *)&v19[v20[7]];
    __src[7](v18, 0, 1, v20);
  }
  v33 = *(int *)(v11 + 24);
  v34 = (char *)(v9 + v33);
  v35 = &v10[v33];
  v36 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  v37 = *(_QWORD *)(v36 - 8);
  a3 = v85;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    v38 = sub_240308D40(&qword_256FF5438);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    v88(v34, v35, v89);
    *(_OWORD *)&v34[*(int *)(v36 + 20)] = *(_OWORD *)&v35[*(int *)(v36 + 20)];
    *(_OWORD *)&v34[*(int *)(v36 + 24)] = *(_OWORD *)&v35[*(int *)(v36 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_17:
  v39 = a3[6];
  v40 = (_QWORD *)(a1 + v39);
  v41 = (uint64_t *)(a2 + v39);
  v43 = *v41;
  v42 = v41[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  v44 = a3[7];
  v45 = a3[8];
  v46 = a1 + v44;
  v47 = a2 + v44;
  *(_QWORD *)v46 = *(_QWORD *)v47;
  *(_BYTE *)(v46 + 8) = *(_BYTE *)(v47 + 8);
  *(_BYTE *)(a1 + v45) = *(_BYTE *)(a2 + v45);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2403136D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2403136E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = sub_240316094();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_240308D40(&qword_256FF5648);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t sub_2403137A0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2403137AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_240316094();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_240308D40(&qword_256FF5648);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

void sub_240313858()
{
  unint64_t v0;
  unint64_t v1;

  sub_240316094();
  if (v0 <= 0x3F)
  {
    sub_240303E98(319, &qword_256FF5308, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2403139F0 + 4 * byte_240318B8F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_240313A24 + 4 * byte_240318B8A[v4]))();
}

uint64_t sub_240313A24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240313A2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240313A34);
  return result;
}

uint64_t sub_240313A40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240313A48);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_240313A4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240313A54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240313A60(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_240313A68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType()
{
  return &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType;
}

unint64_t sub_240313A84()
{
  unint64_t result;

  result = qword_256FF56F8;
  if (!qword_256FF56F8)
  {
    result = MEMORY[0x242682A44](&unk_240319E44, &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_256FF56F8);
  }
  return result;
}

unint64_t sub_240313ACC()
{
  unint64_t result;

  result = qword_256FF5700;
  if (!qword_256FF5700)
  {
    result = MEMORY[0x242682A44](&unk_240319E04, &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_256FF5700);
  }
  return result;
}

unint64_t sub_240313B14()
{
  unint64_t result;

  result = qword_256FF5708;
  if (!qword_256FF5708)
  {
    result = MEMORY[0x242682A44](&unk_240319DCC, &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_256FF5708);
  }
  return result;
}

uint64_t static LBFProtoToJson_swift.serializeBitacoraStateToJson(protoData:)(uint64_t a1)
{
  return sub_240314130(a1, (uint64_t *)&unk_256FF5730, type metadata accessor for LighthouseBitacoraProto_BitacoraState, &qword_256FF54A0, (uint64_t)&unk_240318F68);
}

uint64_t static LBFProtoToJson_swift.serializeBitacoraBitacoraMlruntimedEventToJson(protoData:)(uint64_t a1)
{
  return sub_240314130(a1, &qword_256FF5728, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, &qword_256FF5520, (uint64_t)&unk_240319530);
}

uint64_t static LBFProtoToJson_swift.serializeBitacoraLighthousePluginEventToJson(protoData:)(uint64_t a1)
{
  return sub_240314130(a1, &qword_256FF5720, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent, &qword_256FF5560, (uint64_t)&unk_240319800);
}

uint64_t static LBFProtoToJson_swift.serializeBitacoraTrialdEventToJson(protoData:)(uint64_t a1)
{
  return sub_240314130(a1, &qword_256FF5710, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent, &qword_256FF54C0, (uint64_t)&unk_2403190F8);
}

id sub_240313CCC(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t (*a5)(_QWORD), unint64_t *a6, uint64_t a7)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v11 = a3;
  sub_240314130((uint64_t)v11, a4, a5, a6, a7);
  v13 = v12;

  if (v13)
  {
    v14 = (void *)sub_240316238();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

id LBFProtoToJson_swift.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LBFProtoToJson_swift.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LBFProtoToJson_swift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_240313E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v0 = sub_240316268();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24031625C();
  v4 = sub_240316244();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = 0;
  if (v6 >> 60 != 15)
  {
    v8 = (void *)objc_opt_self();
    v9 = (void *)sub_240316064();
    v26 = 0;
    v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v26);

    v11 = v26;
    if (v10)
    {
      sub_24031628C();
      swift_unknownObjectRelease();
      sub_240314444(&v27, v29);
      v12 = sub_240316298();
      v26 = 0;
      v13 = objc_msgSend(v8, sel_dataWithJSONObject_options_error_, v12, 1, &v26);
      swift_unknownObjectRelease();
      v14 = v26;
      if (v13)
      {
        v15 = sub_240316070();
        v17 = v16;

        sub_24031625C();
        v7 = sub_240316250();
        sub_2403143EC(v4, v6);
        sub_240314400(v15, v17);
        sub_240314468((uint64_t)&v27);
        return v7;
      }
      v20 = v14;
      v19 = (void *)sub_240316058();

      swift_willThrow();
      sub_2403143EC(v4, v6);
      sub_240314468((uint64_t)&v27);
    }
    else
    {
      v18 = v11;
      v19 = (void *)sub_240316058();

      swift_willThrow();
      sub_2403143EC(v4, v6);
    }
    sub_240308D40(&qword_256FF5718);
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_240318B20;
    v27 = 0x203A726F727245;
    v28 = 0xE700000000000000;
    swift_getErrorValue();
    sub_2403162B0();
    sub_240316274();
    swift_bridgeObjectRelease();
    v22 = v27;
    v23 = v28;
    *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v21 + 32) = v22;
    *(_QWORD *)(v21 + 40) = v23;
    sub_2403162BC();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v7;
}

uint64_t sub_240314130(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), unint64_t *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD);
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD);
  uint64_t *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v28 = a5;
  v25 = sub_2403160B8();
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v24 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2403160D0();
  MEMORY[0x24BDAC7A8](v9);
  v27 = a2;
  v10 = sub_240308D40(a2);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v22 - v15;
  sub_240316070();
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  sub_2403160C4();
  v26 = a3;
  sub_24030CB9C(a4, a3, v28);
  sub_240316178();
  v17 = v23;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  v18 = v26;
  sub_24030D3A0((uint64_t)v12, (uint64_t)v16, v26);
  v19 = v24;
  sub_2403160AC();
  sub_2403160A0();
  sub_240316160();
  v21 = sub_240313E10();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v25);
  sub_240309448((uint64_t)v16, v18);
  return v21;
}

uint64_t type metadata accessor for LBFProtoToJson_swift()
{
  return objc_opt_self();
}

uint64_t sub_2403143EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_240314400(a1, a2);
  return a1;
}

uint64_t sub_240314400(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_240314444(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_240314468(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_240314488()
{
  __assert_rtn("-[LBFStateDetector processEventsStartingFromState:bucketStartTime:events:]", "LBFStateDetector.m", 41, "[events count] > 0");
}

void sub_2403144B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402E3654(&dword_2402DE000, a1, a3, "found earlier mlruntime event why?", a5, a6, a7, a8, 0);
  sub_2402E3664();
}

void sub_2403144E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402E3654(&dword_2402DE000, a1, a3, "found earlier lighthuse pugin event why?", a5, a6, a7, a8, 0);
  sub_2402E3664();
}

void sub_240314510(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402E3654(&dword_2402DE000, a1, a3, "found unknown event why?", a5, a6, a7, a8, 0);
  sub_2402E3664();
}

void sub_240314540(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "flattenedEventsForDeployment is empty", v4);
}

void sub_240314568(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "could not get BMLighthouseLedgerTrialIdentifiers.", v4);
}

void sub_240314590(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "State Info initialization failed.", v4);
}

void sub_2403145B8(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "No identifiers found - prior to event filtering.", v4);
}

void sub_2403145E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "Biome event could not be generated.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_24031460C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "Biome event could not be generated for dprivacyd event.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_240314638(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  objc_msgSend_aggregateFunction(a2, v4, v5, v6, v7);
  sub_2402EA278(&dword_2402DE000, v8, v9, "Aggregate function %d not found.", v10, v11, v12, v13, 0);

  sub_2402EA28C();
}

void sub_2403146B8(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  objc_msgSend_eventPhase(a2, v4, v5, v6, v7);
  sub_2402EA278(&dword_2402DE000, v8, v9, "Event phase, %d, not found.", v10, v11, v12, v13, 0);

  sub_2402EA28C();
}

void sub_240314738(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "older BMLighthouseLedgerMlruntimedEvent than this bucket.", v4);
}

void sub_240314760(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "older BMLighthouseLedgerLighthousePluginEvent than this bucket.", v4);
}

void sub_240314788(uint64_t a1, void *a2)
{
  _DWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_2402F10D4(a1, a2);
  objc_msgSend_event(v3, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_phase(v10, v11, v12, v13, v14);
  *v4 = 67109120;
  *v2 = v15;
  sub_2402F1098(&dword_2402DE000, v16, v17, "Event Iteration Error: unknown BMLighthouseLedgerDediscoPrivacyEvent event type %d");

  sub_2402F1104();
}

void sub_2403147E8(uint64_t a1, void *a2)
{
  _DWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_2402F10D4(a1, a2);
  v10 = objc_msgSend_eventType(v3, v6, v7, v8, v9);
  *v4 = 67109120;
  *v2 = v10;
  sub_2402F1098(&dword_2402DE000, v11, v12, "Event Iteration Error: unknown BMLighthouseLedgerTrialdEvent event type %d");

  sub_2402F1104();
}

void sub_240314838(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "unknown BMLighthouseLedgerLighthousePluginEvent event type", v4);
}

void sub_240314860(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_2402E8CE8(a1, a2);
  sub_2402E8CD8(&dword_2402DE000, v2, v3, "unknown BMLighthouseLedgerMlruntimedEvent event type", v4);
}

void sub_240314888(uint64_t a1, void *a2)
{
  _DWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_2402F10D4(a1, a2);
  v10 = objc_msgSend_state(v3, v6, v7, v8, v9);
  *v4 = 67109120;
  *v2 = v10;
  sub_2402F1098(&dword_2402DE000, v11, v12, "Transition Iteration Error: unknown LBFBitacoraStateTransition state %d");

  sub_2402F1104();
}

void sub_2403148D8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  sub_2402F10F4(&dword_2402DE000, a2, OS_LOG_TYPE_ERROR, "unknown lastState value %d", (uint8_t *)v3);
  sub_2402E3664();
}

void sub_240314948(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_event(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 67109120;
  v11[1] = objc_msgSend_phase(v6, v7, v8, v9, v10);
  sub_2402F10F4(&dword_2402DE000, a2, OS_LOG_TYPE_ERROR, "unknown BMLighthouseLedgerDediscoPrivacyEvent event phase %d", (uint8_t *)v11);

  sub_2402F10FC();
}

void sub_2403149D8(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = 67109120;
  v6[1] = objc_msgSend_eventType(a1, a2, a3, a4, a5);
  sub_2402F10F4(&dword_2402DE000, a2, OS_LOG_TYPE_ERROR, "unknown BMLighthouseLedgerTrialdEvent event type %d", (uint8_t *)v6);
  sub_2402F10FC();
}

void sub_240314A58(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2402DE000, log, OS_LOG_TYPE_ERROR, "No experiment identifiers in state info.", v1, 2u);
  sub_2402E3664();
}

void sub_240314A94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F1110(&dword_2402DE000, a1, a3, "Uploaded to Fedstats.", a5, a6, a7, a8, 0);
  sub_2402E3664();
}

void sub_240314AC4(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19;

  v3 = sub_2402F1128(a1);
  sub_2402F1120((uint64_t)v3, v4, v5, v6, v7);
  objc_msgSend_domain(a2, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402F10AC();
  sub_2402F1084(&dword_2402DE000, v13, v14, "Error During FedStats Stack Time data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);

  sub_2402F10C4();
}

void sub_240314B58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F10E4(&dword_2402DE000, a2, a3, "Stack Time Upload: %@", a5, a6, a7, a8, 2u);
  sub_2402F10FC();
}

void sub_240314BD4(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19;

  v3 = sub_2402F1128(a1);
  sub_2402F1120((uint64_t)v3, v4, v5, v6, v7);
  objc_msgSend_domain(a2, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402F10AC();
  sub_2402F1084(&dword_2402DE000, v13, v14, "Error During FedStats Stack Success data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);

  sub_2402F10C4();
}

void sub_240314C68(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F10E4(&dword_2402DE000, a2, a3, "Stack Success Upload: %@", a5, a6, a7, a8, 2u);
  sub_2402F10FC();
}

void sub_240314CE4(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19;

  v3 = sub_2402F1128(a1);
  sub_2402F1120((uint64_t)v3, v4, v5, v6, v7);
  objc_msgSend_domain(a2, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402F10AC();
  sub_2402F1084(&dword_2402DE000, v13, v14, "Error During FedStats DPrivacyD data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);

  sub_2402F10C4();
}

void sub_240314D78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F10E4(&dword_2402DE000, a2, a3, "DeDisco Upload: %@", a5, a6, a7, a8, 2u);
  sub_2402F10FC();
}

void sub_240314DF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F1110(&dword_2402DE000, a1, a3, "Error linking FedStats library.", a5, a6, a7, a8, 0);
  sub_2402E3664();
}

void sub_240314E24(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2402DE000, log, OS_LOG_TYPE_ERROR, "_biomeSource already exists.", v1, 2u);
}

void sub_240314E64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "Proto could not be converted. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240314EC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "bmltIdentifiersId is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240314F24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "experimentIdentifiersId is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240314F84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "eventDict does not have succeeded key. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240314FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "errorCodeId is not NSNumber class. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "errorDomainId is not NSString class. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403150A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "eventDict does not have scheduled key. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315104()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "trialIdentifiers could not be converted. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315164()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "taskCompletedID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403151C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "taskFetchedID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "taskScheduledID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "activityScheduledID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403152E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "trialIdentifiers is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_240315344(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2402F5CEC(&dword_2402DE000, a1, a3, "could not be converted to proto. %@", a5, a6, a7, a8, 2u);
  sub_2402F10FC();
}

void sub_2403153AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "errorCodeID is not NSNumber class. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031540C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "errorDomainID is not NSString class. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031546C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "stopID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403154CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "performTrialTaskStatusId is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031552C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "performTaskStatusID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031558C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "trialIdentifiersID is not NSDictionary. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403155EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "eventSucceeded is not NSNumber (used to wrap BOOL). %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031564C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "eventType is null. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_2403156AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402F5CFC();
  sub_2402F5CEC(&dword_2402DE000, v0, v1, "eventType is not NSString. %@", v2, v3, v4, v5, v6);
  sub_2402F10FC();
}

void sub_24031570C()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 595, "nil != self->_telemetryID");
}

void sub_240315734()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 600, "self->_trialIdentifiers != nil");
}

void sub_24031575C()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 605, "nil != self->_contextID");
}

void sub_240315784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "_biomeManagerLighthouse already exists.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_2403157B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "_biomeManagerTrial already exists.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_2403157DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "_biomeManagerMLRuntimed already exists.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_240315808()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "_biomeManagerDprivacyd already exists.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_240315834()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "Allocation event cannot have identifiers.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_240315860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "Activation event must have identifiers.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_24031588C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402E3654(&dword_2402DE000, v0, v1, "Deactivation event must have identifiers.", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_2403158B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2402EA298();
  sub_2402F1110(&dword_2402DE000, v0, v1, "identifiers needs to be provided", v2, v3, v4, v5, v6);
  sub_2402E3664();
}

void sub_2403158E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2402DE000, log, OS_LOG_TYPE_ERROR, "LBFTrialEvent isEqual class is not mached", v1, 2u);
}

void sub_240315924(void *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a1;
  objc_msgSend_eventType(a2, v6, v7, v8, v9);
  objc_msgSend_eventType(a3, v10, v11, v12, v13);
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFTrialEvent isEqual eventType is not mached %ld %ld", v16, v17, v18, v19, 0);

  sub_2402F10C4();
}

void sub_2403159C4(void *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v5 = a1;
  objc_msgSend_succeeded(a2, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_succeeded(a3, v11, v12, v13, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FC8A0(&dword_2402DE000, v15, v16, "LBFTrialEvent isEqual succeeded is not mached %@ %@", v17, v18, v19, v20, 2u);

  sub_2402F10C4();
}

void sub_240315A78(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2402DE000, log, OS_LOG_TYPE_ERROR, "LBFLighthouseEvent isEqual class is not mached", v1, 2u);
}

void sub_240315AB8()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_2402FD1F4();
  sub_2402F1128(v1);
  v2 = (void *)sub_2402FD1DC();
  objc_msgSend_eventType(v2, v3, v4, v5, v6);
  v7 = (void *)sub_2402FD1E8();
  objc_msgSend_eventType(v7, v8, v9, v10, v11);
  sub_2402FC8A0(&dword_2402DE000, v12, v13, "LBFLighthouseEvent isEqual eventType is not mached %ld %ld", v14, v15, v16, v17, 0);

  sub_2402F10C4();
}

void sub_240315B48()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_errorDomain(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_errorDomain(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFLighthouseEvent isEqual errorDomain is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315BDC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_errorCode(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_errorCode(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFLighthouseEvent isEqual succeeded is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315C70()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_succeeded(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_succeeded(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFLighthouseEvent isEqual succeeded is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315D04(uint8_t *a1, void *a2, void *a3, _DWORD *a4)
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v7 = a2;
  v12 = objc_msgSend_eventType(a3, v8, v9, v10, v11);
  *(_DWORD *)a1 = 67109120;
  *a4 = v12;
  _os_log_error_impl(&dword_2402DE000, v7, OS_LOG_TYPE_ERROR, "unknown BMLighthouseLedgerTrialdEvent event type %d", a1, 8u);

}

void sub_240315D78()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_scheduled(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_scheduled(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFMLRuntimedEvent isEqual scheduled is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315E0C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_errorDomain(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_errorDomain(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFMLRuntimedEvent isEqual errorDomain is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315EA0()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_errorCode(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_errorCode(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFMLRuntimedEvent isEqual errorCode is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315F34()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  sub_2402FD1F4();
  sub_2402F1128(v2);
  v3 = (void *)sub_2402FD1DC();
  objc_msgSend_succeeded(v3, v4, v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = (void *)sub_2402FD1E8();
  objc_msgSend_succeeded(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2402FD1C4();
  sub_2402FC8A0(&dword_2402DE000, v14, v15, "LBFMLRuntimedEvent isEqual succeeded is not mached %@ %@", v16, v17, v18, v19, v20);

  sub_2402F10C4();
}

void sub_240315FC8()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_2402FD1F4();
  sub_2402F1128(v1);
  v2 = (void *)sub_2402FD1DC();
  objc_msgSend_eventType(v2, v3, v4, v5, v6);
  v7 = (void *)sub_2402FD1E8();
  objc_msgSend_eventType(v7, v8, v9, v10, v11);
  sub_2402FC8A0(&dword_2402DE000, v12, v13, "LBFMLRuntimedEvent isEqual eventType is not mached %ld %ld", v14, v15, v16, v17, 0);

  sub_2402F10C4();
}

uint64_t sub_240316058()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_240316064()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_240316070()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24031607C()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_240316088()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_240316094()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_2403160A0()
{
  return MEMORY[0x24BE5BFA0]();
}

uint64_t sub_2403160AC()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_2403160B8()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_2403160C4()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_2403160D0()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_2403160DC()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_2403160E8()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_2403160F4()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_240316100()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_24031610C()
{
  return MEMORY[0x24BE5C060]();
}

uint64_t sub_240316118()
{
  return MEMORY[0x24BE5C070]();
}

uint64_t sub_240316124()
{
  return MEMORY[0x24BE5C0C0]();
}

uint64_t sub_240316130()
{
  return MEMORY[0x24BE5C100]();
}

uint64_t sub_24031613C()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_240316148()
{
  return MEMORY[0x24BE5C128]();
}

uint64_t sub_240316154()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_240316160()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t sub_24031616C()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_240316178()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_240316184()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_240316190()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_24031619C()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_2403161A8()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_2403161B4()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_2403161C0()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_2403161CC()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_2403161D8()
{
  return MEMORY[0x24BE5C2F0]();
}

uint64_t sub_2403161E4()
{
  return MEMORY[0x24BE5C2F8]();
}

uint64_t sub_2403161F0()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_2403161FC()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_240316208()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_240316214()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_240316220()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24031622C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_240316238()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_240316244()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_240316250()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_24031625C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_240316268()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_240316274()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_240316280()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24031628C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_240316298()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2403162A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2403162B0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2403162BC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2403162C8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2403162D4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x24BDAFD88](*(_QWORD *)&a1);
}

void srand48(uint64_t a1)
{
  MEMORY[0x24BDAFE88](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

