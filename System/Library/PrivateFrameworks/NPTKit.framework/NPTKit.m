void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_20E71DEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
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

void sub_20E71DFD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E71E6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E71EF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;
  id *v25;

  objc_sync_exit(v24);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(v25);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__175(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__176(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_20E71F5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_20E71F9F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E71FD0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E72003C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E720CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E7228E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *indicatorToString(unsigned int a1)
{
  if (a1 > 0x11)
    return CFSTR("unknown");
  else
    return off_24C9910C8[a1];
}

const __CFString *wirelessAccessTechnologyToString(unsigned int a1)
{
  if (a1 > 0xA)
    return CFSTR("unknown");
  else
    return off_24C991158[a1];
}

const __CFString *dataBearerTechnologyToString(int a1)
{
  if ((a1 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_24C9911B0[a1 - 1];
}

const __CFString *ctReasonToString(int a1)
{
  if ((a1 - 1) > 0xA)
    return CFSTR("Unknown");
  else
    return off_24C9911E0[a1 - 1];
}

void sub_20E727C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E727D54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20E727E58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20E72AB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E72ACB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20E72C3C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E72D600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E72D864(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E72E1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E72F538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AWDNetworkPerformanceMetricReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
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
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  char v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unsigned int v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  char v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char v175;
  void *v176;
  BOOL v177;
  uint64_t v178;

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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_DWORD *)(a1 + 1684) |= 1u;
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
              goto LABEL_412;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_414;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_412:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_414:
          *(_QWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 16;
          goto LABEL_408;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 24;
          goto LABEL_408;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 32;
          goto LABEL_408;
        case 5u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_DWORD *)(a1 + 1684) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (v14)
                {
                  v27 = 0;
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_418:
          v177 = v27 != 0;
          v178 = 1657;
          goto LABEL_515;
        case 6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_408;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_408;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_408;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_408;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_408;
        case 0xCu:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_DWORD *)(a1 + 1684) |= 8u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_422:
          v177 = v34 != 0;
          v178 = 1658;
          goto LABEL_515;
        case 0xDu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_426:
          v177 = v40 != 0;
          v178 = 1659;
          goto LABEL_515;
        case 0xEu:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x20u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_430:
          v177 = v46 != 0;
          v178 = 1660;
          goto LABEL_515;
        case 0xFu:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x40u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  v52 = 0;
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_434:
          v177 = v52 != 0;
          v178 = 1661;
          goto LABEL_515;
        case 0x10u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_408;
        case 0x11u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_408;
        case 0x12u:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x80u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_438:
          v177 = v58 != 0;
          v178 = 1662;
          goto LABEL_515;
        case 0x13u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
          goto LABEL_408;
        case 0x14u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 120;
          goto LABEL_408;
        case 0x15u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 128;
          goto LABEL_408;
        case 0x16u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 136;
          goto LABEL_408;
        case 0x17u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 152;
          goto LABEL_408;
        case 0x18u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 160;
          goto LABEL_408;
        case 0x19u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 168;
          goto LABEL_408;
        case 0x1Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 176;
          goto LABEL_408;
        case 0x1Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 184;
          goto LABEL_408;
        case 0x1Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 192;
          goto LABEL_408;
        case 0x1Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 200;
          goto LABEL_408;
        case 0x1Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 208;
          goto LABEL_408;
        case 0x1Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 232;
          goto LABEL_408;
        case 0x20u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 240;
          goto LABEL_408;
        case 0x21u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 296;
          goto LABEL_408;
        case 0x22u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 304;
          goto LABEL_408;
        case 0x23u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 312;
          goto LABEL_408;
        case 0x24u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 320;
          goto LABEL_408;
        case 0x25u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 328;
          goto LABEL_408;
        case 0x26u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 336;
          goto LABEL_408;
        case 0x27u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 344;
          goto LABEL_408;
        case 0x28u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 352;
          goto LABEL_408;
        case 0x29u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 360;
          goto LABEL_408;
        case 0x2Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 368;
          goto LABEL_408;
        case 0x2Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 376;
          goto LABEL_408;
        case 0x2Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 384;
          goto LABEL_408;
        case 0x2Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 392;
          goto LABEL_408;
        case 0x2Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 400;
          goto LABEL_408;
        case 0x2Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 408;
          goto LABEL_408;
        case 0x30u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 424;
          goto LABEL_408;
        case 0x31u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 440;
          goto LABEL_408;
        case 0x32u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 448;
          goto LABEL_408;
        case 0x33u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 456;
          goto LABEL_408;
        case 0x34u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 488;
          goto LABEL_408;
        case 0x35u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 496;
          goto LABEL_408;
        case 0x36u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 504;
          goto LABEL_408;
        case 0x37u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 512;
          goto LABEL_408;
        case 0x38u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 520;
          goto LABEL_408;
        case 0x39u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 528;
          goto LABEL_408;
        case 0x3Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 536;
          goto LABEL_408;
        case 0x3Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 552;
          goto LABEL_408;
        case 0x3Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 568;
          goto LABEL_408;
        case 0x3Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 576;
          goto LABEL_408;
        case 0x3Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 584;
          goto LABEL_408;
        case 0x3Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 592;
          goto LABEL_408;
        case 0x40u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 600;
          goto LABEL_408;
        case 0x41u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 616;
          goto LABEL_408;
        case 0x42u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 624;
          goto LABEL_408;
        case 0x43u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 640;
          goto LABEL_408;
        case 0x44u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 672;
          goto LABEL_408;
        case 0x45u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 680;
          goto LABEL_408;
        case 0x46u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 688;
          goto LABEL_408;
        case 0x47u:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x200u;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
              *(_QWORD *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  v64 = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v64 = 0;
LABEL_442:
          v177 = v64 != 0;
          v178 = 1664;
          goto LABEL_515;
        case 0x48u:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x400u;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v14 = v69++ >= 9;
                if (v14)
                {
                  v70 = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v70 = 0;
LABEL_446:
          v177 = v70 != 0;
          v178 = 1665;
          goto LABEL_515;
        case 0x49u:
          v74 = 0;
          v75 = 0;
          v76 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x800u;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            if (v78 == -1 || v78 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
              *(_QWORD *)(a2 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v14 = v75++ >= 9;
                if (v14)
                {
                  v76 = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v76 = 0;
LABEL_450:
          v177 = v76 != 0;
          v178 = 1666;
          goto LABEL_515;
        case 0x4Au:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x1000u;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
              *(_QWORD *)(a2 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v14 = v81++ >= 9;
                if (v14)
                {
                  v82 = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v82 = 0;
LABEL_454:
          v177 = v82 != 0;
          v178 = 1667;
          goto LABEL_515;
        case 0x4Bu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x2000u;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
              *(_QWORD *)(a2 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                v14 = v87++ >= 9;
                if (v14)
                {
                  v88 = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v88 = 0;
LABEL_458:
          v177 = v88 != 0;
          v178 = 1668;
          goto LABEL_515;
        case 0x4Cu:
          v92 = 0;
          v93 = 0;
          v94 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x4000u;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            if (v96 == -1 || v96 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v96);
              *(_QWORD *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                v14 = v93++ >= 9;
                if (v14)
                {
                  v94 = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v94 = 0;
LABEL_462:
          v177 = v94 != 0;
          v178 = 1669;
          goto LABEL_515;
        case 0x4Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 704;
          goto LABEL_408;
        case 0x4Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 712;
          goto LABEL_408;
        case 0x4Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 720;
          goto LABEL_408;
        case 0x50u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 728;
          goto LABEL_408;
        case 0x51u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 736;
          goto LABEL_408;
        case 0x52u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 744;
          goto LABEL_408;
        case 0x53u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 752;
          goto LABEL_408;
        case 0x54u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 760;
          goto LABEL_408;
        case 0x55u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 792;
          goto LABEL_408;
        case 0x56u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 800;
          goto LABEL_408;
        case 0x57u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 808;
          goto LABEL_408;
        case 0x58u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 832;
          goto LABEL_408;
        case 0x59u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 848;
          goto LABEL_408;
        case 0x5Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 856;
          goto LABEL_408;
        case 0x5Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 872;
          goto LABEL_408;
        case 0x5Cu:
          v98 = 0;
          v99 = 0;
          v100 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x8000u;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
              *(_QWORD *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v14 = v99++ >= 9;
                if (v14)
                {
                  v100 = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v100 = 0;
LABEL_466:
          v177 = v100 != 0;
          v178 = 1670;
          goto LABEL_515;
        case 0x5Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 880;
          goto LABEL_408;
        case 0x5Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 888;
          goto LABEL_408;
        case 0x60u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 968;
          goto LABEL_408;
        case 0x61u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 976;
          goto LABEL_408;
        case 0x62u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 984;
          goto LABEL_408;
        case 0x63u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1016;
          goto LABEL_408;
        case 0x64u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1024;
          goto LABEL_408;
        case 0x65u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1032;
          goto LABEL_408;
        case 0x66u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1040;
          goto LABEL_408;
        case 0x67u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1048;
          goto LABEL_408;
        case 0x68u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1056;
          goto LABEL_408;
        case 0x69u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1064;
          goto LABEL_408;
        case 0x6Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1072;
          goto LABEL_408;
        case 0x6Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1080;
          goto LABEL_408;
        case 0x6Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1088;
          goto LABEL_408;
        case 0x6Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1096;
          goto LABEL_408;
        case 0x6Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1104;
          goto LABEL_408;
        case 0x6Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1112;
          goto LABEL_408;
        case 0x70u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x10000u;
          while (2)
          {
            v107 = *v3;
            v108 = *(_QWORD *)(a2 + v107);
            if (v108 == -1 || v108 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
              *(_QWORD *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                v14 = v105++ >= 9;
                if (v14)
                {
                  v106 = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v106 = 0;
LABEL_470:
          v177 = v106 != 0;
          v178 = 1671;
          goto LABEL_515;
        case 0x71u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1120;
          goto LABEL_408;
        case 0x72u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1128;
          goto LABEL_408;
        case 0x73u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1136;
          goto LABEL_408;
        case 0x74u:
          v110 = 0;
          v111 = 0;
          v112 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x20000u;
          while (2)
          {
            v113 = *v3;
            v114 = *(_QWORD *)(a2 + v113);
            if (v114 == -1 || v114 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v114);
              *(_QWORD *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                v14 = v111++ >= 9;
                if (v14)
                {
                  v112 = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v112 = 0;
LABEL_474:
          v177 = v112 != 0;
          v178 = 1672;
          goto LABEL_515;
        case 0x75u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1144;
          goto LABEL_408;
        case 0x76u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1152;
          goto LABEL_408;
        case 0x77u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1160;
          goto LABEL_408;
        case 0x78u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1168;
          goto LABEL_408;
        case 0x79u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1176;
          goto LABEL_408;
        case 0x7Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1184;
          goto LABEL_408;
        case 0x7Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1200;
          goto LABEL_408;
        case 0x7Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1208;
          goto LABEL_408;
        case 0x7Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1224;
          goto LABEL_408;
        case 0x7Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1256;
          goto LABEL_408;
        case 0x7Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1264;
          goto LABEL_408;
        case 0x80u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1272;
          goto LABEL_408;
        case 0x81u:
          v116 = 0;
          v117 = 0;
          v118 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x40000u;
          while (2)
          {
            v119 = *v3;
            v120 = *(_QWORD *)(a2 + v119);
            if (v120 == -1 || v120 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v120);
              *(_QWORD *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                v14 = v117++ >= 9;
                if (v14)
                {
                  v118 = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v118 = 0;
LABEL_478:
          v177 = v118 != 0;
          v178 = 1673;
          goto LABEL_515;
        case 0x82u:
          v122 = 0;
          v123 = 0;
          v124 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x80000u;
          while (2)
          {
            v125 = *v3;
            v126 = *(_QWORD *)(a2 + v125);
            if (v126 == -1 || v126 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v127 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v126);
              *(_QWORD *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                v14 = v123++ >= 9;
                if (v14)
                {
                  v124 = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v124 = 0;
LABEL_482:
          v177 = v124 != 0;
          v178 = 1674;
          goto LABEL_515;
        case 0x83u:
          v128 = 0;
          v129 = 0;
          v130 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x100000u;
          while (2)
          {
            v131 = *v3;
            v132 = *(_QWORD *)(a2 + v131);
            if (v132 == -1 || v132 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v133 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v132);
              *(_QWORD *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                v14 = v129++ >= 9;
                if (v14)
                {
                  v130 = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v130 = 0;
LABEL_486:
          v177 = v130 != 0;
          v178 = 1675;
          goto LABEL_515;
        case 0x84u:
          v134 = 0;
          v135 = 0;
          v136 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x200000u;
          while (2)
          {
            v137 = *v3;
            v138 = *(_QWORD *)(a2 + v137);
            if (v138 == -1 || v138 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
              *(_QWORD *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                v14 = v135++ >= 9;
                if (v14)
                {
                  v136 = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v136 = 0;
LABEL_490:
          v177 = v136 != 0;
          v178 = 1676;
          goto LABEL_515;
        case 0x85u:
          v140 = 0;
          v141 = 0;
          v142 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x400000u;
          while (2)
          {
            v143 = *v3;
            v144 = *(_QWORD *)(a2 + v143);
            if (v144 == -1 || v144 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v145 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v144);
              *(_QWORD *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                v14 = v141++ >= 9;
                if (v14)
                {
                  v142 = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v142 = 0;
LABEL_494:
          v177 = v142 != 0;
          v178 = 1677;
          goto LABEL_515;
        case 0x86u:
          v146 = 0;
          v147 = 0;
          v148 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x800000u;
          while (2)
          {
            v149 = *v3;
            v150 = *(_QWORD *)(a2 + v149);
            if (v150 == -1 || v150 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v151 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v150);
              *(_QWORD *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                v14 = v147++ >= 9;
                if (v14)
                {
                  v148 = 0;
                  goto LABEL_498;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v148 = 0;
LABEL_498:
          v177 = v148 != 0;
          v178 = 1678;
          goto LABEL_515;
        case 0x87u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1288;
          goto LABEL_408;
        case 0x88u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1296;
          goto LABEL_408;
        case 0x89u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1304;
          goto LABEL_408;
        case 0x8Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1312;
          goto LABEL_408;
        case 0x8Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1320;
          goto LABEL_408;
        case 0x8Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1328;
          goto LABEL_408;
        case 0x8Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1336;
          goto LABEL_408;
        case 0x8Eu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1344;
          goto LABEL_408;
        case 0x8Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1376;
          goto LABEL_408;
        case 0x90u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1384;
          goto LABEL_408;
        case 0x91u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1392;
          goto LABEL_408;
        case 0x92u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1416;
          goto LABEL_408;
        case 0x93u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1432;
          goto LABEL_408;
        case 0x94u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1440;
          goto LABEL_408;
        case 0x95u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1456;
          goto LABEL_408;
        case 0x96u:
          v152 = 0;
          v153 = 0;
          v154 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x1000000u;
          while (2)
          {
            v155 = *v3;
            v156 = *(_QWORD *)(a2 + v155);
            if (v156 == -1 || v156 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v157 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v156);
              *(_QWORD *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                v14 = v153++ >= 9;
                if (v14)
                {
                  v154 = 0;
                  goto LABEL_502;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v154 = 0;
LABEL_502:
          v177 = v154 != 0;
          v178 = 1679;
          goto LABEL_515;
        case 0x97u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1472;
          goto LABEL_408;
        case 0x98u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1480;
          goto LABEL_408;
        case 0x99u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1488;
          goto LABEL_408;
        case 0x9Au:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1496;
          goto LABEL_408;
        case 0x9Bu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1504;
          goto LABEL_408;
        case 0x9Cu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1512;
          goto LABEL_408;
        case 0x9Du:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1520;
          goto LABEL_408;
        case 0x9Fu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1544;
          goto LABEL_408;
        case 0xA0u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1552;
          goto LABEL_408;
        case 0xA1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1560;
          goto LABEL_408;
        case 0xA2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1568;
          goto LABEL_408;
        case 0xA3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1576;
          goto LABEL_408;
        case 0xA4u:
          v158 = 0;
          v159 = 0;
          v160 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x2000000u;
          while (2)
          {
            v161 = *v3;
            v162 = *(_QWORD *)(a2 + v161);
            if (v162 == -1 || v162 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v163 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v162);
              *(_QWORD *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                v14 = v159++ >= 9;
                if (v14)
                {
                  v160 = 0;
                  goto LABEL_506;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v160 = 0;
LABEL_506:
          v177 = v160 != 0;
          v178 = 1680;
          goto LABEL_515;
        case 0xA5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1584;
          goto LABEL_408;
        case 0xA6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1592;
          goto LABEL_408;
        case 0xA7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1600;
          goto LABEL_408;
        case 0xA8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1608;
          goto LABEL_408;
        case 0xA9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1616;
          goto LABEL_408;
        case 0xAAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1624;
          goto LABEL_408;
        case 0xABu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1632;
          goto LABEL_408;
        case 0xACu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1640;
          goto LABEL_408;
        case 0xADu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1648;
          goto LABEL_408;
        case 0xAEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 144;
          goto LABEL_408;
        case 0xAFu:
          v164 = 0;
          v165 = 0;
          v166 = 0;
          *(_DWORD *)(a1 + 1684) |= 2u;
          while (2)
          {
            v167 = *v3;
            v168 = *(_QWORD *)(a2 + v167);
            if (v168 == -1 || v168 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v169 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v168);
              *(_QWORD *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                v14 = v165++ >= 9;
                if (v14)
                {
                  v166 = 0;
                  goto LABEL_510;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v166 = 0;
LABEL_510:
          v177 = v166 != 0;
          v178 = 1656;
          goto LABEL_515;
        case 0xB0u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 952;
          goto LABEL_408;
        case 0xB1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_408;
        case 0xB2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_408;
        case 0xB3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 216;
          goto LABEL_408;
        case 0xB4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 224;
          goto LABEL_408;
        case 0xB5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 248;
          goto LABEL_408;
        case 0xB6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 256;
          goto LABEL_408;
        case 0xB7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 264;
          goto LABEL_408;
        case 0xB8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 272;
          goto LABEL_408;
        case 0xB9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 280;
          goto LABEL_408;
        case 0xBAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 288;
          goto LABEL_408;
        case 0xBBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 416;
          goto LABEL_408;
        case 0xBCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 432;
          goto LABEL_408;
        case 0xBDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 464;
          goto LABEL_408;
        case 0xBEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 544;
          goto LABEL_408;
        case 0xBFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 560;
          goto LABEL_408;
        case 0xC0u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 864;
          goto LABEL_408;
        case 0xC1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 632;
          goto LABEL_408;
        case 0xC2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 896;
          goto LABEL_408;
        case 0xC3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 904;
          goto LABEL_408;
        case 0xC4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1448;
          goto LABEL_408;
        case 0xC5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1216;
          goto LABEL_408;
        case 0xC6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 648;
          goto LABEL_408;
        case 0xC7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 920;
          goto LABEL_408;
        case 0xC8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 912;
          goto LABEL_408;
        case 0xC9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 960;
          goto LABEL_408;
        case 0xCAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 944;
          goto LABEL_408;
        case 0xCBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1464;
          goto LABEL_408;
        case 0xCCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1232;
          goto LABEL_408;
        case 0xCDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1248;
          goto LABEL_408;
        case 0xCEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1240;
          goto LABEL_408;
        case 0xCFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 664;
          goto LABEL_408;
        case 0xD0u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 656;
          goto LABEL_408;
        case 0xD1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 992;
          goto LABEL_408;
        case 0xD2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1008;
          goto LABEL_408;
        case 0xD3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1000;
          goto LABEL_408;
        case 0xD4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 936;
          goto LABEL_408;
        case 0xD5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 928;
          goto LABEL_408;
        case 0xD6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 472;
          goto LABEL_408;
        case 0xD7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 480;
          goto LABEL_408;
        case 0xD8u:
          v170 = 0;
          v171 = 0;
          v172 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x100u;
          break;
        case 0xD9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 840;
          goto LABEL_408;
        case 0xDAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 608;
          goto LABEL_408;
        case 0xDBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 696;
          goto LABEL_408;
        case 0xDCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1424;
          goto LABEL_408;
        case 0xDDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1192;
          goto LABEL_408;
        case 0xDEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1280;
          goto LABEL_408;
        case 0xDFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 768;
          goto LABEL_408;
        case 0xE0u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 776;
          goto LABEL_408;
        case 0xE1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 784;
          goto LABEL_408;
        case 0xE2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 816;
          goto LABEL_408;
        case 0xE3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 824;
          goto LABEL_408;
        case 0xE4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1352;
          goto LABEL_408;
        case 0xE5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1360;
          goto LABEL_408;
        case 0xE6u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1368;
          goto LABEL_408;
        case 0xE7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1400;
          goto LABEL_408;
        case 0xE8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1408;
          goto LABEL_408;
        case 0xE9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1528;
          goto LABEL_408;
        case 0xEAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 1536;
LABEL_408:
          v176 = *(void **)(a1 + v24);
          *(_QWORD *)(a1 + v24) = v23;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v173 = *v3;
        v174 = *(_QWORD *)(a2 + v173);
        if (v174 == -1 || v174 >= *(_QWORD *)(a2 + *v4))
          break;
        v175 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v174);
        *(_QWORD *)(a2 + v173) = v174 + 1;
        v172 |= (unint64_t)(v175 & 0x7F) << v170;
        if ((v175 & 0x80) == 0)
          goto LABEL_512;
        v170 += 7;
        v14 = v171++ >= 9;
        if (v14)
        {
          v172 = 0;
          goto LABEL_514;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_512:
      if (*(_BYTE *)(a2 + *v5))
        v172 = 0;
LABEL_514:
      v177 = v172 != 0;
      v178 = 1663;
LABEL_515:
      *(_BYTE *)(a1 + v178) = v177;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_20E749B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E749D5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E74A6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SocketReadCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;

  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    SocketReadCallback_cold_5();
  if (objc_msgSend(v9, "socket") != a1)
    SocketReadCallback_cold_4();
  if (a2 != 1)
    SocketReadCallback_cold_3();
  if (a3)
    SocketReadCallback_cold_2();
  if (a4)
    SocketReadCallback_cold_1();
  objc_msgSend(v9, "readData");

}

void HostResolveCallback(uint64_t a1, int a2, _QWORD *a3, void *a4)
{
  dispatch_source_t *v7;
  NSObject *v8;
  intptr_t v9;
  dispatch_source_t *v10;

  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    HostResolveCallback_cold_3();
  if (-[dispatch_source_t host](v10, "host") != a1)
    HostResolveCallback_cold_2();
  if (a2)
    HostResolveCallback_cold_1();
  v7 = v10;
  v8 = v10[1];
  if (v8 && (v9 = dispatch_source_testcancel(v10[1]), v7 = v10, !v9))
  {
    dispatch_source_cancel(v8);
    v7 = v10;
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
LABEL_10:
    -[dispatch_source_t hostResolutionDone](v7, "hostResolutionDone");
    goto LABEL_11;
  }
  if (!*a3)
    goto LABEL_10;
  -[dispatch_source_t didFailWithHostStreamError:](v7, "didFailWithHostStreamError:", *a3, a3[1]);
LABEL_11:

}

void sub_20E74D420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_20E74E614(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E74FD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id a57,char a58)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a57);
  _Block_object_dispose(&a58, 8);
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

void sub_20E750044(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E750368(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E75045C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20E750F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E751118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E755D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E755F60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SocketReadCallback_cold_1()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 632, "data == nil");
}

void SocketReadCallback_cold_2()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 630, "address == nil");
}

void SocketReadCallback_cold_3()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 628, "type == kCFSocketReadCallBack");
}

void SocketReadCallback_cold_4()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 626, "s == obj.socket");
}

void SocketReadCallback_cold_5()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 623, "[obj isKindOfClass:[SimplePing class]]");
}

void HostResolveCallback_cold_1()
{
  __assert_rtn("HostResolveCallback", "SimplePing.m", 778, "typeInfo == kCFHostAddresses");
}

void HostResolveCallback_cold_2()
{
  __assert_rtn("HostResolveCallback", "SimplePing.m", 776, "theHost == obj.host");
}

void HostResolveCallback_cold_3()
{
  __assert_rtn("HostResolveCallback", "SimplePing.m", 773, "[obj isKindOfClass:[SimplePing class]]");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x24BDB7320](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x24BDB7328](theHost, hasBeenResolved);
}

void CFHostScheduleWithRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDB7330](theHost, runLoop, runLoopMode);
}

Boolean CFHostSetClient(CFHostRef theHost, CFHostClientCallBack clientCB, CFHostClientContext *clientContext)
{
  return MEMORY[0x24BDB7338](theHost, clientCB, clientContext);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x24BDB7340](theHost, *(_QWORD *)&info, error);
}

void CFHostUnscheduleFromRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDB7348](theHost, runLoop, runLoopMode);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC450](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x24BDBC458](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x24BDBC470](s);
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x24BDBC478](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x24BDBC480](s);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x24BDD8808]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x24BDD8820]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

uint64_t W5DescriptionForAWDLScheduleState()
{
  return MEMORY[0x24BEC2A78]();
}

uint64_t W5DescriptionForAWDLSyncChannelSequence()
{
  return MEMORY[0x24BEC2A80]();
}

uint64_t W5DescriptionForAWDLSyncState()
{
  return MEMORY[0x24BEC2A88]();
}

uint64_t W5DescriptionForBTCMode()
{
  return MEMORY[0x24BEC2A90]();
}

uint64_t W5DescriptionForBatteryWarningLevel()
{
  return MEMORY[0x24BEC2A98]();
}

uint64_t W5DescriptionForChainAck()
{
  return MEMORY[0x24BEC2AA0]();
}

uint64_t W5DescriptionForDesense()
{
  return MEMORY[0x24BEC2AA8]();
}

uint64_t W5DescriptionForEAPOLControlMode()
{
  return MEMORY[0x24BEC2AB0]();
}

uint64_t W5DescriptionForEAPOLSupplicantState()
{
  return MEMORY[0x24BEC2AB8]();
}

uint64_t W5DescriptionForOpMode()
{
  return MEMORY[0x24BEC2AC0]();
}

uint64_t W5DescriptionForPHYMode()
{
  return MEMORY[0x24BEC2AC8]();
}

uint64_t W5DescriptionForPower()
{
  return MEMORY[0x24BEC2AD0]();
}

uint64_t W5DescriptionForPowerSourceType()
{
  return MEMORY[0x24BEC2AD8]();
}

uint64_t W5DescriptionForPowerStateCaps()
{
  return MEMORY[0x24BEC2AE0]();
}

uint64_t W5DescriptionForSecurity()
{
  return MEMORY[0x24BEC2AE8]();
}

uint64_t WISPostMetric()
{
  return MEMORY[0x24BEC2B28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC28D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t ne_session_create()
{
  return MEMORY[0x24BDAF030]();
}

uint64_t ne_session_get_info()
{
  return MEMORY[0x24BDAF038]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x24BDAF040]();
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0950]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0990]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x24BDE09D0]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x24BDE09E8]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x24BDE1808](path, enumerate_block);
}

uint64_t nw_path_get_estimated_download_throughput()
{
  return MEMORY[0x24BDE18E0]();
}

uint64_t nw_path_get_estimated_upload_throughput()
{
  return MEMORY[0x24BDE18E8]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A20](*(_QWORD *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
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

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x24BDAFAE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x24BDAFCF8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

