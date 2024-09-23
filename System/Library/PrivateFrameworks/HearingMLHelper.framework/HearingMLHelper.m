void sub_21909D750(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21909D97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t HearingMLHelperSecureCodingClasses()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
}

id HearingMLHelperServiceInterface()
{
  if (HearingMLHelperServiceInterface_onceToken != -1)
    dispatch_once(&HearingMLHelperServiceInterface_onceToken, &__block_literal_global);
  return (id)HearingMLHelperServiceInterface__Interface;
}

uint64_t sub_21909DCF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *i;
  uint64_t v36;
  char v37;
  char v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 *v65;
  unsigned int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;

  v78 = a3;
  v79 = a4;
  v73 = a5;
  v7 = sub_21909F0CC();
  v69 = *(_QWORD *)(v7 - 8);
  v70 = v7;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v83 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25503C818);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_21909F0B4();
  v80 = *(_QWORD *)(v82 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v76 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v69 - v13;
  v14 = sub_21909F090();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v75 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v69 - v18;
  v20 = sub_21909F084();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v77 = (char *)&v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v69 - v24;
  v88 = qword_25503C7D8;
  v89 = unk_25503C7E0;
  swift_bridgeObjectRetain();
  v71 = a1;
  v72 = a2;
  sub_21909F0F0();
  sub_21909F054();
  swift_bridgeObjectRelease();
  v87 = v21;
  v26 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v26(v19, v25, v20);
  v27 = *MEMORY[0x24BDC57A0];
  v85 = v15;
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 104);
  v81 = v14;
  result = v28(v19, v27, v14);
  v31 = qword_25503C808;
  v30 = unk_25503C810;
  v32 = HIBYTE(unk_25503C810) & 0xFLL;
  v33 = qword_25503C808 & 0xFFFFFFFFFFFFLL;
  if ((unk_25503C810 & 0x2000000000000000) != 0)
    v34 = HIBYTE(unk_25503C810) & 0xFLL;
  else
    v34 = qword_25503C808 & 0xFFFFFFFFFFFFLL;
  if (v34)
  {
    v74 = v25;
    if ((unk_25503C810 & 0x1000000000000000) == 0)
    {
      if ((unk_25503C810 & 0x2000000000000000) == 0)
      {
        if ((qword_25503C808 & 0x1000000000000000) == 0)
          goto LABEL_61;
        for (i = (unsigned __int8 *)((unk_25503C810 & 0xFFFFFFFFFFFFFFFLL) + 32); ; i = (unsigned __int8 *)sub_21909F150())
        {
          v36 = v86;
          sub_21909E760(i, v33, 10);
          v86 = v36;
          v38 = v37 & 1;
          v39 = v84;
          v40 = v85;
          v41 = v78;
          v42 = v79;
          v43 = v77;
          if ((v38 & 1) == 0)
            break;
LABEL_60:
          __break(1u);
LABEL_61:
          ;
        }
        goto LABEL_37;
      }
      v88 = qword_25503C808;
      v89 = unk_25503C810 & 0xFFFFFFFFFFFFFFLL;
      if (qword_25503C808 == 43)
      {
        v39 = v84;
        v44 = v85;
        if (v32)
        {
          if (v32 == 1)
            goto LABEL_35;
          if ((BYTE1(qword_25503C808) - 48) <= 9u)
          {
            if (v32 == 2)
              goto LABEL_34;
            if ((BYTE2(qword_25503C808) - 48) <= 9u)
            {
              v45 = 10 * (BYTE1(qword_25503C808) - 48)
                  + (BYTE2(qword_25503C808) - 48);
              v46 = v32 - 3;
              if (v32 != 3)
              {
                v47 = (unsigned __int8 *)&v88 + 3;
                v41 = v78;
                v42 = v79;
                v43 = v77;
                v40 = v85;
                while (1)
                {
                  v48 = *v47 - 48;
                  if (v48 > 9)
                    goto LABEL_57;
                  v49 = 10 * v45;
                  if ((unsigned __int128)(v45 * (__int128)10) >> 64 != (10 * v45) >> 63)
                    goto LABEL_57;
                  v45 = v49 + v48;
                  if (__OFADD__(v49, v48))
                    goto LABEL_57;
                  LOBYTE(v32) = 0;
                  ++v47;
                  if (!--v46)
                    goto LABEL_36;
                }
              }
              goto LABEL_34;
            }
          }
          goto LABEL_32;
        }
      }
      else
      {
        v39 = v84;
        v44 = v85;
        if (qword_25503C808 != 45)
        {
          if (v32 && (qword_25503C808 - 48) <= 9u)
          {
            if (v32 == 1)
              goto LABEL_34;
            if ((BYTE1(qword_25503C808) - 48) <= 9u)
            {
              v58 = 10 * (qword_25503C808 - 48) + (BYTE1(qword_25503C808) - 48);
              v59 = v32 - 2;
              if (v32 != 2)
              {
                v60 = (unsigned __int8 *)&v88 + 2;
                v41 = v78;
                v42 = v79;
                v43 = v77;
                v40 = v85;
                while (1)
                {
                  v61 = *v60 - 48;
                  if (v61 > 9)
                    goto LABEL_57;
                  v62 = 10 * v58;
                  if ((unsigned __int128)(v58 * (__int128)10) >> 64 != (10 * v58) >> 63)
                    goto LABEL_57;
                  v58 = v62 + v61;
                  if (__OFADD__(v62, v61))
                    goto LABEL_57;
                  LOBYTE(v32) = 0;
                  ++v60;
                  if (!--v59)
                    goto LABEL_36;
                }
              }
LABEL_34:
              LOBYTE(v32) = 0;
              goto LABEL_35;
            }
          }
LABEL_32:
          LOBYTE(v32) = 1;
          goto LABEL_35;
        }
        if (v32)
        {
          if (v32 == 1)
            goto LABEL_35;
          if ((BYTE1(qword_25503C808) - 48) <= 9u)
          {
            if (v32 == 2)
            {
              LOBYTE(v32) = 0;
LABEL_35:
              v41 = v78;
              v42 = v79;
              v43 = v77;
              v40 = v44;
              goto LABEL_36;
            }
            if ((BYTE2(qword_25503C808) - 48) <= 9u)
            {
              v63 = -10 * (BYTE1(qword_25503C808) - 48)
                  - (BYTE2(qword_25503C808) - 48);
              v64 = v32 - 3;
              if (v32 != 3)
              {
                v65 = (unsigned __int8 *)&v88 + 3;
                v41 = v78;
                v42 = v79;
                v43 = v77;
                v40 = v85;
                while (1)
                {
                  v66 = *v65 - 48;
                  if (v66 > 9)
                    break;
                  v67 = 10 * v63;
                  if ((unsigned __int128)(v63 * (__int128)10) >> 64 != (10 * v63) >> 63)
                    break;
                  v63 = v67 - v66;
                  if (__OFSUB__(v67, v66))
                    break;
                  LOBYTE(v32) = 0;
                  ++v65;
                  if (!--v64)
                    goto LABEL_36;
                }
LABEL_57:
                LOBYTE(v32) = 1;
LABEL_36:
                if ((v32 & 1) != 0)
                  goto LABEL_60;
                goto LABEL_37;
              }
              goto LABEL_34;
            }
          }
          goto LABEL_32;
        }
        __break(1u);
      }
      __break(1u);
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  sub_21909E67C(v31, v30, 10);
  v90 = v68;
  swift_bridgeObjectRelease();
  v39 = v84;
  v40 = v85;
  v41 = v78;
  v42 = v79;
  v43 = v77;
  if ((v90 & 1) != 0)
    goto LABEL_60;
LABEL_37:
  v26(v43, v41, v20);
  v26(v10, v42, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v87 + 56))(v10, 0, 1, v20);
  sub_21909F0A8();
  v50 = v81;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v75, v19, v81);
  v51 = v80;
  v52 = v39;
  v53 = v40;
  v54 = v39;
  v55 = v82;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v76, v52, v82);
  v56 = v86;
  sub_21909F09C();
  if (v56)
  {
    (*(void (**)(char *, uint64_t))(v51 + 8))(v54, v55);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v50);
  }
  else
  {
    v88 = qword_25503C7E8;
    v89 = unk_25503C7F0;
    swift_bridgeObjectRetain();
    sub_21909F0F0();
    swift_bridgeObjectRetain();
    v57 = v83;
    sub_21909F0F0();
    swift_bridgeObjectRelease();
    sub_21909F060();
    swift_bridgeObjectRelease();
    sub_21909F0C0();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v57, v70);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v84, v82);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v19, v81);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v74, v20);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A29890]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unsigned __int8 *sub_21909E67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21909F138();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21909E9DC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21909F150();
  }
LABEL_7:
  v11 = sub_21909E760(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21909E760(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21909E9DC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21909F144();
  v4 = sub_21909EA58(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21909EA58(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21909EB9C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21909EC88(v9, 0);
      v12 = sub_21909ECEC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x219A2962C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x219A2962CLL);
LABEL_9:
      sub_21909F150();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x219A2962C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21909EB9C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21909EEFC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21909EEFC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21909F114();
  }
  __break(1u);
  return result;
}

_QWORD *sub_21909EC88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25503C820);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21909ECEC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21909EEFC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21909F120();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21909F150();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21909EEFC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21909F0FC();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21909EEFC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21909F12C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x219A29650](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_21909F048()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21909F054()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_21909F060()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21909F06C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21909F078()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21909F084()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21909F090()
{
  return MEMORY[0x24BDC57A8]();
}

uint64_t sub_21909F09C()
{
  return MEMORY[0x24BDC57B0]();
}

uint64_t sub_21909F0A8()
{
  return MEMORY[0x24BDC57B8]();
}

uint64_t sub_21909F0B4()
{
  return MEMORY[0x24BDC57C0]();
}

uint64_t sub_21909F0C0()
{
  return MEMORY[0x24BDC57C8]();
}

uint64_t sub_21909F0CC()
{
  return MEMORY[0x24BDC57D0]();
}

uint64_t sub_21909F0D8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21909F0E4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21909F0F0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21909F0FC()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21909F108()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21909F114()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21909F120()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21909F12C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21909F138()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21909F144()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21909F150()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t AXLogUltronKShot()
{
  return MEMORY[0x24BDFE200]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

